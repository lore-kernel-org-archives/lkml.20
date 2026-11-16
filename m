Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828046;
	b=Sa8cSeq3JZnGoZLtSZaculzsJJofwGBHC6DooOpmQShsdPYhv+weFJ0MwgtdaHxf3vO/
	 74xallH7aV/rBCno0iSwNfoslnYsPdSRx0OaeAqV7YSx0Q73up23YKbvx3TU3HEtxSRjq
	 wh3zjH59Mb8KPyF5B1gL03EQkJ3O/4KoV/UQ6dHWlUMTCd0fRLCgY3UwszFtf3jnJ8Teb
	 QQiwHwhEAsb2zAeDagYaqbBS9QZ1NWOs1f9T/sUZ1lc9idyxfPDuc8RETQsTHLn4fZhkA
	 yHvyxeQLPSIavv6p2ltn2wYdZrwK8LbPS/xv06vhTY9vxh6nlNkC/zI5CNQ7slOVHag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828046;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=LnD4QWUGvpl+vwERhoNXP0WiLVehgWtc8v4OUjLBKwA=;
	b=PIXIZeQP+265GmZgydZsH/fShjnNQJFhfF8oNbBCKNJ8a7XwIEqnw0yPhMWuul5jiMgw
	 1sKBK5B/EMXKODWss3Y5180KXQ/6l5MtHvmCLwsDDVzHEc3wdNws06dT7UL/bT8Sk5x/v
	 XbDaGIopOFjQZChosQHOFPuViq56e4blVQAZrl7Vd3afYhbGH0u2mtsJS3A1OTDyrgAfp
	 IZuGyPTDLOSWGHaYLOGX2+/fTTukZI6qyuYcXw0BOMZrSijaTjIKzkGfWkRw9OMghX8sh
	 ZU35ayQ9JsY2nAmAws63Tp6CU+yRPPNLOjKpK8gFlYVNDmTV8QXS6dpUmnQsTLJXj4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dC4hOLJ7;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488BE6071031
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488BE6071031
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dC4hOLJ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ln
	D4QWUGvpl+vwERhoNXP0WiLVehgWtc8v4OUjLBKwA=; b=dC4hOLJ7S2mOvx+pyv
	L+HUOPozCfhuPp5GhY2DJ1wJDBr+BOGXfDjppyvOrQsNmYJUJunDuFoeTvjQLE1x
	kJ+u129IX5mN1VQwnSSx+7cPdda27MsW77JPrZP6wUV9tuJkATdzYc4Pxosv0g2Z
	j21G7gRk/IvpA8a1fK/ZNW/Cg=
Received: from mm (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHjZnc5vpqFGb6GA--.31639S2;
	Mon, 16 Nov 2026 19:19:59 +0800 (CST)
From: Qi Xi <xiqi5703@163.com>
To: catalin.marinas@arm.com
Cc: benniu@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sunnanyong@huawei.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org
Subject: Re: [PATCH v3 0/2] arm64: speed up __arch_copy_from_user() for large copies
Date: Mon, 16 Nov 2026 19:13:52 +0800
Message-ID: <20261116111352.2006064-1-xiqi5703@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d0e24622-fbf1-484b-81c8-4e5d945e808d@huawei.com>
References: <d0e24622-fbf1-484b-81c8-4e5d945e808d@huawei.com>
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
X-CM-TRANSID:QCgvCgCHjZnc5vpqFGb6GA--.31639S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnKsjDUUUU
X-CM-SenderInfo: 50ltxkqxqtqiywtou0bp/xtbC7gBLgWr65uCUrwAA3J

Hi Catalin,

Thanks for the previous review. v4 is posted here: 
https://lore.kernel.org/all/20261116072512.1323883-1-xiqi5703@163.com/


The issue you raised is addressed: PAN is toggled only around
the new fast path, so LDTR/STTR remain the default for every other copy
and keep protecting against user-controlled kernel accesses.  Fault
handling is fixed as well - every load in the 64-byte loop has its own
exception table entry, so a fault in the middle returns the exact number
of bytes not copied - and there is no new CONFIG option, command line
parameter or cpucap.

Thanks,
Qi

