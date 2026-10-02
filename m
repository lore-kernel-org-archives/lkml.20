Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0363C33A014;
	Fri,  2 Oct 2026 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931205; cv=none; b=qcfvh/ha+nyvfH65vQe1Nwd0d1ZXyrZg3k8AxZMfwYWb0pTjGmvS/zBu2GC46uOtIO5Of5GdX/J4uB6Y/Ae6z56irWU/O3vQ9N5TQ/P7lyATJGHC1vTJfYAr8+K9CvLcX3D4YLoP8YGQAFhyZjjsg75Oy2Xfu7W66dSnsCH58a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931205; c=relaxed/simple;
	bh=OUd46eQf7kwOL/iqEFkEDEC8xb9V7EynRj3WeqAslvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s5xGOZNNhq8QkL0SJYcDEfxhKvGfBL8t7K3PKVFcPJbiEVr5izceFD2Qj7mx6KM+SHc0z6sCG7gxyLL+dcZUoUPX4i0KUvqn6zC9IndNbDHJFkMviiu0x8y7VlxIAddSQuoM10CZjvEGQQGA8cJCQsu4cna3DlQr5KYFpXI5HLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBLgsM/3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBLgsM/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695581F000FF;
	Fri,  2 Oct 2026 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790931203;
	bh=b76lmn+AfBToq/B+Bidd3cGscxduq21YgiiOj463Xas=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DBLgsM/3zeV4rGvc/sW/XvcCI79IK89LIgQDxv2Pa+yZHaycy5VUUzbJVK1y1N2i/
	 0xBVm0d19PwdrvsiKJkNV8Ctgbd9stZZQ5mRROxs7StS4Gx2umiygRwrkf6P45X7Me
	 y6upBZFkjioytz5al/Lr9uTl/RpRAA9IzFcC8OhSosCE4w13p/xzYAT2mc76JxCROt
	 jZhnWjiiVfBRi/0/vU0M4oQ46ifZlCXK20iIBr+0qTLc1N2hMounanbxMX5DfZC0By
	 2M/xHuyUsUqd1O995mK03P+R0mo/dZYBDC7+uK3FALirpoyE7m7vFYjI2fA0+MBG4Z
	 IWWljH8q1eEqA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard
 <mripard@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/5] media: v4l2-subdev: Add new ioctl for
 connection status
In-Reply-To: <ar9ZgBPEGxzNTSzU@kekkonen.localdomain>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-2-a45993be17b8@kernel.org>
 <ar9ZgBPEGxzNTSzU@kekkonen.localdomain>
Date: Fri, 02 Oct 2026 10:53:21 +0200
Message-ID: <xhkdb5wzkv5z2.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Sakari,

On Fri, Oct 02, 2026 at 10:13, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> Hi Mattijs,
>
> On Thu, Oct 01, 2026 at 02:55:20PM +0200, Mattijs Korpershoek wrote:
>> The V4L2 framework has historically assumed that every component of the
>> camera pipeline is always present. This is a reasonable assumption for
>> integrated cameras in laptops or phones. However, in automotive systems,
>> cameras (e.g. rear-view or surround-view) can be damaged or
>> disconnected.
>> 
>> When a camera gets disconnected, userspace cannot detect this and thus
>> cannot react (for example, by disabling streaming on a faulty camera).
>> 
>> Add a new v4l2-subdev ioctl (VIDIOC_SUBDEV_G_CONNECTION_STATUS) that
>> drivers can implement to report their connection status.
>> 
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>
> Have you considered using V4L2 controls for this?

I have not considered it.
I think I initially wanted to make this a control but I ended up making
it an ioctl.

From patch 5/5 in this thread, it seems that you believe that a control
is more appropriate. I will look into that for v2.

Thanks for the suggestion!
Mattijs

>
> -- 
> Regards,
>
> Sakari Ailus
