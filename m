Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F93270552
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435887; cv=none; b=gkP/lLLhYFFEYofNYoS8YVFCUwAw8efbG81ve/GmSzT7ZsMlnnJNz1xZcJU5CCha3MJ4KNCRxqBJ7jQnPFO29cf0WQypGix0jAtOgLqvsBaBwRq2F+aO34MxSoYPdpSDSup+c3pavS+uVTbzDqhgbDZkVnmWwf5zsGjNqDV4Dp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435887; c=relaxed/simple;
	bh=GNNcznWSFBk9BfsFx6sbFhNnUmqowOVWfdNrSDVGjJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0RkVZeVcvQPALcMNiZ3chOtVOCSBdbB2DXXNVUdHVOj8Xr8TIRmljrmiJyypAXZceijwvtvd174Av9r4tzSUc1SqhXnS7CwMNVngjITjhM553meYjCSsNpWal224OW6ZkpMYdVhRUDm/aH5pV/MgOs+Lv9aB00CsCwq4LZQtKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZ7V7MWB; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZ7V7MWB"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4c6006e2428so2480474b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435885; x=1790040685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=sZ7V7MWB/4BImsvkc1vj8TO8aAy5NXrsru1D/OLzWA5ifZGdxv/FP5LTfhK1UnlHqi
         mlA+0pYZzoezC6QSm4PZBs+cGOzllir5+e7jibnM3oBaVO0GCy9WLPpmSS0ccEzgMlBm
         iLiqTSRysLigy8XZalb5iUDkW81F50Juu/makSdXgA4ip0YtG7HNWkudsuWsDCkUEbUo
         tnDnRUH4B6inxReshvEi02S5SPwuwllt1syA/7a88QsDBXa2eThw6+jrxYp/QppoKBi2
         KAcgCe2O8UOZ2Ohc7aCsM/DKj2fL3WdLJWYm+rmfYp2Jpq827VSEuZQHz2KU7BJuM53S
         TeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435885; x=1790040685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=EX0z1NO5spISQ+PvjK4K2B8ZDccb77RPqY+ZJx0ptk3Cs3Vg8r9RjJYrNhWUt7frmo
         ko0RrbXP5lY2jS/qDqdWnSH3FABthglURSR/ytcHurWjwnvBOQqWOrcVCTgFlwUA/06e
         73XycXw7vkj22fjQm7H84MJC8Kw1+Sw1ORcbZ4qnPu0SNF7wUzVq7LwdWnE4FKSv55vT
         tv+0kiO0sr8LLCohaxtkPRCcZPp2w6xNGdEpvV9jJqdZHx9/To6vRovnplF3hTwa4iHB
         Nl+IhGFXMSRMMHNYahuhWQCKrUR7nA5RETKUv7BOIjYPsOyO2OVWYH29WeXkvbMCYXHF
         0I/g==
X-Forwarded-Encrypted: i=1; AKwUvBz4EF4L4kS2R2WCEDZ20Cx+d4rvk8Chu1X+h3iL/drE8qUhqcMaE515Kk3I0Tg0XFPv/wfmOwkwtjMe3Zc=@vger.kernel.org
X-Gm-Message-State: AFuF++m0D/KHw5yU61mUCoaxXl0iBsdUAbsRAb6yHigGuPdJp4iY7NH5
	XuRlpYbJl56pa5upsOleDQ7zh+9aQFMImK3ZnUkD6VhRBJOzU923m6eS
X-Gm-Gg: AYBFou15nuYJJvYrMIY3PyETF+pPn2e2L6HoFm+RHTzGP/qxMTkWEnEvB/5eylGLRy/
	oH7VbAalkz4gptOWJUzqxb7SY8mAq9MMSuSrJk46G5DLXUXUa5Rm/cYT56PCfke+ni+zv2i5skC
	X8tcJO6TY6XOhg054GxNEY/RS0CvPzpaYA2sRVPKl3dZ6d6Nvto2PXmB5HlhltFg6JPTWp6KZz+
	Pd3OD+XhdubFzieemZYW4kh2Q0Sq7WMCScdlWNsauI1F4x344dQ/A6jirqzHXshHllnsFoi1HgK
	wQFHe5FRrw+wL3BSwR5L/P6Vzv8AAiSpfLHVS+9Rq8OXeGTqmFmnJr8x/NLiznayJgjEruFmdXV
	JGY5Wu51XS3B1TaDUSgHSbtjRPaX6BmgVga+TmTeM8BBPmluO96tcgTQEV1BtNTOA4dMLN++NaP
	dlBGGfIjfXX2zKQMgWElrgoNXfJM8cdRNdjszcoowFs3Cv/0msFRpcXuEkXq3w4QDTbPXEH9ty1
	jFfhlv7ifbvuiYP
X-Received: by 2002:a05:6820:8119:b0:6ba:3635:7ffd with SMTP id 006d021491bc7-6c543112b4amr3036635eaf.64.1789435885128;
        Mon, 14 Sep 2026 18:31:25 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm27111575c88.2.2026.09.14.18.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:31:24 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 15 Sep 2026 07:01:09 +0530
Message-ID: <20260915013110.4780-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
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

