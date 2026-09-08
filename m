Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42142F8E91
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874919; cv=none; b=LDQv+PpgnkkDT2xoiYnW7bwnzJQ2NRtbogKorr3h0VObLNkQL5D81wcj6BFmL3+/Vh3w2I01EpYH6M031o9MFqP6V+47Qx4qUnnV1mGYmQsq1kfSU70iOrqw9OMb+99fr5wTDRGJvyoy4JhfZwlI06UrDVmw6vHtDTW4fRSNNXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874919; c=relaxed/simple;
	bh=wDM/C2iLMlGhOWS8ms+YRDtFyqA9wYNdgpqeYFK2a1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hEHhDYlcuP3pHYw+rdM+wjNeFmFOr2NEiDmykSIx4E21ad0m47hzWo9yPBgx2GpPPUoKrJeyfAZxCblTNP8bj/DKx8RH4ztbMUkswOf7TVqIFYj88DUp/7BL8xW4dxwTv0zlfoFFYtWM8/chagYa3w9QiCdwdfDSqKobraCjRJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=imQj+6UC; arc=none smtp.client-ip=95.215.58.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="imQj+6UC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wDM/C2iLMlGhOWS8ms+YRDtFyqA9wYNdgpqeYFK2a1c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788874904; v=1; x=1789479704;
 b=imQj+6UCtFZv9b6uSvTlhUcnNhE2MJymZc3g7kWsUlAyTiPbdICqyCEK8caqUMPFY1iimQ7M
 GnGAOl6RaGcuFV/P9nVexyePxDCgO9cc3HlC6633z5jJZ3V7f+zIDjImbw1xXf06UgQtmLB53YX
 7bnpwgs/rRx1MoPCtNjBre0s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e4cf5d51cedb5d4e;
	Tue, 08 Sep 2026 13:41:44 +0000
X-Mizu-Trace-ID: e4cf5d51cedb5d4e
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH v2 0/3] selftests/mm: pagemap_ioctl test fixes and cleanups
Date: Tue,  8 Sep 2026 21:41:14 +0800
Message-ID: <20260908134117.84405-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

This series fixes a size truncation bug in the pagemap_ioctl test that
breaks it on arm64 systems with 64K base pages, and applies two small
cleanups suggested during the review of the fix.

* From v1 [1]:
  - unify all size-related parameters and variables to size_t (David)
  - drop Gregory's R-b for patch #1 (as the content has changed too much)
    but thank you for that!
  - add patch #2 marking file-local symbols static (David)
  - add patch #3 initializing page sizes early (Andrew)

[1] https://lore.kernel.org/20260907135613.68692-1-zenghui.yu@linux.dev

Zenghui Yu (Huawei) (3):
  selftests/mm: fix size truncation in pagemap_ioctl test
  selftests/mm: mark file-local symbols of pagemap_ioctl.c static
  selftests/mm: init page sizes early in pagemap_ioctl test

 tools/testing/selftests/mm/pagemap_ioctl.c | 94 +++++++++++-----------
 1 file changed, 48 insertions(+), 46 deletions(-)

-- 
2.53.0

