Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C60485511
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968507; cv=none; b=O2uCXlqxqfhmv22YLfkY1PY/5HkV5/CC/tOo5et1bNFVrRjrDzjc1Xt8f+M93Sh0DP4VJ7FW5LR8HHa9Lz1mgtwrCDof2us3L54g+dkPRXcCYwucKlIrsyyacNJH4iYYRvrua04OgvksUMYGajfbmmggiGEaa/BdcxyxZ8AjIKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968507; c=relaxed/simple;
	bh=aZ70Bda2wR4tgUkkfG3mO3arhPKAoD3lBwt1ddMtEwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHFtYFolKLgv4wbkUhzMntkRCZ2/Ccf5LwyKAaOB8zKP7X51R8iMOkAGc+55QhjfCKZGkpPXYeoPlx6XZ51LFpaQ/3sUwBzrKxcmzOmxzTASQ+lVU/2ji1P7GeB88pKEGALMiXcaHwZGXxJkMuMc5OHYklOCEqyx+U8tWj+B0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q+kttkgp; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q+kttkgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=aZ70Bda2wR4tgUkkfG3mO3arhPKAoD3lBwt1ddMtEwQ=;
	b=Q+kttkgpQ0e2i8bIbagMwx/ukwEk2zKJGpJPqJmS2q7WUBuGsbhK/Q7zIBc3Ku
	x/bhbvkxuBr2ADoU4t6XEsRfnO9fUseTOrJSaT0fD0+eG4YsNXeEFIjViZKJ70r8
	cEhXiRpgj/jA42Aoo4IYoRyVK2lODSaePqn4odiWwls2I=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wBnBm+LRM9qglnrEQ--.9660S2;
	Wed, 14 Oct 2026 16:59:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: anup@brainfault.org,
	tglx@kernel.org
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	bjorn@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	radu@rendec.net,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	hppiscas@163.com
Subject: Re: [PATCH v2] irqchip/riscv-imsic: Reject overlapping group index fields
Date: Wed, 14 Oct 2026 16:59:53 +0800
Message-ID: <caplitmus-rv.reply.20261014.imsic-status.85740c15051c433f9f475e9a23d95636@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
References: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnBm+LRM9qglnrEQ--.9660S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTR_rcTUUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QzCi2rPRIweLQAA32

Hi Anup, Thomas,

Following up on the standalone v2, which received Anup's Reviewed-by.
It is limited to the lower-bound overlap check for a nonzero group
index field.

Could you please let me know whether it is queued or if anything else
is needed?

Thanks,
Pengpeng

