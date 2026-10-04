Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7F93CF1ED
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132483; cv=none; b=tUoyzA2Ym60PbeZGGkmd7uLDQklDYtTlb35tM9px6buSeImj5RCpRwlIuJg9bjHtbf4RzaW2e9DCuJEozMp72YfpEpE5J6lH1ohy4liuShhLQwmF/s61OYfdV3LT3aljWzozfVRF5ueKKoG8pFLRxQkAgns9eIZv/Qp93fJYnto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132483; c=relaxed/simple;
	bh=b5vOUunq+lX3bEf94rzVBNkBXPAuYxICl8D3tLvNs00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGMPZypbOrWOb+mYqFy+bRsCYHp2vhcPOes1f2KJ6ZNFglOG2uyORID/7OsgVvHr8KHQFBIRF50zuxcGHH2RMiFKC4zq7Wuc95nWToD0blxYMTuMK9+9Q3BMnOna/hRb7AfbPPZasU/GeQEdeJj+Cs3aIenidLOm2PIqCuDIP5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=D3SO+GHb; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="D3SO+GHb"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so199501a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1791132480; x=1791737280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdB1HW0x985FxmlkTK+biNSXAopRw3hFrVwg2D3Jjaw=;
        b=D3SO+GHbS0tj7VJolBYDHXfianeatJS5tDYL46Cn/bWRwhxKtqfRbvNylINAkKgURf
         zAxiMKJKRz14uqfdxdV1R0uqizKrWpt0mEOpcxwTV6lvtPk3sRQYl4/tU4qrFwBim5KB
         BbTf7TG9P81Eq4a5w/2JYxyDlMTz/87KrRQeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132480; x=1791737280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KdB1HW0x985FxmlkTK+biNSXAopRw3hFrVwg2D3Jjaw=;
        b=QTITAyZsmQS4JiIEpgRNACSCx7D0qDZODSGF8jbEOHlNZH+DpET058ONkt26YNvq5T
         aZRJb2N3MjH8YzjO/m4I6EufMflc2xG71YqZhMSY3itRM8eCHAJ39GRUe7Oha5IbepPf
         7RNXWds2PZmDes5jiq9oRIpifL3Ss6Dh502lRhaaS5a0JFJjE9cLEPSoi3NEeu6UvrGU
         MyGWf1ks8FICwaFS0CEuX+/gilAAaNTXw3naRXu+UYrNvBsamIf5tSG4Msawn8bOJyO+
         BNZtMmdUxHasFQoOxG/0Ioi2a66DXYM/1XEln/oJcBQJQZ9/tV4x04fNJ52eYT+boxgH
         tlzg==
X-Forwarded-Encrypted: i=1; AKwUvBwFy4yd8mks6N8pXcCnitVtf9YwfPG0OmfXl6ehfSTzo8ec2xQkwqFHUygEnWkmmD4nMNeS29BO8oN2BFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwYaD3HEL3jiu860chrdGzv8DQj7fw6ZrS7MeBMRsvcjYZxish
	vjVqtDznI224H0sPKWuzsdNJqXsFMKxGJPFUq3NJU2v6n/KtFJt9uXFKpPb0acLXai8=
X-Gm-Gg: AYBFou08+uQ1VulNRbbGnzL9wETe7de/Tzu41Dk+RiGUdZYz9Ze4EiXQcQba3Yn/DGF
	hJW97dgXg5A6IwrP36mIi4YWHXTMP4mQV/qL/lkVScgGAMZx2qKipJPado6CagsDMHrwQ6ldMrS
	ZTTZiZ7Byl3ZtWMBS2l/5fM45xiitJFeOM8AFyEhmKF0IBRmPQZACVRg2d+t2Xqh86CNN96gXU9
	qlnz7T1ZzRUyBqFPs6d2n5mdeQc9wElcYPabYe6TuGPz7Yzf9L0/WaiuFgfJ6Sa7Axka/4ck1a1
	VdiAsynYOLQpZ2GI98K1ZTQqHSdHmQd2xmFOkty84STpwuxJYtZU6hq+kLQzCyWExSyLIU/6wEA
	AfaE/04/zg20beA8As0XRpEaNqXIyR5mwjBteKI6GCrDLPc8CwqSuxq8XRS+qtQrhgUmuQtIpZb
	timWXyYjAZwwpYvAzkEBs/+n64nmAxuRDfJb0EW0QjDaqFa0xO/CYPraiX7fRM3kttNb3QHBq+
X-Received: by 2002:a17:90b:514b:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3a7ecabcd6dmr923970a91.34.1791132480338;
        Sun, 04 Oct 2026 09:48:00 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd0cd76bsm6500454a91.2.2026.10.04.09.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:47:59 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/3] accel/rocket: Use an unsigned index to copy the job's tasks
Date: Mon,  5 Oct 2026 01:47:26 +0900
Message-ID: <20261004164727.466164-3-sidong.yang@furiosa.ai>
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

task_count is a u32 from userspace, but rocket_copy_tasks() walks it
with an int index, which would overflow for counts above INT_MAX. That
is not reachable today, since kvmalloc_objs() rejects any count above
INT_MAX / 16, but use an unsigned index to match the type.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260711063638.61B411F000E9@smtp.kernel.org/
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/accel/rocket/rocket_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 319365ad7976..428de5a7cb03 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -78,7 +78,7 @@ rocket_copy_tasks(struct drm_device *dev,
 		return -ENOMEM;
 	}
 
-	for (int i = 0; i < rjob->task_count; i++) {
+	for (unsigned int i = 0; i < rjob->task_count; i++) {
 		struct drm_rocket_task task = {0};
 
 		if (copy_from_user(&task,
-- 
2.53.0

