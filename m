Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854578;
	b=nP7IjyJJg2xtjI4PAB63/trC0FdzIUv4Qiqs13eOsB6qX1dNVeFj/NB6CNne6sPA/KNb
	 36VBx4tepYBjT3ED7/l5YWk9Op9dsakirPezDVoCwou29YRSdVRNbEZ4OlqRWPKXVpqvm
	 7IOSOUAgW6kr1SMKDY9j+tQdjb9xPVnmJCizjFdXlXm8Gxc+7seiA/FKezky6ssgBXqfz
	 eS5aN/q3UHPUAeN0tlNwEIMguiTrCb9UHLAUdsNdW1D64A6GGLEOWvTgEq4u33uRZHO4t
	 QrkGAdjeXxpYsERoqGjt23jpGsyFTI6iZvCKLHMEn9CelCHWnLHEhi3TfZPbwZ0Pk2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/FvJ2N4RGKnQJ3jXcrpsYNt4wnVSvOY4yLdo05CNbJo=;
	b=TV13gBLSw0pLGmo2t1rTaGmFQx9H+J9dcBCx/5wUaXn+wObOKiQmdC33B+KDyTMMOmOl
	 U3OcUqFnlNR4DeAALrB0OuMSTDKnHq4hF8urytc6twssdJtLKLWyZQG9UYqDcB+K1bJPS
	 7y1SZcL3rnJRiQfMEWHUIjzgAWRslPJHTOjK8lnOh0rZoGJtUA+cE1y2iwkbyNsQqduVW
	 boIASsl5PQJsEsFd2BMjGvrGmbAXETN8xOakVlXVp/NtJp0evDh+k8kDMP83xNc+0qmEF
	 KrKRtpBsVndPjHr5AMwFvaf9G7/lJuyW0y+En9mN7kBuhE+l0EBPiojsRTz9L/0AhnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+eTEHl8;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF049606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF049606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+eTEHl8
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso879278a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854577; x=1794459377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/FvJ2N4RGKnQJ3jXcrpsYNt4wnVSvOY4yLdo05CNbJo=;
        b=S+eTEHl8fAt05fzkYtHIqUnNrJYgWvbg2+slq5ZBQ1+kV8MBO8+o6roHSk9vX3S7ep
         A5bcQacUgNRsA9y/As5uKYio0inPkUKXpY+Kp8ey6D6TMeixWVhXkNlI5d7ArTwLGddf
         kZeNrtdeQnhtDvkoKEur/45/S9odaU6rO+RQqygctn7KVt2+MoqbGS+KPxqpXUyt5mFg
         46THEQa5Di/GVxmCkYt72cZVDAqYtfxULAIsMeXzn2CQyYXpHYsC1s7KGekM6usjIPvp
         CLy2EUOIWPf0eioIKoi7if5WDzfP5YH81FXQTPeXdwQb2R14YoYzh7CnBuI5rwyaPT2j
         OkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854577; x=1794459377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FvJ2N4RGKnQJ3jXcrpsYNt4wnVSvOY4yLdo05CNbJo=;
        b=GtGyDgQspnX7OCoYU4QOfp7v0cXhWBVfNqKnI1zI3ABcupNKF4tijVqPni+pZ0WQbh
         4E2cWJ46AB5vUGMxDKh75IIFtJAovrOTd6rlDlrCqu0GY93o2GOVGRiJc1HMNKutVtiY
         tz+YGRc8NkLcjnHvT8aMewTV4JYWJD20zfnCf7d3JMv+PV/eVh75gf2N1XWNM8l3M8XT
         tYjvS7VZxVTwGLtRQdblw+PrwreEnxfDB/NunSUDewMQCdJ3lQDKoP5gqnfgHV5gtOsB
         iuPKVy3wUVuY1EAEXkHnXmTlzV8dnUSX2xZHaSo1BqGf1wbwj4OwX8LZZK3IgUbJOwE5
         W+bw==
X-Forwarded-Encrypted: i=1; AKwUvBw+WrQf5uM13P0yEri3en2INjmaBrqnKosBNjLANPklRSnXDsRwI7w/LfzjPoyhJfw3HgxheO/dwLFZXiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sbe+tGQjVUs0SM1Qe4lAA24JV53jJpLxMY9EqNLHrHjJDq0EJ
	zylio2mn5zd2iTblwnuFpmMErXEBbYFdpcansp0v5keJdr8CJzOnX098
X-Gm-Gg: AYBFou3A1htKahV7X34+wEP2ZNuMJW754dmP1j1fFW8x2WrC+aAvatzQVDf1cY/7w6m
	7AOnnP+hVFLPH6DEM1dy9P9Hze6KAqOqiv+iwRWFUrmkS1hnxBaE9SLXGimp3rEcXziXdmSUigG
	8Ns4a4XmXA1rIYKzp7Gxf4xs0m7DzY4wMB6M/tc+7SA0bzVvkmXsk28QOpraNy7rWDKwI8eW6+A
	/ZM26Y06pSa5Ht34e29cSZzYtk9BAg9vWNestRcowb1sTVyaci0PlQsl90J1wD4rihLLmPSzGLg
	D89HPTv1UcVheevCp4aNNV61p6feAnv/PbqG8TXgQV1i852K9mMIOQu+5EWI5RpKzF9DLyT3vS/
	QqMvMWH9AsL7gRWtO6FYVcOCPGam3MxuanZoFQLdoxmjKx42VGNJ5EHXP3YoOecyb3Atfxv+k8q
	EZCAY4xDutCEg57768Z4osBOe0o9t9d/atxzQf0NS+2eIog8Kp/rKQkO7lJXX0kqyO89OlnKb/n
	MKOUEbF6W64BtHl5UhBo/zChYGA37zt0CNEL3ckFl0V4WR2Gun9zwfDEZqXGjeCAF7PTD8AQmPK
	SWdIIijcnHkvNR8ZgUOmp5UV/CimhfPen18VMSNBnx6dFYvd
X-Received: by 2002:a17:90b:5147:b0:3ac:b3e5:428f with SMTP id 98e67ed59e1d1-3ae897ce445mr16219107a91.53.1793854577220;
        Wed, 04 Nov 2026 20:56:17 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd47sm1783704a91.6.2026.11.04.20.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:56:16 -0800 (PST)
From: HyunjungKo <hj351016@gmail.com>
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org,
	HyunjungKo <hj351016@gmail.com>
Subject: [PATCH] wifi: ipw2200: cancel qos_activate work on device removal
Date: Thu,  5 Nov 2026 13:55:49 +0900
Message-ID: <20261105045549.1287413-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipw_priv::qos_activate (handler ipw_bg_qos_activate) is scheduled on the
system workqueue from the QoS association/probe-response paths
(ipw_qos_association_resp(), ipw_handle_assoc_response()) via
schedule_work(&priv->qos_activate).

ipw_pci_remove() cancels ~two dozen other priv works with
cancel_work_sync()/cancel_delayed_work_sync() (associate, disassociate,
scan, rf_kill, roam, link_up/down, led_*, merge_networks, ...) but never
cancels qos_activate. The driver has no private workqueue, so the work
runs on the system workqueue and is not drained by any destroy_workqueue()
at teardown either.

If a qos_activate work is still pending when the device is removed,
ipw_pci_remove() goes on to free_irq(), free the libipw/netdev and
kfree(priv); the worker then dereferences the freed priv
(ipw_bg_qos_activate(): priv->mutex, priv->status, priv->assoc_network ->
ipw_qos_activate()) = use-after-free.

Cancel qos_activate alongside the other works in ipw_pci_remove(). The
handler takes priv->mutex and does not reschedule qos_activate, and this
cancel is not performed under priv->mutex, so cancel_work_sync() neither
deadlocks nor races a re-arm.

Found by code review; not reproduced. Trigger needs a QoS
association/probe-response frame racing device unbind. Same class as
commit (atm: fore200e) "fix use-after-free in tasklets during device
removal" and CVE-2024-27052 (wifi: rtl8xxxu): a teardown path that omits
cancelling an async callback racing the object free.

Signed-off-by: HyunjungKo <hj351016@gmail.com>
---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -11786,5 +11786,6 @@ static void ipw_pci_remove(struct pci_dev *pdev)
 	cancel_delayed_work_sync(&priv->led_link_off);
 	cancel_delayed_work_sync(&priv->led_act_off);
 	cancel_work_sync(&priv->merge_networks);
+	cancel_work_sync(&priv->qos_activate);

 	/* Free MAC hash list for ADHOC */
--
2.43.0
