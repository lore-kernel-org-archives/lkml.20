Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839753;
	b=SBTSmLglPRaB3KwxszK4Z8Tof6zCoHnNLtXXCDeCsvNudrlGn0r20zxtL+nK139mqLgq
	 dfHMcZ3lCims6iH9JvGeov/P42Q3oLlOWi82i3Do9BBcCkzhWl65KzU2ipQKB6laYVckM
	 HO1Z8YKwWgmr1sgo/jut8pUpFnY+fgi9f1AkuuKnxrtY5fJZoCr/g2h4+23ErAVCqPTBP
	 PxjqnU2DTzwV6CzK/LBvFjtQ9Mb457/E7LMkAuQqvtBr+CIkwPKBThGk8Eze8avt3Eimt
	 dnIYQxRmp0dUmLHP+hww+voTgcyLdBevo2uQ4gj2pVXw3zRFqgXm6LGQ1/zndGvK+uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4h3BLrXVHnJpXsfgbQ6hyAgdCfmWNlHoclXhroqCLTQ=;
	b=Nr4XsSMXTsIJl2CdINNiU19YT6gs83BmwqkrzlZojpnNBCTz/fwghDk3c8LHqwWUDWC3
	 yK0syLSdnfd3MA/MmMnpxG18w9Jhw1lA4EJyQZRq8+uBccgmmEn42+k4OuHKGBe7v2+UC
	 zmQgcZUZu3sdlYTu7dFyxMAF5xdNUAdkZhJ6u2Tx6bSsBNeAy6dRvG77PiiLfRiWaTuE+
	 gQcBoB8CIj/Eo1Fh8X5xuVG/ufWCNhp1qTdV+xc0N/e0xhxAdaj+sJqz5jwoLxZjvSglI
	 Oin0bH1OwHGxHSIt4XuHPEojlrblPcddwg5h+lvl/iwB63mzmTPci//cU7KOiNmmNog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMlT76ti;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5A9606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5A9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMlT76ti
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso9742235e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839751; x=1794444551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4h3BLrXVHnJpXsfgbQ6hyAgdCfmWNlHoclXhroqCLTQ=;
        b=CMlT76tib7PSYcqx2zJ/vlCC/lC1Y0daCJu4o1YNPOKLP3c+5tnYv0v9swgUi+gbp7
         4FaZZx90N1jeMtleG9SWq9Q2aqFTngJy59DzPT1wUhrX30GID1hbq7BF0f/YQAJd7X6K
         SC+A8J9TyplMbbegXxfSEuamW5otF1aJ6HsfqFHqM+ij/2449+2fBfvCTTCGrFkRbC7n
         /VL7Sz10wk8s1dZKHN3zvH6+UR40Fjtppr/Z1zmkDFSQQHugcgTnmEIQlpGy2iltTtIH
         u/8zEqW6Vy8/1yvZ6Ibh0ApXRBz19pEPcZdz61JUj9zk2gfBoM4Ug0KLxkvTPdyuYU9i
         gnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839751; x=1794444551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4h3BLrXVHnJpXsfgbQ6hyAgdCfmWNlHoclXhroqCLTQ=;
        b=TZmXKElDsRE7oea8BFsbf2p3yecEHiruIey8eXIGIcwmOZW2w+PWL3MlNz5KHCnjUn
         AUiouZjUonnFgeSa+aF6/dUpMSq3aaAF/YFHQTvHOr2ghMWOAHmeCa4cM7mKO3GxesEt
         ylxxNBJ1mzNo+FWQZgu04IbgbjFtuJNuKqsRHwyivizbdLnIAqr1knJ0Jw0Xe5a6ULcJ
         O/CdiBw+EqJm8FnjCLjP/Pyd0aP/PEiqYAD2WL4bPeROH24e2GedWvmVv78skj+11iOI
         4iEzLqUOR1W4kCo5XSjtJ8endFooHaoqSDGCh32u3vyXZZPwOyqeqvXBQTjVdP2/RXcC
         /bXg==
X-Forwarded-Encrypted: i=1; AKwUvBwhAnlMVpTHjIUhX4HDDGP8hsrbwHzgZaHIwd8XuS7y57UMxHh1SItlSJx3sbBwaKuUGp2cLiuripcAlrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z81GSdTxWC0a7a8kHLSNLYS3+/6wkM52GSqtoP3eZcAr979oPYx
	L1HA8N7UgRmVnmWKNAVYLkgKKUXuG1Sxb4eW2mE2Chw5FsNWJnfeeSTy
X-Gm-Gg: AYBFou20oiGvI+SWGWeVgt8izTrd5lvN6vHMQchCbcjERXnblhbGpRZJEHT1mhN53YX
	Ik8d7zCcnPCYCRFBoOrZaGbGBfLYUVJ+1p6lKqodMY9vuxoBF5ZSfPYPixzI2teL2/BSvu/ZPhk
	ZOkUv+Je9o34rXGoRpgvS/wkTngOXV/ShJ0TPZclFKsTaPJ4o6D6IJUTsp3Wpj1RX13h1xce+vK
	6Zyj5qsBFOPpQJAIUmVFTuG8R7BDsx8SUHjtzMFkVlW+FdIi71nUWMEYy7GMS0W+zijQYoBRT5b
	XD2RYN4rA8zoW7w6lEHmbnoB8b9fazY2PKLRKWb88djWJq54JbD2B8W7RleGcRv/Ix+wYEFaf6R
	+g7nSXl7/PCpkUhJmNDwTfZPYcED9y8u+K0EFPHG7o9SQz1hzUd1oUkw6TKQQ03VB3r8JvXMaTe
	ynOONW0U2/8v6YwVYqcfEJHSg4BFVnuXcNVhtEAu4Qr57MWd8At5bxcmysaq67hheP3B3i7+AfG
	jxRUWapaIV0yHRieYsS7Qd1kf8GpcqI9px3zl0aygUoh4xlVb/yR2mV+DnWFqJN3fH7iJ9jJk3A
	UtKqZPUHOcnHh4769HQm+lCI0scGEE1O4krq3l+J+zyfoF6MhhGIgV+JbJFrgoY=
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr384150545e9.15.1793839751358;
        Wed, 04 Nov 2026 16:49:11 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm21341515e9.9.2026.11.04.16.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:10 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: i2c: vd55g1: Two control fixes
Date: Thu,  5 Nov 2026 00:49:03 +0000
Message-ID: <20261105004907.150545-1-fernandorimoli11@gmail.com>
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

1/2 marks the auto exposure lock and bias controls inactive rather than
grabbed in manual exposure mode. It is unchanged; Sakari's question on
it is answered on v2.

2/2 replaces v2's hand-written event ops, as Sakari asked: it
initialises the controls before v4l2_subdev_init_finalize(), which
enables control events. The same order fixes a locking bug the driver
has had since it was added: the state lock was set before the control
handler lock existed, so the two were separate mutexes. Moving the
finalise alone deadlocks the first stream start, because
vd55g1_grab_ctrls() then takes the control handler lock a second time,
so 2/2 also switches it to __v4l2_ctrl_grab(). 2/2 does not depend on
1/2.

Because of the locking bug, 2/2 carries Fixes and Cc: stable, unlike v2.
Benjamin, drop them if you would rather not have it backported.

Changes since v2:
 - 2/2: new approach, see above (Sakari)

Testing. I do not have a VD55G1, so this was tested on the VD55G0 of a
Surface Pro 9 (IPU6) through an out-of-tree driver derived from vd55g1.
It is identical in the code 2/2 touches, apart from one more
format-dependent control (pixel rate). A test-only print in s_ctrl()
compared the two locks:

 - before 2/2, VIDIOC_S_CTRL ran s_ctrl() with only the control lock
   held, and setting the active format and stream on ran it with only
   the state lock held;
 - with 2/2 they are one lock, held in all three cases;
 - without the __v4l2_ctrl_grab() change, the first stream start hung in
   vd55g1_grab_ctrls(), blocked on the mutex it already held.

The controls at probe and after a format change match the unpatched
driver, apart from the default of that driver's pixel rate control,
which my port of 2/2 left at its placeholder. The flip and test pattern
controls are grabbed while streaming and released after. R8 644x604, R10
and R10_CSI2P 640x480 streamed 90 of 90 frames, and five start/stop
cycles were clean. v4l2-compliance on the subdev gives the same results
as with v2, in both exposure modes, and control events pass. The kernel
here has no lockdep, hence the print.

v2: https://lore.kernel.org/linux-media/20261101195006.220657-1-fernandorimoli11@gmail.com/
v1: https://lore.kernel.org/linux-media/20261025154031.27083-1-fernandorimoli11@gmail.com/

Fernando Rimoli (2):
  media: i2c: vd55g1: Mark the AE lock and bias controls inactive in
    manual mode
  media: i2c: vd55g1: Use the control handler lock for the subdev state

 drivers/media/i2c/vd55g1.c | 65 ++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

