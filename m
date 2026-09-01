Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83A629BD8C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264612; cv=none; b=WFAUNsnMpGdtDcq2vnJzhzVs7rcl5M4++OkKB16Z54MeSVWYlk2K1++obEptrp+N1za4dp36Krjyg2eS9GHFju6QuUI1oily3yeqH6w9QgSzoOa2TujgY+8Nkt6GjYf3yFkJS1kdKmpGZpb+RTIG4MzR6Wc+jmE7FmiRkoV2HoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264612; c=relaxed/simple;
	bh=pUAQhpIylhH03veS5v2pJ5187OFtExWloOWxSlrMTWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y6YbfXHyze760ul+NtkkLzCD9OOOHKavcxI+o2bXhmJqtGSquyUa+Vpibbk/P8tREeyG3dMR9qm6UuSI55XNQemGoF8v92d7ahVCXh8OgHWaxwsM/ANgIYZzer/OeCx4df1TzGLGorhNiUSg5jqsXk+1pdDt2JtjXRCkorOacgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f4QxjJXf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MlypWCcK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f4QxjJXf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MlypWCcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788264610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fwOGFXieQl813ckc/IUkjGRGe4UDJCJhqZtMy1/kp8=;
	b=f4QxjJXf0UToeGWa4DjOpHdG72g6Su0JJR5GcowOUb527c1TeRb5W27eptul/mMsUJ80ls
	fhp6MGBbEyJ903yB6AxCpY8DAkFowfu6UmqSgAPlJUYHfaPRsJMcC/FwhIV1Pls0HU7e5i
	rTUs+DKhZ5/qiFqIzxrHPg3Hz3Wo9Dg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-u78x63gzNJ6akwVGfdVc4g-1; Tue, 01 Sept 2026 08:10:08 -0400
X-MC-Unique: u78x63gzNJ6akwVGfdVc4g-1
X-Mimecast-MFC-AGG-ID: u78x63gzNJ6akwVGfdVc4g_1788264607
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4843313047eso1830539f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788264607; x=1788869407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fwOGFXieQl813ckc/IUkjGRGe4UDJCJhqZtMy1/kp8=;
        b=MlypWCcKSfGjZY9Eqt5KulJUqs2foa19Ey6tTuqKHzbs+XTIrn6Kff89D6VhhxGpwx
         Pk+QaqxVW2hC/fK5ecRMrEC21EERvDF4Ah8c6IElLrmyTz0lYXuNYIkze1t+xHojUZ1q
         UtgcDDEMTtEmutpZKssgUNSjrDU6dG42m/2PnUaJEMCXDo444Z0+SwccPKAFdp80Lu9G
         +hnraQ4ZPgwgBep6EPjPnoxYv5gg5THpqr6GO1FXat17cBgpfCub+dF4Fj78sfeZvRl3
         BFLNhNO7qPAPnAACXnfrZ6iO79oKZsBHFt3EP1d1XX1btxpP5qVQ9D+a7XmqlzxAmGNI
         OnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264607; x=1788869407;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8fwOGFXieQl813ckc/IUkjGRGe4UDJCJhqZtMy1/kp8=;
        b=erhcomIAsnl8RTSjVlIKGZDFc/CQ8VWHRF6RM01aif93OBEpT5XzPNFOpQl/PSwZIn
         oWy9h9i3xSXjSOjlWv0IiMJY68Hu6SNGw0xnEM2DPUvluJLanHqjlmk263m+M8TZNhN2
         5gOzgP0hG4YLRv11AfQuBtkNhojiGe7E/NZODT3JBLHIfJG1/GQLSgXgv7r/v7DRc3rJ
         gGtuYLAIVUVstr3uUjED77y56UASQseARemC9IOYXzkToBHXWmrGk6J6NIEHt3OcaF7Y
         QQ3+n/AkR7YunGG56fv4RnQ6PfJYbh+R4PXTSonp0s0kA4aAwepkflk5rk7mSndsHI5/
         MYwA==
X-Forwarded-Encrypted: i=1; AKwUvBzuBiGQ0cOov7LMGvuZjdSEn9QGIYB938waG5zB5IvqatSv0u7ze69sYAgTm0eKw1tipKtByGSopRiJQx4=@vger.kernel.org
X-Gm-Message-State: AFuF++mXEaloRKUu3q8BI8qKlkyqSG9KrAOA8v/rdwvo17fvgYOc5j5V
	/AFShP7HWs15OxmjQuSIgxo3y8DcZmrJ/PhMwL07LlvljxrXmad+1yuEf57pJFC04bFy76I40so
	uHOrNZYLP+u7CgjHuNsspYXfZ2zVyGY+Ms6wxHsclhttiDgCXW9qbXDSWaiEO4wBeTA==
X-Gm-Gg: AYBFou3eK8gRy4I0Na5O05kqrv1cvUcFrW6+so5616vyNvZb8Z1L/aXC5pcgV57DIvy
	62CKXjnOStZFq+OYI2v7O/edNrDhis2u9X3IH0IyMxqNqIeVWozzdokmtFlQdGMcCeumsP6XZhA
	rFBstEsSMelBity2glpuXmKkqU8SxmHY46t/1fIImI9dviippBZf5Udlz+hU9MeCAn25er/KOZb
	2F4CpFgasEFk4mejQiLCUptTbkHUL/OtXui1KceoGNgVRuIwBDJPQglisXKJ9SKGSPF1OJPyzNO
	fS+B9/dqj/mV+BNwxaORvm8zC8MmsJSEe4FT7tgGj6sMfFZgQ/EqD8hIHHAM6uNmQtOrNiqSHDv
	fs75f46gv8w4AF4UoqQUY2p2RoaQyjh7M6PI4wQCq9RRC1MHXVCmpbYoqOjsUtkoYTCKswJziXw
	==
X-Received: by 2002:a05:6000:1ac5:b0:484:3785:210e with SMTP id ffacd0b85a97d-4844103cd55mr13006996f8f.25.1788264607272;
        Tue, 01 Sep 2026 05:10:07 -0700 (PDT)
X-Received: by 2002:a05:6000:1ac5:b0:484:3785:210e with SMTP id ffacd0b85a97d-4844103cd55mr13006886f8f.25.1788264606789;
        Tue, 01 Sep 2026 05:10:06 -0700 (PDT)
Received: from [192.168.188.218] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d36e9csm4881021f8f.3.2026.09.01.05.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:10:05 -0700 (PDT)
Message-ID: <b8b6db7b-353d-4d6a-b0b6-3b5e1be22008@redhat.com>
Date: Tue, 1 Sep 2026 14:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
 colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
 raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260828190900.1767611-1-joe@dama.to>
 <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>
 <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 1:57 PM, Joe Damato wrote:
> On Tue, Sep 01, 2026 at 10:16:54AM +0200, Paolo Abeni wrote:
>> On 8/28/26 9:08 PM, Joe Damato wrote:
>>>   - Moved bp->max_tpa_roundup_size init out of the early return path and
>>>     documented that TPA is unsupported there, as suggested by Michael.
>>
>> Clashiko quite convincingly elaborates that the above is not enough:
>>
>> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
>>
>> Could you please have a look?
[...]
> 3.) "The new assignment sits after the max_tpa_v2 == 0 early return, so on a P5+
> device whose firmware reports max_aggs_supported == 0, does
> bp->max_tpa_roundup_size stay 0 while BNXT_FLAG_TPA is set? ..."
> 
> Michael commented in the v3 that this is a false positive, hence why I changed
> the code from what it was in the v3 to this.

This is the comment I referred to.

AFAICS the problem is that the driver sets

	bp->dev->hw_features |= NETIF_F_LRO;

regardless of the supported capabilities, and that seams to disagree
with Michael.

/P

