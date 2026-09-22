Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C236DA0D;
	Tue, 22 Sep 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061971; cv=none; b=P7Xlua5tcyRjSHfvcKwNhmllyPhAn1NbxJzolNBJG8AxkxeDchsHgRLVwufVQuPtrGUqCQ/q2jLNfcDusQ4Gu3CDYXCI8lkOK5UuY/rMUsjjtY72A1NeREhrj7TDd0QZomG4ZOfNuQInkGXaDyO2S+FOhs9uFn9IQzGxMd9aghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061971; c=relaxed/simple;
	bh=UJKugOhJmyXZ6ojY37O84NndlKhSfWO9PDlcJ7VPK0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sR5HgiwkHFpsQ22qydxuDNe953VV2j8BryCbc5tPIzz4LAkDMv3/wP1giiggxhfTTh8xQkcUuyXLmSfoIFlpov3CdugISKn80GdlcvCll7pHH+G4k2ZpDzBbZY3rbF+iyn2vlYgDn55zP/ZEPeFVtM2AzCkOiEtV8KPdxhvBxpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXZcaGxg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXZcaGxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD371F000FF;
	Tue, 22 Sep 2026 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061970;
	bh=BpljJpE1b315yujumf4I9jSTrDZ7KqlruhwMFwGQENQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RXZcaGxgFtDUK2pQ7klnorWoy1uX9YBvrE7vt2++fQNO7NMxfSdzel3zMjoDouKJ5
	 j6rsuP78n9/LMf1q2PItkeIZOO9t1g2/wTEAvSH8j+SPHRJompY/PxQelvnUeqBYfb
	 fyMoC0Coe/1rTL6gTdbs+s44MJoh7ajvN/z8DBGS5XbsE7koDf8sg4ViiZJbGJxYUk
	 2RCQNlI3hN24IUY08M11W8M5kvfl/X/urKvOgb3oDeC754oPbFTRtAMqD9aiNCLyYn
	 IlWbMZ+pvK8pu1aNvgOKKBLSTgYqx9OFPr2X9UT5mIZdnacXmQbjnHfby/F7Y0A0zg
	 C0Ea5Ryp3lKuQ==
Date: Tue, 22 Sep 2026 08:26:04 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v19 0/8] Add support for NXP P3H2x4x I3C hub driver
Message-ID: <20260922072604.GD2348773@google.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916070728.1088801-1-lakshay.piplani@nxp.com>

On Wed, 16 Sep 2026, Lakshay Piplani wrote:

> This series adds support for the NXP P3H2x4x family of multi-port I3C
> hub devices, including their on-die regulators and downstream I3C/SMBus
> target ports
> 
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub

Patches 4 & 5 never reached me.

Please submit a new version or [RESEND].

-- 
Lee Jones
