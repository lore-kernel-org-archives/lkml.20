Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267739;
	b=VL7m3Rhf0XX2I8qLNEWUwh0Dv9zpYRII50s3detC+HfFp0bFFv65JPkpGaqwXlqbac1O
	 Wzus8Pxt3jynlvkAXiIKCqhPOmuN1jmauCTzkw1vbgiaVBkfH6DemmQXtuw/Yogv/fd6i
	 egLFUOzhCzeV4ujht2eVeVolgYtP/1LgxJ49J2JPdpIvQSd2ZQFZO5oInHrQXh8tUYJSM
	 2wcoiZg2tG1OTODi7bhhk7NOCZH6IAePcfipfoAt/K1RJKsXP+nm+XBaDUKekScbK+bbr
	 0iAPdtQA3Tr+HUojQQ28f9COlPp/WzdsZxpiBWo95u1oyl2FWW6Zy+OsC2/8I4YupmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
	b=UnM9AqoqUeYjgOn9DkuoZn0mDCC+iJTaBuyjDGFtiDVn+VAy61FzhQqhgTIhp25fZ6W1
	 s/3dTR+YBu/l1JIurG8ITrny/uTJvyWkKl5A6tNklWyYNlwyqqyZ1lo6xk96CYFm7Rmc1
	 TC3g9AsBdmLNqqdSUV/jyI7JU276pENUNmw8061dnf4ZdeDtKFEGzV04oG//wgnsKLpre
	 6yetkBfhygNpV6YlwaHESKJhhZJpaRW4wnMK6zOUZbxol2XlCAph9kyijHaSAD9gjCYZv
	 QK3hzV3xSPfX5VzA3bmponeYO968T/NCfH4ySfhsoQY5lCe6dWTIqrhsTx89nH3Avbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oEQYQoi6;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71CC60A5BC8
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71CC60A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oEQYQoi6
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso947458f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267737; x=1793872537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
        b=oEQYQoi6O5OkmaVCImNttcNnUdvVKpb0O7KkvNejGJ+I/Fu4G5NZNmSQ5M7D0bbXHs
         LlXR9gm4qKWXqFAEg0pocyGjYF9o2EYKHvVNlycPS4yDoUynvYGr4k6UgrKZkVQp8QYI
         rTKHenqSu8uu/AJtE7gE5H+c8BCc1jG8pdGHKBfgCz3oWu+ADAtFpWadj7JlH5MUs+j+
         wiLDr2hi+sS041vH7Uz859v2xpYlu4Fa16AppE731ja+Go6IuRIe1rPF1Uc050QDseu/
         cLDxGnzojwXgsQTW8yR4PqOGHWaD4gilAhruMcu8mztXfgVHyk4h849p/ReKvM6R/aOD
         Keug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267737; x=1793872537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
        b=B+73jt0/39+FoqpwECQmfz3Qw2QA9Y0p+ytUKb+NOVbVhnCKB8lafLxWYL/qnDVPpS
         5+5v8xQYkl5JJ8SqkKE6PvALxDA6cOUr4DOa53YSCMoYfOYjZsrzv7PPaHiuBo2TN320
         fPuYByrMVu1T25dD1UuJ716j29rlQTrlPM2NU1gqQ9KxnAI2cDdcLVcbkXkUhvlYbQh7
         Aar9PQINVR5KuEfKOFvHsfQIS1GPfLRAUA/wkmjUiWs4aN3nFFvxueVMO2+Nj39ouEo1
         jjs0b5bicFkSVlQNP1uXKofSGKkp1C+N//ecvgtuNbndPJTckKf3EJCh6kLap7g39Cuc
         zxlQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6H+UpTH1xj+jW65P2c9mS/OyISVuTyqR9HIsNRN+nNWpqECqxpTZ4c56f2bHWl2CQwV9DtJnnVEMUJWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0b9DOGQ3hhmf5sqfll3j+gZO9+s+KrVZZ4AlnZZ3T2ELPPyNF
	lmALOIsTJjzrdEHm6H1MNejqU64pBREGr9LhzNwSIBQ2sPGNCav+dI5QO8ZOzgI/Vmo=
X-Gm-Gg: AYBFou3F3nG5zdeNBvn+ctC9yjGQR1UECoKYo9GyJWawA5gAfgYw2ENBsbXGZJKFPau
	hwC/T+ovo0CJXpLeQ9PM7AaaMquGusfo/4R4PJfHovlpjweMD+cWaJHmTpjE6oxDg4DAuvBbBzA
	ZJUoO+PNzVDw4WIguZmFejH20agk3unaVZOO3G70MX/OHHo3oJZBbuKQxg2sDEP5gkEZId+f+H1
	3mle+vgk8dDMHQKTCGk/8y85aecRocpuTHE0NZtDgMhEV3/VUFHF9tKWNI5zTLAo5BF1/KnZRy8
	NM55ezZeH/GIzZXQnGTqADZ+O8oLbnEEYZdagReQSvY1JBMYJ8oidCyYogS3cmMA4zYvN8BMGlk
	MLCdmYkq9Kfdakc/XPnpmc7+bJfPtDxP27Fp11tQF0aUeRkL/XNk1ShGQ90ZKh6PJNme/JcKaxR
	S9chhGv1rOG+S55Y1OYI3/u1OzEe3s3Ve04Ex2vN0rt0JNdTBz8aFwRUbBB4Y6AGUauO+cDI/SO
	5udYRua24XagUk8PblyhJdU59s3In7uixTlPO5fXXEcKEVm6roqdSfahAm0p7A0HEcBeaX50ZMs
	nDFhzbskN3Edv7K5PDI=
X-Received: by 2002:a05:6000:2c08:b0:48d:bafc:a409 with SMTP id ffacd0b85a97d-48e5d2f07femr11643816f8f.26.1793267737081;
        Thu, 29 Oct 2026 02:55:37 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:19 +0000
Subject: [PATCH 10/14] media: qcom: camss: csid-gen2: Enable RDI EOF
 tracking
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
Message-Id: <20261029-v4l2-frame-sync-v1-10-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=bod@kernel.org;
 h=from:subject:message-id; bh=r3fC5w8imskVkr9dtc563HKXDPLCXa7nuklJaaLzUsU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgN/CQhAZC2zGVuf79kAiEOlROA2O29IaYdX
 +Uz6AaWj4mJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDQAKCRAicTuzoY3I
 OiibD/93UUs7BiNVc62lHKHfrHTWjqeNTuytUGxRwyB12d61SfMssCzrFjbWCl7sZup6b7NNa6L
 rwslL2n3zAnacn6iiEMXp3nTQPhhMz8RLlNtG3uz3aM1ITjLp+bctsYWqoLkGo03VfHpJzpIWTb
 AOOBn3gb9F+b489dz8NZ1mAau/Ark+ru5i73k5nKJqtwDpag1HKTCKzNC2NaMW+Jbj0kIUSxLce
 KX9j8Vq5YQgIAWo8Cvbe5PF7HlZ/9fhKLR7Cn5jOL41ndzcPZiWf2iJhylSWs0cXldMyoBhjFXF
 2d3VwOInug2JP3GTYxtX4IQA4CACRtqHNbjMeCOzsLvVXQ+u4sv5KYs9Tiwv15hYpciNVoIyetV
 LzFIMZlpK90yYl+5VWooufOIkSsU9mgfTstw9jprJcevKnjZSV7Vzk3099SbARPWCzIC6VDG2Hr
 3G8v22fPq4bsjuQCaJE0v+BJhXoIvKfinsw3vK4e0U4nK/orvY8Q6lpwIck2IUSIMXi1rUI90Rj
 R5bHMfUsOYIsrUCQunt/96L3S/v4/ub5gUvZ5K63/6VXCBUrjGQyJ7M6iT9tiZkdrbYpILqMcWS
 lRaTzT75RJkFdLqqap6owSmFrUEVRYMcU1bTen6gTXu84zWCqnUJh5Cnua91krDGodncnclxsPI
 qebnZVIn63N+7xA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the EOF interrupt and notify csid_eof_event() to drive the
vb.sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728..44f437c3f1ace 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -39,6 +39,7 @@
 						 + 0x10 * (rdi))
 
 #define		RDIN_IRQ_INFO_INPUT_SOF		BIT(12)
+#define		RDIN_IRQ_INFO_INPUT_EOF		BIT(9)
 
 #define CSID_TOP_IRQ_STATUS	0x70
 #define		TOP_IRQ_STATUS_RESET_DONE 0
@@ -329,7 +330,7 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	u32 val = 0;
 
 	if (enable)
-		val = RDIN_IRQ_INFO_INPUT_SOF;
+		val = RDIN_IRQ_INFO_INPUT_SOF | RDIN_IRQ_INFO_INPUT_EOF;
 
 	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
@@ -388,6 +389,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
 				csid_sof_event(csid, i);
+
+			if (val & RDIN_IRQ_INFO_INPUT_EOF)
+				csid_eof_event(csid, i);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.56.0

