Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA704A015B;
	Wed,  2 Sep 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362663; cv=none; b=FWBNQqI8FgdMLc4l77TSDyJG0Fm7UpCmC5G9qAFE7IvdI9lVOoCWxV9NxUPeBFwZP5ipHbQSezCr5uT8arCwCIRVV7xqkrl+3pdzQzexT6EE2qJJkwBGeK53b4hkhNiWlPmifDJ3OlquSX8sm4g1h0bFb9UlbQW8CU4n50m0ldE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362663; c=relaxed/simple;
	bh=3+cckX94u0nxtOnlc4tOiUV1Pr4QQo4gA1vrdYrsOlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YGhZ3OlYd17DdzvhCpxM8U8sK4N0vyHOGleJdvy6/BLrBGaZdZws0a2LFgkrQ/svWTKqM4Qd805DerJLkfa6ZTDbkEoAYKjVO0mmjqGvHArY95msdUZvF4/08ZBuL/L2nRxhiwqoJBd7J9ABGCjxm68nu3FXdhjWuZIIntBPucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=P+pU8I64; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Z6ATPzeP; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="P+pU8I64";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Z6ATPzeP"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hZmjb38GpzKmTr;
	Wed, 02 Sep 2026 17:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788362659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wjBje/KFV1Sml0wtdUTK7NRrAEQ7HaA06Bpw7iU4znA=;
	b=P+pU8I64/YzT1ptN5r0xo3zWPioDdM92Hy2Ancv10qrrgrj9N5/DYeueNUiDhZIlOPQXVT
	z+dIxVKPNuTjBjjMQ7JRntMlFw2a7QdpkdtgeTiTRwASjoRzrdwwiVbLuRPBjph2nM62dU
	hAxZohGwGI5nxDOPpLjg6DaMefYrHtr2MJs02fY7DIfIdhr9r7z6Sa0pxj7w0b1Sn6JVZb
	AK+w0C47zgI3jvupm3HS72h5XBgUeFd2txVWMix9NCtt/vUyy23h0soaYpDj/jBgysVZZQ
	Wce0be1bxHOb/eRsGw1cbEi6d9MuLCnrKIXzWTv5ik7mJsTKOQBgr2v9+uBCRw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788362658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wjBje/KFV1Sml0wtdUTK7NRrAEQ7HaA06Bpw7iU4znA=;
	b=Z6ATPzePoFX6gva05LDtPw+F3y+fx7FW/OBldTkyofW+vCwA/Y94xh9x9mVITqgjtzn3t5
	GsVj+kOkqJU5H82NX9X3GyqMysi86iRLJBc1VvsewAAXKH4HUAPPg8UbWtaTLzgX4KKbH9
	PHKG4VQ8+uYQMCp5TbkivsASK8b2eEAzU2jd9hfI9q4fYWlVqsRwhXmXsQ/cpVHTBX/LHp
	1iIgiuaRe/mafl9LD6Mg/dG9i7kqDBIFxbEp88g83DiSruRJIJh5aqeLDT82XyVGuZkV1m
	fhtDkaUrXbSLQoVxd8gw/hF1/3LKbokxW/tnDrrRWMmn98ZSv4TJNr8HrMPQcg==
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: admin-guide: Fix bracket
Date: Wed,  2 Sep 2026 17:23:47 +0200
Message-ID: <20260902152347.708070-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5b8ti7wdu137crny6pbb88wff1qcbep7
X-MBO-RS-ID: 2e771efcf8e80c989d1

Add missing ')'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/admin-guide/sysctl/vm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 5b318d17a..ebc281e6d 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -438,7 +438,7 @@ zone[i]'s protection[j] is calculated by following expression::
     = (total sums of managed_pages from zone[i+1] to zone[j] on the node)
       / lowmem_reserve_ratio[i];
   (i = j):
-     (should not be protected. = 0;
+     (should not be protected. = 0;)
   (i > j):
      (not necessary, but looks 0)
 
-- 
2.54.0

