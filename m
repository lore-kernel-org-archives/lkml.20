Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794001828;
	b=RccaEkDVzMGCRb66iEII/QhWXxIGAMx3QGGDq5wMVZBW93eVfw0MJihTLcfGnGKgu/0U
	 0WB2io1Y9QFs4WjsSFbw7JlPpjtfF+cZJkGprzfocZTVxFnHoCDuEdG9Fe+/0quRL5kVL
	 bDx7/yrGYi3B0hKVnFCW7UyB7T0XKgnOMFZUEufZXc33WpDtMx7Dha8muD3hZuCOGXoKv
	 ucbhXvdMio2BUT6jCZcdBQNeUMExOtvXt7k1k+n/G/ggFmD4WJStHwSUQ95T2SG/8gf/q
	 pKdvze/T0WuHVvik+KMqmMxmqsvjzwbH/UzxxyzshMxBc040OViH9VccGIW1GqtaBaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001828;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JH0LjgCVYJBofyndAf4VOWW8jyxyMo6HqV30iWjGyFw=;
	b=Km3yuZPYSKOBCsTyLOSmWm8vAmgJ85jpAjQeqSBbYtGrKRJkrUo1v7/rjGzDRX8vDbot
	 ovKmaOs1gqmLWf8zRFjT6Lc26eyO1t8bZnyaD4/G8dYBRbF1yUV4iWbS+W2DniG4tQ9db
	 Y5a+A+0bHQOO3PU8dbi4RHYla7ACseCEop+eGSJE/6RXhprYpXcUooECtCHtihJzVDSH0
	 PXRYM0nPE5FNgTU+QVpNfNrPX+psTDzX7d2Ea6+DiURu/ECWEEg9mckSPOG8B57iCHjOY
	 TccTWMnfl7yJHEmc2mUgl7mbb6tsjdGb6sQW+hYb8lj5q0ojXVUYi0RVXekjJvxgFDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MtcW4xj7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3801C606A326;
	Fri,  6 Nov 2026 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MtcW4xj7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794001828;
	b=OscBCCkhL5HxJqeBz+HsDlnNN2MPG8KwZ1WmQSzfk6CjSGthDTr6ehSa5QIQg34sFS7G
	 vjNTq1CnMUJjgBEqHzaGUR0EU/1oq8xDU2BHBtB+6qmzgSXpvQkGL5aNwOvwKRq2s1jvC
	 MrNrxs5yX1ee3YQIincSamUHbuO7MiGMy2UmtGfNxOd76tuLGHAA0zPFNMBkxd5JzlJjn
	 UpBAiFeX8MMtr6Fo4Z8rS0nJuTBqRTHusTlBmlinqd0+mvFL4oJqT3HYgZjKJrql+ugU4
	 3o9J7FYNuVcu/t3gaki95/t1PWb/AhvO3QmWXirlLXB2BcpxdhZspNVGKdD/u1ZbWJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794001828;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JH0LjgCVYJBofyndAf4VOWW8jyxyMo6HqV30iWjGyFw=;
	b=BFQuQAPLcVoG9pO/R9phJtqrlt+7KgDfH5F7mZw5LRTWTZGwSEH6oqDl3G/qoxdSwHPd
	 tVqN9SWicE9EudzWrvlOrTRBvmvT/lmyi3x7Zin71rheyWJdaugDmLhYzGlRDLihjQan5
	 JQZt/2AERHG2trK9jGZGzptB088etzxMm/f40BAnCDgoxTbqT5q5kvGRM7Fi4jiPl9CGN
	 qvnGzLycZ64mvRAIXxJL8N6OjfUiaZKHPM9jCOO565mlhf2uVr5NMoa/whDL4MRmm1xHK
	 4hDmjxttOcyBoijrKlTIysoIl1tZewW4UPv22dwXSn9GU+5177CMgnVR4sQQ4L/I2MA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 815761F008A1;
	Fri,  6 Nov 2026 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794001828;
	bh=JH0LjgCVYJBofyndAf4VOWW8jyxyMo6HqV30iWjGyFw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=MtcW4xj7X0Dgpi004uG3O2QQBH7OkGotxwhVERll8QdNlc2NC4gRUzotrM/XRdg/n
	 v4PNXM7pZRF+dGeVJkH7qDedcO4akIQLRChrdoJN7gMRct/fh0scAV/49P59yW87u2
	 b8i/RSgBqcF4y31jZFxzxTTwBRWfU7RId1MqB2ZRiqs7N501P2uUQw1/d38/9mrg0p
	 DyaaXKiERM0xiNqoVMd3gjMWpzFgVvIXe5HGRmvo8BMeE/rVgSez+CNJXKi7FpI6Vp
	 e93TeO5oA3uqnWVn7NUAL2E1dgs/jTGSoo3MfXE+mr4OMu7Pi8jL2CkO5gESyBq8Z/
	 FvGQe04tZOV2Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D24C0478A1;
	Fri,  6 Nov 2026 21:50:26 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Fri, 06 Nov 2026 15:49:52 -0600
Subject: [PATCH] doc: process: clarify legacy status of applying-patches
 and point to Git
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
Message-Id: <20261106-doc-modernize-git-v1-1-8b59c1a578ba@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMBAF0avI1i64EVJ4FbEI5hu3MJFERBTvb
 rB8xcxDBVlRaGgeyji1aIoV0jY0ry4GsPpqMp2xIp1ln2bekkeOeoODHixwkN4JrOmpdnvGotf
 /HKf3/QAr9AyCYwAAAA==
X-Change-ID: 20261106-doc-modernize-git-1eae13a1e623
To: corbet@lwn.net, aleszlucero@gmail.com
Cc: rdunlap@infradead.org, krzk@kernel.org, wy@wyuan.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794001826; l=2295;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=FfmGaQr2PKw9L5UvENGZLwJkaVf3M6sYK2t9mS4IA9Q=;
 b=qPWnFdIadXQLDEOV/h49Nc6q7aih2Vny04cBm74A96kxu1S48fDPvEOo4mVC4VOwOTBHtFzOC
 WI3IL+4cJxJAHlmSF3d0hcBEV43x5/eQDZwQyssZ2An4hUwRETenC/x
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

The applying-patches.rst document heavily details the legacy 'patch'
utility, which creates confusion for new contributors since current
development relies almost entirely on Git infrastructure.

This patch updates the opening notes to explicitly mark the manual
patching process as a legacy reference and redirects readers to
contemporary Git-based guides.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
The applying-patches.rst document heavily details the legacy 'patch'
utility, which creates confusion for new contributors since current
development relies almost entirely on Git infrastructure.

This series updates the introduction to explicitly mark the manual 
patching process as a legacy reference and redirects readers to 
contemporary Git-based guides.

Thanks to Randy Dunlap, Krzysztof Kozlowski, and Weijie Yuan for 
their initial conceptual review and support.
---
 Documentation/process/applying-patches.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
index c269f5e1a0a3..2ccd74d6dd05 100644
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
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-doc-modernize-git-1eae13a1e623

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


