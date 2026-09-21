Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64BC3B42CC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977100; cv=none; b=tKT5O+QPYmBpCo5OulNldmIfdL0ftCzuNQx9VW48kqIUcnwAoatnjZUWSkV3T6LFpudNULRjs+WvZCXb6fl5QEAYustb6DFOG853vqRu62RRoHV/Eele5mz83J6iyoGVQlvgMovUajn2kVMxYwssOdz06akVskAjwhXNt5YpL74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977100; c=relaxed/simple;
	bh=zmSW8MeeCiUJXRx7DYO3Mc8UdpxyYdidkc5y/zSLeHk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e0IJydmEaojkmMSy6IszX9nH55vuJ3O8yJ+qLVRuPCItnFOrmm6OMgzKSSNdjwOBCVO/fEuPcvRvkymcdjAbo77eifCMk6HMue0H6SeikwNuR/N9ied9fj7fJ2uxsTwVSl4Tp4UHMSVid+fS5UsUUr+oUOoxi9nOOzEQNRkGF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2SC+D+H5; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2SC+D+H5"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0hTFfzvopA4qzraAldDoaQfK85SV+y5NrYAhfhIxIDw=;
	b=2SC+D+H5kdLsIDgS/cp790uMvV3AW5bev/sjkfVNQr5pubGCmXMLa5bsbGARZRF6V42CBDd5f
	X0jOPRPmHOxyB9hnJDaRHtbEU45OBpeuv7kwCt99mB5ZpKWJIxff5FuNqRhlU+wEn+jyR9540uu
	cve8L8mewLRwOEGhR0SQwAY=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hpFWf19TTz1K9D1;
	Mon, 21 Sep 2026 15:40:30 +0800 (CST)
Received: from kwepemf200011.china.huawei.com (unknown [7.202.181.237])
	by mail.maildlp.com (Postfix) with ESMTPS id 1274C4048B;
	Mon, 21 Sep 2026 15:51:32 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200011.china.huawei.com (7.202.181.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 15:51:31 +0800
From: Weili Qian <qianweili@huawei.com>
To: <gregkh@linuxfoundation.org>, <--to=herbert@gondor.apana.org.au>,
	<--to=zhangfei.gao@linaro.org>, <--to=wangzhou1@hisilicon.com>,
	<--cc=linux-crypto@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <--cc=huangchenghai2@huawei.com>,
	<--cc=liulongfang@huawei.com>
Subject: [PATCH 0/2] uacce: add device usage sysfs interface
Date: Mon, 21 Sep 2026 15:51:29 +0800
Message-ID: <20260921075131.1062155-1-qianweili@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200011.china.huawei.com (7.202.181.237)

Add a read-only dev_usage sysfs attribute so userspace can query device
usage through sysfs. Patch 1 adds the attribute and the get_dev_usage
callback to the UACCE framework; patch 2 implements the callback in the
HiSilicon QM driver.

Weili Qian (2):
  uacce: add device usage sysfs interface
  crypto: hisilicon/qm - implement uacce get_dev_usage callback

 Documentation/ABI/testing/sysfs-driver-uacce |  9 ++++
 drivers/crypto/hisilicon/debugfs.c           | 17 -------
 drivers/crypto/hisilicon/qm.c                | 52 ++++++++++++++++++++
 drivers/crypto/hisilicon/qm_common.h         |  1 +
 drivers/misc/uacce/uacce.c                   | 19 +++++++
 include/linux/uacce.h                        |  5 ++
 6 files changed, 86 insertions(+), 17 deletions(-)

-- 
2.43.0

