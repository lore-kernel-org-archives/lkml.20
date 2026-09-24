Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F9C23BF9F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212049; cv=none; b=DKAydXqYkvWSD+TtudhmzoOWfo3SYelZ8TYSNPxFFn7dPOtHBeXgCaoTana0RRzIpQpmL+In/GhPyeeVNIFg6RH/5Wk7bX/eBSniDOl4ZQFtk6vmxYGYhKpTjWA7Dw3G4Wsvg5tjPXvBnHbUePtPZnqD/O9AEEk8Rz8cjnCDXLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212049; c=relaxed/simple;
	bh=Zhh+tyaZj3brpP15DpAtDUqbZDPz63ArdQk46EihraU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvbGY2GPRuF83JAyHSc5suKqvZpkgD6DUi09GpIYDwpU3fxuYV7HB7UR6n1QxvoFhHs7vdBhFiLZNB+KaPJVYyinLCuajjRnIBIC7j3dgy76dwtzyeTFuEqLPsNIHS7OXkF/xa9CIJGqafdqm7YDHhefxFrxyXz9TCvZA4ne3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g79BUQG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g79BUQG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38731F000FF;
	Thu, 24 Sep 2026 01:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790212048;
	bh=2POCr3NwEttl/9fkb+zZmDv/CNUldjtg2tQBcLAHUzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g79BUQG6tYtkRLhfNqdDYqYg0c7jIOSb6q6+yg+PPVd7SkIKY6vFpKFy/LxZKXur6
	 KA2DV0CxbyAF95S0B8biRjU6w8cTy0Hzk8y4UiIWD57969y5Z6Izcg2W8ltEVEiE2V
	 5uZhqq98NacsbsMuRPObsdYklJhtGyg87kZCYk7jD9Dt3Y9+n5FiOYDjnj7pqVrSm8
	 /xDRZ2EkYZW9F/krgtKhJ6F7ikgeD5nbDN9d2rStpDwLNBvRrhYaoWfKXhdnIbcvOD
	 +QRFQl4uk0XJgpA6nYjEMXz31E5CzQoywC0S5xLDePCHPSAaCAQWSM8avHq1Px9C+Y
	 CP8k+2RcfRDWg==
Date: Wed, 23 Sep 2026 19:07:26 -0600
From: Keith Busch <kbusch@kernel.org>
To: Krishna Iyer <kiyer@crusoe.ai>
Cc: hare@suse.de, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com, sjpark@crusoe.ai, saravanand@crusoe.ai
Subject: Re: [PATCH v3] nvme-multipath: add fail_if_no_path sysfs attribute
Message-ID: <arR3zlpx3Xm2mRt-@kbusch-mbp>
References: <20260923004959.88440-1-kiyer@crusoe.ai>
 <arRJLL4ki-sVQnHf@kbusch-mbp>
 <20260923225753.49224-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923225753.49224-1-kiyer@crusoe.ai>

On Wed, Sep 23, 2026 at 03:57:53PM -0700, Krishna Iyer wrote:
> On 9/23/26 2:48 PM, Keith Busch wrote:
> > I agree with Hannes that we shouldn't need a new flag for this. The
> > current behavior is just broken in a few ways.
> >
> > We just need to restrict queue_if_no_path to only if there really are no
> > paths so that we actually respect the failfast_tmo.
> >
> > And the ANA inaccessible and persistent-loss handling you introduced
> > here should just be the default without requiring a flag. But I think
> > you need to add a requeue_list kick in nvme_update_ns_ana_state() too in
> > case the ANA transition leaves the namespace inaccessible.
> 
> Agreed those are real problems, but fixing them still leaves no way
> to cover this case. Subsystems commonly expose many volumes as
> namespaces behind the same controllers, and failfast is controller
> scoped and time based: a timeout fails every namespace or none, and
> the trigger here is an event, not a duration one can pick up front,
> while sibling namespaces should keep queueing and ride out the
> outage. delayed_removal_secs does not apply either: it only governs
> the window after the last path is removed (here the controllers still
> exist and keep reconnecting), and its expiry removes the head disk,
> where this case needs the opposite, fail the parked I/O and keep the
> device. fail_if_no_path stays the only namespace scoped way to
> release parked I/O.

I get that failfast is at the controller scope, but that seems okay:
when the transport is down, every namespace behind that controller is
equally without a path. When the controller is live, the per-namespace
inaccessible case is handled separately by the ANA state, so namespace
heads that lose access bail and the rest can carry on.

Is your intention to have some namespaces wait for reconnect longer than
others?
