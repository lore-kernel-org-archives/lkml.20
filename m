Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FCE48EC71
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503080; cv=none; b=OyxmnmesK9I6QHpslyS1tcK15UcYb8BYEWrmue5BitjQDTCOqFxOURIjEzokZ3CvuWYF58kr4aIBmNmmzUx2NY4E+ZIplK22Smhz1/JZQpQBgjBIOVCWCgM1pkwsHrFEY+DpGx9HgtLLUbRSH4jVFbwAzQfc/FzBc+gW5KmOzQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503080; c=relaxed/simple;
	bh=+GF9EcW3rZi0GG3b7cLIYUo5wZWK4K/jseLnEGCmmms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hs/bsruA0x4KRVa7SvNCNaVzD/SU5Ymo5CWNU0C5IE8OvwQ6kWeRr9//h/yaytjmmRrNMJ5EWzrOkcLOEh/6vuN08203sxluT+AhZWAdgfvbsqk6rK6yoQeqKSzm6BaMSLxc2JHz/2zACkj3wenQgBFUP4GKF0vIXfQCealZj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=MTvzh3eE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a5bhr9Hk; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="MTvzh3eE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a5bhr9Hk"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 2EDC51D0006C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:44:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 08 Oct 2026 19:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1791503076; x=1791589476; bh=+82jNvwFkn
	AZoTMF152wtuGutSouyZ5AbCn25zKwT/Q=; b=MTvzh3eEOgiHbCxLu6lIDOCfTL
	LKJcduFxA9Aixf0gucfXQtcUpVU6fjN0yxu1rPDDS7MVFwGu781LVGhJ2zGL/8ct
	UVr6u+b7HJC2PiRDQYf8sbybuOsslp3t+HZ8+ZUCA0LLfSihXVl0Zk4Wuo+RRuy5
	u5Xmf5TVRt/sIb6jkkuw2nt8UpfnOMW+S3Uj8qYUc5vAOwC3mf9SVGU+uDymKu6X
	3BvV/VL4OpLwS3RcbXbuZcPYFptINBKcDwmcODP+fIjU/PjT6ry7WDpCsp8ONAw/
	weS66bqXGQ8NbJZz/Ab5uSZM+8xItoBHhnJFz1O1BA/dS3FDUxScvIou+V2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791503076; x=1791589476; bh=+82jNvwFknAZoTMF152wtuGutSouyZ5AbCn
	25zKwT/Q=; b=a5bhr9HkSrnu3mFUsgNq7cSv/5TkbOMzkHhiINAuDChBwf53IyO
	3sIznHarm1gikULo/qUmdk7tM5P9FUMwkTPdHXd8WAC/Av7esmImisoLq18gKW4r
	GgEwFmf7A1dYWl5WyiL5/ZS67Bu0UvOgNPfvGZgRDw/dgxcaCZ/hHqZTBaUVTeW8
	HtFzOWKIw0Ka19gjhLxerQ0SO08YsmACG+4m4ewXFKwdkZle+uEandwp34VxVE7a
	8Zb+q7BNeGtypAi+iE0oTLpSxn8MPMuC/gaMEJX8mh4tnmb8ZL0zTCPKlYS5Ek3/
	jOAhTtRUhxZ9c4+i26OQglb0FBgVUJD5FkA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791503076; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:elHi3a/DvS35bDBSBDFLE+E2ABpnn4LChJSjpN8/wfGr1TC
	Akw8zmp8mKdgqY1jSd8UzGLzjU1KmxuKnQnl4VmAMzPL/T3t2r0Lis5tNChGfuL1
	sxxHheVb5CyHanvUzUL3yqwtX3Tzfqtx5LUezmJ42q5qJ+gqrbSy5E1xx999kTct
	2X5agLRVh1Gon7mvEnUlwbTNP4yEO2DSg6JKShM0eUCP+pRTUpvVqMC6f/PTloCV
	C9uqyJpRcijxuFzkOKZFb9j3yumXr/f9nLP1i9hEhme67fSs8Aa7qDhpuUlzCmqy
	3RuJ/wVk32/Ngpzj2Q2l4gnUjdE96wXaYj+J4DA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:YWymnG+8NctHC8URsh5dYaBEjlX72+8idvJH5LqNpHY=:+GF9EcW3rZi0GG3b7cLIYUo5wZWK4K/jseLnEGCmmms=;
X-ME-Sender: <xms:5CrIapn7sOZyrWoiGnTyT4C3iGMehQdv3oQhPLxWk8QnNKocbyrGXw>
    <xme:5CrIaizfTAI7rm_i_UIuOB0S2F1StLzOwhx4zR0dXaLw96e05AY_Or_pGAsuJVwon
    OFUgZbsQZDeE-h1Fkg9mkM4ewTInV8AoOXyIZvEmDu46fkSxtPMjiVy>
X-ME-Received: <xmr:5CrIanMLk9kC41qiFpdzUAFBB9BvpmUn-bqYbN6YT9tgv7Z1wOX5BRkX-aoMa8yNcqC5UGoR7zw7_gtd4nXQmrizMUZq6reacNxHAnmdx1homA>
X-ME-Proxy-Cause: dmFkZTF9szZDzOwWCkTLM764F6AiJfl5bOO/wWB1ptdxENF0b+LTUoCbDvmSEeGeFHr9n3
    OnjMf9qam0b8AWyrvSx1K/0rXi34jA2AMjetQ4H+k4OJPhfnJ/5Rc4EMS2RYGDQm4xqaKH
    /8zzGAGBbaLzRcVxIufo59vhs/X0mVMhSrsCg0eW0tyt6aEVywiH5/TqKwiavO/t2FTezz
    oBoa8BKXwxHEwMUMXGFYD+FpeZ3SpBQQoX7a5hOgVWEOAQAgco8MLFRDeoXAYN/eLzEkBt
    sECa3oezqPcGdzPOciwzW5YOpnRCTNgChnM1kmmHxzsEeFwOjP8rea8KqlbJ6AsFRjGzdY
    IuzEzQUX5XoRgGW6JOALtq6qGAcWZ0n9kLLKb4zpTc5JyGQt/DoNGWmqtQN0jh7ykHVH3e
    zSvM8Rb71+AwpuqnVLmEW6Fn5X01bkduZndQnAH3ZFxrHvyXQuJ1k2cOrPQrbZfe/B3hID
    sLlvEh8Z+AHeWfHF0vYST6jDzhH3bGBcqBsKdOV4QYkELydCdod1QZfcNmqlx8FZIuvAV+
    XVdcFcbLS0frm6rqQkgIWg7aInZwBBwLlJ5PVFx8qbPO+P5/MPM2Emc9up2XawKjxOQiRQ
    +aeUe9JAQsQRQ9UcEB+ePZeT5pRO2pOVDV4R/oTzoNZWCpFZM9kCjU+H8lPA
X-ME-Proxy: <xmx:5CrIamQdgaWEfJPZZJCga7RS4KXTE3Q_Tfygr9WzpH0PC7bgWYbJlQ>
    <xmx:5CrIalYOJiTo3OEP3Aq7RQkzBualSuJgFHI9_qaRUeZ2Axz0MZEG2A>
    <xmx:5CrIaj1WLxIVC8tIfx_rky6zIRTUSwoYNlfxCupaQdonr9gRAEkydA>
    <xmx:5CrIalWOXOD5R5fVzxsvJvrI_kZYIGhCD62FkSow7FXI992fT2_07A>
    <xmx:5CrIar71Dv24uJgPQLrq3pkgvgswQJtCIhk8OgvBlXW4MWtYu5pnlTQI>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 19:44:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] firewire: core: make execution context assumptions explicit
Date: Fri,  9 Oct 2026 08:44:26 +0900
Message-ID: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent code changes have guaranteed the execution contexts of several
functions in the transaction layer. Based on this, this series adjusts
the use of spinlock variants and adds might_sleep() calls where
appropriate.

It also adds sparse annotations and lockdep checks for several locks to
document the expected locking context and help detect incorrect locking
behavior.

Takashi Sakamoto (6):
  firewire: core: use spinlock_irqsave() appropriately for transaction
    list lock
  firewire: core: add might_sleep() checks
  firewire: core: use sparse annotations and lockdep checks for
    transaction lock
  firewire: core: use sparse annotations and lockdep checks for topology
    map lock
  firewire: core: use sparse annotations and lockdep checks for split
    timeout lock
  firewire: core: narrow the card lock scope when accessing node_id

 drivers/firewire/core-topology.c    |  3 +
 drivers/firewire/core-transaction.c | 96 ++++++++++++++++++++---------
 2 files changed, 70 insertions(+), 29 deletions(-)


base-commit: a8cf19ce243bf2cd0d338823fa79cd927e34b830
-- 
2.53.0

