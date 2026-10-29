Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263184;
	b=xlr3njxc8qmtcsPzcgWq3f55b8PmTAglvQXrFrSDbgDggDXOxPw44wL+tNgjkypyklr1
	 Na/YVpXunUYiaozwJnMaO1yu1E7+2dKmt2SEJi8i14AmSnYfWyZ9PB+h7eZPi6iXz3bM4
	 YyVZpHN2oPWevrWvQHcvy6JyGwjkGfrngxMBnoPFqHOwu6KmR2PwfBOOo+dQzvynu0JqT
	 nQztzMGFK/v7XHTMr++y99enQqVFCgvHC1IWTwhws0xzJ0H0z/eqFuQo9R6TeqsElrlP4
	 kC8ZawK9JguFixwEna6mjN22AF07v2/VIUiTWZW7xCNUMRgPa1q4vzytiMPWZ1/t5DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263184;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=boRhbr+FM0tKBVcgDQpQ3P+TqBiVA+fRPepHBkPCF+8=;
	b=k6PtLBDMgnmioAynhRgXj6KZJBBGaOoXcQxTg6cLk45RbCqIgX8E5c4kehaQzCFVW792
	 ydlppcSdHk0jgoXWJmT7P7AAxT3wFAIyKQrvDa6AwEPb4hk14HroemUTZtv00pib/jWTf
	 OMyZTBtsrq7mlQl10Hite75RzrgTHBA9mMoZlc3rbzuepZJpIFM33mxYd2pxm744LdLe2
	 2tZpfQwo4/E9r2l+kX9YRVv8yWtpzPwevOhPXvSO3QpnwJZLk5OvIANMPDop74WOYjOjJ
	 fbMhxho6Fi34IhSsIES81lFMYq62ytMAAgoDU3dscFZEjKb/tSMOpzovGniexMo2cfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=d97OYoSx;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEE1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=d97OYoSx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793263163;
	bh=boRhbr+FM0tKBVcgDQpQ3P+TqBiVA+fRPepHBkPCF+8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=d97OYoSxP9+JXjYBqbADemTtea8hbs1IO0FCIgsmCDKrTAGe5LgOPFs7tzSpCg+xG
	 qqiK4hoQ2yufHnVdqhe1RLMrdU5ItmsuboGnfVJnU7cbZDsyOz9GzeJRem16q4U5kC
	 6IIwY0tNdJxJ1o+llnxc9dhrTl2dps1fnpr4/tWA=
X-QQ-mid: zesmtpgz8t1793263159t33143ec8
X-QQ-Originating-IP: m1XVQ5RI6q/S3Bf3iwqFd6FKZ8h9v92/ZduyIH/iRPY=
Received: from LT-LIANGBAIHUI.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 16:39:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17958232766869935615
EX-QQ-RecipientCnt: 15
From: Baihui Liang <liangbaihui@linux.spacemit.com>
Date: Thu, 29 Oct 2026 16:38:48 +0800
Subject: [PATCH] drm/imagination: retry runtime idle when firmware is not
 yet idle
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-img-pm-autosuspend-v1-1-26851840a34e@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIABcG42oC/yXMQQqDMBBA0avIrDtgYjHVqxQXakadgjFkjAji3
 Rt1+Rb/HyAUmATq7IBAGwsvLkG9Muin1o2EbJNB57pUua6Q5xH9jG1cF4niyVk0xmj7Kd6qHAy
 k0AcaeL+n3+axxO5H/Xqd4Dz/ZG7Y6HYAAAA=
X-Change-ID: 20261029-img-pm-autosuspend-7772d83416f7
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Baihui Liang <liangbaihui@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793263157; l=1595;
 i=liangbaihui@linux.spacemit.com; s=20261015; h=from:subject:message-id;
 bh=zcUD8QgC3EZy/zoKLS2pFNdag8Gz1I+LICYi+Le1+OE=;
 b=BGFNDhIg6gYlpPJnNL7ooDA1mNIquk2dbIWADun6A9/CLBlkcvx7AGym1elhzughIf07XBNLl
 a5MYEDW0pHRCgphZ4r2moevt2DG8eGpwFmP7nHX/AqDlc/SGrjvy6LZ
X-Developer-Key: i=liangbaihui@linux.spacemit.com; a=ed25519;
 pk=L9Pa1YBHFuJrRPNu/FfSW/likBvv9j2dUrR3r+YyJ5M=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OT1af/FwY+++Lg5QsZOndr+tm10K2D8Tvj0Aa6D1TbYCRZFkK3mP64RA
	BTG+ZIe7qoXGru2sM62yN3yY8s3uWYhbWMqOOZLhQhLzf/FkoLKaQbkCY9UEEKvnfs0tcj5
	m/XnTLyLpRnSU1w6j6gCQQn09rhAXPhn4gSH7doB6gxDl7nXh6djEAh+nWjwVgpgIe9uNAT
	Y6AOx3ynGadlJzQBnuaGKOS0E+w0TCl6yqVBYHYqSb8PxJyPCb4G/b+l0++BYnlWk0+59n0
	EvNNylg+4O+O8hcTZnohVBKIUkQAD28QQ5lJh4QFWOKm7JR+mE/zqHQp4YiBy58rRfFN/vT
	aXqu+oTmIO67diOHJ/fBxOpgdjuNN1XtDX5EM+nPjuLZN5cGjUhx1JjMXC6Dq+klXSUYUNy
	bdKuRcaRUqYr64NMGFprj4PaXHk4CdOxgqUhl4J2KPBCDzuw3FFV/SsRpUSKrrh45NbCfkA
	XPluiHzFgcL8WyuTMCxqBYuZhlh3eG5Trgk6m+/Jy0MnQFvTQMlY9IISIhFJ4FfE3VKD2ny
	qWmuP415gzdMEwCaxGsEUfW1RNZI6PebLJy2FgBZkh4oaGB1sR8ucIaNoZMU+r+IvHhF9PS
	WyRdTSpjVYBQ+NBafjQOxcHlscOwjlSflL7fZo6/kLj49Z8OJcyyJLaAQTj02qxRSS6xQSa
	qoqOqmDRa/GdQpr4bjE1SHSniQrvdMRjZZSZG9NFd9EdRP6AWblDPx2/sK+jabVVfSsMMDk
	JFgcq2KNROS5VoJ7Mtlt9Pbdyx/79+MfMQ4txwYM//oZAiyPr4heNW2D9ovUdYekjcZkBxn
	XYvJppsjjCWd5Y96Fn0N0bsCwRoECZkN5XSzLx+JqddFuabOpMwyp+Qk0VR9B18o+X8L3i+
	tWNhEWadUfhPHoxw0IaKHgpHfnq3K9bdo8KCmK7wqPbyWOVWm5FY0sB0/CT9su4Yg7oXZne
	yZoMb/cMKrU5Q+3v/btzPo6ELS/OaXWfx5C8K7/bl0txKZrOE0L8o9WS8/tLh/eK4m1tsw1
	nGd037Uo6XBiiVe0TDGlCULMMiJwJnQrJKA69rL0zo/D6/ybftaT6LgRntXas=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Returning -EBUSY from ->runtime_idle() prevents the PM core from
retrying the idle check. Schedule an autosuspend so the idle state
can be re-evaluated once the firmware reaches ROGUE_FWIF_POW_IDLE.

Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
---
Tested on SpacemiT K3 (PowerVR Rogue BXM-4-64) by running vulkaninfo
repeatedly. Without this change the device intermittently stayed
runtime-active after the last user went away, because the firmware had
not yet reached ROGUE_FWIF_POW_IDLE when the idle check ran. With the
change the device reliably suspends.
---
 drivers/gpu/drm/imagination/pvr_power.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index eb4b6ecdf4f..6f38249ffcb 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -434,7 +434,16 @@ pvr_power_device_idle(struct device *dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
-	return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
+	if (pvr_power_is_idle(pvr_dev))
+		return 0;
+
+	/*
+	 * Firmware not yet idle; reject but schedule autosuspend so
+	 * runtime_idle() can be retried.
+	 */
+	pm_runtime_autosuspend(dev);
+
+	return -EBUSY;
 }
 
 static int

---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261029-img-pm-autosuspend-7772d83416f7

Best regards,
--  
Baihui Liang <liangbaihui@linux.spacemit.com>

