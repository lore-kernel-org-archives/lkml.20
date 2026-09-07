Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541393F0765
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753475; cv=none; b=jIGCYQ83YmgZJs9Ja+YDjMjMmq33fODMnlXP5GJMi03ZvvmdxE0i/lM3heWQ2jw4Ktrs/PMSSYZ5Z4tGNycsybfVJYRQ4i4QeQ7mbYSndkmpP9u9cJw1VO1MHCAWkV7+3MaTwxvP1FjRYkp6ErBsg+9aXGjMZQIwwxM2wfrWmaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753475; c=relaxed/simple;
	bh=slqXQiFMQQ1S74PKcqyD7jFNOzBfqQuXHQ4Ejt5ACE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhzWQsLOYG7bWB+Km3XM8Wu2F4Jxjrzk5B5LbuWlqbxnmRfILvTXHiOlk2qqiMhyv5UwE6Kl0XfEas03mlOW1PhGSpcr7eh7ASwZB+QOigX3ad9kdFdH+rQAJcDbG4ILr5l+2BScom8Jpeh192CA1jnnAnQH50fwdJtrN/XmROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQO0m8B3; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQO0m8B3"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d903e972efso11603415ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788753474; x=1789358274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdsl9+aa24pT+K8TnYj8ZVm9GMkxSGzxJ21FCr9owyQ=;
        b=qQO0m8B3MnmkhaO+xoavx0mQPzzx3wgbSEoQRgu0hYZ9LQSxKQnKeoux6oNW8u2rju
         furzcy6RP4s7DN2j/7cbUq+ycj0VQNdBX77ZufS11ONHfwYIkmSrAVX/a8up4fysauE3
         al/wISxrhk9StJkLXKTM0DhuoNbOdPbGG+/0w5eGTjZwUdVrr7Lemh24ITmuII8Lguej
         uPHH7OjN3gnCgrPE1t2RpZj2WOdcu9YJWOp+fkfUY70R6GCvbmqOfwOcHPS3L9+k5V4S
         AUwgr+8mtRJKlTikhSlsLzy14cC/gNe9Cp64weOdho8ST1PqEOeBnpkAAt3Rskq+4MYO
         V3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753474; x=1789358274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdsl9+aa24pT+K8TnYj8ZVm9GMkxSGzxJ21FCr9owyQ=;
        b=dCv2TJ59RcngGbz2EYxGGN3Y/b8SgY8s74BWFwkzLRuKty3lFQXKT4k5sUEuIFhWdC
         9tUrnOzltcgTfCcbrkctA6JBfv9NcdSU1QRaxWba6b6KistYa/wGqeNOv/r8bYGZ/Rn0
         xSv/4Jhmxe9ct54ZbcYQo7urkbiW16XTFh+glzGsvfHIlMwBNbEOleEAOXtvSDRs0Uv6
         8gcjS9WEkude5fjCTJ1BH5nmzvnuOWUioimmXNypOBQObkp0n0oTjxaH8SgP8VGkywG0
         CY0QbigPXcAxCmgBSLLMK+9BlTqfBugSfnlvNTJTcrbbyT+ccZKSvno+eCnQO1RUxpgG
         /WdA==
X-Forwarded-Encrypted: i=1; AKwUvBwh2whyefnYn67F4wVykr09h5BJwrgePHbcXmmI0Cv3V3585ts8XD0FRkyhNCoYHsWEl90aRF9i87IqySQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m3jWNIjxAH+nKeloTNmc/VBgLVgUgyKlo6E5C9ecj7hkLn7PVC
	/KktZ4f2wXxMyQa3RNyhwCM917nROEeETiet3j7zLsi5+i1M3iznAzsL
X-Gm-Gg: AYBFou2wNXZdiuz5wfYteJezgV7bUZhaIqTsj+I6sQ/bfabp4PsnuozARmFpgFMmQff
	CbDklNlz/H7dZNUy73lJXaiBaymLI/n7wL5PJhYLtIXyCg/cTqwHG8bbz8aMY8tF6ECdHzVMcpj
	kM85yU+n2WNS0BTSVx8ob3xgByhviXETylNFpp+KlEexfYvdVK44/fr8zGcdFZMPwbIiNSowDNy
	CkhOpGqY1am84BY03QtzdGboNhPFXxVKEBXIQT+daQzeTjItY5eW4qVV5+HcMSLCPuEEBOs2Tf3
	iFFqpFuXnhkrsvcBuDRlKrhOShjpJD5EdHxExME3IJ8lh3gjGmVTaQieBv3A9QcvKShbaoIXyTE
	7hcb1YDR4uVR6aR8fTjkQ0/VSz4gkK3c2eQ0/biwJsweCvUshiOMUsz2WYrhmSp6poB/H4jrpqU
	/JWXvIEjRUuvddEVAG3pCt/uLERQ6AUDa8PsYpdX8UxdStWiCJLHwWwBwJRq9f6mRDyBq+JD4Ks
	ZepW8/y/PbWOjoHVfd1YZ4klA==
X-Received: by 2002:a17:903:2290:b0:2db:63cb:1b17 with SMTP id d9443c01a7336-2db63cb1b8dmr9031135ad.18.1788753473487;
        Sun, 06 Sep 2026 20:57:53 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d4dbsm37186365ad.33.2026.09.06.20.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:57:53 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 05/14] f2fs: support large folio writeback
Date: Mon,  7 Sep 2026 11:57:45 +0800
Message-ID: <20260907035746.2189242-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_yX2vdMhZEUyYH6TaS1wHNp3axu-bjuZY+3XsnfM4oGzQ@mail.gmail.com>
References: <CACOAw_yX2vdMhZEUyYH6TaS1wHNp3axu-bjuZY+3XsnfM4oGzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 3 Sep 2026 21:04:36 -0700, Daeho Jeong wrote:
> In __has_merged_page(), target->mapping is directly dereferenced. For tail
> pages, target->mapping contains compound_head metadata rather than a valid
> address_space pointer, leading to a kernel crash when accessing
> target->mapping->host.

Thanks for the review.

I've been testing on 6.18-based (Android) and 7.2-rc5 trees, and in
both of them bio_for_each_folio_all() goes through bio_first_folio(),
which resolves the head folio from the bvec directly:

    fi->folio = page_folio(bvec->bv_page);

So the folio yielded to __has_merged_page() should always be the head
folio there.

Are you testing on a 6.12-based Android kernel? In 6.12,
__has_merged_page() still iterated with bio_for_each_segment_all() and
took bvec->bv_page directly as target, so a tail page would make
target->mapping point at the compound_head metadata and crash on
target->mapping->host.

If so, would it be possible to retest on a 6.18 Android kernel, where
the iterator normalizes to the head folio?

Thanks,
Nanzhe
