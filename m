Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A534534B7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548397; cv=none; b=iAanfweGBgGuC86YAkfZQYwimf6npaADgWA5EzsRxkwnYUDaOvk74qlCELNYwo+XoMpAD78P04E7DMcFtkXa2BnEl3xCUIdsra2jYd2X8MMq8ldcp9yqWwyt+1uXz2NV+YR7/uK6qi3jcSgwp8EZS/EuIVUBx9yjRMOLMdctFWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548397; c=relaxed/simple;
	bh=U6UDYylr1lAUmNQCZv3Fy/vLImZdcqW9czVi+yxOz6A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ErcmPQGzizIY0Man5k2G4x4KXtS8Vt2/U5p7e9oBuSxCPKX0bExogztb39JLbLMAwuNGjBc4w7Wd7Qq6FNFTlQ6z73tuSFSpfes5Pj7WC6ybj/tA30cpeYtefpsbBzMJ4Aquv8c30oGcY1sGnpitYhJuI0/s2I4sOCLr5+PCqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=oXmJtyXl; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="oXmJtyXl"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U6UDYylr1lAUmNQCZv3Fy/vLImZdcqW9czVi+yxOz6A=;
	b=oXmJtyXl4eovOihHVNzp8fivYbIZxdYbVT/qdcIBHhW/jU7KqV5BszdzAkBOP7knUesTIe8HW
	B8mG1LWfrjGmzg3+OpGw4Zo9IHAbog6V5ZPJzIhxV2aWEfXOEkj8/BuTf80rdwSn4aDumniWB1N
	pDDEPEyJZf1p8FVabwwCTf4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hlByb5j4cz1T4g8;
	Wed, 16 Sep 2026 16:34:47 +0800 (CST)
Received: from dggpemr200001.china.huawei.com (unknown [7.185.36.96])
	by mail.maildlp.com (Postfix) with ESMTPS id 3559040537;
	Wed, 16 Sep 2026 16:46:29 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr200001.china.huawei.com
 (7.185.36.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 16 Sep
 2026 16:46:28 +0800
From: Ran Hongyun <ranhongyun1@huawei.com>
To: <brauner@kernel.org>
CC: <chengzhihao1@huawei.com>, <linux-kernel@vger.kernel.org>,
	<phillip@squashfs.org.uk>, <ranhongyun1@huawei.com>, <yangerkun@huawei.com>,
	<yi.zhang@huawei.com>
Subject: Re: [PATCH v2] squashfs: Add dictionary size range check to prevent shift-out-of-bounds
Date: Wed, 16 Sep 2026 16:38:47 +0800
Message-ID: <20260916083847.619125-1-ranhongyun1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260916-vollwertig-gesell-werken-8b452a7a99c9@brauner>
References: <20260916-vollwertig-gesell-werken-8b452a7a99c9@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr200001.china.huawei.com (7.185.36.96)

Thanks for the update!
