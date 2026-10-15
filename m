Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E235536E470
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030044; cv=pass; b=oeTcPXuj05F4ZgR+6dhTqmUOvDMLqbgxZOiQv4hhxF7LRm40pmyGJ9Xe23VDneLxlBsRL4mJ71ex8Oc2oR2Jne1UdFnnfyw6lDe/8yQGOXPE++xLGOxw8uAxOXoxIsMy6/5w1fdnqO5Yrdp1VgQynTY5g6e/rHK8rxQzNYsRZKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030044; c=relaxed/simple;
	bh=CXQAMWX0QRbdOSiR3jJbffzmyMnknbdlIF+pRtGFT7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8nCwHtqHPRMdlti5Oogsey4jGc2fz7CN+/AKNyRZ+X8IYUX0iCCM7jxIcXik/CGxc+5dvDAgKQMEbQBb8gYNmYi0I6ngsPjmMPBMNeOiVxvzglWCThptRrp493CuiGKynKWBnsxY5ZaSv2OwKoSYFNbsG22X2wM1nQXCtXGqL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErsiLN9B; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErsiLN9B"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6798eb0d13fso887884d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792030042; cv=none;
        d=google.com; s=arc-20260327;
        b=eX1/yzRgQIePOp7760/9SMcC3QtYGpD8H8aQ6Mfa9AUtC1w+ttqPbfzstw3Ynypil9
         b1Pndv+VeL5ohWOTbGZfMvUJ7wAIEC+r42mk38FgDGnzVPrboVCGZEKv3ZM6v7nxWKbB
         7ZDdNzEuBvttoyWZpuB4DUVsilmWoZ+yEqryXE0koDWL5GbsGx0OdlGtBfnS7wrj07VU
         FXGaRWPDzwWOC052IFnamllFl8jdXEbjwhBUWTKfeWOwOZmRT1RLI/Cwe5ulltf3eNp4
         5xa6lueFSJdBXA6BH446q7kl2PcEzVln4CMn3BGPm4pn9lL4wM24A5KIkAM1TOM2o5d+
         dPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CXQAMWX0QRbdOSiR3jJbffzmyMnknbdlIF+pRtGFT7M=;
        fh=HIYPM114fgrZnHiVkZHtiGMuMnSbKKcsPttl+lw2BCs=;
        b=E0MWlmCJr4gH2c1iDT49Ws7vooLP/gOWSXZsG21sYeHCR6z2GWvdMYLFxS+oaJYCzK
         BJ6Ar/F6FVwrxfb7iVcpp2MHgl4GemPEh56lgFvplZlEAOXJTvuHvwlSKEVCAsUiM92F
         1UIwnOO7ilIazrW+iZ7FtVnJjmuLHw2IHDNVNTlHrU7nE97TocduQ3TIbd8AqbZ29zw1
         Cj+uP2xVKlR8CYvPDcF1D75mf7+7TAgzt/x+u/2R5tzir05yPVIgb2tkIKpcWnGNX8Mi
         K3155Oy64HRne9ZzCLBD234LeQ6pBsVpQoGSNA1BYB2zVAp16H2qqnoQ0nZ3Yy/wYSEX
         fdgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792030041; x=1792634841; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXQAMWX0QRbdOSiR3jJbffzmyMnknbdlIF+pRtGFT7M=;
        b=ErsiLN9Bulv9J+OTch2mx/Mopv1D4jB3ITplnFpMM/nCs+/rDsCvgGThoxdVuhzbSu
         7pBMBeqvDc2ny3E+20NxUXWhXygmnrlfs39ai+8BhfBeuqVXpeRWAqkWjL6WSPxC3NDG
         XtSib/RPeMNXD5dY52ilgllprWg8221qUWdojMHqYc8ri9fQXVHxVZKl83vN/L5YE3gw
         wQcXPI6UGjH2gyyMXeagbto+YznsCt0UoxIMpkQHotpr1nqbEPuW/Cq6fybyWzus7gmS
         dnjl5nK8u6V18dCZoa8+ThRKTdjPsHTUuJ33BugV/880BlUZyy0dsSM1ZRyK1p83jLCI
         AtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792030042; x=1792634842;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CXQAMWX0QRbdOSiR3jJbffzmyMnknbdlIF+pRtGFT7M=;
        b=FGJz7u4N3nCCRDASQu9/oDbPLA+EDZ7CYxdFzqiSkfJa67YijKYZya/QBjBH5A6G0X
         dz/UwokqeoJuncH8qgh2a442Xmb1cMkW5RP72Z4xe1QesKL9X2u0xWxJfmz2pY31Sh4y
         XE/qT0bNrTDcfOKNAE7f3uuYk9nCx5CkCLSY1avLHskPpwG2Lo5GwtAXTXWyfg//jTOW
         3w7ElvK5mCmfIccXeIqNBPMkp9Z8vlHztQEjQUYSgseIXja8NsmNgD7aZiwdA1ptWvHe
         WACifYAXBGHHniOK7kHfjj1Bmi6ja7GtriLfVnXmfg3MCgfXpgh6kxYX1yASTFMUAsUV
         C54Q==
X-Forwarded-Encrypted: i=1; AKwUvBz22QlOHpicnqjGpWtNlo+Em+Hs3YXka7fbTOy1d1JKrUcWeLNf/vhLDXEus6dTyN0WU7Q/vWJni+skP8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkVzlguSj/7CHJPBcgcu3sAsNKdSSyWhpC2nCiFxy1p5NgDVsm
	tVwYOikjXTF37Wv+rlZlQZPHeG5069l9gGb7SUDCFioKL0JKKZTSg4W6LYuF22cUL9a3CzOKhyR
	OSVDCQepZC7dgh8LgxJIPOsEstA7cSAw=
X-Gm-Gg: AYBFou11BD4hpgUJdcB/wlbuVMcuIj7He7w4l2kRZCIythhU7MPVyBLPf9vhqFHPSj2
	fYCb4B08AkTp+VSfh0QMOxUR2gPZWtIt4PHPPlEuREBZop7NQUGf4RGkbzUSMZVeWTLoVELlrUF
	OPCHa/Yx5Io0LAGxjWQzWm0Bdo0Qas6LenmA3vQaWIlc9mwLI3oMazayXm/+5MkVILdZLRuJMOb
	d5rCl82DZBslRu9L4SB2FKpvPVl6qJ1o5WB1QuKnVepIjzsdWIOpcYg/5Lzm8Ph4XFUI4UZeLss
	nrxp2Y2+UmuIJbc3Mm7qXCHsktRWTthPjlPFPVcLSq18g1Kiferiy3Xbsw==
X-Received: by 2002:a05:690e:1919:b0:679:a216:7aae with SMTP id
 956f58d0204a3-679a216868amr136128d50.111.1792030041425; Wed, 14 Oct 2026
 19:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com> <87zewgcuhy.wl-tiwai@suse.de>
In-Reply-To: <87zewgcuhy.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 15 Oct 2026 10:07:10 +0800
X-Gm-Features: AclHuK9kqyyn1aG_r1s3nEALXTmMSfRWju5AR6v9v-P5eTvEZQB3uiI8X8Hz4NI
Message-ID: <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cezary.rojewski@intel.com, cassiogabrielcontato@gmail.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, sammiee5311@gmail.com, 
	kees@kernel.org, thomas.weissschuh@linutronix.de, tglx@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> Applied to for-next branch now.
>
> A problem with racy link removal Sashiko suggested is an interesting
> case to be revisited, but it's no regression and can be triggered
> independently from this change.
>
>
> Takashi

I saw that. The drain/unlink case looks like a real concurrency issue.
I'll try to
address it with a separate patch.

Best regards,
Cen Zhang
