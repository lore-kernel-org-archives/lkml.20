Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337059;
	b=CLwPIxQyJrZdgOSLBnfHxMPA0y0PC3UGx3o6b4DXRVOexBOKbFe4aeb71qU+Y2Xfb+k1
	 q16RZNZuz28QAS9m8jyZcsdz+ZuvOIwillxq7lEhDdLtNKouskQDDtqGMNM7i8BYvVKxI
	 Fa5GtmermWeWD3zXthRHCYCX/ivzpD001sAEctRFZctCoy/VMJ6Rg2T/wZt1qLPaJR6im
	 mg/hPRTzYdeQhk0EopEuLcNdZNxYHHfumvov6C9ue/LoTsVXosTYEcr8E4onv3U7bttY3
	 Pn/kkWZaf7ioaW/TleJpPEdmNkDxMLVNKXqInWaxj7FdW+LlwB5jG/8r1dyG2recVgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F44G6NiajqxZ7LY4zOFREBPuA+6F4QP2b192ElDEILA=;
	b=toeBtqjrRTqC24gXgX2RbnErdmNOCrUm+MGKLN1dripiihvVG87m13/DUiTWOEQ1EYfT
	 18G5yoN3RE+u01u7c1QKFPWrUtRciuiBpyJvw57FVc+koiNUNCcaFH34JFwuX5mHlVmIT
	 rknLsgZq9tHZSFYShoinRt/dnSbAEjxNLtLdaTq4I1wlK0ZvgAOnoZxVtVgq63CyuPKa5
	 GWCxluLUzqv9IGW+kywgxplayWH/3lqssIzkA/sAVcqqxNpcmFtZ1OHC/aZqiXkREkq2N
	 A8GgiZNe/ptSb3i6G6hC2D9Bf8bem7NocD+gjEXKptYEvZTReksj/avjxPQNegFD8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=YVk3b5RT;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59698606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59698606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=YVk3b5RT
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-84e513877a3so2084485a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794337057; x=1794941857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F44G6NiajqxZ7LY4zOFREBPuA+6F4QP2b192ElDEILA=;
        b=YVk3b5RTrTjvOyVHq/Highf71bYeoZjE3b/4aw8G9MmwPDKXRLtA6xIWRMw8j0dJjn
         z87uU+DQtclSaQKiwkD1fdXbK0gy5Xvlz6CV+oY3mwGJfBaTpswlDq88G8RPdJ8di6sD
         Bobzl/LauCJ69mH5+WUC/N9ynTY1BX2SqMZKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337057; x=1794941857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F44G6NiajqxZ7LY4zOFREBPuA+6F4QP2b192ElDEILA=;
        b=z44KzWGSfKWsYqIPg7EuugT38rOuzKc/WpK0M/X/H54PeQp9duE783fbJCLYNPOpZt
         PTA1QtZTL1Quo7aX1ADYzA2rH8658RVz9rqCufK8lnXRgxSK/JVP8/X22MfH/bn77hKK
         hU6tvuqJJP8LxGZ9JzkgpKxu/DTwC8vXI2fNBpjf9yukMv9a55aY06VnncQsBiPENsBY
         sMJuMfwcumRKmsb/EnGDG4Q3Ki2/7rKIRfQoELsqIOj5aU7QphxqF45btTi/WxZQklng
         2cqNfgpIRBlF9le1FFokKQNCMIiavPctFSnbIGWgUs/l63yR6PXYFwIloGxZNrCZGkvB
         7QmA==
X-Forwarded-Encrypted: i=1; AL+hErHzpUSdQhxiQKBaSw6LXFVqbdr+sLg4rCtjFN7GuFFk8xFL/vKTOKbI1QYxdgKnbLZ0lAns8FmL8+LMQFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PqNrDPXE4U4NmAp9l7P0GIRa3i54j/0CQv5QHwrag6H6aq3in
	X2AAYn+V6LErhcrL7oLbXETUnqtYAnSH5vdc6oudkr9TcrEyoSUHtflG5uR87pXg5Kw=
X-Gm-Gg: AYBFou2gf+Ows6JZTHnkMQ+EMQ/TGSklN7a4gOj4ncFC0MdNjM7JiaHsr64giluWM5K
	wKGLprb25xEYPnVIWWwZRXFBf8CAwW7eOhSp45EoeVsZkK0QajapJNRSeNrfej9Je70EXQJ6siv
	fAFIZTAa6fkcb4IecHw4Qi2pyqhZnzxnEVWxfsCv4YCR2AoU1RW/gV/zUP72jCIEEurpEu1wJUC
	virZ3yWwfUs/9hLGlD5M8Ds7F4ojF19OKHU+8mtCFpoQPz36W103gAig0yGKwx/51LRkB6bYHAe
	byscIvg+++Q87nff/pY6zINKkDs3ut4VRuTyJVn+OqU4miGIGQB593D8ak5Al/eaGFI6kZovMzP
	gYh+QUgczFCgdmUfcAqwgBtRuIAruwLi31m2paOcNvvc2r08nsdgBGcPNfPJsYmbWutdu/xSkOa
	rNkMxV9/Q/g4AkwKCnr0Tz0M8VCXBxsVrqxQ4nWkt5trY3Rn4g9RK+hzBdh/QRsu7daHYjaW+Yp
	fiLQSDQlvGSiPo3oQfXZW4/cFBOzm0Bpb6LUfTunFQLcN9+Ol73kxdctVOzjlhwTHRFLYJ4pv2u
	UzB6IO+CDKin6pIwLkpHWfn6KjP5uBobfuYZwHM=
X-Received: by 2002:a05:6830:34a2:b0:844:ff9e:d9ef with SMTP id 46e09a7af769-860f02d26e9mr227646a34.11.1794337057282;
        Tue, 10 Nov 2026 10:57:37 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dca41c80sm2565169a34.3.2026.11.10.10.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:57:36 -0800 (PST)
Message-ID: <3648026e-e93b-4543-87db-e56020770831@linuxfoundation.org>
Date: Tue, 10 Nov 2026 11:57:34 -0700
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
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
 <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
 <179333358668.2111112.12827497703998022783@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <179333358668.2111112.12827497703998022783@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 22:13, Cheng Yongkang wrote:
> Hi Shuah,
> 
> Without this change the URB is still completed to usbfs, with status
> -EPROTO but with the peer-supplied actual_length intact:
> >    vhci_recv_ret_submit()
>      usbip_pack_pdu() -> usbip_pack_ret_submit():
>          urb->actual_length = rpdu->actual_length;   (usbip_common.c:471)
>      usbip_recv_xbuff():
>          size = urb->actual_length;                  (usbip_common.c:849)
>          if (size > urb->transfer_buffer_length)     (usbip_common.c:856)
>                  goto error;  /* rejects the packet, returns < 0 */
>      urb->status = -EPROTO; goto error;
>    error:
>      usb_hcd_giveback_urb(hcd, urb, urb->status);    (vhci_rx.c:107)
>        -> urb->complete(urb)                         (hcd.c:1657)
>        -> usbfs async_completed()                    (devio.c:1911)
> 
> usbfs copies data on reap whenever actual_length is non-zero, and does
> not look at the URB status:

It sounds like fixing usbfs to check the URB status before copying
sounds like the right fix.

Changing vhci to zero out a filed in an URB that it received, itsn't
something we want to do. Why not fix this in usbfs and that would work
for other invalid lengths?

thanks,
-- Shuah


