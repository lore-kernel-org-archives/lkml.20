Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010844A7CBE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636912; cv=none; b=RzrYR0OT1R4o9IoOEIhjfuT85KiYOI22lhdv7lTb/ooU6tceWmpeIr3qtP081N9qW5kQuL7HnQoM8/FPS7uYcTJ4Xy5T7r6PgkgAOM3BD9P1N8Krbmvorsn1toYxWQMFG80+41LgwF8y6skTRrJ+ttjYHjjsGepNImnOjLmwqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636912; c=relaxed/simple;
	bh=PZpPmnrmFPtO6uTY0bPCBH0fo8mLjoh8EhNhwyThCL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H02sleCV+rgsaUKThmDUFWFEcCIhI7bTaxmm97rtWpz5nuhJQH/tYvvIzjHijxS2c48fOykTFRSN1vJ+uv9V2xNQ6mhc9vSZWLpfYhhnWXpK2TYhG2k/+kJdQRM6Ux53hQ588BsAoNRiLchcxc2vfuUHgblM23gNfc4UHET+hXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ly/AzZwf; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ly/AzZwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pV
	9D1WCS8Ulhq6sFgdxPfnRzeCFcOs1g7mYcf8YKpEo=; b=ly/AzZwfxHDUJogido
	fhhegLyvBlie9mBMbi7L0SVPckNVpQi25A3ODVOHaSfOORP/XppdfRVA1u5bTy4T
	TZrYF+ImtXtI/tsdYlBhjmrqPVJAV3OHVTnV0K5GdTGabz9XBmsFpa6LbakZh8kQ
	EZ3pWTRYLbQO3mvwEhzvg/dHo=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDXOfcMsatqdhQkSA--.64230S2;
	Thu, 17 Sep 2026 17:21:16 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] kthread: Report cpumask allocation failure without warning
Date: Thu, 17 Sep 2026 17:21:16 +0800
Message-ID: <20260917092116.388262-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aqqR-up8wovbEsv7@localhost.localdomain>
References: <20260915014222.13423-2-quchaosheng000406@163.com> <aqqR-up8wovbEsv7@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDXOfcMsatqdhQkSA--.64230S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4rAFyUCr18JrWDKF1xXwb_yoWkCrbE9r
	yDtr4xuay7Cr1Iyr4DKF4xXF97GFWjvry5Xa95urnxt34jka1xWF1DtrnxAwn5JanY9ry3
	G3WrZ3W8Ca9F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjqYLPUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC4wz0amqrsQy35QAA3f

Hi Frederic,

Thanks for looking at it.

You are right that pr_warn_once() is easy to miss, and that this matters
least at boot under memory pressure. The case I was worried about is the
WARN itself: __warn() taints the kernel and calls check_panic_on_warn(), so
on a box running panic_on_warn=1 a recoverable allocation failure turns
into a panic. That said, the allocation is GFP_KERNEL on a path that runs
once per thread and almost always at boot, so if you would rather keep the
warning as it is, I am fine with that. It is your call and I will not push
it further.

Two things I should mention, since you are the maintainer here:

1. I am not going to re-send this. Waiman said the patch looked good to
   him, but you are the one who would take it, and "mildly convinced" is
   not an ack. If you want a revision with the message kept as WARN, say so
   and I will send one; otherwise please just drop it.

2. This was prepared with an LLM coding assistant and should have carried
   an "Assisted-by: LLM" tag per
   Documentation/process/coding-assistants.rst. It did not, and I am adding
   the tag on anything I send from now on.

Sorry for the extra round trip.

Quchaosheng

