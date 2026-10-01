Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFDC28E0;
	Thu,  1 Oct 2026 02:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821200; cv=none; b=D6+awSQd6o3/1/8JoqRHXNEzSFqUT6ohXh1QBFZGhYpJs5rDgwj0aDNNNSJx/DEPQKmGp3XpMnrkOxl4pWtf0oMBp29wjLEyfEBBAH+ZqIbDqLk1N+OLkw184r8dWhI7FxldzBX/d+NPJFgCQYFAG8b2GCGjUYYpyGp5wUy7U4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821200; c=relaxed/simple;
	bh=tk6oKgmPDt/1pGb0921K59VHg//gBg3qL2SoiXrC3Ds=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=nuNGN9sICjoe7TPugvydARmZiWOV1iB86aN6wrnyVGN4gWSizkOtncnDNNpOGNcFE8GKrsO3TEJw7W+toRENshbs6w3n1TtSehZAdv6MBrcePCrjSRH5Sgm+iE+tBq7pC0HLSsyo4Y7W3DJ0Uhf9zkDyp4LBveJDYrqw+mOPNuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1LI1TQT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1LI1TQT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4FD1F000FF;
	Thu,  1 Oct 2026 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790821199;
	bh=/rs+Tp4zjVX7Co7AEn0x6FV0ggzdyA9TDRMhemxoebw=;
	h=To:Cc:Subject:From:In-Reply-To:References:Date;
	b=V1LI1TQTm+zeG72CYAQr4pGPCxHi3KhpUm2z4DcywS3Ro3pOssDpa3wi+MGoZH9uE
	 HX8D0fUPB4QBQjUqIZxQhXx0+MTxReXRcBzvYxgoT2nhiewV0BPOfal8gFEykoQDJL
	 oZRN3Aaon7LGXyzjZQR3arPqTyHWra3KeFa4UpxqMF/+Hi+KfNzvhGelEZpU6QtGzQ
	 etq1ZIC38Ur2ssB3ckZUNJ5Pn7QL95llJSJ7ywjYdEMIbClkfXCIJ2ZIRjOzsWSATh
	 mLe/9p09BzSi8YeGBrRxIqgYYnOluXzZjCOHu7aT2jJvWyjpaN2c7GnaVAHDu/FhE4
	 maO07OCLH1aFw==
To: Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,  Mark Brown
 <broonie@kernel.org>,  "Martin K. Petersen" <martin.petersen@oracle.com>,
  Chandrakanth Patil <chandrakanth.patil@broadcom.com>,  James Bottomley
 <James.Bottomley@hansenpartnership.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>,  "Martin K. Petersen" <mkp@kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the scsi tree
From: "Martin K. Petersen" <mkp@kernel.org>
In-Reply-To: <CAMFBP8NvykpHj7Dh7TPf-U1f212Av7cppwaS6g-_G4K8ktmr4A@mail.gmail.com>
Message-ID: <yq1eceamacn.fsf@mail.kernel.org>
References: <arp2hp7wRlcK_4D8@sirena.org.uk>
	<CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
	<3fa086ea-2868-4cac-a34b-2389355c31b0@sirena.org.uk>
	<CAMuHMdVZpKLzvmRyJ9=jhnT8OhXtTRsHYOAir4S07mzrEa4mkA@mail.gmail.com>
	<CAMFBP8NvykpHj7Dh7TPf-U1f212Av7cppwaS6g-_G4K8ktmr4A@mail.gmail.com>
Date: Wed, 30 Sep 2026 22:19:57 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Ranjan,

> The fix is to drop the second occurrence and keep the first, since it
> also clears pend_sas_rphy_add/rphy before releasing the reference,
> which the duplicate does not:

Been traveling for a couple of days. I'll fix first thing tomorrow.

-- 
Martin K. Petersen
