Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503802;
	b=DzqCdwOv9ciU98vefoYKO+XT1wOcKOXVZfxGBtIhI+oJdenBAev7NpJJ3Zhk4+ZQxKF3
	 I9oZzPPkxTXqKaVIyP793WmGU7RZG+J5l/ytnIp17fY31Z9m6Y4QRgub0qjoLoHpE3C8a
	 QVxuJmGYILCAeucfAYXiV82bzldK/eBuKYG5NzcL5YKKsiRRpA+CU9wBOKsQ1FhFvXZlT
	 2bci/f0QATsa7WkDLxLubJ4WPd3+qJ5FIWi4wnV7LYYsoBg0rGANM12KF1DV2FsAjAw8s
	 mLOsfa3Yv6LwCfVkCIABAGACuEf0TkFxFkHX7jNWXO++In7dembiWHzFGrUUESyeYJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503802;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=44TqSoX+q8h8ddGSZSblkTlgZtgYqXfX3/G/CaPVp2k=;
	b=2PR5vL4iZrVV1igEL1e3gu5sLdvWDc5zrSqY4TqI4Kls7cAUDb4i0LW37OVhXpMLm4CB
	 tmcBXGqqFZhltT/0YbTsEJnzqH8M7WJQ1oUDyCmzTOvL1ygb9TjVB7ZjTs3nG2vpuGKph
	 ItAQ0M9WUXY9KN+92xAl8fu4xu21nrUs/++qH1WepFph+MnMlVqCGWmoPn2a/m17kylRV
	 8/rlQE2V/FrhmwfXmnjoiVYB5XoR41f21g+nmmSVLadK8NpPglAxbSNrVTKma8HhEEznx
	 Ro5+q6Tf0lPQfIStoXvHXo+Vwn+Yv0k0gJLBN+RPScLm8CoxD7g97540KUj0qB03Blg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5GpIE+vG;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1560A2600
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A1560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5GpIE+vG
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=44TqSoX+q8h8ddGSZSblkTlgZtgYqXfX3/G/CaPVp2k=;
	b=5GpIE+vGSoZ4QU2mFc1xWXhk2yNyibmYDaFqqfZISjBsn6artUEufbwHM+28vvv//kFfoOz/j
	/L1av4SEYqkE3q4H912bmdUFpduuV3g12N4hzKj0XWi6Woi4GdieknpnWOHsztfat1d1HQzR6zB
	WOqbAh6CjD1713xM9Tz6xcs=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBf4bgHz1T4GB;
	Tue, 20 Oct 2026 21:43:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6FA5540575;
	Tue, 20 Oct 2026 21:43:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 05/15] arm_mpam: Don't stall MPAM enable when an MSC fails to probe
Date: Tue, 20 Oct 2026 21:42:29 +0800
Message-ID: <20261020134239.3921377-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

mpam_msc_drv_probe() registers the discovery cpuhp callbacks only when
the number of successfully probed MSCs reaches fw_num_msc. Every failure
path returns before the counter is incremented, and a failed probe is
final - the driver core does not retry. One failing MSC therefore leaves
the counter below fw_num_msc forever: the discovery callbacks are never
registered, mpam_enable() is never scheduled, and MPAM stays dead
system-wide - the resctrl filesystem is never registered, and no error
message hints at the cause.

An MSC can legitimately fail to probe on an otherwise working system:
firmware may describe MSCs that are not accessible from any possible
CPU, e.g. when the possible CPUs are restricted with nr_cpus=. The MSCs
of the clipped CPUs then fail with "MSC is not accessible from any
CPU!", or their cache resources become unresolvable from PPTT.

Count every completed probe, successful or not. Failed MSCs are not on
mpam_all_msc (either never added, or removed by mpam_msc_drv_remove()),
so the discovery path skips them naturally, and MPAM is enabled for the
surviving devices.

Cc: stable@vger.kernel.org
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Fixes: f04046f2577a5 ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 61cbc75625fa..a44d66a5733d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2120,21 +2120,31 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 	msc = do_mpam_msc_drv_probe(pdev);
 	mutex_unlock(&mpam_list_lock);
 
-	if (IS_ERR(msc))
-		return PTR_ERR(msc);
+	if (IS_ERR(msc)) {
+		err = PTR_ERR(msc);
+		goto out;
+	}
 
 	/* Create RIS entries described by firmware */
 	err = acpi_mpam_parse_resources(msc, plat_data);
-	if (err) {
+	if (err)
 		mpam_msc_drv_remove(pdev);
-		return err;
-	}
-
-	if (atomic_add_return(1, &mpam_num_msc) == fw_num_msc)
+out:
+	/*
+	 * A failed MSC must not prevent MPAM being enabled for the
+	 * surviving devices. Firmware may describe MSCs that are not
+	 * accessible from any possible CPU, e.g. when the possible CPUs
+	 * were restricted by nr_cpus=. The failed device is not
+	 * re-probed, so count it here too: otherwise the counter never
+	 * reaches fw_num_msc, the discovery cpuhp callbacks are never
+	 * registered and mpam_enable() is never scheduled - MPAM stays
+	 * dead system-wide, without any error message.
+	 */
+	if (atomic_inc_return(&mpam_num_msc) == fw_num_msc)
 		mpam_register_cpuhp_callbacks(mpam_discovery_cpu_online, NULL,
 					      "mpam:drv_probe");
 
-	return 0;
+	return err;
 }
 
 static struct platform_driver mpam_msc_driver = {
-- 
2.34.1

