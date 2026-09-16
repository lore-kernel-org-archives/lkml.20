Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F434C041B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557256; cv=none; b=CSW01zy48d91tUpCjeg9SxiQZudwPEphKmQzAs0iQnHWByebok7hoMdqnTjl+E5hR1Ry8byQRDq0z66eUi2erOEZtnKWsuwHei/8YWgGino0VvFolFzZ2JdWpW7uOapjwJX6rW9TiJgTbQp1Sm7QdcRaDe2BVZwEiT0m+QLfOQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557256; c=relaxed/simple;
	bh=YTqbvtlsDTpJDgEmDGcyts4WPehrMVlCO7bjOajcTrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfTrenHpBObvcFWC3Y6rhaHK80Q1xAqpwvDZGnLnzNgwdZVQWIZzJnH0XfsYS6EXB2XXlGADzPR46VyxaEcY52BGjWMjZ9ikUnXBoW96d69szE0mzWG9ACoPFFx1R711soaCj/RVwZT+REzIxoXWhLZdOS52ZN6rEdc9cLvKPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=MOiIBbFn; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="MOiIBbFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QN
	9Qxxi4lEYy1x1G+8ZGbyQ4qv4VgTLLm2deF5Smt7A=; b=MOiIBbFnjNsepxcV4/
	Hsz62PdO+3N+v1dRYHzs3xwAXaF/2o5wdmeT3RqPiEJh0O/yhFOR7+6ht4DkfztC
	CtN9qoLZtSTQaabNOsM2y7vADQqy2j5IOTnXKLp7UAxXNmn9ALeC5GSrPeehYNnf
	st7mdcymaxkne69lLTAKM+jZ0=
Received: from deepin (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgDnL9WReapqcHQHAA--.32397S2;
	Wed, 16 Sep 2026 19:12:18 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jordan R Abrahams-Whitehead <ajordanr@google.com>,
	Marco Elver <elver@google.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Edward Cree <ecree@solarflare.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: Re: [PATCH] list: add missing empty list check to list_cut_before()
Date: Wed, 16 Sep 2026 19:11:12 +0800
Message-ID: <20260916111112.6894-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aqp1RMcCSBftjsyn@ashevche-desk.local>
References: <aqp1RMcCSBftjsyn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgDnL9WReapqcHQHAA--.32397S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4UAr4Uur45Gr4rGF4fGrg_yoWxAFg_uF
	yUCwnrtrykKrZ5ZF4Ykr4jqrZYyrWxZFWkXrs5uFyfWryfJF93Ga1v9a1xXan5JryqqF90
	gFn8WFWaq34ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIRPHiGqqeZMN0AAA3K

On Wed, 16 Sep 2026 13:53:56 +0300, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Is it IRL case or the code analysis? If the former, add necessary information
> like hardware description (if applicable) and the important ~3-5 lines from
> traceback (I assume you rung with CONFIG_LIST_DEBUG=y).

It is code analysis, not an IRL case.  The motivation is consistency
with list_cut_position(), which already has the same guard.

> Nice! Where is the test case?

There is no test case.  If a test is required for this change, I can
try to add one.  I wanted to first check whether the consistency
argument alone is acceptable.

Thanks,
Ziran Zhang

