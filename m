Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EA747A871
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257635; cv=none; b=rpd4c4jPqiuIWEAivTgD3mGcvIgGR7iWN1tq9xMDrD4tgfH+EUCp6psXRWdNPuWpvywvkvo2Y1jNvf64nr6G/f1tEk8nlsHKVZEFRceWz0SAv7pwkba92HJP/UWlsCl7g2Ic4fENq06wppKey5QFN3F24x2JHbU9+8q6Q7UF2pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257635; c=relaxed/simple;
	bh=vRaD2X2xcCDuIb7uPDzMrYCycckWIwEhrOsQLCzY4gw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFd1jokNHspQ1G8miU6YIaPX7g6s6/Wgo1b9hDEwOJnvQU12O8ltZyjwOmkfwBOG2MOnY/6I+9y4iD3A9IGj6x0BLlsRJi8v78x/isUPOu1RqyjwwrL2B/u9tkKnP7pUjYv6OVZIw8dRnk8QirZH6VMwQy3N2hJZ2Uwjidt5Ye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APqieEQp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APqieEQp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so31593235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788257631; x=1788862431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGMhkf3RCMEctq3umyHGO3MvdxWxMBbojsHlqXM+5wA=;
        b=APqieEQp6y/pDSLkyyFvsLRHl6q9sC4Tr9EFLRo3oTWYbayTZQAe7J7PUnSc3jxj7m
         WWz2ux3RjctnjGgMotx4ePkqveVvOQb0jpnNrMxFQCylUT26Ai16WBvqMnIGohTLKQVH
         kds4HhjdxvxIcXqVHfk4F0OrJxJP1S3n3GZDAFVvYuiBSggLUqsz1pdCeBcizHS7HZjz
         w2a6heWN96qF2anyQUx5mCIMBqDZXManH365MvdNLWw5zEEplk5gtkLX2vSFX5Nih0r1
         U7CU2m2qxCeDMCKiONjqCC8AC0H4EPc8iNbhhsu3a1OOt5e1ZEtMal1VSA5BroyLkHfC
         8kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257631; x=1788862431;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGMhkf3RCMEctq3umyHGO3MvdxWxMBbojsHlqXM+5wA=;
        b=Ny/CmlSC/f27RtdxspMKECU75qnJQG8DgMwSR+pTLvVP9j/GsVs07waXzAqHMBe1KC
         sKI4/u4w/HXtf+TbqRSjOijuZhSYOYHbG0ObrywqHL8BjqECXqCmx6h3yzf7w7e6tOrs
         s24ST4kglbAXwBHYsOlzYxJhT36G6M4+VAxnUI4/kg/vrWcVH/93bDaqYrnExQml/PkT
         rw/6VoaYBkTObyRrGCfAiClF2SITmQOFYXYTYiUdecJI742zytq7gzT+i5rl55uFki6X
         0Nc30Qt2a6tdTou84+iFUI+wSeP1Vd3yi+lRi9Ak5W+ni5/Hg57uiA3buvnp0vdAQEBs
         5VkA==
X-Forwarded-Encrypted: i=1; AHgh+Rok79gUwlJIsAXQkJny8nYvCB0rcDp6emgHKXkTNRK4fjcXbyaXlU3DRtsgHW70g5aEQoIKNTG2c3duh6g=@vger.kernel.org
X-Gm-Message-State: AFuF++n5Ygan5mn/A8gMsniRInrzTqUkVBFocFOFjVKumOa2bo6/UX4R
	F0ZpqwsVXzKXpGJU3ggUJvq43Jzzy+hYpjV3LAPuIOqNKBzYrrobdxIiDdtkGA==
X-Gm-Gg: AR+sD10qyzMWRHLW6rt5K7aoDgNTiehdyFDDCHq6otjQj3dIjhBssC7c3yw92LOueYX
	MlNrYhFV5K+/wX6/k/x0yrudKNNWmz9qWIiN11d3CHb4ZIBufByqXE5Z6cOBksk3jXb6TWuxShY
	vLbyUN1Jq9g0viOE1TeHdSwz9EaFJKrAymLsCmDLV4S1ENRUZndx0C58QeXKBliSGxmx9jAFt5b
	u4DG5wfsBFc+Dkuc9q3//aUK7ScVHoaTPXGkKP65yKpn/2Qo18oy8ecuOJqIPP83SmAJqMxhdgX
	caEJnaxUpE0NXgWF4OMj/X9987wjN8B6duGh3+dexv/VKxbW1/svJt3DovJdpJ7TlvGe80kqeQJ
	yi8cTcMGm3XZb9HmsuF5E+Hp2txfz7ySJsMIfDLq5p82W9GW2+8ASjuHAupnd5HWV6eqiyaYiDc
	BoEXgTkISVsLs627VTDSwXNcSh/6UEe/9a962dJKSa2DzMsLXE3aXLh+kYC5dDBeiKpOJQnq3QQ
	zP+oQ==
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49b91c486c3mr408787555e9.14.1788257630883;
        Tue, 01 Sep 2026 03:13:50 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdcdd5f5esm54249965e9.0.2026.09.01.03.13.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 01 Sep 2026 03:13:50 -0700 (PDT)
Date: Tue, 1 Sep 2026 12:13:43 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Rishabh Jain <rishabh.jain1198@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mario Limonciello <superm1@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: pci-quirks: always assert xHCI OS ownership
Message-ID: <20260901121343.22786f2d.michal.pecio@gmail.com>
In-Reply-To: <20260831211126.23745-1-rishabh.jain1198@gmail.com>
References: <2026083129-justice-egomaniac-01cd@gregkh>
	<20260831211126.23745-1-rishabh.jain1198@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 14:11:26 -0700, Rishabh Jain wrote:
> The xHCI ownership protocol requires the OS driver to assert the HC OS
> Owned semaphore before using the host controller, then wait for HC BIOS
> Owned to clear if firmware owns it.
> 
> quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS Owned
> is already set. If firmware leaves BIOS Owned clear, Linux uses the xHC
> while both ownership semaphores remain clear.
> 
> On an AMD PROM21 xHCI controller (1022:43fc), this caused every S3
> resume to terminate Controller Restore State with USBSTS 0x401. Linux
> then reset the host controller, both root hubs and the USB Bluetooth
> adapter.
> 
> The controller entered resume ready and halted with USBSTS 0x1.
> Endpoint state, 100 ms save/restore delays, scratchpads, the DCBAA,
> device contexts and command, event and transfer rings were verified not
> to cause the restore error.
> 
> Asserting only HC OS Owned changed USBLEGSUP from 0x00000801 to
> 0x01000801 and eliminated the restore failure across four S3 cycles,
> including a stock-kernel test. Clearing USBLEGCTLSTS was independently
> verified to be unnecessary.

Not sure what you mean by a "stock-kernel test"?

> 
> Always assert OS Owned when the xHCI Legacy Support capability is
> present. Use the existing ownership masks with a single initial register
> read/write. Keep the existing BIOS handoff recovery and legacy SMI
> cleanup unchanged.
> 
> Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>

Does this submission comply with the attribution rulese here?
https://docs.kernel.org/process/coding-assistants.html

> ---
> Changes in v3:
> - Drop the unnecessary BIOS ownership debug message.
> - Drop the redundant self Tested-by tag.
> 
> Changes in v2:
> - Use XHCI_HC_OS_OWNED instead of byte-offset access.
> - Fold the TI/Renesas forced handoff into the ownership-register write.
> - Make the BIOS handoff wait unconditional and gate recovery on the initial
>   BIOS ownership state.
> 
> Additional context:
> 
> * Kernel Bugzilla #216470 documents the same USBSTS 0x401/reinitialize
>   behavior and its impact on attached USB devices:
>   https://bugzilla.kernel.org/show_bug.cgi?id=216470
> 
> * Commit a7d57abcc8a5 ("xhci: workaround CSS timeout on AMD SNPS 3.0
>   xHC") is related workaround history: it tolerates a distinct AMD CSS
>   timeout and resets the controller on resume:
>   https://github.com/torvalds/linux/commit/a7d57abcc8a5bdeb53bbf8e87558e8e0a2c2a29d
> 
> The external reports do not record their ownership semaphore values but
> are included as corroborating failure signatures that this might fix.
> 
>  drivers/usb/host/pci-quirks.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> index 0404489c2f6a9..52d41ac5daa85 100644
> --- a/drivers/usb/host/pci-quirks.c
> +++ b/drivers/usb/host/pci-quirks.c
> @@ -1191,25 +1191,22 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
>  	if ((pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241) ||
>  			(pdev->vendor == PCI_VENDOR_ID_RENESAS
>  			 && pdev->device == 0x0014)) {
> -		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
> -		writel(val, base + ext_cap_offset);
> +		val &= ~XHCI_HC_BIOS_OWNED;
>  	}

I'm not sure why touching this code has been suggested to you. You
don't have this hardware, you can't test this change, and it isn't
required for achieving your goal.

[Actually, I doubt this whole code and the (not visible here) comment
above it, because nobody had issues with uPD720200 and uPD720202, so
it's unlikely that uPD720201 is broken. Probably this was a workaround
for someone's buggy BIOS. But I'm digressing.]

A stable bugfix is a particular case where one commit should do one
thing and do it well. So it should preserve the original behavior for
"broken" chips and only affect those chips where we do actually try
to perform the handoff handshake in accordance with xHCI spec.

So this is the actual change you wanted to do:

> -	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
> -	if (val & XHCI_HC_BIOS_OWNED) {

and to preserve existing "broken chip" behavior, you could add

+ } else {
+ 	/* Perform standard handshake and leave OS_OWNED set
+        * to keep the BIOS at bay during subsequent suspends

And it seems that this is enough.

However, as v1 rightly pointed out, this code is dubious because
it performs read-modify-write on the whole DWORD, of which the
BIOS_OWNED bit may be concurrently modified by the BIOS (though it
isn't clear if that would ever happen under any circumstances).

So the change from writel() to writeb() in v1 actually made sense,
maybe as a separate patch because it's a separate change. xHCI spec
is clear that HW must support writeb() accesses to this register,
exactly for this reason, so regression risk seems low.

Regards,
Michal
