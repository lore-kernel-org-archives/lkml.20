Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724135;
	b=S9fAHnfrM3nHsQmvW6OJ4ARviv6n2H7TuEd+Th6y+0ZD22+Ts7TLVOUN7oreY9fXT8fo
	 xua5U8MvcpxZNyvAaFvx1Xt1nyy6m4Yrh5stD5TefB3/rnxrasq6waiAMtxGiAewej9fo
	 Qysw3x2DNuKKwjphrB+8eoIDfPBbKQvvQYg3y/UtB6yMuVnVhfkueggSpRu2INA8jyV7k
	 AQJ+UcwYGEU/BfJdxnS+4QGIPCxNfQ6oaWlkymBmCSCD1mKZtV5YXcAFILR4p2E9eAYlW
	 dcW7DJp2p1gqIoxKdxgrlDcZWJdfSKJq1TcVkx5CFDDxkvbUlwQG/dVavGraLRJYJKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=dFu0BmUsSXWAe9QPth5pHhcE9E3fA52ja0PpZwFJV88=;
	b=YmM/Kxz1huzZed0YG4528YOFDEOSEDbAntnNSd5BVP5+9xJm/6wXp2k6+1pHhfrM3KQP
	 Eaap66qSjKWEVxEGGTlnsBqlUvbqLgWREpCwM5Mhpujb9rQlOjnDO3onhlNs2ff239Y0R
	 Jj+246d9Dp+xuEkOuNFEXGkt76d2A7DH3/TGips69ntWeoy8WWM6GppT6k9kdwQ1cZ0CF
	 9L0odtO2xUoqEBo1szRKf7t2HHcQSNVjnOFS9lF/cxYlZWOZ2SamSYAwOTHettuVaPRWm
	 bGqooquZfaP6RIR3nT8MIw8ChTl1FjmRH0GByvnCIaa7fGwvXEKdNNoSWNAOpQYqFlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=83.166.143.173
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656CF60A6F4B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 656CF60A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVk5R68zBtb
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724126;
	bh=dFu0BmUsSXWAe9QPth5pHhcE9E3fA52ja0PpZwFJV88=;
	h=From:To:Cc:Subject:Date:From;
	b=f9O5+jLCQkkr8W9IGWQs6tVmiQNkt36qE0q2RmLiE666rqeL1deRooJIJd86NxI73
	 52mdaWe/Xh/x1r/qu9EARiXbwg03fYmj1jlE3q+985BXPNAxfb5b7KQDS1K//sMELF
	 kI8AU4PRMXKIQUcDHK46eR5cgxk/IkiDBRjhPHQCe37UzShYxOTdf/Swv+7jHVJ9es
	 dceUd7wGFWPdfz5689KGVxswkteut5HVvtfKbLq56GZV0XJYw48gR6XSpT3g7eLPeT
	 yLG8LBY61T3RdUju4CcR0YLfJOIyRNjyOyP+nOVQKyPzfDhdJwdICLAxlnPGnNrt1a
	 MTC5PENO3N9/Q==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVj6Vg5zqnq;
	Tue,  3 Nov 2026 17:42:05 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaH-00FDdQ-1c;
	Tue, 03 Nov 2026 17:42:05 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: linux-kernel@vger.kernel.org
Cc: hamdy.aea@protonmail.com
Subject: [PATCH] scripts: check_extable: match allowlisted section names exactly
Date: Tue,  3 Nov 2026 17:42:05 +0100
Message-ID: <20261103164205.129703-1-info@daylightlinux.ch>
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

The unanchored .text and .fixup expressions match more than the two
allowlisted sections. For example, relocations into non-executable
.text.data or .fixup_data sections are silently skipped. The unescaped
dot also matches a section called atext.

Filter the relocation target field with anchored, escaped section
names and an optional relocation addend. Apply the same exact match
after resolving a symbol to its section.

Tested assembled ELF objects with .text and .fixup targets, and with
non-executable .data, .text.data, .fixup_data and atext targets. The
allowlisted sections still pass; all non-executable targets are
reported and cause a nonzero exit.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: c31e4b832f12 ("scripts: add check_extable.sh script.")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/check_extable.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/check_extable.sh b/scripts/check_extable.sh
index 4b380564cf7..eb299e182d9 100755
--- a/scripts/check_extable.sh
+++ b/scripts/check_extable.sh
@@ -10,10 +10,10 @@ file ${obj} | grep -q ELF || (echo "${obj} is not an ELF file." 1>&2 ; exit 0)
 objdump -hj __ex_table ${obj} 2> /dev/null > /dev/null
 [ $? -ne 0 ] && exit 0
 
-white_list=.text,.fixup
+white_list='(\.text|\.fixup)'
 
 suspicious_relocs=$(objdump -rj __ex_table ${obj}  | tail -n +6 |
-			grep -v $(eval echo -e{${white_list}}) | awk '{print $3}')
+			awk 'NF {print $3}' | grep -Ev "^${white_list}([+-]0x[0-9a-f]+)?$")
 
 # No suspicious relocs in __ex_table, jobs a good'un
 [ -z "${suspicious_relocs}" ] && exit 0
@@ -120,7 +120,7 @@ function diagnose()
 	# In this case objdump was presenting us with a reloc to a symbol
 	# rather than a section. Now that we've got the actual section,
 	# we can skip it if it's in the white_list.
-	if [ -z "$( echo $section | grep -v $(eval echo -e{${white_list}}))" ]; then
+	if [ -z "$( echo $section | grep -Ev "^${white_list}$")" ]; then
 	    continue;
 	fi
 
