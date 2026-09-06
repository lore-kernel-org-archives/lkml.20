Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D353CAA3B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716785; cv=none; b=Mt77c6CF89/JhFwv9SYAo/tldu6nJB1HDLyOOtKoYKj3Bu+/LexNeYZz4EL0bM6I9Ht9JKnxZlz+SNG9vK7MqgkKWvFVKFhQlStFYGho7qvh1WCH8sLpDE/Mq7/pt/Cv9igapJAii+TkDOoMuczBW1I1GwTe3dSnVGnIbEEpLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716785; c=relaxed/simple;
	bh=MJJRvWz8UjYd+xyF4swuo7FdbMrj6DL1ms5UwQRbozE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tY30veSutcjvu5EFl+038rlDzHaPNtrUv5w/H3fcLliwA5ahCVrUXUyd4pRUJ79ZZ3im79y+cZrxDj3CA5lAs4Z3/4kxEtnZkqlo8kjFnkzYIez031FY7oZA8Ge+J4XoBAWK6yOmTegs8FUpwmOoFuIZKEMBSPny/GPYNme7jVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=ZYrxHTP4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="ZYrxHTP4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b965570d7so32600145e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788716782; x=1789321582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBtppkbSqdf9lns4tDaMFXgOQ88x850RE5fhEe1B1CE=;
        b=ZYrxHTP4ECRDDNd1y8B9ngbf+qxyC1XfL7O+XDKscO41Iuvfv17+JVsdqhmQm6uRBj
         PRK8ehIWbegUqvP9rvddXMCD6QiK0erjh65PxC3bMBH7tqn/s1LG9HzZmGU7xe2i6rjH
         lLCESNXVc5QTT0d11hmaNBkG3e/HhDTdls4LfSof0mk8+s780Xe48HMnfssYPQOc5T3M
         VZEkm4MdYLWU0Gw1KjnqIZE/S2t8puswSQM5pKApWXfXvpUcrgEdWxqB/4V9P9T9CaPp
         iawdWNYtrOakjTQbTtT+/2O0JeyFCbAXCI19CR3GOaGf3zeyFi/si6k72QU7PJRZvHPd
         7ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716782; x=1789321582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBtppkbSqdf9lns4tDaMFXgOQ88x850RE5fhEe1B1CE=;
        b=R5oTJJEYo0/e26L9WtwtASJtTqCoEOZWRQS7iHk6o0Zz2KjJzBVHjHuWBDJysUGyxe
         K7Pg8Zrz5YOJKLleCl6yegWmkZGi66Ezp8hAyImFwImrFmsFJfBzzmrLVhNHRvSt2Q86
         nQQiLjecedPqHEYgohBivETCrNAhDvcFMF/N76TJC7zT4DkwyoOjw7YyUzk04pvDwnFk
         bEqaJIttUA3ux8x2KNOvqWNZJyS8yK4wZzZuX4P+G2dX9ScVwI0DVedbU8if8AuilRvB
         y3ENvtYK4KgIKOskqcGndZ4BhaaKWnepvSpRInB4Qy4e3uRf8Vp3+5Lai1T5sur5jevv
         /Bqg==
X-Forwarded-Encrypted: i=1; AKwUvBxvWhXqpn4b+Xyq4V63QTomqqfEWMhRvzd5O+yfXu8hPq/QXmQwSt866whGMttZgCn+gKKcGzs64fbJerc=@vger.kernel.org
X-Gm-Message-State: AFuF++nibtsjU6da0yTIAityp486gvPo2OYAo/+Ad6DpzceSYbgkoJNt
	mVg2LeyhIFvGa9ObZPh/vZlyWZUCMn0rPxOTC4cvL4g6AB9vxVWPD30XjMY3uc4KBnU=
X-Gm-Gg: AYBFou3btOyFpSGfBKsZKXTMeMnU5rp7vBFZ6PSD/sM8On3s42KlRLVbDxVwMj9V80I
	XUk6/aHkoiUE66r5qaD3sWG2rwCY5ujPT0W2ddsUzM5s9jyWqJdWXIcGRxZ4R+0N3w+myW+MLL6
	zYfF4pAFOsKn1FJ9GrZXTBSOB17oDMbLVpgrf+YKBjx5dl73RrNQMVScRcqyIG/3JOP98TId1Q1
	N5+wIeMYRK0YH7d3YOTkHvwJTSXxleRp/wlqyqiU5/TRy1yIIOb5NEHYnN7nSL7drbrElHi0tPP
	Zu//vceCkCXFGmQv2xaRzC+JqR/8NOzJSLf0RK8rOTyG5PKwz+NQs9tXH0iltp/2lcLMCJTWqjK
	JN7tWu0nllRuzdvQxCCXQIKLSNm9lLjdPJakmy2MFGv4FZFnM3E2nO/kWiaQg3DWKMjJQRQYCGH
	uUtCzRSeZMj8OUiqA/3T3MVgynSM0mjHLzLNEFyJ9oMfth/wuTLQ==
X-Received: by 2002:a05:600c:4e11:b0:49c:f2f4:eddd with SMTP id 5b1f17b1804b1-49cf8268795mr202671025e9.16.1788716782231;
        Sun, 06 Sep 2026 10:46:22 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm331528735e9.12.2026.09.06.10.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:46:22 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: linux@armlinux.org.uk,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 1/2] dt-bindings: net: ethernet-controller: add phy-needs-host-firmware
Date: Sun,  6 Sep 2026 17:46:18 +0000
Message-ID: <20260906174621.4107320-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788711837.git.f@lex.la>
References: <cover.1788711837.git.f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A port can reference a PHY that cannot be identified or driven when
the controller connects to it, because the firmware the chip needs is
not in hand yet. Such a port is dropped at setup and stays unusable for
the whole uptime, even though the PHY works seconds later.

The flag declares that the PHY behind phy-handle is expected to become
usable only after this controller has probed. A consumer that sees it
keeps the port and connects the PHY once its driver binds, instead of
failing the connect. The prefix names the entity, like the other
properties here that name what they describe rather than the
controller; a PCS needing firmware would get pcs-needs-host-firmware
by the same rule.

It sits on the controller here because that is where the waiting
happens. The flag says nothing without a phy-handle to qualify, so it
depends on one; the deprecated phy and phy-device spellings are left
out, since no tree combines them with a property this new.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 .../devicetree/bindings/net/ethernet-controller.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..074c54fa6d78 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -108,6 +108,13 @@ properties:
     $ref: "#/properties/phy-handle"
     deprecated: true
 
+  phy-needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The PHY referenced by phy-handle runs firmware that the host must
+      load before the PHY can be driven, and so is not usable for as
+      long as that has not happened.
+
   ptp-timer:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -240,6 +247,7 @@ properties:
 
 dependencies:
   pcs-handle-names: [pcs-handle]
+  phy-needs-host-firmware: [phy-handle]
 
 allOf:
   - $ref: /schemas/net/network-class.yaml#
-- 
2.53.0

