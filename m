Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03D15437EB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880167; cv=none; b=eYendzMgPgG529iZw6FiunQsoFn22O1t6qJ0UsNAIdfmtAehrYa1JvWU8A+aNyNO13AUya/VrzUYpkdN8V6a8YFIItgENCA5sL74e6Lp0bpLXzHBDwCmbpfUxB3GTqQ9YQzpuqePxnz8srqIKFr9Y9vMc+rUlDuw+373D6HHX1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880167; c=relaxed/simple;
	bh=hc911xxuUmZN8P+jG4Et5ZWTWNyakO0Xa7s2ndw9gms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CxKgdxYr+JeelVJBtnaXPrOQ1ehk9OgiZn3+RJoX77KPKIhRpKmA8TJUVwr6QhCOnveIqshY4bQrE5FW9v+cJ5DRl0tSmtJTuFVIcztcRty5lNomLTFh/hvJhMMLgVuogICp7x6orn4oMDQIxdc0bE6GEN7FMPS9i8bQct14Vu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLKt9M/k; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLKt9M/k"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so2170899e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880153; x=1789484953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGr9Cpmb+BSuPew2BBM6BAEAjAFzPbXBB7PZR5ZlT50=;
        b=GLKt9M/kujvwk5Y8aQC7tsdl9sjTIQMlyGnSGcLvrJT/Oxo4I4CpCYwkxVlAld0s8u
         sHZwtFzVGdEflwVPT6pzVbDWhgpvPgGgv8Rv/tUwGsoVWXt3X9hcXM5pQO4XAM4Y0vOA
         ggHKm3e3zpa8GuamtyjJjYzkEOt2hfqWj4nudjNMwKW/qc4XA1qSOFLgos/9l8Ks4CCm
         x86fnZZLWBv/ETujGhzwdEoBEHF+90ODZUvqikNXXhE82KYZRmmrePvQrN79/XP00OKr
         VWPTn3D6aGuOECmqP/dpsrZvTJNPnQ+gHMHv93yFNlBPkkGCrgrgLHgX1JYOX12A87Jh
         oXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880153; x=1789484953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGr9Cpmb+BSuPew2BBM6BAEAjAFzPbXBB7PZR5ZlT50=;
        b=s9tYR8nyQyXEFhZFgNlFRz2FHbhyjFRis5yaUh5NknNfr68sCMjID6YegnKIvK/nZz
         Rq0dwhiY8PW/P8fri786kyUxaRQmJ9QGlY9WNRLqbUxVy2VEQOphHtk4HjS2ufklz0zy
         0ABfz9tdL7Pbt+eDxbW5eCb9oULSeplwx9ePr2cGMGG5064OrC2EUyl54sB5bSv+RhzT
         /AzzVr/U/q+dI2jTocdaAiWqc6Nwt2SsFbYX5XqWODGVRc5VmvvYil8y+juJ7+oLoQ8u
         meFvGQw0ld7xiTjsgT0j3z9Phcmx7AKcBBRNbHE94hVT7nWsjGWYKxwG44YA7auLts3h
         esog==
X-Forwarded-Encrypted: i=1; AKwUvBzbD3N8TIOZN5eTsBqNTy9gE6RGv84J9ffMb1zfM4NHaH1fRh+QTIN9rJRiBBkV1EzYq5QrsTrwItyFjzM=@vger.kernel.org
X-Gm-Message-State: AFuF++n3DIT0E3EWzyUcLgOwk+n9qQigbQhm6Gl5qQ53eg+fnYnASpyW
	r/RgH6Ik3ZKb8gl6g4MxAVkqbdmsbDAP4UsYKeF/J4VfnCNlDmHizHKS
X-Gm-Gg: AYBFou2bhHZ+f1SIxCDhKw0Kx5w86GYr85b+PMYZ68CTEKGbPN39+hacYbqgq/yFqhc
	hravJCqMNS9Myipd9Wx657IPUVnZM1b8F+FlhX+FPVj0mA9CIPgcIlt/bcavIiaUVcF3LgU0R0K
	Ev7bP2qsOMGAU4v56F/TcjVF9PfvQL4/oz3HxDEvfXA0dhgBaypW1iU8OLXX12UdsDZxRaAffTb
	R2mZewX1X8GwN6v7/vFIT4XRM9076FlkC4Za1FoGs3UN3Zof1XLxFgsMTYA5N4/DY9lr+EaZ7MJ
	0JNSTzyMJ487u+qE2Ga8QDQvNhmq5PBl+f1jMpahnubSFBqKrSeSUzncip2Frwnk+g2HGpi7FZy
	U5Tyvol8ypeLdQdDkdrT+mfspzEzSPVT+WurHViy/af9r7Y359J7fyHYdzQbYV5CXpsghPfwki/
	XLedjFQSeyGt42fwLTT7d5YVer8sphHpAe8rosdB/PJBUkZ/t1628el4uOcEhuMa8=
X-Received: by 2002:a05:6122:6092:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c7ed83b793mr12351254e0c.7.1788880153383;
        Tue, 08 Sep 2026 08:09:13 -0700 (PDT)
Received: from adriano ([179.57.108.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm9940418e0c.16.2026.09.08.08.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:09:13 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+f312381a95cc080992fd@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] mmc: vub300: fix use-after-free in vub300 teardown
Date: Tue,  8 Sep 2026 12:09:00 -0300
Message-ID: <20260908150901.58915-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmc_host_classdev_release() reads host->parent->of_node, but the
parent is not guaranteed to outlive the host. Instead, store
host->index_is_alias to avoid reading the parent at release time.

Also, call kref_put() after mmc_request_done(), as the latter
dereferences the host pointer.

Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
Reported-by: syzbot+f312381a95cc080992fd@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=f312381a95cc080992fd
Assisted-by: opencode: deepseek v4 flash
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/mmc/core/host.c   | 3 ++-
 drivers/mmc/host/vub300.c | 4 ++--
 include/linux/mmc/host.h  | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index b7ce3137d452..542bb033c6da 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -67,7 +67,7 @@ static void mmc_host_classdev_release(struct device *dev)
 {
 	struct mmc_host *host = cls_dev_to_mmc_host(dev);
 	wakeup_source_unregister(host->ws);
-	if (of_alias_get_id(host->parent->of_node, "mmc") < 0)
+	if (!host->index_is_alias)
 		ida_free(&mmc_host_ida, host->index);
 	kfree(host);
 }
@@ -538,6 +538,7 @@ struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
 	}
 
 	host->index = index;
+	host->index_is_alias = (alias_id >= 0);
 
 	dev_set_name(&host->class_dev, "mmc%d", host->index);
 	host->ws = wakeup_source_register(NULL, dev_name(&host->class_dev));
diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 2dae474dcd06..c87c54aa0e99 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -1794,8 +1794,8 @@ static void vub300_cmndwork_thread(struct work_struct *work)
 			construct_request_response(vub300, cmd);
 			vub300->resp_len = 0;
 			mutex_unlock(&vub300->cmd_mutex);
-			kref_put(&vub300->kref, vub300_delete);
 			mmc_request_done(vub300->mmc, req);
+			kref_put(&vub300->kref, vub300_delete);
 			return;
 		}
 	}
@@ -1946,8 +1946,8 @@ static void vub300_mmc_request(struct mmc_host *mmc, struct mmc_request *req)
 		    satisfy_request_from_offloaded_data(vub300, cmd)) {
 			cmd->error = 0;
 			mutex_unlock(&vub300->cmd_mutex);
-			kref_put(&vub300->kref, vub300_delete);
 			mmc_request_done(mmc, req);
+			kref_put(&vub300->kref, vub300_delete);
 			return;
 		} else {
 			vub300->cmd = cmd;
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index ba84f02c2a10..165d24104d3c 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -356,6 +356,7 @@ struct mmc_host {
 	struct device		*parent;
 	struct device		class_dev;
 	int			index;
+	bool			index_is_alias;
 	const struct mmc_host_ops *ops;
 	struct mmc_pwrseq	*pwrseq;
 	unsigned int		f_min;
-- 
2.51.0

