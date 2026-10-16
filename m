Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742341B8F6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135868; cv=none; b=VXkY0ogj/1o+5li+Aavygbc/VP2YCVTpGLYoqZVt3HmNhi6eVT3/W1kKnIgCvdEldREI5S2+AY4tdaPZzhPPUTc+KqB9jJEmdTDnmoUpJD94cRNX6aleDmejnsAjx7JpPzDH+o7lLCdDGdaCpNFrqkOqT8aZgGvldfgps/KwMik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135868; c=relaxed/simple;
	bh=EYKrpQNXUZLMLH91IigMMSKgsDt3PECDKGyBUPZCHko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5qh+2KUr0p+GTnJdIpTrp1PMZtGxUKT00wiwp6rGerPsKq7RW4KQDp7hbEL/PliCFfehgnE9ToUgentC4OZtVImzY/WFnkyC/jY07BHEYviP8fM8lvDrrC8vrk99eEOGKJzKZZB7DXXVTabQbrJgDTkFYo3U752diL8V0g66S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InKOfpNx; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InKOfpNx"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1447591eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135866; x=1792740666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JLrQsk/HzdxZDjqIwFPPIYECJQe+WNmXx2ayIsdeN4=;
        b=InKOfpNxDoCKiWXOFhLfkR0aaCD2ZoBxrXZ0lN0iXWwHG2H3FOlwrDkbNgiPJ5XP7L
         S3yVIM5tfYFrN1r0DiQdlYcJm3oQhk+pTeNAwPKNWm+uuAAYKu+vxBaIdAfPTcyzkVIC
         Q0D3dXJvaRVAMswsYmXv5+t+idoMxNmL/QNHmlSE9XudvAMnbYGDprYh91MxmhCxwDFx
         DCtXaa88SZlZRGLbE7sZx0eeOt3uduTd4nil1/Q4KfOq0Kqen9CFyk040A4blZQgHCni
         UGgu3joNl3JbNEen7/HvsVHOfHcohc8Mui59dXowNRk0OJzZOtu9m89NqAZKk/GKQOA7
         mMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135866; x=1792740666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JLrQsk/HzdxZDjqIwFPPIYECJQe+WNmXx2ayIsdeN4=;
        b=1l9Z7IrE/O6VzPEocXojUMWJgb4kN2EVJbSt5rFJM33mDcJIuP0DNsFUCr2vHDSv/O
         mmEhnOTWHLw4jMIIb1MfshcU2zhYghGAZDKHKXenPOjqdznKnDAmeC/s5j8SCNonmQE2
         f/omfOtci2CBY8P3Wr+YB93O/l/yZwIdeg0rnRtLQuvw4wmkm1LFjnCvmDb8v75ZWM2p
         CjIvZu2pXpBYV+DV/4H4RoxEoWX0hIslXWYe5i9en9sjhlK4FNzn0ba3jAoEzJv544bo
         MJczfcbRVlUAs9QfwleEgkorZdZLLD7vpy3V2mDiTQHKuNDlLLPjxgVhzmDNDXpexY2d
         Lh3A==
X-Forwarded-Encrypted: i=1; AKwUvByrQRSas9V2+ktBon5Y30Gp2jIWDGEYGnilvK5JLC8g3i7lleiet31MkLK4smaOnLhXsF2iR8AM52tUKWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8LB+YWjw2ebDh9cI+FreiDppDa+Ga28HTkUEC4KrUtVHmlW1I
	Ab+CDFVNRwh1XgimAYjReWXkAgvuNppXogDh2SoLDb6z20Rw+BTPb90G
X-Gm-Gg: AYBFou2SFbp3cKkBp9BSrYzBQ0s3Q63GWiHs8dsCYzyfHfnOH2TNAljNwf/VSBzApaL
	G3kSpHBqjvdkCVGTdD71sq4icjsb95dev5/K5G14D33bjK04+oJwuj8VTomtMa8GCL/iIetg11C
	RiQDWSo/NVVwgzToLsJvNihejAW4rAQGLSs1zMqIRJ6n+uHY/kYwDXLYWpSHl1/LtL9ns+DlPEb
	mVFgKpIW3yNx0jG9GVoURjNumfJZ9zDJLV3TliXpCUoxXLeWavV+uZ24RnliNyOfLxked2QGuym
	l5Rpn5YUzytCAyZKlpLKJWTFg635jLmq+3ETRE/wm1hajvqv0H3tMgz2h0PA4JBvx7P7nvOtKcP
	tdd8y9CCMH7vZiqi72uH5UvmrYbJsi+KnXg/yNKza0iQrIIZD10w8wf5+tgaxcZvIeFEPSgSM6r
	PqPr+A4WXMueaw8821AnzCeBxkMl86cXCmjTn9gvV5cLM0u16Zn6fM3IK1oFehdWpToIW6exKA0
	WCcKPzJMkiF3P8ZZf4d35CUfnt8rWDZLBc=
X-Received: by 2002:a05:701b:454b:10b0:14d:baf5:c40e with SMTP id a92af1059eb24-16a5faa76admr26546434c88.8.1792135866370;
        Fri, 16 Oct 2026 00:31:06 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm5367021c88.11.2026.10.16.00.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:31:05 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yaoyiqi3@huawei.com,
	Yao Yiqi <yyaqia@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] fbcon: Retry rotated font allocation after failure
Date: Fri, 16 Oct 2026 15:30:23 +0800
Message-ID: <20261016073023.490430-4-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016073023.490430-1-yyaqia@gmail.com>
References: <20261016073023.490430-1-yyaqia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yao Yiqi <yaoyiqi3@huawei.com>

fbcon_rotate_font() records the font, its geometry and the rotation it
is about to handle in par->rotated before calling font_data_rotate().
If the allocation fails, the error path clears par->rotated.buf, but
the recorded font, geometry and rotation already look up to date, so
the next call takes the early-out and never retries. The rotated
putcs/cursor ops keep returning early on the NULL buffer and the
console stays blank until a font or rotation with a different key is
installed, even once memory is available again.

Also test par->rotated.buf in the early-out, so a failed allocation is
retried the next time fbcon_rotate_font() runs: at the next
fbcon_switch(), fbcon_modechanged() or font change.

Fixes: e4ef723d8975 ("fbcon: Avoid OOB font access if console rotation fails")
Cc: stable@vger.kernel.org
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
Changes in v2:

- The early-out now also compares the font geometry (previous patch in
  this series); the retry covers the combined key.
---
 drivers/video/fbdev/core/fbcon_rotate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index 660a3fa81bae..7afd63dcee7b 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -25,7 +25,8 @@ int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 	    par->rotate == par->rotated.buf_rotate &&
 	    vc->vc_font.width == par->rotated.buf_width &&
 	    vc->vc_font.height == par->rotated.buf_height &&
-	    vc->vc_font.charcount == par->rotated.buf_charcount)
+	    vc->vc_font.charcount == par->rotated.buf_charcount &&
+	    par->rotated.buf)
 		return 0;
 
 	par->rotated.fontdata = par->p->fontdata;
-- 
2.56.0

