Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211766;
	b=4k+Mp/uWM8WXInjesjCeABNsB9DxaKFdHf/9UJkNml9W5+IKm887hCb/BOUc1Ka/64S+
	 aKXuOHG0oKuldUfp1/VgeoImD4Y97DlQaqk6HvMtGCW5x4bhftnK74j5xNaPr+WXzwuRT
	 8SohwcmsNnGyMVRIVZfiR21w0Ap2Plg1CwF4bMkcxwk2apetzOA42duTgBCukds3i/fPM
	 JT4I4K5r4zvyXL8r7YwEHEh/rDXGveNDSz7MmCKCmsz3z6YvZY0iWmuPo/JmUwV4wkiIq
	 nxo7fBRHTHiPt6tC+Imyb4BlsBeJITDHq23YXdsm+/ikzquiGg0JAz6JkYDgGxQMd+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ckQaOyaCkThttSpAbhrh/L1t7ISpYeASQa0m7BYrxNo=;
	b=48krtYvNIdOSdYHxgeCa5CymLd/US84dZ++ehCx0FF2sCXM/Qk9dRLflp8RW3Ulp5EDQ
	 DYLBQlSLJSid/cGPzFeK51/MQEZU4Gp+EnzGPCgnACFFUkGk55pChO1ZlFCKtUlcZodrq
	 gj5/tVoFw25Wxs2GD9Vopof5dqJ2csn+A557kAzA4AHVLvZ8Rh6Yf+95w/K9FCYRkSB84
	 scYhGG7tcVC+/b3skc+IeMn90W/9qk1MRSXL8t+mVUumxmucNxdhfv/c+6upsTRVRe+/1
	 GgpwrTyDwJ7+TFJNj4Xo3H9gP9E+x82zdMJzvSn/yhhOD3KA2JKmcrDEFGV/CR12UEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agO8SIMp;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94622606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94622606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agO8SIMp
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1173367eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211765; x=1794816565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckQaOyaCkThttSpAbhrh/L1t7ISpYeASQa0m7BYrxNo=;
        b=agO8SIMpW2YXN0EgVurcxkCzz0SYtqGqhJfc4R4NXhMKDG5mZ9h9OyheomHfhSuhpQ
         C6Zq2nIyxi+Ks9PKmzau9NeeebXxL2OvodoMPsqlkFfvuln82I/xHG/7HawCG6kBdoJu
         rNjSGwuo8A731+PHa9tnd2gUPx3tEfTI0zVPo8uodkDkEWM+vpAil9Cjo7ySzXDRWPCu
         fCv7K0jjTLBtDniUOZcQU9gRAw6Lbq3wt985cGa5DaVnZneI3C02c3hwHEuAM4DPlinQ
         m8f9sEtkMQLVw3o/ovdw1SZ+NQBJLTsfR/WPpgNGCPsXOiA14kaJZzfnZEn7pp5IufRD
         AQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211765; x=1794816565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckQaOyaCkThttSpAbhrh/L1t7ISpYeASQa0m7BYrxNo=;
        b=p4OOlcnvD00s79hEUpNF4LUq7+kmtGw3pDGi5BwRVNt5xy6J0zN07buNnZYlYqzsqD
         C/7U2rgZhWZv+qoRe65/vEOG/xDQlY0fTY4qVXvy09cJ9gXSX8ui9WGABOkjDGI29+x1
         vN5sG5qWD2NQdj5VSEBWb8Ze9fiNI755O9QvugpxW0cqjSHSyV5GeBgy+eKScgOBYuKl
         A9+dhZD5L7mzLSsQNLT2aeIFxOzKEszr8d2g0ZvevwKubgKcB+6y6hJl1DN8EQZ1KbfL
         u8TjqHYiEt572xmdVPSMbAwcfge114FgJDYUAORkug599AYXlakPMV23OgyipreU4uxW
         8MjA==
X-Gm-Message-State: APuU4Z8ldZPP4Gk9N5m6Eo3o2bX/q2W/R5o2j5hmDfRSslLPPGDsGsOz
	9k/lXhGsRiJVJcsNvuz27o695QWPoYuuw+bsVH7ALxqypyxx2R3hGn//
X-Gm-Gg: AYBFou0dubcERTYYe7/DE4OXzV9V+tuVq1+784bKKmL2VRUchPTG+p4A9HchjBuIkyJ
	CRmoK1JsgH2aJix1TzZmfza2PZbBCisw3M/lrqy98kW4uEYvESUTnW0gArOPRWeqUnhfVpi0pqN
	oqGzsLBzxwFF4dfUtpdalIKIGDHC9UEzwTkbU7E+nm5SxEuWkOI2EFdGVjfL2ACAqMI+DtdYf8W
	SB9LVr9VGDGD0f1zF2vh8dD/ZHeAHHp9JcoAixw2WyebiypqzvNKZ0MGv2GgjVAQiwbaVsMx6DV
	5920VRZGSF55XKubBwcEqwnX72UOEFM/PEk8dphxsK6CLE61Pe3hW0eHR8evNudnzl+BLTkQbEZ
	lo6vLYo4qgrIPk24pfnsQ8hk2DY3o4mBxto3cTn0W9ZryWUT76eYo15jJwSHnenvj9geupfWvpU
	7fR7mBhpfPexF7ggRpnY3zMJbWlSKKZLES3mLofKfF1qGYG1X2M22WHxEucP9GtNOtDQmybgEbS
	5RSgHfgpR6yrZheZphv7CgTc/PopC7rIyhm4SflYUVH2sEsEqPISLm6aNW670x1n6m4wIyXKUwm
	z1hH4I5UN16ESseBE205qC8lmsmYRpowrVG52cw9Gq4PtFeiDZXwgg==
X-Received: by 2002:a05:693c:87cc:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-372570dcb8bmr6691661eec.32.1794211764633;
        Mon, 09 Nov 2026 00:09:24 -0800 (PST)
Received: from localhost.localdomain ([117.231.196.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm11954255eec.26.2026.11.09.00.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:24 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: core: Fix signedness issue in info read callback
Date: Mon,  9 Nov 2026 08:08:50 +0000
Message-ID: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The read callback returns ssize_t, which allows it to return
either the number of bytes read or a negative error code.

However, snd_info_entry_read() stores the callback result in a
size_t variable. This converts negative error codes into large
unsigned values.

Use a separate ssize_t variable to store the callback result.
This preserves negative error codes and ensures that the file
position is updated only when the callback returns a positive
number of bytes.

This prevents callback errors from being incorrectly reported
as successful reads.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/info.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..35aaa8bd6d56 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -144,6 +144,7 @@ static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
 	struct snd_info_private_data *data = file->private_data;
 	struct snd_info_entry *entry = data->entry;
 	size_t size;
+	ssize_t ret;
 	loff_t pos;
 
 	pos = *offset;
@@ -153,11 +154,11 @@ static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
 		return 0;
 	size = entry->size - pos;
 	size = min(count, size);
-	size = entry->c.ops->read(entry, data->file_private_data,
+	ret = entry->c.ops->read(entry, data->file_private_data,
 				  file, buffer, size, pos);
-	if ((ssize_t) size > 0)
-		*offset = pos + size;
-	return size;
+	if (ret > 0)
+		*offset = pos + ret;
+	return ret;
 }
 
 static ssize_t snd_info_entry_write(struct file *file, const char __user *buffer,
-- 
2.55.0

