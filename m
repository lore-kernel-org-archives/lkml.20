Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24C30F958;
	Sat,  5 Sep 2026 06:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788588046; cv=none; b=l44WtorZVSoSeABpk+/r1RSt29vBo9x20+49OoiZ4n5rPwcLGVbmHiVpxvCKVc8DSA4hkoudksFcry1+cQU+a0+GEF42qOKYx+Us3ZOGv2IrqXmXStLi836ARpYESQNmaLg9AONA+VKc/UBDf+wwGfMWPfhcq5BjhGW83JOVXi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788588046; c=relaxed/simple;
	bh=/dJRWWb8db67iq2SnnIKwB1lk8MdJKR6GYcPD3bzXFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5c7jvjRHKnL4uUtHfHXmHXve7NMMFzt/ARRgTuJmuWvEvvM4uxFfFEkkHzjCf39qR/VLLX9jdCkWSEMEEimBp24lYKwuwzwGzzb+TGbgfnf/IO4+LZNq/OpB78biifuM5l7DxAnkAeNJ8gdgbrrA6TYe/KSiy12U5ezza+KttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=btmPRJgp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j2HoN+lC; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="btmPRJgp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="j2HoN+lC"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hcN3m1tBTzKnbK;
	Sat, 05 Sep 2026 08:00:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788588036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pk5D4LfjBqeX1JlhrezgLD05ZGpvRe5c68x4fIoZg4c=;
	b=btmPRJgppsIqLxz/6fPcvgN+UEXyMIsdy72eaGzlnEEE9kH6vKJT0xAYDfRcCemrz6+nXc
	3uYsgfpHqHAbyTD+iSkhq0dNIkDRzzNtI61M60ew4rD8tT7p6OzjwSdYg/zUytu/H56u6w
	fDs8YyUPsSi0J7JcBL7Y6fCRdQQGW19YSucWIpZTCZwPI0EDfN6ghdXgzodG+qVYyiv9sB
	JEvv9e3Ey9MKjFNvb2HElSELir3NPiDGzjZZHmw9mJ2/H3F1iUiWJcGABeUt1CGjPmk63K
	gaLkY8e6iRcfeGJ3ovxkC+hvCewdF/f0+Sh+uTc83sXXlMqi6apKLt4ljpAjDg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=j2HoN+lC;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788588033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pk5D4LfjBqeX1JlhrezgLD05ZGpvRe5c68x4fIoZg4c=;
	b=j2HoN+lC3OOKRRziaquN/IGy2lYFLHjm4g8/ZlA7rHbD/6PKEMKBv15qjI5sr+2EA/g4tm
	OvefcW3Mkc3g8YxHbnKfkEcsTRrOCID8EQFcGsbH1SuGe58KwZ9qk+xoFUpMYZw6scmdwj
	lhe+WZ7eQHo0nnhdoY+ECsBlDrD0h+xObbq12c4390QUfhtjvKh3sc1JaSzLMN+CBIle+5
	K13tmxX6FK446bATG77TKPoQdI+3DJza5A4RY42dAMjlwNUCdYKs8YG3a3D0zIfaeS/Xz8
	8eHWnmi8x5CTTlm+4Ma5nF1JwpICg/hmYX9/siKt8vkDIU4jnNqhzYHrpxzpxA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] Docs: changes.rst: Refine language
Date: Sat,  5 Sep 2026 07:56:55 +0200
Message-ID: <20260905055655.789265-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0b92f568e4e78984649
X-MBO-RS-META: tcbxsmkxtmbcs4amuj7s9xybaukdddrj
X-Rspamd-Queue-Id: 4hcN3m1tBTzKnbK

This document grew over the years and isn't limited to compilling or
running the kernel anymore. Update the heading and intro accordingly.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
[v3]
 - improved commit message
 - removed other patches from this series, they are due later.

[v2]
 - no change to this patch
 https://lore.kernel.org/all/20260831152607.639027-2-manuelebnerli@mailbox.org/

[v1]
 https://lore.kernel.org/all/20260812121945.1635085-2-manuelebnerli@mailbox.org/
---
 Documentation/process/changes.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 0aa232b11..eb339eb8c 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -1,13 +1,14 @@
 .. _changes:
 
-Minimal requirements to compile the Kernel
-++++++++++++++++++++++++++++++++++++++++++
+Minimal requirements to interact with the Kernel
+++++++++++++++++++++++++++++++++++++++++++++++++
 
 Intro
 =====
 
-This document is designed to provide a list of the minimum levels of
-software necessary to run the current kernel version.
+This document is designed to provide a list of the minimum versions of
+software necessary to change code, compile, install and boot the current
+kernel version.
 
 This document is originally based on my "Changes" file for 2.0.x kernels
 and therefore owes credit to the same people as that file (Jared Mauch,
-- 
2.54.0

