Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516204;
	b=mzYqT4m5jE9YYmnzCHps0bu6RY2gt0GMmbpxFCXKZeqKsPRWTvxQE8/byxE2lzJocKqg
	 bdCOBMjm6Ml5YkyTkPgs7I6ItuwOSKYMKEK6xLXYllEbaU1l2v6X26zgSwuLLuC703QHu
	 WN/i3wfhBCL5YO2uprECgi+cjLfRPT3z7JAs4RcBMHEyuLqIZHBnQstURw81Cx+ZPD98G
	 oyHDLMJMUBE39sDPd6KosTvs+BurU/IfQTgjdAIVXG2jY7VXTSLRn1+VIL4I4tlWdEfOg
	 evIx4fh6ZOfb8iggoTp887i65hr4I+wK+4GcqOWsusqlzoA8UkVl3RQ3I/povbqChcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mB3ExWCA2J/hz4bVxnQ14PDyt+eP4cInceMUIvD65do=;
	b=tenx+QKpHuWiVipKyCvo6DNVPVQpZ56CQnqUnpL3xvQOOvgXabtrLa1LUcybI9/eWsKA
	 E+wcECZwk0lRLI83tFWqp83q0QFsPnZAGdRkMkA+6IiQLbiqNV5nikWiy9Wdc7inaCR1I
	 DVNsvTwmLnaeoG3YGTowpBx+52RP6HxTAUhQO+brehr8ZG27YfaeF07UNVEdtw/sY4t6E
	 amQY+ZrQrHKnHtZYuoe9JBz1jiHsCFfc8S9J5/6A/vi9OHsP+laGYLerYCnBBTzDsCeyE
	 lCI+nmLRFEcI+cbt/J7bz2AG4j+Dczr22PtJdt05toxTg4dObFw/dMBzJHma9SPf9RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B8N1Y8kZ;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0782360A2617
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0782360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B8N1Y8kZ
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3663e04e9a8so1045663eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516203; x=1793121003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mB3ExWCA2J/hz4bVxnQ14PDyt+eP4cInceMUIvD65do=;
        b=B8N1Y8kZaV6DSNONYfzoeySsAqHneCgiJOPMig2VYypdH2KgKHSubkP8Pndr4Zroyo
         yE9ggo8Dbrmh7NmpTbrdfvnjA+hk0IGqE92NidH0MKFtj/YrPMibyb9elrlTVdPWsGgv
         rz8sHXqfYN/qR/m3s3rHfem1j3VvjHCfzWT9/92/PSzQusPtwxWJbT+czb2GXrJy5DYr
         y4FIeY2bYu7WmzQqKqVHGtA2oca4l83R6s+jtOY5d2smLkG74tRfs4i4HJU3eeGa2ng+
         jZF4rILbj7F3XBxyqY0zP8uX8E338mJJj6HhpwLFxsucpBqDq4y/Wa0PHCKz62LBwpLN
         BRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516203; x=1793121003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mB3ExWCA2J/hz4bVxnQ14PDyt+eP4cInceMUIvD65do=;
        b=jF8dUlehRMy0DAuHTBJP183lbjzYaSLWEewPv8HIxfUsLz1mt9Uds/KQyRPtbG6xXY
         bYiC86XnEB/Y98lYMYi98CtWPAKlGjZppcb/eAq0tnWm4WifNKujj1y2WEJf9vt/88c8
         nEAgwjskircGsZi3cwy5tHAoOv3cUhLbBLTdbBO2NJGte3cd2rKLSE1hDV6Znk8m3ot4
         3ea88JfktK//bhzamNbKts17JHJvnAZ7AIgoyneBrGBL5V2A3UNJXNZyTrnNr5jWl4J3
         yvwXmfvnlrun9ClPvm/zZI1u6b0spudV7ao1AXAYHmGZ0OJkN/+rtTKZEGryLKaqvvrl
         lluQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0/iFxWqMSWUGUMfgZC8d9cXYTsYF5LlywXLMnXg4eA4FEmYJ4sLrOCVIuGtIRzJCD99hhmOmXTyMsAk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4GqyvdfoK0/Fgn3nv25P6RsP3UHOdWxzGHwoWHyXxueLyXQ1f
	+72HQ5qxGjy7bdqJyIVruqoDyEhJsY/uk5oiX+0dy0OUuWiKyDmKAtin
X-Gm-Gg: AYBFou1u4b5cvG6JquWHOz+1zzmRABInDoaxvM23vKEgOcUSIL/h3sOPedR/NwT/yB0
	M07uTbhwT1l1HP8WtfftIBil+qCATktcPeBDQu4aiRm8Wu5u/6MYZ7Vr0B/VDFmL4dv5x9z1LUm
	sIoFuqdXotRYX95tOgJ8xa4qxzQGb/q2AZCxG9fJM05ljWXpAvgeybSubvB8NPsk4XS0lGoPlry
	cH+JLrQgPizhrGDGrOpqkQ/R5XIHOY1IgJw5u9bGgy7gDn4KeUOidvwWBN6UQP+xV0xLXJ9dATe
	uCM5B47qGCU3ooC197+LTTSKzXJs6phDGYuvPSaDMEIwGkgHkEUDvgQhn/K7wfvUzDFmeOgPlW4
	wkPxai2NAhbnL/eMtsD6hwr6rELb/Y7AgAOnejML1xsENnI36aHLGPfg0Keimbef2DQq5qDTHnl
	R2wIx1Z7gVlQ/xjv5wiRZQE7oaugoPXtYNoAlry3opkUhQ+QwXaNXAGobHpXRdYLnuGP0ZdqAy4
	yp8lUx1eRwymORrGKUIbmAmT0s=
X-Received: by 2002:a05:701b:4202:20b0:166:4b44:66e9 with SMTP id a92af1059eb24-185139ae07fmr17061416c88.32.1792516202910;
        Tue, 20 Oct 2026 10:10:02 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm37852008c88.17.2026.10.20.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:10:02 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	tklauser@distanz.ch,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] cpumask: Preserve short reads in cpumap printing helpers
Date: Tue, 20 Oct 2026 17:01:26 +0000
Message-ID: <20261020170126.15428-1-dennylin0707@gmail.com>
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

The cpumap printing helpers unconditionally subtract one from the bitmap
helper's return value to exclude a terminating NUL. A partial read may
not reach that NUL, so this also subtracts a data byte from the returned
length. A one-byte read therefore returns zero even when data remains.
For example, this command prints nothing despite the file being nonempty:

  head -c 1 /sys/devices/system/cpu/cpu0/topology/core_cpus_list

Subtract one only when the copied range actually ends in NUL. This
preserves short reads, EOF and negative error returns while continuing
to exclude the terminator from complete sysfs reads.

Fixes: c86a2d9058c5 ("cpumask: Omit terminating null byte in cpumap_print_{list,bitmask}_to_buf")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 include/linux/cpumask.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 4c8bb6953107..2caeae982faf 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -1334,8 +1334,14 @@ static __always_inline
 ssize_t cpumap_print_bitmask_to_buf(char *buf, const struct cpumask *mask,
 				    loff_t off, size_t count)
 {
-	return bitmap_print_bitmask_to_buf(buf, cpumask_bits(mask),
-				   nr_cpu_ids, off, count) - 1;
+	ssize_t n;
+
+	n = bitmap_print_bitmask_to_buf(buf, cpumask_bits(mask),
+					nr_cpu_ids, off, count);
+	if (n > 0 && buf[n - 1] == '\0')
+		n--;
+
+	return n;
 }
 
 /**
@@ -1356,8 +1362,14 @@ static __always_inline
 ssize_t cpumap_print_list_to_buf(char *buf, const struct cpumask *mask,
 				 loff_t off, size_t count)
 {
-	return bitmap_print_list_to_buf(buf, cpumask_bits(mask),
-				   nr_cpu_ids, off, count) - 1;
+	ssize_t n;
+
+	n = bitmap_print_list_to_buf(buf, cpumask_bits(mask),
+				     nr_cpu_ids, off, count);
+	if (n > 0 && buf[n - 1] == '\0')
+		n--;
+
+	return n;
 }
 
 #if NR_CPUS <= BITS_PER_LONG

base-commit: a73b4d1fa7d334a5f7de5bb0a14726530f66196e
