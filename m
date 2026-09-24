Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C6664A8D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253865; cv=none; b=d8yCT6QzNJuAyLuEeOOIM0jUVtW0sOw5U5lGeZKgdpVPlPsZzp5XPFuGdguUeHC221FKyTaURiMoVqJLjF9zS7+CGjV36X+gVLu9leVyOUEIzhPFfVlLb+DkOxN96NvLAdiybPo4UUNm2PHWORpRB/NB5QwSJfpdOlQVjE+RrBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253865; c=relaxed/simple;
	bh=AqUmf7Q4iWaz3G+9zZxSgy3N38hsPbIZJu8sLq5Tlqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUFlg4yb4cnDc8gSgETA8NR+3QYiAvGSt6MSZMpPrVy7JmIxKiVnZ8n4CZGEBaCSx0/oCECUokgxIP7J5/GxxAKWv3u1o+zhRAfdyIsJqbA1IpHWYmchKKSlHZ6eB3n4DgB9iXz2G/6QzY3mpF5rMDRZayz2aQm1MxB/Kc0oW+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vrqCjb1B; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vrqCjb1B"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790253857; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=SmJKx9IQeBrvMCfRacx1gV/ovk2JnZooxnnvNmOHKGA=;
	b=vrqCjb1BCFq4neAqab5Cr+WaLBXhkctbMBpQt2CBGLs+FbeHfTTkjXX9yp8zAhj9j1Hrd2z8Wt54XsDpOktDU55li5VXyssJyrE7l21HHn/8lJOfr3XLjg7aQfKmU/sCK7kpUCAugnhPWYgOcrVJLfI7v6sm5K8NG5m3yjQBY88=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R341e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fuwenxin@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XBZjysD_1790253846;
Received: from t50b09067.sqa.eu95.tbsite.net(mailfrom:fuwenxin@linux.alibaba.com fp:SMTPD_---0XBZjysD_1790253846 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Sep 2026 20:44:16 +0800
From: fuwenxin <fuwenxin@linux.alibaba.com>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	linux-iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joro@8bytes.org,
	jgg@nvidia.com
Cc: fuwenxin <fuwenxin@linux.alibaba.com>,
	vasant.hegde@amd.com,
	jon.grimm@amd.com,
	yi.l.liu@intel.com,
	kevin.tian@intel.com,
	nicolinc@nvidia.com,
	wnliu@google.com,
	Guanghui Feng <guanghuifeng@linux.alibaba.com>,
	Guixin Liu <kanie@linux.alibaba.com>
Subject: Re: [PATCH v5 19/24] iommu/amd: Add per-segment translate device ID pool
Date: Thu, 24 Sep 2026 20:44:01 +0800
Message-ID: <20260924124403.3858095-1-fuwenxin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260914184750.222939-20-suravee.suthikulpanit@amd.com>
References: <20260914184750.222939-1-suravee.suthikulpanit@amd.com> <20260914184750.222939-20-suravee.suthikulpanit@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Suravee,

> A translate device ID (TransDevID) is a host device-table index used
> by hardware vIOMMU. VFCTRL guest-misc names the slot; that DTE holds
> the nest-parent v1 table for GPA->SPA walks of guest IOMMU traffic.

> Reserve PCI requestor IDs in a per-segment pool so they are not
> used as vIOMMU translation DTEs. The device table is per-segment,
> so the pool is too.
>
> Add trans_devid.c with pci_seg init/fini and
> amd_iommu_trans_devid_reserve() from probe_device(). Keep
> reservations for the pci_seg lifetime, including after
> amd_iommu_release_device().

Reservation only happens on the probe path, but some DTE-slot holders
never probe, so their devids stay unreserved while
trans_devid_find_free_locked() [patch 22] treats any xa_load()==NULL
slot as free.

One such holder is the IOMMU's own function: init.c deliberately does
rlookup_table[iommu->devid] = NULL , so it never reaches probe_device()
 -- yet patch 13 programs the self DTE at exactly iommu->devid. 

Thanks,
fuwenxin
