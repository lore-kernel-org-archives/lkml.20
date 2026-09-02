Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DB1191F91
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319599; cv=none; b=VoqLr/JkRO4U+c98iyqq4gnhalIKa9gXXCaNLJek9A/PwbLake4a//2ttE7ripl86kotb479FjsQFWvqBAAlao3rta/MAVPVyIQjMgwedBVVZxQvPe2DFMQAu7KW8nyvGSMypqk2yme3My0cVT57AD5KkE/0mUUxRwGpJ93dGe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319599; c=relaxed/simple;
	bh=96wvEPiwPZfR78LElYmLqc+vqsPLRsuVXQK+WuAbyd4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ts4hn+0RRYlW4zH6r9+Q/TDr4v6w+ZURP6W/hMpVIzIcTeBS7yYZgC5jT1AQWFmG8KK50nd/LA/ejm7fjt52fr0daU+R2B/nzEoX9X0fXWfv0fhyHR6VNtpqDFquFITeuYCSHowtPYPXc5r9oGvSpjmPOwnnfcUzTUCniAc+B8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zcs3JbQr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zcs3JbQr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8687630fso3661955e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319596; x=1788924396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWAV+LvRXqnUBhlcQBpGfOksFpIYqg+MNUT0HrN6l6o=;
        b=Zcs3JbQrig9Xlfw2jzMfNoBFox3oNzg7sc2oQjzk8pEJYhEZIBSJYlPEyGxLqxMCul
         o9n+aO5tyh9N6PMudI14ZJ/Ij6PZFbiHi3ZgI/t2bv4qAAAIJAV/IEa+cUfGmXv215hx
         3nZHCSXVc1E4w6K50I76RH0OuBSbymioEB56Bs6liCDlv/OzhMM481qw2xGX2JpoAGQt
         zJxa2r5NZYMpqAmD4r9qv5Z1aSSb1JlPyz36FyCtbU0+OjRoaVHojQL7yxYgWfw/9Qy7
         YAKWyG3V4AQdmB6Ss1Ecz1lhEk8MksKufAZ+ShfZJa7qX0uefaig5NfAsGJ9BHhEkSMN
         SHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319596; x=1788924396;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWAV+LvRXqnUBhlcQBpGfOksFpIYqg+MNUT0HrN6l6o=;
        b=B3XreHIFN6Z7mJgUufr9pVgqIS6WKTqAcXY+Qfj5QQM+iEll6f7ySMqiMNINNG01Ui
         xVwq0qjtrqnWT/Xf+po884RbHnLER4tF68IuFAqD6FdvNv9zhGzVgXeJ1U/UaXskqrDB
         hoz1brAus8yzhllwoESAj+nUcuF63y93oUP8gPl/DtVyavhjXy5PZJuZe7kFu7nG/yeM
         mAvmE8tC8L4l2Eu5nHaAvXkIO7Ikr7sb+/+GHExuUvKCcpTV1KB7Pq3XNWi6nP1Ygwwq
         tk8jmEf2qV8iOVifF864GEvNbVW/DikP2VV85QPSUmWiDT48xs4X+ed8McPLUkQ8LZH5
         mwDg==
X-Forwarded-Encrypted: i=1; AKwUvBxE4TMRWdDCufWZ1JDp9PU2Q/YunOVLFf6ByZw3W47xc9figWCL4FYOJFxDJFR033DkxHjTh4eAbdeAcek=@vger.kernel.org
X-Gm-Message-State: AFuF++lGnsTusJtZOlCdk4Tv/VELf/Xz4vPNii3RqkWx2m5mL+cotMUC
	QwFNqD+J3weaiXxcuMxOFNKtxp/BA7XOY+8JTb2TQZVBrLCBJGeg5sRb
X-Gm-Gg: AYBFou1Hrt37totDnBgEQ2Es1lrNQCKyj+KqnYcfowdyYy5WARwatlEXW5ye4Tq54Er
	vfnWX3PCd+18JoV53CDTMCm2M5NTi7gH80xEt4UNh3WvBXGIGIwA1YMAD05Lc76gwK9LulL+c+S
	JRz2dTnfg2ReKiTsWeJHYjvvta6worxCAI+IjIj7amYIZfMCEPW4mz9F6lyeqE4G7t/c/8ft0KD
	Hgg0kH3/wUE2E/Iv4GLKe8ONGiVaGXpiwKyAGAYmvRvqCcs+AP5MtNCoOgClPqaqqH8cn/n6zZR
	kfNNjolfZbSvJ6f1hqth/Sp/5vgtOtS1SXvdqM5gIZdlw7kXI+HrN3hmRybxgyuvo0lGF+NWgmu
	ZD3QT3mwwf/wrq0Ulq6cvvkJ39L4htXCSEG7OpcJ6IhDJrCehwSTiQpkp70CC5+ykjHmBH894HS
	0DA+ZQw82b3fHMicWFPEFudexOP6nSj+mh9g+AxUa36VQl1lI0meDpwy7FQbX4r8tbrM8=
X-Received: by 2002:a05:6000:4a0a:b0:484:39b4:5bc9 with SMTP id ffacd0b85a97d-484914cba9amr2358765f8f.26.1788319595898;
        Tue, 01 Sep 2026 20:26:35 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7f8f9sm3312839f8f.9.2026.09.01.20.26.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 01 Sep 2026 20:26:34 -0700 (PDT)
Date: Wed, 2 Sep 2026 05:26:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Rishabh Jain <rishabh.jain1198@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mario Limonciello <superm1@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4] usb: pci-quirks: always assert xHCI OS ownership
Message-ID: <20260902052631.75c6068b.michal.pecio@gmail.com>
In-Reply-To: <178831224746.44206.8934470315568179153@gmail.com>
References: <20260831211126.23745-1-rishabh.jain1198@gmail.com>
	<178831224746.44206.8934470315568179153@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 01 Sep 2026 18:24:07 -0700, Rishabh Jain wrote:
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
> Across four S3 cycles, asserting only HC OS Owned changed USBLEGSUP from
> 0x00000801 to 0x01000801 and eliminated the restore failure. Testing
> included the unmodified 7.1.8-ogc1.1.fc44.x86_64 distribution kernel
> using a test module that set the HC OS Owned semaphore. Clearing
> USBLEGCTLSTS was independently verified to be unnecessary.
> 
> Always assert OS Owned for controllers using the standard xHCI handoff,
> and leave the existing TI/Renesas forced handoff unchanged. Keep OS
> Owned asserted after the standard handoff to prevent firmware from
> reclaiming the controller during subsequent suspends.
> 
> Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
> ---
> Thanks for the review.
> 
> By "stock-kernel test", I meant that the register change was tested on
> the unmodified 7.1.8-ogc1.1.fc44.x86_64 distribution kernel using a test
> module that set the HC OS Owned semaphore.
> 
> Sorry, I missed the AI assistant guidelines. Fixed now.
> 
> The TI/Renesas forced-handoff path is restored unchanged. This revision
> only changes the standard handoff path. I left the byte-access change
> out of this patch.
> 
> Changes in v4:
> - Preserve the existing TI/Renesas forced-handoff path.
> - Limit the ownership change to the standard handoff path.
> 
>  drivers/usb/host/pci-quirks.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> index 0404489c2f6a..fa9b5db4d115 100644
> --- a/drivers/usb/host/pci-quirks.c
> +++ b/drivers/usb/host/pci-quirks.c
> @@ -1193,22 +1193,25 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
>  			 && pdev->device == 0x0014)) {
>  		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
>  		writel(val, base + ext_cap_offset);
> -	}
> -
> -	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
> -	if (val & XHCI_HC_BIOS_OWNED) {
> -		writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
> +	} else {
> +		/*
> +		 * Perform the standard handoff and leave OS ownership set to
> +		 * keep the BIOS at bay during subsequent suspends.
> +		 */
> +		val |= XHCI_HC_OS_OWNED;
> +		writel(val, base + ext_cap_offset);

The change from val|OS_OWNED to val|=OS_OWNED doesn't seem necessary.

>  
>  		/* Wait for 1 second with 10 microsecond polling interval */
>  		timeout = handshake(base + ext_cap_offset, XHCI_HC_BIOS_OWNED,
> -				0, 1000000, 10);
> +				    0, 1000000, 10);

And this whitespace tweak isn't either.

>  
>  		/* Assume a buggy BIOS and take HC ownership anyway */
>  		if (timeout) {
>  			dev_warn(&pdev->dev,
>  				 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
>  				 val);

Note that val is being logged here in case of error. It's probably
better to preserve the original value for this purpose. We *know* that
the code above tried to add OS_OWNED, but we don't know whether it was
set before or not. Not sure if we will ever want to know, but still...

> -			writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
> +			writel(val & ~XHCI_HC_BIOS_OWNED,
> +			       base + ext_cap_offset);

OK, I see, this could unintentionally clear OS Owned together with BIOS
Owned. This can be prevented by explicitly oring OS Owned here. And it
would make sense to document this problem in the commit message if you
are trying to solve it in this patch.

Other than that, I think this looks good. Just in caes, pease test the
final version once more to ensure we haven't broken something.

>  		}
>  	}
>  
> -- 
> 2.50.1 (Apple Git-155)
> 
