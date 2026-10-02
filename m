Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11931E858
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982082; cv=none; b=KJhckihgp4wn+lOHVCLCehJoCHhMnXettHr+7i+Hguq7Tlf8KDhegbuLRA/x7TBQ71QsRiiqyaEwFLFf6H0SbxB+6wIDdfeo/xfqsr76Lq2CBfx89AuYnFte9CmXXIIVGDzE2LZWnHvxuyJJheP8otHZCGI1BM1qrKkKCrpcSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982082; c=relaxed/simple;
	bh=Kkc+7wyLlEIrSW/ZGHpo+zCK4Drb6lnG4rA0ceiEaps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a3OqvY3DE/ZNC53KTkq9CT1FksECli/aT2jT9/XJhyQvuR6RS9QOGUWWJm3H93EPPODdca8gmGXtVKvfOc0aHJqJyEA+TkiBc1TDogVDJqdHr34GL5VCa8BAfEVOWiGdIQic4U5fCLdRgitXcmclRhlHStLIxQwAYUFlHcbUlLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNvn1srs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNvn1srs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso13835f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790982079; x=1791586879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYvP6m3iDd7aVHdkDbM00AQcpjKk9yQSFhGJmwfSPZY=;
        b=TNvn1srs8a1H+p1N0oisFFcxm61XqQwdRWnNQnK54uY75a2bWWTqH7CULvhkXTubxi
         VSVO0pDTV/Gk6SMYZ8oRJofLXSBSwfBiDMT2H+QcI6623uXou5mVC6d7vPgccXr6hKgU
         TLL/cNKsFgd4+eW1tTLJkw1CaFuqh66epAVuN0YyUZS1imDBPYEx+MJtdTxvoytvBllM
         2PQazgl+WQNNBz2Kn5g85gItj8w21FAvIWwRa7XWzmbUWjdDNRKrU+bOcLzKxYCxLDjG
         TKH4ZSHWn4tdIV1G7LljntHwG9XEr7xsAVJDgT4P3Df6s1oUywDpmLn9vs2w1J56ZCTp
         YK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982079; x=1791586879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYvP6m3iDd7aVHdkDbM00AQcpjKk9yQSFhGJmwfSPZY=;
        b=jjyRwhNwmQHJepvjz0E3wj3O4/74rnwFpp7PqwSA9DpCxB+QY0C5UnMI103bym9BnG
         on0OO3W/fIWhZFpYS7MOKdy+YnEuE+bKXeant63UFIJTEUWu8Yrc4F/Hq7el6iwZ6Z6Z
         BhiPyGsCHEkqm95Wugu7TQ7gnPkC1hy1rlJZT+t+tBT4wZlMAJGwW6cZk1iP+hx6g2s4
         +1gn57QXSekjnyYDd3iJTNrN+KuZv8O4t2pJ7HbOP4bRBqJoU2S+GDPf6zGah5+qMU7h
         8XpjLuC3AGdk1j89UeMWlJStu2Vy2ceh98ssTzidyYEDASWd6CKotG1grYVEuBPdpP23
         Uf1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6S7C/VKvLSwqybrLaxl0VjUWxWByIq8GOLF5NOUcIorKle634x8FMjydIDod2zQbYTp6cVWpoWuWY+6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzs+eNjxziovk66x8b6LHz/n+eZmP1PzkXXgHWulIveCwsS6o+
	aKdE9cOF/HP9SWeTAa4iT8/3Kj0MtfJ9r/qZ43zbPflW9FsKTQTHjrFa
X-Gm-Gg: AYBFou3mZB3piBO3rvxCq15JblAWa15YmQSITBAFGo7NbK9/1Yp6xW3K3/erXeYetuk
	+4BBt6RrZIsBI41Gq887zTNnvNshl1QPtuVP8B7+lhuUvMOZyUaXT1/LyXo+Bljm0brqMnZlauS
	uM3ux84wSvsLEgceWTP12hzXkPuLRHSD+Y5SElgum++dAA34/BC6C9AfDG1Ex4R6V+Y7NBTQ6yU
	U+ZwPIGVU9dozWwsSYgLM4ZKfqBAkUAjtt1flM5yXYbrZWF6sD7Yg0+2llrSLmgrdNFzzZNPB6v
	wIRrYE5FinILpO//2jbgRTUyLGb7YcOXjnA5570/5N+temEuTTTO9i8xhjjNeFKOQclDPL5OEZr
	I30zRmaEW8Xdf+JMgy5sFDVXLUGGw0H0PoQUn54R6GTURofdzwDRTZ95fdFUpO03XLYAu1dapMW
	9u2Uy4MZokc5gxLRt4N4q/QnP4Ar8PDu77BN2hsm3zPXz3GPzCOSxB+4R4OkvJL0wGvcR46eZOl
	F7N86eUobegqnz7fax+o0G4I8di7agKzYU8nSzV5jLGj0+U/c+uXP0jJBQ1dB9MRIMFdeeN4CQ7
	aKc75IxERWsi2xaej4K5koI7FEbJpyp4hc3XBw5hGVLdYIZg60BOUzJNB5c+buMmE49SmLpIWDw
	yHg==
X-Received: by 2002:a05:6000:25e3:b0:48a:f11a:c34a with SMTP id ffacd0b85a97d-48c4801ad09mr929694f8f.52.1790982078649;
        Fri, 02 Oct 2026 16:01:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-af35-1901-81da-eee8-c2d0-ee3b.310.pool.telefonica.de. [2a02:3100:af35:1901:81da:eee8:c2d0:ee3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e8dsm7514734f8f.4.2026.10.02.16.01.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 16:01:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc output
Date: Sat,  3 Oct 2026 01:01:14 +0200
Message-Id: <20261002230114.39651-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kerneldoc.py parses extracted ReST into a detached section node while
retaining the surrounding title hierarchy. Docutils 0.21.2 silently drops
affected sections; 0.22.4 reports:

  Documentation/networking/kapi:107:
  ../include/net/net_shaper.h:75:
  ERROR: A level 3 section cannot be used here.

The same issue drops three Xe DRM RAS headings already in mainline.

Use nested_parse_with_titles() to give kernel-doc output an independent
title hierarchy.

Fixes: 2404dad1f67f ("doc: Cope with the deprecation of AutoReporter")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Reposted as a standalone documentation patch at Jakub's suggestion:
https://lore.kernel.org/r/20260925120152.09ef180c@kernel.org/

Changes since v2:
- Route the patch to the documentation maintainers without a net-next tag.
- Add Randy's Acked-by and Tested-by tags. No code changes.

 Documentation/sphinx/kerneldoc.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index c1cadb4eb0997..9986df33e37ea 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -38,6 +38,7 @@ from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 import sphinx
 from sphinx.util.docutils import switch_source_input
+from sphinx.util.nodes import nested_parse_with_titles
 from sphinx.util import logging
 from pprint import pformat
 
@@ -252,7 +253,7 @@ class KernelDocDirective(Directive):
 
     def do_parse(self, result, node):
         with switch_source_input(self.state, result):
-            self.state.nested_parse(result, 0, node, match_titles=1)
+            nested_parse_with_titles(self.state, result, node)
 
 def setup_kfiles(app):
     global kfiles
-- 
2.53.0
