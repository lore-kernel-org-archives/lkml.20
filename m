Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F476383306
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018551; cv=none; b=T8QWYI2AWNXYwkMcIQYHhUaShU4GzVsvEzw+10w4FfFZ27UQIgjkYp6GVN7kr4iQijkX/y+Z1laVoCrCHv8/x3USB5qyjplJwI8fO459DO1tQ2sBK21RAeV0kckZkq2nAYN+jm0dBnUJSfwJuMo7FXl98w4zJlgWnS1NcwDPmec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018551; c=relaxed/simple;
	bh=FORjZ+fzBUQoGWjjV47sA34KGPbyAZucnZ7k2MeTYmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmIjmUoQUpIgL1uV65YYF9at7zNDjJcI5+xSlYBDYSg9MMS3G/Rp8AGTDpg0qMmpvkDcE+Epr+ioBy7IdWD3JnafFnmf89072UQrCaHK5VLe+ufsyc9OCuuTm3VDN5vH04CRG8gPdqnE0cBvHZseBc4tQbkp7GVkPkpsok/zak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=EAaAI3Wj; arc=none smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="EAaAI3Wj"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c25541acec6so212903266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790018541; x=1790623341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GF+AtI+XGFI4gbDHylpglKuu+gz0u51gNx6gyLy45VM=;
        b=EAaAI3Wj4aA3+4ZIfFnJ2r8CIUQ87UD4MO0629kiC8amQmzQ/Q0xQRJkzbboAfBHGn
         Jtk2zJufVOYzP9rAeKccZ4O6D3+FVQIbqCl0/5xsXGPCLXHw/ImTI4nlk1dG8Hxpjl0D
         gOpxwKRHJ72le7vE6zQXDaSRMyE2EGyT4qGXeBrc8a7Grr6ZpkMTF16jqucpsYl4hUrl
         QrXG5HqTeYp2fChYtvhqj9XyYeVgXQwsd4mNhf1L9hPDm0v+opKJB4J5UG3upySi25v+
         2RelkaEHP7AO2x0m3FgrPwRqrO3GF3BRCGRURawvXZnq6rK7Kc2YZyDfzSgcF97N3HmX
         /CWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018541; x=1790623341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GF+AtI+XGFI4gbDHylpglKuu+gz0u51gNx6gyLy45VM=;
        b=Cvh6qVU4JIbdJi2s+Duu5XcTD3CkKVt9Ixn2Ycs14iSBeEwIGtiCgYrwWi3EJNlPH7
         v9CZtw4nQQJjFUW1qUTDoGSCdzrGUo1+F8yfymq4zX5UrvUOPPoNQOktfQSa3c2O3kP9
         L3r7bxudiMgOZEOvlSP4xzsRQJdTI4gqvt6KiGEfsspXTJ+ja4QJ7t9gXmlQDcdg0PVv
         lAUwz699Er2wl9rg/u1CYcio9JdEm0sIQQ5MO7wC/jdLLLKEQ7nzAEVdJbnQDLF9Ollm
         E1rl1thHG+mP3RUPu/RULLtgSgKAW9Yhu3kWRIAgOWURwPDBZykqKCl35fQspCXXcpkp
         N1Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxex57fBh3jVbEVAIMTHDhPiheghPK0QP6IOSsTzyMh0Zx3EqIhDsJbYv4g3SqOB5/97GZ0dHn9b3MfaHU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHHlNaSynRQie9V1+QKSg02OHBrKuy9r7Kbdb2NgLqPBzB8bEr
	6GzT9q3TbARmLRNf5jP6H+0YkRncbcbJd4CZcJF26GWvlRk6IiWXGTFYnQ7992a9dm2FDA5P1wM
	178qIURTmAgw=
X-Gm-Gg: AYBFou23+hjJCaWYqVwPPx/08WTubo71NoNUKLf4B3IyGl9hWHF/1gv2d7Nb0d9j2WZ
	DKL9NySFl1rI00B/eQo4HoMJTGxwNo66rIsp1qVrZJsRNjLxaL5yNYZaDAjSIdVCWcX4Z4HH/p1
	BjimjuQdlR3NO33NZb3gpqAko/jfyJDlX7BrnZJoY2I7Qd5UZ9oWwH87v95W0dXpFti0zaeVbvY
	30wS8JEVO0j30vx8jZmFFbIp5oX0l01bZx+Gjk8DGWSv/kAahlFrhdwxMnfmF/+JZT7bFigNswl
	yqkF9JgkRS/XU7Kwg3xUs4Wv5WdNLIJYCV9l9L7EFG2LgG/A4HgLEQh9UxM6G6ZYHz6VX2S11ER
	gXQqHt65xq/swFnzC8mhM51+YvFWgWWA5DLXYHNIDwqHhPXNbdUxtra6gt1pYIBA4IZoilBomm/
	SAaLhcPQRRCh08swtTQrpqogiFzNSQYqYxhGEyjA==
X-Received: by 2002:a17:906:c155:b0:c29:63f2:99bb with SMTP id a640c23a62f3a-c2a15d12004mr1081031466b.47.1790018541023;
        Mon, 21 Sep 2026 12:22:21 -0700 (PDT)
Received: from cachyos ([151.38.78.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm341089066b.47.2026.09.21.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:22:20 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cenzhang@linux.microsoft.com
Subject: [PATCH 1/4] fs/ntfs3: validate dirty page open attribute offsets
Date: Mon, 21 Sep 2026 21:21:36 +0200
Message-ID: <20260921192157.102738-2-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921192157.102738-1-giulia@bynar.io>
References: <20260921192157.102738-1-giulia@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dirty-page walk in log_replay() uses dp->target_attr as a byte
offset into the open attribute table without validating it first.
Checking oe->next already dereferences the unchecked pointer.

A malformed dirty-page entry can select the table header, the middle
of an entry, or data beyond the table. The lookup can then read an
invalid entry and follow a bogus attribute pointer.

A crafted table dump containing a fake open attribute entry at
bytes_per_rt(oatbl), within the larger dump buffer, produced the
following on x86-64 before the fix:

 KASAN: maybe wild-memory-access in range
        [0x4141414141414148-0x414141414141414f]
 RIP: 0010:log_replay+0xa698/0xe690
 Call Trace:
  ntfs_loadlog_and_replay+0x3e0/0x500
  ntfs_fill_super+0x1fd3/0x4510
  ...

Require the offset to be at or beyond the end of the table header,
below the logical table size, and aligned to the table's entry size.
Also require that each entry can hold an OPEN_ATTR_ENRTY; together
these checks keep the whole selected entry within the table. Reject
invalid offsets with -EINVAL, as the redo lookup does. Keep the existing
handling of unallocated entries and NULL attribute pointers.

This lookup uses dirty-page table entries and is separate from the
redo and undo log-record lookups discussed in the linked report.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260901174934.6275-1-cenzhang@linux.microsoft.com/
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23e..8ac0dbd2f07f 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4987,6 +4987,15 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	if (!dp)
 		goto do_redo_1;
 
+	t32 = le32_to_cpu(dp->target_attr);
+	t16 = le16_to_cpu(oatbl->size);
+	if (t16 < sizeof(*oe) || t32 < sizeof(*oatbl) ||
+	    t32 >= bytes_per_rt(oatbl) ||
+	    (t32 - sizeof(*oatbl)) % t16) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	oe = Add2Ptr(oatbl, le32_to_cpu(dp->target_attr));
 
 	if (oe->next != RESTART_ENTRY_ALLOCATED_LE)
 		goto next_dirty_page;
-- 
2.55.0
