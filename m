Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216206;
	b=ByeDEeVcLUbWA/r35BS77mW7QuXf/zMqiNGWeHRWV0s6sh2xcFNw5nVnDXuJliDGR5iU
	 k6EB0gKT8pL4GVgjfYYo22LBTLiiSd4+IdCklTAhpz0UbmHWAGEs2jxLpkbG+HKV5p+gI
	 vJH+6odoxTsbRR9orX3Mvj4Rl0GzQFBrILGrGUuP8+6fQMMO/mbUiiHv0vgjR8Ajxk/EL
	 oRwRTf4QLObtaWJqHjw+YES0oFVxxItEESB9dsbcaywVHGqmxYoy8V3Hy3UoLh8OZLHVC
	 1Cnb3LPUYo/6Gq29YjZuePQ8+yiI74jI+56vRb7ZXno+WBb128YIgk2ItWuvskdBxKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D8TR75PpSImbWX1NY6vplNQswxGOV4SePaeper/l4aE=;
	b=eaoKIQ2nB3j8IA2jjgLmMrkTPa2txdW243WH4GSyp8gmDG5hmiDrImVcIyNA0B48ceN3
	 2MPnA9+W5O4xwWrGsjwgJHwNIgGc6oUk+7y0TpPsNRn8+xF4xnxSLWjek5tGzNwVXOH68
	 sqr4juhN92GsfnrheISS+lH4x/M7fRVCG6cc0VP5dA19dj1ZX8sVrhPZzgiEUFXqfEo7c
	 0cvcwxOc9vCz9vJO64LnPsinaRVlVWLr6x5WFtqbDFBK7DA8LxwwuUIke+Znyx08uHOM4
	 C65ulOwG8XMMYdecsSq/PFTusWtg9qFldaQSS+GyXbXYiCb3os4HuejTGmnGvgXBqfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RkqRnTD/";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EA2606D80D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7EA2606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkqRnTD/
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1002033c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794216205; x=1794821005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8TR75PpSImbWX1NY6vplNQswxGOV4SePaeper/l4aE=;
        b=RkqRnTD/Nsp2MqgVQr5mWaCauC4meE5ImDzOH8dT9J+c4YtvHmPYSA1DYDS6YJCrvu
         XSsmOLjrAQdYY4GPk/2vk7oQyCo1joEkF45f0+fDFK8h357MsyLB0RsIqb1ezStrgouH
         lknPwRURx1AkLeoEGdqI623veABN4bzfEWK73/M9c0d6zaJM9cA5tDvEOhwLXtDSEDnD
         M++rO/X+2AZd5iUDKSPF5zcZto27PFk8f71Hb1NkspEEtrBIjzQpUjcy2gYlEhhBirzp
         QP1DlyzHf3eoLcp1mHKcNn1IFTEuShPEFqjXwREb0/l1irp4SweOqxpwoyC0O4xcKUAx
         tfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216205; x=1794821005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8TR75PpSImbWX1NY6vplNQswxGOV4SePaeper/l4aE=;
        b=TdQkDm1d2L6gVE6mvu9qC0KgdOR9KE3AAdMcW7h1Xhf3jcIYKToOeRRUyQOFmDY7eD
         S5mMgipLl41p7PYZ+eR2qCPklIo1+j0CYSvCYIkVEQsgyH8U+lFyNeqz5DoU9yxGyMuT
         63jOh4ZKTTx6PvL2jCZfPOhnedYjx2LwoH2XGsWuNvmOUZPBEePiyUgrfAJAEBinNl4F
         U7h2t0YoDuoAOsfGHfVf+pokJ2BO20d+wOnJgxdQ19OaRc3Mk4CmSTVfq8wRKoR6vrwx
         AVsRIjtinFPNrnU7Urq7C1uw1fMvkXfCs4rk19KGAiNf0B7Fk9DedBFqOy1ygEOnsZ8i
         Tzkw==
X-Gm-Message-State: APuU4Z+cjU8ptp8RzTjxEBB9ct3VQ9smIzrbVoXNRRPxW1Qf1nWkq9GJ
	9NXZKw4RGDQe4wXmnaJ3vjjj9DZrJ8s4IU9647SI4eyvceZr9U6FyX7o
X-Gm-Gg: AYBFou2CETQV+cKrVMhGFOLmuYxyAlSZzp3M5jtNtRwnGElAw+3dtcwd2PbzPh4bSOa
	8owQ1dgRf3XhK0789kSQprTBZJHpHfkc/y80CzzBVufGNmQ7l+DQ1LYXv3qwx/yYQb60eJelt87
	9bA+9042X93bR+bZ01Qj5dsz2xKHmightVBBnpCI4E5UvvvJ8ipKag3Lk76ndh+Hx7tQ51oJAUd
	Ptbb5mQEKk8MgKhyT+O2sNU7FcQFH1CCxtygy8+CGTJrgoK2fcrOYNRyQEOJUGa1QQUgihmyEHK
	wUyuMMY+UU9D7qeDe/waxrDKTehoWjSjs7VsGG95sEKhUPXpCOflIvbzXTFFSlePsQGVqYpCIJI
	F4us5o9SLVvfRn0u79YQaXa8dzCkhjCV954kjtJVTAXzfHEdgs3Z01iKRslQaCoIZI2h2i7a9rZ
	3oxLfkgqpmryYNPOro9jA4D0YvQYVdEaIpCNXJHyrirvNhQHnBj1NDOfPz/RZjBEibe0bJo/eGk
	IsJXpVoArBCln3htqKbmdWXDfOgygg9Eg4E7Oehp1IX10HwmoMwxNaqc77aO9p4IQ2cvfK0IdWt
	KztBwKYTmeEL45J+RpJMkqvs394XFw8KEzOlYrQEnWycTGKr7LLRPnW8kkcRREnKuDqaT/ZFhA=
	=
X-Received: by 2002:a05:701b:450c:10b0:1b2:42db:8a1d with SMTP id a92af1059eb24-1b39fea8bc2mr6054370c88.29.1794216204816;
        Mon, 09 Nov 2026 01:23:24 -0800 (PST)
Received: from localhost.localdomain ([103.178.204.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37561ccabsm11059529c88.12.2026.11.09.01.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:23:23 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v3] ALSA: core: Fix info read handling
Date: Mon,  9 Nov 2026 09:22:49 +0000
Message-ID: <20261109092249.3559-1-sreekuttan2156239@gmail.com>
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

Fixes: d97e1b78239c ("ALSA: info - Check file position validity in common layer")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Add Fixes trailer for the commit that introduced the zero-length
   read issue.
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

