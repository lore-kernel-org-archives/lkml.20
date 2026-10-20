Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486650;
	b=TSsdJj4ezkbftmRrsdojqbEPlGVdQKrLk7jjGrTMs0OyXzugsgyZy6i0JJDvCrOsPSZj
	 k+07Y5PIUBLW+bWMsmbyD1nL5288rqbw+RG6ujr0jmE+WfjuJE9Vnk7ne3Lq3ypa1jAlw
	 tCNvBJz6OMcVGla/i63ray5pA7w5sOr03QkLoD2FSWI976Q/Ysqe3bb7Y4QqoMiJwir/w
	 GjStqMdr3U+VL0OTxBbPjVTXOGhRuAhvMF9gbX5+j9UvORT369Pw0QQrM6mvTErZ5sAaa
	 CJERLrl07Ey+XF0LdmzL69Q/CNubGRVI209XDk1e+8mYVPbvT5vrO5ToUypIb0edSkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
	b=TGM5KBaprfKF4qsvVHfG8Ds7dgRTuiqy8ECxmRud2WQZFzlwl2UN+g9N0YIxZojG3dW+
	 MuW/ig2/IYTYfBvFsJbEMEFZYQbec6wFi1eKO1MHXxJFJkhlKZMRONDys6JFRocLKBlnz
	 cE8+NoTBmmLiAAzG5V2q8IxxAnuN4me73e9LEPGLI4RjjY6yKUVNSo3Yf6BiJcmTKpJrU
	 6s7sxzUDB5sX1gS44R66NnD82igU+SYI/KJt1wLUukgYlwqnj7/KCDsOCgQEqAc/X6/dZ
	 JofIik5ttz+CYJuExuflB1Psd3dlNGdf9KEj1A5jFoXstwgVGNK3DreGQIpj+Yd8Tyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lkiMEne0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA06606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA06606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lkiMEne0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so20653295e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792486648; x=1793091448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
        b=lkiMEne0upiBrvkuuLz4cwNnunnb2ScP2EK56cdD1HVn7eRj5c1k27pSvXoa2IQ/+1
         R7hIldbiJtOU3LmUuzRON3nVS6Q9vWQ7iFTXqjv1Rz+mpgVaYdgSjhCUIYzHFegfdxWP
         24Ceg1aSBaQDxrZcefd4HFm3TZEPQ8wOOLZ3B3VIv6QjdoS0E7+eswEuBJ5v6YLFtZK+
         YvXiSNVBxxXb71TfKjSiWmSDo6YHS6uftSh50bDU6c27RLqUEshRkwD+bKJq3jZDqj27
         ZFv+QKxhOc7G7vaDF+RNKqZBluPVxQO8bfiuFmQqAICnNolE94D7SB/VJvyco0co+rtr
         +NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486648; x=1793091448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
        b=0i27+nboSk41labDMhZrJ8DbWCiJB36WGaco0h8iGftvPodWSb0bNusqgPG/uA/UlJ
         stCVe/9kBxsSL00WGFp0OVKTmAQwml8QefyPtNVka52YiyiKKvy1UhCFWa3nW3yEgkX4
         VW+Sqf7ImedipKwlgvcF94/2xymwSrlFXy85cWMZwuCb057nk++FyWD1xVeA98brk0dV
         uDLmxCKcupg5jc5zVUQi6PDAZOmjGlGKWmvK7J9OPQ9C9R3rHisSPWxR2ITw4gfH+WCT
         0YN19nkRyqwdLHM5F8ELFhiSjl31f9BJ4bZ44JjS+fLp+7GKU/WhGdexSXj+9oECVo6K
         cL5w==
X-Forwarded-Encrypted: i=1; AKwUvBwyxNmcpxemH+4KvpUWw9is72yQRUZRPKmLgfyNXRj2iBkhbX+C+taphLPS2rx+xqalkXCER8QJA2Pr33g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpFuyIf80Zvki3/NPIQPYWk8A75eV9Xppjy7V+5dngL2SC/j9r
	m5T4lYC9n02rUiUfp7hMNeBxuETYmz7x14J7w3KEu87W9syq/c1appa6
X-Gm-Gg: AYBFou1YFb5OFzl20gNbfT4YBHrYVjN04SkusAFcQSJzPCVT+JPtGmD7Ayc7GAlPqkj
	Cea19dkw7MRY/Lfz67oRBcUcgskcKEDOSYdxThtNnS/ul7/zTjT5XFU11bnNb7Ev4DoRsKo7NJO
	6mEzQj+Jrd5VjNBS5T/4CKUQYyUazZ4l7G+w/LJWFIUP7jdm0VnbsOwfM0rs4sGtrt/krektsCl
	jkd4LE8+YpcAxHc/GkHYW3w93k7bwyv87wA7jmeCwsSgt1j6vmogMdO0yDtZ8pGONxS5vh2QlFK
	pQ2cWrR4H9WqVviUm7F+kobhVoWn2she1jj+BOal3WVv2Gxf9BT5FWa0p8FaBOMHnDE6uRAJRU1
	8ZPsxlEUD6TD5mzltn5m1Pt9L6P5enxFFIGBf9cjX72KXZBmN2ui/p2GhICV0hP5sx6KxYvkSTC
	5PKNwOzznYJgm+bIgSCrr+TroGySSzTnVmBvuCrAc7pZnHDG+GMCQ7iyJlOXZ1pRd8DYuJ4xM0O
	6aKxdET
X-Received: by 2002:a05:600c:8883:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a1d75fe793mr166287925e9.15.1792486648186;
        Tue, 20 Oct 2026 01:57:28 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.55])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm57580335e9.4.2026.10.20.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:57:27 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Tue, 20 Oct 2026 10:57:18 +0200
Message-ID: <179248663855.32151.9955864156939592299@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
References: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
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

I guess this should be investigated further. Yoga Slim 7x Gen 11, no modules,
firmware built in, so the GMU comes up at 0.6 s.

It's rpmhpd. Before its sync_state, rpmhpd_aggregate_corner() pushes every
vote to the highest corner. The gxclkctl probe does a runtime resume/suspend
of its GFX and GMXC domains at 0.18 s (qcom_cc_probe -> pm_runtime -> genpd
-> rpmhpd_power_on), and from that point both rails are stuck at max until
rpmhpd syncs, which is at 2.8 s here. The GMU then does its CLX DCVS
calibration on a rail that won't move.

The GMU log buffer (fw v5.2.38) agrees: the calibration trace of the bad
boot matches the first good one step for step up to the ninth level. There
it stops, and the firmware puts HFI_F2H_MSG_ERROR 0x007306c7
"ResMgrCalibrateDcvsLvl" on the debug queue. The GX_BW_PERF_VOTE timeout is
simply the next message we send.

With gfx and gmxc taken out of the clamp (hack below) the first GPU init at
0.6 s just works, CLX tables included. Three boots so far.

The wedged GMU after a failed attempt is a different story. Retries after
rpmhpd's sync_state still die with "GMU firmware initialization timed out"
until gpucc's sync_state (fw_devlink timeout, 13 s) collapses CX. That's
what the gpu_cc_cx_gdsc/NO_STAY_ON thing in my earlier mail was about: the
recovery, not the cause.

The RSC side is not it. On A8xx the GMU firmware loads the RSC sequencer
code and TCS slots on its own; preloading them before the first boot made
no difference.

Abel's CRD failing even with msm loaded at 90 s doesn't match this, unless
something keeps gfx.lvl high on the CRD after sync_state. Could be a second
problem.

--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1009,7 +1009,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
-	if (pd->state_synced) {
+	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
 		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
 	} else {
 		/* Clamp to highest corner if sync_state hasn't happened */

Oleg
