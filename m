Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99209388E60
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414138; cv=none; b=Xodn5s++FJKOdwwTg/wgGW1+rbnGLhK1y564a5ehWnrt1UyPyNLhCQAb9o+UVCv8Hzn9YwFcjPgfxBUg9O3ZltqNBjW1OljiKLMDKWmvOQ3FwPafaGhp81M7WUfDWGNlZZ6AIRglSV0qEniIsWk1OQ2S7p9AgNq1owR8y+ibP7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414138; c=relaxed/simple;
	bh=5OtJlbo1g405q1D1BITxmn/8MyRCpCH3TkKVn6gDP+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbbvExoLvdKordKfMaJ5yDMFfE+sz/O0/fEXFmEyPg1qUQQ7p8f9VCmz8AiUkXKCZtMxPlqNTzoCrwXKmZtaRQWWE3QGMgNiMjSutXYzdbl+1VZv4mKpMxVSom7WP2+fsycC1WhDsmIi/I+ZYCn3HIXv60qQKVxvQRFPRyUcH5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AgHhkf/+; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AgHhkf/+"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-855c26cf490so23033037b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789414136; x=1790018936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9YxMJU2uyU0a0FLYWALkWE9MV7WU7H3DtorqV6/NVsg=;
        b=Y/SKnadX0BaOQRXo3rGi0D+MAlp3nSgqJbXDoPQ/3McPet+A6zMmrMO4k7sNyped2P
         Lor4U143Z5g1NHZRoxWZ2A594fjPN9Xx6uSKBt33Rpw5v+bSzWWGhKhEzVoRk0MuNB02
         6kiRSzC90v/JxXNEj121seq4z227hqQuUq80cpEBPS3QRt76iYWs9JmeN9lyGdJyHfw8
         XyqdOhBKPCC/JfpaHiC+l3MNQf2BHibMDJNJNXfYzQC9myuzKBje5Ao+m27BhJbF/4O9
         I1Y4Dmfgg2qRJKP+m9OLjcRXTzh0pfwNcYA4DcFm1n2fntwghy5E0HBiRPakLMT+jbDO
         GPMA==
X-Forwarded-Encrypted: i=1; AKwUvBwzHVgH0dFSkP0nMj9pubi7WOr00kMhp8PwRgNLDHyC7pfPbEfs08n22kqP7soeBcscbnLcXzDboJyrXks=@vger.kernel.org
X-Gm-Message-State: AFuF++m3F3udndPIS5u4Vz0sYOO12i3G3vQ0pKLZaP7RKHiqCjJljTxZ
	4iDZEJXqlyer5S39VgASgFy5Av1kqO8mtBrHrz6KvGuhCoo4d2O2Xc12s8zyOKMVGk3ZVXO/MVC
	HLxImmL4CQexcU6LTl5eN+T7+X4J1ozLWNOeXm+Rxd9iqTG2JZ1Y/vAXgXmZOVHH/qqPj1nkqxR
	FCmCJ/Ge/1d4IX3xUsjfrAPXuHicdZ420dsaQ19evLmytAZbI13dnJeuxaXh6sGRNjaOauit+KF
	FX+XH2ab86eicBlZA==
X-Gm-Gg: AYBFou287sjrwUYoBP7oGddwBxfn2cQ1h9OhWCEEdfRbTKYFJGcW0ilzXjudaLc8GKV
	gKFO0YGlHNGSbMtbicEfq089gciklyqW07AKv1PbTzkLG8xHXjFudTJStHTbQYi7V2bAkUei56i
	ATwLvQT0gNIvTYHSp0pUsxBqBcpbXaz0cZcb0qfP8lbxGySqaenn6hEYoSURbjA8muuoA44cq13
	nrrxydVlo0RPW9nuWW8JYCvEkAm4j2kvdslns5u7Mbrsgdcdyx1tcaJiustec/hIZIuFI/qEH2b
	EMdvacFrh9bdAbaKs5WrjtU7pD4LF9bcgghc9iz26N1fEc+S99ZZoki9GclzWX5FZ20Me5Jh081
	YA63QxXxk/Mu4yS+gLFhdQbrfF10PBVIAOC0QSZOtLD/APB3BFomdMwIwfSYk3iX659VpyREJcc
	YGnj4tJjWP8+TgVty1e4nwrYoWx7w8Bl/fQQ==
X-Received: by 2002:a05:690c:438c:b0:873:5ddf:d860 with SMTP id 00721157ae682-88d21843151mr11099127b3.43.1789414136354;
        Mon, 14 Sep 2026 12:28:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-88c5671402asm819937b3.14.2026.09.14.12.28.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:28:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so2736056a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789414135; x=1790018935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YxMJU2uyU0a0FLYWALkWE9MV7WU7H3DtorqV6/NVsg=;
        b=AgHhkf/+1ACEf5iQfuxP5grJtDB7FYBC++zuoGrF1SUFEyW/zCINhDNLO73g1JsuEA
         Q21nXSK8lY2RNI/ZOnWRUUrZ45lVMwQy8OMx117RPm9Zj/L2EXLHLkateJrNVeGmcwAF
         e84rbE6wBfJsIr/cNL1udKTwdxNGdqRmBvD20=
X-Forwarded-Encrypted: i=1; AKwUvBxlak9FbQgC+oQ6GG4+jmqnqbz1o6ANldeOJE57/IwGH1+XRAH+WC2uPhu0cguzT3xfjpBmDCpE/bWjty8=@vger.kernel.org
X-Received: by 2002:a05:6a20:7492:b0:3d3:adbf:7777 with SMTP id adf61e73a8af0-3db40575ec4mr8180453637.19.1789414134972;
        Mon, 14 Sep 2026 12:28:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:7492:b0:3d3:adbf:7777 with SMTP id adf61e73a8af0-3db40575ec4mr8180371637.19.1789414134382;
        Mon, 14 Sep 2026 12:28:54 -0700 (PDT)
Received: from [10.14.5.171] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm31155602eec.17.2026.09.14.12.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:28:53 -0700 (PDT)
Message-ID: <059e9e23-418b-4779-b959-06336f9b18d1@broadcom.com>
Date: Mon, 14 Sep 2026 12:28:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: bcmgenet: restore the hardware filters on open
To: Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org
References: <20260913190052.939955-1-nb@tipi-net.de>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20260913190052.939955-1-nb@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/13/26 12:00 PM, Nicolai Buchwitz wrote:
> bcmgenet_hfb_init() runs INIT_LIST_HEAD() on priv->rxnfc_list, which drops
> every rule off the list, and bcmgenet_open() calls it on each ifup. Every
> rule the user configured is silently lost:
> 
>    # ethtool -N eth0 flow-type ether dst $MAC action 0
>    Added rule with ID 0
>    # ethtool -n eth0 | grep -c Filter:
>    1
>    # ip link set eth0 down && ip link set eth0 up
>    # ethtool -n eth0 | grep -c Filter:
>    0
> 
> Initialise the lists once at probe and restore the rules on open, as
> bcmgenet_resume() already does.
> 
> Fixes: 3e370952287c ("net: bcmgenet: add support for ethtool rxnfc flows")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>


Reviewed-by: Justin Chen <justin.chen@broadcom.com>

Thanks,
Justin
