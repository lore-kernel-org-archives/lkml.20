Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523389;
	b=OzCQS+rYawACgH5KZWqEF1v5q/5XxhALRpH9jDP85NGHbnW0xVA3Szy8/IZywH29z86+
	 V2hJcKrBCw9jrcjSVFpB6oxP7UPxX4oQaT26g9SBwFYJ1RoLXvVqOwzY+qFCqCYV8GXIa
	 mQx5JaxIHFoSTjqWroXfI9lXvkRNbtQkuTmq7QzFlM1RGGMA9GYu2uYXAYQv351gcOyRe
	 ZW+rQP2N2oAICuBWCvKqJxIQ9/dmeqNldVJlgkkM5rs5gQGuRbVc8ATdGERHg7wXe4Wx/
	 Uc3eSP+8c2PbwSGBpi8TOkEZerDOG8UDdg3PZ5eb2t2d+YBGmwsOuwfVmHo5cW4Mgsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wCaaAge3cM/XhxhpSkdSCksiqauk2dfp6q6vtBYhikQ=;
	b=c0F2S9+NMGM2WPNLQbiwJIGIATgOEPqckWUXGMPwE1/tpHwldfTroZ/TMwiNqOlTf5xH
	 NYOpnbp+kwrfc7nlq/B6S+BdFLhFEd/Y3JXLLjLPrEKgA+2rKlEoYK4MnTAur4vsQ3fso
	 8U3ZjOA1w4tiCZYyHFJHgWT68XbvVY7NIzNhWh12z+vgkjLt+sps3yLWL/mC6BibZwCGF
	 MQ9UsCEbTJBxEdvGg5pCtqTVC5GRafPMP2vxG9OepH2FHyO52jwMBh8wIVfCVaphmi+wB
	 tTvKy/CxATewlZx+gc+74qjoqmgPxiXt9NOXoGSr6bhWl1p9HOO5eJD15EHFZC0mAEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eDwDj0qH;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2636B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2636B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eDwDj0qH
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-86156cf8a7eso928118a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794523387; x=1795128187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCaaAge3cM/XhxhpSkdSCksiqauk2dfp6q6vtBYhikQ=;
        b=eDwDj0qHuHsyjDj1H4jVJgU/+TYQqgx59VsX+h2U3AOWBjgrr4HCswaOMuqyccknSj
         VFX6wS+UfIbc8bzU6kRP7vzl+FBL6ydQQyjrfaqRehErkY5KirZHLpHIZhbk+AyuMrj7
         HugKOOKpX1PCgkV6aKlkeOMNG+5zpCyKBzaPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523387; x=1795128187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCaaAge3cM/XhxhpSkdSCksiqauk2dfp6q6vtBYhikQ=;
        b=eRBDlr8lwEcnhoSBneE+iWIjpFbwMfFST4G6eu7IYJVUSt9YFvLPKK1wVw6wx5my5W
         Ua/Pkc2PxwA2JyON+l4pZfa5SP6V+JFxl89U4xyLmum8kqoXZrw97WgeWerHAsFxQsTy
         gf4KmNG6/63nMl7Kxlmx/OxhDZKPwkDKR3Kx85z4Jw/QR7X4JqOv7g6o+jnjmV2aStbF
         /IHyxLQd8rwawNu+Y2Ya/gUiKbu2McBh7dEghn8i88WNHLklAtw3aVUnBXt4YDPagFmp
         jKLf6V3RfmaAez1aD8BYHJ1qUHuEyyeMFzahUnSAiTwtMcB8WfkonJgW9pAEMCfRM6fL
         E4aQ==
X-Forwarded-Encrypted: i=1; AL+hErEETXOSke/GtXv2khcK0QejqhdDEFl7YiWERmEaXsDvaLDW67DZ/ms3T9NqwZBP96cHetm+Zflsjxbu2fA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VaukgMIjWZl+iZBZ5/5oxrZ8hdkAtIt41jz8V06+/3oIs+REr
	bk1mODwWsqXidb61/Jj3rA6KR2YUeOaLAK+G85J8wB9QjvexlyWj3PxXPehZLQ/YJ8o=
X-Gm-Gg: AYBFou0W9ZzYnlWKLAbrePSolrzLlxvWWgZVkLM2KYNwC+G7dtuYLh1uCzgqvqdTwcf
	b/VYG5qeI2lNdfgdkdNfsiztEOAHJDesC7Qxeapjue4GK3pdfm09uzumuB0w7UkocHp90z80B56
	lfIdvle4bjUY5br18MCRHQ1lKaoT8lwjwYMQ1EdAE7MToYj5w11ZbpaLNZiE031+qfwjTYAVWRY
	Ioi6lKu0Q89Iy+Owg79z9eqIpMAKTNw3cwuO55CMBhw1meoEvRRBHeA9xlCzssmMbXsrYDXPbCl
	V4t6ss3PpLHF+MLPw9XUtfIY84y9I85zayXw1wr46GbIQKpvrGqttM1EHDxyK/8zqEOZCMd+56J
	8YSxNMy3gOYQ1YYNGW7+7bhWgB//REMkwqB/zDBPhbF4/Q2fzGfOIQ/VEa3b1g8GX9HukaQnf+9
	GJNGBJSnivAJb9A+NH8AjmpwKm7HrDgZv9GR9MF0B4O8YvtkR5lwk7lQq/jKXtiil6Iqivx+4se
	Gr6NdIDrhpngcRL4rdT9h2JCAMl7UcL8/ayXFEsvrY2g/AkNe6h6csMVitOjyALOwZXZTREejS5
	gJzq6lyBEJGh+nwmLiAthNNQFl7ywLowYw8E0w==
X-Received: by 2002:a05:6830:442a:b0:845:614b:eab9 with SMTP id 46e09a7af769-86152677024mr2746654a34.6.1794523387032;
        Thu, 12 Nov 2026 14:43:07 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e3d0sm886096a34.3.2026.11.12.14.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:43:06 -0800 (PST)
Message-ID: <c9154293-a804-44a2-9eca-d27d1f6cdb03@linuxfoundation.org>
Date: Thu, 12 Nov 2026 15:43:03 -0700
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
Subject: Re: [PATCH 0/6] usbip: vhci_hcd: fix URB giveback leaks and
 disconnect races
To: Raul E Rangel <rrangel@chromium.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Anirudh Rayabharam <mail@anirudhrb.com>,
 "Brian G. Merrell" <bgmerrell@novell.com>, Suwan Kim
 <suwan.kim027@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261021150704.3129446-1-rrangel@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 09:06, Raul E Rangel wrote:
> This series fixes a set of URB lifecycle, locking, and disconnect
> teardown bugs in drivers/usb/usbip/vhci_hcd that can orphan pending URBs
> and wedge usb_kill_urb() and usb_hub_wq in uninterruptible D state when
> a virtual USB port disconnects under concurrent transfer/unlink load.
> 
> Patch breakdown:
>    1. Protect urb->hcpriv accesses in vhci_urb_dequeue() with
>       vdev->priv_lock inside vhci->lock (matching vhci_urb_enqueue() and
>       the cleanup helpers), and add a !portnum || portnum > VHCI_HC_PORTS
>       bounds guard to both vhci_urb_enqueue() and vhci_urb_dequeue().
>    2. Track whether an URB has been moved from vdev->priv_tx to
>       vdev->priv_rx via priv->submitted under vdev->priv_lock, and
>       complete unsent (!priv->submitted) URBs locally in
>       vhci_urb_dequeue() instead of queuing a CMD_UNLINK PDU. This
>       prevents vhci_device_unlink_cleanup() from freeing the unlink entry
>       and orphaning an unsent URB on priv_tx, and prevents CMD_UNLINK
>       from being transmitted before CMD_SUBMIT on an active connection.
>    3. Clear vdev->ud.tcp_socket under vhci->lock and vdev->ud.lock in
>       vhci_shutdown_connection(), reject vhci_urb_enqueue() once
>       USBIP_EH_SHUTDOWN is set or tcp_socket is NULL, and drain all
>       remaining URBs on vdev->priv_tx and vdev->priv_rx in
>       vhci_device_unlink_cleanup().
>    4. Move the URB_DMA_MAP_SG clearing from vhci_recv_ret_submit() into
>       pickup_urb_and_free_priv() and also clear URB_DMA_MAP_SG in
>       vhci_urb_dequeue() and vhci_cleanup_priv_list() so USB core does
>       not call dma_unmap_sg() on unmapped scatterlists on any giveback
>       path.
>    5. Allocate struct vhci_priv with mem_flags before acquiring spinlocks
>       in vhci_urb_enqueue(), and return 0 (with VDEV_EVENT_ERROR_MALLOC
>       triggered) if struct vhci_unlink allocation fails in
>       vhci_urb_dequeue() after usb_hcd_check_unlink_urb() has already
>       marked urb->unlinked.
>    6. Serialize vdev->udev clearing in vhci_device_reset() under
>       vhci->lock and ud->lock (dropping old usb_device and socket
>       references outside the spinlocks in both vhci_device_reset() and
>       vhci_urb_enqueue()), and reject URBs from a stale usb_device
>       (including address-0 requests from an already-registered
>       usb_device undergoing USBDEVFS_RESET) if the same rhport is
>       re-attached before usb_hub_wq finishes disconnecting the old
>       device.

What problems does this series fix? Do you have reproducers for these?

thanks,
-- Shuah
