Received: from mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81E3909A6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908585; cv=none; b=DA9kLG/XMPFHujpJsl4/BLUU7wUPBo34cx1OpN8xQnG9/H7Xkd7uBO5NRlmZFGq1VZ2//n73fS1rxeTkw7vAu3PH04MywkR2skjGB6BRO2zTXfE54lrvLQPFf0rGySZPC4UviDwWvl1l4kTbQov6RdnSWzZ3lysDtgkqDg5otiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908585; c=relaxed/simple;
	bh=9I5a0QMwrg3+lfQBpS9YxYe1Q1fOoYtS9mP3Zj5tR1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNUS+UHmDIJnW/essZ7JZjUs08jPr5dqtpTc2blR5VaFQTC+AXbGNFFrbuWU5ucgB+51p5c3xI//dLKoBmBdEkMxgYJ2WzZWDVlFFaKoT8Ud7x1hG1sw/POaz4YISd/TojjLuKek6Y4D3BxVr+suw7vQ4ZZZlacaOJQNrhyhzRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lIVvUB4Y; arc=none smtp.client-ip=91.218.175.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lIVvUB4Y"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9I5a0QMwrg3+lfQBpS9YxYe1Q1fOoYtS9mP3Zj5tR1w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787908581; v=1; x=1788513381;
 b=lIVvUB4YMo3uPe1D7nqoUn11GUPMHqqTrNu5WmyEUVt9RnyBcjqcmEeLyCwM1yF9RXg1SGvh
 sJjbJIjXTXHQqzkMEqyZBhs2bWK4tD0q49izYlWoXkCITFbaIcbdYYloAhNyklBvGj7aV1tSEk9
 npydJpaX/fKqqIngMVzicMRk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 447f46f21982bf76;
	Fri, 28 Aug 2026 09:16:21 +0000
X-Mizu-Trace-ID: 447f46f21982bf76
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: brauner@kernel.org
Cc: jack@suse.cz,
	kees@kernel.org,
	cyphar@cyphar.com,
	containers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cuitao@kylinos.cn,
	cui.tao@linux.dev
Subject: [PATCH 0/2] userns: clean up dead code on error paths
Date: Fri, 28 Aug 2026 17:16:04 +0800
Message-ID: <20260828091606.358577-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

Two small cleanups on the create_user_ns() and map_write() error
paths.  Both remove code that provably cannot have an effect; no
behavior change.

  user_namespace.c:164-167: the key_put() at fail_keyring has been
  dead since it was copy-pasted from free_user_ns() in 2016
  (dbec28460a89); persistent_keyring_register is only ever assigned
  lazily from key_get_persistent(), long after create_user_ns().

  user_namespace.c:1110-1112: the map clearing at the out: label of
  map_write() only ever zeroes an already-zero map; the destination
  map is untouched on every error path, and a second write to a
  mapped namespace is rejected before parsing.

Compile-tested and A/B-tested on next-20260827: identical behavior
on vanilla and patched kernels for single-write map failures,
recovery writes and 300 rounds of userns create/destroy.

Tao Cui (2):
  userns: remove dead key_put() on the create_user_ns() error path
  userns: don't clear the install target map on map_write() failure

 kernel/user_namespace.c | 6 ------
 1 file changed, 6 deletions(-)

-- 
2.43.0

