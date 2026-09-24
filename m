Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABC7450917
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244479; cv=none; b=McSX3FYOuY2ELzbI32VWX32v73C+DGzF/RzeLj5fFYDIj0Wir8E7N7Gvq2UWThFxhLXPV8eDj0s5sysZSYrfE9oU9KhlwqOwhvR5CAcZvJIo4VbxXYZKuH8fh6pBPOSXPuzSKafSqdu6Cwg4Wv8QZlkoBtwMoD64Fda7+7LFbQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244479; c=relaxed/simple;
	bh=oPILir9HN5MgKg08aglNg67+B4awsfF8aWsxHEYQyfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuGbWD8daRxEKYF2L1KhVK0MlX4LuIsmLl0yRmEumwhoPBXaFAFDCOA8+83YGdPB13uGelKUjHCSty+wZZyy4RrvwcoF252MC733RA4U5v29PfaXmB82GWHLXkVjcR+dDzXbdfwbX131wPFIh+mo0zcDI5EDNXT8FTIPA5ZEbpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aCTUEzVc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tAdCk7sB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aCTUEzVc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tAdCk7sB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790244461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RSjliNhO01y6ukOqtQMKm+Eso5qszoHcMLKfvGQmCdk=;
	b=aCTUEzVcLTM3XCzoKEy8y3VulNZTuuSRzzRMDE4seAUIr0cLYI4MLCZpzqEae8nsFaXsKA
	vLie0GYguULr4/jafeSsuTRdniLticFWV8VU1DksVKRFkEdxQ5ArjddREFBYzigBmZK1uk
	fXTUcmKexL+jf01QwOfD9Ig4pj575/Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-o5SnDOjrOE25Zyxcs2Z85Q-1; Thu, 24 Sep 2026 06:07:40 -0400
X-MC-Unique: o5SnDOjrOE25Zyxcs2Z85Q-1
X-Mimecast-MFC-AGG-ID: o5SnDOjrOE25Zyxcs2Z85Q_1790244459
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-486e90b59a6so1089046f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790244459; x=1790849259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSjliNhO01y6ukOqtQMKm+Eso5qszoHcMLKfvGQmCdk=;
        b=tAdCk7sBw2nECCbqlxxniD1gnGwLnT66RJx9BqzkO1/GkvZQyt4M/3yiX8/KknM6M8
         7vV6ZHF8jev0DxYNvTANWHrevbXKpS6M4R4kDjlEU6RZM3Q+7aWzbSpOolpKdfU474f0
         YHVUI5hH+QvPV/JF+96neaBwqnlLw1gGp/gyVHIoziKEQVwkjhKRIisGL2AV0hlVHi0i
         1feMl1xxH+aKYhmouwqFWrEdSoIrvXH+2FcuEGbX8qayHcL3siO8BsKBNFTehwo8L+Wd
         AOYdpIXKsHs8R7d22wnbR23jtO4tiO05fNi5hwWbc5QfbkwblpYxtPsVZo42O05O+mWc
         ad7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244459; x=1790849259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSjliNhO01y6ukOqtQMKm+Eso5qszoHcMLKfvGQmCdk=;
        b=yL7p/lHAv6uXUqjXYdEmPKZWsg5ZykJyZVQcORwO2Y0aKWokazk1SyE6tpB3sNGD6k
         wy91lZD2b8CqVOhq14arHtqCE0gA5NG3yyi+4edDp1qVvVvc7Hqvxxkc2jOZP4a9CPMD
         b1L9ty9rPS/rm+vdR+UiHvUutKQy40Mjr2r9CyjBh8kPewdUvuQ0hBGH7H/71ZVZy+cZ
         t5GyaOJjzxP7rd+zU/7yXR1+YI7PGFUhg6XXwUL3IR93MN+QYTBPMeKMeMkwHDyMa+WN
         hhWhL3F/XXMtpIBtUsODHDwc4J7eKFJIFuf51V/aub54Wf9Gx7k/ITyhDXhepksYLrVL
         +O2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxc78oSAWLgLa5r8meUzlWvTnDJP8hDitxYMzy64yMvGv3O0sXvXvpz6ReN2LPDafcfPPKj3aHeyu6gyOg=@vger.kernel.org
X-Gm-Message-State: AFuF++kRy0qOPAFoI6ikr2xmHJ0xw8NI/G3QyMckYyzUhzH0D5GiC1ij
	aretXdjuH7KoYov4HOl/UbPC78pQCkheMIJPh5hyDu6PMRimhjbxK4iRevUN5hS8FIWwGH2r3hD
	FlcmAqAt7p/1n12aYVnRkQV3FsRRvxuv30wHH6xocKl3zV13Np6SIKd/qRcQY8bOUtg==
X-Gm-Gg: AYBFou0lu6iv097CFepo0TY2XVXoHswgxu+z3sBXgvT6W24EmZG8k60WVIys8OAD0+P
	Ng1cVNxmhY38P4i/H1vLYp51O1FjGs+4POXlomJ7T0RLtJ3AVHQ5w6wOYPoveoDgfIaslCiZRus
	wyPxThlTQ5HrLClq+/Nmx1YbZkrLr+yAUPKKmPq5af3B4lZc+VmEZwkF0rC7+amSCBncw23wuhc
	YY3aPNXGj929jDvr7LcOdl8jcdUpitI6zSsYDx82IEpy22UotAMod/3/GUPX1fw89iID2Ri0dQ3
	HMvrOo0DU5ux3GOHPA9ugN+cZHOlFc0/p6cVCqgTLuHxHiJJQr5a48JKFlji5JcQXKEHz7Vnewv
	bZShsKXn9AVKgqBcHAVvFwXdSWPsRZ7Nc15ihliACsoOyMyFytDrN1G24b/u9AGAZWQoBFYYwaQ
	==
X-Received: by 2002:a05:6000:4282:b0:486:e9ab:2b86 with SMTP id ffacd0b85a97d-48871759fd6mr3193146f8f.39.1790244459285;
        Thu, 24 Sep 2026 03:07:39 -0700 (PDT)
X-Received: by 2002:a05:6000:4282:b0:486:e9ab:2b86 with SMTP id ffacd0b85a97d-48871759fd6mr3193104f8f.39.1790244458892;
        Thu, 24 Sep 2026 03:07:38 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm14003920f8f.23.2026.09.24.03.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 03:07:38 -0700 (PDT)
Message-ID: <c4f88f94-67dc-4d9e-8569-4e8db1e150fa@redhat.com>
Date: Thu, 24 Sep 2026 12:07:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 0/7] r8169: add RSS support for RTL8127
To: javen <javen_xu@realsil.com.cn>, hkallweit1@gmail.com,
 nic_swsd@realtek.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918061923.313-1-javen_xu@realsil.com.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260918061923.313-1-javen_xu@realsil.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 08:19, javen wrote:
> From: Javen Xu <javen_xu@realsil.com.cn>
> 
> This patch series adds RSS (Receive Side Scaling) support for the r8169
> ethernet driver, specifically for RTL8127 (RTL_GIGA_MAC_VER_80).
> 
> RSS enables packet distribution across multiple receive queues, which can
> significantly improve network throughput on multi-core systems by allowing
> parallel processing of incoming packets.
> 
> Key features:
> - Multi-queue RX support (up to 8 queues)
> - MSI-X interrupt with vector mapping
> - Dynamic queue configuration via ethtool (-L)
> - RSS hash computation for flow classification
> 
> Experiments:
> Platform: AMD Ryzen Embedded R2514 with Radeon Graphics(4 Cores/8 Threads)
> Arch: x86_64
> Test command:
>    Server: iperf3 -s
>    Client: iperf3 -c 192.168.2.1 -P 20 -t 3600
> Monitor: mpstat -P ALL 1
> 
> Before this patch (Without RSS):
>    Throughput: Unstable, fluctuating between 3.76 Gbits/sec and
>    8.2 Gbits/sec.
>    CPU Usage: A single CPU core is fully occupied with softirq reaching
>    up to 96%.
> 
> After this patch (With RSS enabled):
>    Throughput: Stable at 9.42 Gbits/sec.
>    CPU Usage: The traffic load is evenly distributed across multiple CPU
>    cores. The maximum softirq on a single core dropped to 63%.
>    
> Other Experiments:
> Link: https://lore.kernel.org/netdev/0A5279953D81BB9C+f50c9b49-3e5d-467f-b69a-7e49ed223383@radxa.com/

The API usage changes suggested by clashiko on patch 3/7 should be IMHO
be addressed even if marked 'low prio' (IMHO clashiko mislabeled them).

The claim about the fixes tag on patch 5/7 can instead IMHO be ignored,
but on the same patch clashiko reports more low prio issues that again
should be addressed.

/P

