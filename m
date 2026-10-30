Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355906;
	b=TTLF5IYSmVAVfrewxy1w35TB0l1G3zZc+R1Xdqa4NfbSV9Aftmm8iARuuJaySLSfIPNH
	 ZWg0iRKndJGVYj05IVbCWBbYQNorHAJyuiMhJ8eM3n9U9zpBFpaJEeytqXKw2bKcjvUqG
	 RMIygaPQmTEFH9SgVyhzMAPnh7I5XfLs9/7WjPAac6Cd5w7mCgeeseEO82ntLZ/oJWHMG
	 MqV2ewIorWXNcxcavNk0qJwp4vN3PmowCN2r5XWn5u2j7oFdl/qlxqim+qtthlXX5btYG
	 DJcxjHj0H4btRi+XdG14ouPDALoBkLc+N69Ma1vOCAcVu9Mx2ypkeVIvFn7sulwzcJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uLzmUNcIQUXf9Z2hqI+SKTVNqVZNs7vU5uqtLnJ2DV4=;
	b=3EX86b+pjEOncbr/3t1+VAeavybwsAvx/DfrW7ZT9j6tvt1T/DUVg91gooqrpPfuxEv+
	 KFBPCIjUqQTBplVSA0NxnoNKZnqOU2y0zau+sK+mh50pOCuq8kvHUQW3GXqXKc5NBAf9A
	 c87yneoiifZqPpUHHmCPelKbrU+02Y5r1Hx1pZB2FqJ1HVFq/1APNS0iw6xYv8QBIJbmU
	 86Enmsy2ZkEVyBhUk5u4UROYF5Yw1KnPRGvzrNHKIhnx9a70HiC3eeGctIv2CoXCoTeKq
	 uVXYbMHPIsdNKiyuUAoX76+DIWYVDwk3pKQXO6VREqulyTqzLCQ+91u3SOXf8dCT+mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dqww/Fpw";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496B5606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 496B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dqww/Fpw
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso3576645e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355905; x=1793960705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uLzmUNcIQUXf9Z2hqI+SKTVNqVZNs7vU5uqtLnJ2DV4=;
        b=dqww/FpwZOvCFFAcqraxdEMZH1xUfncj6J6T34h+JxsA4v9HF9xjDhrtF/6dv/aLdq
         lfXfHjayVlhZTYPFZcBADT1Q10tVaz/vqXWtNby6WhqxGp6Oyq6/CojAvxHtElHSR5EP
         8TSdceBW9SLACHLk8pTNEBzprnqhtFTavOUzFb/5iiYXkVAfOZ6Wyyxu5hSYDJvXUl3x
         SCzhNNj99na1zD8KDOTJ8GohndOcGrr80dZFzkWAFbsOUmvXijQASz4ZDm0amCsLHi2S
         k5ULMt/gw25tBfAbmxP+hY1hI18n9+l/9tkZokw1pz45nbqCKdH0eE+R2iAAYdZ5f459
         JjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355905; x=1793960705;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLzmUNcIQUXf9Z2hqI+SKTVNqVZNs7vU5uqtLnJ2DV4=;
        b=xzoGMhjD9FSS6jjP059ouy/10hGuWkyOSfluOzAaJ4L/GsOTuqSiMyDvJPq+zFmGET
         KnbmkUafxK+NMkEAo3r5SvGmalKvAocChv4L3YuIjWsyfav87pAdSecWjlNqmY5jct2D
         BSbgdWS5hyEZanoDLG6WC4gcNwLvygjno4Mh0Z1RVrHC274iSnhJOPThX7I+ajz8CDr+
         mmijrp5sjgEANk//qKt2wytjpTxFJc0+DJAflXBOBuRhOARVThMo7tG/RZe8CzKiP+Yd
         L0mDGNInH7iDSeTkY4x00PweV0o27+xphR2K89io3M/98Kie/PL+rV8EnSQuMjoEWaQR
         NF1A==
X-Forwarded-Encrypted: i=1; AKwUvBwXLyrDQRDlzGIktd/bgoApCyUYgFLN6ypd3qwTqcTjzY/K6tLn9jKB8IbFuiqKDUUqRPMInDHW3NTozrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL67nB9RL8zR5rV138ofxEGNkpW5Y3Zd7dSKi8fZcW/VBaGni+
	CN2EnNwbMme4lDZtVMach461KSQb6WmUjXNLwFuWiUze9j+ljO3WOGQm3JVGhUb0
X-Gm-Gg: AYBFou1RKK/BToDLHlnWISZmbYqLJV5OaBQTxI9UK97YNOuire/7gjuGEtgTtzeMkcM
	vjzTlXJ+H0Ki/vqazSKGk1VjYs6BaYXYHWc0PvWggF9ocXLxhpj1hZ4ezatc84f66lU4lmO44oI
	+jQzG1BSEoZxSo7p19R7TbUdPZ/XQEC5+FRpL4e1xm92YpXCSnNpP1D2n+t6eDFlc64IDGcRogJ
	0VwO4EafQ8V3rJP7+tjV1YVC8J147tlKV47gBkxljT03f4lDg5ph5k1wglhj9CNlQUw1nhdL9ei
	ifA0hB7tqm+tob1hB51TXlCJLUI5/DWi6DC2WzSQ7HgddDUPCxU6Rfz/17CDh/aQXIpNvrpgXfR
	PnAap2ADieT1XQi4e7myUpak+SoLgS3NZZs+0ChIjjhQL/3DVJAoUG53lIEyVWuNzKfYiVdWEDO
	VwVw4tE1Hz13JcJ39y1LLVsPGhB0djjSYiXnqSsAVybl7M1IJ+4D0RiWhDLU0DNtuFcbQmqYpES
	ED9FbZ+5O2nDCWKhPeteuYiIx99OyVF9aAj8dE8bCv2FrGZFV1d2Dr13U+6de62dtFWJGIz7XWu
	5CKf4M5KCRBeF1kCv3QF4LFapiGgb/hajspx1poyTijeu4GMj0Prizg=
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr36468925e9.32.1793355904435;
        Fri, 30 Oct 2026 03:25:04 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm2403919f8f.51.2026.10.30.03.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:25:04 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org,
	Dwi Siswanto <me@dw1.io>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] landlock: Simplify landlock_get_fs_access_mask()
Date: Fri, 30 Oct 2026 11:24:10 +0100
Message-ID: <20261030102411.12985-4-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030102411.12985-1-gnoack3000@gmail.com>
References: <20261030102411.12985-1-gnoack3000@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Return the handled FS access mask as it is, instead of artificially
adding LANDLOCK_ACCESS_FS_REFER to it.

Since commit d6c7cf84a24f ("landlock: Simplify initially denied access
rights"), the merge operation already bakes the initially denied
access rights (LANDLOCK_ACCESS_FS_REFER) into the a layer's handled FS
access rights. -- They don't need to be added explicitly any more.

No functional change.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index 693e569f5387..1aa85c817d0a 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -258,16 +258,12 @@ static inline access_mask_t
 landlock_get_fs_access_mask(const struct landlock_domain *const domain,
 			    const u16 layer_level)
 {
-	access_mask_t handled = domain->handled_masks[layer_level].fs;
-
 	/*
-	 * Handles all initially denied by default access rights, but only for
-	 * layers handling filesystem accesses.
+	 * Initially denied by default access rights are already included for
+	 * layers handling filesystem accesses, see
+	 * landlock_upgrade_handled_access_masks().
 	 */
-	if (handled)
-		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
-
-	return handled;
+	return domain->handled_masks[layer_level].fs;
 }
 
 static inline access_mask_t
-- 
2.56.0

