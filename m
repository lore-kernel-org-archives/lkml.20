Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813838;
	b=tbJhY6tAK3rgtbGcn7GaJN0pRi4Mj08HP/bg0BUm5Ugdx46gZvM8lkxOLeV6mcnlX04k
	 K1PukruoqLdNEyuEIfF/pdOhM8WaTP6ptfzkaxoKsj28JMp37gZlD6iiW+z0fsMwYX+Cq
	 /vyKzrfaIf1IEO6hUZknuD24FtZfhdGOSNOkCK4wjqqjAOEmAjjA7TdZWGkYJ/iAVPiJp
	 TL4W+IENwI4AWdY9w8XinY8FI+ruUBP2XHfdzQGrmHPDVDj+YgmXw/vqd7hdcT9xHvwQ1
	 uX1w2bAEpe8/KxxtovjVeWtBapwjriRKD/DZPPY8DR4okEQQYN5p4BAQDSVse/Nk2EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813838;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=U9swYTl9/6Jm5bkuKyl9t/JXcTMLeEpODDX8fv/nbqo=;
	b=fjfdCF3Fq2/G8PLRC9uX8O7MSoe20EbhY3luyUHLX6SB9AWXONEBKfSWyjiZPz07jixA
	 8dEH6GfN2iUcVUNwrNZo104Pce52qHNIrN9iO2JxRNEsnP/B2JvJxVykpA61LVEkx9AFB
	 5bXdIgnCMM1Ul9v2R5G8lrFOhulJV8BzKIhEwBaWxRBdW36EY0y9ouoR4S4qoN9IJ/vt/
	 zKnk+HGqLu8opVr3UBm1Tsqufexg8VG+vP0jqF05x3lhal9dCaZ5EudKSkkKRe1nfChXl
	 K8Pdb+toO49QE+Om0P8PBzRPCE7TviPpfHJewjSvPBJNtihJnQhsVNtT2ieipL+PMuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=uihU3KDW;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC10606A333;
	Mon, 16 Nov 2026 07:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC10606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=uihU3KDW
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jSfVW6SvDzMl0N;
	Mon, 16 Nov 2026 08:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794813827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U9swYTl9/6Jm5bkuKyl9t/JXcTMLeEpODDX8fv/nbqo=;
	b=uihU3KDW1hwg9rmy/EQTjjYWK4HUxpIDms3bnPkQI+B/ui1FhEFCJ/3YeDc36m1H0TBfD/
	Mt9GDqb+fvKNKh0TpQd6tO62I9w5QmyODzcoCgKkjRX8yzPAQDkfqA4qzK4KrkTUKgm26N
	Bbe4HqFz3RejfqMnklfvEWxWpgg+zwk64hjRPCBUq0DRAg8gcgl0o5mDFC45bj0dji+VIC
	qScV+ITqab/C8uAJC6qGEL9gjIJxCjgIciDOTBxk/vusOw+6F88OJlr14YqBB8zOxCQAem
	WH3T4OSkOsBMAD18xlKvBP/8g6nHsAQK2ImLI0468ceRSMB8Rv1fv2jWHpv8Ug==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: doc-guide: add command to output
Date: Mon, 16 Nov 2026 08:23:19 +0100
Message-ID: <20261116072319.1094457-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
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
X-MBO-RS-META: dxwgw39d9fc89qptgyccc9tdx7ze7344
X-MBO-RS-ID: ebc110865fe4154d533

Add the command './scripts/kernel-doc' to the code block to make it
self-explanatory how to reproduce.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/doc-guide/contributing.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
index 0f0804f82d..46a44b39d6 100644
--- a/Documentation/doc-guide/contributing.rst
+++ b/Documentation/doc-guide/contributing.rst
@@ -55,6 +55,7 @@ fixes; they should go to the maintainer of the subsystem in question.
 For example, in a documentation build I grabbed a pair of warnings nearly
 at random::
 
+  user@PC$ ./scripts/kernel-doc --none drivers/devfreq/devfreq.c
   ./drivers/devfreq/devfreq.c:1818: warning: bad line:
   	- Resource-managed devfreq_register_notifier()
   ./drivers/devfreq/devfreq.c:1854: warning: bad line:
-- 
2.56.0

