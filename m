Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B044EF14E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972128; cv=none; b=aOXuDwjshfXgpcyDU1ZLTPG7zhEWTUSdDafqBJ9VYB+GBKJLp1Yy99Uz5CdMZ9IfyI1iV5th2ii+Ms0N6AF2wtso77mntuVdA6hcs/LeAnK6rjK74gvIRG6g0SecY2m424e0sfcmcewQK5VWmIwtGuUTjOdVal/wK688aDT5rjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972128; c=relaxed/simple;
	bh=eQWBvZEm1B9URX5/Y+/a53p41BQKgaVBwD7jSuzzkZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pEHOIYdVgB8BLd0sjwJux8KB6ikYQFTvYoB9nnk26h1YuN2tD55BkEAcvoxxHaGprUPvYwWFOiKap5Zv9czydk5yr1GolCN9LvZC8Ka7GwuIgDGRNLS2NKBFIIBt+h3QET++ryaINHHMoVc7YFvjJX/xqLG9PNB9036adJoxUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=juTtINBj; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="juTtINBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gq
	9Me0DpRMB/8hAjXFH9qO/hxN6qlQORSNAboh1nE1Q=; b=juTtINBjinqvFI6EKd
	dt8OA/a8imzLq1g9iBhTpkgSeXT3WQdpHGhAHRXxKEV7WpblCa+VlbvjmDFGmaRZ
	jAfrI6X1gBzSFB8y6IiNsQFvE4d4gW3o9oeqYRwo1XQ9lq2cWPDdw846sVHGvjDq
	Nj6NHM8sifcOHDfKcT0v4GSeM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3_y3vUs9q6psGEw--.34516S2;
	Wed, 14 Oct 2026 18:01:21 +0800 (CST)
From: Haolong Wang <18766350203@163.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] mm/memfd_luo: preserve the sealed exec-bit state; reject kernel-private shmem files
Date: Wed, 14 Oct 2026 18:01:11 +0800
Message-ID: <20261014100111.79353-1-18766350203@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2vxzmrsgipn2.fsf@kernel.org>
References: <2vxzmrsgipn2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_y3vUs9q6psGEw--.34516S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO9N3UUUUU
X-CM-SenderInfo: jpryllawtvijiqt6il2tof0z/xtbC9RFfJ2rPUvEgDwAA31

Hi Pratyush,

Understood, and sorry for the noise.  The Assisted-by: trailers are
accurate: I used an AI assistant to draft these patches, and the quality
problem is mine -- I did not review the output carefully enough.  I am
withdrawing the series and will not post another revision until I can explain
every line myself and have a much smaller patch with a clear use case.
Please disregard v1-v3.

Thanks for taking the time to say it plainly.

Haolong Wang

