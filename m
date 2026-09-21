Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EBB43B4BD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022214; cv=none; b=esTjIdYWfHb270qf/tdufNm1ou/VRdySNvOOtgyP90+PdvPAk3mowBbNzgaa3FRfosCB1YQP8emWmRmqWB7RB82g5DBiVXLQCkCsswsheS4cJfWJmaNQ3NvXcwsQcQrweOXkJcSMQFIYldsTG4hSiwm/YQgacA74QdPFPhDJF+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022214; c=relaxed/simple;
	bh=Dh7CzGb94lePskG4vTzYDyEDmz7SMmw+hT34PxFpDdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLlW+zDnWMJf8CjU+FIInCHiQL9W0FYadBsXdH1IvABoxSOCECpqppjlKZ6hlGZ4ii5QUZrOY17PvRPL0QtTc1+xUW05MQpJjznQ1KFpqRiIV76X6owpMH5ZsM18+M9mCmx5P++pjxGLJnnwQrmQPI1LWfqdVjzXyeGKTCkWiMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNXQaDrE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNXQaDrE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so19006835e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790022211; x=1790627011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoS0Ep5+r4z4YlTt627EYalzOk4+5qRc8xeZyDmWhG4=;
        b=JNXQaDrEwTsTj3S02egIwaKaQBDA4kG1RBmJUxjgHUR82C2mhewhaBo23SomLx7e7U
         sLORm5iHW4EeFk75ukIEYrj8elIk1IM4ckeem5gnb4SUFpOEatDAXCVLI1D7L+02pYIC
         B1grYdPkMnwW04HCSSjUJLXsyP4cne7OI05sI8WnTdyPeI7mN9ndNqy/+nJrOjShYcCq
         mXbGItkFdtcm8rrGP//w9JgKFm2p19qePgKSDGGOs4/4Ql8OY1cyXDL7NZgZ21SgcKoT
         gKpLlJFD3SroGQbcY/yiOPhty5/NUsqS4AFgJQqhffgd3bQdMnbdSxwI4vWnRdsQLean
         dhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022211; x=1790627011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoS0Ep5+r4z4YlTt627EYalzOk4+5qRc8xeZyDmWhG4=;
        b=HJygs6w6oYWGjSQbTDePkBP3Lzqt7J3as/TgPu+wNgOwDv1k0EWQHvIv2j8kmT5Hol
         HY+8lvvs7ijg0V9A1zL7axNcyVWUNk2/7dVUgVweSfDiKBvK8NDccY6k0Nv5tc1X7ZU3
         n6kaOE/YrltHWMhvvHM45rnmH5j9NyDM8jsvUHw66kVP8tSdwV3xkkV6oxpeKumrcLwW
         LQONtJOpO0cn1sl4D4xBVR0r4da/efo49acanwHjOD3a0OzrMEhYKMrv9V6o/zz0u3Q0
         EqiwNSMV8SckLrBdbjkpwXe5m5c2yUxYGmeb9dn1zYDxti0RpdQi8EvI6O2tw4hAYP3s
         f4pA==
X-Gm-Message-State: AFuF++md1GT4OK4kPvGcvuU3jYFry18Ex/inXj5Dy36gXssDS6tx91XN
	sqBkK/xk5YiU98SSWUxZMRG0bD7iTnU5GiXGmt/lCW6O5Biq9VkdKTB+x73DqarAng4=
X-Gm-Gg: AYBFou1t+qMuK+zojBMl8k5oZEPr5IuTXpBg6/5roiOz6orOv+4acE2JIvTTckHh0Oq
	f3Y3bxyxPE4Ew5EBpx3rZdeN22DDcGPztmidmHIjfekRDpwKKCG1t/WeEvSyB/tGsOssBlYy2K0
	iQC0mT4lWaipTwz+pPtWUmMQN/7Ygu7tx2oQ2EKZxv3JX2GET1cbSnKSG8BQDN44UGXspwmcDhR
	GQodeESMdFmUulvGEnB8dD812mE8vaE/rpODaY7PdogfpYn36PbQ+lcbgRsAQ7cDWje7UrwA9Xz
	6kpzcBH7Igqz6lfDi3Zz0JCGo4IZnf8TcdcucGAS0aVf+DmIdaotKdGTT7sHJwxIWiiLjVVAd7B
	1IpHCNsUkWA14P3tDEDhr7qL22vD2+7xq6XnW2fYt+BgAuzuZ5OS4zasvaLI1tHSf1ES89zwK1Y
	BBdlqAonlHzTX99TdwpzbjStbHeQF+mRXJnjDGTv9B/dbrTYD/JbciKB3PCKtFrAOWyMsM6WB5t
	dibjp10ZgAF3R/jVBE++jdmI1yV66glLqL+vxTgKWyabA==
X-Received: by 2002:a05:600c:46cf:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fc5687b6cmr180052805e9.2.1790022211319;
        Mon, 21 Sep 2026 13:23:31 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cd5214sm17778875e9.9.2026.09.21.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:23:31 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Anton Vorontsov <anton.vorontsov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Cross <ccross@android.com>,
	John Stultz <john.stultz@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pstore: don't leave an ERR_PTR in the ramoops zone pointer
Date: Mon, 21 Sep 2026 22:23:15 +0200
Message-ID: <20260921202317.70595-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921202317.70595-1-parri.andrea@gmail.com>
References: <20260921202317.70595-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ramoops_init_prz() stores the result of persistent_ram_new() in *prz and
returns the error without clearing it when initialization fails.
ramoops_probe() then cleans up through ramoops_free_przs(), which hands
*prz to persistent_ram_free(); that treats the ERR_PTR as a valid zone
and dereferences it, crashing the kernel.

Clear *prz before returning so that cleanup sees a NULL zone.

Fixes: b5d38e9bf1b0c ("pstore/ram: Add console messages handling")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 fs/pstore/ram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 2eb0d4fa21869..aa056d0395a4d 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -604,6 +604,7 @@ static int ramoops_init_prz(const char *name,
 	if (IS_ERR(*prz)) {
 		int err = PTR_ERR(*prz);
 
+		*prz = NULL;
 		dev_err(dev, "failed to request %s mem region (0x%zx@0x%llx): %d\n",
 			name, sz, (unsigned long long)*paddr, err);
 		return err;
-- 
2.53.0

