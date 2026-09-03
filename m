Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67CB3D1CA8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419261; cv=none; b=lX//LR8e5yvClrO+VyV4A2+lT/iaKPLm/FQ/ZV3/Jh1Nh2bfsX2SHsKXfPpkOwSHP6qpgb316YDWwoxyp4m0ZAyW5j7qrgylbO/Cj9jVJXaU49p2Nl5syBhIPxCSx0/FEm85PNspZQF4mTDADbhk3cLwBArBF8NBnk9gbKy+62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419261; c=relaxed/simple;
	bh=YhKd5MYzs2x4XMCq67Wr0SFtMVBmL5qlxRbQefM0xEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyOmBlm7fJ5CNeRAHfH9Ex3m/B13wkIX+gUumOV4UpBknxlgnGpsRKx/QtF34Hy/33T8g4k6HOjvuM+0WMPglN1B7R0TsWoAveYSFQk4Mlheb4OIfR1LKpJIOyYrH63IkEJbAbHkVblonmbxdrZPWkdFv9F8FzmdXkUn4WMDQlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=i93Q2PRU; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="i93Q2PRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788419178;
	bh=5X/G8cC7xn3LThCq50XdcwHXgoSMXjJw2BNtxxdYJK8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=i93Q2PRUr2OXOIMxuJkZYPrpuePLpwsNc1lVsi57uR6OREPQraMWQvPjGnaZWQAnj
	 F0Wa6Q6gdscii2Ngwnag5ULVnTVJu46c0Oo9HJ3CzIVM2T9CkRybjW+R3Zk+uTrdfb
	 q8B1a1B2tnZiDe/rjAwgDsuCCbige5HF4DCPDeaw=
X-QQ-mid: esmtpsz11t1788419175t66410874
X-QQ-Originating-IP: fK1jJDR2jE6E2FlSQAB+yzADaIPHcWLn0p/+0K49yB0=
Received: from zzz-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 15:06:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3964727102774129270
From: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
To: Mike Kaplinskiy <mike@recall.ai>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: Re: [BUG/RFC] mm/madvise: MADV_WILLNEED skips swapped file-backed COW pages
Date: Thu,  3 Sep 2026 15:05:22 +0800
Message-ID: <55D30905BB95B9F8+20260903070523.2032364-1-zhaozhengzhuo@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com>
References: <CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Ns4o82esMDegoCihx5CVKsK8TgcpNv5HGt6nZ8j4Nc1rhjcUn1fqodTp
	K/I2ivI3g7fxGKOC5NRrKMcBI1FMp2VrIMSOzJ2AO/hzRGP7V5fDYH6J5kAaGwBNvAHe7Bg
	D6mtXMyesAdF/9YQHVIuA0CfEkPpi4TS5/lqMCoTRUCEOritJTdsiK0pI+Q9pHNvHsd+2dB
	1QFcavf6wIbpx9bww/NJr1ldMAoNYoVgJx+ywvBEXLilZ46Za72/IWZPTrD9bj9D7mX+Hs9
	OAB42TObef0HEOQYmMQ4cywIjKpx6MtL7g0skMAToLnmcWpL9Xg0sytOkwyocru7AkBJxwh
	7n/U9ryTNdES3ZIo4tTCk44WHrzIh8eCn03YDkEiZWg6E3R5mhFUoA+IZ7sV77S8PuqrlOF
	30nII/P5tabjORMifm1ZxXQ/dzKYmwvOIHCK5GnGBkkDAvpOS6BUzu7r4up51Tvji8bes77
	0xkJ4xcGiTmJihUVQxIzSMoOWw1cOBxxtYQ5Gin3cJnSl4ErFf6iZUngPWloSOJZnnTTYvA
	Ii2H43/jwhC8xOYxOuQ+YIHEKDbUKVQPKs1WFcPvt70Lm73KOGveAh1J5aRTjH5sV97B3Ww
	qcWkBq+nAcQPMhUEbiak4uRPGQsUS1a8PlpvvOBmiXS7/qowF8wmrl6e67dzKkRr+pzxci8
	1xSAWeLFRkWdRhY3uM4lXshv6355EL1BslbtlOwdgZAlrsq9z4QISa+o2E8vCD2138t28Sl
	JJ8eRGODhd/E6Kuy4Nxbn/RgkQEzDy3L5ODfW/LZ4iidDBPMXwcjQxF6U0h/dVEsKhipzEh
	BnmYUWBWVDhN4FDzURc2uKAbwx9ntD2CWm+RXX1+aZHDD+ukkjX6z7ZePhdKIyfljq+H5iL
	mLCYtolFc1hVU98+l+2CZO5roqjPRta+H/VoEoz0DLCGOm9PTv8AoLQXLBqnXacSuCLoBi2
	tmFA3Do8Ee7FccWwAyuC9fx7sdHEKCoL6dQoaLXLGKC6TBofQaAYpnJn5K1J4MF3vJqRG96
	F+A+SH28X9oIQg7JGPqW8eNSRRNPWkxNfQAvhxjg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Hi Mike,

Thanks for the report. I reproduced this on x86-64 with the current
mm-unstable tree at:

  e3b5239afe1b ("mm: gup: cleanup the gup_fast_*() call chain")

The test used a 64 MiB ordinary file-backed MAP_PRIVATE mapping and
disk-backed swap. Since the test machine has 128 GiB of RAM, the pages
initially remained in swap cache after MADV_PAGEOUT. I therefore added
controlled memory pressure between MADV_PAGEOUT and MADV_WILLNEED so
that the swap-cache folios were actually reclaimed.

Across three runs, the pswpin deltas (in 4 KiB pages) were:

                        run 1     run 2     run 3
  after MADV_WILLNEED       2         0         0
  during subsequent touch 16327     15811     15676

The mapping still reported about 64 MiB in Swap after MADV_WILLNEED,
and almost all swap reads occurred only when the pages were touched.

This appears to confirm that madvise_willneed() skips the private swap
entries because the VMA still has vm_file and therefore takes the file
readahead path. vfs_fadvise(POSIX_FADV_WILLNEED) can prefetch the
underlying file contents, but not the modified private contents stored
in swap.

Are you already working on a fix? If testing or other help would be
useful, I would be happy to help.

Thanks,
zhaozhengzhuo
