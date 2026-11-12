Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488299;
	b=cExOanxASZ/EZPJgpHBhOnp5gIbSC4AULwnrnqZlOysxUwqehfzNYf7HtR+L2NYgbbBd
	 uXUaMfD/pNnynIrCf3BBCa5c772EmmD6orIfdm9/fvoJ4WclRYAvdcezai2xn0uSOwuL5
	 iXMa/OEyGjdn9gtNgr2X8EIiF3WUEoqVdN6oXgKZIidXLSXu9ai5n2nT+rfyBDD4tS6qm
	 MXwI9Y9StXfe4TUW39OvNKrIrsm4iUGDf6mJ3S8psoAOZXlkBrUGXxuFz4oKZaVKQRcI3
	 IOJD7dA67/RPuxwdayAmJoNKM18iVnwxV/YTbrIaj3t0+MfGK2JOptZNpVZozDtD7Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488299;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DGPXITXdeh70KPetjF6F96KspBG9wr+UCHeX9/qigkk=;
	b=0B1TaUt74CVNA8bLTq9x8h4lz9lGP5IXMJAzz1yTkREZOp5cb0IEZxkMBztPANfM8nVL
	 JgeIew9TqbTBXGOG5zX7wVnT4Bg+Iu0BkyPcEyk05pLadQsbyG5nuwO5W+PyX7aBFLKRg
	 pUQD1mYIuBqKijQdnXfeH30TYxs5V6bmkQ/wYKLaZUDJKz/D813ocZwHhqlzzaQWuQvGD
	 tdzxAaEG4SAGouZhlqAmiVBDdTIIKa6gf8TYVoLZ/ekq/kQ3UKW6LL8TDD0b88HqdlBNI
	 nwQ/NFb9mtF/qeWOkJULIrZu8mGdpwtfT5q/CIx63jw4gvwW8xv7yrgwH9ZvEnr8okA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="W/9XjxEZ";
	arc=none smtp.remote-ip=91.218.175.238
Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CE1606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CE1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W/9XjxEZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MRWB/iNhy2/F1l9+rCKRhIaHK6gdy+Rx8uuqx60BjtM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794488295; v=1; x=1795093095;
 b=W/9XjxEZXlEz6vu7Qr2m59K+huemuJJih1F0Fnz2mj3PldFiX8SO4Bl8XlT1wESZwGxVZP1Y
 HhCSDx9nJu5eHQX4pwlyb462ekV2q7LaZGgaCbWlw1rVpmb64/FYi0wJvn/VO/lxAzo1bldle6S
 LP7DdQZRII3Bmf8aklrinx6s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5344362e3ada360d;
	Thu, 12 Nov 2026 12:58:14 +0000
X-Mizu-Trace-ID: 5344362e3ada360d
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: David Hildenbrand <david@kernel.org>
Cc: Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	ljs@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/2] mm/ksm: clean up scan_get_next_rmap_item() initialization
Date: Thu, 12 Nov 2026 20:57:54 +0800
Message-Id: <20261112125754.176930-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, scan_get_next_rmap_item() has grown quite large and complex.
When introducing new features, such as the only-merge-zero-page mode we
are currently working on, we don't want to add more complexity to it
and don't want to touch rmap_item structures to avoid unnecessary overhead,
so we need to extract some common logic.

With these changes, the entry of scan_get_next_rmap_item() becomes much
cleaner and easier to follow, instead of being cluttered with unrelated
boilerplate such as stale stable_node pruning and cycle initialization.

Let's start by cleaning up these two parts at the beginning (where I think
abstraction is necessary), and we can continue cleaning up further if
needed later.


Xu Xin (vivo) (2):
  mm/ksm: extract helper functions for scan cycle cleanup
  mm/ksm: add initialization helpers for scan_get_next_rmap_item()

 mm/ksm.c | 126 ++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 79 insertions(+), 47 deletions(-)

-- 
2.34.1

