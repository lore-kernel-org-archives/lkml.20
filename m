Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AFA37AA9F;
	Sat,  5 Sep 2026 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594436; cv=none; b=FfBzBXc/QY6JfdIw+r+rqT8ISzZfpBllpij9VY/5FakOxBDP1RWsRrjhIXjusq8L7PM9CyCO7P5amHxWo3h/KCercx6zaRPOnOAwbI3jCcu6877xOo0KW134rgcnnxBS2nwvpr4Q1rde/QMxoQP0oRuekhoIQ1aSQFu/jonkC9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594436; c=relaxed/simple;
	bh=+Zhb5sam9OLzCa/1vtyLDmIlMDE7NbhUmaZgwnKEurg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMQRyHLHbaw4kdswN4oDUFKHGP5PaNPoHAtx2OgheqoQXfT4HGyM2FbqTM58uX1p/OLhiSI7/ykZhEN5gsDq8oLpdncBVudUp9RKg75EbnDW1v/6/LBoRl3VAqLFggTPXEmZzwqybJJCVB/aJkWJqN+XzIn3MPyhMfurWxbxHBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=J2fKx+pf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BSXCRNIP; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="J2fKx+pf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BSXCRNIP"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hcQQm2R7vzMlGr;
	Sat, 05 Sep 2026 09:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788594432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X7Nq68Nh06/b1rAUUotREpUTvq3Xdt5Rxv/xxUQQJ8I=;
	b=J2fKx+pfbn0mRdLz0LwgXwZ30DujEBIs1QZ4z9nQ+3TXrEGh0E1vhSzbBZVSoX84C5YsOt
	Vqgf3VRSumpltY7UvQbMk/6QSHf/DtfvZlA0z5GH/CL8VdWQT47LNt8hVmacjZkcTeDbxx
	9pNie2E16oE+vp38Cx6X9NgZG5yzmqfWnapsLGF7uBccYJbSRaWNzVVB7zjXMkJlPr3uHM
	4qoYzWW+dSP/WjcFA0sBodtyQ0Ob596UF7H+awJ534zFXD7zcuDXbWbjg76LZMxZvsGdrU
	SiFyK+m/8ea4Sc1E59D7a7iWK1UoL734LEWOy7YrVT8TrMG5T+PBlQK68IMzow==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788594430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X7Nq68Nh06/b1rAUUotREpUTvq3Xdt5Rxv/xxUQQJ8I=;
	b=BSXCRNIPeUIyEiAAKzC+RQGptbp3o63y17GLhJd4nC8fpQlza7KEX/3+yyfL5/JF89eT6E
	kbVNE2mrfXqRS+ygXdLr0j4U/7d17AWnqGgyoz65m42GXBg95J0mUCa9LC1PB2dfAJSd88
	8ep8/YoRAS2nGTZlEq7h0ceZc8nVm0oPJMDVl7/p/q9ybjJtKAWouqSaA6ghuVYDStuxxb
	7P+9lR9GdTYMbbpXnOJchBpxMKxXcnR43H65uJe0w4y9N/ZyVh7LzXTgyozhq5obdsRxzw
	kUd4ArlEvslOu9hXt9gvzZ/r90KY2UcgPcutjWPlDDSE2yz6XdybCqjfyEBUPQ==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: misc-devices/spear-pcie-gadget.txt: Fix bracket and whitespace
Date: Sat,  5 Sep 2026 09:46:40 +0200
Message-ID: <20260905074641.811164-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dzdujdtzfi51efsstd8mh94iod6omrik
X-MBO-RS-ID: 810e5738f27425576d3

Add missing ')' and remove needless whitespace.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/misc-devices/spear-pcie-gadget.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/misc-devices/spear-pcie-gadget.rst b/Documentation/misc-devices/spear-pcie-gadget.rst
index 09b9d6c7a..13333a209 100644
--- a/Documentation/misc-devices/spear-pcie-gadget.rst
+++ b/Documentation/misc-devices/spear-pcie-gadget.rst
@@ -37,9 +37,9 @@ read behavior of nodes:
 -----------------------
 
 =============== ==============================================================
-link 		gives ltssm status.
-int_type 	type of supported interrupt
-no_of_msi 	zero if MSI is not enabled by host. A positive value is the
+link		gives ltssm status.
+int_type	type of supported interrupt
+no_of_msi	zero if MSI is not enabled by host. A positive value is the
 		number of MSI vector granted.
 vendor_id	returns programmed vendor id (hex)
 device_id	returns programmed device id(hex)
@@ -53,7 +53,7 @@ write behavior of nodes:
 ------------------------
 
 =============== ================================================================
-link 		write UP to enable ltsmm DOWN to disable
+link		write UP to enable ltsmm DOWN to disable
 int_type	write interrupt type to be configured and (int_type could be
 		INTA, MSI or NO_INT). Select MSI only when you have programmed
 		no_of_msi node.
@@ -65,7 +65,7 @@ device_id	write device id(hex) to be programmed.
 bar0_size	write size of bar0 in hex. default bar0 size is 1000 (hex)
 		bytes.
 bar0_address	write	address of bar0 mapped area in hex. (default mapping of
-		bar0 is SYSRAM1(E0800000). Always program bar size before bar
+		bar0 is SYSRAM1(E0800000)). Always program bar size before bar
 		address. Kernel might modify bar size and address for alignment,
 		so read back bar size and address after writing to cross check.
 bar0_rw_offset	write offset of bar0 for which	bar0_data will write value.
-- 
2.54.0

