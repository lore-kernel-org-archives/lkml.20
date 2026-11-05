Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862926;
	b=a0amBALbopDmAwQQJwmU++mNTFo5R+jPiPzYykUFnKCZx+e2Q7XCqmbHZ++YshuxLSF/
	 1hnMHb7YD+Jl8XcJe/mlYMjwX2lyg9g1dh1KS7/ExXGDCFz8Gr74pnd9+dvj60jY7+Pzz
	 NRLs9SpH1L4EUrP/MvRDIgnDd6VRtsYajalH8Gp+MWzBusp5eAp1hrhDQPaHs8k6F1QJP
	 qaoNE2ROb0RXTpp9WI2IPzfoDuIG94ufZ5AA3v4PWAHwvgy5JVJXtgSsj5jmCxUe/8Pji
	 ifaCwZq97FSUIViq1G1vhAduV5FDXD2lMEDpP2BDNx0oVVSU7NgpJDwHuk5ktuGI7YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GHXsA+/24vMWukf4k0zEIYWnEpjWZCZ9P7eSBTXuVYs=;
	b=wqx8FOllv5wM/Ht0bDt+YOFjfaew7IFUzQkvocK1zZuzAGy9/L7b7JO1HhqIpLPUlwbq
	 cyEJd5BdbZLViMiFQr894IPIKz57I09bZ6al5LufxvjK0R8mHPaibw+F8C5OsSKklkJsa
	 k+dWob3zC2Nn9zm0wixPe5Ka1PeT/5D67GwYl/ovREJjpNUeEH2ma2tYTF6AIjP5fCA5c
	 FpM6gDP3KyQkXoG+GS52yjGo/nS798Lu+VAaxkt7ptAHBNBFGsmKyQorqhJwEtAqzvh9W
	 zSKestcCjA4JUg7DKebkiw8gyEdCmGkErSGNLK/yvt4C9fv6yNXFfxxjJoO0l6WVxeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jg6hNPsW;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434F606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8434F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jg6hNPsW
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so3282608c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793862926; x=1794467726; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHXsA+/24vMWukf4k0zEIYWnEpjWZCZ9P7eSBTXuVYs=;
        b=Jg6hNPsWfQtb68lkQTTdn3GPhmyaj2vwepCZvOw0LfGRHGXHlr2bd5thdcqX5ayDek
         9WSZDNQ6TYB3XJVu58SMO/1k6ZcZB/LrHW+s+/LyjqKeXcvWEGtc+Mphlo50SKBcHDyA
         /MFETxN16RuJ6vDSSzfAJ+cCmw+GNWEWxxQr9YY42oGZTVFE1uxB5JHMt+BC53i4LuL+
         ZKQ3EhB9Wd2TS9v4EI57NbnTzVZ4eeQU+/t0IU6S1aU8+g4B/mrQVn7CSkLQysqJcMOY
         rSAhGrnWHFqXQWLPfqK3DiklRqkgXs1/Uc8qjycmQamOqt/8Ddcxh09nHS9pf521P20T
         pGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862926; x=1794467726;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHXsA+/24vMWukf4k0zEIYWnEpjWZCZ9P7eSBTXuVYs=;
        b=lBoRbhNy1eeUzwSEYYNFdmwHF3mCniwEdqnuqSbiR2CpttPqZiKdBOCVI5MloCIsbW
         uRJ6vR4FX+mO4t4t7XGDKr0kVQ2OqdMa3Zpj6g8UrKgaqHpwcNwnm03ZqJWy5zU7DrG9
         kuJgHbdmwaFdL+3YaoAwH3yPwf1J3HsRGSwyqG59unsN0vkaIw09HkBMa/SivptY/I0o
         tZO2Wgv/SQngiz+PsiUq+pLGZumaTpm8C3oU1L4DrXs4PRxMqx0wQA0YHr6k05/XjJoW
         xZlR2DNfDCHS9+O8aBfEkDhe/LVtCh3BaO5M3cN+TmS4Kh/BrfVwRBmGpjNwWIUSuusB
         1ekw==
X-Forwarded-Encrypted: i=1; AKwUvBz2KSjauela2jvL4mmX2c4t3YO//+prY9IXKnIc8o6llAjczHEOpMNXLKY5+PMkgDAIqhbWLw7u0Yy9/J4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QLOQvCIspe5hbeebvPfOXtZUvvlbJJYNUbTSmn3+ae7laKwYF
	utOwjTQ1v5SJiHjrO2hzXdOxTBSApQs9a7jyiT5M3M1CJpRx+bXqn2JGxzwGcz3aa9b2GJ6AtGN
	/NGrKT2wFIIlR7SBVJHZKwg==
X-Received: from dlan7-n2.prod.google.com ([2002:a05:7022:eb47:20b0:1b2:4da6:71c1])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:2522:b0:1a9:c9fe:12c7 with SMTP id a92af1059eb24-1ac5bbb4b85mr35767434c88.9.1793862925107;
 Wed, 04 Nov 2026 23:15:25 -0800 (PST)
Date: Thu,  5 Nov 2026 15:15:18 +0800
In-Reply-To: <20261105071518.1458428-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105071518.1458428-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105071518.1458428-3-stanleyjhu@google.com>
Subject: [PATCH 2/2] scsi: ufs: core: Wake consumer queues on suspended W-LUN recovery
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Brian Norris <briannorris@chromium.org>, 
	Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	John Garry <john.garry@linux.dev>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-scsi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

Since commit eef1d74bf88f ("PM: runtime: Only set runtime_error on
suspend callback failures"), a failed W-LUN runtime resume leaves
ufs_device_wlun in RPM_SUSPENDED with power.runtime_error == 0. When
error recovery resets and restores the host, ufshcd_recover_pm_error()
misses consumer queue recovery and leaves waking I/O stuck:

1. Consumer I/O on a runtime-suspended logical unit blocks in
   __bio_queue_enter() with pm_only set, queues pm_request_resume(), and
   resumes supplier ufs_device_wlun, whose START STOP UNIT fails.
2. Consumer runtime resume aborts with pm_only still set while
   ufshcd_err_handler() resets and restores the host and link, then
   calls ufshcd_recover_pm_error().
3. ufshcd_recover_pm_error() checks only power.runtime_error and skips
   consumer queue recovery, leaving waking I/O blocked in
   __bio_queue_enter() until another request touches the same queue.

Set resume_sdev_queues when ufs_device_wlun is runtime-suspended in
ufshcd_recover_pm_error() so consumer pm_request_resume() resumes
ufs_device_wlun via the runtime PM device link and clears consumer
pm_only through sdev_runtime_resume().

Fixes: eef1d74bf88f ("PM: runtime: Only set runtime_error on suspend callback failures")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
Prerequisite patches (for mainline and stable backports):
- Message-ID: <20261104112744.1630864-1-stanleyjhu@google.com>
  ("block: Keep RPM_ACTIVE in blk_pre_runtime_resume() when already
  active")
- Message-ID: <20261029040002.2100002-1-stanleyjhu@google.com>
  ("scsi: ufs: core: Keep clock-gating hold on failed W-LUN runtime
  resume")

 drivers/ufs/core/ufshcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4f0301d2a5d4..880a14a2c5a4 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6953,7 +6953,9 @@ static void ufshcd_recover_pm_error(struct ufs_hba *hba)
 		resume_sdev_queues = true;
 	}
 
-	if (hba->ufs_device_wlun->sdev_gendev.power.runtime_error) {
+	if (pm_runtime_status_suspended(&hba->ufs_device_wlun->sdev_gendev)) {
+		resume_sdev_queues = true;
+	} else if (hba->ufs_device_wlun->sdev_gendev.power.runtime_error) {
 		/*
 		 * starget, parent of wlun, might be suspended if wlun resume failed.
 		 * Make sure parent is resumed before set child (wlun) active.
-- 
2.56.0.385.gac671c819a-goog

