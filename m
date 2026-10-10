Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699C443C07
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626567; cv=none; b=b7MOLtB3NE3ZwM2ZVGTwlQs3eAvxU9gdDvPiCo0RMNaZGb1JfFyIvUXGyL37c9gIKlejecVZiGnGbcy2bkfjnK1g9+lA23BEG3r/k/R+IBfSYFqAzei5IJHJ5qMmY0Gw581/ecrS7siMLSrHMptk0816FeEVDZAk0ixTCmZoUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626567; c=relaxed/simple;
	bh=IAeS8NxXplIVsmuZslXz2eJVUeag8wtoTM9uiTXFm28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2aActhE0ZqLDSeOzkEvJhJoJPaxTHYvI+vow3cS2Q/WIaproxVOP9o/T+u+/m7OVQKSj5LqflLo2Izh13k3mFZCa8JyWn6fbSairrGNvoqifMfsoImlzpqeRawRspO32NYl2M2yIlNRL9GolrJXqCIbH0RaNW5H/FmRvlRgNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=bQEg4Mzv; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="bQEg4Mzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yo
	uus/0MWr200AhumZ5bukgeONt49YRtQSAKCUYXfRQ=; b=bQEg4Mzv79VLKtzjbO
	4T6S/I+eT5XLJ/IN1xcnvVwG3H9jCDTJ7t5Y1Vc/kMmi6lHk8LYtdDBkBNlEPNiV
	7mO6mC8qHmf+85dsk4SQzDzjDOFI8RpFHn+4p6fp7KwfUCRGODiv9Ymx3ne78nIt
	eZNQd4OUIRGBrY+LSn8GFdosA=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3914aDcpqFxmnAw--.19359S2;
	Sat, 10 Oct 2026 18:02:04 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: daeho43@gmail.com
Cc: chao@kernel.org,
	David.Hildenbrand@arm.com,
	Dev.Jain@arm.com,
	Ryan.Roberts@arm.com,
	baohua@kernel.org,
	daehojeong@google.com,
	jaegeuk@kernel.org,
	jyescas@google.com,
	kaleshsingh@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	lipengfei28@xiaomi.com,
	nzzhao@126.com,
	zhangbo56@xiaomi.com,
	zhaonanzhe@xiaomi.com
Subject: Re: [f2fs-dev] [PATCH v3 03/17] f2fs: support regular file buffered writes on large folios
Date: Sat, 10 Oct 2026 18:02:02 +0800
Message-ID: <20261010100202.1431895-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_wmA_=kVvyu1m7XbVUpUt6J9BZeW=zqHFkD-+Lt3Gtz3g@mail.gmail.com>
References: <CACOAw_wmA_=kVvyu1m7XbVUpUt6J9BZeW=zqHFkD-+Lt3Gtz3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3914aDcpqFxmnAw--.19359S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnLvKUUUUU
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBohyXZ2rKDRz+mgAA3b

Thanks for pointing out!

I choosed the design to let prepare_large_folio_write_begin() and
prepare_large_folio_atomic_write_begin() complete the read IO internally
to keep the code easy to implement, so I have to call them after the
f2fs_folio_wait_writeback() in f2fs_write_begin().

I'm going to add the writeback wait after re-locking the folio in
f2fs_folio_may_unlock_balance_fs().  For order-0, one more f2fs_folio_wait_writeback
probably doesn't matter much, right?

Thanks,
Nanzhe

