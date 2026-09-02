Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053694A3861;
	Wed,  2 Sep 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360201; cv=none; b=tTaop3WRXq3hpUgQU4zq1L12PaD9bCeHy97zhYOul83CwWI3n5UM4RT3+SUaU6QJvvStpIvkr2WKc0E47iBI+YIc/ZvQpOE5aXIHw36OPF9APYB/w+MaMd3tDYu9YDugLswGhASkVq20JxFxdV1CdkRyyp8PMqSs1xMOVucDlOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360201; c=relaxed/simple;
	bh=opFO7iJOrq2ce0vBjhf9nbYMVOiJwsNJ8ADhU0h0Vwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZW9omCrZVGcVj26UXMmR1Gwi+Q6H7YpvcNHOXQ9db7mx5lHDM2GzaHIErdk7a/unU0iWVuPwZqK7MTTj4iGB7MHmGBTeGTaEesih4Zh7krwacofZdH/OAkdBdSCe2XGnP1zbwPVGT7d8n7A946mN6mIUKiau0CKk22ZIYkR7Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=h8sTh7np; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EemK+nMB; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="h8sTh7np";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EemK+nMB"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hZlpF53JKzMlKd;
	Wed, 02 Sep 2026 16:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788360197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cx2p5C+rhglBpbGlOUs8jdNLZ4ugjYN9xOnFffuZOMw=;
	b=h8sTh7npH9L9pisI+pt/jksFTHAZ9th4D5tE7TodZMk2MabSqZ5FRNkM8H9BFbweb3SewH
	SK6nkoPtZdTJHpvh+VQ4iMldLL4f5jOgqDfqXbCsNL4iBx/L5eksPKpwioFjZHrBlTk5z2
	uU4BLpZYuZaqvIpW7oRUFD29OXmEpP5qARgN/gTJgj93U4G8Jrp57TeTNDAqKhgf2ZYuS/
	AWVO6EGcU+mSb6IR3NEW3uz9tG6921gCNo7cng8BxK7SKn+2oz7aQTx2KO9RQRd3eZfw7y
	ZrNFSXsd/XScKYw1gN1PsBggq74SrJzWHIkeuCDVTZCIYbG8YNV+sAhSzsn8nA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EemK+nMB;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788360196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cx2p5C+rhglBpbGlOUs8jdNLZ4ugjYN9xOnFffuZOMw=;
	b=EemK+nMBB2XgxL1u/DkHb3XBXVSKJ7HW4xk3tiMf6Dse4nzhWZUg8jU6KDpR1Ouakf2fSw
	L3d3EPnop0MUQJK904fuznmqlWkT7ONAI2dlNRytrWde/e58KwuFYzwZAh7090A7AWokXD
	JRgC9BDwU9Je2QDB13Bn4D3LxRh61Tru2Ng3xQkDqeruHBlZJwK9zUxJoqY8bsQWDjESpB
	bhOW0iOR6UgMn9PVth5tvqw72mGd6/P2Ud/OwKcbHwBBPTR8y8ALwWhu9oXCLEkeAoKbEH
	nfdjz4QaThrl8TPhAP/mEq2fProoBflCV1m9Mf6Y6f1YlM1JyF0M+GWxsJRhkw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: doc: add bracket
Date: Wed,  2 Sep 2026 16:42:09 +0200
Message-ID: <20260902144210.703915-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4dc3f53bd6583873aef
X-MBO-RS-META: 156npu9wbjw6d6go6o9x9f43zhu5swy5
X-Rspamd-Queue-Id: 4hZlpF53JKzMlKd

Add missing ')' to sentence.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/filesystems/mmap_prepare.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/filesystems/mmap_prepare.rst
index 82c99c95a..0482c21b4 100644
--- a/Documentation/filesystems/mmap_prepare.rst
+++ b/Documentation/filesystems/mmap_prepare.rst
@@ -114,7 +114,7 @@ VMA Flags
 Along with ``mmap_prepare``, VMA flags have undergone an overhaul. Where before
 you would invoke one of vm_flags_init(), vm_flags_reset(), vm_flags_set(),
 vm_flags_clear(), and vm_flags_mod() to modify flags (and to have the
-locking done correctly for you, this is no longer necessary.
+locking done correctly for you), this is no longer necessary.
 
 Also, the legacy approach of specifying VMA flags via ``VM_READ``, ``VM_WRITE``,
 etc. - i.e. using a ``-VM_xxx``- macro has changed too.
-- 
2.54.0

