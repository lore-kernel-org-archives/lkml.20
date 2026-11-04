Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817120;
	b=g3cT4rmJiY0HBZLboVHT/LvQzD7FIvVeklOH2MLGCZSKsVIGprMUrnr5ispya12nPKq8
	 XVol/75ex3IeKZF5xufju1VdrAluM2IFrCRT0JwTmy/OCIg+3h7OvIMVgjwm5YZMAW13n
	 nssmLhoFChoiyx+vFQwTSPg7neVczxJzPBHYBy+YutdYV9132qqAGmVXuUyKl4RypmCqP
	 ktB6TFMl664sli9ElAv02GH+8Vl/5nDpIfqfBk2YY7EgLis3wH3baIpBCxNgfk3psdwNF
	 oe38I8HCOmbSJTocB7Zncben+PXHWPvXsHRxphDHSmk3SpkFM+z1/dUy4NVrpWmfm7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817120;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XGJTPk3ueJIrc5LrToSZHhefLF/SQial71qGQ7MFNac=;
	b=SgIaTwhfbynYqYW5OyWhpl3sE/UcZepLomcrDePZxsn5NiFMVQktgX0StcbJTBbqHcsR
	 ZLUhOVklgIkBFJY1YJL3HW4NPRa+UvsBEVn8g4uxJ8CcJ4ngFmsIZnDsHJIQ5+nMYndqM
	 njWRn3vHL+XcY4WxvtOTy504MkISuO1WVc2q1W4L7mObpPipoGW7vcjZd7+J8VAFGkwpy
	 7qTNq8KuSlDv/bDuBlfv/5+iMR4x3kKXXprhBqEQIm+7RUPSU6NN719gRp0rAuifQxsMj
	 eRs/i036jruMZZSE3c3TUutc0DArw9G3lyN944yytMgRFXPb+6h2C6drOOxg2MinUKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JfRTr8uI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8504D606A31B;
	Wed,  4 Nov 2026 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JfRTr8uI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793817120;
	b=w2Hiok/ZpGOw751KZCaGIcc8II5axd1h+YRsIFjo9kEaVCgma7DZYR/TvqhoK6IlDbeD
	 WU2cB7B9L1546EqUKov8mX80Orhl0Ma7EhdTOtSh7gGphep+1QazjMD/7GDBNHF8GfG3d
	 0pEldZ/ioD24uR+7BIS52fbspzFItCbj7Yy3otX2KKwhPU/Tm79ynB+Npc0jsFA9qbRrr
	 +ArkEOVKIFxnxYOLwdazpYgq36czfzFST9P0GdJ5iBFcZY3kQRxu378oXF8LtDfrAWd9K
	 AlOQvti3bjmmnZs/aDv6ROusITVjxfF3zpggFKc7fuktoLmyirxYN+9Bk081JDZeEJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793817120;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XGJTPk3ueJIrc5LrToSZHhefLF/SQial71qGQ7MFNac=;
	b=c420WMf4i0A8uhjEy8rKGCA8R7kLRSKkiyEVxWXTjZ6vfu0QUqrL/yL/aX6/gJ0pnBP6
	 v4RRnSR6qJPiDpu5n1RVAct9uhYTDX2KOLu9L0tpAmCiSX96zVh/qtzA39iZlLKED0IRz
	 b4g33aHyj4CewPFrQV3xyVRF1Owpb2H6XO3hFNYiidv5HkY8ERZByOsmOtRdSBq/aa3eG
	 KcdXf3xCUbrgp/vZjhf7BrRzsLs7eLD2h42QOvqBBFWs3XPma1E1O5pJAUEV4Ex1FAP9K
	 75ji4JeXTQOelPu+aC6KR+YT3CGcWhHwtAJvpzk4DuoqncvPNw3g0ikmqFtcEI3CKrA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B58581F000C1;
	Wed,  4 Nov 2026 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793817120;
	bh=XGJTPk3ueJIrc5LrToSZHhefLF/SQial71qGQ7MFNac=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=JfRTr8uIEWxHA5RSXiPiw0ePCVK0kANqugJ5sZ5nI6DxF/aJCVx9KkeGffIfweyvx
	 qSTrz6OlXlO2U7E6gU7o00RaNfkKG3pziR0+20OuAXFpWa7e3AFFYOR7raXwwGXVMT
	 sQJQQKTzwh/5ZETFm3w/JSRh0JvZKi8QVbejtVkj4SscCDNnNo3NoHLLaUerPgJx8V
	 cdIM4ix8D3MQrHjWRp44RnGKkeqHRH48PrrFGAR19AFFzyYTOx2LWfxfRsKrVLmimo
	 7vCRhrDgEihfhixm0kIYgoDV/oly8uLhvjPzTrFqXrdI4O7WAvADSCCNZck098R5sM
	 GrWnzaytXdE4A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E2A546EF9;
	Wed,  4 Nov 2026 18:31:59 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 12:31:47 -0600
Subject: [PATCH v3] doc: process: clarify scope of applying-patches as
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
Message-Id: <20261104-doc-patch-fix-v3-1-f71cc8ded7d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32MQQqDMBAAvyI5NyUbE8We/EfpQddVF6qRREKL+
 PdGT720xxmY2UQgzxTELduEp8iB3Zwgv2QCx2YeSHKXWGilCwBlZOdQLs2Ko+z5JZU2QC1Rpa0
 RqVk8JX3+7o/EI4fV+fe5j3DYX6cIEmQBJbZVb7AzZT1MDT+v6CZxnKL+W+tU54WCHnOLVtnve
 t/3D+wXCcnoAAAA
X-Change-ID: 20261104-doc-patch-fix-0241ebee9254
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>, 
 AleSZLucero <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793817118; l=2723;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=PMPUGDIJvLaae9nOJ6pUNp9dXumq3tumeNOVCpv6m7g=;
 b=c1t7ZENmhzR9byPQwQqzthMaaLAVtTVBK8JL4w+j6x4Rzk0Ymme33pQUk2lEqudOAMu7Pueqi
 hiFQGu2A3/yDA5mFQZ49nxAf8Syt8rbalea07FTA8+a9OM59fVd10Za
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
Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20261104-doc-patch-fix-v2-1-3601fc35c505@gmail.com

Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com
---
 Documentation/process/applying-patches.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
index c269f5e1a0a3..59d16b4e0889 100644
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
@@ -20,7 +26,6 @@ In addition to explaining how to apply and revert patches, a brief
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


