Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666971;
	b=5R9Ewzai+NqH96j/r3a48lfY9+bVZltWei4GlsWvhHtfm1gmBbWdzzjWfVfmGAs3fNrx
	 N4TPWHbAVRD1R+AI9MO5BMRjVFxSyYoPnA6/f1ka2PtOmOZFUeNnos/CB5uBjmFxl7NNy
	 zT8Bf+N8EUNmDkl4werPfpXLZr+tyfZCwtRWQKUX8zW+oVnN7/uPLhr/6WDd5aGtyqCEB
	 o1grFbqcOvajSpHrK6Ld5oZcg7ajuSHiIgUOADw1SkaxaKUwzuPgBb7B2Ue+KttI7PIB4
	 BQSVsEDe9xtBpZJaQYi4W8yGWpoX9QA1ssN05+Xa0N1C+ujokZjvgBfdK5EynnmQkZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VjsNzQid7B5tPfkBZr2VjXdGxhrE7sZgV8VwRF7Xii0=;
	b=ac40+WqF89jvwGcjggV6FJxwbb5ChapY8kYxyW58i5aLXRFWob1L/cl48MiFvKzGN3z7
	 hjUwEHuTK9nXHKcvM0jWOZdUeRmAz3Vs3HR7n8S/zgIKxp4YOtKD0nx03e818QCCP1kPa
	 6kkpHh+vZkXCZ/rAou/lxXYDd8d2gEcx2tbRpChJF4wFd+6lDwKdB1V0/7+1c156ZkC/U
	 v3aGI0c5O3bGmYKyDKybhj0UIWIOfq9eKI4Wkrwq2+e7qOTr1KfKCtytHNCKPlB2I04ad
	 3eOwVsLKR2/gKWrOLxeYmzXnhKvpSZ/kiwAuikI18zYIGJwDHUHLiYQuFekWwQu2nWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FpoejA+z;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D42606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FpoejA+z
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35f036b17easo1301892eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792666970; x=1793271770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjsNzQid7B5tPfkBZr2VjXdGxhrE7sZgV8VwRF7Xii0=;
        b=FpoejA+zFi6zucS1lD971B/Tz1ArcaM5Ue3GZZh86ePTD+zHFcZpqrE6GdGa02ELyk
         qiwhRj7Rgppi00kkMx3L66tzH+6pKmMK28g/m15loaN0I7BDWPcRcArPHBZIc4qndwMb
         kqHJUudogy3694j04kpu6HTHgp/Ge/7HyoJOananjZZrszbr2GjRr81DJwoZ8Z7dsItM
         A3SoEPQYzUM7p0F2cxpCelUPh/YujzWJ8hOuaKqlUB79kqxwv34XOktd3uZXw92ep6Q4
         TAwZifncqo0VRuCP4PJPGI8lZ6o2KMOJn/M7sbnxNs6aHHS/POc5ze28KolADyxFe1q6
         UMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666970; x=1793271770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjsNzQid7B5tPfkBZr2VjXdGxhrE7sZgV8VwRF7Xii0=;
        b=bC4vItau7s4zoa7qLLqevaY0keK6eNtxN661A2/upD5xxiwxW1XXBcyH0QufDhKnhY
         edNh5d77vgAnu48azzbOAELK4MM5xmVZtA6wY5CkHOVzvY2zL2ejF1wYCRQBdoPsczAk
         /di1iCkCdXAXTHz4Tn1Sh2AVY0XYdfu1XFEy4cGNocmzfxeoWuWy6I1y7j7KnRyomLN5
         PCFZ+O0iVFDMpqvta/v2pqbeaqysmXtU+jwT/o8Lni6uRVfEdaHqC7Vgzx/V8j9c32vM
         tsJsnXOjhXmkxtrUl+lE3KtuSTgHm1rQbmbZlKsq2vfohdCPb5FixuEgUxeRYz7Tziyc
         fyJQ==
X-Forwarded-Encrypted: i=1; AKwUvByjljmRkwICDq80gerJd8Ermfj9r5faw21QJ/rmXOs1U3zhX1d6px6WVDeUCc7+G/EluD2bFrDoBYulm9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfv9sVXTar6jpDNhRq7TiJN7FicWiFiUUFcXW/fBG70T2lBix4
	akfEBoko3DeCwKRnpszKuGYUxsUkK3Y1KtarCUQiCCwnoCIavbgCNSb8
X-Gm-Gg: AYBFou3FnbJ26JZ1QYrgYApgYdulqpGlYs4qph+hfdlbaipSSDu/T4kwRNTF/31fQ5E
	SkV8Vns9M3PEMKd9+L/ycX88hA7swc1qH3C5ItXxUjMGCV5jchxn28eXuUl9oxYBujOW9wVeauV
	itEPEx6qvUGk28xBvmXrf6tGMq6WouANq6rZCZNa8nL+Ym6Y+XafBq7Bq99novkx/FJ59+fnP9y
	kTxCqKOvYJ11dIqoTFZsVP3ZURyHyleUAd5jcm0Q5vB/M9kJpFETAFsGmLTecnU6aC8TlXK7uvD
	C04RYWORrRThBckTBQlvOuJ78Lod/kwAqsTJ9kKJRpWvUggN5etbGIcrb0JE7a0kPgnrvGKG10T
	GDAiEKh8TUCWCeZWupQQUrM7PcAt95h6smuBGCWi+0nyyPNfiz0WPP40XyUFTbSXp9jRm0N6/Ey
	RUSQf042MEJRoXTjDqdpS7cAFgggx4DhuEWJjLTFcxSIoAZUrsQcHju/U8HiM4u5BV9x399TIYr
	sSiRuXWylTCWqJUDC3apXr2LjckA2UzE2XMCTjzw4u7F2n40BotF+254xkhjmlJ
X-Received: by 2002:a05:7301:d183:b0:369:860e:47c9 with SMTP id 5a478bee46e88-369861d8ad1mr627733eec.17.1792666969949;
        Thu, 22 Oct 2026 04:02:49 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:1eb2:a1a0:7ebc:597e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm17907353eec.15.2026.10.22.04.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:02:48 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH] staging: greybus: Use fsleep() for delay
Date: Thu, 22 Oct 2026 16:32:38 +0530
Message-ID: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

In the loopback function, usleep_range() is used for short delays
and msleep() for longer delays. This requires choosing the delay
function based on the requested time and converting microseconds
to milliseconds when using msleep().

Replace both functions with fsleep(), which selects a suitable
delay method based on the requested time. This avoids the need
to choose the delay function and convert the time manually.

Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..2fe845eaef29 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
 		gb->send_count++;
 		mutex_unlock(&gb->mutex);
 
-		if (us_wait) {
-			if (us_wait < 20000)
-				usleep_range(us_wait, us_wait + 100);
-			else
-				msleep(us_wait / 1000);
-		}
+		if (us_wait)
+			fsleep(us_wait);
 	}
 
 	gb_pm_runtime_put_autosuspend(bundle);
-- 
2.43.0

