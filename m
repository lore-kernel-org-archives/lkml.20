Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804369;
	b=OIgzRENM6kLGBqPmAyu5/8an/G7QPcv6BkTh7VBGa34Ui8n8CMkxtQUhsXNXMJJ+pH/d
	 S8+bOBrF9Eu6yGF7R+Wt3e0ogSH9h3NcRndsz/4IftrXHIny5zLKMG0RngzJ/kXZEbfLM
	 S7HIpaEhJDtr2XwYSUMP4eWr4H+yjoCZDrFvj829dn3g85jnWk67/it4CQd2njOfgMgxk
	 AcJ7lTG/DkPhX2+wt/azE6eyBY/+UN3+GJB2jTBeJfe2twoutKzi5EA1gALcCtn4gjueG
	 lk2XjqwdiDFLkFqivuE1WXf9Q2BI+zLamIIp68lrJkt617uIcWeqvYtL3icBvVPtPfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3/ZyrLpO2YrBePg65ZDHqsYDsU9Sy6HHpGp70pYUFOk=;
	b=miPBdOFluGYoinT9kr/S4iL+pOnbO/tp5pY7UZqPCbtjiOdY7kkDgklg72I1Giszriv5
	 QZxwk0Gqxgt7B5O5AqyfkA+8R5UYt+zbchGN5PZtBiM79Pt1H6skLLOzPJR67x9fLjKTz
	 bTP74RSTIduh7wubC86h3R6roiyTuIILCP9yDb4jLJm9Ur6Ma73TtBUygZy9fGT4G30Rc
	 BH648sM8ZlJ+gGE/Ymj7zhuAgBg/9mKCJukaLgKz/+ZzzAwXSDPiRZbKRbtkZ2VKC3vAl
	 SR2wcz+Ehbz2x2cm/ZPDeyeZ+n0ijnbKfe846q/W5n+m8cn3kUt/0E9Q6A7ePG6vs8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=lEq8b60o;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB12606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB12606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=lEq8b60o
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53669f7b518so7777121cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793804368; x=1794409168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/ZyrLpO2YrBePg65ZDHqsYDsU9Sy6HHpGp70pYUFOk=;
        b=lEq8b60ocutpLxRGePnCFzYel0RtNnge+x8ga4YH7qzBAawsSbf88qMkorjv7NBzeW
         pEawZmqa/qmeDH7WxV2HXn0YhTnMFIY3eJm7S8V1UWvTa9oIa1c0ovKxQ7oeIFogcZj5
         rE7ALhD9m83r1G0NIoGoX0dUSQUNEVFIqovuKzcgH5cTOHKJF+pvd6yGC2vLCnsmdnLE
         QUp4ushRr4OWRo4VLYhOUqy3o/laCUqBlxavtqowtU6VJJnj5uK6QvWQD9DQHjRgPzXA
         dBzT3IB8Db55QZZ1nG1myJ8TaJps7VBk49kGMlUmtrLsWWTKM6sXllY4fDfu+vOcebG4
         jdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804368; x=1794409168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/ZyrLpO2YrBePg65ZDHqsYDsU9Sy6HHpGp70pYUFOk=;
        b=NmAsyq06ogu+wilr1GV3CLieLze+Vq/ulNDg6+TgLH2VOKW2TIQ2iAV3zWdhufO22F
         LqVoDtSfbY2CVRICL6E8M+dr4Tfalhv7PxKUPe8gYDLYGUFJRVDRwoTuVwLVetD8LYEJ
         r2p/u74W5HgS+CrG6PgUYjST6Nv0YNE1aUj6R5XgbgMmxbtxEmmgzRZGnCCUEMnFyrTt
         XAPg3o4wFBrjpmgjEOFuBxU/eF2e3zu2wNWkS4wfnGM4kv1Q6QxFEY7uvTDX1/tv13PM
         PJ7/Oq2CbTNAh/9AcUSYNNMckQx8aGc+R2bDbyMhXUzR+yrKdac81JeiuNP0FXCk4X8i
         FoxA==
X-Forwarded-Encrypted: i=1; AKwUvBwdj7702I9CDdqBpFDzlFz4wN+T5S7ick02VdEQkeTDDxC60qadcNvO0+pSt7cr94XBBEuCdg0Adsyczrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z84yoJD0pIbETSyt6x4jH10ixR14iRRCRw0VtK+mOwHXE+X0j2J
	txXrd3iqt5hSFipHLu2ZOx1xJPZT1d9bKemwvYFaim5jzVvfUzwVEH63LDS5rfyuLw==
X-Gm-Gg: AYBFou04okeW2QqDmrprjaW/+rV/bAfhZxN2y9KL/VRw8wjNOCJz+yD+armDnU2m3KH
	jSjXkkzTjdr2cX5B13Adu3qR0t/DdcmXM7NgyCrd8WOPehIP1wJnCzSBYqgGzjK7oBecy78Q3FJ
	4DkwapTO34xfJwuLH9GrB6ctRFNC63fnT6OuRh4eYMR4ojBJYbV0gY5m+bmKEo+ZqAO86DsoiAq
	PpLWfO79mpyVo1eqgcdheLrfT/2FDDlS9cN3++sUUWyQ9g56EnlL4gj0WYdAS3ctdO33BHDSjMN
	HHjhfXpTdbdf3QUmUkulsieBFtK65SwD868eskJYWpSyUZMtNquW6rsI+CZBxSCdWbDRSYRLG4e
	GF+1zUByPB0o2asgxgd9GEhC3JWHfBBzUFGFBuCz5xWVLeW7EHcwkjRwfmOxrcU0C44Tvv3okzp
	81Qqy+Mzc7vI+R1aG7Hog52c5kmWGrbsfo0OjXaIBjfUwfaRgAByTdkBm6NvrYNYgZzKJ+AnSBH
	wA16WP+SoxS20jbU30HrmFfcLl9ot+R+xFfMjK4x4ONd8HVSvmYgEQWcvdf4Ftup2gCBHEqyyxy
	BfhTY2IzCpFF927M89iM6zhoA0Id4Q==
X-Received: by 2002:a05:622a:54f:b0:536:35e1:b5 with SMTP id d75a77b69052e-542b405b141mr275442201cf.1.1793804367929;
        Wed, 04 Nov 2026 06:59:27 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10c48591sm25768241cf.18.2026.11.04.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:59:27 -0800 (PST)
Date: Wed, 4 Nov 2026 09:59:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Pengfei Lv <lvpengfei20@huawei.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	xuhaiyang5@hisilicon.com, xuetao09@huawei.com, caiyadong@huawei.com,
	suzhuangluan@hisilicon.com
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <b9ac3c8f-7ce5-43d1-bcf1-d2ce9877d914@rowland.harvard.edu>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
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
In-Reply-To: <20261104124402.1269650-1-lvpengfei20@huawei.com>

On Wed, Nov 04, 2026 at 08:44:02PM +0800, Pengfei Lv wrote:
> Per USB 2.0 spec section 5.5.3, the ep0 maxpacket size is fixed for
> all device speeds except full-speed devices, where it can be 8, 16,
> 32, or 64 bytes and can only be determined by reading the device
> descriptor.  During the initial enumeration of a full-speed device,
> the USB core guesses 64 bytes (hub_port_init() with initial=true);
> after reading the descriptor, the real value (e.g. 8) is stored in
> udev->ep0.desc.wMaxPacketSize and propagated to the xHCI ep0 context
> via an Evaluate Context command (xhci_check_maxpacket()).
> 
> After a port reset (usb_reset_and_verify_device() -> hub_port_init()
> with initial=false), the "if (initial)" guard added by commit
> ff33299ec8bb ("USB: core: Fix race by not overwriting udev->descriptor in hub_port_init()") skips the ep0 maxpacket
> guess block, so udev->ep0.desc.wMaxPacketSize retains the real value
> (e.g. 8).  The xHCI Reset Device command preserves the ep0 context
> as well, so the xHC ep0 max_packet also stays at 8.
> 
> When the subsequent re-enumeration then uses the "new scheme" and
> issues a 64-byte GET_DESCRIPTOR (get_bMaxPacketSize0 with size=64),
> xhci_check_maxpacket() sees hw==sw==8 and does not issue an Evaluate
> Context command.  The xHC queues a Data TRB of length 64 but applies
> ep0 max_packet=8 for short-packet detection.

That's exactly what we want it to do.

>  If the device's first
> data packet is exactly 8 bytes and it sends no ZLP, the xHC does not
> recognise a short packet, keeps issuing IN tokens for the remaining
> 56 bytes, and the control transfer hangs in the Data stage until URB
> timeout.

That is the correct behavior.  Indeed, the same issue applies to _any_ 
64-byte transfer (not just control and not just Get-Descriptor) when the 
maxpacket value is 8.  If the device sends an 8-byte reply with no ZLP 
following, the transfer will hang in the data stage.  That's _supposed_ 
to happen.

>  (A standard 18-byte descriptor returned as 8+8+2 is not
> affected because the final 2-byte packet is a short packet.)

Quite right.  Why wouldn't the device reply with a standard 18-byte 
descriptor in this situation?

Have you observed this problem in actual testing or is it purely 
theoretical?

> Fix this by removing the "if (initial)" guard so that the ep0
> maxpacket size is re-guessed from udev->speed on every reset.  For
> full-speed devices this re-establishes the 64-byte guess, which makes
> xhci_check_maxpacket() issue an Evaluate Context command that brings
> the xHC ep0 context back to max_packet=64 before the GET_DESCRIPTOR
> data stage; the data stage then terminates correctly via short-packet
> detection, and the ep0 maxpacket is subsequently corrected to the
> real value as usual.
> 
> For high-speed, low-speed, and SuperSpeed-or-faster devices the
> re-guess is a no-op (guessed value equals the fixed real value).
> The descriptor-immutability checks (!initial && maxp0 !=
> udev->descriptor.bMaxPacketSize0) remain unchanged.

As far as I can see, there is no need to do this.

Alan Stern
