Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC083B2FE4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377703; cv=none; b=k+zHEGnzj6uOypKPMplghSgh8aXR0oTmrqkNfesdEQaD6JmYhJjUeIO4xUUvVHZvqLGrY2xvIkSMJ0UQojhkVbFjbBZN5RXFWYhVMGuyu/KEaTfKQw6ihZX52HVXeEHKZ2azMkZo51Hy4qndHnkE3G/5Eqqfdc3tAgB5N1vgsCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377703; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sk8Ww06dPKPCUpfr/ZQPd2hwOYCSqj8Pa76t4G6pAviHC5grWG5bSU2T4/ut/s5NKh4rFxuYKNhPr63hQ2lQTzsIurvkXNrJwWTdZDZClQ4FJOzcJfYI8e1/ZlHr3lx9XCBvWA/M+Mv7xRKBvHesfDmnYUCiJOpnaWVCwKiCFGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK9fhsdq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK9fhsdq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482dbe4d247so645119f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377682; x=1788982482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=XK9fhsdqDFBXhDjSuvWJfNE5vT/jVeNPYAPP/NsbbmaD3WbbBJ8NmTOZ9mY8+VzunN
         KdMH+E+kYoUcuDdKeZfyf+1jRkx1ke28J3+mJxybitnpa9GE4lBGiOwLiQyZUrsi3NaQ
         d0itTIUnxjzeyI0qb1nEyA1sVdhEI0tKyoJylS0I1fofsuoD2XAW9fSCMkYPTeFTR51l
         J2JLqSmJjWuq2NXZP3vy/SS3Qsn/0TSbIo6dLmvzySLHrtcj8M3mS79hUxkWp5KYUrsH
         VwRRvKTb6J64DZPSekFwGbiuS66QqX8vv8Q5C+MqTKv8BFOQABLWhFgiZZv2eUPkPR5i
         ffDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377682; x=1788982482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=cbGZOHOfq72ncP6bgkTYSLotXKbWQClC4fJ8G8lptOkgapwj8oiBXQGJJsSpyJjwsM
         h8buzLZEeda8YP1IsGW4ZgjqeTrBg/A31mNwgyCsFI+h1o2lEkJgAj8kMYTdLE0jTd66
         mZ1o9kgWP/iOll7DcHsWI8hhNjvSgQ/7fTwkRTSdGJN23Fo/MVcn13wFy+XllXQvp2eT
         EA8OmDbRsSV7+4VxSN6vA0Ccgz2+1N1tAG973TR2fSs/XYdQqjfwV2eOnrgtId2r5bJU
         EJUNcnN6Q9f62bAOM97kOB3F4EZr2GupJ13T6KTSm/iRwMsCPs/CUz03uvnLEqzzy80p
         kg/w==
X-Forwarded-Encrypted: i=1; AKwUvBw9OjqLKGzmyEzM5ywrMCtLR9i/1MRFRj+MLw5xprV36XaQJkq8zQbdNQGvmb4OT8rXutxJZeGsWD9b70M=@vger.kernel.org
X-Gm-Message-State: AFuF++mbnmrsc15pw6HOnVB8eZKzCR2vIRn7+3XV5C46xFymHuP8EBkp
	gbpNOjWxn7tIYRHlBUM4wf33MLuazfODRecGJtLqJIvZDwNfFcyB3TfW
X-Gm-Gg: AYBFou22lB63NKLc6jnmIC7WrBvqg9zVFY0ZratSZje3l3DBBTmQuU39cFq/oRBOjBj
	CXtNnqE6J8lgGzymGusSt4UeKJavZ/Y6dQTb8STUDGYfJrRjy1Bq5wy+53m9wgohzKsX406NQGQ
	hzp8OIPymXp8LzQZYn8o1dh6N/cmJI/hvMoaHZd49LYNxOBkEc5PwKqaxqnsDgs4Utb7IfyhL1z
	B0RO7+MHJdg/ldtDY67qOGU0MT9UNDGNT3YpgpdM2SL/aMzuT8ADAc8xumfDbQ70je+WbMOrmSj
	F1nfbQ6LRMv8LXIIWJNq2Ux1Dpd+NWr3e7UWdM/LxNwBxcHlyEHJXxtcZvpXN9FKso/Ju0m5fZP
	N+aE/JZjC/otGldu1a2mwbAFMMDBw8rc8qVPrcaLA0rFeHsdZLeCz4u53gcvOdt9xFuC8rTw7Oy
	AlkaYWvNokKgRZ+dWkl5ip99GWCf7znnTXTpuzyG19FbUQJV5tnLb9ijMS
X-Received: by 2002:a05:6000:480a:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-48488f2229cmr14997817f8f.19.1788377682430;
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed,  2 Sep 2026 21:25:38 +0200
Message-ID: <20260902193351.185771-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

