Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B003546EC60;
	Mon, 31 Aug 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190018; cv=none; b=kJRjSSsqltLovjogzvNJCsyUb27/cezTaeSKpi/0uY/Q1RVdigoh8Tfv5M3KapCp+Bd7krWnf3ImURZVTIittKG4tV9ZiCYWcnilQdNM6MDDJy1T/tJCI+j5G5Hiqsm7SC2IxZyL1RUBMNjfTUg3jClgXagm5u/2FT1SBptP/cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190018; c=relaxed/simple;
	bh=I4KTVzy5BoD1GTAnVFgm6RMU2oj6vNB9P8NUMJXws04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZYWJri488thxLBQyKqPOFOf/PRsRaVt3FtVmJnoPeJL8OmH/834NoArk1SywuXHaYKv4rB94tVc70ObviLPjgb+5uphv1laDqxYbkieGhY71LzVNTfL6NyvLcNkFlekUKY/Z9NZOYZiVMwqFP/M/WDKHDsv3gobJMZY/BbUA1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HLrWa9uu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pI48Ma05; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HLrWa9uu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pI48Ma05"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hYXsV3g3QzKv7l;
	Mon, 31 Aug 2026 17:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788190014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjlD3nYpD275LVKpnpFS3J736ATFvCpGmeyYsaWdxxE=;
	b=HLrWa9uuM5g5Lut5br4Mx732+XiZbfOPFWiU4/NoxPRg/0ltn8gbgGk1eHUj81D45AyTrJ
	gjRYeOY1hg6MyCCHKKKU38EtBYjumfkhBD7gXFjNi5/x/Cgmn9ZUZ+4r46G/ss95sahZiH
	NkV1RPSbVHCwNiJtW8RLHvSPLj40DhPJD91O4MogstwBo7gfZ8oFCiOsoHlY4HZVrWmZMn
	qR6rzEv2ud++vhkSdu+bz5iEP3ctfj6QHz4iotjuRII76seIj11QX7FBjXD5V5omtEec2U
	ZE5yrAnFqa3qt4Se2E9TN7PhGJcqve+O2uObIUC1FXzIewIrzoOkQMwGjUIZIQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788190013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjlD3nYpD275LVKpnpFS3J736ATFvCpGmeyYsaWdxxE=;
	b=pI48Ma0536VA5EDX7/WdEEnwJXbJG5lFSgqwe5gi2ADpVsPQr/1lGK+en8rE0Pc8WsD1TT
	+dawiLJgZV32nd7N2D++waAe1udjMfa6X3BvujcIuazgS1AtNjY+wHW0GfvwSky9QhbO5s
	i/ud3krYtwVbsQxsD/QsmHunpN7qFn1ulS4NUmIu1+pYZ0I0T+uZkFaxnflPpCOJvr4ypl
	ApaoeU65Ay/Je+enGsY/GFJgWrFn7GhZApgr18UVtO6MKk9vnJN2smXvJYzcoE5MCpqSTl
	jaiAu0npDFkT4dYlwc9C+AS18ln3cYdwBGx+ZZv65R+uklPm8o3Fnn/scxdsaQ==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Docs: changes.rst: Refine language
Date: Mon, 31 Aug 2026 17:26:07 +0200
Message-ID: <20260831152607.639027-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260831151605.638172-2-manuelebnerli@mailbox.org>
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ndiae5ccdzxeb91pdt1bsgum1fkr4yxy
X-MBO-RS-ID: 51b028c4878022b02cd

This document grew over the years and isn't limited to compilling or running
the kernel anymore.

compile -> interact
levels -> versions
run the current kernel version -> change code, compile, install and boot the current kernel version.
ip-route2 -> iproute2

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
I messed the order up.
---
 Documentation/process/changes.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 1ca8c5f73ad0..fb5ef7d743ba 100644
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

