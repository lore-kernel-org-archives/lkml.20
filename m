Received: from mail-pz2-f21.google.com (mail-pz2-f21.google.com [74.125.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0914A1E0D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461900; cv=none; b=c+AlmgUlUoWG6G9io9Uvch6LV+Qhzqyy3rqlL5cgPKHxUkY32gTlUFHwOILC9CR7BjS/DW6i3Ku5DJJZUglbMktMDgXK0mle/8oIjR+t5Wwd5i2b3TwwXy61jXDh7PFG/JdGV8vHD2ZeuYoLpNbu5lfJNRTkPI1ppGi4Nq4q7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461900; c=relaxed/simple;
	bh=qhilQtEwoADWivd3qGD2EWMsOwf7j5yXfD9quboeN04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rujhhWavho+clXPsD3tE4Eq2W1ExY0xfdeW3EzAPhD5DANhq+ElYAZZl0IYZlVdADM7hiLBusXHG1uei+kJHHMQJGCpDF6NJTM0nX2Z6C9SaZ6QeORkPYoLgjVdqZ1tJbSQdVikgkKaPRf/IsJuhvDQ84e/g6fP/gEAu47mlcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEX0Ec8p; arc=none smtp.client-ip=74.125.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEX0Ec8p"
Received: by mail-pz2-f21.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so18982a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461897; x=1790066697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YAVWjX4Eu+ZHsqxn4+cTrhtGLpr5gbFSdYgLWKGxueI=;
        b=pEX0Ec8phrSYZSwL6J1ld6aPs4I0TE0fNSVvmf/N+sPRPkliqwJsJ+sghd2IUkJ/mZ
         qBYtMpSRPAU2ul9x7aLBSoeNKNAyskWzbBdjqtgB5BIQl1hAxi5WYPcEbwKFaJBhSx2f
         pn5c/nWyjIKLoZ5Zc1JuKvQhLA2W5Ar4OYc3pwPDeJ+KkcAHvGGnLfOy/d+UBol3t9GU
         AOf42ag5m5hBopdYQtFIuoT+wtpNE/bXZBoC/psYl00qXolsdGyeBDOwX/9zvgwK3ilE
         pyObcdmozoQTFWFsZ+6lOzjz/Lvzz8vpVjXdZLsOJWj5wsFTZrszUpIyQyfj5lJ1L2Kz
         d60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461897; x=1790066697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YAVWjX4Eu+ZHsqxn4+cTrhtGLpr5gbFSdYgLWKGxueI=;
        b=t0TNpGz2u6/feJfz1nfG1hE/dq3xWol0pK3T1FK7YLlkg2rGmS03eM/5pOTXkaSS+f
         t7UQIDXp8Y4swh6hftfK3T9PcuxHsvtW7Cs2kPpbH0LRXCWWD6E6va1UQSm7ksn12rCw
         +brtruzUFwmN7B81ZY+7TrJNK37PQL8WCY55P06QUt9kr6bZqbA4uPgD+M7/aDHyEiJc
         +zJB/93qjFm/T8unhf9y6rEp/oVFczQiqGSEj2Jsky7gVCmCNiC5kdW7odnCeNq2Pc8X
         LaVn2/+V4maZsz7PMz8FFalZAZBkK99SqfS5UgQJaV1/dCjg4Q0uL7ExpiUXWBvl0V8T
         iirQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZHpYu31Mnejxp+IGujS/Ff/kpR+qXcERYYn4oQ+8E//DTu4aUjeHVP44gfI2z8RW2Frn/lWoULy5dSm8=@vger.kernel.org
X-Gm-Message-State: AFuF++lnfyg2WbxigBYXMNHmYUDWWB73VtNluk/zqTiftiulP2MFegFI
	lio0V0IS2egw2SLcH1/vHsS0bEpTfI+5W/RbfvAn7AlhKPmCaFCqYhy3
X-Gm-Gg: AYBFou2BMBrhf5HEUNcxm1nrIbpNF/Dq3QBW7CCeA+bRxY4Y7fAnCehVgaaSf6QhWmj
	4cmCBpAczTUuhERBdnnETgNl1OAlm56bu7x5NPrHuF+OmUbVou5BvO6VceYlpK7c8ZWb9wkzwcy
	q5mrhEZKpEJpprg1pWfu4GEEAKWkXFwvfSvwORjzX3ddIWPlyRw9EsFxSiLLYT4ATAztSiXgxf8
	onzYDEL3UPEehCeN7rs8VK2wNRBYlcAwF22WeBu+ywbdzqNmtlc45fa9qlcxCQKG7Ju1AUYWoXi
	XuKq1Lw5Uzs7YomgloPQeuFedFMnWUNxet/AfZ/PiO5OTqOnew4ACSp9FbCphnEbQeFp2mTlcyZ
	83JOYyhdTawkq694nM6f/NzztbLbjUyoSQzXGqvyUP6ldL3v6T0rMGEoRrW/+zxD6CgQ/UnBowN
	RYghQZfYtVNo0eNfFcIMreU6mMF5HpA4m1wj3RwF/yCb+VAHw2IQhvFElcQEN/56H3LExugNKX6
	FOkzGG0Jfa2TC51Tolf8VxVP0M=
X-Received: by 2002:a05:6a20:d48c:b0:3da:e50c:5039 with SMTP id adf61e73a8af0-3dd529a4cd9mr485167637.15.1789461897488;
        Tue, 15 Sep 2026 01:44:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 10/23] ALSA: ppc: tumbler: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:11 +0530
Message-ID: <20260915084424.1007757-11-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/ppc/tumbler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 139c7b25927a..7ba52e7a24d7 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -1134,7 +1134,7 @@ static long tumbler_find_device(const char *device, const char *platform,
 		gp->active_val = 0x4;
 		gp->inactive_val = 0x5;
 		/* Here are some crude hacks to extract the GPIO polarity and
-		 * open collector informations out of the do-platform script
+		 * open collector information out of the do-platform script
 		 * as we don't yet have an interpreter for these things
 		 */
 		if (platform)
-- 
2.48.1

