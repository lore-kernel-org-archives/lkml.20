Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793816442;
	b=Z88nR2xXtcPZBhG74mCea32TyconpeoaDwX5WDXq9TBtA+xE8bthUOWXk0B1HcmmfBi1
	 Xm/voaXti1D43dJDKgHYzdzNF5fIS5Dbqa+0Y6vQaemnNJh43IdFuPITpjV25KlPusMCr
	 3CeD6rUjTlx5EelfD47SgabhPEH+l0QjmILhBft4MdoG6jSjnEndWsMEP6FpW4tmKbhyK
	 NdE01OYx+GHgFiWC17Wt5Pe3DNkp9wCRmzjB+pCj2VXt54gR57Or7IA7JuhXsPu5CAOKr
	 OX9EX2oWYHiQHEHjQ4GoFeENCgYnBB74Uco+K2IMYtJxuJ//BlPh4TBUbDjNsJiJ96A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816442;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qW/uOpHFGEDda3qdjyfj91c1MEcUa2AIk8U2gtEtkv4=;
	b=Bet3lBO6wDc35OkN69V8BzQyYAiH1MvmE2kGWOE1f0sr3UA1DFLbNEpSWIxq+IXaQviG
	 WA4CuRNyJbu3x7cJBgpKRT6aced/qk81e6W5oGesYtqWQn93/7ZiNFNn1kKXwdQFmYGxs
	 05L5284BX5MNwTogMW029U8Y7i9IYIBXRRVExoDxRIwUzceZWaLpanavapYKw9Ky/Tx3E
	 8iikd0kJPC93UP0bIyQ3ETxmE+20X/UCX9kB4xP0oG7iPkXZEwxs7gMtE5DNEH26PEuVE
	 P7yWYZNl4b6s9CxH5yITiG75rYVmaq5zWZsPlomMrUXEMFMu8R67z8yww2gtBaKkqhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNMI8YSV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD666606A333;
	Wed,  4 Nov 2026 18:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNMI8YSV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793816441;
	b=izDZw9OJw0wqc2/g8JAqCmVdd7INbiip6C8x7lJyqh6vm4IdXsdBB5ib1Yl+lvNe88Nb
	 En+pkHEHkNYE8ID+k0Ew+1cj7UBJ3QKz3uXuYR1QcauEBvYMoS7pmKyIxN03w9Vkmb689
	 Lmvkg2WQARh7Bcsu9VmVgwTias+/CPvvZsjudxXTtCZfRmA2bXQaoW29tpY2W7m9LViKk
	 McrVFJBfJ/tbrMslf1O8TxVyKbjLqn+5piWVHaUnKugjOHCj6IKuGY6AqBTGSXnBr+44I
	 KQ6pfxBVyzAl8BLluzKryvhwYRuokyepkikAJt49USGMnIyk85vcTTxwUuYlphVyISg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793816441;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qW/uOpHFGEDda3qdjyfj91c1MEcUa2AIk8U2gtEtkv4=;
	b=msGlhO7xSUhp14ol0LQ/yOMo10wTwZ4+U4szxmPUpNNgn5HXr7tSKpx64d3CucvGz/TQ
	 mdzfIozA29uCTiku1VKY8bZoHjsY076Ls9HjvG2+8wXdNTjxNACNqBpEMMy/vRTDpypoj
	 ZnIwj8fLAewpGENP6y+k/P7CL40F/c23UMQnmQOBUxjz+k+UYBFEilD6y3QVskl6nV2TA
	 tNTBbYR2qlooqJtYHdivww5aUR9oaJyViWA42hny9Mi7RuongK/LDBvfDRnCxm1EkqVF1
	 Vc8OEmOWZZVc1D0DAU1vD/D8PjfRtKZe2eijdz7U3gyQHU3JGn6hM/YMA1ByKt/o7gw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85B691F00A16;
	Wed,  4 Nov 2026 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816441;
	bh=qW/uOpHFGEDda3qdjyfj91c1MEcUa2AIk8U2gtEtkv4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=BNMI8YSVMfkyqQjdaqk8U5gGhqr78KsuibubniPTZhUOr3fH3WvcjtcLrM7dHzEEl
	 AAijTbWu5Bqj+Rm14GG2LGzAbKwJdhV1dph0qlBXAEebWnH4EiCVDG0vuH/82EjLpP
	 35tPCCc4sA2TPVOyhJNWOS+kmB/4xS3jqwWmwOtbxzCV2oU24GxBYWraGrQ0x+uhKD
	 jrSqN5QAEoqTIjk+91g5lnmguVBOS6/KTlu8/U6ANB/gyqPtQmWTX2M/b52zJKq1m+
	 AbEkpisvERxWJJKmLGp4CfWaYLnND9xh9akAYZZyuEco+lfMnuTCqpbS7DXFHMGCYV
	 i+ieKE3pyFLqg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D7AEE46F05;
	Wed,  4 Nov 2026 18:20:39 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 12:19:10 -0600
Subject: [PATCH v2] doc: process: clarify scope of applying-patches as
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
Message-Id: <20261104-doc-patch-fix-v2-1-3601fc35c505@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMQQqDMBAAvyJ77hY3pIo99R/FQ9ysulCNJCIt4
 t+beu9xBmZ2SBJVEtyLHaJsmjTMGcylAB7dPAiqzwymNBVRadEHxsWtPGKvbyyNJelEGnOzkJs
 lStbn79lmHjWtIX7O/UY/+++0ERJWVHPX9Ja9rR/D5PR15TBBexzHF5c/gtuqAAAA
X-Change-ID: 20261104-doc-patch-fix-0241ebee9254
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>, 
 AleSZLucero <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793816438; l=2489;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=sMEgG92lV2S8wukRLwczoLII7snNh4u8DlMtfw3Y3JE=;
 b=XSmrTokT80a04Dod8J6Yb+qjh0NhrufV+RdRnf3zjFMN4o3B2ini6YGZX0ZOY44YeixCC8gKV
 YhVQzSOH26wAA6nH4Nc4pZ7TWqOwd2hJNis52Ou3f7zAn7Vzz10Wq2S
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
Signed-off-by: AleSZLucero <aleszlucero@gmail.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com
---
 Documentation/process/applying-patches.rst | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
index c269f5e1a0a3..285efb6e2df4 100644
--- a/Documentation/process/applying-patches.rst
+++ b/Documentation/process/applying-patches.rst
@@ -8,8 +8,15 @@ Original by:
 
 .. note::
 
-   This document is obsolete.  In most cases, rather than using ``patch``
-   manually, you'll almost certainly want to look at using Git instead.
+   This document focuses on the legacy method of manually manipulating source 
+   trees using the traditional ``patch`` and ``diff`` utilities. 
+
+   For the standard Git-based workflow used to clone the repository and work 
+   with kernel patches, please refer to :ref:`howto`.
+
+   The information below is maintained as a reference for constrained 
+   environments or legacy workflows where Git infrastructure is unavailable.
+
 
 A frequently asked question on the Linux Kernel Mailing List is how to apply
 a patch to the kernel or, more specifically, what base kernel a patch for
@@ -20,7 +27,6 @@ In addition to explaining how to apply and revert patches, a brief
 description of the different kernel trees (and examples of how to apply
 their specific patches) is also provided.
 
-
 What is a patch?
 ================
 

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261104-doc-patch-fix-0241ebee9254

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


