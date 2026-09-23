Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A453AA1B6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207676; cv=none; b=Ag52Gvig2YdsPfKjRSN8LRpkUIanzZ0iH6UXtMbKdZCXqHGvQ7t6J0XzMnq1C6WdK1Oti0MGl9MxROrRmmkZHEFAeiN7BSdLS6lr/Y1XM5iI2j4FuEcmjXZxzIcqUTDwdEmJaiQDo8o8fMPlY5PFA5nE2TGWVcnSJknO/9+uCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207676; c=relaxed/simple;
	bh=xSwgtNXTlPhev8I96YN0byX+CJhMkcrtEIVhpD2ZkgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCeiHcUDMEcpVueAdW6McBTCtVT+iqJ/lkN3l3BVWBn9zb+ET9mXmaX8noP0bM61q4HSL9cYpYL16Z5QCSYTILQJtVsH6cVLDS7S7lIEv7cmDxBrCWjGDK433V9XSZKBMgV0+JnPMyWx96I0w7ZUWhxIKEUv4Vy6Q9SwFkQ1tms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZI0mWjpD; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZI0mWjpD"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532d63f434fso19222251cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790207673; x=1790812473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YWsyN2G9LWwioqrNVsniXHUK5Ay6GmJ3BIrxT0YNvA=;
        b=ZI0mWjpDhgCfW0rbsUA2IN9TM0hifSzOS5lp7uWf7am5eYjNY0gkFtrWIZ6ouK1/TS
         GF20vpeUf4gMgC+xVwNJg00+7RmgTQkDD522SuhHMqZCZeYZFKfe2/L1GHZ+8QtzhNVK
         F4HeF6K1XigGs90MlMWxcBvW5l15sgCOSpcmN6uKO/UYvonq9pkMgj+dh4T+IayoQeD3
         kNxG9Gc07OyS+n85ggwtNX8IH/85Navn953Ko9YtETES3EDAZG13STkpPA6hdE36aBvV
         s9ZOj6PkEi1tDUHE43tcVH7QyLAQXawPzr/H82KkLP7wPVgtEx/K+bxKtUOXPUgChUU0
         XQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790207673; x=1790812473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YWsyN2G9LWwioqrNVsniXHUK5Ay6GmJ3BIrxT0YNvA=;
        b=Pd1Eaa8eNejtzorznXxcvaD8ZUxyrWWJmSsCNU2HOK9GKKN3ShtWz+iGiK21hNbKV2
         qJ3kXrmVY+mDG7oZOwfTv+rQ95WeHygRLKhvhEEqMisy1qN5TMgc7shqsXL/C0TRD4O+
         0fC8rbbInWB2v+KDsSHtXV8RoKbZ0qs+TesAkolMwnICclzVHpV4PTl9Kdj00PpCIHBp
         27B5TckViGRSHMuukrqHwuvckZchpsLKwlZnsQ9bLVO1+Qrq4ZS9ZFtjAXwl5xcwggPs
         kj4Tt6F0PBzk04vy6xyDUsL7dIWgTZIt64GPKihigoeR5ZnfM93uEv+vPoJlGCto9YUw
         UNYA==
X-Forwarded-Encrypted: i=1; AKwUvByWWzj6ptM8Af7H6oa3zk0jFDYmhOnl2JmuvU/iSb614nWWPgyv6yPcC9OKxigIuUkFGH+L/EcV6Vxwd6w=@vger.kernel.org
X-Gm-Message-State: AFuF++nsYpvmgOBS/YwxbNsQLKMPdDRUWe5sag996/ZuSZbquXcYnPUI
	Dn+459p2c0baI09dcEXkJj2MwJLYP8G8eM1pghDpJ/ovKhJ3Ewbda+1/
X-Gm-Gg: AYBFou3+9BgMmV828ASj2TuQuYMumNE2dcxcC/m8yW6yxMc+9MXwc0j7npN3E5+5h9Y
	+P188SIy28gGOF31E2RorLC/EsZYEM/6bX9GrCECn+8IagY1Hyer2CJODMUQT5NZ2t5DTNoI/qv
	h8cwFz/U3dFyyoTlWgXseDtEs6ndjBdHhcydO9Vbpxx0dnmGZo8b+WF/zrQU8ekKq40JFHpWKZp
	NLSMNGNH/sBiJzBRh1VFTvbvZTFggPnlEEclMOqwuhd6WDQ8jUn2zyEnSly2KJH1RKVyUUrmPYu
	gcJRcuLaDB/N+QTVY8iWywfZB0lr7xVLz12bpTs2qkWaZAkoSp9GnojOCdCjEthYx3RAgAEi8ih
	qWLXry8XKDv5XVoqZrtTrnPvODLTIXtTJzVS0ZcTkOPnB7cLu/55BkfkQx1FzLGeWGHTa0GfHOD
	yp9gic5h6bnCjAs0wwpValdfZeGYKb2EHJPF44EW+QbLeaxjz4TC47qXCsEJ8kf9U2t8IqOoSBk
	AcenmuZh0dRDT7ANrjUrDY=
X-Received: by 2002:a05:622a:1b24:b0:532:ca19:afc1 with SMTP id d75a77b69052e-532fb640a29mr12355801cf.29.1790207673650;
        Wed, 23 Sep 2026 16:54:33 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9142183c40asm281206d6.4.2026.09.23.16.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:54:33 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: mhi: ep: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Wed, 23 Sep 2026 19:54:21 -0400
Message-ID: <20260923235430.703236-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_ep_register_controller() sets IRQ_NOAUTOEN on the doorbell IRQ
descriptor before request_irq(), and the flag is never cleared on the
error paths or in mhi_ep_unregister_controller(), so it stays on the
descriptor after the IRQ is freed.

Pass IRQF_NO_AUTOEN to request_irq() instead. It keeps the IRQ disabled
until mhi_ep_power_up() enables it, without leaving state behind on the
descriptor.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 and arm64 defconfig + CONFIG_MHI_BUS_EP=m, W=1).

 drivers/bus/mhi/ep/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index db7ee6547eef..da498570113a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1534,8 +1534,8 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mhi_cntrl->index = ret;
 
-	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
-	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,
+	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq,
+			  IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			  "doorbell_irq", mhi_cntrl);
 	if (ret) {
 		dev_err(mhi_cntrl->cntrl_dev, "Failed to request Doorbell IRQ\n");

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

