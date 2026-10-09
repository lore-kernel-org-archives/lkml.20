Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56D8175A95;
	Fri,  9 Oct 2026 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534705; cv=none; b=RwrsQP8cumxnAA+YFPtaCjRWcwA74x2G1RzJjpYfTGr3Q2+9QNavRuMdBxQ6t76Jb7+asUmfOQ8YE4fFRzkWusEj9uOEUmZo/2EgG22xZVm7rd+Ixjw8sFx+rkGqPV9gkScxKacZwpTkj9W/gLSUOgi/TfpWd+JK1DhmQkw3t+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534705; c=relaxed/simple;
	bh=NJjxCp+nRN3fdBFPvl6wi7Uel1u9jaZRB/mdtdoRkPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KhLVCdBzE0Gj2ye6GYKsOg1gaPuSugaQMJiENXz9L4SUD94OEpXoWWRIbFljb9Qf9BfrTSma/3P+fOfJ0o1Ohm13Hic61QOVHEeRSvtKVrH6zULAWRaZXvv3NrWhyerfFEysolIS4MbRdpNNW0Tc4aFCoFDfY/0qdxFcSaqDsDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKWEH9rz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKWEH9rz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511FD1F000FF;
	Fri,  9 Oct 2026 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791534702;
	bh=m6NKVUXFhmaB2VeLEuRbp4QVcPVBGXLpktP7Gc0p9Ow=;
	h=From:To:Cc:Subject:Date;
	b=nKWEH9rzWGfGGeTk5ASF1fecG+mhdIr1uabgLHWaF4jjTYWVpZ7pBSzhnwEW/VljW
	 W6WgYzvMyZ/Ybeu/9uTV0wiXGn7tea/xUyx4RY/SlwGFKu9UBH28EtY71InHLMWt1K
	 0Z5GzwWOITxOeEdlw6VK8hh3WN7IsdOe1kDhZRktK6tApgBwSrERr0XP26+Nq2GwDG
	 n/QdunDvKl04MmU4kPNPtjaOpJ7WJ4ZZ+BgyMwvaa2uZox+DAUmJWKLuU2DG+vnKhL
	 fw1qoJCz3UhAb8hOih7kO8deUVcDMSMXmsEAjAGRXQNxZoYyeVO6tENxEuek+7kVgs
	 FW9vHfEcuqRJQ==
From: Sasha Levin <sashal@kernel.org>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	federico.vaga@vaga.pv.it,
	apw@canonical.com,
	joe@perches.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] docs: remove Assisted-by references
Date: Fri,  9 Oct 2026 04:31:37 -0400
Message-ID: <20261009083137.3-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Maintainers Summit reached consensus to deprecate the Assisted-by
tag. Remove the documentation requiring it.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst   | 21 +------------------
 Documentation/process/submitting-patches.rst  | 10 ---------
 .../it_IT/process/submitting-patches.rst      | 10 ---------
 scripts/checkpatch.pl                         | 11 ----------
 4 files changed, 1 insertion(+), 51 deletions(-)

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 051f0d819f68e..509dbf23a099b 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -40,24 +40,6 @@ is responsible for:
 * Adding their own Signed-off-by tag to certify the DCO
 * Taking full responsibility for the contribution
 
-Attribution
-===========
-
-When AI tools contribute to kernel development, proper attribution
-helps track the evolving role of AI in the development process.
-Contributions should include an Assisted-by tag in the following format::
-
-  Assisted-by: LLM [TOOL1] [TOOL2]
-
-* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
-  (e.g., coccinelle, sparse, smatch, clang-tidy)
-
-Basic development tools (git, gcc, make, editors) should not be listed.
-
-Example::
-
-  Assisted-by: LLM coccinelle sparse
-
 Procedure for finding and fixing bugs
 =====================================
 
@@ -82,8 +64,7 @@ these steps:
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst).
 6. Commit the working fix with a detailed message describing the problem, the
-   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
-   Assisted-by tag, as described above.
+   solution and a Fixes tag. Do not add a Signed-off-by tag.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b46..5f4e0156cca78 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -632,16 +632,6 @@ bugzilla.kernel.org is a public place in this sense, but email addresses
 used there are private; so do not expose them in tags, unless the person
 used them in earlier contributions.
 
-Using Assisted-by:
-------------------
-
-If you used any sort of advanced coding tool in the creation of your patch,
-you need to acknowledge that use by adding an Assisted-by tag.  Failure to
-do so may impede the acceptance of your work.  Please see
-Documentation/process/coding-assistants.rst for details regarding the
-acknowledgment of coding assistants.
-
-
 .. _the_canonical_patch_format:
 
 The canonical patch format
diff --git a/Documentation/translations/it_IT/process/submitting-patches.rst b/Documentation/translations/it_IT/process/submitting-patches.rst
index a742610cb0709..d0e0d6c9ecc2e 100644
--- a/Documentation/translations/it_IT/process/submitting-patches.rst
+++ b/Documentation/translations/it_IT/process/submitting-patches.rst
@@ -691,16 +691,6 @@ un luogo pubblico, ma gli indirizzi email usati lì sono privati; quindi non
 esponeteli nelle etichette, a meno che la persona non li abbia già usati in
 contributi precedenti.
 
-Usare Assisted-by:
--------------------
-
-Se avete usato un qualsiasi tipo di strumento di assistenza avanzata alla
-scrittura del codice per la creazione della vostra patch, dovete darne atto
-aggiungendo un'etichetta Assisted-by.  Non farlo può ostacolare
-l'accettazione del vostro lavoro.  Fate riferimento a
-Documentation/process/coding-assistants.rst per i dettagli su come dare
-atto dell'uso di assistenti alla scrittura del codice.
-
 .. _it_the_canonical_patch_format:
 
 Il formato canonico delle patch
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a63..c9840f5219c2a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -655,7 +655,6 @@ our $signature_tags = qr{(?xi:
 	Reviewed-by:|
 	Reported-by:|
 	Suggested-by:|
-	Assisted-by:|
 	To:|
 	Cc:
 )};
@@ -3124,16 +3123,6 @@ sub process {
 				}
 			}
 
-			# Assisted-by uses a free-form value (e.g. "LLM"), not an
-			# email address, so skip the email format checks below.
-			if ($sign_off =~ /^Assisted-by:/i) {
-				if ($email =~ /^\s*$/) {
-					WARN("BAD_SIGN_OFF",
-					     "Assisted-by requires a value\n" . $herecurr);
-				}
-				next;
-			}
-
 			my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
 			my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
 			if ($suggested_email eq "") {
-- 
2.53.0

