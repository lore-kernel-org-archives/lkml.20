Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611630;
	b=yjPb8ldRIoeF1cORs5DqZtRoQzRSltDiwBe3fjWgLrnB27hbS3bvMI6bq6ra6BaDgHRa
	 Yje7hANpZ8abccniwjChx9v78NuWd9bhtnpkusjI7agaPv6BX7ekoSuKEbgUnbVsRkUh2
	 Y5DKmEmDAjYSFKyYMiHyG/WlDVLKzZ4lcj5J3Q6DR4Zqm40X4x0Alqe9GN+2dMGPlps2X
	 RX9W94QDPaNnp/mJrDwyMSiDIsQbSptp033uCbi1x6Tg/PnNs4anpdFBkiutxoi0l6Njt
	 KiCjU5zwcy6I8EsYQS60khpatpJ9MAw3O3PRSubfuGCMJG/UhDZG4PBghkxad3a/uEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EG6s7IXphn6NOHl4nh68/lOvSTp0F1fia3IQ49tN0fQ=;
	b=SHsXiKtd7wcxjmNa0kaJR1mImykbphJtH7uIRgMAZTEucJbaJYOLKcPiOovYBo2+Yq7+
	 YoHwiBdufdWxuyTp33CZIoAyb4HXlS+qVUZ271657JcPkgeez0zxQYY27NKWhajrFExfa
	 Yre6g55+SNQUqAD3bdcIT93FhHL8ECFj++fOBMgdAmT8buwd6GonjyD1U3YC/RmAGyxqE
	 2Len0SvenMppbvN1/p4c7FVO+CAYcNnFRpErHRwpIMxsr8aTErNgBD31IbsYktsfFDmj0
	 ieqY6FMRnJ2vmXJ+wfXhhGt/OP0l8IwOx25kG63HXP/++doGiPxzuhhQDOLCGYrVkTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSt4dPSK;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6B606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C6B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSt4dPSK
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso2133230eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794611628; x=1795216428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EG6s7IXphn6NOHl4nh68/lOvSTp0F1fia3IQ49tN0fQ=;
        b=jSt4dPSKRruz1pY4S3eqCOEYbFc0io6eBEJdLq2NG76YVTJ8IGs2hx1WtYgcA1+Ls4
         Ws2si2Q3MZYlxOemx2wdJplId73D9rjtU0SPNetFUHe1K/VL5jujBckLG5iklZZCIcrg
         +I94mNsDT9FjVD+Zbx0EhPu+P84+IDWj5EJNS49BJ/efznOf9mhE8nsujcCXLD8QLBa/
         fqR/w6yXBnHrLarWXQBqIs8lKxrrI1Ak//xYc/2nXqfr2A7R2hOAw17U5+g0kUJM55G9
         szjj1VJoxlxA8+kBUHgw1/L7oWUZMhXOah19zpQyUPRlKdbSNqjZMRFDY0KAb5G0nRQL
         rnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794611628; x=1795216428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG6s7IXphn6NOHl4nh68/lOvSTp0F1fia3IQ49tN0fQ=;
        b=wJ5PeAG1UyuthwZOd2ZXdX1eZk6Q6a3MY0CttpHxRfyD2TLsuZy96h4rfWq4N2Vy0g
         85ZyIx/meNcJfNulMHHf+9fcczlBh67mURCxhMt4NGjFnrJb3GkjkdSijQ0AZCq/Rpys
         b6kmJ8S1M5LDu+3CnkS+k3EHaT3nvNcai79e1NZ/8cD0bAcKNTMlgx/I8rWDjH20xZhg
         Sr3PRbGB+3rOLvxAkPcmQ2xOHbY7qWsxpX2D5ezoDaqM9ggOS4dmVEQJPTNa3l0vf6XN
         OYwRPhlgMWw1fWYm5ZtnYUxzLVX8do0+ygP4LJJaEnDmyfV6QOil3sVLtUVs7vm4TfOx
         KgXQ==
X-Forwarded-Encrypted: i=1; AL+hErG9qMQfPBuinjW27tkcipe7030mfy4k5LtR4nRFZXJWIYweSKHOKg7qMY+dkARbq2j6jU92Z56D8WTQpjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hgvr70A7BTpU60euOGzQPkPkCYSNpWbOPIFVJxLi5bz0FCHrL
	ZitieNqoxMxvIPhtrtIwU4TDaKQKABHG4t3IvAp/0BB/H+mpoYQ+1J2L
X-Gm-Gg: AYBFou2CAznFUrdDZPJQ/JbgXC7LNhHbQon4Zw02BCzrJglHBNZS8Kh8afIXQMktUPL
	Cr5fNh+fbpCenVWE4JP2X1g7Zux/Yjzi2iOp+wQTO6CHZRWSLOxV5JHMUnvByhbw1vzWwGPhTKi
	1A+hXMafQ5Q9+6yG8wRUglKeIQ1x0SPhZKRwTwjZK9HHQI9lbQp/+TTyBAKmV2XvCvORi3SWtPU
	3nhmxQ3yesl1tzxkIB2iYFOm94IGs51IdkZeF2TeCbx1VEdV5bAxhk8ITJ9lmA/ogDB48lf4/62
	WmqVFOYly3vuDOr+DMz8oHuW9YMMZlZPYvRPuROsXuV0n4JmBxugDuR1MsDFjQyWvu9fyw40faf
	x8Vfsfdotb1gYWAunmEdQRfueI0QrVXHuthS7cCv+1eIcfdHsNC+PlYNJ4zKSvETJW8ypviKWXa
	PolmTgQ6BVd8+RvqmL8BKe6ZWtA26tFipTUKQEi/Sg/m0JmWkCiB7r4SEan5DPF0tzq5tejWXLR
	foedhClC8kltYvYh573+7gyAyh7yZ796JV0aVGCL8wow/RFkwPCA7ajMvTefr/4Zk/uI7BomehD
	E1HR/6dwQhVZa+3qwwp7ekcMucdWwHGzsorykdWu4SXeAtVx72vRgIhFMqGZg8cE3M+Lulxbgsm
	uMx9tW+4AMxQqjWU7h8OEb0Ho0ShomcTIr6x+0rVgL8eOcpEXUSqLvPENj/s=
X-Received: by 2002:a05:7300:d718:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-37966b52740mr4985969eec.20.1794611627449;
        Fri, 13 Nov 2026 15:13:47 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm9922842eec.10.2026.11.13.15.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:13:47 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Shubhi Garg <shgarg@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] rtc: nvidia-vrs10: Disable IRQ wake when resume fails
Date: Fri, 13 Nov 2026 23:13:27 +0000
Message-ID: <20261113231327.22109-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

nvvrs_rtc_suspend() enables IRQ wake, but nvvrs_rtc_resume() returns
early if the I2C access to clear FORCE_ACT fails. This leaves a wake
reference held across later suspend and resume cycles.

Disable IRQ wake on the error path before returning the I2C error.

Fixes: 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/rtc/rtc-nvidia-vrs10.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-nvidia-vrs10.c b/drivers/rtc/rtc-nvidia-vrs10.c
index caac63f4e0fc..a5e73baf03a5 100644
--- a/drivers/rtc/rtc-nvidia-vrs10.c
+++ b/drivers/rtc/rtc-nvidia-vrs10.c
@@ -505,6 +505,7 @@ static int nvvrs_rtc_resume(struct device *dev)
 		if (ret < 0) {
 			dev_err(info->dev, "Failed to clear FORCE_ACT bit (%d)\n",
 				ret);
+			disable_irq_wake(info->irq);
 			return ret;
 		}
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
