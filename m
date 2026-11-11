Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412755;
	b=gOn2u8Gr/zsieRnWfXo3YroBnHquA1txhpaDAaI1vEZsc/jMrZkXL2yoWGz4neM1EeIP
	 KdIemgLi32ikWnvDTbp4/epMtVtsgv3DFAXQ1mtUWBCHIUSsiHmLh7bOIW2vQXX4uQitQ
	 JD8MJviRFoTgabv9GfK835me7s3b7w4Jo3Zf+6SZmNH8MuGyNu7D5pM9WDyUm5YeWK0wu
	 UNOKt4JVjlFxXCNv58cgxlukchUB5GWEonWRzSHx57iZhypubjC5EYh839QHybRY9slXg
	 PEPnAE5g8U8Gukh1T8mCz2Pnqr0EQ5bAY5qUCRRqiiNm1dNfCldVvjMjBVxIh5Awmjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UhAQCwAK9U5/rrP7mXmanlqYZveAuCzmP2/fpjLYuqM=;
	b=BgbWtm2ZlRn19IIMuBQRhfrum6N9sNl7+AJO4UfMTMgFd5f8Cc0mT+2eftI4UqSyjQ43
	 dLhFu8VQIuwyAamnH2wrR61rpT05CYLyDFYCbN7bF9ESURmQp8Ml/LwPKE32h6NIT3Kz8
	 a4VF1Pt849vAVLv3UZ589ciHHjA0eKa+fFsYYFybJDix4hILUvHCMuZU3kdsOYd7+RTFn
	 TzlkLb1Rv4E0FcA30Lls/t6TmAfQaciExJ9AFl3u+sHbpCfjuk81nkt0KijxzAz91YcL7
	 8cPdOWww0DlJADPJ3IzeTsWSWtrA561MTInmte86XRFVl3RMF0tBOvBCEbBFOZDwEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="eIEaFm/h";
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8D606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC8D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eIEaFm/h
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-483d290f398so1994264fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794412753; x=1795017553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhAQCwAK9U5/rrP7mXmanlqYZveAuCzmP2/fpjLYuqM=;
        b=eIEaFm/h0xSQyHOJvJlNWHrnRysfE5yG0oj86mr569RqKd9SbFcokYbOTsOkqZHGww
         WSmWvs5ZB0rpV4vUiCuG39ZeyN0tgCrDKNHQtgvvb4EOwJi0dQzv0E7iUZm3iPKIWD4A
         SuFMAcW9TSp6JCTkX+jxb48Ar2ToiAyhamfAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412753; x=1795017553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhAQCwAK9U5/rrP7mXmanlqYZveAuCzmP2/fpjLYuqM=;
        b=a8YeA1+1QUb/pcrwnaOSowLDq1Ihh8XUhlNOX+mf1afXHfOYZyLqsq+LJ1ogJt5FY3
         SNOe6Db+ljzZdooqqol2prleCjCJ/m2sg2TPsaiWZ6hbVJZUOhVXLIcj0JgKDhPlIaj8
         VemDd6bQFkjzxZD8Rv64Ui/GzzPYEXiE3cUeH7+3V9emUzp4nrJAX6Unl6m/zhSgMU07
         tH2FWsbQ+ELje4inEaPh+PPnwUXV5wXPpUnPY/STXqy5ILxax8OI+7rZufIR3B++Mz/Q
         M7R2kgWpRnYbvkdJbK3w8P/Jn9x3yPI55voXKzDmt/Dx+XEF2mImJcAANgn1r73Bh7uI
         xJ9Q==
X-Forwarded-Encrypted: i=1; AL+hErEPO0wC+SC02r3mv+vTWLM8A6KRjIODxMw3Fsj7u7w/4k5z92B0SDEts+Y5gTCYngcxzl6f/WB89MyrPIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z86swjUGM349kCiPMQXegsSAmjKAacNmF3l7Muk9tF8dQbjvs76
	NIw4p6FSKn4m2+CbiGjsWeNI/rYue9yBYGHzCuMttVO71ljkmtBXfURRLtxyfSE5DAg=
X-Gm-Gg: AYBFou0TpA1vNuxjbdjtbf+GwIwSS+2ZS/sAOdMuoTjZHxJoH3xY4jdQiKuzExBRezS
	HlBzLDChLSTttuPN8v7Nx40seTwUwmAduVsVN1TCz1PNnP6ojFYSeQbgAXsfznM3ddY3zuQtCOw
	zZBMm2PMi57SoE3jw3HEZjGhT36yJyn2HendQHc8JZ8sYdsnIaniT2fixwIXXWcNYYGW8xYAVoh
	j948J6Oqvoe94uImwUMf8ljYJ66zkAkb60Qy/0uOLXTuLIEGphHMWC51L2IEDzmYME4jZiomqvG
	e2EP2brquEBQoSgJaBAlKpY4TtEH9IdnqFLR9cMna6yngCUz6CjpI22JfqyfOBoyuQOzwOn3e5M
	SX1ronB03WO+u1Zy+jyiWnyckatKyC2qPENlIHrI8BuT/eLhCEsd83hREc3qUn2E1NkUteRqBXn
	GzqfrhtPvAlC2y1YDVvftxPahfHjgECCi2YpGJDSCUCEIheOlWzUFYvd/lLdJ9FzozSOILCVv4d
	jril99TvWEvuYlZ/Qw542aItvCUfUhzbUSxgZNMSwvQEmyn6U8MsBdN3RtTMEej2WpilTn3hDzA
	WWdjp7Dqo5KlUhLwCckQ/Te++mpXgbzAcF0gfQ==
X-Received: by 2002:a05:6808:c1a6:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-56b95163966mr2096176b6e.10.1794412753003;
        Wed, 11 Nov 2026 07:59:13 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504e7dasm5155792b6e.5.2026.11.11.07.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:59:12 -0800 (PST)
Message-ID: <eeaa6363-7892-40fa-9706-f484a1b84e4d@linuxfoundation.org>
Date: Wed, 11 Nov 2026 08:59:10 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: vhci: do not give back URBs with an unchecked
 actual_length
To: Vlatko Kosturjak <kost@linux.hr>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <auw5_lMRbGU97IKx@griffin.linux.hr>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <auw5_lMRbGU97IKx@griffin.linux.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 01:10, Vlatko Kosturjak wrote:
> vhci_recv_ret_submit() copies actual_length from the RET_SUBMIT header
> into the URB, and only usbip_recv_xbuff() looks at it. That check is not
> enough:
> 
>   - an IN reply longer than transfer_buffer_length is rejected and the
>     connection shut down, but the URB is still given back with the
>     oversized actual_length (and status -EPROTO);
>   - a negative actual_length (urb->actual_length is a u32) is not
>     "> 0", so usbip_recv_xbuff() returns 0 without checking it and the
>     URB is given back with status 0;
>   - for OUT URBs usbip_recv_xbuff() returns 0 straight away, so any
>     actual_length is given back.
> 
> Completion handlers trust actual_length. usbfs copies that many bytes
> from the transfer buffer to user space in copy_urb_data_to_user(),
> whatever the URB status, so the kernel reads past the kmalloc()ed
> buffer. With CONFIG_HARDENED_USERCOPY this is a BUG in the context of
> the process reaping the URB, here for a 22 byte reply to a 16 byte
> URB:
> 
>    usb 1-1: recv xbuf, 0
>    usercopy: Kernel memory exposure attempt detected from SLUB object 'kmalloc-rnd-05-16' (offset 0, size 22)!
>    kernel BUG at mm/usercopy.c:102!
>    RIP: 0010:usercopy_abort+0x6c/0x80
>    Call Trace:
>     copy_urb_data_to_user+0x122/0x160
>     processcompl+0xe3/0x160
>     usbdev_do_ioctl+0x14d/0x1900
> 
> Without it, the adjacent heap contents are copied to user space. A
> negative actual_length does the same on a URB that usbfs splits into
> scatterlist chunks: the last, shorter chunk is over-read by up to 16 KiB.
> 
> This was hit with a buggy user-space USB/IP device implementation (it
> answered an IN URB with more data than requested) while pcscd read from
> the device; any server, buggy or malicious, can trigger it.
> 
> Check actual_length against transfer_buffer_length right after
> unpacking the header, for IN and OUT URBs: the u32 comparison also
> catches negative values. On failure give the URB back with
> actual_length 0 and status -EPROTO and shut the connection down, as
> usbip_recv_xbuff() does, since any payload was not read. Also give the
> URB back with actual_length 0 when receiving the transfer buffer fails
> (a short read), as the buffer was not filled.
> 
> Fixes: b348d7dddb6c ("USB: usbip: fix potential out-of-bounds write")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vlatko Kosturjak <kost@linux.hr>
> ---
> Changes in v2:
>   - Check actual_length before usbip_recv_xbuff() instead of only zeroing
>     it when usbip_recv_xbuff() fails. v1 missed a negative actual_length
>     (usbip_recv_xbuff() skips it, so the URB was given back with status 0)
>     and OUT URBs (never checked). Pointed out by the Sashiko AI review.
>   - Shut the connection down on that error, as usbip_recv_xbuff() does.
>   - Tested on mainline 7.4-rc1 as well.
> 
> v1: https://lore.kernel.org/linux-usb/aurLXADfuLjs-dm-@griffin.linux.hr/
> 
> Tested in QEMU on mainline 7.4-rc1 (05441d697f7f, x86_64 defconfig +
> kvm_guest.config + USBIP_VHCI_HCD=m, HARDENED_USERCOPY=y) and on 7.0
> (Ubuntu 7.0.0-34-generic), with the same results on both. The reproducer
> is a user-space program that attaches a fake device to vhci_hcd through
> a Unix socketpair (no network or usbip tools needed), answers a bulk URB
> with a bad actual_length, and reaps the URB through usbfs:
> 
>    reply                         unpatched / v1              v2
>    IN 16 bytes, length 22        BUG (v1: -EPROTO, length 0) -EPROTO, length 0
>    IN 16 bytes, length -22       WARN in check_copy_size(),  -EPROTO, length 0
>                                  REAPURB fails with EFAULT
>    IN 16400 bytes, length -22    BUG; with hardened_usercopy -EPROTO, length 0
>    (two usbfs sg chunks)         =off status 0 and 16 KiB
>                                  of heap reach user space
>    OUT 16 bytes, length 22       status 0, length 22         -EPROTO, length 0
> 
> With hardened_usercopy=off the leaked heap bytes include kernel
> pointers. Legitimate replies are unaffected: device enumeration over the
> same connection works as before.
> 
> Happy to send the reproducer (about 350 lines of C plus a QEMU script)
> if useful.
> 
> The 2026 hardening of RET_SUBMIT (number_of_packets, iso frame lengths)
> does not cover this path; it is the non-isochronous actual_length.
> 
>   drivers/usb/usbip/vhci_rx.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c898..3180dc3018 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -76,8 +76,27 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
>   	/* unpack the pdu to a urb */
>   	usbip_pack_pdu(pdu, urb, USBIP_RET_SUBMIT, 0);
>   
> +	/*
> +	 * actual_length comes from the server, and completion handlers
> +	 * trust it: usbfs copies actual_length bytes out of transfer_buffer.
> +	 * Reject a negative one (it is a u32 in the URB) or one larger than
> +	 * the buffer, for IN and OUT URBs alike. Any payload was not read,
> +	 * so the stream is out of sync: drop the connection.
> +	 */
> +	if (urb->actual_length > urb->transfer_buffer_length) {
> +		dev_err(&urb->dev->dev, "ret_submit: actual_length %d exceeds buffer %u\n",
> +			pdu->u.ret_submit.actual_length,
> +			urb->transfer_buffer_length);
> +		urb->actual_length = 0;
> +		urb->status = -EPROTO;
> +		usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
> +		goto error;
> +	}

I will take version of this patch with just the above change.
> +
>   	/* recv transfer buffer */
>   	if (usbip_recv_xbuff(ud, urb) < 0) {
> +		/* short read: the buffer was not filled */
> +		urb->actual_length = 0;
>   		urb->status = -EPROTO;
>   		goto error;
>   	}

This fix will go in a different patch.

https://lore.kernel.org/r/179328314074.648427.388274461758949120@gmail.com

thanks,
-- Shuah
