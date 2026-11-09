Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214804;
	b=tyzYIP3YsQdDX4HBS5yhiWybId8Ab+V+YanM2Ba8m2b16We1em1r/OilxQJflFdtqYt9
	 c3hQqq8YwhoObPvIvJWVbkjK4p49D/YN3rBmYvfXGmEeBYxXUoPSfPt5aNwyMtgzO4PAv
	 QBgBEtU4pJAl4XSnDArxwrKff6e9v4WlvI2ooysERfp3u1H0vPsXOnTerB+ZaYPm/DTZ9
	 VGShbmOhIphkj3HnS6GbtApoYkbThqjAykKoOdfe+tK3vk2mwStIzwjkgkoDtPNyRYJt5
	 EaSBcITp5JS2Ne3U7W0LtLGe0HR8XZM074S872zMZpPCBMHSOSObScOcMukAGlvQ1IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yQXobzejMRZh3ysr8GTdI+280uHXDw6bGTek6fjRRrM=;
	b=Qs06kn4YdgkCvStEePM/6Hvh3J9qq09/zNOo0x2gsATrjsfCHqGCkwLeh9KezrAM+EBn
	 d7gWReAAW2Pv8lTLWry+pmSQikjfjIfvWI36hNgYhY6jtj/PZRuElR30BrN/P01y9mTLO
	 JyiP7FzLZasX/x0OAraDnR7DZHsBaWk1ZWJfXJQgrnYUD12UfEA09GzD4mb5VsyphzFE+
	 d/sp47jOGgBJeKkCs3xLwdF34KDW3K6tACQGgKU6KGR3NEX52QtdK6aMQPqqcCP2qWiKO
	 Dk+1AcXzdsLD3bExC4fAY1U4KB+YFY9Twdy73hyecpaQUGAJPZzdoqlT5P0UgP2mKsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/MFGmrB";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C99606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C99606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/MFGmrB
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1315293eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214803; x=1794819603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQXobzejMRZh3ysr8GTdI+280uHXDw6bGTek6fjRRrM=;
        b=L/MFGmrBWu0zj3v/CU7k0qJAB2PYPLJH5YZsOO3Of2RFrAGJtG1CWi8jKtElpUnIgw
         E24QIUOc3q7KejARiFZULq/nMFfS1ZaqFuUuS01HdyFScbFiSe546wGkPtxqYOEQS/6t
         t9UoqMewi3gNMMWH7o2aQxLrrQWlgxGgV8sJR85DtphSq48u03hIlFCILSFmflt5qYym
         5ZSyQ7eOrYv8iDg4huYO/Gg2ceI1Tw07QoywaM8lmZiDqeqy8R+4s7XSvkRUN7j6t+KT
         vw8/qXMGl/f9S/SrquXikuwAVEALqila0q9cvCce2cZvaI4woFFkBBMwx2BCnvhkjTxi
         wJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214803; x=1794819603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQXobzejMRZh3ysr8GTdI+280uHXDw6bGTek6fjRRrM=;
        b=HocslMvsNcV43kc/MWPFP5GM61QbAoG75kbnn/XdjRv774cHe8hQxagm80cTFtHT6z
         C3NjSSPZrZCR7A+bbj2/TzyPNjGQ/PGhx8jYY5XdzA1h5iXakxHd7OKhC/hkiVWeh3rr
         oxMYktB6EM6K6j3yHpEc91epd2Z3zi5rZeevOHpYeZcioon5lBY5WoMzIR6Qzenhfp1u
         lZUgRz8gRUlKye2ZlebCrG9Kx9PIXtf5ipu1J+tMMIw3Vuy1zmmw/tyh4I6NgwGb5aHv
         VRiblUA188S7MORLqUDe9sls5VQIbwcPBmcagIkSTaJWzzz0dm2a6qyoiS+1mCFF3Vkk
         IdTw==
X-Gm-Message-State: APuU4Z9IvGwqGEwqDGeOB5V30kL425IL5/wEGjVXHE+rY6ICyGWfZoIJ
	+TerctVzV/ELe4MzsOPNqRBKwy8qtz8F1wng2HTgGaXbSx6Ta0Y/1rFw
X-Gm-Gg: AYBFou05lnfXZeXQEb9FwA41cuHC+pIQnQsFQFLG/LxGzqnIhhSwmosLu4gx80JsJFZ
	pzJJEfcoHVuX3fbmCBvw6l2OQeJcIgpaGEOmRzJzrfv9vUj6iukqVvXRDvh/aA4buZ5Djb/XoW/
	yEVQJcSAXayGcnyrWz5CCntLUHLp7+Ps+TPgJLnBwyNZ65Ctf8xZQmsqFxoUidGXs4UwLOfaJr5
	pkPSBdfEYcUJyPMd2t2B2gPQrvglPy6mSRuHoNpO9KmfQ8rxz8I3ow6/jKgc1HJhrRAtYM//yXr
	iZYxqL9nApHmRcKaXicTP16GTlBRzIoJNtDy63CZrb6MnXW3+10/jJ1S2u4Z33KhmssXCAwCsN8
	dlnzaBJDgobFfm8HezfOGBUVp2zAeWqw7Y06KA0paMHxdIzPpSLkJ1oWz5cUv8Cp/l6g9MGrCuq
	hU9R2Y3p0RKIuxNTx31JONMQbydC+U7o0wAolalZW3W3/mxb8bzEvysd3hugnZkAbC6t95MrxiJ
	i2adIYBPPPm+xJjizLe9XA0VAeDw0he2hyRhMZonXIYmxAbQ3uFEONNGUGieO+Gt7QxNjSFKzJO
	yjU+aqj/MPqNlsIWDtznrGOMxHeOnAVg7u30lJyMU04HuqqouCFm
X-Received: by 2002:a05:7300:8a19:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-372570dabfcmr6174902eec.26.1794214803088;
        Mon, 09 Nov 2026 01:00:03 -0800 (PST)
Received: from localhost.localdomain ([103.178.204.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm11376971eec.17.2026.11.09.01.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:00:02 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: core: Fix info read handling
Date: Mon,  9 Nov 2026 08:59:22 +0000
Message-ID: <20261109085922.3104-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
References: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
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

snd_info_entry_read() may invoke driver read callbacks with a
zero-length read when the requested count is zero.

Some callbacks perform zero-sized allocations, such as
vmalloc(0), which can trigger warnings and cause the read to
fail with -ENOMEM.

Return immediately when count is zero to avoid invoking driver
callbacks unnecessarily.

Also, store the callback result in a separate ssize_t variable
instead of reusing the size_t variable. This makes the signedness
explicit and avoids the unnecessary cast when checking whether
to update the file position.

Update the file position only when the callback returns a
positive number of bytes.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Handle zero-length reads in snd_info_entry_read() by returning
   early without invoking the driver callback.
 - Clarify the commit message to describe the ssize_t change as a
   signedness cleanup rather than claiming it fixes incorrectly
   reported callback errors.

 sound/core/info.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..42312136f76c 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -144,6 +144,7 @@ static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
 	struct snd_info_private_data *data = file->private_data;
 	struct snd_info_entry *entry = data->entry;
 	size_t size;
+	ssize_t ret;
 	loff_t pos;
 
 	pos = *offset;
@@ -151,13 +152,15 @@ static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
 		return -EIO;
 	if (pos >= entry->size)
 		return 0;
+	if (!count)
+		return 0;
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

