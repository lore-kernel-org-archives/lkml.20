Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB8370AE2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762631; cv=none; b=RzMoyB9GOQgR9Zw0oQAc3WFBEibMHQV3RuoBc35zFGipSVfE/muxu5KpctbUaiD4cUGFzSdZEDDglYlhprAs8mwe2Q1Jt06SbwvBK1MfmAjmZ1w3zymnpzTG4wGtX3ySOPnTTxpuP/DXDXXALyygKWJ98FXpqRZ4WT2l9VkGTCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762631; c=relaxed/simple;
	bh=5VmiqDiCpinOaN/eMxd+KtwJB1PjHig9pTQ7hWfug1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvOLvFOMKtxOsesvDg1wxHZZP5wGOc72UvVa8nd6FSh7O7hKnRZCi044SnJ9AomLaktS8H4sGVFeP1KcXuC0i1JZG4RK6k1c0TpstDNkaH7zktNJI8DjHYbhHyKK0w1CYD3G5c5bt7HfVI647tnfvG5sgChfJtig3GvH1nnBUz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTwyTzDY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTwyTzDY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so33463575ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762626; x=1789367426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCe8URlR9PJXBCRddCqyJot5LzLIlOXEphL18tnptgU=;
        b=oTwyTzDYZGD/uieRzoTKghSgVNazW19uQLmSPfq6sgpgHuZOQvrBV8mOBpNR9UXSDN
         WN9EarTQh0JNlUFLfKzq3DeG9mfYutoAHSeVNQ7MMzccnXSHS5v/vhAe9eM5JkctrHKu
         r09LtrVK8Ey72FJXe8PeuGitcZT2o/krHEojQZDQIPIrCEnNhDWLQqjV64QU3WesqZmP
         V0+6bsUkJfi0AhEv1OB22IfSxGU+gCpLElnxnsNDPsoiUo8Jq/HmO9Ews5mZ5aXvrgGl
         HBItPNhejrAOIjiFwXt8lGCqLpdG+isU7qN+XSdmrfl/P2JokSj2ALwCWrWwlScSLSU2
         IDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762626; x=1789367426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCe8URlR9PJXBCRddCqyJot5LzLIlOXEphL18tnptgU=;
        b=BMosFobH6FyxGq4i5sOsTpJbXU5PGTx1OdSyXLR62EoJ0x2PQQDI11wtLM9ZtL8IcY
         S+OmN4tjuul/QMjTI18JoWbB9pz5tj0dbgeqOFGHG1qOhUNFzIwlTGeOsNqcYwHlFys/
         5E0gSahx42rS4ud67WgawCHoMo+RpoHFfVM+NuJMJ7YKz73ETdtkApikq5P+K0PpA0Rn
         p/D5eLZhUO9yP1QiSWEkGAIjp0XSeuvvnLndtLCNjzqb18OWY3k1H+pGSPu1xaC0M1Ot
         zDFnlrpmPKfo2WW7LqNWqO3SM2bMSi8B61X/gnE3MAb5+Wpfy+y2mWFQk7a/qILNhx1D
         I+pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxauEXN3X+0/5xMnWUSehRklovouW5NkMnN8eLhKF/GjMH6I09tpLRhUFlu8HBn77KL5O5uFvvna3r794E=@vger.kernel.org
X-Gm-Message-State: AFuF++mMpTF7auFQbtDyEgKQCM5PtS7DXaxJV5hlmoC+ZyTTCXQE7i9A
	5AirAu1oOUkTROP/zXXt0lDdagxEQMg7wJ5Do0wOoUJuvUrT/9c7qIhu
X-Gm-Gg: AYBFou3uqwWt9QAphA1tDhSo/gzMq0k3WHXJxbAAdf0twVNmtsSgN2Cw68/QBFpkkeO
	6ejAB+oWnTmu/tgGjPZLBWoZXwYbss/VzjKLMNKgWmtwa35FfEm/DOe6hI87uqTWnE6ETZZGpnr
	I6TNIZgIQ9n1ljk1jfLkxiTaA//lauUkygRGoJiACjrp8K6EZ8MD3+tLONNM18GCA4SJfpjdmmR
	e7KE2VKFNzBcn0qsa2FWJ6LZ7K5AJ4AcmcnceD0g+rrZMcg+VIWU/KIfM1AQMNVnYeYXOjbhYJY
	uBJo4/nQBw/qlhyN+eFReTL+XSMxgbF3d05G70RuWFy3ynzA/qIViVnEXPg9dG8K18S8cXdx8bb
	Aj6GLHnVKkywPsZb4t7Xh5SgpNlUY+lmszmrYKMIkrgs0wt+7qNak7wblK0XCDjHc6GNjxG8WVw
	xXGWX1rnUQ16W+g82cHkK1mh9EW6v/hxY8TJgXyZfFAoT1qTWpNUwcDlx9ysz+i2AEmNk4elVqG
	HrexubSzZczQw==
X-Received: by 2002:a17:903:98f:b0:2d8:d4d3:3fc0 with SMTP id d9443c01a7336-2db12678d9emr326600725ad.20.1788762625902;
        Sun, 06 Sep 2026 23:30:25 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm24018284eec.10.2026.09.06.23.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:30:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: fix typo "forwared" in comment
Date: Mon,  7 Sep 2026 12:00:21 +0530
Message-ID: <20260907063021.18945-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "forwared" to "forwarded", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/thunderbolt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index d48623fda79b..faf1f61252d6 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -369,7 +369,7 @@ int tb_xdomain_request(struct tb_xdomain *xd, const void *request,
  * @uuid: XDomain messages with this UUID are dispatched to this handler
  * @callback: Callback called with the XDomain message. Returning %1
  *	      here tells the XDomain core that the message was handled
- *	      by this handler and should not be forwared to other
+ *	      by this handler and should not be forwarded to other
  *	      handlers.
  * @data: Data passed with the callback
  * @list: Handlers are linked using this
-- 
2.48.1

