Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102948;
	b=oNB1/k4rBi99KqFGpEi4b/4+XdH2vuj3fHrbalhi575vdQX2SXPXytf9px0Ml12Rkb75
	 OJ8f6fYjbJdiX43XtkzMMJDo35enOZ60S8RT/JfX47eY7KuHTrP7lD/OQNje54VkZmxXC
	 +020tjWWThwLhkvCvTducspcsoBhfBx3N4qJEv/hCgCZSNOvh/mFVE7SDHcisz5cnupVB
	 ea88lvv0emzGJgaBldBrBUyi0hozxKVIcoEba+kIB92GH8LO8osTJPO61Tq83Gf8xl2Qi
	 IsfF9yAYBYkXe5jqH94XLdJ8XAAoF7UTonDyBFHSFEekyIRu9aEQKkieB6XR3Sawqng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102948;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oVLS0bNhd33XdBKUQzjPQnNldzAdOSb/v4EXvCbIPzY=;
	b=rYflONhA5OSArqzGgZ5F28v5hktJD9TWKYSRRq5uCAaaID6ziX8qanRyR5okUTOSJOnP
	 Ym24z1PpI38zWdyVeQpmRK7RS+z82v8sxH836bjMki4cFb3uFp4XPrCi19QhzecIppXyG
	 fANRI44CvDNe1Mf5Rd4idAqShakl8vPfXQIOvKD96BPZ3UU53THWfm+yRQCTxD55tc4tJ
	 6Dcc0r3rjZGAn4N9Ez5bbt2bxVarri0xSVu8UGugRCJ0pgc25kdGp9IS2TKGIrQNhcKgb
	 jIJuRz7oMg3YxoLl6ZaifSIbrJPvI1od+QPF/Etb4f0mfqdFIkAEwfeGf6sEZ23mzYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XcrkGhai;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD73606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD73606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XcrkGhai
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793102944; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=oVLS0bNhd33XdBKUQzjPQnNldzAdOSb/v4EXvCbIPzY=;
	b=XcrkGhaiPYe0LAs47up1WhkQnpdUAVzHDIC3OW2DEzFqlwjW94fQ6sNtasZ3D9uU9mJGaMhJvikn+grr/OxE4PrD1b4VvP2KfFVWBJaggoxHMRLoGRylQy7A65XwJ3rJdaw7fE36igBTZtCvTOpoYF2Vv4yHGP5ppuZxXvjW2cI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XDdhbck_1793102934;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDdhbck_1793102934 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 20:09:02 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	"Kaitao Cheng" <kaitao.cheng@linux.dev>,
	vbabka@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: Re: [PATCH v2 0/2] mm: don't migrate folios containing hwpoisoned pages
Date: Tue, 27 Oct 2026 20:08:54 +0800
Message-ID: <20261027120854.1213156-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <18602383-2326-4e54-8dec-bb695ae8878e@kernel.org>
References: <20261026025552.1427901-1-xiangzao@linux.alibaba.com> <18602383-2326-4e54-8dec-bb695ae8878e@kernel.org>
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

The fallback check does not compile on x86_64.  There,
folio_mc_copy() only catches a synchronous #MC at the copy, and
software-injected poison never triggers one.  The bug was reproduced
and measured on x86_64, so I think the series is still needed on the
arch it was found on.

-- 
Yuanhe
