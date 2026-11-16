Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864319;
	b=2CNiF28BanAfUggIrm0psIj0wa9dnlXNY1krM9ocWAYD8C/qwabwM2xP6bjRR5nxh+h3
	 ulY6CQ14ZdqWK1QjYIg+7ifqkHTsBG3Rvm6gQuXVjVEpDTdm2UlasXGUSdHpFdmC9eZfZ
	 8eVkWBWXYUnc1pK/MuzpLD7xQhIi3WZjjoXvXInQGqBj66ik6NsLca7ByNlZWxe30DId3
	 9GMNZGP60A7vOiKhwll5QkXFkq+9bPXayHGBct3lPiRQ9Vd0s0WiWKSOKJd1WjJnD39u1
	 qZRztEJTPEF/iUEQuLQGC2JmUKr15u+nyV9oRzT/nD0Ii1qfxDDtBMyVEqtZK9vRdRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
	b=GTiXzIEwnKPAiw2Pboowj2HzJVvJSIpMvYA8gnHOmN9Hq2xYCl7lQgt2t7aIcGvSyc0Z
	 kTtdonVONYbolm0OkzizSG7UzzML4UbVGq5puipTQSVSa62zKRG5PaBjCqZHqTanomy4U
	 3p59JmUeEKhgjjDpyEe2GgLkkTNNBx0ceJzeE7PZy8E59UOLwaIsIaSWRQAiMyOx844np
	 Sw794YFKGfV9k9sdxLPaAuZgGOV1yRl7Pkvgp6mIPCrIV2y3XvvzNpJ+m8BYlPxiQSddA
	 FHOgRzwm9q3TpLv1WdoADWF8wU9KRVJjgDHE+85/fm4usUJs3nqpwM4j8ijZ2g5nJqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOLL8Whu;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82D606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD82D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOLL8Whu
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so14593945e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864317; x=1795469117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
        b=UOLL8Whu4LA8bNveYjnlOSE38Ii77baYdefAzKBwlYfl11uUi1Qrf9fMBGpquz3o2e
         vKn3CvN+EumW6pOW5Qn6+es+DJl3mdDy4k2yt3ueX3bbTGxSwZXA3h/2RRnVEUrB4Vvq
         pg7T/CRQIR6huYmF3hi7pPvvAazaohD0VbPSmnldcEEbXZ28dnJFa1HsvVM3Rheb4bOB
         uKvYq8v2IJyU99lrrsvgoB+lmkiGHwqEu/A5wTRI8NLDYOCbsRjCpmlLePXBIpd714go
         U9ADvoXRexU3wQChWFi39Z64trquY2qUbnIlSIIcnmix+ZWryn3+v1c+1a7M9VCBpCHx
         Ozvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864317; x=1795469117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
        b=W6bDjR/E+mghUtJv65b9IO3k0WynDrrprviwj1FTA8pg4+64+VD1TFRvEqzismNGyX
         BHb34tGA58i9QOKQTKy7C+DSYrmMpD42injsOSFQq0jLpb2D9lO7mOZ/222gXM90JJYu
         BmkBmbIu4v91f4VRH5Coi+1vawPswdfvnoguZ3y408YrsYgADBokses42sB2fGQGWEXY
         rKDOGv0Mtb+SlOllc/I+2rwRrqpyaqTy8muSQN/bj2NiRei/c0SAHLdFYz1lxhDiuhYs
         W7PoDEGeYvvEVmUMhgolXo83BDgCutV7EpTUjXyGfWf7lWlzKlxrKEbY1NcT3lqcbRGc
         3hvQ==
X-Forwarded-Encrypted: i=1; AL+hErFkDcfxHDnExpLMiH6uWljouzAXyIkZsCNc29orHgyPkuCyf+FrrI9u85A0tnjAWCrk6E7unlBPEYDdObM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CuLILYzJM0YgMwIklVLYfRb9GVgofqOHH5lqC1HTiMFKgzLox
	MZSzXaekOkmzAZ5UHT3NDMlhRfhl/ZRt4GgiKaFnyBRc8x/jTkqt8WoqPO2Q1lDVtNqZ1Q==
X-Gm-Gg: AYBFou1pjH6PhRPHklbKEIlANqwwAljkqoY2HJys4RUhLgmtXV5t1DV0lDGnKjIBVq2
	jG8R2PQs2nwMqEecpQT5ikjNW6ylsAz/X2AiwGuf8h+Z293zIp/hypvLPIOcTzgtVG2cg5tQktq
	QZ+9uijXpx4rvEBCQsV6cKRJuTZaM7pZJFS5jB4C2+lYjMhfMzY7AFlx+TEKr/t5zvULmXp86w3
	9GCajyw1i3cAbqPNgVuJd5zzIicT9Q37vrfhQ0f+8Tf/blV95PHiTI/8PvrlxG7M88qvdUhZfq4
	XIcp6xvVNUM5IRn1E3UDxvrXIb2NkLQDOTdJ7pa2Qpy+EPwSjRdr/Bjkp5PAy0q4WHtd8GRTPGo
	QfGL3Utpk9utfYxId8hk4MpCLqjFlFnv6054jYryZ1/EInW9oUiwrL5KL8YMPB7W+9G5P7XE6Na
	opxb9EulSytbgLUtEwzeaZXNr+v2xWil18IzdrgN7lWJK1UAc8DZ60+Q+CepKRouAmYDRhqYjY+
	jYN86FSjXrrB8AOTcv+/IZxdeO00mKBAayzd+lkd3F+MQbYHtZ/Ssg1DamJOyL0YALJDArOP/4X
	xnMdhtK9dzKKoYOLrrD1Z07AEhWXaRCbIN+MI/d9
X-Received: by 2002:a05:600c:a302:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb7347d930mr63274065e9.9.1794864317319;
        Mon, 16 Nov 2026 13:25:17 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:16 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:25:07 +0000
Subject: [PATCH v2 2/2] cpufreq: dt-platdev: Add Halliday to blocklist
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-cpufreq-v2-2-e518cc055457@gmail.com>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=881;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2GcqGR0zihHNnFXHb5IImaTefMurA0fW5o4gSm0JefA=;
 b=4lc+g+lfF1maKT/cQEhVa2dHnEqxr9Y+m7dCjl3rPKrIxUad1nOfy9KT8AZ+/l5jbkMGdKmvS
 Ef8hYu3BiTDCLxJ4PgoQacYXz8x4Ckmxj84jXTaB+zf63OVWiNTiiSN
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The Qualcomm Halliday platform uses the qcom-cpufreq-hw driver, so add
it to the cpufreq-dt-platdev driver's blocklist.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bce4c87573a1..3d5709eaa08f 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "nvidia,tegra234", },
 
 	{ .compatible = "qcom,apq8096", },
+	{ .compatible = "qcom,halliday", },
 	{ .compatible = "qcom,milos", },
 	{ .compatible = "qcom,msm8909", },
 	{ .compatible = "qcom,msm8996", },

-- 
2.55.0

