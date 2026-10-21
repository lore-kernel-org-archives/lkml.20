Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588891;
	b=Fp6OE5AWAKd5wyDOQsb86VDNQZfCGQcCmYbAbgVtHN/RPQBbDYlZayDH96U/GYvlcv9h
	 8YKWPw154F5SU+ka/sn2BZYl47cGf0CeOYV7y5xBCqUEctl0Y8OrW7iSzYo+D9mqDKkoV
	 +LEqvGhISiG9xkTy3l1YDFnCKoJKu1LcrhwxvvLTGWQypZSXaIFmipGZEAgqAUxwliKbc
	 prUZqmOxWSm0nzDZODIE9gDeYxFdB8weRBY1c+xdXv3BYULVxuDG3NZwgDlvyWF0Nn0va
	 6Szj5Zl3FkVgZBz8+vmCH/sc5VUtfp990LIVMuX2QMM2UW+f1APxykzQZm21TCjzRlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
	b=lk8GVVmeWqANRsCBrrRPMji2MNJVN5jz7YlOsPyQGJC0/Ui4OeDOM31sslm4h3cRb9Hy
	 m1OfvXW0DS4kF3ypdIbEoFEgGmkdi2niWMAbCTfwM26PN9MTI909nLlVCRK1yMvDCn2jn
	 fOtjp/Vg3ilHNb8PkQPAGmap7PqyBFxgyOfzn51d9e7ETytY+F/che71XPWkn+lgVkEdC
	 Rbh/groTNCqI0psokoiMKUFlrFrKroPMDIp246ROT9IPiLnuK0+PYDr/I+xaZRou5B13M
	 yH8oIFVQ82xAIs6OkYqMxQ3JMKQhm0VdWPX2dNPn9+ejK98hf9wqdsfR9Z5fxI3b6yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hpn8peYk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A8606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E20A8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hpn8peYk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso7361505e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792588888; x=1793193688; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
        b=Hpn8peYkMqUiTJGo44A2mZvTKXmCHuOkqRxsgVkdohoEu+MIylocBMmNY3MN0inWH1
         B4JjaquOqPm2iK7ylb0Q0om6BUfEWFyvW1g9kVh0dVicgdZq6pK3Q9u48jhLtOsZ/mZJ
         z6oBannDgWGnnFnUop8dnwuzxlYFKYmbL34XnzYqBpsz+J2GV46yh5Gnc+RkC5w14tYI
         4lrPQFtXiTJPN3wvTZ7y5+unMwgCY3Q4BH3UukFn6kPR+BExaEiSCQMKwaMpskEMWQ1Z
         Hs8P3pPUgC/gR6ZFSFkf/cw0L9RkFDqWlr8wXHTKqSs2A7x5CWVn5e/cRuO7y510iorY
         NeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588888; x=1793193688;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
        b=depdXCiHInSxfdrORDgPbJWjr8fI1O7CYhPf3pkDSJS7XnuvWw3jdSNFb/1K9b+ggl
         lqiMFj+oVXWwDpOFaltaEFlD9IFmtOpIqJLAB1y4Gl1ZiXIp/Hi0ehb2Api3tUpHPXdN
         9opCEwWRSzrRmBpphn7qcxL1s6at4BhueNlwIbSee7CdM/+WgU0Xeez9n+vAmM6sK0TY
         lSM5UHkKSs/AMthEL2owm1nW9GMnRs5DdNVqIfAZU5cpLA6QhlOvzyV1IKi4v4iODfah
         Q/PMbMNFH57RnSGqlKvd700NlbkQf95jfhqQ6OYQVffAYVBw6sO2FwO5So0AZgsXXots
         BdFg==
X-Forwarded-Encrypted: i=1; AKwUvByfHLGEgQgpnQE3tFLd8oUiBksYmXo15Bw89yXT2HhmdTMo0R3+aRwSSK1gbtEqaVXqYRWY6Z7oiAQhZvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFbHbOxTKoAG6/ujxqqXsKU3UuF/T+XT1fjdRjdl3vnqFzTX5J
	VNxsL79lTbhuV897CgwgVlqlQ7joUQmY2oOHeTKnPDLl8fFNfhq0dr5MsB02wYoR3dA=
X-Gm-Gg: AYBFou0tbZToep5ITSuOcglUzY1wOLZn0xS1751LC3O+B7JYBAeE8HZbe1itbm8vGN5
	Q4GNFEzPNJhEf6OLoJMFL8HfH6sdVzGVGCGyl2LI4X7lmRoBRdhy3r2wmSF1qiMcRnJurHli+J1
	KS/uiSROOsq0pWfH/EoXONIqJwHVcr34/ZQ++hRnqGWX83UapO0Djxh7ZM8rkoXvlmxaF+PwpB8
	bupPhT90Qgtoa/PLrvGrFhbxhOOvLuIE5X1/WF4iXpVgPVYlHrYC7ewvby0CFTC+YfnIM+Mmlzn
	yVPLWHDOToSrMyOM8d08nPPP/Khzpi+vEtJDBKlK5oixXu6m+uYgJq3vpjx6ivw76rWk3miY2yv
	JM1lPiPCRriKY+c1IzSfLBzFrLMdXXNo2AjTPHU6rf8ruvDb4f0thtBBzNm+qvrP5W4NIi423Zu
	v8oxe39Wew6CZCpCZYR0pURmTdnUGk3iHZtP7M19Y+Fj0d5Lzllg1uBJZP1P/eFwBj1/1mDXF9+
	rDwnB7B9g2PeatxyCXzoa5kqDKuJtFqNa5b5swE8FZ9Vw+bO7/JepT4CRjS/XFYIO/r+5tc/h8=
X-Received: by 2002:a05:600c:6097:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a1fdaef8b0mr39864365e9.7.1792588888044;
        Wed, 21 Oct 2026 06:21:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm112679735e9.5.2026.10.21.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:21:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
In-Reply-To: <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
 <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
Date: Wed, 21 Oct 2026 15:21:24 +0200
Message-ID: <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On sam. 17 oct. 2026 at 18:03, Ryan Brue <ryanbrue.dev@gmail.com> wrote:

> On 9/28/26 7:22 AM, AngeloGioacchino Del Regno wrote:
>>
>> Please collect the changes that I've reviewed for this cycle... I'll 
>> start
>> sending PRs from the next one.
>>
>> Thanks!
>>
>> Cheers,
>> Angelo
>
> Hi Brian, Jerome, and Stephen,
>
> Gentle ping, in case these slipped through the collection Angelo asked 
> for above: this two-patch series (FHCTL DDS mask width, mt8173 and 
> mt6795) and the related mt8173-mfgtop fix [1], both reviewed by Angelo 
> on 14 Sep. Neither is in clk-next yet, and both still apply cleanly to 
> it. If it's too late for this cycle, just let me know, and I'll ask 
> Angelo to take them in his PR for the next one.

Hi Ryan,

If you do not see it in the clk-next now, it means we missed it and it
too late for this cycle, sorry.

>
> [1] 
> https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/
>
>
> Best regards,
> Ryan Brue

-- 
Jerome
