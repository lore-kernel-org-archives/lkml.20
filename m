Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687F3446C7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513680; cv=none; b=s7d+KeB1nA85HnZ7YWabi5et+jW/R4fKRHmnniIutWjAxXzvRtp9CNysmtbqsHeq6/5HWrxsFgRANRouuv6lM0mKP/D8xCU0RTu31MyulXGt93VThQGYkSgVVDqANSOVSvzvaro8C5tkl6WYBWJ7I30Lvyz6RQjcicr8rimYGmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513680; c=relaxed/simple;
	bh=3ubcLCcyt8+VvZfAFT0yrgNoMjVrniCRUSXMbUphHPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTvCMU0dwmxH1UMWmFk+G6HhBIXByivlDnWGMGewpQ0L19rM8IMLK9VJ/NxWkGCLO7e7f247zjmBra6OPu0822DNcG6u/8PSZmcFn78gh+qS5PIeRh5zMwVoWhz9faqppoVIiquFdBscIxbieM220goaWyCNWB8WRNsO5Wjw2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnJSGlYg; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnJSGlYg"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3515f9a5d25so2015869eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791513678; x=1792118478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTsktpTllALq6EwdHtFSoFwjaEzOVxy2nJk/AnvaP7c=;
        b=TnJSGlYgGvZ/r5OMmtbIsrqM9moQCvrPxarrTkch5lvSp03bRG2PW8n8YnkQiIFtok
         87El//GIeWkht1VYr+pvUMhPrpxw5+Js463AL6dHdZMuxUannXvg/1leLHN6IbrK8C4q
         mH1bi03XoIpzPwTCZ4zf/Ijo4u6hSRZiMDoqAtUMv+EHOmgaiJbd8YuT24khRPuRWGwq
         YxhumnotMAhpmOa/OE4A20uYK/H23nh0Diu0JkhAGSAZ8AasvWWhxdRMjosnr2VhOtxj
         QwiYm51XYHQ8g420Fn0qtRBVPOHeqRgVkVmPwp0ev6ekS/H5mmvSZVO2stA8jy7qVv7x
         um2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513678; x=1792118478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTsktpTllALq6EwdHtFSoFwjaEzOVxy2nJk/AnvaP7c=;
        b=lngdolFTt5m5e3EPuAoj9zRUux+A0ckanh6zocBpzubqmTmCNFgfMRF8kbdzKMGEvc
         pBfKjYWZfJipb8IEBUpqS+OTmGxURz3v/b2XDHl4tq/oL4bFIpAqA4/B/F/XYQIuEcGu
         LXc3bFFrXZU2DXZbraKytPUtfwYmGeJILFrw5e9Cds3egelQp7RNPkh7sgnrzsTen+Ho
         KiOILRzUxFl5RNYkP8b6rfbgZA9oM1ZSghE/uAaq80UWEtEoYs5a5T7Q3soNTboWpUTo
         viPPNOz3ha6NjKcExzDVfwHm0H0G6UZ5Ju/um2593mzew/3gIIfXl8FSbeDWy5gpWjae
         DbZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFErfC0jTlHnS/DAe/twmD2GsxH3aHKl1ikuHoSYxh8daOzWz+BTVcLGD0LmYqGAr//Hn5RwFsSCvbZQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0R2lgXf+aQV6kQpDNPcLI1Sk0jdBEtpQWdlsKqqYGENfQqWI0
	WXXu/QwxVZmztA3rbN2zPCNN1txB1Fv41FbgU+g2ixaCGIfTi0e4mZnD
X-Gm-Gg: AYBFou1gPXrChbPr5ol6q6KEHlH0RkwqtDCq51Gt72/+SsKEJB9sdF1C78VXEZTOPeI
	4Y2o5RC7Nx83T0l7uic6ycJ0L5HpBRLlLqAC32CWpQiADbssy+b2NvOTMf9Fn1QUHUluwfB9nOL
	kcwFEFPfMoq6LUQkN6ja44WpT1Xiz51aqwxMzIqbMLJNvOLKdgo33fmE3uCmDX8hQFA7MwJYrL0
	EcwNa4Bj5L1l27p3v/Byjnkob35yt+TJXSjqI1+NI3Zj6/daO6wVTfTjAZoPMF7Yn9xTYvxARH7
	EI9VwbZP6479Xf2pWOqk9P+Q3l4yvNflHOSdh8il3n9Ldm3bMPgtzhsdDNldNpCXFcdSfLStae2
	LvK4nyEHZVkhWuJ0/Qy48z4DC9cPnwwPPRtQYZQwPj68fNpltCJms67rpy11XL55UXOz3HgpVyN
	X07Or3z9zoQ0TxqHklWAYVRxlPaCYVGyV3SzpyvkeH7lLQ2rJ7cHCBK1YosgXHcq+3+lMPDaZ20
	fJ+mYho
X-Received: by 2002:a05:7300:ce94:b0:351:6b27:d67d with SMTP id 5a478bee46e88-3537e04925fmr988070eec.30.1791513677882;
        Thu, 08 Oct 2026 19:41:17 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cad9e53sm2343328eec.22.2026.10.08.19.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:41:17 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: helgaas@kernel.org
Cc: bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	alifm@linux.ibm.com,
	andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [PATCH v2 2/3] PCI/PM: Do not save the config space of an inaccessible device
Date: Thu,  8 Oct 2026 23:41:04 -0300
Message-ID: <20261009024104.14995-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008225825.GA936610@bhelgaas>
References: <20261008225825.GA936610@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Thanks for the review, and for suggesting a simpler way to do this.

On Thu, Oct 08, 2026 at 05:58:25PM -0500, Bjorn Helgaas wrote:
> Apparently this is a reproducible issue on MacBookPro14,3.  That makes
> me a little hesitant because we're not actually dealing with the fact
> that the Thunderbolt controller isn't responsive during suspend.
>
> It seems worthwhile to me to skip pci_save_state() if the device isn't
> accessible, but I don't think it's a real solution to whatever is
> going on with Thunderbolt, and I don't think we should mention it here
> as though it is.

You're right that this patch doesn't fix the Thunderbolt problem
itself; that is what the Alpine Ridge quirk is for.  This patch only
makes sure that, when a device stops responding, the PCI core doesn't
save garbage and write it back later.  I'll rewrite the commit message
in v3 to say just that, and mention the MacBook only as the machine
where I found it.

> Maybe we should remove the check in pci_dev_save_and_disable() and
> make it check the return value of pci_save_state()?  I don't think
> checking twice adds anything.

Yes, I'll change it that way in v3.  While looking at it I found one
small corner case worth mentioning: pci_save_state() can also fail when
the kernel couldn't allocate memory for part of the saved state, back
when the device was first found.  The device itself works fine then,
but with this change the reset would no longer disable it first.  It is
very unlikely to happen, so I don't think it matters much, but if you
prefer, I can make the reset stop only when the device isn't
responding.

> I bet we get 99% of the usefulness here by just adding the first
> accessibility check above.
>
> This second check only helps if the device becomes inaccessible during
> the tiny window while we're saving its state, and I'm not sure that
> the extra complexity here and being able to restore a valid config
> header with junk in the capabilities is really a benefit.

I'll drop it in v3, so pci_save_state() goes back to what it was, plus
the one check at the start.

I also wanted to see how your version behaves before sending it, so I
built it and tested it on the MacBook today.  It went through four
suspend/resume cycles, three of them with a USB disk attached, with no
warnings, and it skipped the controller that wasn't responding, just
like v2 did.  I also reset a USB controller by hand to try the
pci_dev_save_and_disable() change, and that worked as before too.

Thanks again,
Francisco
