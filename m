Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568328;
	b=Z3uw48P2W74T6M/oKw1c0OOppY5sK8W+izqh2hvM57isuLHtXSQyEttutHIp3Cxcz8Mi
	 0ayZDiRGmPbFiNidjV2FmrPvr808Brb60H5uS7ApvP4GxPMHxAth1oiUJsAwXedkBUtdm
	 3a7mqR+K8HNTaeinspZuiqDLG8UZjylgBRM+c8wo7Fy8W3azO0xei20WV2yOp7v8pS88Q
	 8POSFrgC0qwqbjYcUMvxjlkoDw4rvG6a0I/9CQFnTCnMqnRLtIXdhJ3bBRituejUPtgRw
	 2PmlSlOZcMXkEC2MCJbQjwIVnZgrnCUYXeDdKjrpf0zi9zySGEyiJhxSaWl/ha1sr2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568328;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tdw0bwQZ8Q79OsNUucWIgUjlWSc89vsrssM2V4jSnNE=;
	b=BQyRjvNiEEUKmGY7x7KMuqomKuBAbEioaBQiJ6kGeQ4Y5atHWkTe4i2Ma+ueZ+NthnMp
	 /vOumWx7j5f5S/ut5V7zVO/7arngYG4N3yQ7YL2YWj11aqinkAApN6c+YB1VLcxZQsKq5
	 kzls0I+pTNv44EW29hsx3gfcMjfK5fwlSprC7ptF8UsZVvhSWn9rVYLmcjBj10a3U9rD7
	 MyRTewF9qksuU2MafexfIH0JjS0+WTFElRmBssC6FUwfY2cGIPkd7RrwrQXrVfYeSY0YO
	 ePmcL1dVJs6zCYxqbaasrm53/SBHLP20V46Odo4smmt7uvBaWMk5hi9qTunjps8nw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=gukuY0Xf;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25C606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA25C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=gukuY0Xf
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 1D28226BC6;
	Fri, 13 Nov 2026 16:12:06 +0500 (+05)
Received: from fedora (5cfcd9fa.dynamic.mv.ru [92.252.217.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 7E90B26BC3;
	Fri, 13 Nov 2026 16:12:03 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru 7E90B26BC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1794568324; bh=Tdw0bwQZ8Q79OsNUucWIgUjlWSc89vsrssM2V4jSnNE=;
	h=From:To:Cc:Subject:Date;
	b=gukuY0Xf1gE5F2BvUTIqm9aSWpFRbNUnT4Bv04r5npETypYaaeJsjkscsFGwjiLvB
	 KmIilEUBW+ADZZJmAq4Z2ABzv1ZiShcJ81YL27mwVB+oGJF1bLqImpYYsKrwF75lBr
	 AjwnK8TNMEWoRLHi2F6+BGb9sUu6q/MY2UefTCPpshCsMw2wnLKdrBdvhpgs8n8M7G
	 SP6LXhN+unVyBEgmYDPEL+3tbYjKYQjKoQGrLJ7Ux+vva+E6UyegKkBjtRi0+g/jUL
	 iqs3WPcypsurLJeq+RBD1CS3Ac9yXTfGbGHXVYqaEse1DfGtY/25VE49uFny6KUqMJ
	 VxlUpkm1C4Pbw==
From: Alex Kazinsky <a.kazinsky@ideco.ru>
To: Daniel Thompson <danielt@kernel.org>
Cc: Alex Kazinsky <a.kazinsky@ideco.ru>,
	Douglas Anderson <dianders@chromium.org>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tim Bird <tim.bird@sony.com>,
	Martin Hicks <mort@sgi.com>,
	kgdb-bugreport@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] kdb: Reject zero BYTESPERWORD before calculating the repeat count
Date: Fri, 13 Nov 2026 15:11:51 +0400
Message-ID: <20261113111152.4190309-1-a.kazinsky@ideco.ru>
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

Setting BYTESPERWORD to zero in the kdb environment causes kdb_md()
to divide by zero when calculating the initial repeat count. The
existing width validation happens after this division.

Reject a zero width with KDB_BADWIDTH before calculating the repeat
count.

Found by Linux Verification Center (linuxtesting.org) with SVACE static
analysis tool.

Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
---
 kernel/debug/kdb/kdb_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 40c332d2179d..c3cbeb25f6fb 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1527,6 +1527,9 @@ static int kdb_md(int argc, const char **argv)
 	kdbgetintenv("RADIX", &radix);
 	kdbgetintenv("BYTESPERWORD", &bytesperword);
 
+	if (!bytesperword)
+		return KDB_BADWIDTH;
+
 	/* Assume 'md <addr>' and start with environment values */
 	repeat = mdcount * 16 / bytesperword;
 
-- 
2.56.0


