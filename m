Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384816;
	b=Jb8q/jv6Ans7RtvLclzTSlj1i/Mw0Zq8piOyHhO7DuooIGRJZTDPFLN1uUGd1J98k9sY
	 Fgqra00P5XfY3rx15Cd2GG5UnWwJ8/12bS9C6H0JUU1AlWVr+C4aeR0CoNePuhBH1dg4e
	 hD/2YbVP1c8eGZr7RUARQH23wZGDbQstI9t6/OhgnarjkL8nCpjtoBa2gJIvRF8bBuFRb
	 jdLWKyEmBRxMAdmFDGdNjVBJBUqvmGOf/DNhY5cjDSNEuDk45tzaNPG+K2QiwCdxpJto+
	 sj7baAgIjG1EOwZ14hhMyvK66meUX3DGHb3rvn9zKXm0tqcX8faFhzImqIMgHYPfuHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384816;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=jAM+mhS6wH5+znM4cfUPLESvcCvLvb75hxMYxu2K7wQ=;
	b=sqIf0G/MRnaD57PWQQrlJtD780psgbfx/Kp7Lz6SjbyXy9Blb+/G+7Sz2544jd/Y1CBq
	 Cj7wvY/RxSnhwopnncL/wV+haMp9P/hfSdAdyyXk0mpp5Ch+Qcgdg02PcMw1fOuj5I7dR
	 k7MX6Z5mVMyj8lQYkx8pNat1yLFyHPNrAMHsErWqyH6vrw9pSzgIRr2x7PT1nZGpfs6BS
	 jq0zxAVzFaH27cwJxxryFkhH2aVr/EHPMEZTVnSmQgT03QFk9GM7tU6l35emZ2dkuqn2u
	 vg2VNNvyjIbWRlJtGSrkoc6dd0hl0p7BXfDu6M0/rGGyY/CyFVue7l1a36zUqyRheAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rOqEi8Sb;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B960A383E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7B960A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rOqEi8Sb
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jAM+mhS6wH5+znM4cfUPLESvcCvLvb75hxMYxu2K7wQ=;
	b=rOqEi8SbwNgXAV7VA/R7FKhFNIL2rkCpVdDd22Rl/OKaRLSBEOIWnQ5apCziFUwmCKHbvfQDv
	RONgy4Vz3iCwthYm2ft2Lbbugm96ki/jXlbPAkwpGwuNSmpSA6Kq/FSSRtHwMlaZxNszSVx4E+A
	VIC61hy2UpRM4qvCqr+T3X8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jPbqt68wCzLlVY;
	Wed, 11 Nov 2026 16:13:14 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0D60640561;
	Wed, 11 Nov 2026 16:13:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 16:13:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 0/3] arm_mpam: resctrl: Fix several CDP bugs
Date: Wed, 11 Nov 2026 16:13:13 +0800
Message-ID: <20261111081316.3828283-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Fix several mpam CDP bugs found by testing and AI review.

Changes in v4:
- Only enable CDP on a resource that supports it (Ben)
- Limit num_rmids to the CLOSIDs in use with a simplified fix (Ben)
- v3: https://lore.kernel.org/all/20261106081923.2333070-1-ruanjinjie@huawei.com/

Jinjie Ruan (3):
  arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
  arm_mpam: resctrl: Only enable CDP on a resource that supports it
  arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use

 drivers/resctrl/mpam_resctrl.c | 40 ++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

-- 
2.34.1

