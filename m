Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384255;
	b=1PiFzT0ja1+cnt3vwGdFQYpHJSXDDM/kYnP7m1zFIDj8TQmIXCLfq7fZ/oLydsuF4FIY
	 +9cKThngSZawa1sGBzouTseciFULcqLZyBlZRS7Vb9I1mxbugsmBPl9DpRZg2qncgB8vs
	 BYaMoRz+P0T1H+cQE1X897mo693zRAhc+OY9jhVmL4G8K6gyJqn9csnXgDvsrSOdp+GMj
	 AJk5BiGzeJaQtkFYFT6VyyeVlzZMa9Fa9274KHgKJmkMchFtXS5j+1MYC180g+DAdJof9
	 dT0uLqTa804B58Bc23J2x3WMN/cGcWHPXOk+0RT9KBykWOJhD5tdihTf5EJ2QXfUd+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=P20Sssx6yjJUYGIDtxb2MekE1dkGAS2a+bVdnxR+A5o=;
	b=Vxuw7iJfv6eZzHXkVJ2BuGEblU046raVsAjU+NzPFcJhb8fltK3PmGiPINgp7kva/Bsa
	 zyvQ8A5w0GRZ3t3rj9L4tciv9kAWbt86xEHllpUBXZ1oAglkk9x8dHYvo64OJW9ukqh6K
	 onfJSvaF+D8jtTkB4gd/cbCd/SSSEpCCT6AehIbatca+Av5tSsqAiVpi9wH4Y7CuH3oSq
	 1JkjkQ61yI4ivihi50PQKNHNUrllApx8a8BmM7XPHQw2TW5LcpYSGGJjgRxlfTuftqngZ
	 hN7yK06AnqWmh7r7o5PZPwrFmgecAqOuHsf8oYX3p7HeZWMsZTG6kb9Yb89Yw6xOkOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTLLsFfY;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8444E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8444E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTLLsFfY
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b060ec084so603581f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793384254; x=1793989054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P20Sssx6yjJUYGIDtxb2MekE1dkGAS2a+bVdnxR+A5o=;
        b=jTLLsFfYXBiUSEMoVtR09XM8GfPg4iYCaKbWo9OruZYbtTBD8ki2MBYNG0cxoUkfxz
         HvLpNotsTw11Oim4hDyO3ulBtyFEzmH2nmaR9/Qh3wT/hF69kSDM/leGwVLP7nP6lw/b
         hgM/UZQ9ASwdyvRKghbMQ0/Cej6v5jziW6BJ3YsHcI4nTSwuP+NI1ZhsBdCgHX4DgJ0p
         c1qIgiaySXMtLJolWetTAFVQFqXJ6B3Q4ayx8d79s1Ir0DRk6LxcD4bVoGq98/KX3XO/
         9AtA1OWVDbTJLHt5VmzfTkJK/O6DonawbhLceu94lpZgBqtwIIEu9sOQRXJzRKx3D1yb
         zlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384254; x=1793989054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P20Sssx6yjJUYGIDtxb2MekE1dkGAS2a+bVdnxR+A5o=;
        b=EYdIMl/VOBK0KluS90L77kO+1AUvSNy/g3OYi7zb5FhvslZ1BbN3ZzzVh+CwTHFYv6
         duLIgN8E5r/EIlNbXPUYJQ6DMJeULAQfp8vN6MflK5i9UCTcTHb5rggN9wStaQgz8fey
         aCk6Vvmz3zqPWkV99+PA5TLwpdM19jozfjGcE1IoDr0y7bjL8RtfJY5BXwg6CugFVxf9
         k1eOzbh08Od5Fi2bHqRTrtLnw713yI8I9Di31GT/MaRVkbtufWd1//1pVvuP7TLKN1ym
         f5qDvTtNTC6+UooIA6mgpcPsfccen4HCE4d8B0zrNgVS7Sm/tb/U51JI0Df14uM3hYR6
         AfEQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3fot5k29kXCKe0mCdaU/dfZCpYbvQMXNWYC0STWCEF1oNkYs8r1/MWfcIzY4jgYXuWZDhsoUCyC1kSVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFkPHykmK0iSzGfw1o0UQ6hEIXS0GYxuihSZjogo/yuMLjuFIs
	nRhYfyN5qpC9scDo4/7j2RkdtCLyAxUBPxjQ29bK+2BkdrIE7mbcuI7+
X-Gm-Gg: AYBFou37UPT8l75F+IcE4Pb/qeB07eD+E1PQGB5HlP3bfwjE/W3VzncOXbMR0v2jEop
	0IkFcYPL7udJs9ODxvhj+B3xmeXOOn2W2NhKWGa1w6xqXG6cOysKqkP1+nlxOJ+/Br4QIGGSDhJ
	Pa7LVZH9o5gr8X/iBqMYgLbwbTgY6ESluQcsc4lLB5HdzCgeKfRTJHEnQwvJUccyl25wFbLG4L0
	Dt2KDmRCg0zf+M7bfmT64gBy+rjCPbfOUjN2HKUpfTch6c03klbcCbQ0x3ozpaOXDZuTs1VCRY/
	RRp5kMt0GSyn7J84uYnVvLe0u4zj3B51cGh3qgxm36FDCW9QKgVFSd9nh/Gvz36Jtmx/lnbST2c
	05OTcuh4xwFXte4WILXxYvfT3uQ1J/W9N1q/MFEKqnAnKN9mNGa+DsMGL8OHpJM/u3vx2BicTb5
	SnWFuBANL0+Y33aYjH53zPAbKLWNwoKMc3yr7ffIVKJad8x9Aga8Aj8/zukkBEmP9OF5hOvrT3g
	2NDsXQamAGTfxBVDT7e2LGrcXyDbnORy2RI9Qx+uGp4V7Om2FXEnas1Z9HacrBpxwfBuk1evmgV
	98geaJOPAePmD+H4jsSmgnqyL3mV/+q+zvfXOskLmFQ+Ku0r86uGqH1iK+OXQaMq2qd3YkQZ0DY
	tbmw=
X-Received: by 2002:a05:6000:178f:b0:48d:f14a:9177 with SMTP id ffacd0b85a97d-48e6e4faeacmr7358484f8f.56.1793384253663;
        Fri, 30 Oct 2026 11:17:33 -0700 (PDT)
Received: from ?IPV6:2a02:8086:cd5:c900:c69f:4b72:77ee:5fe1? ([2a02:8086:cd5:c900:c69f:4b72:77ee:5fe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba5dc2sm4380862f8f.54.2026.10.30.11.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:17:33 -0700 (PDT)
Message-ID: <e2e00074-6787-4c76-a6ac-5e17d37c1e76@gmail.com>
Date: Fri, 30 Oct 2026 18:17:31 +0000
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
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on
 WCN3990
To: shunsuke@nagashi.ma, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 Fabricio Akio <fabricioakio@gmail.com>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
Content-Language: en-US
From: Conn O'Griofa <connogriofa@gmail.com>
In-Reply-To: <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 01:17, Shunsuke Nagashima via B4 Relay wrote:

>   - The firmware sends its ADDBA Request frames unprotected. The AP does
>     not answer them, and no Block Ack agreement is set up, in both the
>     2.4 GHz and the 5 GHz band. On a 5 GHz WPA3 AP, iperf3 to a wired
>     host gave 22.6-31.6 Mbit/s up and 21.6-21.7 Mbit/s down, against
>     280.2-283.0 / 264.5-272.3 Mbit/s with WPA2 on the same AP. A
>     WPA2/WPA3 transition network gave the same low rate (23.4/22.7
>     Mbit/s), because wpa_supplicant chose SAE with PMF there.
>
>   - On 5 GHz, the protected Deauth sent at disconnect carried CCMP PN 0
>     (56 of 56 in one capture). One AP dropped it, kept the old
>     association and answered the next association with status 30, so a
>     reconnect took 24.3-24.4 s instead of about 5 s. Another AP accepted
>     the PN 0 Deauth. On 2.4 GHz the Deauth carried a live PN even
>     without the flag. I could not tell whether the band or the AP's
>     HT/VHT capability makes the difference.
>

I can confirm the same problem happens on a PCI bus hw1.1 revision 
QCA9377 in an Inspiron 5570 laptop (originally installed), primarily 
testing the 5GHz band due to 2.4Ghz being congested in my area:
ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip_id 
0x003821ff sub 1028:1810
ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.2.1-00021-QCARMSWP-1 api 6 
features wowlan,ignore-otp crc32 42e41877

Note that the MFP flag is not listed; I also checked the latest api 5 
firmware and the flag is also missing. Without any changes, the driver 
performs extremely poorly (~50Mbps) when PMF is negotiated with the 
default or latest api 5 firmware, and confirmed to be an issue on my ISP 
router and also a separate OpenWrt router using an ath11k chipset. Prior 
to discovering this patch set, my workaround was to allow WPA3 
Transition Mode on my routers and force PMF disabled on the client via 
NetworkManager in order to coax the connection into WPA2 mode with PMF 
disabled, allowing speed parity with Windows using WPA3 (~300Mbps).

By adapting your patch to also set ".peer_pmf_support = true" for my 
hardware, WPA3-SAE (i.e. with PMF enabled) now runs at full speed 
(~300Mbps).

Further context is available here (not my thread, but other users have 
reported the same issue with this hardware and I posted this patch with 
the flag added for my hardware): 
https://bbs.archlinux.org/viewtopic.php?id=308424

Regards,
Conn O'Griofa


