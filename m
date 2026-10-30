Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373527;
	b=yaK8GM2+53KCCkQozzIWtW/F/YMGCN1OepgjbJHxOZBZUBv28e3CIWPDTZwof+W9jj1+
	 tTAkOS6AGhLGmvgQdq3UZZNZaXwlhymosbBhgkpuBBgzP//4EK9JjkWynw20QpWRP8yS1
	 7ezCjW1Zv9A0k1L6HSQ5/OV18HtvDHFSojPYOq4rQDGX7ZEpnDj9aBmcMgWJF3xWS6mpV
	 m8zXhW4IyabOq0sM5POFsckRW2igWMLgl0BO+lV/gt8yd4RpG9kDU8fHXGON3v8ufdjpf
	 Mq3N1qtJHEu0itRNJGnT9jTvYiysamXm8WHwXV82Dl+ZRIoCU1wQ268AMb9k8UIENMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dBreIU+VClUm9Ngyy8NYf3+5obDJYkm4PIHOu/PA0Po=;
	b=P6xo7BvDV1v1WXkuilI2J4rMObWVUgvyU9VoezaevcnbqAX6Q8JdmLSF3HOsy41+gLLm
	 XbO8bZbfkwyO0zf1plkzKoJiVsWIqv0ktHNZ6iVQvrWylpkTwgsuWRSETU8J39tYDE/IL
	 3DoX9ymEEZndsMSotiADr86l2Mwpq5NaxmBK82XXE4Jvpi9lv+6zef2lmG03B1zpOv0bE
	 i5kXGXrGXHRsaHlDTvdggYhDV5iCQP2H6R2Suggkv3/AjNWyjf4RAFSO/CFf7Tx97cFPo
	 MejRWxtgP1DkVgp6QYNpk4BymcYwRNOcM3CvgZ4AEC9cIlPA/AqCeUUzSfpJPey3s4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BhkA8XAB;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADDC606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADDC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BhkA8XAB
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so6355995e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373525; x=1793978325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBreIU+VClUm9Ngyy8NYf3+5obDJYkm4PIHOu/PA0Po=;
        b=BhkA8XABwH60YUY6A4DYiQrG6AhhCoc80j0zHujRLwuXAjbpDWkNZIMq9auwEz5Pp+
         8TemY7jGZoj7rFMy9+cAvOogug6qb0kxVpsJ8eZfkBKcxbDasRzbDxyn6kl82QPjGX7v
         GDdtmeK8Sr3N3cBLUtqVkqA/BddUXf7GolWRnOkqR+vD3M+j/39fNX/rLGwD/khsoLdQ
         RrBCy4PSwt+Ep7KDkJOyitMNl6L0P82fyHNDjhxR/diEakL3PyHDkCGPQWYygmU86sOe
         xk7MOKf7+ymDMF4VCUamypcNx5iz/435ftwkilGofyGlhMXdx8tfYSyVyMlPj6JrPBsn
         r87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373525; x=1793978325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBreIU+VClUm9Ngyy8NYf3+5obDJYkm4PIHOu/PA0Po=;
        b=wEEBl/njWisGTH3BPqgHEzLUgDW+lHBWzOuYAnZ6ziwW6mo6mrpllHso557+u6v53U
         qXqvGVW5rW256uuxKftej5bDth2sqY9zwaG8fDFMeyovVKeUvv8ddjEwUsrHqHa/GGaW
         /dFuIWb0DrVVMnOwyHVhMZi/3NLtoT4SluBkBt2/VnAnAk0KLfzIOHTKsPhJh+mPGrxH
         oA8Ex11IBSpgKURu3nY/RokrcbDhf1W36Zdjoi28fMF6jmcrj/cP5L2m7nlG7AzkpFMF
         jSxdRv0sI/rRZ/lFvOoU9dekKffcGHogZniwI7lExnnx3H212FQkKSv/aq3G5ECd8Fw/
         /HJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzI0HKrCm4Qcy/x4b2Dk2+XFxa5OmiWeOT73nTb2kJNxMh0J/KDWMk055qH9lax0jEj+X/7y5LvGKZEf30=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhDczJ10Zrbmc9wodiX8ePdVMwMo65ROyZxdYAtboVRIwSplY0
	qKZV9z8VOPqtxf+oQGrbEJiU+QPY+Nu/q2Dp13fKwJgh1Dza2MdyvIqOVFFnLq3v
X-Gm-Gg: AYBFou1vQujzz7Y2OXKxDCclDBvsvovafabjt6RFnr94vkoita6m4ImXPvkISQwSyTp
	KYqvZXABnqy1e2MM3LA/LIB8tT4ZsLO4zgtlNLDkxomif123X5QeySwZFaWeFsrzQO+lGdrRjkL
	8fi+fLA0sJLzTzQZcLlA5z7zPEDiQmN77AVbN1fyWOlpKMN7ifELjQ4C33SSiT0GVRXyjTQBjxY
	0Ob8GJcE6HR8FgCzyW53i4bdebFiBYnDSPbpETh0F5aKhSv7aMQgMijrz+H5QmMCj+MvIsG1qYW
	tEjsPbpkRcxb8j1RU8ZbyVisYFRYUNgOuYkPNIwpJZ3Xy46pDNv/K/VwRdRyPWDLPYjolm0oDvB
	78WcwChPziEK8HVmpJlQBasS91r1pLyTv3hllYNiGB8am4yi2Rv+ue1LwMyT1wIpHGABBby+hTD
	iBg90yyfcGquRu9g3elsjZryLENh/M+ZoMA1Kw3sWMNoJBhzjQgvNRs2KiOPBNkUjmS9jnJ3XJt
	kKRQTqUtsCe0R4VI2Y7SQlzy13Yup3ZM9+HHKd1deDH42qlfegmIzM7WievRSkfpMwdZzPSemQV
	h9vQxrsdqklNwXS7k+rJihDDu0rRLHGgESW6
X-Received: by 2002:a05:600c:46d2:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4ac187a6a38mr60385035e9.19.1793373525429;
        Fri, 30 Oct 2026 08:18:45 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:4c28:1e28:e855:3780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm69228685e9.13.2026.10.30.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:45 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>,
	Pan Chuang <panchuang@vivo.com>,
	Carlos Chinea <carlos.chinea@nokia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HSI: omap_ssi: propagate wake IRQ setup errors
Date: Fri, 30 Oct 2026 17:18:33 +0200
Message-ID: <20261030151832.2453569-2-thnkslprpt@gmail.com>
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

ssi_wake_irq() overwrites a failed devm_request_threaded_irq()
result with the result of enable_irq_wake(). Wake configuration
can succeed without an installed IRQ handler, allowing port probe
to succeed without CAWAKE interrupt handling.

A negative gpiod_to_irq() result is also passed to the IRQ APIs,
losing errors such as -EPROBE_DEFER. Return both errors before
enabling IRQ wake.

Fixes: b209e047bc743 ("HSI: Introduce OMAP SSI driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/hsi/controllers/omap_ssi_port.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hsi/controllers/omap_ssi_port.c b/drivers/hsi/controllers/omap_ssi_port.c
index 63e8bc44630a..6476c75f063c 100644
--- a/drivers/hsi/controllers/omap_ssi_port.c
+++ b/drivers/hsi/controllers/omap_ssi_port.c
@@ -1039,12 +1039,16 @@ static int ssi_wake_irq(struct hsi_port *port, struct platform_device *pd)
 	}
 
 	cawake_irq = gpiod_to_irq(omap_port->wake_gpio);
+	if (cawake_irq < 0)
+		return cawake_irq;
 	omap_port->wake_irq = cawake_irq;
 
 	err = devm_request_threaded_irq(&port->device, cawake_irq, NULL,
 		ssi_wake_thread,
 		IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 		"SSI cawake", port);
+	if (err < 0)
+		return err;
 	err = enable_irq_wake(cawake_irq);
 	if (err < 0)
 		dev_err(&port->device, "Enable wake on the wakeline in irq %d failed %d\n",

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.43.0

