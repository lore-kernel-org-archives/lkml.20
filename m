Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804618;
	b=D2TLtboNa5vDcXh8dodcNDIvR/zwfeOHONkDmY1rFJMPb6TXmRWnwB8pcafhfpPTAztt
	 OEn59TZh+EpSrCvgC9NK1jIZfiHPHSj10WUAQWO+6/H7hzCxG48D9ci/+pjVQpwTSEZ5r
	 XE/lXVp255wJTPGTwn7cc6mGe8zXN+8yDjL4uquepBsqyQtDT3h4kc2F+0wIEm9enrbcA
	 t6qe9N3EENp7yzAll4KgVzJQAvvikvg3wIAyxa9bCT2O8DR9/I2YOIaIaQBwd6xR/OjrE
	 2OZq5AZjCc96JCPP7r0TOSfqnR4EB1LMtKQmBCG4XB8kfkeZNPAi8oTz+HHs2pkxrfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=riKhaylCbDlpVRlcWx+ke8rGc+IoyU2HKm4r+6p+j+g=;
	b=buWJeFqa8Bui1dw6gzCmonxRvTHQJUbY5855Jyez9QdgSQTj6hKIYYZM31UZ7DYT3gFF
	 TL0pgy4H13AaVrP2a4pSpfIAlovW21N145rgjwNsd8KmiYCEr66IgWJlYWl6HOWXnWYox
	 S75eEgWoIMBeaqRHC3gOMwaFOO6Fl2EZGnFDUPlGten/CRdEvfxwNvMDIYcp896EXrMlX
	 9iUhv52o5zAhDrL8wQSI7LE4qOQEofeNJMdmquqY3EoSnZoLctKY/bbKHuA+WB7JIrmC9
	 0xSS8Bq/yrZD1iEfcxOitPk7NqE3AT52eQZh1c2P3dlkwMJ7GBGB5I4nZC+yOUZHjVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wk5J2toY;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA5F606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA5F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wk5J2toY
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36d6765756fso539667eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804617; x=1794409417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=riKhaylCbDlpVRlcWx+ke8rGc+IoyU2HKm4r+6p+j+g=;
        b=wk5J2toY9fRlni4nSjngWFeIdYhzk9B4vAMbGkcAaYVmPvs4oJxlGaAiWuxpih/KS4
         5TNfYGJbcJmSDmvYY0nCQn0Ncgib9GTZ3cS31doE678LPA6pVTw4nHrQ8yHUBqZeoQt0
         C/M0YOeKQggDUm3AkkXVZa6EyiReL4muBlkKa9N6kxabiNjRSk52H/b5bdnbuAD74mlv
         3ChZcknw51DYO4khI/A6GiaNHbsWs0gv7qlJhaeQp2htaRW3ldi0kPd84I5Yo8s3Z6uy
         GfCeTfkSzolI1/+8DyQelZJN0R07NjcmrLUm4OPCGMZBvW/jrB6+Z4TDS2ScMgMqkPHY
         ROlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804617; x=1794409417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riKhaylCbDlpVRlcWx+ke8rGc+IoyU2HKm4r+6p+j+g=;
        b=Mzv9k310c6nN7xRm8Vd+wov5YYa2mQQfZJMbBWnqgxlMi+L3ut2HWRNf7FpN77Bowi
         QqM5M37jCps97lkloLb3WGYyiFYpzPz84Qn5DTjjMYAFysDFdGdgoIZHqhpp/bgR2Zql
         nggLsw+9oonilJrvRFeByWlSsRx9bsKzbNvZJAx9bpg+kmEwoncjNpqHYYgZcexbuqZ0
         xOyWRZ0X8edR85Ch7tfA9QkbfzEX11DUP9TqArfUuexDnB6RfhVtU6DKbmfGq9VwHbQi
         0ustuJkkSnW3IGunq7+qCMPXmsaThMuF3uUGBZEuI3NK7ziTmE6ZTSXW27sHiELgv3PU
         zu9w==
X-Forwarded-Encrypted: i=1; AKwUvBzHsiDakT9QisTubk5JjPNRI2az1KWqcs1ySR2ctn9/c+HoazdslV06i+pgxO953WkT1b78lXLJwc60gSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+luwshZWYC6xhkLCcYlUtbgfVqbIeOQCSLsNEWmo4JMpmKQO+9
	ZgR3V4LltzeGNVgKSWW0/5EFoy1zps8s3dupImsQ9GwW1Sr8Kz7Mw2on
X-Gm-Gg: AYBFou13ngOcRCrGRGK5eExPJtlppyMh18VxiTGTUOQwfcnEHzwJTTBJEWQvUzkVSC0
	blzX+GTCSnHfefkYYuYbqZSvYidW3Tcq4HyWyUsvXZYTpxHKnIiJybRc2eT8j07IUr2ctqFmkyi
	TDneEFeuyW3COUUS+zXv7Jni2QT87oJGeJfzsQmOGdrQpjplMwesNVXlP4V6kofrBs0pjYOCtvu
	Wht7kuPiqHTabitj49tiYPM1T88wnZNiI0OnOCsaNbBlvtF9ecn6q4QUFXnDrx5EE+jK16hgD1N
	3mvi0gDTT/UXIYShxGod+TsAijzj85HzVImUI4Pi7BbE4YG+58Gjix5Jx2DgipqNIvSLaq3UFRd
	/58PmeK3cYuDkla6mrGPGxckjZSbWmU10S48tkLJHzm3Lq4OmZUKI9groeKwRue7wN/CV+A4k26
	iyiMYPWYSmt/2EWuF1BAsgjf5Pzas6lxRsAOu03KZyicW42Z23SiQyycmCIJ/kZGqWNtj8SMKUD
	nUHjE7RL3rALRWbQ8U39SLcd2f4P/QhUySJaueszP4fyQzsQIV8vw8LktErFcg3/T3cwVJ+s2r5
	6CtrXR6+QGRhkBcQ1V5X4a9OVgZm3WbSo8JF8SzlJxiUv8DeJuNDhXQC8bjNxmTndWog9BFNfhc
	MS6i/RbaWwxSGRBiOk451C2WHnpQ=
X-Received: by 2002:a05:693c:638e:20b0:366:703c:5ef8 with SMTP id 5a478bee46e88-36a423935f0mr25717811eec.7.1793804616731;
        Wed, 04 Nov 2026 07:03:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm9351643eec.16.2026.11.04.07.03.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:03:35 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] alpha: use min() in tsunami_console_data_log()
Date: Wed,  4 Nov 2026 20:33:24 +0530
Message-ID: <20261104150328.33387-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

The dump length is an open coded minimum. Use min() instead, and include
minmax.h for it rather than relying on it arriving through another header.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202610201902.6BG70hxk-lkp@intel.com/
Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/alpha/kernel/err_tsunami.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index dacf91d95..97e85237a 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -6,6 +6,7 @@
  * Register definitions: 21272 Hardware Reference Manual, revision 4.0.
  */
 #include <linux/init.h>
+#include <linux/minmax.h>
 #include <linux/printk.h>
 #include <linux/pci.h>
 #include <linux/sched.h>
@@ -650,7 +651,7 @@ tsunami_console_data_log(int cpu, struct percpu_struct *pcpu)
 {
 	unsigned char *data = (void *)(IDENT_ADDR | pcpu->console_data_log_pa);
 	size_t length = pcpu->console_data_log_length;
-	size_t dump = length < 1024 ? length : 1024;
+	size_t dump = min(length, 1024UL);
 
 	printk("%sConsole data log for CPU %d (%zu bytes):\n",
 	       err_print_prefix, cpu, length);
-- 
2.46.0

