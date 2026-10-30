Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347447;
	b=1X6Gpo294SkHeEcv1rT1+d3pyWp9M60yr7mFMHkeIkpMnX4kDUFEr0dG5yP5LWq+3ci1
	 1lhQ9IJfeikNeAJS6X+cfkTsoCvS6c0Xplfm3IMuA7zvjg7CMwI8OXbZQH/zHCH6zmWZ7
	 Sgwk3YcL3v8SgG1BAQkY2zR/k0HuBwpgSr2tlAOudCFL/osga6PxOVfIRGxAIuQqyGfHa
	 kMNkzLWTc8TbFWPvOP7k2f0yHOqbX0k5FWzQIDUf3ITnlH/UOjDAcRO8lCSCg96pU/7Sc
	 ktdYZq1GW4QRysQZnmAzTT/4XSFJ6L/DUq7iRrGOyPDO/QRV6cCcJhlZhw6dQqcwHoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=thnlgDsgaiZp29Xs/7SKR0Bl6MHpM2zZTlOwDr+vKFY=;
	b=JS+W07XGgwZdhGYn6+eQy9pKgHIKOHkIhNia4JkSAyPtZbNFfte/WLHHsW0TV6r7alrN
	 qOI8pRZf2X0pkAr8wbXYr/fcmrRcvHF0cD7Vmg0FRgxYGCXgOa1ZhzolD3u3efAKXuOEw
	 v4QNp5ijODIkWymVMldkd1+e7FaWHZOC2m+JLbcyJeMiuKlbn+y8DmZeUSaYbgtnkKYDp
	 hiPwac7uZP8N3y4+BPu0lrVNVFVXydh9A/VIQWjOWpxEcvZ1Wal1dzm1w8z0ZlLSijxFo
	 wo6vI5yIclGql81UU6yW1vrcJUkETcIFGRtJuSP/OcCjLYi6phAiCPjouyeSrIYCIlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lz+H7Yt0;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4603C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lz+H7Yt0
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06c60065fso239776b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347447; x=1793952247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thnlgDsgaiZp29Xs/7SKR0Bl6MHpM2zZTlOwDr+vKFY=;
        b=lz+H7Yt0phI34TmKDeYrPMDqYLY3kcPpEFQ5awZoQmXenNRq8IF8ftieOFPBlo0Pds
         RNErtohPebLxd6U/xMIPRsNC2SsEwaJKs3TM6HLn5X0GHr5+EAGIHwAXYe/8+LmcyAxw
         ywdmR0mve4w8tE7pMqiZEZzR0+iMr6tfeDP2LzibMgj3cPsj+wvHyK7nw/OHZKPQaoQV
         1Ekc/nRh8m15MEEhE3ASedCusZlXovy50/5UFONNS0BiFfQg8xUlMG+HEQbL7zd5LLAy
         cSS1463A6frmC3mZdRT9/x8QVMSmWidKhqLdSIC1vxd0R6+b0qb2xtqAGKwM+02k1Jht
         mZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347447; x=1793952247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thnlgDsgaiZp29Xs/7SKR0Bl6MHpM2zZTlOwDr+vKFY=;
        b=AVSRuot9c6XwcwebGTyKwM1vTxqh2UzYB1U139TYarNBXH9wRgtRwoMArHZ6C6l7IF
         rqGQUNjT726G5N34G+2g01VoLXpPsmT5acxhfYIxX4Jvyo2t5Ry89eUZkaLRYFcNy+1v
         bkgDQmFdRHF6e/yI4MA4QUtPOfJQF36Tr3DNobfASkFmcGUiO5CiEtdrQKtrNw8rG+ep
         m2aTUNjZUAhaNSn8FzlEeM417b5kPYUvAjuvlAQ/DvyZMDJmeWC3xFQa97KuB9beiAT9
         A9vAxUIr6Dvb2dpTtlgwQMXDgKJ9fePQiZm0Z9prq+9l+b5W4BVFgxmPHsvoLXuj+Zj+
         RHVw==
X-Forwarded-Encrypted: i=1; AKwUvByxolJK6XWUTTkHFnI7nwU4qdbMP5dVrd+EN3EybH7BffOdZxjABlJc8r0ewCZh5Lc19AGf8pPbMj1comk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhgRgj963i5FJkcm49E7kup0uEifFCcILDZXsPvLuMill8dloL
	DfwzyYF22U5Ejyi7SQI5x0HSnFpNezHIU065MUjV39pmaWUIbENl1eu9
X-Gm-Gg: AYBFou33xL5dBP+VhWnEtCc/mamR1uh1M/Ba4AjAW9WTt+lbXEPwoGhIOfD5IZYNf3a
	6TH9b+nv+H/rF/C9f+v66rEuQqTPnyptGGkdgGEfPh2NZUeBJDendT42r9H4A96CHimgdsrdcvP
	Z+UhxLk6BJBW7KRC3DMUwxZ/ObB6SHpLjG/jGLx0HgNmK3Eb0FYplYQFGg1R6pN5fWx6zntnMdy
	ybSaompsdI1iBoj6188V8pHxj8G+/6Jyx+xwQST3qnBKHzUNXiOVc568F3yrELj8x8GQKo1+FI0
	k9uzBX/sldsbu7+Xqwl9S7N6z2K2tsBvAGNcFa5TKaC631HB349SSTpkAF3c+wDRu+2wjnjhjWS
	lJk+6ZcLjd64+4BMG/9xmMeB20iTwP6slhRI2oXADD48EP1c9dp0JVNbT31bHpdqVidquzMuuRa
	0IY4XBj9fzKkLOUPSNB+fseArFgy781qRpQwY8oekDfd4tKJOgPq2peUShnlQjR4NipO8TS5fuQ
	34dn4hUi1qohDNdJOXAl9C6nTdefk9Og6aI3y75CEfkk5bTVefttMVi1uSdauA62sK0zMwgx2/T
	4QuG6pHRuPLclxiTVrnq6diy
X-Received: by 2002:a17:90b:2549:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3ae89536be7mr1302353a91.2.1793347446341;
        Fri, 30 Oct 2026 01:04:06 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:04:04 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 4/5] ALSA: pcm: Refuse to open a disconnected PCM
Date: Fri, 30 Oct 2026 16:03:42 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-4@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
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

An open that found the PCM before snd_pcm_dev_disconnect() can still
attach a substream after it, because nothing in the open path checks
whether the PCM was disconnected. When only the PCM is disconnected, as
on an HD-audio codec unbind, the open then succeeds on a device that is
going away, and its file delays the remove until it is closed.

Mark the PCM as disconnected under open_mutex in snd_pcm_dev_disconnect()
and make snd_pcm_attach_substream() fail with -ENODEV for it.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h | 1 +
 sound/core/pcm.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1cf511f8d880..04f58c2ec5c6 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -548,6 +548,7 @@ struct snd_pcm {
 	bool internal; /* pcm is for internal use only */
 	bool nonatomic; /* whole PCM operations are in non-atomic context */
 	bool no_device_suspend; /* don't invoke device PM suspend */
+	bool disconnected; /* disconnected, no new open */
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	struct snd_pcm_oss oss;
 #endif
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 064df4cd3b50..567eeff23095 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -897,6 +897,8 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 		       stream != SNDRV_PCM_STREAM_CAPTURE))
 		return -EINVAL;
 	*rsubstream = NULL;
+	if (pcm->disconnected)
+		return -ENODEV;
 	pstr = &pcm->streams[stream];
 	if (pstr->substream == NULL || pstr->substream_count == 0)
 		return -ENODEV;
@@ -1101,6 +1103,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 
 	guard(mutex)(&register_mutex);
 	scoped_guard(mutex, &pcm->open_mutex) {
+		pcm->disconnected = true;
 		wake_up(&pcm->open_wait);
 		list_del_init(&pcm->list);
 
-- 
2.43.0


