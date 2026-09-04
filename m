Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4EB373C12
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549911; cv=none; b=Y2S6TCptcixBc0Zx+dtpXW89WSa7WhTxDL9r39zNb+VxowlgDgIcB9W+8kTkrQW+jFf/glyhapvDG2RZarCA+p7Aj0RjcphUtanZSrPCReHQUp75TTIS0ULIy1vZuqFFStDcTIqvq3YaWIgIeFgm0kQq5pzANwRITqrMxDb62vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549911; c=relaxed/simple;
	bh=WPby45mlvgqrjAjrgEFT66rBvxelwbiOcywD+a63yWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hnU5yUr8QWZjGEbwNOCgB1J5A+orAWljKIlWGGn0X7TEZw0o77yWnZu8hj9uTZLXUAudtYHpfm63bz1Ze008knI0g0O71tRxcVXYnZfxwj2zhvyx2OEN9NQqGoY9KawWJwGsME7qKEMM6b5qStCiwRuVjQN80XXKtkkS7ZfMh6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BrAir7UC; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BrAir7UC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788549854;
	bh=WPby45mlvgqrjAjrgEFT66rBvxelwbiOcywD+a63yWs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=BrAir7UCiu+m0ZYu60BJYfxORKp8z0MRGeS2OCVXYlHbJuor/h/ID3sASF8i5tyh/
	 7aGGpt85bJdsleUkgt0iyj+PWluvYxdwUHZ7xd7Chc33u1OU8WwLQeoW3wxdoj2RQK
	 z1jP1ozZTFBuc+etIS16ECmGqPYaPMX9tX39bi+g=
X-QQ-mid: zesmtpgz5t1788549848te888fa4d
X-QQ-Originating-IP: lq8MqQhSC2/ww+RxZCAVxTrE9W5Lxwzn+N7LRFobiYA=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 05 Sep 2026 03:24:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13231209562070536267
EX-QQ-RecipientCnt: 9
From: Wentao Guan <guanwentao@uniontech.com>
To: guanwentao@uniontech.com
Cc: david@fromorbit.com,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	qi.zheng@linux.dev,
	qinyuntan@linux.alibaba.com,
	shakeel.butt@linux.dev
Subject: Re: [PATCH] mm: list_lru: clear shrinker id when disabling memcg awareness
Date: Sat,  5 Sep 2026 03:24:06 +0800
Message-Id: <20260904192406.24306-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904190028.21542-1-guanwentao@uniontech.com>
References: <20260904190028.21542-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MNkNUGo4CMaWFTEvoYAHxvhe2j6+OnXhB+7FadoVYJc0kVTfwg1Yhr5F
	Z9cmsY2NBIFrlpSxzVFiL9qjC0AvE79GOEC97SOs3mgtgEr5v99LwKq8inEY4OCM39bsKKW
	3dzZHVukUFKSXucsH7YODTDjCuIietdmEqaEoODgvPSKgZfQOHKjPx9rUdZNdkfn/b+Y0nq
	YUUYZlh7T5YNT2e0hGc5OuUH3A+lyzM+W2awFNI2qToVcUyfHqgqTQ9PImdntH4k0kmdxyf
	vP6VMpifMu780VXsQUoSQ/82Ca33PmtF6AeNOPw8X3eiu9pAdxqyARrzFJuMMtlirkwu8Nk
	Q4ploBwhO85XEBqB3YC1oCDIQBwiPC2wI1loXwyRm66XPTN6lAP/80hzcMchrz2+t+B5adB
	uN+gWVTTLR1z2uzQWgWKli2yu/s2uSES6e1mHq8O4f44d37WRoyA/5NJBTbJX1nGO4+gpt0
	NUcUauAygEwuFakgRls0wOR288SHqMryq6Q6/XFH82zhwWZFnk5Ee0M+B5Pg1Vw+D7ldwin
	9LD97WFWQ68OHKFBOQ58mFffI+10F/6H3COxfkFjvycT1SRW0vkEAEt0zSAdlX0j4QHbcR4
	zozuf2Ms77hyYRZwsyYBURwDZNJ/XUDBudcxvrcl4COUTHMKEdO4YhWsjP66Ob/fQKCkUj4
	IX1LO+2xSq/bFXX0CQEVwOZH1x2XXqvn/XB/BlJPjsR9osqoMSXfH7HeIQAaUvShKG254Gp
	Rx/3mxRfatY4cklPkkSxxRYsMPUQP85VDTxJ15SMmr9KwoK4J2xWmyFH9HwpmKX8WErDKoS
	zejkYbxt5TLUcnM+WeiVoECwbGJLeZNR8MvE0WNxiu3G5RXEmZ5BHRZAwoBJtFN2mat7oPQ
	vcqrvkyS7h275tMgKZNsxNkbJ5JTtHoGjxApirHhoEp4KnDfswqLgreu+bSgTl7HJsxHK/k
	Ao9AV9ii7aVlkzER1bHX0hQjD3yg87LLyErpS+5SZmezsLOT3LiHEvdY4CNYCeNcy7Nas0D
	+4mGGqnQqSAms36Kgzc0ZvmRulxk+uLQJtixjbJgI3z3t9WvnjiLaJsy509BmGzzax+smTb
	Z0PeQGpGgMbCMFeEx066WU=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Hi All,

I never noticed the patch in maillist
("mm/list_lru: don't copy stale shrinker id from non-memcg-aware shrinkers")
before, the patch is better than me, so just ignore the patch.

Link: https://lore.kernel.org/linux-mm/20260901115104.2944996-1-qinyuntan@linux.alibaba.com/

BRs
Wentao Guan
