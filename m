Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB253D9557
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700341; cv=none; b=RaQyHzS7bFeVSyUCqpOiBKPE5mZiqLd4rZtS7NyFcg0VLPr42Wqw1IWGRNYmKw/4TnuzIoa/z4TipNb+Rxo2W7aVjBfKKwxXL7dYsbH3ceSa96NY5DRnlSUurh53SbaPG+6stn+RYkcvOmhpkpXp6PtYICdlC/vOY/nbxL/g5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700341; c=relaxed/simple;
	bh=+1EKumLLM0yydrlYEykW9gU3C+PSS2ko0hjEWumo2ps=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i/+gIvseqi8SugZ26lIl/AuwBAA4CdWmXe15+pjRSGCWP0h7qJRqpEUELOv3eaVKvV37LzitbSBBVq/gsQ0zI6emP4U1haejajh9EkI8Ya1ao7KNU9C83w6bvuxjvlsEDfrlbkbCXPBCbKJ2lovSobA5YAk7lSMvwyk5xvU6svA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPEDi0fm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPEDi0fm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so7291955e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700339; x=1792305139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHnv3RyK6B3mY8+dpKdxgwL8T80d95Zy3h96qwK+OUY=;
        b=lPEDi0fmBg4tcRhhpmmP2WyFme9JwgkjoXg+UZTrtNtagxW6PqJrf+qEr23Jk3dJU+
         mGWY4OCXVOfVenjEDZ+Vl4ioCxeNEoFUtR1jTFeRdHS4z9SIkI1vVSe3R/ScOQm+fWVG
         gQbvFg+jmN7YdDzncNxU3d/ILkVyfDnVTi8hurOdHgqWfny+89DPVdoecFsK5EMB7Nb1
         GzzOKVwDB/hun7qlIw1bu+UOSpuIo7IHwZug0d39P2AR8BO+hxOa/9cvqZFdubpspDgB
         BxVmnk8iYvGxqmPDd0D7lUJYODUDF6VOZLql0ukGyrZfAWLqXVmpszHzuJJ8+qB96Z94
         NL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700339; x=1792305139;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHnv3RyK6B3mY8+dpKdxgwL8T80d95Zy3h96qwK+OUY=;
        b=O1bJGr0QpP2/R2toPPaznx3R6+MR2LQlD1TpK/1jqhE8iP/I667RyCzjPBGQRMTU7G
         LlqIVyvYkZzIjXZgU5SLDys5rEakIY8F1aMNq62+Qb7vpefZt+6UUMVqn2wiiNlgogRu
         c1E2hiAfNVTZW4Bds2STmajKXpDHG1lB3xIBMGvKEuV3XGv+ZgxjqlqDxwqR3j1GRxzi
         q6ERXxdSJCaocwjcBE1HT7vjYZmzz8+PNIPHCs5/wu/ePmC5BZl/gsXvYI8uQfGqeHRo
         kO5FUGOPpJFc0+1GEOPi65p/CwqL+nbWLNnm1iha3L5BMRcW1t3S33KKkyQ1+kYGDa3w
         v6Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxzKN2gia5cmCzicTGy2dy1Rm1amwCfpNq0vGD/1a1vz57YRwoTsY36zf2BxS9gQV2/6YKIK30G8L2msNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmkerlB+R0w8xpzn6aQjj9QQZ118ADiJQXxJGUZB100guHqCs5
	g6W72snWTnuMqKF61DWT1yvR7xP1BjJWu8obApBrcty8Wi2y1bg+FuiX
X-Gm-Gg: AYBFou1AusP9TjCyC6aM44c354XLzAPlcksvs/kc74r0h+l/d93LVMEUaSO+9laLtlb
	2Yc+5T2M3dAHtUc9S4lMqpxh4657DFENJev0MAWvLi/E4VH0t8okBQ9BMwINnlCyOjz7GcBzCRm
	ARCsW5CFE2gj3IlQUf2CML1bCrBucLhsdOJnbco2IY/3BtlTqopDXoA7svHMTrRE1sMSmz9Axv2
	a5KfQp5ko25d8F07aYZWLslXtzpdNfBghRmUZtnKHXC1VQ6HNcJpzM2mS6tjOp4BGHPfUXm6OFh
	rOMz8wsX8z9Ux4u2R1eiybTa2+++Lv6RFBILOQpzFxP6rz9sY/5vHsheQd8Ewz04VIqBcPmVovM
	THKTFoCKqgxOgoSvxaszqEQ3cz3RMRETFj0e1PPYo6R4vDHQR/QRLFbOKpBGBIAAb0WONMzyQQa
	IJeJr6oVywsjm1+/MsjvnE6fFQU5MuHebXoDizyu9UvvpmZfj+MgqsPsqSaawgN3faTqcBsdV4Q
	mSAjdIepQ==
X-Received: by 2002:a05:600c:3f0c:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a18e44691emr129270315e9.2.1791700338567;
        Sat, 10 Oct 2026 23:32:18 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a197c465b4sm58340845e9.3.2026.10.10.23.32.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 10 Oct 2026 23:32:18 -0700 (PDT)
Date: Sun, 11 Oct 2026 08:32:13 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 bhelgaas@google.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Babu Moger
 <babu.moger@oracle.com>, Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v3] usb: xhci-pci: Add TUSB73x0 definitions
Message-ID: <20261011083213.1486acaa.michal.pecio@gmail.com>
In-Reply-To: <20261009125154.266435-1-festevam@gmail.com>
References: <20261009125154.266435-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Oct 2026 09:51:54 -0300, Fabio Estevam wrote:
> Instead of hard-coding the TUSB73X0 PCI ID, USB_CTRL register address
> and the PWRON_POLARITY, introduce definitions for them to make the code
> easier to read.
> 
> No functional change.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v2:
> - Move the TUSB73x0 PCI device ID to the shared PCI ID header and use it
>   in pci-quirks.c too, as suggested by Sashiko.
> 
> Changes since v1:
> - None. Only sent it as a standalone patch instead of part
>   of a series.
> 
>  drivers/usb/host/pci-quirks.c | 3 ++-
>  drivers/usb/host/xhci-pci.c   | 9 +++++++--
>  include/linux/pci_ids.h       | 1 +
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> index ba158d63bb8b..f670e7aab984 100644
> --- a/drivers/usb/host/pci-quirks.c
> +++ b/drivers/usb/host/pci-quirks.c
> @@ -1189,7 +1189,8 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
>  	val = readl(base + ext_cap_offset);
>  
>  	/* Auto handoff never worked for these devices. Force it and continue */
> -	if ((pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241) ||
> +	if ((pdev->vendor == PCI_VENDOR_ID_TI &&
> +	     pdev->device == PCI_DEVICE_ID_TI_TUSB73X0) ||

You mentioned working with TUSB7340 before. Was there any board
firmware involved which made use of this chip before the OS?

I'm looking for someone who can tell whether this line should be
touched at all or deleted. It was added by c289d0eff3d5a, which
is very suspicious - it mentions "cards" (like in "PCIe expansion
cards") and adds two IDs in one go. I feel it could be a BIOS bug
affecting all cards and no problem with those chips.

[Adding the author in case he remembers what happened there.]

For example, can a PCIe card raise SMI interrupts? AFAIK it can't.
But if a BIOS thinks otherwise, and enables "SMI on OS ownership
request", it will never learn about our request, so the handoff
times out and falls into the "forced" branch. Or the BIOS may not
rely on this but poll the card, and then "forget" about polling.

Regards,
Michal
