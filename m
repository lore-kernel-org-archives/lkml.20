Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0645D47D931
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968362; cv=none; b=lf4ctnf8/yM2QpvnefQgCs5rplVvOZwbNgM4meaz1ZMAhVvY+fImbngFlu5SHfssRkNSJ9GENzFn2Q2mSDjgGpkwXbxs4RiO4jlkCgFRPhA83lq5VXha7C6G0PRNyE1p00E9MHENsLEClrrl3iHRPwihdF+xhZKMdiUEVS5Loio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968362; c=relaxed/simple;
	bh=gAke8ZID5060Jrf2PqUPtfFmCYS+RDy1jo+4Ajzd0Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpnwDXFTQx2RIr2sQL+xk34udoal5Xwv/6tNvY6YSOf63DvTDwslblIUsdhyb5M4nu9L6jRVw15jZI8+HqpTV2oykocZPucOtb60iBR1GCEGrhjI5yT77/q2Hc5GIIP1DHL1fZiyQbWsnyuR+d5TS3a0zGZC21xp7rPG2K7a35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qLiZDaH4; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qLiZDaH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=gAke8ZID5060Jrf2PqUPtfFmCYS+RDy1jo+4Ajzd0Fw=;
	b=qLiZDaH4b3DljtVoezz01wbjxsIMKi8AyrqLdYz0ViCZfmGNeBBxatYIQqhEc+
	utfTokdmTy7ZH9d6Flje4NJSVLpVYz5YHvNxc6YsDOa5jdEM5x/hUdCbpl6ivd7I
	SIBzRuGX9fPgiQ17keomgJwYKD7GTMq5pUf8fie6XTxnk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3v908RM9qt594Eg--.56508S2;
	Wed, 14 Oct 2026 16:58:38 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: radu@rendec.net,
	tglx@kernel.org
Cc: cmirabil@redhat.com,
	lzampier@redhat.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	hppiscas@163.com
Subject: Re: [PATCH v2] irqchip/sifive-plic: Avoid signed shift in interrupt enable mask
Date: Wed, 14 Oct 2026 16:58:35 +0800
Message-ID: <caplitmus-rv.reply.20261014.plic-status.320704e202ed4139aee623b340f3d65a@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
References: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v908RM9qt594Eg--.56508S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRMPfHUUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7R6ud2rPRD4OwwAA34

Hi Radu, Thomas,

A brief follow-up on this v2. It corrects the Fixes tag as requested,
with the code change unchanged.

Please let me know whether it is queued or if any further changes are
needed.

Thanks,
Pengpeng

