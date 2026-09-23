Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB553A89D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172408; cv=none; b=NmnDRHadJEBX8NncF9JyEnlfzvZy44Iee1TBIF3jlcbsXpBBZYEhSBBtL7+SSR+HVqGwNqPE6qhfMstz+bkpqAniX7ZLpCvsmsMt8yPyXwMbLXdEyJHLWTAg5WBq8BMS1AoXjFxRFthJiOCV11thHgaO+wjksICqNsJO+MNfjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172408; c=relaxed/simple;
	bh=oQMVU8CpkA9s5kiL5H6wuFFn6MAbCEqOUv5Twc3UmE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NnaUdyMiB1Z1WQHEgHiHOtEKqM9nmG58ppkf2uOXMucZ0NJ0PeQf9+9v3b25sE45ahwjy3wdd71eeZsPEqsbBaJCSRYroSPtLxmclhLQaEO9RnWFX/0XXpJC+CHq26Ptlbeyo0pJuql+reBEl0ZSoMk9XSogYiUcC8qP/KEJ3Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=RhKC+9ML; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="RhKC+9ML"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so4963255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1790172403; x=1790777203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R4doGn8NmMxWa1rKrQkSd1esBv7W7hOO/WeyOJxuxR8=;
        b=RhKC+9ML2XEh05Hq4asmq2tSoLVZYM7hMZiUmHPeca8AsAlLVRlf09cNIfDXxJv8k9
         /k+wmoEKqcqg/+LcZtyg0jc+ip00oCnaSwIc2fqrqZ6vhcVzVeNnZyCCW6DRfCHYI+dR
         McoReN4Xu3ShiEXZ42GoiFZGxrfX46XuqMsmFEnF89giGqbMANKvp+LjxYYLUVwqngAn
         QSlHa0nB5vnIKsXvffiLQdOc/0maopwotBOEXhi2kFF0xHG8eWO3pJvs0kq5QsPdD5vT
         a8bCsa5DoKKo0GKCt2lUfI0Y//hcScwc2aLas6kw1/FQKj6WXcTbtdMDAAkjmGWdv73E
         9PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172403; x=1790777203;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4doGn8NmMxWa1rKrQkSd1esBv7W7hOO/WeyOJxuxR8=;
        b=DTZcDcSBOBnAPdiQCsRsmQRyGgpkbk/IVfbk0ony5SNKBZakL7gb4pq+aAmGTeX8xv
         89eZ5oO+1s1TJaXjMG7TDIoLXQuSfkHPAZgSFFQZ8MJm/tm8eZvuWvF19PMiYy97Ss23
         WitF/UuNKAaMpcoQW2U3J8GRb0nGbTpHBYvlnwzr7wxD9X8rD4SakeP+izrsMnCyucqQ
         a4G4P+XUQMlg44OBtMWv0AV9ktP4zl2xK+a3ClySObK59tMGRULgCqJHZTMkkp/aKp5w
         O8emVOnjspZirxDSF8H07h9Agez8bQeRVzMdO5dZn04UeYUKsVqc66XTEj5SVfDJV+Qj
         sxWw==
X-Forwarded-Encrypted: i=1; AKwUvBx3QHesDv579ePWJPEVlMb61A+Kzaxl6P3M2BENmODr+Ys4Vu041vg0upe2kwKDCg6RdgGZlBba638Jl1s=@vger.kernel.org
X-Gm-Message-State: AFuF++kzoNG8mWjV6uqjTR71Un3eRZCsXOUy5jATgm1Cv05jjpFJKZ0n
	H8iE9TfcJVkRiwgrqewg81GZrghG7jm4nNczeMoHw480EpDuwJWTJjovLqCQlASPvC4=
X-Gm-Gg: AYBFou2l0AmCvZl9E4JM6g26sCDcPvfzFD+iLgjK5ZWNOiJ/n8bdl3SREJP/X2VBL64
	E6+0YGcN6EhT0OgscPZqaash3jXJkPua+E30sCynzWQ1Q7Xi1b7l7ydlUu2iNMyLitQ4O1sl4ip
	VVCNRnxxp4AJD3GlN+KfV7qO02WpvByhleqBpT3cjs2hEAPI56mUG5Ht6T2aAX8o0ZpZdpO45eD
	0t+j6S2SeDfkMuvS9JPv69szuWFApqQS1ZM2GD7PLicvv5WyfEdCiOgYF6Q7WeHBrk3nU/d87T3
	+x16mYCovKDvhASQoxIZYcm5/8Csytzw4xQxVIEIzA1fNqrc/oiMv9K8pUr/6d5vslbjmvZ+McG
	ilrBH7XRIUIIzGGNYCQ3jjH2RL4BZ6/KOAVS1jdUpMhOt5K4HzPJUh4OnCh6J/8GlgqoifU4sg8
	+M3hlB58iDd2gfPUVmCkHAspLN8hCU3AvSV1MWDk7sMYOUIf7AH07k718+PD+hxbmIYQ4yRaPdW
	lU6PzXIxQlxpZyiGdeY5pRW0wtL1vY=
X-Received: by 2002:a05:600c:46d1:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fdefffe1fmr40005835e9.10.1790172403175;
        Wed, 23 Sep 2026 07:06:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b01f:2334:39d8:9506:1776:f780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18a8a0sm78087455e9.5.2026.09.23.07.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:06:42 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: [PATCH 4/7] drbd: raise the maximum resync rate to 8 GiB/s
Date: Wed, 23 Sep 2026 16:06:05 +0200
Message-ID: <20260923140608.1116713-5-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
References: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The resync-rate limit tops out at 4 GiB/s, which was chosen for bonded
10 GbE. Current hardware exceeds that with a single link. Double the
limit to 8 GiB/s, matching DRBD 9, and make the constant unsigned like
its neighbours.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 include/uapi/linux/drbd_limits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/drbd_limits.h b/include/uapi/linux/drbd_limits.h
index 4132b619376c..bba0a0aa8792 100644
--- a/include/uapi/linux/drbd_limits.h
+++ b/include/uapi/linux/drbd_limits.h
@@ -121,7 +121,7 @@
   /* FIXME allow rate to be zero? */
 #define DRBD_RESYNC_RATE_MIN 1U
 /* channel bonding 10 GbE, or other hardware */
-#define DRBD_RESYNC_RATE_MAX (4 << 20)
+#define DRBD_RESYNC_RATE_MAX (8U << 20)
 #define DRBD_RESYNC_RATE_DEF 250U
 #define DRBD_RESYNC_RATE_SCALE 'k'  /* kilobytes */
 
-- 
2.55.0

