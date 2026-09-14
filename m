Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE0A42048D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379585; cv=none; b=MZum11FgtCXfQdLaonnvU7VTLsJTn6rYsmaGFatlKvjfAvSTlx8sYSPZ1rz54ScnzT7s0qcAYswxkED8aatMyRbJgVPy/qQ+z5oySea4ri5loFIgN17MuAiCRWWuePAxejzp35C1s8JD4lQeaKyKplCdXGxT/pUJiCmk6clVHe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379585; c=relaxed/simple;
	bh=bbJxaZw0nqbXoP9Gq36ywZ6uqMw8KPddc4gTbU2zp5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azJRcDE0saHpNs2OQn8fEFTghRLi9wBP93UKhiQForjwQOMUrkewoO32W/SudniZ6P4GnHLF3moc1NAIF2OX0F+48hwwwoOBaEytrGlvlk0tnx5pBxW7Q321VwtoiaPTSrx0+9GUwwSC8rBg9+nixfa7a7GyhH7MmbGLFO9Fj84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOES9j3l; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOES9j3l"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so3658893a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789379583; x=1789984383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aj1vcWXrcKSXfio8K4yMPUPDskRmlK7J40zfCx4DedU=;
        b=UOES9j3lTK6hBJMf4IP8dPkvqtNWowWe/CSkhDEDr8RwGWsYwwjP7xjufXetmnGs1N
         fAMeZyFo2Rpt5XM4InSjc2uJ50TyKw2qHwwhHy2uN5BnqB4iy/JWv7x9mP1jRocqt+Zy
         HIjb88pKswIdKcMi/idkZm29j03PQbKX+B/k6VILcQp5DHyePPMavyVCGeskwKIUVdhO
         Y3gZ15D/Hyf2K3btZctZkRMkGz3lh9JbBUDa9jz1iFqoozQvITQPUZGXVxb/AtKDdX/s
         g9XV0cF9j0U6H1rYk8nh1vnTzJKPpwwFDC/u2RTw4MYmvPqNmr+CuMP0aRN+dB/mjhfx
         OvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379583; x=1789984383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aj1vcWXrcKSXfio8K4yMPUPDskRmlK7J40zfCx4DedU=;
        b=nVC4KotKRJuwQCKdeEc0Oh4PkmcwvN73GLok4FpBUpOsXdGeXjoEeMkBqOhmQ4h3rr
         DIQNz8l7c9dQC3zPokFxU0+4jan/+2PU+uCcWT/CTPLAGSBZtn1fstrUjvOB1VqBtlha
         1bjnevqI0MlxHVGnOYcgPPoAzjOX3iAt1FSIedMM0tZORWgn5XB+aEPmQYWnQlXnK1Rq
         Xstkc9oDD0DnsyL3tEoB4sZs0rDAa4xA7JEim5ZKP7yhOfckm74ZPSBPS59BU7YSy1dC
         +2NSviVAYvi75hid14qTlkfiOL+R4MGMQvD1CYbFSL+l6TIGBEffFr6oep9YWswJLdlX
         sH3w==
X-Forwarded-Encrypted: i=1; AKwUvBwXa8OZX1cJDWjFnFKolY1xO96Tczxg8nmbPDQ2bPlqHveABAI/XrjLK1awtjoU1CDf42zp/XKNd6DNsBY=@vger.kernel.org
X-Gm-Message-State: AFuF++mQadlEqs22H4X1QlmGW90kehod5AwLYAz+3dyHRH+O69D4erFo
	K8N6H7dvEFrV0oBYBiOQlVWbW9PrpjDCkXZlbKm3MjxJGYy2rjhiWGnO/qctHg==
X-Gm-Gg: AYBFou3L3uafWyYbdJQjXt2dEDaPGhwUfodGr9BH2rDWDHzJVPlc8G4yMlI8V6oEoJz
	f8NV+mWbqBcnrUC4GaKQCZM+2tDzxXVNKZnVYG0qzNgu+5lit26mjUqK7KMQFJSHXCaK1KUspz1
	CDDOrFJboeWsFXABZbwwHWGqPbPEwNGdoonHLk7qohIdbnIjkOf/sXLfxIzCedizJfqAnQHnYRV
	P/SlddjzBk5RVsWzdAu9/eTjGTMZM6uYysZ7TUKDAFH1+hQZZ9acyMZUPyJGb8lgTF9vh3mluh+
	GSJDwoTUvB1N9kYqKanMkKM/XZglmGWaw9er51E9GjZpPDghBlPIVKgu6iuFS6uWFtzmg0W9sd/
	5aCGapel/9q6JX+xlhk9VcuKObdQdigyp+qbufXZHQ5Od4NVL5sVX/QjNgnykpPnxCigu2id4uB
	t4T94YO/AoeIrTkQ57hPc4tQhSjwUzOTuM4GAuDd+XH0qGbeQRg20OuUjB2Z2FfOy0DD5nU/vJV
	OEAn1RbblGaVjbh3WrElxaB48+bl4SzGNKMIF9o3KG9SjUyyz2rHB22inNlwHdRi+bvILnwwZWg
	7TLeZNtqAjzlxDAv
X-Received: by 2002:a17:90b:1b01:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-39debf6cf03mr3857903a91.1.1789379583175;
        Mon, 14 Sep 2026 02:53:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95091214sm21129174a91.3.2026.09.14.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:53:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Cen Zhang <zzzccc427@gmail.com>,
	Yilin Zhang <yilinzhang@moonshot.ai>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: pcm: Simplify success check in snd_pcm_open_file()
Date: Mon, 14 Sep 2026 16:52:48 +0700
Message-ID: <20260914095248.33391-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_open_file() returns zero on success and a negative error code
on failure. Use !err to check for a successful return instead of
checking for a non-negative value.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 62324282fcae..000e926a1e6a 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2930,7 +2930,7 @@ static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 	mutex_lock(&pcm->open_mutex);
 	while (1) {
 		err = snd_pcm_open_file(file, pcm, stream);
-		if (err >= 0)
+		if (!err)
 			break;
 		if (err == -EAGAIN) {
 			if (file->f_flags & O_NONBLOCK) {
-- 
2.43.0

