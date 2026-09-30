Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02F23B4EBD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753724; cv=none; b=X6jNriKtoY/aBGTuaGDEQTFDu+U2oTOP0w8BTAw8Vviosx373pzyblYd+WgYS0i/f0/gzm3xiA0p/jtmlD/yHF9h9B6TRAoBvT7/7L/Xw9fIlOrFDOlu8dXBbecOfIZ9pKUnyhlKKNcLKDPnHjxOs29WcLI+4q3o9ENlKz/Xoow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753724; c=relaxed/simple;
	bh=NXk0A4A4DoDrL5qBGNwbsI+/ZkJWEy3iaRXJgC924Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JyZ4oW+BVJBz3dMHOdAWU7lKa85W0Tyw5qPhpTIx0vzqkTHIlyompjNtCZndc0K3sK6rs0Sve9xBfYDxxH8AJCanlZyuh6lBRhlAPsZy03h0RPQAF21/Hzga4ABms0h7fqLoRGsvb7SlPqhJIFmWKazRBjyf49cMAlLx7unT+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNFGfqe3; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNFGfqe3"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d719d99dso4717955ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753719; x=1791358519; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqsoRPI8AKFF01SjdCszAcmoGb5oQopF+TFoxIhW88A=;
        b=iNFGfqe3WwDHE9ZGVUK+Yd5dRvvT/9nVICN8125NThCrU8BolRuD+eKJ12bTXtkMEY
         2xMgWBm6BjpCZRQ/S1KYRmAK6B5V1jYbg79Kx2rdGjhZQlury+eLpg1hppxuLcl3zYf8
         fpE97+qlcEjI/FrH1Yb5pdcgHkdcRMS4Py2de/8g/IlzTZu7cA91Z9mEDf/mm0pGPD/m
         XUPowhmVD/ltInMJAJDQz36dXmOOQK3ntjKOkaXATfJ6eDaMpeHoQDthMmpkezSx1u/C
         bjX056aBpdzWJ0jstqmgoeGTgZddogNPWWlJCWR57xnOgyDbc/3gkmqJxp1/+Icuanue
         xd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753719; x=1791358519;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OqsoRPI8AKFF01SjdCszAcmoGb5oQopF+TFoxIhW88A=;
        b=P5byHWofJBGppinbSZkvXllP7TRf6mTMek6juRVrFK32ovKXMVhFrVjYlnMBLoGCx3
         TgO+1rQ7q+Ubqvi5VVwPuUVrF1QI+WKDH5SKJG2I1CKW/Q/19cAYly2azZicBGNZzIcy
         daH0Gw6ktyE0PPD2NuxgU++ux1enxVTvpp9/qhpNMr/1MVl3OpSdN21uI4U5vgFnQPZm
         OYf8BiXf+4yXUJU7Cuaz7TG0skAA6SrdQzB3ypnRT4mmSqaq+2c1O+d5LQDboN+ete7Q
         GCCGW9Pi7UZBsKcqtZh5U9gie3sEv+Sufz0MrTaFXWJBuGltCADeV4KtLwrLY1V5TPmi
         GSnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUutiL97EzVxpChObh/3B7Ikhubt4vnD8Rv8u71GYhmln4jeCmLP9fvUhoy4DhVzrd+yRxWVGw5c+/NYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+NZfjR5FbK3PnfYIk9sDYsUgdF3631MHFpeI2+LuCDMZT1WWJ
	EEw098iKlT9sAOd18KpHdhI4rQI16d4IU5D4l4DUZSqcwRoc8Yp2LM0r
X-Gm-Gg: AYBFou0JI5dwvbCb4j6b8WzmBGR2wpWj/9XxUnJ4KSJZuLLvcY2kAxsTWUmdzz2B4EB
	4nq3UUaRkZOQ9Whexlm+v575jwrSFxZdY9MPAIB3G5qEXpwPvaiZR4WeOXI+UsGJ23CvuWsXI3O
	fBLmvRPU+8IFks4tyD+xCmqScYfTUKXsrRQlqYoZVkr7t3EULmgngxrKpLX86Ixr9SmP5S7+iT1
	jSi03RSN3kyKeRFU+Ok3RA4KILZbPh5uTW9iCL2VNp87S22CidZgmuubEJBYvTZopeRpPnwR5Eo
	GkRkvdBBLh9wwQaTBB189Z+xgN5UK1tmweVKLPRQE4Tdshz3TXojsX/7FmxdFB6GFm7h1hDZ5PP
	/w2pjPMW9KkNK2vCBIuYTwd6jf/FHMJM2htHqUu33zs9Ws1bk1SXiB7GzkUlSEe5qYLonsxTdIj
	f+ZIjL4/F0JPleugnJx35e9unZuu0Cey7HoOI1N6W10DcvpQYEOooDfL3Uns8XH0LGGrg7GzZGB
	/nz8ouYpc6gTssukb/ZjGw=
X-Received: by 2002:a17:90b:4c4c:b0:3a4:c895:562 with SMTP id 98e67ed59e1d1-3a4d1944ce6mr478582a91.62.1790753719277;
        Wed, 30 Sep 2026 00:35:19 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c7662ed6sm808626a91.3.2026.09.30.00.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:35:18 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
To: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] arm_mpam: return allocation errors as error pointers
Date: Wed, 30 Sep 2026 16:08:58 +0900
Message-ID: <179075213853.3.16001626385793291460.idr-bug-33@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

resctrl_arch_mon_ctx_alloc() stores the result of monitor allocation in
an allocated int. If monitor allocation fails, it still returns that pointer.
Callers check IS_ERR(), so they treat the failed allocation as a valid
monitor context and pass the error value on as a monitor index.

For example, if the wait for a free monitor ends because a signal is
pending, the stored result is still -ENOSPC. Other allocation errors
also reach the same return path.

Free the temporary allocation and return ERR_PTR(err) for negative
results. Leave successful indices and USE_PRE_ALLOCATED unchanged.

Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Link: https://github.com/lcy8047/radix-tree-bug-temp/blob/main/bug_list/idr-ida-xarray/wrong-id-value/IDR-BUG-33-mpam-monitor-id.md
Assisted-by: Sang-Hoon Choi <csh0052@gmail.com>
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Compile-tested on arm64 with allmodconfig and W=1 against mainline
6f8319e3e9a44dd537d17f41565a8453c560a581. No hardware runtime test was
performed.

 drivers/resctrl/mpam_resctrl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..945be7465ad3 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -413,6 +413,13 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 	} while (*ret == -ENOSPC && !signal_pending(current));
 	finish_wait(&resctrl_mon_ctx_waiters, &wait);
 
+	if (*ret < 0) {
+		int err = *ret;
+
+		kfree(ret);
+		return ERR_PTR(err);
+	}
+
 	return ret;
 }
 
-- 
2.43.0
