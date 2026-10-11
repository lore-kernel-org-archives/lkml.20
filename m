Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB84846983C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759453; cv=none; b=F6EYfpWz8KeWZDN52fsPfPQM/nUdolM8yFQ3EFfQxImrUVrW2f/SX+ZE6zfufOA6r3Urzid7q/EvlFXCwYs8eGLVO0UhUgkLKcFZ9wRYuxRYRvVjL+o2lZfiWYm/h0/R8QAGrd2vRT85btM4gJgeZ/YtFsJRlBGYFe4NKIfnEBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759453; c=relaxed/simple;
	bh=A3frJRbgFu5+5O2R8VBv3Aa+UByoDPMczSVLagotiBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxZL0AQVNkd5YHFeuqJYFAo7c7mPAnyenFKxvHdJEQo62OjIXCyI/6G2GZR+PLRPHgw+txf/CkbeP/fVOOR6iFV/5deL2w3GYS8/PqnJ5w8D0/n/wBx75U4l2hiL875TUKyHx9DFA7fF8mfiCZ3xUW1N1/APyi4hstc+imLjfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIkgS7s8; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIkgS7s8"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e4f0d7d77so171121485a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791759451; x=1792364251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8uKt/ohPfRzbFT8UsrIleN1or4CaNtgzFDPt385SpQ=;
        b=iIkgS7s8L8qVDoYxsEHy55/6uIUUhrptjsuVLqn9VmB9b/KPhJmvcf82s5+K0/hb6d
         x+/N6JRObnVgExwdqmz1p9c8GZzVaWJHZ5UVA2+pLYdG41OXzPVwchkuvdac+4t3o3DE
         ODVwdwhBiemi7UU0udwe2rnmUJN2Q5yxO7Z5vQJ/iZPv3cV+WZVcS8yJD/oeTOjpm88r
         /PC4t73E/kLI3poq2pVhVaTdn3kPzxKqdM+HVy3lXlnDvm7wJuYwsiOIumJjV4U5ZR7A
         r7Y+odcFsrdaCH70TMsd2czw/hJ2BjQmjZSei+6ZFzeeZ96MKDjrhh6C48v1o0ZpdsXj
         f4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759451; x=1792364251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8uKt/ohPfRzbFT8UsrIleN1or4CaNtgzFDPt385SpQ=;
        b=JHX00GoYHRLAVLDaD1qj7oSc2QKX5WSx52MbqQY4b1XoDuQq6VrdaPXpgsIzD7xV9R
         1UdnAO61PG3HyN2FexJA5WIvHMBlw3NSV9ms/gbMAxvftzsFt7KKbHO5DKN5gJIMjiO7
         Llzc5U+4AolpgsW2VAjj14J24Dha6F25ExHRn502at/vrCGqZWF7bJr7AHrMSaZvxhMF
         viWnBYcqcOo30QwDPndX+0PRIngL/YDIRnbbGgfDik/oFvrV6DdZJfuqWOUJjsOmHREP
         w0Ftwojl5Z/+t90CmF/5a1mAfWeHBV2tSAm/NS1GUHMXDhWijFVv72t1229NzKZp6iw8
         u8qw==
X-Forwarded-Encrypted: i=1; AKwUvBxm/06EitmBu2B141Ob5VH+8xHVA2MZQhptf4x5pThJPFhVKizzDBZLpuZUPnKfM+BxWnVuLbC6UKqRHMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz5BH9Mtmm5E09MTDcAh4eKUtcFvUdCbQSn+egEQn1xmIP6dOZ
	gayBOm08R0UgHbKwJZbGdDvONKdYsjxi29a+K2I+rwKqxBZWCVgWk/k=
X-Gm-Gg: AYBFou0gWOtK+inyvmjC42OGjvZh5uhAShCA0Ui/U+sFwAzjNmzPgO79g2gYp2JdqDy
	EADCColaLzqr7Tpc0WM9i7ZidUVipB2MvccvnJW0aNpeosNlLcStStf8C9XDKqlReJOYKNknKGR
	rCYqyahSRyvi/PReq2tk8u+74PY519eLpU29kL4l1s9cEKafHbM3pP/Jq8ZanN43sup/U9JNKyW
	GpdsFx4wmeP0s7ONWr4ryut9JmJ3eHM6WxbJIYdjWzzmXgD0tn4UubdTbWZKE9vOh6NKsMCHT/M
	HxpNSKtooQyfufvveTK4oMtbHNtboX/JeS9xLL/juhdhNWMJqnH/aFzaPN6lLeU2Xlg5h2QktXe
	8w6SfspzJzRwRb1mCWe7Qm76xnlv2NxozD+jpBbvKmlGpSh8ajn2KrwEEiltj1ZUpMOq4grYOOM
	SA9zDH6Y4nLCC48gC8aF1kBEt1woOC5RBqrJaUm8fBV1cS8KuG1VBCTLgLabVxO3OA+CTRCO0Bv
	14Dco52hxK1QeeiYwhpDPGkts3egkqnClgqavHtLjgpjSVMyERxzW05WG5RtoGuRuJtJOA12yUE
	cuFiX7ZazqU8ndwaUeggYGfOhmtd
X-Received: by 2002:a05:620a:4102:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93ec1351090mr1103172185a.10.1791759450718;
        Sun, 11 Oct 2026 15:57:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98cd599sm723647985a.39.2026.10.11.15.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:57:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 1/2] rtc: renesas-rtca3: Initialize the RTC before requesting interrupts
Date: Sun, 11 Oct 2026 18:57:24 -0400
Message-ID: <20261011225657.rtca3-irq-ordering.1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011225657.rtca3-irq-ordering.0@gmail.com>
References: <20261011225657.rtca3-irq-ordering.0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The alarm handler passes priv->rtc_dev to rtc_update_irq(), but the RTC
allocation is managed after the interrupt requests. Devres can therefore
drop the RTC's allocation reference before freeing and synchronizing the
alarm IRQ. Masking alarm interrupts in remove does not wait for a handler
that has already entered, and a pending alarm flag can still be handled.

Allocate the RTC before requesting the IRQs so that the allocation
reference remains valid until the IRQs have been freed and synchronized
on both removal and probe failure. Initialize its operations and time
range before requesting the IRQs as well, so an early alarm interrupt
cannot queue RTC work before the operations are available.

This issue was found by static analysis.

Fixes: d4488377609e ("rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

One existing FIELD_GET comparison warning also occurs when compiling
the unmodified driver with the same flags. No new compiler warnings.

 drivers/rtc/rtc-renesas-rtca3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index b3875d041de5..c304ed60edc6 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -765,12 +765,6 @@ static int rtca3_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to setup the RTC!\n");
 
-	ret = rtca3_request_irqs(pdev, priv);
-	if (ret)
-		return ret;
-
-	device_init_wakeup(&pdev->dev, true);
-
 	priv->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(priv->rtc_dev))
 		return PTR_ERR(priv->rtc_dev);
@@ -779,6 +773,12 @@ static int rtca3_probe(struct platform_device *pdev)
 	priv->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	priv->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
 
+	ret = rtca3_request_irqs(pdev, priv);
+	if (ret)
+		return ret;
+
+	device_init_wakeup(&pdev->dev, true);
+
 	return devm_rtc_register_device(priv->rtc_dev);
 }
 
