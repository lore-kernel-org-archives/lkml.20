Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A6728FFF6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035254; cv=none; b=Jx6L1SXsxjqIBJcKr1b5mItv4Kkjc9H9aEr+mHHabHLf9rdEIR/32LgQ4b2XeetZgmwTzJ7SRYNJ37V0z8ZMhOrEP6Ue7J4ud3XVKdx6CfTBKKpJQT/EXUy7BaAHhrHHMzBQl0YeAiG9xTTm2XD+i+KF4y4KG0dMjAWyC28v3xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035254; c=relaxed/simple;
	bh=MnGQMt0B+jafHRN1v9xwEh/qdzGR5vav6qA43leZFgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=H2qUCclNzhHcTNxUCZe6s+JffLPghi1e80gWVbRnViXfKkATUPDw83V2+JIrW48jENRJ+FfYsFuOQel3LxDQD1CklI8b56fAc1ywc1A39Sz8pTy17s4+39GkSgP/qlM2BHnwOvbF+qzbsj/K81Ca9dSC1G3gxZGMe87Z6TTMU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=FpWO/qtR; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="FpWO/qtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=MnGQMt0B+jafHRN1v9xwEh/qdzGR5vav6qA43leZFgE=; b=F
	pWO/qtRU4qdwejGJjnYOX4mISr+TjgR4MJRJKPD/7sqN1JiMsK8zG9TI22j+yjL1
	mo//afTiP/oaKMziGvHFUo+yGwW2fcG9myr+0cKL4tS7DOeaMuyixCg6ZSyrDOZW
	XvmeXf8k/93TohFlzW4/yn9qv/4I0NYflymmPPIv/c=
Date: Thu, 15 Oct 2026 11:33:26 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Jaegeuk Kim" <jaegeuk@kernel.org>
Cc: "Nanzhe Zhao" <nzzhao.sigma@gmail.com>, "Barry Song" <baohua@kernel.org>,
	"Nanzhe Zhao" <zhaonanzhe@xiaomi.com>,
	"Juan Yescas" <jyescas@google.com>,
	"Daeho Jeong" <daehojeong@google.com>, linux-kernel@vger.kernel.org,
	"Dev Jain" <Dev.Jain@arm.com>,
	"David Hildenbrand" <David.Hildenbrand@arm.com>,
	"Pengfei Li" <lipengfei28@xiaomi.com>,
	"Bo Zhang" <zhangbo56@xiaomi.com>,
	"Kalesh Singh" <kaleshsingh@google.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	"Ryan Roberts" <Ryan.Roberts@arm.com>
Subject: Re:Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large
 folios for writable files
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <atA24UMtAqkmz_R8@google.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com> <atA24UMtAqkmz_R8@google.com>
X-NTES-SC: AL_Qu2SAPyYukor4CKQZ+kdmEoVj+o8Xsaxs/8g2YJSc80Ooxvs5zIGU2d5Anvw/ei9Fi6BrjG2fgRi+th/Y6NKmr0loRDCOejQg3W8Nc3mDA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <63e416aa.2fb2.1a13d9f3491.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cykvCgDXf2aGSdBqhNdPAA--.26047W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBogZCEmrQSYa7wQAA37
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIEphZWd1azoKCj5PaywgdGhpcyBjb21lcyB3aGVuIGFwcGx5aW5nICJmMmZzOiBjYXJyeSBz
dWJwYWdlIG9mZnNldCBhbmQgY291bnQgaW4gd3JpdGUgSU8iLgo+CgpTbyB3ZSBkaWRuJ3QgcmVw
cm9kdWNlIHRoaXMgYnVnIHdpdGggdGhlIHdob2xlIHNlcmllcyBwYXRjaGVkIG9uIGRldi10ZXN0
PwoKVGhhbmtzLAo=
