Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E044E8DE4;
	Thu,  3 Sep 2026 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450774; cv=none; b=QkeWiL/WaKFyynVz/YWLCqHrIMC28y9l59spWmmNVPTm506209ILfLZ+zyCzp/wVxj3PYs+CWo779YtN/flE88DarXgPxEcBm//zRgvSjpQogeAL9bsazP0dMb4yMYppBu3svldtf0xIHViq1LHftBYfx9gpoNcobPjKmUFaMLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450774; c=relaxed/simple;
	bh=p7ES8nwIovp7xHlhYDOkL6N7GK0us3k/IN7/+Bc8UI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F4F0fO9AA9migakidP+XOg3NAQqeBPxFAkRvki1R3r8Z59/wMG2DfJkfS/IB3r/DikXF5kyiejR3n/F/mDEgAIGusIT/+Pxk9GO560jCqOChooY7chC4Er3aZ+dklSat4GNcfJ2CE8hh4ZQS4m0KalxXi7HZKKQYVJOsUNQXm9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=P1RSSFU7; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tpu6Skg5; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="P1RSSFU7";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tpu6Skg5"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hbPJ22FDpzMlBv;
	Thu, 03 Sep 2026 17:52:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788450770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8w1bDeRMYm/x/2RMHKo/3hs5sGJ7Q4oB0MBXtAICmD8=;
	b=P1RSSFU7xwNzLTo6mn7Fvp1fsU0yy/xX2B0RymWVtHvBVEoVFnGGFF8uyKSjuwEZZo+zQB
	YesTj/t80Q3i/n4m1BAybj9MjH59Tx07QXILuojwBxGd3UxCpH+RzSqzlWpl1HGvCtxTGs
	lmL0nVgN+UuL5vt6ozTeESBRLQtex6wFtZnlduslHIMHLOS98kHVn9xL1Quz4au8idVBDD
	HCpKu7fJgwLLTMhJ6gSK2bCoStHKvLsER/W4MEMCzpM+ntQLF3iRAnldM7oIP7LjxzyOXH
	Ns5mvQVLFeDOQE+aZMGLNoWOEauIKXoRo5LLsBtkf4LSq5UomA69tIDCEwHnZQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tpu6Skg5;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788450768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8w1bDeRMYm/x/2RMHKo/3hs5sGJ7Q4oB0MBXtAICmD8=;
	b=tpu6Skg53kBHG29fhfhHIW5sTRJMkgdobAUQsoM+OkBt/v03OnJAfh18mOq+Fs1/Y5Qe24
	CGvQ33CKdHXbDYy920iK7t2eYmwocDXFc2aQ0aRksiBsWswYXnGIocHM/Gp0zHyY5DE3CO
	hWqwfTkKFCNC55gW6h/C5H4f1pTsVUqFI1eYw4edo96amj2d0zSivSm8St8lgx3TvPCp15
	0mq5PJj+Iben3p9JURTxxWgTnNe0anYE0Drl3FaxbKuH4wAdFPvB0bN2hhyCqPQuH9NrKB
	g5z6T3Qv8LI0kPs8y7XNt1brCzemW0QX/uaB7ae15t2kj2Evbj/6e+oNMyIyvQ==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation: admin-guide: Fix bracket
Date: Thu,  3 Sep 2026 17:49:24 +0200
Message-ID: <20260903154924.732852-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qkcympzo15gw9b6ibsddh4htf3imitkn
X-MBO-RS-ID: 136bf047d172eda0941
X-Rspamd-Queue-Id: 4hbPJ22FDpzMlBv

Add missing ')' and remove ';' to improve readability.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---

[v2]
 Remove ';' as Randy Suggested
[v1]
 https://lore.kernel.org/all/20260902152347.708070-2-manuelebnerli@mailbox.org/
---
 Documentation/admin-guide/sysctl/vm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 5b318d17a..5f4a056e4 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -438,7 +438,7 @@ zone[i]'s protection[j] is calculated by following expression::
     = (total sums of managed_pages from zone[i+1] to zone[j] on the node)
       / lowmem_reserve_ratio[i];
   (i = j):
-     (should not be protected. = 0;
+     (should not be protected. = 0)
   (i > j):
      (not necessary, but looks 0)
 
-- 
2.54.0

