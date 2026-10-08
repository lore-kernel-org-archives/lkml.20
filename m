Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1086299929
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438407; cv=none; b=hAM+jk9ygN52sjQmslIkmXsfGaLOEuWmOndoxxglON2GpooC2QnlVk4RIyM7Jcxstdi29tkDC6m1Q3L3bIokwg9gv8URxLOcH+viQJV3QUUWyiT/cR3p794v3UCVnJ2kefnCC0bnk8gsj3/qaGbF++Z1TAJBNE5gLBrYb0y6nh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438407; c=relaxed/simple;
	bh=Y2qAsGLpYTjiJnvNAXmsNNCQ9/gXHBk9YyAa8JpoLSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kab5Ftv2Lc5aQx0CVquAUrISselQh1RtQ1gJgYfdJK6yI4PV5Fw8RlP/BtEuK1UAoJ80bFClB703BCGCkg6TlouANzhcREb4X6ycwZBnq7zSfo0ZkJygKd7F5Ws6oZ78sPI9bnavOcOZ0zyI18OhWtI+qEnJB2m4HbycCMjorB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Jf3EmRSf; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Jf3EmRSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=CA
	RflcBGpvRN9r7V0tWqypeX79CxYIU+874ZDeCSN/0=; b=Jf3EmRSfIltCfdFpQL
	j1M/RuLOlIuVPmipLei5NpwfAqq2v9yscMNET26fb0pn6SHTybIvEcx1X0TF57VJ
	A/63GUquJXR7eJjBnhzckLCTS6GJfK3+ldCCMTZnQrthPlpThQEx7pYV8XTwjC4o
	kSiGWz5x50uQ5JSsz3PTaqIuc=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD336sXK8dqurzWAg--.64007S2;
	Thu, 08 Oct 2026 13:33:12 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <nzzhao@126.com>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v2 03/14] f2fs: support regular file buffered writes on large folios
Date: Thu,  8 Oct 2026 13:33:11 +0800
Message-ID: <20261008053311.712223-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_zwgUPLkU5BJGE3p2fXecEncPYwRAq0hOB71oks0JUpPQ@mail.gmail.com>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com> <20260915041909.2903887-4-zhaonanzhe@xiaomi.com> <CACOAw_zwgUPLkU5BJGE3p2fXecEncPYwRAq0hOB71oks0JUpPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD336sXK8dqurzWAg--.64007S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4REWlvDUUUU
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsRldLWrHKxm8tAAA3P

Hi Daeho,

Thanks for the change.  I would like to integrate it into v3, folding it
into the "f2fs: support regular file buffered writes on large folios"
commit.

My patch adjusts the signature of 'prepare_atomic_write_begin()': for large
folio compatibility, the 'unsigned int len' parameter is replaced by 'pgoff_t index',
so that the helper can be called in a loop from 'prepare_large_folio_atomic_write_begin()'. 
I found that len was a dead parameter in the original 'prepare_atomic_write_begin()', 
so in v3 I will not pass blen to 'prepare_atomic_write_begin()'.

Thanks,
Nanzhe

