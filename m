Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794685463;
	b=Dc+koWNSa5WSezW+rVuT5HwJYnZ6VA73nnt3idw/1xftmuhiX2jErB7kafLfxRvYaZwu
	 wKySZnj8KBvcmM6zTWWHUAhx5c5zw0kO/kNheREmZE9rEMyKK/KSH7Nc38LPOsCdLN9zK
	 LOfjXRS7DgQaiLJzTdp9MKkrxbTcjkUOcCe2laFiGqBNH9fnCTw0rOehSuREVVG3l4bM6
	 0RNcLR2PGRi6mql9XHD9Qx8QiVrubYmLEVYS8lqBq0Jvb7gFsyLs5eHDmAalE80i7E41l
	 AZc6M/81I3Fcmx6b43ZBccjlXe/GigbxWK1++C//HMjsJrKQk6TgdqEsLfncqf6dgJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794685463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h9VL5KrwzPhSg0iJg4Cv/rdFJ/18NEQqKiVSmX7CbcY=;
	b=EMtmGGlJY15qX34Kx1jI85EwAMHNMh1zkicKQ9iX2MgMCAfeuD4njI6wtoZHW/sxf67J
	 ccJgUc5qxnKTeexwlexmPf1ySDWy1zlf4P1isA9Eyd3/ZiX+nWVEQF1KeW93QdqCeoNT3
	 xtOUb5TKin2Pmz2xc9kOEdefZTvEEDgckCnnUtWEJrnEDQmHmnn17+aqMOTKGZuBFtw6Q
	 YDGlyGj5ugPkMmrqGT9LV797cAcNCeFmAEQcgPZVYPTF7YJillhe/IDzuI/N9AspLLECI
	 eaGZLT5HByL9Ote+oZE0bdvkYqHbg5k8LZXjfJDiqVNTpN/KNBYZ4cORGIiFnuEOI6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ZEfGR0GQ;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361B606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E361B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ZEfGR0GQ
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55c48582654so9887671cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794685462; x=1795290262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h9VL5KrwzPhSg0iJg4Cv/rdFJ/18NEQqKiVSmX7CbcY=;
        b=ZEfGR0GQRiPFSZ3orAqAuDTwVesgu70z9ulUL6L3SgMWFagTm3h3qizvETjDO8yNRt
         SWjlr3SV4PRTHfX744xltDpOv90BidUSkZmsmUk0QDDsRYfTtVEuRXUH1cdI/BdY2RPV
         iavgZsVQauWzy8qS9RNWOOTbUd5MeMMOCm5beRHbyXplae5Y3yTziLW7a7FrPwj8jBWQ
         teuLOzccbTB2TbXQY9Nc/FjuJXn8bQ0bzAgnePpbg/DDp7499/4lQ9gLoHR+Ndzxb0yJ
         kmsObY1QGoLH0+ulLETu7VkEFNIEDGT2gnYVK5dz0tyxlWHoozV+wzXdZ3FS1YM1P0VR
         504Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685462; x=1795290262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9VL5KrwzPhSg0iJg4Cv/rdFJ/18NEQqKiVSmX7CbcY=;
        b=r0hCaeuji99Cl1oP9dfts12lBWylemuBN4nfX1xV7YpIdl8qRZyRSrDlAPbgHXUrS3
         CTrGUbeoEoj8DXw1NFIR0jqkSktPzay7O0vX8MX/pGvLwoKZS+ju9KbwGJuZk/jhH/Ge
         As0szAWGBCV1O+r4yCh1VeQTP44uqm87HLBK9+VfpcrS7s1EV+2cgVQp2vifE91MiWKG
         FIjn/xo6gYXn5tLOztRGPsq8CLTw00sFkfUCnwhBrzZP235/YZYe2l26Ox+uAkcc8WD7
         gT7EOQu/PY/GWOmacNf/EFnUHjd4hyE8GBzbU0Qkj/50YYGFTAPOiVmA+Y6Ksw8WpLSh
         +OVw==
X-Forwarded-Encrypted: i=1; AL+hErEuYcBrW47ifEdt1N7Eg0fgeEKchdl03GqypRZBiV0cloEnm6WZfiuHS3MAwfvBIXvUqOcNZZionK0XZ8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UbJ/2/uxETcON2NVZ+PvZ7FVYhAyEbjfLOOvX0nB9xEoSuxqx
	T+fwIkblzyG2fs/ytxVvfR5/3MFdwzoMu1yxKPj1QFm59AF+5tUJ5b8zQ1NDTzspb+QejEcQFMj
	VK4U=
X-Gm-Gg: AYBFou1L0Pf4xs1JkWSx/WmtFUv3k7cKnzdjLyrfjo8Y4NEFxp2bnT/y6cAk9cvix5R
	NinY1P/n5tgOt6PPiJxpU33Ji+pjJAaTb4To/DcnIGZV4KhVSiJOhuNtk/cwkZihtutqM4Wz3bl
	qdTkrNcc5QpDvKxIogK+7jBtKYOFmtqeOJTqxo6b8DZfZUdM8HnYOs7jiJuE1xH7HMsA6DlvIBJ
	BarvAlrbeO56aQ8fIVTFwQscX65UTlf3IFUJ22JPXCSxS7gTzyrl3TyOQrC4lNxrQJn2ZQ+WIuv
	Tc1mnWCDLFpDp704kgM78j49H3PKKCSivYBsPCzzw7xEvXCo4+9t0MDeocTi2/dk+ScW/hOV2l8
	pF04h3jr6Bu07q/6RXDygfj0cs4NBhHDdJz3keYKtIQnjFAnG08+2xESkkjHyrGuelC1Y5zMxcX
	h1Zl4IPcUeagHfia+jzVNnymmlD5bEAE5CTMq+cJXci/Y5Oogfh7PyG36M4cGZNzCtwEyk87k8w
	4tjDrtIErj92Z2Vifw7NgiEARmpBccwTEWBkhYFyx2eu3NvxJ6tDVFSPaR9CsDibSqUF64ezMVu
	jggmmaAgDQoCkhJ1M+10ZzeGK8hso2WsZ+PN1ZwVRHYn8YR+018=
X-Received: by 2002:ac8:5749:0:b0:535:232f:ca25 with SMTP id d75a77b69052e-55ac42874e7mr99366071cf.7.1794685461645;
        Sat, 14 Nov 2026 11:44:21 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73206sm49412876d6.25.2026.11.14.11.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:44:21 -0800 (PST)
Date: Sat, 14 Nov 2026 14:44:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: skip companion handoff when no companion
 exists
Message-ID: <d6afff30-2183-4269-8cfc-7992cfe5c884@rowland.harvard.edu>
References: <20261114051653.1353346-1-william@wkennington.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114051653.1353346-1-william@wkennington.com>

On Sat, Nov 14, 2026 at 05:16:53AM +0000, William A. Kennington III wrote:
> EHCI controllers without an integrated root-hub transaction translator
> unconditionally set PORT_OWNER whenever a root port sees low-speed line
> state before reset, finishes reset without enabling High-Speed mode, or
> is relinquished by usbcore after enumeration fails. When no companion
> controller is present or enabled, setting PORT_OWNER routes the port
> away from EHCI to a nonexistent or disabled controller. A single missed
> High-Speed chirp or transient D+/D- bounce during reset then strands
> downstream USB 2.0 hubs until EHCI is rebound, and connecting a USB 1.1
> device leaves the port dead to later USB 2.0 devices.
> 
> Check during ehci_setup() whether HCSPARAMS reports zero companions
> (HCS_N_CC == 0), both CONFIG_USB_OHCI_HCD and CONFIG_USB_UHCI_HCD are
> disabled in Kconfig (such as in aspeed_g4_defconfig,
> aspeed_g5_defconfig, and BMC builds without UHCI or OHCI), or a Device
> Tree companion phandle points to a disabled node. Runtime companion
> binding is intentionally not checked at setup time so modular or
> later-probing companion drivers still receive handoffs.
> 
> When no companion is available, set ehci->no_companion to skip
> PORT_OWNER handoffs and omit the companion sysfs attribute, matching
> the integrated-TT path so usbcore keeps port ownership on EHCI. USB 1.1
> full- and low-speed devices still cannot enumerate without an
> integrated TT or companion controller and will fail usbcore's normal
> reset retries instead of triggering a PORT_OWNER handoff.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
