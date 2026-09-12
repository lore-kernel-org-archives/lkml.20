Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26EB1A8F7B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789207556; cv=none; b=YyZksz2x2cYSd3QnZf4qu9YEG3DVKbUSvuJoI8xc20FBgrjhyR+0pQS2PGi5fCiU3DeF7vktzikvj0T+eovYWJRLHAhPp4ZJM6JbQ5c0W/GZzXlqNfkvBiuM3SGmyj/F+8krnqG5baBNa1ctbzlAy5LhkOeOLvLoteSwRrNNCU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789207556; c=relaxed/simple;
	bh=LJOPmJrP21LYbzrhFhky3DZI4h+hJ59z5012EB8/nto=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i7G5683cQlq7g4FK8hol8lNPIGUq9m4zaknuXmWZoOR/6ousyLZx4DYQEFFyTbboBmEf20fQkH4FTk/bi3anIMErWEbC7IT2zRmd3LWPaoBwnu/MUo03cxiwc5rup4FfTJKlbOFfrSxSM2LwIFfRSv841w0fzA8DFFNfyRPqybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SW6aRQlG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SW6aRQlG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so3265195e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207553; x=1789812353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vpOBpBX9uNCEBjQ+845hANe2x9rtJ064R+VsEUkujA=;
        b=SW6aRQlGVz1NUoh6rFaIXJE0FQqSkwAyZoCoPbqF3/kCc7BzgzcsD7N7B/5y/B8U+k
         Umr8VDVwoGEOfOD5OhwIXB/k+ih/2/fh2U7QK/RKNnS+eyh+rs9jZzidHBTl+xRoNCGM
         RXqwDfdbw1fzTbO/teV3YcD8N3XavUccrBy5b9luqbw/utQgufeHRKxWamAmjyDtGGeM
         nB8SQu2cbODIPa2VxS0VgG2eVqGORu6kWr9qfzi3JwtIo1IjiWzbtsaLivlwv+4hfZeI
         cDac/ZcAI3loU74r526JUmY/IJhFyi/dqmO+y0D1OoMNy+1hT/mRyQWuYtJgdQiJEMFH
         pqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207553; x=1789812353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vpOBpBX9uNCEBjQ+845hANe2x9rtJ064R+VsEUkujA=;
        b=Bbx8Mx+5uQnDJUD9re0ik2GAtaJp5WW5lVO8uEtMBKkiq+edZ/TiIsUuLrB5y2FRMT
         ZUsKKxMYbOhQG3I8T1G2jQEtMMoVTlnyrvtBa/pUzQruqLBEOnKeTGeiLp7goArfjrDc
         TE7E6Qrr4zpQTdA2rvSDO+Y3Mw0db7tvcTpIH6mJa2wTPsXuXF0gFjIcSxLHTJd3TUSY
         kwHiANKORSMIsE/5exJLOkqnzs5dps+rpH0h2Gag7Q9YRPzS67eMtL380bKWAgPeoFN1
         yB4vgg1vjg/DXiBdyIqNkwEzfJWUtxWh4cSUEC38mE2glpb1IpnRaDj1EDhQbUvRPh0/
         By2g==
X-Forwarded-Encrypted: i=1; AKwUvBw/9JW2xAtEek42hyWYl/tp/3xqrYsYjs6Kkve+jCKKZdc7s+C7z0r5Aa5GRYUBM1Kp14iiAYnn0dBt9QY=@vger.kernel.org
X-Gm-Message-State: AFuF++letBD3LLvoSJ3IFrPvBEXCTPNpLNXVHooFNmu14+gfswgmbEL+
	plX7woEYbMpgINRCdEMEXuilc2rdkfrexwcP7ehC/VZVI7JliCZ9GGrx
X-Gm-Gg: AYBFou1iJZrAoxDII6g/d3Gq8+JRRceM4nFC5zTpTidhr1rALpARXZvmnRtxtBi4Luv
	bJ2ikcTBvbMYThxrzoa5VM41KzT9GDKRU/+nocRjOkmmbrCsM+++h5kxFvtZf44/ErOe8yW9j4L
	ztZvGW8nqbF5ScId8dAn3CKUyv5EHLETS3msmcZoQMFz4GriueS63RLFmV5p5+zHkLg0N25jN2M
	1Rp0jluChn1SQFnpYwcVP8tMQ5brGXl/Ll43TWB3ksrjqro8LhQFTLIQgd9wgCAXRsPreLS5qwK
	7SC+DDJpUHbB1SYj2JD0Onk7b7/aDqRbLiDGcUy4QODIZhYQL/AX0ICIq2q+Kkv908R0cVuXbHV
	J6nWcwQS+Xu03zOcnfeCrpsbr+YgyYIAlaTnAPDGodOobmSaIkybEbIqKzGwZ9Xw7cYbOmufyMe
	3ZE4LPv6YdrEjXBTuEvJegqcWZnO3R9Hgn2pS0P7vAWOK1XNF62Ku37lFVOe1ouxY8eWINzBnXr
	dnURkrn0ECVuf+aA/0ViLa9U5/e2DnkYBGcKfadvi8qZqMV7deEKuXgij0aSomIy8t2P88MySZe
	3GsKGTR5aDGoZmKSBZjz+jsrkawV32lMNkqV1IAd7laHi2ybxnU1LGVfLMB3lO1DseqtPhxfIfJ
	HUQ==
X-Received: by 2002:a05:600c:19cb:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49e658188e3mr76273105e9.2.1789207553028;
        Sat, 12 Sep 2026 03:05:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm220381015e9.2.2026.09.12.03.05.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 03:05:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: control: Fix virtual master creation reference in kernel-doc
Date: Sat, 12 Sep 2026 12:05:48 +0200
Message-Id: <20260912100548.86134-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_ctl_add_follower() comment refers to
snd_ctl_create_virtual_master(), but virtual master controls are created
with snd_ctl_make_virtual_master(). Correct the helper name.

Fixes: 79c7cdd5441f ("ALSA: Add kernel-doc comments to vmaster stuff")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/sound/control.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 909db0d0485df11385769367b484daaaf56905f8..37e9c545503e5fda45ed5d9a7fdfba3ad060fd67 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -244,7 +244,7 @@ int _snd_ctl_add_follower(struct snd_kcontrol *master,
  * @follower: follower element to add
  *
  * Add a virtual follower control to the given master element created via
- * snd_ctl_create_virtual_master() beforehand.
+ * snd_ctl_make_virtual_master() beforehand.
  *
  * All followers must be the same type (returning the same information
  * via info callback).  The function doesn't check it, so it's your
-- 
2.39.5 (Apple Git-154)

