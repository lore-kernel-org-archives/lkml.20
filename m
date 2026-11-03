Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708561;
	b=tDJ4hujcwKuXNLNJu1nTefJsvzmXrYQIH3JL/zg9F/zFx3WJ6aU/Mnm4fu0wbcHpLTqZ
	 YAC8/zyAKXU229q3X+G2aUcf9eFO3SZ9y1dY9XPmX9i/iUqgXrRjkbaqA8ALTOTh0g6b1
	 nxGbZPZLTUvJb8GrWl0iFaDpkmmR7v/7Dv8Xsyefy3WdTpi6PZ3ilqSeNMYm+JcdR5U2Q
	 Pf8sXhQIMPexqPxsqGs09kHJafwvqnZDPxqqcgGE79cC7OYSstFkbB2kthghqEUN6e8/z
	 q+qspuXqbO3dYAgKDbdNcSAvK8EWYLRL/oIPzH871lSfiXqUA9qr6MO3iHJ4g9ErvYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708561;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=jgY0YRLdw++1SlF9Oy8/8aCNKHiboset4+rGgzfeZCM=;
	b=ExCOY5oaAFrtqWiXzbYYQ0Z0nCJ3PcnPrpSd0dPso5Uj7L8+O1bajP5b7F6+7smzAAQz
	 BIN5SKv4OFpDwpBY8nteZ8EEwsq/JStCURm4FhobbFKU0k875EJCq+ndDlc4JRSt6Gpte
	 B2bCGf1NqBijIahMPkHH7ewrCElEiu9tOunGkHa0IbWF2IUn8JVhX9RtnhyXaoab39xGg
	 Xcc5qd3UvTuJaaYTUimbn7paZY1Ww5r8e3P0jOLO/pbVkrrEWlNMTHfmhYup/GEDFEJHY
	 tMt8reFamSQjLrwhsqWObseyKbCNU5na+sNe0F+0LLP8fqwN0nXQ8am8Xd3zsHhCMRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=L62vpwCn;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE1606A328;
	Tue,  3 Nov 2026 12:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CE1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=L62vpwCn
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jJnlJ2pc8zKp1r;
	Tue, 03 Nov 2026 13:22:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793708556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jgY0YRLdw++1SlF9Oy8/8aCNKHiboset4+rGgzfeZCM=;
	b=L62vpwCnobxNZTz6ftk/Kg05RFP9iL6z3reG9JEMYnXjcajfPE1MAiPqEnIm9virjrFGfh
	mi6rPxLZFb0sNv/YBL+h/UpipLXadX7pRkhCJjErRivuY8MGZcTySN30ezJyJ4HOdr9d2Q
	NwsZTP6ZiGAQ2AhCe9Dlo86CbNS+TpKvXJNr6X/zSX0rYzJ2AkgJkIxJ+AAdMFpt92wfOI
	0qiLVsI+etRWL+k8b5uYm0+oiQt4z6SPykpLonjUWDnHGnLacgbNGmU0IIYap3i8i4XkjC
	Vo8JNb1USplZcHIW/7I4jHvmpLayGoC7WA1N4AFg4ga2y3fUuvKQ6HvAWhhkxw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: exception-tables.rst: fix bracket
Date: Tue,  3 Nov 2026 13:17:16 +0100
Message-ID: <20261103121716.102730-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.55.0
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
X-MBO-RS-ID: 8aab7e8b7aea86ebc49
X-MBO-RS-META: 6pcqng9waph6xmihdnzmtzam4xxizchq

Remove needless pair of brackets.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/arch/x86/exception-tables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/exception-tables.rst b/Documentation/arch/x86/exception-tables.rst
index 6e7177363f..de776bfdd1 100644
--- a/Documentation/arch/x86/exception-tables.rst
+++ b/Documentation/arch/x86/exception-tables.rst
@@ -72,9 +72,9 @@ The preprocessor output (edited to become somewhat readable)::
     {
       long __gu_err = - 14 , __gu_val = 0;
       const __typeof__(*( (  buf ) )) *__gu_addr = ((buf));
-      if (((((0 + current_set[0])->tss.segment) == 0x18 )  ||
+      if ((((0 + current_set[0])->tss.segment) == 0x18 )  ||
         (((sizeof(*(buf))) <= 0xC0000000UL) &&
-        ((unsigned long)(__gu_addr ) <= 0xC0000000UL - (sizeof(*(buf)))))))
+        ((unsigned long)(__gu_addr ) <= 0xC0000000UL - (sizeof(*(buf))))))
         do {
           __gu_err  = 0;
           switch ((sizeof(*(buf)))) {
-- 
2.55.0

