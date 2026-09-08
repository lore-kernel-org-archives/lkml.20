Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983A157D237;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884726; cv=none; b=u7Qeom6CrfIJCmq3+i6GN9BG+htUZylxOWHVmfc5kjecgHFGd8MGXq+SwucmOJ1FCJswKI8faE1tylVFfEqCdAuRnwlsrBOLFmjNaDlzsfPqYVGoRgiEPfUDMmHvKL3dp2rHOzG3XjsE+sOodpAnA2bQnrYO/7mgBBR7Vahzo+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884726; c=relaxed/simple;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLkrzZgWbOUTCxHFomY2SGJ513zvdsDWvN8DSlUX9LqrhEZ8NqxcOGTr+XHFbWMw43JGQy5GhEfm0+AFB5W2cRVzpWLDi6rx606MwFvGiSaMia7t2W+xxACHVM9jPfzEOlbPnlJPlS+UcLeKrZiJeg0zadTiYQO7yN453Yl7Vqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoUiJUMD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoUiJUMD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59302C2BCFA;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788884726;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PoUiJUMDJhbR3OD6Y2Om8TgqoI58GhCiOWBIKdvWquvIGRHbKVEP+DGjjtRAgJsXl
	 d/mKl4Dfn5N7XHy8ASw5oMPkz5kR0i10D72BtKsdZnbFZ8BAk7Hwg41c+nGLu7/Gob
	 Wxe6rtyGS/5pTIJbyb5j2Z5tvFDjmHjBdMzOvAwipSLfk4MRcseZhuDYjjlMq2YTvo
	 CyZTNPz+as83o8kVwsP63TaGq5NN4HjVQ0YEufU4yEbLtVhkO3xjrQ8EuRbNCOlPUQ
	 /Zf4DdaajbyUGOp9vnaEe/tgiT9knULnCR5thjgd/Tzwxr7CKE8N9guYa0LkLePyBh
	 HU8WEkM1cDQOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E4BC79F9E;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 08 Sep 2026 04:12:43 +0200
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Free Mobile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-for-upstream-nbxv3-dts-v3-1-1d88b2c11680@free.fr>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788833565; l=855;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=GS6HXtqxwlBUlcOkCxh64ErhDBGMmoQtgCG1FanLSW4=;
 b=U70+sqMTAWrFPrEAjOpft0RcCaTzxKHPw7laRKf+GSb2sKKzcE2KM/b9FZ5cRdxYj+fX4TnMB
 Tf8O54YSlDKD9rQ/ufSnyO3Fpi2OCNAmIwU8GVjJy1gUs4PbCln/hBL
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Free Mobile is a French mobile network operator. Add its vendor
prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..e467da45cd7ac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -626,6 +626,8 @@ patternProperties:
     description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
+  "^freemobile,.*":
+    description: Free Mobile
   "^frida,.*":
     description: Shenzhen Frida LCD Co., Ltd.
   "^friendlyarm,.*":

-- 
2.43.0


