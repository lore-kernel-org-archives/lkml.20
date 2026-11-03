Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738495;
	b=J+iz7m1JXQaOHkej0kasX5/6tBseCfQpb4ZRtzcw2d0trNd6pGo+jX1SIhuxshax+yiT
	 Iap4awk9WhVkpNTiScfjvHFq572QJ6pZuF8RGmV3FB9nuzEmfjqWHQQzrE5JvibXzUhys
	 R7AdRnsjUkyn1NpcSCauAQR+X1nQuY/Uah7kTgdDbRFOIjoOtovg3auTGkq2L1WYWVah7
	 4cZ699QDCqpuDqlkfa9sMywrDVyWg2vrjrAgFrZLqsAdtjCY1YNXWQCxRzxt33BUuKHgc
	 9YokabGdzcSCrmS/o9wDZrvAVmXxxeOBEq9Jk37Gf35b0zELlBzFWRUHy96TQ2+dChA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YETm+Up3HiqhI4HFEq9kpUZu0+ZMnC5rPWZMwVWWgSM=;
	b=MjxJ/wmORK2hIgkF/QiLuavq92hSbDyzb78UTIuXBv5V+bbkALZH09wElvegsWl0KILU
	 LPZ91nqTsb7Gx/NxxQJ5jeTPiPW/cKLYp8qbIwO/lfWKf++yj4rn6KQ49PMMQn0VsPDxW
	 JwsUtPG9pFK5UxHtBX/iiA9s0/ekkvOG6DUlLO9AE+TbzO/EwXsHUqiWEUcTVFtkJOflL
	 27xWKy/AtbTBf4emnddXUDPb4sWj2DYwAfcDwyJo6F15/H9a1fNRQj6MucOtURANlzO2i
	 HW1ukTTcu2ZFafKCoOBQkjEVlX4CG2sHObixudz1G1vX/k0Msx4kud2+UHATjsL5BEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSTSqJMR;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1641D606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1641D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSTSqJMR
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so42099275e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738493; x=1794343293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YETm+Up3HiqhI4HFEq9kpUZu0+ZMnC5rPWZMwVWWgSM=;
        b=HSTSqJMR+jvEo7ahjNsMaM9qSyGCUVmfTGwVA2e8aiMWGnRNXOoFjjT33oaJBoYquX
         RzwiNuqcFYR6QHmjbTuWi+SEjZL8eJkpRxntpXgz9zb5jTEL7o2tpXZMc+aHbXUrfrDK
         sdXBdeLSeKFdOjKMq5rUA3Yeelka88N8ziOo9B5uD4PXEl6CIOKPBTH/MXVh4BVMvpiX
         9XIpEdm69UYiebiVZSJ8g5+orD9Xhx1CBwqRXOMljrDP/uHgP5/DK0/xVJq8uyj0eNn7
         p/eOYxSVzywNomXd/v66nUicck1CmOOGUj9nCrsdPwtAZRmcs4JMcOMUlnmBDkLTA7xo
         d6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738493; x=1794343293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YETm+Up3HiqhI4HFEq9kpUZu0+ZMnC5rPWZMwVWWgSM=;
        b=Ko2ewiO5qrBXzqEgOXuso7uN+KOFEE2kOmE/Emxofh8siQSv7bHedgkpz8kesmdWHp
         9SIxNwU9y72zeMhlJGT10xJZgAkq6VWIPglWTkxzElh1VwobcbkE1PKD5qmrdtH+6pSl
         1cR7PhCXUsrRYLf296ivgedjffvZ9K1FL0hIIehW1qSeeOfgvNHwk2T2p2lbewk7qip0
         Qvj3Fa9Cu6s3H2h+UpwMLxXUyVwGvcyuprz5pAY+qmYxqnhMphfhQBZi0Ysx/v8ROCAw
         lmq0fr8ptvkIAumRcymWNo1hMWCxndjzcbmIO7Kc57HkVXJ8U+BxqKK6NZ9F/bgbu5NS
         lF2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcUPQkWHMp4EYLtFPLeTHgaLHKKOaW9ssT4PDCibJxmVgtpLktiRHPUvZqcp5HEJJV95gCrZKdzqvRHAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yh225WJyJKtNPpDT5b2gGYr480tWVmBSUe+l6OH9yHYYGFwMC
	PQnrYyvoPJx5XBkkPwwMpMLaqj/t9g9rRO9Xr15FkEhOrOeouF5UMwuU
X-Gm-Gg: AYBFou3p/5kDqwqK9F+HPIGY+J8kJE23IHU+m2nsl+2RtaPUaxsLGVc64EBW04uDGAV
	LpOM4inDU2j1q5gRI64YyVHylOLf7gFGCx/8lPWkIwjumTYIZP8MheRTG1g87GfY5VywIBOYuzT
	RNTWq77KnTZiEhX5ATbWcbci4CBKq9yNAajkeDh0E/C4aADvspDKhOzt5w++ll0Rdhb3TSRyeKB
	KhoV7Wv2dfCEc6QIiOQHoMIyj+8QstMOfP1V/qFzKH4lsCV8PVOCkXwz9dCPdZEGEXP8la+I3dq
	mRtM6TzEOc7okamdrpFAiL75/Zl6o5CuQVO6m1Qw1SuGkIYD86X71N15uTmAykl8/gikugpLYq6
	LB2JyxmiNmRlbBd8sfluMTICM2xW4ryJn711LizVdZGkh/UA7UuKzy5yDw3i7ugBnpC9Ehs3a5H
	QQu9+uXtwUt2KWUwm7DMnPXg/sDDuBq8UgsuATKjxczTBwX7HbTDbp8+8eA+BgiJsKzcpAD8lNx
	+RkloazqaO7vK642YKzqn/7WLFvN2feBBh8E7tNgbw0+h4u7grQXWSq2CdrQiQHpTTq+eOA+7kj
	p/3ZUD4LbzBHFrvpQnPXRPmNklfNFrP91Ep2veRVPISpl9gU6df55YlX+SgNfyavacIAXGYk/XV
	syi7uQfn92GwfQQ==
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr321941285e9.2.1793738493245;
        Tue, 03 Nov 2026 12:41:33 -0800 (PST)
Received: from notebook ([93.189.202.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4134ff2a3sm6859995e9.2.2026.11.03.12.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:41:32 -0800 (PST)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] bq27xxx: support interchangeable OnePlus 6/6T fuel gauges
Date: Tue,  3 Nov 2026 23:41:29 +0300
Message-ID: <20261103204129.278715-1-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019-master-v8-0-2517e41c8992@gmail.com>
References: 
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

Hi,

Gentle ping on this series. v8 moves the DeviceType check to the
bus-neutral core and uses the existing register access helpers, as
suggested in the review.

Please let me know if any further changes or testing are needed.

Thanks,
Rinat
