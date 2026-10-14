Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF0413789
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958197; cv=none; b=CiMElmVp1nxYR27CetpsbiyVo4URMtMqUL/OyxdieqT29S/uc9VrT7ZNuq94JphCQI3yOO/AjNfb8NKmg/tt5R/HowRR5iq9mJ9U79Eg0oaaAxJfbwmqAi/shtJNuDUSmlIk75qsQKB8TZAGsClzI98PfGk98EzkmyH3gl6kLRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958197; c=relaxed/simple;
	bh=u4RrZCjNIirthPArb555ougPmaBfulifNEGsiq7xENk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=McPeOdOJ31aMivu8axe5Czx9GlCsGqiw1kl7c7J3LSWu4rXEx3mTktOeaBoPIku/G1CQl6TM2Je6gLZ76NjXITFYCvsQ+N+EXfyc8nzbSr/qAfEsoVJNJvQ2p8LqjI6SpuQ5de4N/oxXwfWrxaB2sA/H8vVfC/zqmOjzTfsKog8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xU2Vixhp; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xU2Vixhp"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ryp48u62IsKSUpPWkKP6aAC0NxPzxQu7Rcgs4tMsqL0=;
	b=xU2Vixhp/nqyzIsGrQBjNLQJDV497PZQGJ4optFjTuEg4hg7a8U7V4WoijYfBSp75YcA67/t8
	bdrYF70P8Ko9md4svSGoNc9kCNAyI1I35H2WJJWZPs/3ZqjGd2UG9HyfGXbXNT0C56J30OFvsEH
	IllBrzwFPnqhM4wPoZ/rZA4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j4L8j17vQz12LD9;
	Wed, 14 Oct 2026 13:57:57 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 307824056E;
	Wed, 14 Oct 2026 14:09:51 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 14:09:50 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 0/2] ubifs: tnc_delete: Fix two uaf bug when mem failure occurs
Date: Wed, 14 Oct 2026 14:02:50 +0800
Message-ID: <20261014060252.3531356-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)

Fix two TNC traversing uaf problems after failure happens in
tnc_delete().

Zhihao Cheng (2):
  ubifs: tnc_delete: Don't free zero-branch znodes if memory allocation
    fails
  ubifs: tnc_delete: Don't update collapsed znodes if memory allocation
    fails

 fs/ubifs/tnc.c   | 44 +++++++++++++++++++++++++++++++++-----------
 fs/ubifs/ubifs.h |  2 ++
 2 files changed, 35 insertions(+), 11 deletions(-)

-- 
2.52.0

