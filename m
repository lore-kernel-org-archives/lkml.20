Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8F4EC661
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535684; cv=none; b=nWpsLVAj6S9l789gMm9wYQatZ9cuEq07qyEhAa/SDaOfOQPhrLqDgogPP9oW5YYsrBAmTMzXOAUXOgvWof1ef+s+sDFmHmdXJmSgiG02yNO9d+Foa6ydw4htMVWRBw8uTG+04fsdRdds4uOLnmX2duMjBO6B/sGsRT4BHrR8+Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535684; c=relaxed/simple;
	bh=khWOV4nhtNatbdG5MbKsnk+RFqMS0aXqdoGb+Au4O0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9NnrJVYrplGc82tgON9ON8lw0Rg7PyTFEfYNQmsQxuhFh7bBo/21NNJZklWFTH9u/defnIkVap4yM58UnnGZf1hSc53TCGtC8O5bkNP+N+ppK7fQU0mOwVJyL0wkKurxHWsKlxi84P0hcrbFd3NPTxDWU/oOT3paKnLUiL1siA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jKxJP1lJ; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jKxJP1lJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=khWOV4nhtNatbdG5MbKsnk+RFqMS0aXqdoGb+Au4O0w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788535680; v=1; x=1789140480;
 b=jKxJP1lJrFjjelRnizRjNFUBDTuNWzt3kX+HdvT/UKAPwYNznbC/xZVNIIlN+gDCctsOBwqY
 bPmNdeCNydYZ2NV6pxjfn8+MGMtkhrE4HBhBwLyvLIqWEHQpkFZHThKQy7rpEfcSC1lUAAZz2+/
 xyEDz4vqMeMw8zR4zPn/og/g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 202a343dba7560ad;
	Fri, 04 Sep 2026 15:28:00 +0000
X-Mizu-Trace-ID: 202a343dba7560ad
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <kaitao.cheng@linux.dev>
Subject: [PATCH 0/2] fs/dax: Clean up busy page lookup helpers
Date: Fri,  4 Sep 2026 23:27:47 +0800
Message-ID: <20260904152749.84493-1-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dax_layout_busy_page() and dax_layout_busy_page_range() helpers were
originally exposed so filesystems could find pinned DAX pages before
changing file layouts. Filesystem callers now use dax_break_layout(),
which provides the complete operation, leaving no direct users of these
lookup helpers outside fs/dax.c.

Remove the unused whole-mapping wrapper and make the remaining range
helper private to fs/dax.c. This reduces the exported DAX interface with
no functional change.

Kaitao Cheng (2):
  fs/dax: Remove unused dax_layout_busy_page()
  fs/dax: Make dax_layout_busy_page_range() static

 fs/dax.c            | 24 ++++++++----------------
 include/linux/dax.h | 12 ------------
 2 files changed, 8 insertions(+), 28 deletions(-)

-- 
2.50.1 (Apple Git-155)

