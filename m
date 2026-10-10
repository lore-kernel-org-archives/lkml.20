Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C5D391E60
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791659437; cv=none; b=dpcEVH2htUBp9bAgIELzBQLcoX6Q+YcuLQXKJ8CBzTKkjtxS+7LD7Sth1YhT1LJFYdlLf9ZwW6eh2T97zjBGQJNYF4rVtlXJ/7G6ubCQ2OFaug59SqzAT6+FvQ1RsOyOP2mHFpV/rRIKTgGx/my2VriRoAWuD7OQJNLM8nI72Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791659437; c=relaxed/simple;
	bh=awjdtHzdvRtnEfgvFMsm8k9DOKmErrjpCal2ijjHmWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ucIGj4UEnGPlvFg2Pzk/qSWDSB3FlPQHC+fMDqOaK+ktnryMGNZAwGKTTeXMTInhTiWWawjF10lp+sjjC4rhShfKaW4s/36Lmo260MbWEiH/EYN8RdSsWYrCUbhgwtEGvMLkMr+vdDj/q0ED36RZL0BCHVIQETN1gV4bVVqWqo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=bAAgH/Rt; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="bAAgH/Rt"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e5c8f53a9so61829685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1791659435; x=1792264235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sePYJd1IcAwgM9NvQ3Wm/mXj27dl2KtQ+o9Z69cf6Y0=;
        b=bAAgH/RtUa/jmSbzD+WrInwMpF+6yGUvKk26GHHL7EJhEEAHNPDo8mVAM28kggOmKI
         JTe1DjCpX+BBsf/ZZrIscZXq+y3P3Fpay7Er94WfEgJImVgoPUmRbAOhZaZNTYOjJhyJ
         /Gn/LQ3K+sTdH94+tMwXW1L9I1CNdD57KGkSbgtVvMWfqy9BSYFCaKRrnTV2swpmDbwc
         LJOjtseKxAssoPjDyOUKqQLZVdcNfaATXPnwQ7+nUJgVe79vwqoKe6NGNvcC740PgMct
         zQeEzG5MZFD2cJXVA/3Z+HgvDejWM74jXc5GM6FEc7bWo2RmWWRaNpFVeuP9M84POBEZ
         1b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791659435; x=1792264235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sePYJd1IcAwgM9NvQ3Wm/mXj27dl2KtQ+o9Z69cf6Y0=;
        b=nMuK52wq/Ey5l4mpUjO87LfSvc62HCYGQLn5mt78Opl/X6eYi1obkyqLs6qjCkCQ4f
         7MOA90dy4tZan/QE62C6A4tdNz2iJ1j90NMIIsEPTy+1R1bUCeShlJmWkDJ9EnrNlHO4
         BkVbag/Brlq28UFdY/qqxWRkm0VviOBzEgDbw5i/uONq6rUy+hf3iFQ5bJEihOX6CpQa
         iGXtTaKfYQIN3OYAEYL82bgB6dPyESbqRMPGeq7wYrx3Dot7p24Lok6vLb/kgipFeRJH
         W0j0ijzpXT9WJE4DtgjqqkUkE3ay9p6x+/bL5rlAwNyDiVWRt12cjA+DnQytLUalVPQM
         4BAA==
X-Forwarded-Encrypted: i=1; AKwUvBxRXX4gc/i9wUNZsGnEQSAxkovDqW5Bus3ebsbr77hb+2vPX7zqCa6chla23sCgyxQbCBFhX/b0+YEq7d4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe2KcunAPyEHReiv/Pk42xt6JoLNOxpXLmE+KOA+fOqWmButcD
	00gGTGgv4pKLr5PUXTlOxyUQbiG+Gf3W+RWjbC2b2SWveL0w2iSqnsq4jgKxxhVr4p8=
X-Gm-Gg: AYBFou0sJOkt7a58CtIIn+hS9loyC93f+E6tDyHCUYZM/t8B1KC74KNBuSIzHKMQ8bP
	rvbHBr/MN9sCOq7Hw9dTRdBb+9f4ggHBg2zrazMYmIfRXUjCNO0ZITmFZ7yElotxdoyqchc3yqf
	QuXmqpyXuzpCLCuwsnhpipmFs3qD7LQSh+Z1LectJYHCAmajbR9aldX0yl2d6hjx/g8299/99tU
	GNrsPYrhZlDXizg6puf8kzc17RYPGa1MUHl7uRt3jOP3dgTigWe0aja8ouzjYNNFBnElnbN4DjL
	dtU8GM9H5AQEvlcpavjPZc/1ma9xwsPEectWZHrsaS6XZTtTMjImw86NhUm78qCxoEYEB6U0/F1
	JCgruzzSo2FVwWF7BhooUTxKFWkyvNwOUi4RoR3KV8u08q6cEsJ5CebbagHsOnp9AI6oac19KwQ
	veS39GkHTzcqfPXArHdQxIAj+e9imWcYh78F7Z/Zdta90Y5TFA8NNyNEH4oUFTTcXmKuC5devA4
	u/O775aaA3KuLvwtmWVHTaOOSL2BUo+Ia1XwPoWSQ==
X-Received: by 2002:a05:620a:618c:b0:93c:8544:6adb with SMTP id af79cd13be357-93ebd228f75mr909689285a.22.1791659434752;
        Sat, 10 Oct 2026 12:10:34 -0700 (PDT)
Received: from boomzilla (dynamic-acs-24-101-237-49.zoominternet.net. [24.101.237.49])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0cfsm489355685a.19.2026.10.10.12.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:10:34 -0700 (PDT)
From: Karlos Abel <kabel@voidship.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH v2 0/2] Input: discard pre-registration events and test state seeding
Date: Sat, 10 Oct 2026 15:10:31 -0400
Message-ID: <20261010191033.23577-1-kabel@voidship.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series prevents input handlers from receiving buffered initialization
events after device registration. On a ThinkPad T14 Gen 6, a later LED
update flushed a stale SW_RFKILL_ALL event seeded by thinkpad_acpi.
The fix drops the pending events and their timestamp before handlers
attach, while retaining the seeded switch and absolute-axis state.

Patch 1 contains the six-line runtime fix. Patch 2 adds KUnit coverage for
registration with and without event-buffer resizing. The test uses a
virtual SW_DOCK device and performs no real radio operations.

Tested on mainline 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0 (7.3.0-rc6):
 - Tests alone on the unmodified input core: four pass, two fail.
   The non-resizing case replays one stale switch event; both cases
   retain the initialization timestamp.
 - Patch 1 alone: all four existing input-core tests pass.
 - Both patches: all six input-core tests pass.
Both source commits were built and tested under UML without compiler
warnings. The revised tests repeat the same failing/passing comparison.

The same runtime fix was also tested with QEMU/KVM on Arch 7.2.7 and on
the ThinkPad.

AI assistance: OpenAI Codex assisted source analysis, the fix, regression
tests and this text. The submitter performed the physical hardware
comparisons.

Previous version:
 Message-ID: <20261010180031.7-1-kabel@voidship.net>
Review addressed:
 Message-ID: <sashiko-outbox-166792@kernel.org>

Changes in v2:
 - Patch 1 is unchanged.
 - Patch 2 checks absinfo allocation before event seeding and unregisters
   its handler before its device, addressing Sashiko's review of v1.
 - Forced allocation failure now reaches the explicit check and cleanup.
   A forced teardown interleaving reproduced unintended binding after
   actual allocator address reuse; handler-first cleanup prevents it.

Karlos Abel (2):
  Input: discard pre-registration events before attaching handlers
  Input: test state seeding across device registration

 drivers/input/input.c            |   6 ++
 drivers/input/tests/input_test.c | 171 +++++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+)


base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
