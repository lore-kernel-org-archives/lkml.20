Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7975F3CF1F9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132479; cv=none; b=GkrwGP+3utnuQRTgH0Rqk9j1jZgX4ZLKgAfxHyb6ug9PuY8N/ag3UpBYCItR9XEoE9mDRJyglYep6uITS8upknskjQETXrbTwK21oPwz8C710wzlpv3lCXRZ2MXtvrEYprkMcOekTctyHtU9woOKPPmZOXRAk4VaoI3ZF0jB2nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132479; c=relaxed/simple;
	bh=aoH4fqzjDWYjj3v2lr7TS3kSOj/euwEEKRvuRvRBly4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1SjyB8zNVZTWaVVCFeg2GjizBMjCLGFyGXUDDACjpXwC/LjHgwHMoxzUebEG1xG+y9m2jHt3gSZComK11B6M7t25QEWJX4simx/TcZ/37D7DHN+34ImsS6tWBsaPC3m3x9dfVGA02eeieH3fe4ELWTvZpl5ruori0bYl5p7Htw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=K7S3ewcP; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="K7S3ewcP"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso726158a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1791132478; x=1791737278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnRFmiKoVvl5Z5wqJW+Iv8p1Oadmf46rxi2VSxWNJRE=;
        b=K7S3ewcPvTAABfmFEnFO5rE+I1aboF0DZ2wTCi/n8tm569cJWbqPx473E/FGl7V+BQ
         Vr6o3XNfbsIL9xBOR54BcvCvh/UWrHNUljlAMQnVgx0vxRo4uNCThrdNOu0OEhLhlZu0
         TvQUIhvZ+V2qgy4PP4Hcdp5KYP5lbejNHWn1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132478; x=1791737278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnRFmiKoVvl5Z5wqJW+Iv8p1Oadmf46rxi2VSxWNJRE=;
        b=dThQ9zOR7uM08FCqMvBkxCk1TXygSMCs5lGE+BaqjOvwNFv7mB4GAxi5H0JrwJPbFh
         h+jEW46Uyw2ONjXGnRc30kSz8enSaNWtM1hehF1tH9HN7l5HkVjcdIrzFz4YJd3OPUsC
         9LdsHb9Qxc1Np8xgbue1ALeauHyO/vRL72OQFeUKSi8chE41pkqqZnXMyQ3MbAJK8e+f
         8dCSrh0kaGwxvuY+L1Zv5dC4f5FX/0rXBx26HcSp71DF9uMlW6BLyIj8h9Hq7nXGiRZU
         dUzdF6BwXwulLATTalc/08YPw1wkBm4ONQjS3NVFU66/8tlYK5rgZJ48SDLqxxFjmfIj
         uo8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhitBssRP62E+4uScx9SuOcSJ9sNgW8iGXF7dIc5iaHRo6+soYdPzCVr3ngHDJhqGBgXyVPQxJ7ENJHyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzekascFcctIoJTWFWgWlnXCwLULpi6yjFoQwjVVofAlAbspFO
	87gGggJTzDu41oCBxRcD9iEs4RPQNklXTLXaOgI1P2UZpkoS0tjz3q/Ybr2jlNdnXx4=
X-Gm-Gg: AYBFou1V4ZR74N4+NzB/lOPzi9a98mbJ2LLjOLYUZq94VJB5nLdnUY6DxX0krA91CUo
	MMEvffLOP7zl9oFAOSB5PRU6fQotqfdU7pyGeFhLqtTWG31bOxZRqdClYb8oetfDPYkaOOgUTHX
	pyrOXdCExwIsEMyj776FSe7ZBXC4O0YpjwfhScHK4/w1zQrFlpf9x7ldMZ6Ryh7D6LpqJB2SmkB
	pgpJtb+UFmQdluFWGW3QsOHVa03Cgr5NXau7K/9yoepxRvKYCRlVV1Fk5VVTMBWOYoWyE05mgUm
	wEalwjY22UK6zbzTU+fVHiKgxvEG1qSskl1HSjkvF90yobMko78pZKvTw/Yz/cbvQBDzJIpV4xu
	C3Ng9TCBoufmhG8XyW94z6sVQ7PBijB8SSoxqmOinxG4B3IKBtOrev05TbAhXiiwMkEg0MDVnFo
	VMIY645/lZnCqLWNPSRRKSgXcLkOYmn3/uuMhXoJ0UZOK/2Uf2XD7t0rN+5D3Ibez5pm/5u1NV
X-Received: by 2002:a17:90b:134c:b0:39e:6a7e:ee1b with SMTP id 98e67ed59e1d1-3a6ce7db233mr5437577a91.39.1791132477646;
        Sun, 04 Oct 2026 09:47:57 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd0cd76bsm6500454a91.2.2026.10.04.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:47:56 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/3] accel/rocket: Don't tear down the scheduler when drm_sched_init() fails
Date: Mon,  5 Oct 2026 01:47:25 +0900
Message-ID: <20261004164727.466164-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164727.466164-1-sidong.yang@furiosa.ai>
References: <20261004164727.466164-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_init() cleans up after itself when it fails, but
rocket_job_init() then calls drm_sched_fini() on the same scheduler.
That wakes a wait queue that was never initialised, dereferencing a
NULL pointer, and can destroy the submit workqueue a second time.

Only destroy the reset workqueue on this path.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260912114524.7A6131F00893@smtp.kernel.org/
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/accel/rocket/rocket_job.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index f40435505818..319365ad7976 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -494,8 +494,6 @@ int rocket_job_init(struct rocket_core *core)
 	return 0;
 
 err_sched:
-	drm_sched_fini(&core->sched);
-
 	destroy_workqueue(core->reset.wq);
 	return ret;
 }
-- 
2.53.0

