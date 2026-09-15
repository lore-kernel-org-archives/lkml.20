Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0114BB80D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495930; cv=none; b=uR7Bxr+M15UWIdOm0BVE0JUIJIjhRHTY9Ibf8KYbBF8jsJ6gWiLPUstH4G3NRgeqRckbTeUTBLIt1h5DjBtUB8m7z8Bw54T2iMvwoJPqfW+AYsxyAHZCXtoGQiDcjv0ZDCSavQxBwNRyFWoocu29AR0v0c/H/fzk4x+VH9h0vSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495930; c=relaxed/simple;
	bh=ZN+Thtdtg2+bHXFcJicTOqBqq2f+0FCHcMs+TxxbEvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/bhCayiEiHzO3MBSmCN6HwDag51AscRCO+fpglmXjD+CWuSTT2YILiLTEIDpXTbebs/nK6hf5uciwkPXShXFd7GO0UbYiYsE4aXGHkZVaFIUFEX0PvONUeLg+aSqtLggbETZcNTe4ZPenx0v23+zWARk8Pe41Ygx9k7helYslA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NW5exL/E; arc=none smtp.client-ip=91.218.175.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NW5exL/E"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZN+Thtdtg2+bHXFcJicTOqBqq2f+0FCHcMs+TxxbEvI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789495926; v=1; x=1790100726;
 b=NW5exL/EsmrZb1a/tkECsbnlB4UNpmd/m0T1zkHZakGxRBnXtTBI9uW0FZ2LH9cwj7WvMvA1
 64NyMqme4gHEdzWg7HM1xRtKRIjKCxy6OHAl6ZMtz9pIEJyA0LkBo+3Oo/tDB76x0CHMxyzQ8rw
 FymUJ43RojjhKlpVa4SoNLZQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27d9ac50e330eebb;
	Tue, 15 Sep 2026 18:12:06 +0000
X-Mizu-Trace-ID: 27d9ac50e330eebb
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/3] HID: asus: improve the driver support for laptops
Date: Tue, 15 Sep 2026 18:11:57 +0000
Message-ID: <20260915181200.18086-1-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Antheas has requested reviewing the XG mobile patch on this cycle so
I am re-submotting a modified version that is a bit cleaner because
it uses LED_CORE_SUSPENDRESUME instead of re-sending the LED state
manually on resume, but it's functionally equivalent.

I also included a patch to fix a pre-existing issue that was flagged
by sashiko-bot, albeit I'm not entirely sure if it can really happen
in practice, though it is safer to handle it correctly given the
actual code change is so small and leaving it documented helps future
changes.

I also moved some code to reduce nesting and improve the resume path
on ROG ally and other N-KEY devices.

Best regards,
Denis Benato

Denis Benato (3):
  HID: asus: document and harden the worker teardown
  HID: asus: reinitialize the device after exiting a sleep state
  HID: asus: add support for xgm led

 drivers/hid/hid-asus.c | 145 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 135 insertions(+), 10 deletions(-)

-- 
2.47.3

