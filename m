Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724135;
	b=GbDBDoqloY1ICMNJTCOM83xptpj3NMtOpFP0VEEpx3q/LGdj8JGwowC3k1CBtTlzdwS5
	 tQ1KU+GjZIJMG3g3jw929cINoM68swxoFwWBV/5ny8/FKRc0thavrcvtvxfsxXR7jq1H3
	 AuRQ+SYs2tqTiXalQQo0mXYuP7ozhfkd+14ljJLVKhK16AojU4jioBYvAfoMBEMc/YrPF
	 MbGIY/wJGxsGGCZMdyYbMFLZlOyTW/ZBCyVa3FV7YcKZpgx/5kesx11UZGe0XwB6L6IYW
	 /hnKQD6oICnApXEdVaYauhgDsshuldoF4VSSHCTe5+n0ufV5XFkk88H1AIBYpL+mbvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=Zo1rcdI8Q6lPkwe/dLHXa1UqIpAJqN6yvImDWTZdvdI=;
	b=MYzSctpik2oyWEukK9znvSn0AfK8rF60oqg7bRyESKkcaGbdK9sj0lUQq2XOI4s//oB7
	 yp/QND4gGJ9uLw5xwLgkBT+qwoQCQ8OmkxW2O12mkgl5j/wOlo/p1tZxtwdFLwpOUnNGV
	 Kky7Acv7Cu93ZGDuKK+G6vfQ+we9aHmqJ3S2CGrL2SG4JyPVaW9Lw3grQ7syQJ/t0tHLd
	 ae2voA9wdBuXZnDSRBTti18bpi2E7CX5i1Mhte5KN9l3H9tYL0sXQz0Xv7d5YGqQMbyLG
	 t7ENedj1LVYHZAG8E/mzS42XtqHc2EAIEsqcM9bAGYnFPZAtWS7qmZ2IwnGfW6owLTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=84.16.66.174
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6D60A6F4E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F6D60A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVl07VMzjW8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724126;
	bh=Zo1rcdI8Q6lPkwe/dLHXa1UqIpAJqN6yvImDWTZdvdI=;
	h=From:To:Cc:Subject:Date:From;
	b=A1O9FdBCLSgB3uo6e4chIpVswi/oy64ds4GS+8zOSLPi4n6mo6p3leYdQ+L6b5oZT
	 o45ecXAhYZs3P3jpD/YEKFDUTmLzslpZMMhXGe8w7U1WjuyBDD58GnsU8UpUJg0BOs
	 7xKF4P0C9v6PGX8qAxyweT9VqgjXqo8zpMotpE0++CJFae/kqZaorOoutMMivWO963
	 nfGNZqWqw5MwXdULA9GvhP8NOjxnIxZOVheTiqpTJPn0p40l8HGO4iQj8M3BZZlWuP
	 lTBoP5SvLDAdUCnY8LjOWDPCNIQ0xG1pcyFPPQk8Kr8T8z4Bnc7RBask0lumd6ClbH
	 mqxuhwW8hWrMA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVk2xcgzqbn;
	Tue,  3 Nov 2026 17:42:06 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaI-00FDdp-07;
	Tue, 03 Nov 2026 17:42:06 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sunjunchao2870@gmail.com
Cc: hamdy.aea@protonmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: macro_checker: match parameter identifier boundaries
Date: Tue,  3 Nov 2026 17:42:05 +0100
Message-ID: <20261103164205.129713-1-info@daylightlinux.ch>
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
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

A substring search treats value as used by other_value. This hides
unused parameters and can mark the macro as correct in the initial
scan, suppressing its report in the second scan.

Match identifier boundaries around each parameter. Preserve whitespace
before a continued line so that joining the replacement list does not
merge an argument with the preceding identifier.

Tested an unused value parameter next to other_value, direct use,
stringification, token pasting and a continued replacement list.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: d1c7848b58c6 ("scripts: add macro_checker script to check unused parameters in macros")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/macro_checker.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/macro_checker.py b/scripts/macro_checker.py
index ba550982e98..9a67b16dac9 100755
--- a/scripts/macro_checker.py
+++ b/scripts/macro_checker.py
@@ -47,10 +47,11 @@ def check_macro(macro_line, report):
             if "..." in arg:
                 return
         for arg in arguments:
-            if not arg in macro_def and report == False:
+            used = re.search(r"\b" + re.escape(arg) + r"\b", macro_def)
+            if not used and report == False:
                 return
             # if there is a correct macro with the same name, do not report it.
-            if not arg in macro_def and identifier not in correct_macros:
+            if not used and identifier not in correct_macros:
                 print(f"Argument {arg} is not used in function-line macro {identifier}")
                 return
 
@@ -93,7 +94,6 @@ def file_check_macro(file_path, report):
                 macro = macro_strip(macro.string)
                 while macro[-1] == '\\':
                     macro = macro[0:-1]
-                    macro = macro.strip()
                     macro += f.readline()
                     macro = macro_strip(macro)
                 if not args.verbose:
