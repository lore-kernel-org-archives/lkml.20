Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590297;
	b=ViCWrRP1+5E3ZdEsq5wR48YYycCajPBJzk92iEe95EdKeAYPt3Qzdg+7u5YTpqKtap8m
	 PNeRdkIeNJN1E5yp4+RIHHkRELMqG64GPWHrh0v+XCX18R2gQPVoNEXXB9y66VBQYyRdM
	 sPmPrkvNwhXN+DwmATGtImqfIVtpT8bqzllqH6ajmgUySgwORTAsd7prSfKvqZYv/lSrY
	 JpZlwWIvCsrspNXyzkO5ff8N8A29bsoBa4bVn3Bw4mIUhdI+2ewEuIHuTpcLnA+lC4Mub
	 G1GWZA7TLEnay/PZvPn2ofkcjO1DHv6P51JDtDwQRUpBZebDCmNnvEM2n8D0KN/bXpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
	b=oQ29cptOKtcxY/G5PYxTmf/kPZTeBZRhT3JJ4Pw4zKKj4Cfo3VePShdVfVPgJyK7BWgL
	 YgwXlb80lyYZ4vZqU4q6LqYyX9nGqtJdjHi2U9RjJforC7BBr8d4wZhgbG9vHuCd7LxcJ
	 Sr0DMdBSsZCbgpVpD5g0I2U9d610XnKu3f3GpQpv58Vi+mCaU7iibjKh3rdLQejM8tIxe
	 v7Uu023+7dbI4Sq1BS3QqC5qF5hojm0ZXFDH4YvR3HDkCgi7rgZhqK3nvAQFDZUNtub5i
	 nWMeSnbZ8vi4FI10yAmohMetKyFS8qhB9Nvx4vuGxKSQwkOeN0nngssaOdgCBDXT4FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A2606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-4840f0c24bbso773227fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793590290; x=1794195090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
        b=PuFo8Fq5OxLWNdUrtScWGYp+UfCvRL7Act64x3WJrT45/H7J/Pemv8ulKpTql/UBGO
         xwP72DbZUjIkLYUGJ7Y5x/JJWdT2sx8bR+D2KXp3aaoUMSUes2nnZf7hDCUOcvI727LP
         ZKs5a1m7gO5t+EOprQBmd3rEUAB0vpyAbDF3mf5/VPpxsCRU2QnWl383IXc/q0OH1aF7
         x9pYm/gXj0R8cu76A8+2dsexrpDihysKJ7xgX3lsff5HCyZIxPKVfRE8J5Rb4vJAUu2N
         G/i+nNMpGmkGZmW9IhhY0uB8Bzg4Tfovl1zhneaEx4hVq8Y6brfymv0N6s5+WhkFHkKz
         fa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590290; x=1794195090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
        b=c0hemqsm52WZYdrGkg4MxXN68HDLSP4mhlqbGCMLLD+ZA9oRRNCl4fz7XXetFguPcp
         uUc8odmn9YuowfLnWZKvOLtcwaasN6Dc0j+btgN+zBVzXbAwhpj0H1xrgjXh+T4Qba0r
         XxqpFSxl0VGrMWi60vaEhJIq3lzc5DKiLLwzViEEb0/sdzwHUz6w9qEvCziTxJGHqsun
         2gBM6s9G/NufttKePryE3Kl3j/SinBT/MMQDsmm21qq4mUOdH+3is4yU2GyCkfoDSpZc
         ILJnBxMFS8kQlrPUigdKo/M4xhBqQELdtsfQph//V6wWgenvhXFNUuida8UCTBGxFuex
         YKEg==
X-Forwarded-Encrypted: i=1; AKwUvBy7oOSh59k+CuOSv0nskiNcfapukgOkz7YDuVxojN7b51lPnsQg1Ls3pNKvB8fRq5sE2S6IYfOBGNGfxr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLGpWoMX1hNC+JdmKqUYOhyha9/uKFHkbtj/pZuoAgv4CeOq/2
	UuyBSR0PzTDubj7PrDG4s6/DFkQcJCZv2DrDALPC86rHgSU/YfGqGak2
X-Gm-Gg: AYBFou1SSzEvAccWd1iJh4GhWQyE0TWu5O4khArfAUIcmQWBFHQvXiXDwRIe3G+TJ5/
	nW4IlwyOoZM51uss+h2XxwslFCF2iBm2RxxZkeAubb/Bde8lTWqd7SSGhiVoXPtf7jyGoToqYxq
	m9VOzFghxU73taZHxd5tRhg4X5p2dCzVX9eWw29he86kNTt/YcvJ6maLc91rUldRiSnRXrztyjh
	qw5J9WTMSLdQLqYFBoUhfQrWPnhhiwZ9BXP1PB5j2AgI9//ogz9Ny6PxWid9tMPzikXe3cUWtVA
	vWviIQ9iFU3zT1Hhum/0+OBXSaDTcvrmYepcv8QS10c24vdoaEye68XR961pMf+ejANKuCFPn9g
	HfVZimGpNpuCU13zaWjUUechHFOXKwyfqlB7OCbBn/Vx/sEiB+yV9MlBW5zfRctDczF6Vva968T
	J8R+/yrJz+O42gQRyUVTTi5SC5X3SQAoVv0yZCFSa1xAgQgrMwo/EL+jPiyiCBBW4WfSUPBF4xL
	EcIiZp0ANmfw+qoVwwndaegqi67s1vBBoavIeYYAUNoq4Qh9BleTKXWIjm1tPmHfsm/fAWWHUXC
	QG0w3ftw/CAlSayad6RFrbP4l10d36zOVR+3jExL9HvG9YVcF2wpIIhYcVQHvPzqdQw=
X-Received: by 2002:a05:6808:1a21:b0:4f9:46b9:e80b with SMTP id 5614622812f47-5640d92b74emr5304782b6e.5.1793590289815;
        Sun, 01 Nov 2026 19:31:29 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49923sm6895225b6e.1.2026.11.01.19.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:31:28 -0800 (PST)
Message-ID: <f98c2746-a025-4a13-9e6f-2ed9fa183fad@gmail.com>
Date: Sun, 1 Nov 2026 21:31:27 -0600
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
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
 <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
 <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jerome,

On 10/21/26 8:21 AM, Jerome Brunet wrote:
> Hi Ryan,
>
> If you do not see it in the clk-next now, it means we missed it and it
> too late for this cycle, sorry.
No worries! I appreciate the response.

Angelo, since you're sending the MediaTek clk pull requests from this 
cycle on, could you apply this series and the mt8173-mfgtop fix [1] in 
your first one? I checked that both still apply cleanly to -rc1.

[1] 
https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/

Best regards,
Ryan Brue
