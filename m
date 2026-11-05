Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793906114;
	b=FDKcvtAu7Ib/9yyQjMAhmSbnv5qZNKHuOC+rBRkQgAhvy38olBRcq+JMF4u8xm4CjUa3
	 9qgppJ9UhlDeaXncCJlcjrJ0k0KArmZns6GTLwUfK/76NihcMcwt4pARapN0TzprRX83y
	 6n99Idz9nrw1UxnPgG7bHL8bMuChyXHCGVR7Ul7ZkPve7fLRLL1foUD7Eq36hEXkNgu99
	 iEFkV86PjYl9NnlpJgj/3K4T1RxkOp9ktM3NxNradPljDE8ugb0S7hAJCn37hzESmvCCd
	 4puWI3GEo789eG7oW/UkhtlIiHMOJVfHMiN+6HldIqUtfMSH3DpQ25178H4zuj5HqWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906114;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MpkkzqM49PBx0OBrKa1vrz682hROHV6z9UgJRkS0jW8=;
	b=xgLEk9SVnzhICRv7+WhRSzhtuV8PUY4Zmd9B7bY/2O69IwQCW5MUV0kbG8GuLK91Li+u
	 cUVnUhrYTk1p6UW0scZf5/Wm005Hmfj8a/ShEJmUTtxoRLi5BAxAXUrUQOD6AxcLICxjQ
	 TDQYdaFu5RZD3XZ7b/bq/FpKPmGqgn57o3ULVTiIZpG2Q85NGxddFJAPsRdYQN0wfgdXh
	 X9pxFQ4gVSwz+GVAIP2H6GAUbonpkDiixRAVvKbaAa/UUkNuqVovUAp9EyMuzYRdFAucX
	 A8Ub/5cXDQ3/+4ZGBRpLj5yNpDmVhfjTLKBkpmqy8QtDOFmiQT0yEVI4GbxhaNEJ2Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M5eYWgdW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70853606A328;
	Thu,  5 Nov 2026 19:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M5eYWgdW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793906113;
	b=z7jUqkpry17ZyMXbfxTKx7QnCCB/VV95RT2LKjdGuLuQBCO1d/UopkLhQ7rf5WMIclKa
	 TImhb3AJ3dhvZ3s2G715xIjJo/bDDKQqTeUI3Gi7og54kaBb4uLt/3J/VXFyFl2lq49l5
	 HfroS+yDfbDnuSTmAxZargbxok6R5JXu6AJWt3vMd9Vkf6fiMvYxk0Jjsl44aAX1hynAS
	 7QoOBlJIOAX6I6RC32ZRME+0p/aWc5FmKWrh5Jazsujp1G+PdOj3ZgYgVoS53PgyHxywv
	 cYfmcCEEwFjTmhsifEm2KY/pMWBUw7K95+EbzFbbmGC98k3lA1b+A5WuxH8tGveNwdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793906113;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MpkkzqM49PBx0OBrKa1vrz682hROHV6z9UgJRkS0jW8=;
	b=sGyyC5OidUD6snVbZlxzaALQrUU7gTODXzKroWhAHiHs86JzvxpNe/Ew/iAajRDcVFgV
	 CsaZa8TuL84yTI87UpIPPnpXTl+yCipZtnqCRd5J5nAPonxNUOW78WD48cmnj6vxlAE3M
	 4vOhDvw18ZZXpZqQFWslGgi7A1RkDic83urwtCJoLZ4GUpECCpfpE4r0d1ttu4CzYxWo9
	 zfz/aHteDGnKtK5f84WZsCeaEM5HW1TrKLXNYqbWQ9eD/GRE5qlnTxJ5RhfWEyg5iXqmk
	 4s+SbS5LBNsU5e1FL1NYfc/+IHO1/clT8OtN58ySK6g3gGeddrsS3PW9VShHfB4WaDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 330481F000C1;
	Thu,  5 Nov 2026 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906113;
	bh=MpkkzqM49PBx0OBrKa1vrz682hROHV6z9UgJRkS0jW8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=M5eYWgdWZ/dMzIQEiVrUqbSuFBYNoc/9QOtxMWVd5nDrmHiKaTUbLSmRrkWneDOc/
	 oqAMHrFq2Uh/TZpqXr0K9IqplchuEduyIzur8XDWjcrIsNviegOHNZuLBenTtKuYhF
	 uogAX2tT1zzH8Lmx2LH+dFNrfzuq93DgkeL5m8JtvlgMtM9o8vm2KYvBlh4ZBDIv/D
	 HwZZJPfn4a1EvGENPRaeA7ihDnR43Vfvxqq4kCO9FUy6vymqhQehf5Hod5glTjVOvX
	 +ygKPXGAKdtkF+MENvRjY6TGKMIkEwkPj/ZO4sHJb6uW/n34SLUIV9y5UWyT4oqP1y
	 QEsTIMtDmh7SQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B8223473D0;
	Thu,  5 Nov 2026 19:15:12 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 13:15:09 -0600
Subject: [PATCH v5] doc: process: clarify scope of applying-patches as
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
Message-Id: <20261105-doc-patch-fix-v5-1-0658a9e3e235@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq3ptNMirryHcQHTqTQRMGCIh
 nB3CytCIss3yffPKHruIvfichhFx0PsY9ukYY8HQVXRPFhGn7bQSjsAhdK3JF/FmyoZ4kcqjcA
 lc64timReHafz0rvd065i/26775IfYL7+Kw0gQTrIqMwDksfs+qiL+DxRW4u5NOhdrZM2TkEgY
 8kqu9VmV5ukQwZEZ88+8/lW41rbrcb5N5eYs3EmOFzraZp+ZndC12QBAAA=
X-Change-ID: 20261104-doc-patch-fix-0241ebee9254
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793906112; l=2566;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=EN6cekPPb56Q6tXd+PLg1flIaO+HFXQJ6iP8RFMTeKI=;
 b=lhaJ3a9bk8+wmSU718Ox11hg+qBPbvt1otVm9sRmn2ZoJ7xbVw10r6GPtZ/275iFiALezSOS0
 /QA6NppvzZFCRLwcDnTfTjMEniJJDmJaocC7ccajgfBKSS505VDhD5k
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
Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20261105-doc-patch-fix-v4-1-3eb49e363f64@gmail.com

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


