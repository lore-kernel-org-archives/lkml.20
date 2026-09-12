Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496AF367B71
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196233; cv=none; b=U5UsyYGWrghDAeXF87si3qyNHkriMQF0arfj6OLNFpJcL60r4yQQxYjD3gqE/bik2i9A9F/iB280gWbeWGBDyO1ges5sbm2C4BnZksdxhB7SgTMqva1TFisdI3zYGllDiX0i+taunAUccbXqOAZ75Ehn/NkJo4bP/JNcn0JXcmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196233; c=relaxed/simple;
	bh=mr9mEofpZg517wnfuvyOVQlKcymgg20rBs3rPdaoQTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hA4U8im0vNdrrpK3AYg9QPPT3alEIIi1yD6mdSZyqJ1U8/MHPI+OlMjO2BFT5R33IPVCsf3pjWH2tMMNL9qsCWBDUtowpFIV43LhbXfPiSe7QxRNRZyxM7reWTj9+ZFv7+WDD2vBIEpAB5qugJCXk6sOjo4XR5KMHBic+bq/x/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQ7edGGc; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQ7edGGc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso245617f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196229; x=1789801029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=81nBBk0ZNsJNmNXGHQvlj0ybllEDe9lXdGKxk1W969Q=;
        b=BQ7edGGcyXg75I9K0WkY+sMjmYL4/JPuPrsehQFI28AOotsdiDSy3dlQwWiXsXnAfw
         KB5VuEQ7yFFJVuV8++TajvFeqOX03DMT9JmxVcKPt4rmtQKvKUYsz1Q6CzyyhyBygZ9J
         AnOssCbbPZcXtNius+J7i3bWXwWdPIhEjclfw+jrdZWJoFWZIVNYwO63tBv4bqRQZAeP
         T1Su8rRFWs6WpdzDBlqbYCkQCquoHaMa91zD+IdrU/3yL2l5P1HvUXZWXCVVmMbxZKY0
         pmA82b/s4Su4PSa4xsVwPoZT+ps23vxX2IrEc689BmPxRmKSza+OvgjoUSHOOoO88Bkk
         bEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196229; x=1789801029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81nBBk0ZNsJNmNXGHQvlj0ybllEDe9lXdGKxk1W969Q=;
        b=Iask/HAdmE3qMNtuZvj3Flt74jHGkzTZaeu6GT7uO4q6s1TNrSGZ7VC0LRu905MCgf
         +4CxqSRZ4G6YZE4j63KZ0Q2UaDvl9ewLXynteKTPJFA99Pm4gVykUabruPV9x39OlCSg
         lQ28xWywKhHnWDjfIb6Jct3Af64nzHgPolpahnRd9H2Qj83Bdbhp6uUloyce5c6V/IWR
         xxax1IuX+JWRPP3QZvb6+namTXDEihDTWXWUto5ZXFPNXHIF6xYZ0+W4Kv2jfZLHwzf/
         bKeS6JzVWPVeY9R0N77MX0CiSZveCy7RwhD54ah11jDWfQyPDgbr1QKvJUh5iRKoBhzV
         s/+g==
X-Forwarded-Encrypted: i=1; AKwUvBx/agCV5LLbBrjiwRYl0MT2eCGfg/UdgkRUFSTR2AptfDIJBIqUm9+Afoxf59lz+B9Pyh/eylXI+C0phic=@vger.kernel.org
X-Gm-Message-State: AFuF++kqtynwtyjd7cQuhJZ7+EHpfOpZwya83D61PvbSI3P+pFEkqT0N
	J8oP+mMj87k67QJuHK1arbxTXnCvcoAtwwDtxNFbfCY5XySAkgHNeRlZ
X-Gm-Gg: AYBFou21Q7KUlvAMyrQ0Xlp4/geSfyFg/6DQvZcCe2q89Q/zua0kJO+MccORYs5e7rA
	wgyIctDIjWFD8ApcG/NpUd2e6c3s/Wx59AtI2cqoRKTkjpbXoFVYXaz/2269nX3QO1gQVlqFeYx
	vXvwdRQ+R2a3Tuj8C1KEjjOOd9a+EQXrizdHBIrydE4C/Syabv+ibPYeFsfnfmXGtk5wl9PneaZ
	590Jbu/AiSXUGaUeWzf+IhnzmsLMVeyrmqW36pZoueTZtxnYfnRW/XEasFd1jSyOAhoczDqUHY3
	nSGXiEUHesY2treaGmQbbDvfnf0FiimpLJc3TqVnBA3lN7sYG+n4+6gOdNKGPGYJWpcpxrD2XmQ
	oaedn9mOv1J4QqlLCHG0n5uCCvVTr3bbYsrTHNoohj+BEXe0DKnfVbVRIAvlTpAsl0vsDMV1hIm
	2p5/cx0atri8XxISuG3HN61XlV1Kno0aaaQkUQ2FNtpo9mecSKv9H3GfpPu2UABCfYfmRAjChyt
	Pe1gr/MYhgnFZ3ZCydWNV7yzrge4cYys6lfj1yKGGQ+nAdQPgN6l7avcnPCWhjsxWnRiXVlFZhJ
	aeKNwyn7IeR0
X-Received: by 2002:a05:6000:71a:b0:485:8a46:704e with SMTP id ffacd0b85a97d-486f6c4b7fbmr1611416f8f.32.1789196229218;
        Fri, 11 Sep 2026 23:57:09 -0700 (PDT)
Received: from localhost.localdomain ([41.90.145.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm6495278f8f.0.2026.09.11.23.57.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 23:57:07 -0700 (PDT)
From: Kenneth Kabogo <kennethkabogo2@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kenneth Kabogo <kennethkabogo2@gmail.com>
Subject: [PATCH] soc: qcom: mdt_loader: fix off-by-one heap overflow in segment name
Date: Sat, 12 Sep 2026 09:56:51 +0300
Message-ID: <20260912065651.59968-1-kennethkabogo2@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mdt_load_split_segment() builds a segment firmware filename by
overwriting the last three characters of a kstrdup'd copy of fw_name
with "b%02d" formatted from segment. %02d is a minimum field width,
not a cap: for segment in [0, 99] this produces exactly "bNN" + NUL,
which fits the buffer, but for segment >= 100 it writes "b100" or
wider, one or more bytes past the end of the kstrdup allocation.

segment is not bounded to [0, 99] anywhere before this point. It is a
raw index into the firmware's ELF program header table, ultimately
bounded only by e_phnum, a 16-bit ELF field (max 65535). The existing
check in mdt_header_valid() only verifies that the program header
table fits inside the firmware file, not that e_phnum itself is sane,
so a small firmware file can supply e_phnum > 100 and reach this path
with segment >= 100 from either qcom_mdt_read_metadata() (the hash
segment scan) or the main loadable-segment loop in
qcom_mdt_load_no_init(), whenever the image uses the split-firmware
convention.

segment was never valid past 99 under this driver's own "bNN" naming
scheme, so reject it outright instead of widening the buffer.

Found by code inspection while auditing the Qualcomm PIL/PAS
firmware-authentication flow. No reproducer beyond code inspection is
available; I don't have affected hardware to trigger it on.

Signed-off-by: Kenneth Kabogo <kennethkabogo2@gmail.com>
---
 drivers/soc/qcom/mdt_loader.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 002100fe2..0d55e9e0a 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -77,6 +77,9 @@ static ssize_t mdt_load_split_segment(void *ptr, const struct elf32_phdr *phdrs,
 	if (strlen(fw_name) < 4)
 		return -EINVAL;
 
+	if (segment > 99)
+		return -EINVAL;
+
 	char *seg_name __free(kfree) = kstrdup(fw_name, GFP_KERNEL);
 	if (!seg_name)
 		return -ENOMEM;
-- 
2.55.0

