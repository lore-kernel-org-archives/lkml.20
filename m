Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD336B903
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908629; cv=none; b=U6ce/0S/gPv+El5FuYk4O2rSZYuXUskHw4PgyWFzcBtKFVMfHYa01BTbm4rH5YIg1rWcerKrqcFi6urRWuHmASgCXvuHTSg1BkSWOKmo/b8CvV+MqFp0JGr2epACy58eOjAazdI/wURjfcwiNneEkJ+dcJ6trrRveMVQhNnEq78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908629; c=relaxed/simple;
	bh=9I5a0QMwrg3+lfQBpS9YxYe1Q1fOoYtS9mP3Zj5tR1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ART0u+0rM+TWvjUXPLmoBxpC1GGfaIFyP9fjfv4UB4+8wRO4Ehz+XQNqwXWDBdAYEwHuvE6rZUHF65FBY3vZlADU1tLJyME6VQiIziBL7wVhbRtrwNeWqYc7V5sFLX7/0sfkdDSE5pe6UlfqIsNYZ2uUofjf7PxbdN/hQ1uoO3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OPswyrSV; arc=none smtp.client-ip=95.215.58.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OPswyrSV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9I5a0QMwrg3+lfQBpS9YxYe1Q1fOoYtS9mP3Zj5tR1w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787908626; v=1; x=1788513426;
 b=OPswyrSV23p1kQx+0AD2+pSmu7AxIYDgi/rQLu9HWxvUR+UPJEI+j6R4jLprB4VIb5IsWYha
 ZI/VaBKC/N3Q/OAPcMH7RVHifdI8dRm3KsX8Mf3Qtdl9vJ+24JoT0ZMYDYNnH9u55dlz7CVh0Pz
 G/noVuvkAB2WVIbZBptL0iLE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f0b5d2dde67889ac;
	Fri, 28 Aug 2026 09:17:06 +0000
X-Mizu-Trace-ID: f0b5d2dde67889ac
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
Date: Fri, 28 Aug 2026 17:16:57 +0800
Message-ID: <20260828091659.358700-1-cui.tao@linux.dev>
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

