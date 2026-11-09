Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244688;
	b=3AsPLsFS3oVzzpRsIt9amUTW7OMRuRtF96uoW0sILDWo9koVHAwp3T2JBqNvaHl6j3Zt
	 6Uzac/zXXYCpZOutwz87sY+WLgJj1KejsBSjW8i5KcvrdY7TmzN1h73xTAlVzxvwLQl89
	 6GTLdV0AiZnwSrMEFlZwSyJw5oXfFUahprXN4h+JHwyNmEj4qTWxnQP9MBSE6Y3VlBIuC
	 NSpAAAPSYjxFv/EI984/wzlTbRIFvyUFhkb6oe9L6ky7AcGudCmSn10fUeIaHdSirg4Hp
	 rsIUxlYi0D4EghD4aswPkA0rCReRPqRulR/kO2MDfQMdcf6/1VXvjNVXyoaxSpx+xTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
	b=V8mQbMUtzGovdhgWxfGMYPXHT6pO6xfvCLmS8d4ewVHkVVf46ZkqqbIMiYvThFma6Bbe
	 Fy/ne/L9sYlPtyYAaUWWPCcI6ovQcmDHCkzOOvSuKhljlakfaVwUiKs1YZcy0R73Y8MQZ
	 YN6yvpnzcdj5H96qzIbL/cuNeiRX4CXdxFfw5eZtc/W89k6fdERBqygMXRvYODH3hz4IM
	 yLdSGfbgIbz0qoBQs5F42NQ1TmJXvLoEucqLB1dLPvZMtsEcCcERsKDzR2HCp+m9CRAnr
	 7MfZYGZjAzw324FGwzVOpBuAmF0vZg23GvVaU2I4QqrusEs7pbKhtenxFn2SXbAnKyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45F606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B45F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99075306daaso543529241.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794244677; x=1794849477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
        b=WjEApXFE1pTnIb+KmmPuTjctaOkqfyxAgG2LeCOpwF4Csad+fG/qqRpt/cdm+D9G0M
         1pP6PJHRBFg+h1ltlJZycyYIwFiWqylUZAVSOsK16VKLgp6XHPleHVTM6rVuNCByXiVv
         4GTwnAMk/drrkd/D3ZbjHpDr2NszDRBGF9uxwvxqmS8/RVEpAD3b6VSI1JpP8wbgsZO+
         3Dm8KX3Ep3EjqFPEmwpzerftrK7VnpLb6691tL2/9qEXtnhFhct8uouFz96K2gI0P3BR
         co2shXK4eXnDpAiBL0vkj7Hgr/VHsOhjzAi+c8bFoVsDz8wMffsgYGQkOszFmGbVcWip
         KC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244677; x=1794849477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
        b=B3DM5WqK4VOt9uel+Bl2HQpsVimCvPUlR1NyCo4wvqsXf/Xd4p6EG10ZV+cXOX7/X4
         YdeznowDPw/e31LLAEfVcJWx6rfjWC9/4vguiKKCj55EzCJK5pzfG1mn8y+uj+VF11CG
         rEQhB2JAZMdumsqnbZYTRx1PYK+viRRHIwFof59lWWbPhloJKV85tRnZgr28w0ysHo1b
         p/m1YEAYaRHC704XAvlFGO/gpZ8HDwPS4AZuDAPBhnBApxB/Ci0ZX1Ll9Xc0M/xBw8NS
         GyJ2Lkw2HWFlKVfC8R9GycTvA4gt6SeRu4ew+Yda6KGLZsSXeptK3bfHARipIQRxWm9Y
         cRrQ==
X-Forwarded-Encrypted: i=1; AL+hErH3iUEMdMqGmcQoMs5VcK4C9d9KxF8eGPgKtkhHIvKUQoLD+jrVutcmoIghmLv10G7jy1T6ZxtvzqimYJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ps+MeWdXenkLYOofe5NUxGeMgChxkEuAZcB0FTcUodXhtG2pL
	MyF1RrLnSxitmqJoS+ZrmNscZ91DS5m2KY1DjDmR32DC7uWwFTc9YCNEwzmXWMgqsOA=
X-Gm-Gg: AYBFou0GsJ/eH+WSdMW1gxlm6HGs5vP9y65fKtzTcgs7YC9L+vPqtHNXjnDN2AawnB7
	Q94V1OILE1zPwm+NEc1G41BabNaAB4yeqKhqoqpyMWIeNzkwG9LjEZKcpCLRMead9o8dFlmW1ZQ
	W362qof5kM+Ky7k+MtSEUJ7mhdi1m+9zUPi3LpVSlGx2mKhmSyrUjhk0eYNBfdxBAm52lnqIEq/
	tIhtookI29gv55nXDGclL3bezbPbmC+O1J58R4+7g8wr8gxHt8Ovw1NxdRqTcs6aK5KTIIURh2H
	sxDszsxxuKFL3OypWvvS5HcMt/uQKhYyRI1UbwM1EtCGd0YntUjL1xMhfXb9gUOSfMSrs029T/G
	qQnJIr2+13PlCL1eIsDvZkpKrZ5lFRyt+8SXTdSr54W6BGpIBVqrB3eGGswZbG1eiTqeh13bIi5
	iO08i73YUnYqtwJXd4/g82U/pfQQdVGsdDL8OvL7wUsh2IG4HIOb4fSJ972rz6DSX19gtF4SEVL
	Jt8nWsgMmRpkURYHnxy9M110tk9bT1NNOn0JCq3m2Vdx4ghxSQNaKPTFwm2Y4R5WIxG2iznK9kn
	oYs351gXIJZDEkRgPOW98DNdj66oi2Qa7JbE9Gt1gr942u65U8oMkXA13b9eHNxLD8Px
X-Received: by 2002:a05:6102:2922:b0:7d2:b348:6355 with SMTP id ada2fe7eead31-7d2db26a095mr1451337137.23.1794244676733;
        Mon, 09 Nov 2026 09:17:56 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c200838f0sm156302241.9.2026.11.09.09.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:17:56 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Mon,  9 Nov 2026 14:17:50 -0300
Message-Id: <20261109171750.76883-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <7f8e0938-2b35-43df-afe7-18b0ad917698@linaro.org>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-3-allan@fatecpompeia.edu.br> <7f8e0938-2b35-43df-afe7-18b0ad917698@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 09/11/2026 12:57, Bryan O'Donoghue wrote:
> Requires a Fixes: tag

Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")

> This feels like a slop-comment which is no bueno

Agreed, it adds nothing. Dropped in v3, together with the comment above
the function.

> (pix->height - 1) << 4
>
> Silently truncating here is incorrect.

Done, v3 writes (pix->height - 1) << 4 as vfe_wm_line_based() does.
