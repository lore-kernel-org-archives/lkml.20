Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1253C371D1F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281817; cv=none; b=fefL9jdmzr7ebnS9kUaw/GU2IXpQIx5jgL3lysGwZVu/0VksYWSZ8/arEI0GguF1R501508sedyUTUFDM9oHx4iL20AyqLTr29rRX3NDUOS8dg197kWN5shrjsOrhMnIlwRK+0Y2HiEeFpZzPyg7QRwJI6IbQMtmVBShkIVmKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281817; c=relaxed/simple;
	bh=76GWlvs2S6RvtzUC9P3JnexZlLh1ZyGKNxkhMVs2ZXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuEvhlARbnPJew3zpkfieSpKZ2R4E/YPUQmIy1RmHYGH/KGR2A9bNc9db43oFGBsVSTsULssfSkCNGoYNVda0Hx48eQcEPiqEzoT0PqegZtnJg0uXgy0+mT1JLNoPUJWE9GVXN0fyjHOyGtRGlpyg8pbRc+9WDZ/HL9rAK1ah2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VF48szSe; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VF48szSe"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so204950a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790281809; x=1790886609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHtBci+7WqjdzbXMCO1Bw7FN1oZt8E0+8PQeHHnAE4w=;
        b=VF48szSec1kbFnNQa+iisd/htX2PWvVjUxdt6RduWvQJE++9yZpvi+T42Cogkml/zm
         W90K7RDfmsZsfr0lmjC4rEO5BvjVDR/2JomDiasVl34YQJ0em6ezekQ4cD8uFkzArL3U
         812hfX+zwZTTvnv9Ze6aw/xp5YFC686vnUfNT/gvVofIe4H0gsbHmvcbuiKotWcqsiFj
         uobbD4WxGUHrNc/BGMTHqGCp2nqoLBv6F49UP230epcyu/pA/4hQkrIhLQ7O2yJiGkJm
         5jIKZfxo3grdWej6R1k4b2TgdR+0pX1/FE/Kzr6+MOANHsFfaYQ18eKZ7LBlvZh63wHN
         xThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281809; x=1790886609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHtBci+7WqjdzbXMCO1Bw7FN1oZt8E0+8PQeHHnAE4w=;
        b=PFcmgojcxR49ko3Q0QoMkaVIEbClVnmmE0h7Z4eJBXvHHd+mVCBh7kgCekL84znpcW
         ILoEiwEV3Hcm3IJx0JP1uTQuXR6xAZClETkqpHvPxUqvvQNdrpwFk0lVIbssa9mjKX++
         FzeDGfHqK4lsvJQbeFkhfh/9q/F3v4sNbiOwkUQRZMiRsVvk9XwHTq7GH11RVJUsti4K
         LNpq/f1p2/DC/irJ7c2nACmFP+4hmlUrsZVeyIoL5hYsGPlEnvW3NqMZcLd3W0IE2dMV
         uJZNhrkleEzUNdAnxc77vadLIHnZ+hc+ZiIJyckmvYhUBjRiHHpuCvf9BrBkwFEaRDuL
         MgYA==
X-Gm-Message-State: AFuF++kym91r7itdCGFkNUw0YWTZkHj4E7Rg71jvFPeGjyeKGGiUMmsd
	MWZ+K71jStEZPhLS/geqtjqEMFjDTae0WnOALtunGr0WeWeBnlXm0sp0buAqtK1eoSY=
X-Gm-Gg: AYBFou3ryVnHMyQZZru5Ad8TZmCfPqmBSMGz0WkGtSeP0YynBhOLMJT5L0Z9ZZ/5CmK
	qZ/pUAWeA+N67U6GmxbNe3K6Yi3QrA13nukj4kxKjmxm1aBZ4mvHyH0tkb6Eu0Cx1ROwRwVzRXm
	xUlzbnp6bhTAtdT0VHkKyTnuoTZZ39zWBv12C8CLMZoQjeNNv9zFbI0eq0FSEKHdtw6GRCzTN0U
	tnsC3tncN+HwFNVSSJ0rl5PHpl165zsv/OH7DlbEQ4yM4Jzqp1z7DDWtSZp8iUR8d2htFRjSF7C
	O6PScRijZkvpD6RCElCuQc6ycAUvdSl4NfvJQyv8ECtRAIhXXrgu1jb06xWUciOLOAx2zRp16bb
	C8VV+2KlDjCvXRIt8VNvI4EeM2g7V5IJ/EgMlvxEtjGm0ebG4M9miVuluCFsekysXxrNsd28WLV
	JMSgenlI6N1sSRAledYXz+MYaT1xnmeMliDHcIi6p5j3AqyNsZFKC+emLIPerSuGjJVtvfT+MKH
	Ls9jQ==
X-Received: by 2002:a17:90b:2b45:b0:39e:6a7f:1dce with SMTP id 98e67ed59e1d1-3a098db96a8mr3321002a91.42.1790281809056;
        Thu, 24 Sep 2026 13:30:09 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a0b99917besm329407a91.14.2026.09.24.13.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:30:08 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Thu, 24 Sep 2026 13:29:56 -0700
Subject: [PATCH v6 1/4] PM / QoS: add flag to indicate latency applies
 system-wide
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-topic-lpm-pmdomain-device-constraints-v6-1-a69a4856252b@baylibre.com>
References: <20260924-topic-lpm-pmdomain-device-constraints-v6-0-a69a4856252b@baylibre.com>
In-Reply-To: <20260924-topic-lpm-pmdomain-device-constraints-v6-0-a69a4856252b@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=954; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=76GWlvs2S6RvtzUC9P3JnexZlLh1ZyGKNxkhMVs2ZXE=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBqtYhODZhbkM1juO/cyw1swsUEox3pCImM6+xyC
 H3dHpDyslCJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCarWITgAKCRBZNxia0/vG
 ZWs4D/0WTqo2e5qQ7xtNBL35E1bt9WEoNtN3eZpbs0Rk+I2KLURLaOBPNiFDLkJqiog6RDcGVqW
 UA/waqdLfTfLpIw5fld7rP5us++6Du0imc45Ur0utHwFq5Y/uUhXlppx4jAJeP++po3ITwpjeYC
 eCIhUdbLccfuyIW/DenacKfjjr4WIKgg4dGIMKp3x4aHwFk82ZKWi5XLYJFLh/wpSkG776PaNQr
 f0w/S98jyg7SVUN0SbCzCAGeQmEb5rx3T/DTsuVKoM4w+9yOg4V6X5WHPlcC/9f+kKQLWB9zVaB
 PegPLgjYvZKnbCYMPZ/Vf2LHmyQJ2N9Xki4V1LdkimZ/qT0vl7sdjeAvZidNw1yZzpF+JOOpTIn
 PEgc75KxVxkXvEjslxmTWO5Apod9vJo5TZnowzOqzuZUyr/RBwD6PMaac1Sncnn6o0sL7rTBEWI
 F211mLGKCNix8h8yfbtfGxU2YqGZoRj8OvwEqKt2ImCKrnO9OS4UMc2yEFdIV92zVVT/twYk9cQ
 Vu5EKE2FaykBB/Cje0V67qaQQ34FOJDABSg7P9qFgufz8f/8UjQNVAVNJBewtXt5eYQDTsJ1Lr2
 5uzRz9XMeKoVz1Nm2jd0Gjfj/k4bvBC3uvNbanwGGrDsmL4K4eoSR4Pj5/8YeP3D8frgFDODt6N
 k2gI/6Gl/P43dwA==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

By default, the QoS resume latency currenly only applied to runtime PM
decisions.

Add new PM_QOS_FLAG_LATENCY_SYS flag to indicate that the
resume latency QoS constraint should be applied to system-wide
PM *in addition to* runtime PM.

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 include/linux/pm_qos.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/pm_qos.h b/include/linux/pm_qos.h
index 6cea4455f867..aededda52b6b 100644
--- a/include/linux/pm_qos.h
+++ b/include/linux/pm_qos.h
@@ -37,6 +37,8 @@ enum pm_qos_flags_status {
 #define PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT	(-1)
 
 #define PM_QOS_FLAG_NO_POWER_OFF	(1 << 0)
+/* latency value applies to system-wide suspend/s2idle */
+#define PM_QOS_FLAG_LATENCY_SYS		(2 << 0)
 
 enum pm_qos_type {
 	PM_QOS_UNITIALIZED,

-- 
2.47.3

