Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA23CC7F3
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114057; cv=none; b=To5ITDhcGbYoY+dVK1S8Nusm3FUNsrZM4ymeflzeLHPoy4nRDHw54J5MrPoinLKRk3KJ/KQEbLSMdmt1M+M67JeHPOf/VrfK0cms/ycm7mBQCWXTy04NDg3lndIwZ/t2gFXO/9FyE4EeewwACEfZrZzZLh6YEQfsp8KirczaDLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114057; c=relaxed/simple;
	bh=GNNcznWSFBk9BfsFx6sbFhNnUmqowOVWfdNrSDVGjJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Az2U92v5U027GvNi4lIAOuKW+u8ITLx7Q2xgPYGbLOIDSSpalKQcyxZRfu3sB2XUFXINpQ7g9+jU7f0QaU9KJMrnQ3NBn9nExxB5tcedpCBN06NSoBI1V1wOGHJGax6GLa/gBzg/Z1DxlwI3LCyQmafx78yFJPqtjDARg9sUE6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lADXZRN/; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lADXZRN/"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbee846deecso3639787a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114055; x=1788718855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=lADXZRN/WbVUe0AKCfRw0GsYUizdy5jQiX6N+3Ex8GgN6qNpMnneqlJv9G4GnumyUt
         FfAvQZ7S1kyyolQhoSNgJz0bvIvxVW9LsUG8p/lbFm5FtRDlpt1I0apD19faBSx+Vr2f
         mXErE/LtBjPmSCTXCPPVIezaAje3AHwnoxc7VhaCqr8ZkCBW/7/Mx9LoCzf3xLv19RFq
         u2vHUaML8/IZ1pzkWseBHToze8X/yFt4rUX1veH0nObD25yR5rEF/0eXaAF3MQ+IFvcD
         4l9AbckKCgWrrVOqqslHI3RqO8a2O/gKVG6Xjn0OOIcDoW3mXMe4OP6H7sbtCHjh0IpR
         sBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114055; x=1788718855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=qAkf2/wpgUOG34AM3TkcNSWG4TlRZM8/V8Zg5xcGzF4vxS9InlMxgKlxxaCwqUr85+
         rKRQtYmQmjTaWTklK/Dpt3oeCIFVJs1DSCidgBkj0qhLupO6ekzyq5oM3hv64Whbm/xm
         2ACM969ovfdgValF9tXUnrpZyLjvtCgWu+haJf4HI1aVCOufaq0pV9rlUnVhJ9pOQeQH
         py7K8215sk8ZK8qsiSLcQCSGzIuWphPiuTvGsgS1JwNmxHM2qF2subkjtpCIOYuOzIM3
         I8sRaICOymS6MtoBd98kmExmyQ/sD7+bDQNnLO2M3x1moYcC9MnQjWF+pLckMS3rstUo
         DzhA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3IlX77eSQaev0+zt4O9iCFPdDb3Ik3TevefhJdK4VhyKFmLLmtnzhmyQxjkZlIDjvAzRccko1lZkXAFY=@vger.kernel.org
X-Gm-Message-State: AFuF++nxm0NhU79l2kBcrB8XnDLln8mxSHWdJdvqG7tzrNoWQk/7ArtT
	tn+mkxYPD2DHN8lwydIj5OqZ7hNuEFrP2WRCAwTE2+Gd1wncLcJqb8mI
X-Gm-Gg: AR+sD120sBUFEnd8Z+R01YRm06VjmBzTJrcEPGfF18VArZz5bd5CYE4bXYglzNXzfer
	qmdCneyarL8Za4jWInNEkNLvOldMRKjJKlcBBhbnSPvQz7vpnKXCapjrP8N5SZ+FVpxv0Sg0pVd
	HllCNlAbMtIW6ea+Fislkve9nZj0qTCBBaRYIuMxgWFS+L8rcu6XjV8WkR3HhPr89lhHTj2I9I2
	GrPoP0xWmapjwyDgsmlyVVTC7yqgOomAZ/qz/y+WM+WnfeIde5SjBVVxI8rkrfEaIUvxVqA/V6w
	yMc3nroCkNn6oO0l4Xjokw89v46ZqiD+0gP1AspJiG7eV8xc+GlRwhQA4ZiNDdZHrEp6JfLAVrh
	WRtF/VozwWFhh82JE3DSnTa91tIR8ObdFyxSIwIhrm4V0jDRCM1eXhWZXObsugjd+LFThvqFghR
	gVh4ABFWwbJQdH7ZVsorWRCkvF6NfdywZp13hqG55w744f4gLl8PwjWsLNPZZn3KLp0yTtycCQ3
	rvK0g==
X-Received: by 2002:a05:6372:a80b:b0:3d3:ae50:97ce with SMTP id adf61e73a8af0-3d3ae5099d0mr18192338637.27.1788114055247;
        Sun, 30 Aug 2026 11:20:55 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm21619480eec.17.2026.08.30.11.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:20:54 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Sun, 30 Aug 2026 23:50:35 +0530
Message-ID: <20260830182036.284736-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3

