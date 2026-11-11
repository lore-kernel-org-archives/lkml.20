Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412824;
	b=ViBgxKsUF0NTLs7AO8gK7oxZ2pLmKZpbdYsD0/uyrVy7Z2BBsS5H54Wsde4mVrDm8Dgr
	 scnJ/rJSR0Clc1npiTuGqNj1JreaPrMjt5RC8LkO8DDLfHJqXE3PumEST8nWJCphnyjQ/
	 34TbsObjh6kgqN632XPX0mXNKo02HHprBntRP5AZxI17qE44UCzD94kz5zSayIrknIYuA
	 QdPWtlzpdmkODzdRCFdP299bw7C0hBrf6XTiLu2Col50+Mvz9vIWTCsaZiEoxwJ3CqVbC
	 RiFz2IuxXHzx/rqXShVJ4dJhc8XmFs0dEwuLsnbUTSxc90KinqRWcGboePZ1ndmkHrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=r3PeQNY0DfEO2GjO5oRC5P+QTt5goOUxQY7pwUgYFM0=;
	b=GOf7biIz5l2qvUK1ybT8+/wykLflxqpmwNaMRZfPliNTQkvupmi1cqZ4LP5a3a/rmSnt
	 YnkUBfhrKfUtmaQsz/nQYwyRuXocA8j3STLSheBX3jIuFc1/rgw1vS4OUfdz1AmJEByaI
	 1CqrweX1XqkFUS7fW8+HLuf8u5hzMmrsTLCHhQdV+WaF68VvE0HBEbi8eGQe8vzhOn4EV
	 DfCfpDmcxu83wuo0GWCHPFPqIWtJGvCI3d5pxbpj5KPkhYRpto7/VbAAwv5mG2bwror4e
	 8OiQfI65ddUD+lSkJM20bI/F29GNHXPeoUfNcf1/wBrVQd53aizv0MCay/KYWRZY3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KYdQsLwF;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E5606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KYdQsLwF
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-702dedeb70dso1763148eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794412822; x=1795017622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3PeQNY0DfEO2GjO5oRC5P+QTt5goOUxQY7pwUgYFM0=;
        b=KYdQsLwF3lUuhJ6ty5RYTwjolw/TuaksX9yO0x7jCvIXn8xWUTsdNONDuqveeHYfuc
         FPaK9IVRnQ0EcLzyY47lDvi5CiOangS0CpbTDsfpbDtMhpNj5U946kcvCUFmept7mVlQ
         57sw6Awm+OdVYF/sS5tnoRVFLVYbMZMCQgxRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412822; x=1795017622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3PeQNY0DfEO2GjO5oRC5P+QTt5goOUxQY7pwUgYFM0=;
        b=FiYK6R/ejy3ak31U1mQotFT7rQh/IdgfS7psXW4YkscCC2Niq45LV65H1vJEAblfK/
         k11BDZyoNOdgexwF7HijfTRdSfchoi1LOZImX09vZCrQt5BO+d308QLM57uB166HpnZd
         nx67eOSPDVL/ghPTZaj4hviwwZqBdY/usKMwcabmT0QJymu9miOXcFVeyoe0NErZ9Nea
         S4dupxIQ3bjzcXcShQl9Eo/hsHvSfcJf4fbQuSZUjSMCnr2D843sNFerx4CAuqLnjPW/
         xrppu359RAzUjhImG9IFzqKN+ngOE+FY1vDUw9tS6MH2LFjPlp9vtDNcNHrQINapyTtL
         bftQ==
X-Forwarded-Encrypted: i=1; AL+hErFq9g+lxzLgoarBcsz9x3BPr3+LE7cT8Wt6Jb3jfOlGyMlxG+tDRgpdb7S7i9vqX4aHW7TfqxHbcw2MK/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fb7KuvrBWE0Ip2TjBXzc+tvGWQEYWlluOLfeBokWUHJMtu4u2
	xuGgiR1jza7KPxdH9JPmYRbfED+9my0s6gkJP90yGzOCPAJImpPHyQxERZSlXfTT48k=
X-Gm-Gg: AYBFou0CschFiGZPFdwo1uKkzt5wB8uWASK2ctRr2eIvo1+7mIaVh3uRuclb/siISt9
	DqLcgexb+CPD+cFqifDUtXh3gwhRVgrX+bx0Gcnii/jzLONNY+eEtUY8vzLN52bxIsz1xlgvyJs
	2UgGnHySMGAaftlUTygU5S2T/7v+m5IDwpYMJUWR+pXD1wNYYYs64VCztvweZPC3ByIJoZM84oU
	cZKf9sBun8YOL3Bp+T+zyRfZwxvp7s7eUA3F5Q9fWByd1bBXU9MiD16H7BA+p6izZPLSn73YSZ5
	fTFs6PaQ7M1o9RBqaUVCCbwgwx1whkJah+orell5Sppck4m3P7k5D2jqE1QQiVHvZaWW2g1VS8o
	Fdjs2L/aN43EOdiJ/SXFuYviofT+6eUM9/SsBZIEV4UE1lcCUTxYjb9KpZRSiO/O41uZijsZNaC
	Vt3BUq9gWGnknlLszvBnfQ270+hNvAWRxyFXNyMpqgCTR1S1tacoqfDtQH5MecUOu8M6m5LFH1R
	Yb/S9Gpo4hzd7br5nFKiygo5CKLVVdu23yOWj6zHXtaoLrrtSLC/6O1IYIjY3djS3e1xCdtpchi
	eqT+Y+GVVM3OSxRzp0HrWnNnLqz3i9Tg29nVUGE/Ni/1PEvcIBtFMBE5zYE=
X-Received: by 2002:a05:6820:82b:b0:717:da:ba22 with SMTP id 006d021491bc7-71925f79c3emr233818eaf.89.1794412821742;
        Wed, 11 Nov 2026 08:00:21 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae2302d8a0sm3334206fac.12.2026.11.11.08.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:00:21 -0800 (PST)
Message-ID: <89461e8e-68e0-44ad-8e75-57797886198d@linuxfoundation.org>
Date: Wed, 11 Nov 2026 09:00:19 -0700
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
Subject: Re: [PATCH] usbip: vhci: do not give back URBs with an unchecked
 actual_length
To: Vlatko Kosturjak <kost@linux.hr>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <aurLXADfuLjs-dm-@griffin.linux.hr>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aurLXADfuLjs-dm-@griffin.linux.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 23:06, Vlatko Kosturjak wrote:
> vhci_recv_ret_submit() copies actual_length from the RET_SUBMIT header
> into the URB before usbip_recv_xbuff() checks it. When the server reports
> more data than the URB's transfer buffer holds, usbip_recv_xbuff() rejects
> the reply and shuts the connection down, but the URB is still given back
> with the oversized actual_length (and status -EPROTO).
> 
> Completion handlers trust actual_length. usbfs copies that many bytes from
> the transfer buffer to user space in copy_urb_data_to_user(), whatever the
> URB status, so the kernel reads past the kmalloc()ed buffer. With
> CONFIG_HARDENED_USERCOPY this is a BUG in the context of the process
> reaping the URB:
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
> Without it, the adjacent heap contents are copied to user space.
> 
> This was hit with a buggy user-space USB/IP device implementation (it
> answered an IN URB with more data than requested) while pcscd read from
> the device; any server, buggy or malicious, can trigger it.
> 
> Do not trust actual_length when the transfer buffer could not be
> received: give the URB back with actual_length 0. A short read leaves the
> buffer partly unfilled too, so this covers both failure cases.
> 
> Fixes: b348d7dddb6c ("USB: usbip: fix potential out-of-bounds write")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vlatko Kosturjak <kost@linux.hr>
> ---
> Tested on host 7.0 (Ubuntu 7.0.0-34-generic) in QEMU with a small reproducer: a
> user-space program that attaches a fake device to vhci_hcd through a Unix
> socketpair (no network or usbip tools needed), answers a 16-byte bulk IN
> URB with actual_length 22, and reaps the URB through usbfs:
> 
>    unpatched, CONFIG_HARDENED_USERCOPY=y:  the BUG above
>    unpatched, hardened_usercopy=off:       reaped actual_length 22 for a 16-byte
>                                            buffer; with 200 extra bytes, 200 bytes
>                                            of adjacent heap reach user space
>    patched:                                reaped status -EPROTO, actual_length 0
> 
> The vhci_rx.c hunk is the same in v7.0 and in mainline. Happy to send the
> reproducer (about 300 lines of C plus a QEMU script) if useful.
> 
> The 2026 hardening of RET_SUBMIT (number_of_packets, iso frame lengths)
> does not cover this path; it is the non-isochronous actual_length.
> 
>   drivers/usb/usbip/vhci_rx.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c89..720dafa72 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -78,6 +78,14 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
>   
>   	/* recv transfer buffer */
>   	if (usbip_recv_xbuff(ud, urb) < 0) {
> +		/*
> +		 * The transfer buffer was not filled: either a short read or
> +		 * an actual_length larger than transfer_buffer_length, which
> +		 * usbip_recv_xbuff() rejects. Do not give the URB back with
> +		 * that actual_length: completion handlers trust it, e.g.
> +		 * usbfs copies actual_length bytes out of transfer_buffer.
> +		 */
> +		urb->actual_length = 0;
>   		urb->status = -EPROTO;
>   		goto error;
>   	}

Greg, please pick this up.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
