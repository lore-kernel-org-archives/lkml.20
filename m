Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7246D2DC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052140; cv=none; b=Yy7gYCHKJywdijXCQ2wRriIDT91A2dGQeZ7dK1nzoHGa1rMb2580WHhla1x14ldqRJQ8p/11809zQcY8ex9CqBXOMs6nST2EgoENFtISJP1WmeIAzzjuPb2q0iJzrf1DnSlOikXk/f/26SGAvRpNYi46658R7GJUu9dFtLXrpyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052140; c=relaxed/simple;
	bh=o1ewjkqfgV1Swi0tJItMpYkoa5hd7Q9dks9ukBFKtjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tscN7uq1QAuv4sbL0xzZ3zDOkSKVI3qDehAsh9i7LnvwNMbAjLJwHaDLzdVaJbLp52eTeCvG0r6p7osCrENalu7bb1meQNf6f8caW+5QGBkCpK0hWwCae0EmOwZhBrwI9YNbzpUdNMrThF/ZOrDQRVOTyculJABUQj3tTCAWAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=p5gdFvmm; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="p5gdFvmm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KfWgQiNeb60QLGo8EtL43FicRRzpsV/1Z6y9YLOAIAE=; b=p5gdFvmmDNmkB1kbSw/7lpwXqB
	7chMfeLmy6uywgvIGgai+ApRizx6mZ3U4cLJmg7l9g3Ig/cqryC5wCTiz23LTzoSK0XhVAdbF1Nga
	QzC+g1gedq0tBMEbzWowTUQaynrwuFCOLnpITzOB7c+Eo/ymaGzxYVbkVLmz8VN7EK4a0KaaICWYn
	o2Xu1WCefpCq6dGpwudesqHFZrT6uHmcDS4PWV52q3TFEzHQsv30XFXpAlXrhC3FbqpwbULQTYXKZ
	G3UHIL1Y96N1OlfiqZ8417Y0Zt+1agLrPQsUET7dtSh6LVf+NUPZl/cSxFobRUZOS8j93DKwtlNX+
	rRZ9y3nQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4gBW-000aXl-2f;
	Thu, 10 Sep 2026 14:55:31 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH wq/for-7.4 0/2] workqueue: give percpu its own max_active
 and derive attrs from flags
Date: Thu, 10 Sep 2026 07:54:11 -0700
Message-Id: <20260910-realsplit_last_v2-v1-0-464d64b71b29@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJPEomoC/x3M4QqCMBQG0Fe5fL9dzSku9yoRstq1Lgy1XbFAf
 Peg8wBnh3IRVgTaUXgTlXlCoLoiPF5xerKRhEBw1nW2r60pHLMuWdYhR12HzZkm+ib5/tKle4u
 KsBQe5fs/r/i8z+NcjD+1uB3HDxUuumBvAAAA
X-Change-ID: 20260910-realsplit_last_v2-3a73d7986db4
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: marco.crivellari@suse.com, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=leitao@debian.org;
 h=from:subject:message-id; bh=o1ewjkqfgV1Swi0tJItMpYkoa5hd7Q9dks9ukBFKtjU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqosTe+3llhihR/GdO+mnsZHnXpqqBgVLMYIWEt
 rcAf7Rv6bWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqLE3gAKCRA1o5Of/Hh3
 bYmDD/9EJWpI+dzXX4mhmokibZyV3KffCMGl6DtixF/jwSf2POgeWT8dTMvLPMXtbIgZ3pldjt5
 rpg10YmAlVnEmbFgsOKq1CKgPtKC5oksIFpMdzvEHrf86zaaC3atNGaRw4niV+OlGp9psayrn3r
 CuI7zPQ1h57jRt2yhcxtHqRO9mnBCIT934sCQishwA5zITveZ/PXBNH/Ike6py7D6sBRclxXmpb
 NZ5Si3Xm9+3hZDh8z3iA0kaJ72TttM789AqVUK+CWXRw1eJTZaWTEPqFvhA6MU9ykGdER4eEo6e
 ZfQaPCekus4ETm9yeAHxczMqUVWFwIR0rqWWNTSyzLoo8dKNChN7yuB+lkq00kPXUs/eNsZhWxb
 +6VcVjZ7gJrdd00b5fgvM1tou/a11c2tkXhj0Gv2+6fT3zWkyTkhmpTkAA0pBVw+q/+Cym5Q4pO
 lCf4WI0gbOxM+M5/+K3w8QSGVXtdORCiMQNoC4ATZaDjl/kevaIijbv1HueMp28aLJ9a+P6+2mH
 e4t6ctNEIvSDRFnqz/pQLAp7I4uGIkC5t/MTl+iwngLDGCj7sin3pbDbdPLxwtRO3Q6gmu4GoIR
 K/UnsRP8OpB3Kg+yaoj5rF2BG2JYq9F6xCqdfMVw5N9ibpLrXknPp1jmUFwReEc5VCkYsErlK1X
 xknADlyEJfth57w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Phase two of unifying the percpu and unbound workqueue paths, following
the discussion at [1].

wq->max_active means one thing on a concurrency managed per-cpu pool and
another on an unbound one. Patch 1 gives the per-cpu case its own field,
as Tejun suggested.

Patch 2 builds the standard attrs from the workqueue flags instead of
picking one of three static arrays, which leaves alloc_and_link_pwqs()
with a single apply_workqueue_attrs_locked() call for every workqueue

No visible change intented for our workqueue users.

[1] https://lore.kernel.org/all/20260714-tejun1-v1-0-024d59241386@debian.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      workqueue: give percpu workqueues their own max_active
      workqueue: derive the standard attrs from the workqueue flags

 kernel/workqueue.c | 120 ++++++++++++++++++++++++++---------------------------
 1 file changed, 59 insertions(+), 61 deletions(-)
---
base-commit: f1639cde5f5c1bee25498ef988227ee8cf5ddb04
change-id: 20260910-realsplit_last_v2-3a73d7986db4

Best regards,
--  
Breno Leitao <leitao@debian.org>

