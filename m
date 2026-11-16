Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800379;
	b=DCUErr+xjRGC7Zbe1PgVWvVgBN2EOXpW+wA9tAS3oIEYEuG58vbdXIdcYME9PxwdfeVi
	 +/qGZXfGPj1dL0tomDKVKSmSffs0wh8aPG4E2xWempcps4VMyS3Lz5XveUlSXTgZLtS+a
	 GUzAHBYoispqd0UEzvkyURiyZCJlUh+uUdRp3aqp0d/lyK8Gn4/qhOu3lfmj9kQCUYq8x
	 MCinR2nuxISghUhne97/VglNpkFXBKJxcA1o6qRg5dlN6OHBegpwxh0Ro8F44OWbfQQXg
	 S38lefM2dTjolrMOTQsXfkVsKvnwt3sExEIkS5wCepcIixhK8vWj/vY69oadDzYwRGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800379;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a9sgY1wDyH66YNK2sLW2XkmwV0xTgSVD7ewg5AAoqtk=;
	b=tl3VppilV4tMGan+MxCZT1xa8BcFYIaGQU7jHaIHSqs7SmAVyVm+94K/oxk4tm/UDEnx
	 xOnvFP+DEbjLySyBPwT0vN2pnX/3yz7XdMWJTNbm9rjaEm4x6eu0+jqITNEGUehB23O9X
	 fgDAVE6+cGN2TjXBECPuBvVzfnHE3E8S8F/5/g06/IrW0QjyO7xAVF9GYgdiigSSSMj/L
	 Wvz7e2lazL7ALxH8cDX3MF3Kham+9Bcl2zK6NzG92n4oyUnR0gFecS9meyHYnBDw6nYBP
	 2dxKNJVL/j//LrCX05djRigj3qznJnK0E7Xp/WHgF+5A7QM8dzDusKUSSw+dFRjABSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=meTtckta;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63379606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63379606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=meTtckta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=meTtckta5LEDNUUu7pe/VZYZUdmdBPNgl9BfBapZXzEET8xILaDqpLVCBhgHM4bo7FvY+rTP5RpSQ
	 odo+IOhkVuQYlF6JRg8SBNV/nS1BjdrM6qWy/Fc6Dh460L51+MLj9kALRgreRBZa1AaRu+IKuhHZ61
	 hWEujT4m5TuCjJl8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afa7af3009-c7fba;
	Mon, 16 Nov 2026 11:39:35 +0800 (CST)
X-RM-TRANSID:2ee66afa7af3009-c7fba
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afa7af5540-7b4d5;
	Mon, 16 Nov 2026 11:39:35 +0800 (CST)
X-RM-TRANSID:2ee16afa7af5540-7b4d5
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com,
	Jiahao Xu <xujiahao@cmss.chinamobile.com>
Subject: Re: [PATCH] iommufd: reject mapping an iommufd file into an IOAS
Date: Mon, 16 Nov 2026 11:38:08 +0800
Message-ID: <20261116113808.560717-1-xujiahao@cmss.chinamobile.com>
In-Reply-To: <20261114004101.GE2532299@ziepe.ca>
References: <20261112105945.285526-1-xujiahao@cmss.chinamobile.com> <20261114004101.GE2532299@ziepe.ca>
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

Agreed -- the blocklist is the wrong direction.  A vfio device fd bound to
this iommufd holds an iommufd_ctx reference of its own, so it reaches the
same cycle, and any other fd type that can own an iommufd_ctx would too.

The reversal looks doable with what mm already enforces.  memfd_pin_folios()
accepts only these two kinds of file:

	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
		return -EINVAL;

and both predicates are inline helpers, so iopt_map_file_pages() can apply
the same test before the reference is taken:

	if (!shmem_file(file) && !is_file_hugepages(file)) {
		fput(file);
		return -EINVAL;
	}

with <linux/shmem_fs.h> and <linux/hugetlb.h> added to io_pagetable.c.
With that in place iopt_pages can only ever hold exactly the two kinds of
file memfd_pin_folios() is able to pin, every fd that owns an iommufd_ctx
(iommufd itself, vfio, ...) is rejected before iopt_alloc_file_pages()
runs get_file(), and the dma-buf case stays on its own branch untouched.

That is one file and about six added lines, and it makes the
iommufd_ctx_from_file() check in what I sent unnecessary.

Shall I send v2 in that form, or would you rather see the validation
somewhere else?


