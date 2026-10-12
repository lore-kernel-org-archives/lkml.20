Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09296370ACC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810438; cv=none; b=DPh3ZfvIp+6KOcs3erGGrJtHVV9IKrHE9HxiA7wT89XCpRmH039lWm7JLxh/Ln73IySQSb1ExrRXohTIeGpcfXq12omiibw5KrEHh7ljNFiOA/lK5rw7XUxw6XrF9EPOsQ0M7I/PUr1urSRMn85F4FgHCkRLcEcgv/7uiJpNJQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810438; c=relaxed/simple;
	bh=4+ozGsIcKBpXULDDQQ3ubVP46NF1DgkYAwdz2Ju6G98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eX0zVtIe38E4s6e0VymqhaHybifcdXursEGIeUYe6LQIbOwkn+vuiRj9O3wou2rsXUNM0Ikw7cAJWHiHcOg0QhKhX9PpWCLOQ5a+Z1lGmIbhpAzGY9edhuIBYieomDJIYwVhSgaJVwWLCpzWSZZr8M5AVF7+DIh5CZZ4XzCc0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=KolgYOVX; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="KolgYOVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gw
	Szy9h2yIAsBS0A5B5XhbsRaG4tPHYW9JuEJSYrXyo=; b=KolgYOVXvOnvQJkay7
	mbiKLof+luOmlzErGMrAoMKtpLfsb3t7LCKD6HtgW8heq4IHjbOxNt7bJolsXwh2
	txTBlyWqa06fZLlxx3Sygdt54TIK6uQ85d/2a2npM6BaLVFQnCbf3sD0TIwRISUh
	CYXPxP9lgTZmI4V/kqGf079wE=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3F6BQ28xqRY3SBA--.34912S2;
	Mon, 12 Oct 2026 21:06:25 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: David.Hildenbrand@arm.com,
	Dev.Jain@arm.com,
	Ryan.Roberts@arm.com,
	baohua@kernel.org,
	daehojeong@google.com,
	jaegeuk@kernel.org,
	jyescas@google.com,
	kaleshsingh@google.com,
	linux-kernel@vger.kernel.org,
	lipengfei28@xiaomi.com,
	nzzhao@126.com,
	zhangbo56@xiaomi.com,
	zhaonanzhe@xiaomi.com
Subject: Re: [f2fs-dev] [PATCH v3 03/17] f2fs: support regular file buffered writes on large folios
Date: Mon, 12 Oct 2026 21:06:24 +0800
Message-ID: <20261012130624.2681204-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <efb9eda2-371b-437c-8652-ed25c842f11a@kernel.org>
References: <efb9eda2-371b-437c-8652-ed25c842f11a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3F6BQ28xqRY3SBA--.34912S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4REWlvDUUUU
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBoxLYqGrM21I3ZAAA39

Hi Chao,

Thanks for review!

You mean after I take Daeho's suggestion:

> Maybe f2fs_folio_may_unlock_balance_fs() could call
> f2fs_folio_wait_writeback() after relocking?

we can have a chance to relocate
prepare_large_folio_write_begin()/prepare_large_folio_atomic_write_begin()
after

> else if (!folio_test_large(folio))
>	err = prepare_write_begin(sbi, folio, pos, blen,
>					&blkaddr, &need_balance);
> else
>	err = prepare_large_folio_write_begin(...);

before original f2fs_write_begin's f2fs_folio_wait_writeback, right?

