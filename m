Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412583;
	b=znrOWpowttoJ29r7/BT7ddadrP3JQ0mNGs4ipSIR886baOvvSQRcOPbUNEGINTsAzC3O
	 r0UXa2q1uPPaLcie9eQMyaghRzCTdNwNycOqVwkdN7z5nASU82dqqpeLWYtTebzXVhA52
	 zcA/8z+MGhKOe3R/2trMBXSZSOz2JI4JkNGEfZKLvWgxeI8fdKBlHILVdx4K+fdTBhuku
	 LV5TliFtiDsutAkCI7IMMWA2L//TSVqnLqybf6Q2mW4I49J98EhQc5f2/j1xQs7cq3jRE
	 exr4N79xHw+n7xrPTeSgVKSAb0FfGmshju4gRDOIMGkyMWDMFcYwk1KapMbk7m/eU1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y0UAXs1+0nAZfPmRj+PFNvx6nKwxNy3aasNLrMSA9g8=;
	b=RvT/hHJoaRdReKUr+ta20b/mUCwSwrfLDpZKYXJXvm/JeBpoQLCk8iBMFiakboC18KyL
	 oMK3BE8/7PsVm31bYWJzh5CpUJocol0DBYzj6iy70LBQ0k/FTLbarPR5HZLeE+nputNyE
	 Ig5apUKXx2fgkHxaBNAO5Lp3xLW+VmZivo5L82atmMQpy+VuvNWISjyVg8PlC07u4P5dO
	 kJAQFIoYdBEmIys6enp/6LT0Ct2r7iQmYWYxmSQ3jrukhJ410Zvxgi9aVqQrgbj8yh7PP
	 VY/zB19rE8x3NRoQ9T3MF3jOIIQfMc4p8ck5osSsQGLZo7anciGlU4LoEl/BgPF+pIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=XON1dO3V;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D4606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 321D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=XON1dO3V
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6f74f6b46abso1410987eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794412581; x=1795017381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0UAXs1+0nAZfPmRj+PFNvx6nKwxNy3aasNLrMSA9g8=;
        b=XON1dO3VFm2jKu5PlDdxw00zEK4dt2fLz3UFu8HgZKpOdAqpRJJJ9v4t5/3Fw3NbN8
         BWJhcKOZmvI0fyDMFBy9N6xbEdaBhHBaaxnPVwtgsW156bPo9b1afNvP0U+cDcKY+WpZ
         hGrRZe1orfh+wlQ/GfJwS/JPAxZAi26vTqygI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412581; x=1795017381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0UAXs1+0nAZfPmRj+PFNvx6nKwxNy3aasNLrMSA9g8=;
        b=CN9YFHEwS+PfMl6ppkTU3aRogv/+eBSQISlA5dISkyhq44W6zll5tL6gcaHp5tBipV
         e2DR6ZpKeeTiZiDKjEG4w4xZyoWV1CDE10JGoh73KEurII9ZiDzshLjJ9oZStGhtM/ld
         qQgTzvKajRYA3RgHYt4Lw4lp/7K5tNlOi5mBL5YCYplp+L2pAog/Nl2eqqzgzExbtZ0A
         gHTPI8iJuXVet6FETiTsPbjWCV5Tn7CwCIvVUDPXcLi/xBZYCxaswHl0ksSDp9rLNfkM
         g9O+7OU6q2WLSWofcKUwEs0RR/ri6avkuKUf1gn1dV1pDeSvOvIa79daJJisKX0+7Ugp
         Qgug==
X-Forwarded-Encrypted: i=1; AL+hErFHxLzICtR+CNcwkdnzKRw0Mnd03v1BNqxPOSz1t9taKMla20U1z3fMa+BZlbzvnjxq0wIrc0KeJ9o8gPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CkGz5yYfZTOE2DU+PLJAWhNMhYLawREuo/6qdZuX/wcGgWOry
	1vJJbUHg0a6tH7DajxXHD+idv/bzZEb69MDwqrrF7gKPvVXLCXZvP0PYwi1S33XZqnA=
X-Gm-Gg: AYBFou1eGqySuwrprJQLvkWg5cOIXy3X5sSJM8g/pUh1CDQh3YiMBUNfW7NsJgMw6lk
	xNfT1vjp7W4oYXeUnx9D1JTIlk1MNdWxnFsBnajBqPmHaD0uaBcoNCxjrwY9eqPuR+UhmGzHOfV
	dgGVMRMFecos519nV/CHrdHKEIjFKiVNkfOWpsE46x3MMdmV6vUce1/YDM2kyfeOCCxPkC0xxpW
	QPFjBaNm3UMTL7hLW48Uqx4fIkFcfTL9W3htJFsFujcSbCfaPI59caZMIwprZMtbYXIO1uT+VJZ
	3KEduFx8tByxHt+/8QMRT3j1HkF/UMuhw/1JiRLsYP4sotdraooJFAmf9t1z1lUQptS7kCtUQcS
	dktUVJ6z63tQC6pVANConMswlQGak7tYCGcHIXDHuNdgVovDptmMb3FhGnwAujIOCLcDiWFtspf
	zFj1wgvYxRAYbHztA/Io0kEgmufWN51Tg4xsmgg4eudRTTL+bkOsjIYCpv0OsCtuNjD6KJTMExA
	Nk6ZuBLdjjCP/gyyZV5yuQnCwIMyMF/O3nkBsiOCHlnDUo6VhUHRQs1pZ7gNMR2SPyDD4kwpUal
	5UGl2ewA8I6DT1vQzpU18GedHTTDjD8hbS66Tg==
X-Received: by 2002:a05:6820:7708:b0:716:adb7:3f57 with SMTP id 006d021491bc7-719179f72eamr1482448eaf.86.1794412580991;
        Wed, 11 Nov 2026 07:56:20 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc5e1csm4926122a34.14.2026.11.11.07.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:56:20 -0800 (PST)
Message-ID: <248619eb-9164-477f-89c0-f391214cd273@linuxfoundation.org>
Date: Wed, 11 Nov 2026 08:56:18 -0700
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
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Cheng Yongkang <teel4res@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
 <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
 <179333358668.2111112.12827497703998022783@gmail.com>
 <3648026e-e93b-4543-87db-e56020770831@linuxfoundation.org>
 <94436653-ae58-46c9-a2cf-241231ac8eab@rowland.harvard.edu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <94436653-ae58-46c9-a2cf-241231ac8eab@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 14:29, Alan Stern wrote:
> On Tue, Nov 10, 2026 at 11:57:34AM -0700, Shuah Khan wrote:
>> On 10/29/26 22:13, Cheng Yongkang wrote:
>>> Hi Shuah,
>>>
>>> Without this change the URB is still completed to usbfs, with status
>>> -EPROTO but with the peer-supplied actual_length intact:
>>>>     vhci_recv_ret_submit()
>>>       usbip_pack_pdu() -> usbip_pack_ret_submit():
>>>           urb->actual_length = rpdu->actual_length;   (usbip_common.c:471)
>>>       usbip_recv_xbuff():
>>>           size = urb->actual_length;                  (usbip_common.c:849)
>>>           if (size > urb->transfer_buffer_length)     (usbip_common.c:856)
>>>                   goto error;  /* rejects the packet, returns < 0 */
>>>       urb->status = -EPROTO; goto error;
>>>     error:
>>>       usb_hcd_giveback_urb(hcd, urb, urb->status);    (vhci_rx.c:107)
>>>         -> urb->complete(urb)                         (hcd.c:1657)
>>>         -> usbfs async_completed()                    (devio.c:1911)
>>>
>>> usbfs copies data on reap whenever actual_length is non-zero, and does
>>> not look at the URB status:
>>
>> It sounds like fixing usbfs to check the URB status before copying
>> sounds like the right fix.

Cheng, I missed that the you sent usbfs patch to bound the length. Thank
you for both patches.

> 
> No, that's not possible.  A transfer may terminate with an error partway
> through, after some data has been sent/received.  The URB status would
> then be a negative error code, but actual_length would still need to
> reflect the amount of data that usbfs has to copy back to userspace (for
> an IN transfer) or tell userspace was sent (for an OUT transfer).
> 
> In general, the USB core relies on HCDs to set urb->actual_length
> correctly even when there was an error.
> 
>> Changing vhci to zero out a filed in an URB that it received, itsn't
>> something we want to do. Why not fix this in usbfs and that would work
>> for other invalid lengths?
> 
> HCDs are _supposed_ to set the actual_length field in URBs.  It's not
> a mistake to do so.

Alan, Thank you for weighing on this.

Greg, please pick this patch up.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
