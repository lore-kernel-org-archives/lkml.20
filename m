Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A923C10B2
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550450; cv=none; b=TL1z6oIPwYiJo47bVu8vTbG0UQI/kgGC+qZg5K5aRlNoOoETUQbxyrIseicc1XHDB9tTY3AcHyGY3RP3/RxFjIjMdr6RWfujbSZvC/nFA0As8EMvCWD+tQTAG9Q9JJDzMSHqMeXWrmNTkw/NIGGk/CEOfeUthsLNLQa7/hCJfWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550450; c=relaxed/simple;
	bh=6+60PQeTZm0nfrUzmsCc5SiZvJZdAxHUWyJMeoD2aF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zbh/VvOgelkAgOFq3HyD1rYDnfq1nU56DKAc8feC/zVFKesq6V5u2jkPmB4sF251sZSQcU1vVDSZ1sL7bnUJtBwVFnTxDnG29GMWvsLfujlKvrAKjyzu/27zD92PYu/vD+tsx9NkZi1SWXOCK/z8ziTzpnUMjMAZPzRWNMlbsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=n26gwB0a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PkNx2HxF; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="n26gwB0a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PkNx2HxF"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 117841400021;
	Sun, 27 Sep 2026 19:07:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 27 Sep 2026 19:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1790550448; x=1790636848; bh=F7fCvE8IXa
	NegiSh9ckLtZbJqoQBWGpCg6N9ScNLNyA=; b=n26gwB0arJtUBbZakd1p+w+8Xh
	Ykgm+ft+dCh+vosZLRoP0LwcH8YPZAtsPKJ9btBW951TUBFJAX1rQZ/cZb9xbOfl
	vZ4+BpAQA+h4nVyxclIX+IZVILJUHHwcaegNpY5sPQr/UDFqFjtqT8em4uUCXsFR
	Em0kCuKnvFJkC7icLRkmY72eodv7F3BRyScmZjhT9tDIaSJCgCpEqlv788Zsci6t
	DhdAF9h4Uo1YyOo7hTbqYKEsIDO/SJoglos3SRAG6M7hizN6Y2/xMsef7yk0UKEl
	b3Ahz0chgYQKZz2Ff1vZE9eOOFIwjUZ4Jy0cfRyc+E2K7bZn0oRHqSanwTRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790550448; x=1790636848; bh=F7fCvE8IXaNegiSh9ckLtZbJqoQBWGpCg6N
	9ScNLNyA=; b=PkNx2HxF7WlwzXu8LFp8vEd6592WUv/f15LYsduTCf7AunfABKs
	ouiXJVm+i6hcgF79zkOARXttW87f1hLmF9RYxsWAbQ7X51oXwsjCgR27YmpP+VL5
	cOLvTYqDt/3CAHqYGF9tYC1Upz+drgm3G2vYURdIIMcRNt+2dvv7P7ujX05aPLmm
	1ToO6FwcNNqtkX3rM0aqcdeE+Tjx2QX1nH8XxrN5WrrWG0Opf46+qz5c81OATrJv
	nbd229fjLN5SQN6HbNFj/8kUuRfKfgS/X7YdwABYbt/WGR6+uxlWhMSEIi9JgNLc
	yvycmEUTY5WBNWoRu/Br8ymw2mK6JI5eXUQ==
X-ME-Sender: <xms:r6G5atXytS1pzgxSn79_esuZIB04p-E4-iuXBgLejLsrN1bvduTfIQ>
    <xme:r6G5argL2qjvrsmYMb44E8CEVIIz8JC4sFv-3Z1-zU1919KLbtDeK09pCifj2pL-Y
    9wbO4gLxLI93Am_WQDMWRb3oPQ1MdUh1vcjj1V57i6Jv7hraibgIOrZ>
X-ME-Received: <xmr:r6G5ag_LxBIdwPldHgifgIWgA7p2K7xseijos5V2zDaglXbrSdYvlCchJOHIOj2DPQp5dZmroWmcVOMXkSWwn2bBfAi0cDCpLtywaINB1xPy>
X-ME-Proxy-Cause: dmFkZTGM/jDG+pZVqVkdwgJjSIFndnxRl3u53vgVM4Mt3d/5Wtl1mvqUc0wObxAb+iZZ5+
    9REJb3rYMYoaP/3CO9CuoE8aT9Wr0g0lyjSA5iLH8p849EKV80UwFpZ4sGs6JpXYD4oehK
    mXg7U55smL6R4XFtKRjnv5VLFm4bIetzuyxAbR948SCYZLI0GetNVBHX5jpVl1Artt5m1w
    pF5fGB1LxvN2YOSN7jrUEAH7N22gxfh3FzN5WQiCHSL/NLuYPmlrGjZlosFiwkXJSq7RBv
    ulzjpm1Fg07tTmFJFSdvjYjDj9+NzptyVIylcKSleaTn2QP1Ga15OGDbOKtZe5Q7vKQXmX
    3ahXxBo+dCEi0SrcjtrID0RtKYoxpp3H8/hSc/Bf1DwoI3RGy/qh4ZV98ARjf6kIFVYBJh
    OYaoc+Pn/H38VH2YaP/UX7nxz/NC7bSW7VbHB+tyFpFXfNhTP6FpyfWfjtDr55RzzYpHAh
    3n2LjvwMji6RdN+43qTGNu/nZMUCZLwH4ylah18g/nbbxkMWcXe6FQXI6DflwEAKpsVq6b
    Mlh2yBUlDGZHrtj0hfCHrZCxr8rbB2pZv7bflOrF5LtUm2Kq+pBOFYhmiojmqqF1PKDYUJ
    C6YFstsZ+Ah6YuWEguQVj3CMuuE7pW54L3LIq+dWqDTTPWXV7PnMDIXPlLkg
X-ME-Proxy: <xmx:r6G5atDapZ0Ov9BA0y0rSUN0icF_EuLA4lYoItF5lHGIULjcHzQUIQ>
    <xmx:r6G5alK9iRVhAJ-j2e1Ra5Vn4NUFrnTP2mWt--JtU7dLNV3216hsww>
    <xmx:r6G5aok_J0E1znf3IU1RyTFZ4jAWXYWGL6nEI_VcvZYJ8NbvJx99Ew>
    <xmx:r6G5arErlZXLsPx_QMYJ-10WITmZpNQpfBNUcW3vaE_5-NHNfBXcvg>
    <xmx:sKG5atqLyn2EbKDctjrr9DDVUKuKHajAepTVaUinHbgoN4bk2RRb6qos>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 19:07:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firewire: cdev: replace spin lock with mutex
Date: Mon, 28 Sep 2026 08:07:22 +0900
Message-ID: <20260927230724.119305-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

All execution paths in the cdev layer now run in process context.

This series replaces the spin lock with mutex to avoid CPU consumption
while waiting for the lock.


Takashi Sakamoto (2):
  firewire: cdev: use atomic_t for iso_resource_auto todo member
  firewire: cdev: use mutex for client locking

 drivers/firewire/core-cdev.c | 89 ++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 44 deletions(-)


base-commit: a781263c292e7bda50812ba2347459e8ce9d778b
-- 
2.53.0

