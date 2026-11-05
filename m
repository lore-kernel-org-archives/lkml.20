Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793906061;
	b=noA9bM0dY/iaVvpwFYt7xrcC1+JuBAHFTyL9bNB00X5OF+GPNPKYOrFQ6kWK8Z2e6TBR
	 qtYKvvttsrgw6r9Ibcpmy2y8duSuE/8J2Jm89jrWenXIDIrn8rceeuIPOWRr0uGwznChJ
	 aVaW45+GOxrpv6f0K1uh1EkNG1Zju0LRPrRv6NnOPsKH/eht6DAY+TlzEe8J7n3H9xWm3
	 UTxlCEfjzDrg+QfADnZpfkk3k8miMu47r3JGSWn+/9PneaCNZJIrGr3TwTmsd+b8+NSai
	 UiZ/rKCHSyEzLTwbZm+5VEsed7XX3jWsEjh3HUg2RHS3haIDm3st44QPRbKuVur5UXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906061;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LzkxII8lAiBQbIMBPyJuv54STnicmUncYENK25TQp/k=;
	b=WgjcSEAj0ZZbPsgeXwfW+pdThfbImB+vs3fn0zyVroKo0r3zTarKabrzWSHlxwyEz4Cr
	 o1dDLVwibw46udsAQ7s6q5gzZOkpm4/cCzNJTtGOZEC2fLn3uWyH1JBEyUdwivgOsmA/F
	 Zqe0mKbx5SaZ3yhm4nv/tF0ws7SfMio+03z+MxaE6SG245OLsIVrcsLZfaQ6r52yQMQ0v
	 XQuprXXifH9jpZydH/mfy0Bh38ZNe0Zp4m09WrecqicQd1loowkz+Oi7XZLb1b/ressoz
	 WoVIlTHlybzwu4HXg0QRcDH0RwXlBa/lpSPGgFfBxR00xZNnp4WGnzysxL28FNMjWpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfgWkv9z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46E606A32C;
	Thu,  5 Nov 2026 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfgWkv9z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793906060;
	b=eReEQwdP01SYFCeBQtyn+NZcGsjSvhCjEg5mw2/8TjEYSNdBGqoInrX5LC7reriUroZg
	 vEe7jBC8zUojbLDaDYGPCnAZGugWJqSegRQzqtfYLj+qeERQmr1Zd2C9+P2ddAzZY0bek
	 UahVTtTrPyhPG5uUS6EUu3AzMfNks+j8q5qmGwL9kJUE1VFc+33UmrtaK9AeQLmtwHM/i
	 E0cDWeaeqMP20CrKp8aPVqlfKwQyULd+8mkp2cD/r85nrZwjUjRR9MT8ciFzplms+RsC8
	 LMLREv7Khr63rzfLqCgpOOyFPIs/f4LCeysmIYnZPFPmD5hZnllGfvQic0t6DgX0pXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793906060;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LzkxII8lAiBQbIMBPyJuv54STnicmUncYENK25TQp/k=;
	b=pVXqXC7kHMRZIWPjtCxb6k89ZBwZJWLdLGXRlFsknfGLfDqGlIIgfG0NBbwRtvpueURc
	 aY5A1KLxOj3bgBXHwIw5ftdKN5lamwxQDA7k0wi7KoLLxvwvWTWN3KItZEvr5rsPYnIbp
	 kJy7njQ+th8m0sERKwZASzAT5p8mUnEF+B174Nr5dcsqxa6GM2SEloyllzuXln0w3DMhf
	 MUqa7L40q0KRBbPtKsw18eIHDwAQ3ukd68QaW14lcj2v1dpgTGSz+ZiWqQL1xqNQuEY2C
	 0lKA+MTo6CjqiGLjaVYEIdeAPNEMOs2E1GvhYwH2KM5I5qLxikPDHMqOYMCzrNyq1jA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DAF401F0093A;
	Thu,  5 Nov 2026 19:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906060;
	bh=LzkxII8lAiBQbIMBPyJuv54STnicmUncYENK25TQp/k=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=KfgWkv9zDU/KRv8ddBjGXcA1g1pZL2YGElH+Mq056F8yr2L1P3AwusHlqajXELXFq
	 PhAXUOSRFg7LKZG5hrlwDeF43yBLMv/rkTvaYVKI+08QThn5lboSGeWz263TGi+1uC
	 +/Zms82ZgFPgNgmZLzLDgT0g3KPRKJiLuBGXJmeFouF1I3zUyntfFJCQBY2aIotyGr
	 sPz8FLB2C0O3uiEyI9emQ+7U3oet12hIpozW1JZxHE+eBXjzbpUL6pUUx6UXszReI+
	 DBdVJWxMYZLrCMANsq0m2p8mjEuBqQVxEhkix+wE8RbWWd5yKTZypsHZj5Xgi/ONTQ
	 Ql7/WVpYCYCbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3619D4735C;
	Thu,  5 Nov 2026 19:14:19 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 13:14:05 -0600
Subject: [PATCH v4] doc: process: clarify scope of applying-patches as
 legacy reference
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-doc-patch-fix-v4-1-3eb49e363f64@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33MSwqDMBSF4a1Ixk3JzUNrR91H6UBvbjRQjaiEF
 nHvjY5KoQ7Pge9f2ESjp4lds4WNFP3kQ5+GPmUM26pviHubNpNC5gBCcxuQD9WMLXf+xYXUQDV
 RKY1myQwjpXvv3R9pt36aw/je8xG2918pAgeeQ4F16TRaXdyarvLPM4aObaUoD7VMWuUCHCqDR
 phfrQ61StoVgHixZAtbfut1XT+8xyF6JgEAAA==
X-Change-ID: 20261104-doc-patch-fix-0241ebee9254
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, aleszlucero@gmail.com
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793906058; l=2347;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=uXAeXMYJHBZaq18If5t37B8wZb2wghKi5aFBALJmnDg=;
 b=khlWhtgm3JIArww2rBqs4kYMf3N+eC2YdcxDXdzbYFWUnNfeTTQyzy1t2hsgJBvRo1GCKxf/v
 dsCfLkNF+lxBh4wxMs4RfXEp8j7W1aFBbPcZfL18pwyTeNb48bsR6Ia
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

The applying-patches.rst document describes the manual manipulation of
source trees using the traditional 'patch' and 'diff' utilities. While
technically accurate for non-Git or constrained environments, it can
create friction for new contributors seeking the primary Git-based
workflows.

Update the opening note to explicitly state that this document serves
as a reference for legacy or constrained workflows. Provide a direct
cross-reference to howto.rst to steer contributors toward the standard
Git infrastructure.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Update the applying-patches.rst document to clarify that it serves as a
reference for legacy or constrained workflows where Git infrastructure
is unavailable, redirecting new contributors to standard Git-based tools.
---
Changes in v4:
- Restored missing blank line, cleaned template markers, dropped duplicated alias, and updated links across versions v1 to v4.
---
 Documentation/process/applying-patches.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
index c269f5e1a0a3..70142c8ec9a3 100644
--- a/Documentation/process/applying-patches.rst
+++ b/Documentation/process/applying-patches.rst
@@ -8,8 +8,14 @@ Original by:
 
 .. note::
 
-   This document is obsolete.  In most cases, rather than using ``patch``
-   manually, you'll almost certainly want to look at using Git instead.
+   This document focuses on the legacy method of manually manipulating source 
+   trees using the traditional ``patch`` and ``diff`` utilities. 
+
+   For the standard Git-based workflow used to clone the repository and work 
+   with kernel patches, please refer to Documentation/process/howto.rst.
+
+   The information below is maintained as a reference for constrained 
+   environments or legacy workflows where Git infrastructure is unavailable.
 
 A frequently asked question on the Linux Kernel Mailing List is how to apply
 a patch to the kernel or, more specifically, what base kernel a patch for

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261104-doc-patch-fix-0241ebee9254

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


