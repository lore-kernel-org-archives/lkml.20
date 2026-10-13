Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7124FD272;
	Tue, 13 Oct 2026 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893708; cv=none; b=fhdGTIe6lBc4CJpOA8ZKlu0PEbFWm6w+S+gBGmjp8yefnOk0Ds9/3DB1b3zgPtufQe33C6WzMozYz/1gDj/1kCpUGuRVlWuhrghQ7BChjtHBfXyKJKsljqkRsSo6suKNf8V7RVIi4Z/M47ap6LQMvLARhdyoVeiF2qoYkBGbqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893708; c=relaxed/simple;
	bh=4M20D504q0ZCQTVOyoL2gjGWdMRznGiUEeQcUFyNWoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AmwMI1sJxUmXFdz98rW0n0S8SelENQrq+sdhPIILoWeebiaAxG+KQBEOvr3GNKLYYlZMw0hylALh0uo7DHlZtl7GXaGVHY3iDjrIFfagY7vFhaw6MbDrO01svMQwXUJvSz9IM9OWwScRHhBP2sAJvYIUHCmWVPZ+1wQ6ULNhtLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+fmZbrc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+fmZbrc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207141F00893;
	Tue, 13 Oct 2026 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791893706;
	bh=ol0r0xyI57CbiZoEw7g0K/a40GjHU9K59dRHlAamXVs=;
	h=From:To:Cc:Subject:Date;
	b=O+fmZbrcWxxr/bak+a4hM1VIVWx4qi6345/Aa3Pt4lQO/8LeGYUSAcfvjykJ/yUCI
	 X6SIVv/CKCAyTguEtcS8Yp4KMrG9W9butSHNO8Comif6QCPoONKMlW2iRrBnlNXSbO
	 e2QMNs5ikTzMQlK5gGbI8fqRlOqT6/8tVJ74Be41WJ34uSy1zzXQirofBT9auOAjrZ
	 8IJQHHFe2Hcy/fc9r5Kw4IoVTZVsJAwtn4YGiDnDwsDMvmVSCo8nnQ6L5ohFCpaMsY
	 kmbVenOfPNExHRQdb6h1vVhMOQgWyyxtCQQfiuy4+jrGx0dRb2TDj5QlOfFpl9ysBs
	 bB0b37dKi+WWw==
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Brian Foster <bfoster@redhat.com>,
	Carlos Maiolino <cem@kernel.org>,
	David Disseldorp <ddiss@suse.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Justin Stitt <justinstitt@google.com>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: remove Assisted-by references
Date: Tue, 13 Oct 2026 08:15:01 -0400
Message-ID: <20261013121501.3738437-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") asked
contributors to add an Assisted-by tag to patches developed with help from an
LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") later
reduced the tag to "Assisted-by: LLM".

A proposal to drop the tag was turned down in July [1]. The main argument for
keeping it was that maintainers wanted a signal that a patch was LLM-assisted,
so that they could review it accordingly.

The tag came up again at the 2026 Maintainers Summit [2]. Roughly 10% of the
18,533 non-merge commits in 7.3 through -rc7 carry an Assisted-by tag, while
actual LLM use is far more widespread. Some contributors do not know about the
rule, others leave the tag off on purpose, and few maintainers ask about it. As
a result, the tag does not provide the signal it was kept for: its absence says
nothing about how a patch was made, and for developers who use these tools for
almost everything, its presence says little more. The choice was between
finding a way to enforce the requirement and dropping it, and there was a
strong, though not unanimous, consensus in the room to drop it. Greg
Kroah-Hartman, who argued for keeping the tag in July, supports removing it now
[3].

Maintainers do still want to know how a patch was created, but the view at the
Summit was that this belongs in the cover letter, where it can describe how the
tools were used, rather than in the changelog.
Documentation/process/generated-content.rst already asks contributors to be
transparent about tool use and is not changed here. The rules on the DCO and on
the submitter's responsibility for the patch stay as they are.

Remove the Assisted-by sections from coding-assistants.rst,
submitting-patches.rst, and the Italian, Brazilian Portuguese and Traditional
Chinese translations, and drop the handling of the tag from checkpatch.

[1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
[2] https://lwn.net/Articles/1099594/
[3] https://lore.kernel.org/all/2026101327-cupid-legal-6cf6@gregkh/

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Changes in v2:
- Expand the changelog with the background and the Maintainers Summit
  discussion (Laurent, Krzysztof, Greg, Lorenzo).
- Rebase on docs-next and also remove the Assisted-by sections from the
  pt_BR and zh_TW translations there.
- Collect tags.

v1: https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/

 Documentation/process/coding-assistants.rst   | 21 +------------------
 Documentation/process/submitting-patches.rst  | 10 ---------
 .../it_IT/process/submitting-patches.rst      | 10 ---------
 .../pt_BR/process/coding-assistants.rst       | 20 ------------------
 .../pt_BR/process/submitting-patches.rst      | 10 ---------
 .../zh_TW/process/submitting-patches.rst      |  7 -------
 scripts/checkpatch.pl                         | 11 ----------
 7 files changed, 1 insertion(+), 88 deletions(-)

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
index 4c28a239e8cb5..f271d7413f72c 100644
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
diff --git a/Documentation/translations/pt_BR/process/coding-assistants.rst b/Documentation/translations/pt_BR/process/coding-assistants.rst
index 2055af34a9081..f6062b22a8fd8 100644
--- a/Documentation/translations/pt_BR/process/coding-assistants.rst
+++ b/Documentation/translations/pt_BR/process/coding-assistants.rst
@@ -38,23 +38,3 @@ A pessoa que envia é responsável por:
 * Garantir conformidade com os requisitos de licença
 * Acrescentar sua própria tag Signed-off-by para certificar o DCO
 * Assumir toda responsabilidade pela contribuição
-
-Atribuições
-===========
-
-Quando ferramentas de IA contribuírem para o desenvolvimento do kernel,
-a atribuição adequada ajuda a rastrear a função da IA no processo de
-desenvolvimento. Contribuições devem incluir a tag de assistência seguindo este
-formato::
-
-    Assisted-by: LLM [FERRAMENTA1] [FERRAMENTA2]
-
-* ``[FERRAMENTA1] [FERRAMENTA2]`` são ferramentas de análise especializada
-    opcionais (Exemplo: coccinelle, sparse, smatch, clang-tidy)
-
-Ferramentas básicas de desenvolvimento (git, gcc, make, editors) não são
-listadas.
-
-Exemplo::
-
-  Assisted-by: LLM coccinelle sparse
\ No newline at end of file
diff --git a/Documentation/translations/pt_BR/process/submitting-patches.rst b/Documentation/translations/pt_BR/process/submitting-patches.rst
index aad926c17fb45..4d1e75935745b 100644
--- a/Documentation/translations/pt_BR/process/submitting-patches.rst
+++ b/Documentation/translations/pt_BR/process/submitting-patches.rst
@@ -650,16 +650,6 @@ bugzilla.kernel.org é um local público nesse sentido, mas os endereços de e-m
 usados lá são privados; portanto, não os exponha em tags, a menos que a pessoa
 os tenha usado em contribuições anteriores.
 
-Usando Assisted-by:
--------------------
-
-Se você usou qualquer tipo de ferramenta avançada de codificação na criação do seu patch,
-você precisa reconhecer esse uso adicionando uma tag Assisted-by. A falha em
-fazer isso pode impedir a aceitação do seu trabalho. Por favor, veja
-Documentation/process/coding-assistants.rst para detalhes sobre o
-reconhecimento de assistentes de codificação.
-
-
 .. _pt_BR_the_canonical_patch_format:
 
 O formato canônico do patch
diff --git a/Documentation/translations/zh_TW/process/submitting-patches.rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
index b780f1539b46b..4a7c046b23894 100644
--- a/Documentation/translations/zh_TW/process/submitting-patches.rst
+++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
@@ -503,13 +503,6 @@ Fixes: 指示補丁修復了之前提交中的一個缺陷。它可以便於確
 的。注意，就此而言bugzilla.kernel.org是公開場所，但其中使用的電子郵件地址
 是私密的；因此不要在標籤中暴露它們，除非該人在先前的貢獻中使用過。
 
-使用Assisted-by:
-----------------
-
-如果您在建立補丁的過程中使用了任何進階編碼工具，您需要透過添加Assisted-by
-標籤來聲明這一使用。不這樣做可能會妨礙您的工作被接受。關於聲明編碼助手的
-細節，請參見 Documentation/process/coding-assistants.rst 。
-
 .. _tw_the_canonical_patch_format:
 
 標準補丁格式
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

base-commit: 8fdbd353e6928492fdc46c359aabd2bfb7630fba
-- 
2.53.0

