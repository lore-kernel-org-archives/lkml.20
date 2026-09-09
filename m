Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894E83E40F8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951547; cv=none; b=X9SNRD586LEYHUi5PXNsx9MwNPUG4KPFLlg2B977Y7RSo4+KnUGEG6WLj3WkOExVeAYPIi129fGtgbGfxrp5eT4bzPuwgkq1/BWgVGMLaZzAEDfWtfi4IM0pi+84PvKLNuUYHG3+Ff695HIls+1KEtsKB77kdCshF9c34up0T6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951547; c=relaxed/simple;
	bh=4Vy7iCU1CgqFSSdv1w1DyOsEsjJTdKZdwzEZqZ/Sd9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=agETnK3ry3WoGwBAw1EOdLxTW5edSf6aLsFiurO4n24e4E7bagptx18yWaIowgs+2Knz8FXmby4xztVGQt6JWNijcxXXFbwdvJtIpWr3cfjk3AgoEMwzwtcC1kKeocEbnCr2WiOFe603OGT0cj92mwUFtIWE/rOoSPtg6Q9mD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q07HEbkR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q07HEbkR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so701015ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788951543; x=1789556343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5NEHCHglzkgR6my1ufRSHRRxBZJOd3es2NtylTtqCw=;
        b=Q07HEbkRr2O1iblXqHRLuGt11dsz83/dDkZJqgi0UXap4pgsclwIR5ABzjLq+9Uuok
         4jTBNKKs7EOXjAeGbEf+Z8ZHx54qpzM/gq7gzWhSV2JyFEA7+rWxH9KJCW2pSDIr9Jgg
         XYz/xaR9PLJwjbOEceDss3JwzogI9Diggirs85bjKBT1sb/2LbWePJyycZXkPk/B21tE
         WFx/7Na0mAZ7Cfp5ptefG97iSsG9PkLfQqTw9q0qxk4afKK6Z9odIRo1nWMA/XfXxWZR
         7unSSKwTKDK4KnfsaHJmmemJl+LNaC3D6MihH2fgK86dyyykFgPHRuz7FDX8sqD368sL
         bjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951543; x=1789556343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5NEHCHglzkgR6my1ufRSHRRxBZJOd3es2NtylTtqCw=;
        b=CNkuprbVwVm96EJEJ0PR9EEYEDx4CuX7JvY5L6PsrQDZilTDZOA9DBc6iQ6Be5h+kC
         IERI1gVApaDMHOPq4YJTuLGYEjr4wo+zt4GYB8gNgDkGo0aReCsGCz48VFg6JbX2Wgr1
         R9aXhjAoyzLMHOXLFz1fnIULSEKNed90lME79wC4/sds/Us5fZA9gRBN2PjhLwJ1FEkP
         PUDutkUlcP5U/GbGm8TkacQiINQr5+Q4ol7Df8QTf7MGoem+UYPQx0nA/no7jw4Pvqi5
         yhACNk79JMuwvXgMoSsW0TE2uoXfK58sHF32mxYcoIv5ImeRV/Z21eUo2hBnQvA5Re/Y
         sOcw==
X-Forwarded-Encrypted: i=1; AKwUvBwF6WrAZAPqn9rsK+HXXy760PFMT47NZQEjVlWDICTtLkMAvkF4JVCW0wHY48BPSKWQ1ZE8GGQ8GWxaZLM=@vger.kernel.org
X-Gm-Message-State: AFuF++makb9lqCLLP5KQ6UvPNMGj0qAaWD2zyIA6zCZxDVcN+HoHnyNi
	wBz4QVfaZlOWFxqRP5/aURdAF3emi3GZGmfOjRa8KCT0SPXxjKhe32yf
X-Gm-Gg: AYBFou1Ghl3Vp+C5c5uF1wA5BxDWUsTqQKOgCb9Th1QDDnoug3+RPcDrkYha+UR17lx
	kVTjRie2bsuq0YFJ685H5p3DiRa+NTu44hVnD7UjU+Usx2Jwua//4UdZ0xG+4GJ+PEWJ4/ezkbZ
	vAT+Om9qcBSGaLSiNCd77OoDIhA0uGKIMVgPjDvSGVrfJgwAQtS9rlk5iU3lqtpAutpYWcJHJDS
	2SKquK0T5ZG87d7O2h6djkJ27HW41zpRY2MyOR/4q7fq+4LwE7fgqk6lNY2HPIP20tun9Nwcj5J
	zn8K7X4/ySMCD85f2+hFunPubblyOMZ7c//ucOf6dpS7asUTeHVq+2BtleKQ1rD5LMXmdqZ7Mne
	pHF5UNOP+12olzB3Qx+TjX4y+b2wU0oRlkdBGDcgNS3U55sU2S9AJ9qym2SLSa0sePOYPMBuXfz
	tjCvZvaurq23pU3TcfqaDCdFJkxd4GMgdYbm5C5LV+wDCqyUs49g6xlKyA/kNMCp9QKUcho1eHU
	Q==
X-Received: by 2002:a17:903:174e:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2dd07cae8afmr7110755ad.20.1788951543301;
        Wed, 09 Sep 2026 03:59:03 -0700 (PDT)
Received: from adriano.lan ([2803:9810:3d22:1608:e46d:9e65:1b2a:35eb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm68395973eec.16.2026.09.09.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:59:02 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] mmc: vub300: fix use-after-free in vub300 teardown
Date: Wed,  9 Sep 2026 07:58:55 -0300
Message-ID: <20260909105856.129733-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The request-completion paths call the final kref_put() before
mmc_request_done(). Dropping the last reference can free the host via
vub300_delete() -> mmc_free_host(), and mmc_request_done() then reads
the freed host.

Call mmc_request_done() before the final kref_put() so the host is
still valid.

Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
Assisted-by: opencode: deepseek v4 flash
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
Changes since v1:
  - Added Assisted-by tag
Changes since v2:
  - Split patch into two logical patches
  - Corrected the Fixes: tag

 drivers/mmc/host/vub300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.51.0

