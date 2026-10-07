Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BB445D913
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363322; cv=none; b=opchTTA086qIEjnzKdl1m5CwIXOv372ivp+2PUj68vcwGCixZhICCVWA3xzPvXC3IqYWGwH+U905oftVZgrnnDbaEYTCyxium6P1+tjmc14ZyMgGwMx4ZeO+NH4TyA3dokdgpHZf9EL4Lg3MeyV6ex9foWQKQ8iLsi8qAta1xJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363322; c=relaxed/simple;
	bh=jb6jpreGOIyr48SUDqS0HCjGWA7C8ZqXlCRzJV5SGPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpO8D4inxI9uPSzRaCa+o1fva8azc5zT/VBq+7O0u3HYxSL/y6Ixo/7kmtAW8PIsmG9+Yx2/fTVH8TPza5nCE4tPgYKeYmaKDKdAFqSidNo/7rcMpa4Ti/ExCJh/vvpFM54aC9N6JGeYd4wRfQUlu3FO+NKWUOMNSAk1Jdm3D0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBqI5zjK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBqI5zjK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso15926165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363319; x=1791968119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn1vqowBmODcdaMp0k8GlavW0JEdOf9GypT2LbsFIP4=;
        b=WBqI5zjKu667jrw6A9OSVNj1UlSPIyh5nD6Mnkqc/h4h/FbIRvLfy5MltFLY2cT5/h
         s7BCcqD4eb1RuEqdkbr/9K4zx2pvAI7ZOM7Pc9YLWDspfH30soUfJQOY6pBr7Ps9mdmu
         C/d+HIM/DIsMfnUt62/p7Wp6UW8e8GKutoG87np1OW464+dYSt9CZXljjqRAzWqp+yz1
         dMp1QfritKI4oEP1XB2b+53mjkffcv4AcrdUQ7EmUUNsH15w+aoKqCVXQhq1I4Zi2ycu
         PIUW7Z2fPlr72BHh5JnjQrKmn5i0JEsW5J/pSnkGgjiUob3vPLIauuyACRkOVN2LQXCS
         Ra0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363319; x=1791968119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mn1vqowBmODcdaMp0k8GlavW0JEdOf9GypT2LbsFIP4=;
        b=r1Eu2Fud6AfzEgmuhCP/bmhu7V6CMwzlUfoJVwwbeuhax5FRARK7I4M0bhQidJ+8RN
         /SkAYM+ZNSQKJPIwAuvgTIzQ6+hQxzHhWH7Fl8Q+6hzShXybP5I4M6XjsPdGqeFs9xOY
         m3bktKgYHQEDRmo0PqKR2X3tfRn0zvDWnAihlpJaHYtSAKj7UaxfiyPNuAXZmdI5+EF+
         WwQQtk8dP2xsfYeVRaWR1XGdzWU5m/zobDAMn9iZVptZhjEPydGtiJlfZ5wgSpmcM9zM
         PcNjncmDddmfEhjlIK3/+iAjidcso98FAyQsjqHFm5SQFJSOGoB4biuJy+AcR31E4wQ/
         kL2g==
X-Forwarded-Encrypted: i=1; AKwUvBz1C7COEVrWXNu3F5l2OgIKWgNktow240kmgAtbu5nyJVhtLh4exij3cZLic9xDXlMdiFN/0562tWweMCU=@vger.kernel.org
X-Gm-Message-State: AFuF++l+/48WnbT1uospbd0ZJkQvoFAXdR2/nB55teCC9Ymp4rk+rWYz
	GdE/u2DIjtJ90vbT8IVvHVM3ZvQgWoqBCltS5+Z515ZY8mg7ku4rv7ay
X-Gm-Gg: AYBFou0cNpCZa83dCNbdd/mpjUhPMGmFpTypQPJee6zeAhsOoZVnyal8DGy8Dl80LxL
	qra/JehYdpK/uCL7y3r5wEP7Pi4CpvhMcBj+Fbk03s93GUUQSPYCU1OMBk1JFMnSNknDC19km+b
	bkUss6aCucqp+mdB/MSq8KtVcz52qSPnvtB4/vsHg9nET7pdju1s60vso5ifcQf6ekMSJg6amKK
	krRAzZQyJSH7INwU5wzUc1+vJXD/9XPnxyagOTuP0NIFlJPsxJG1YUhaLqjldq+7B+LpzcJVWpk
	YeSK6glMZQBqAntdmkvEX/5cd1ZUFcygLl5ARca3CdILZzmbOO9xez6LI5pIsZvqopOfQvpcTxm
	hynVtVi0TvNamDF/uI0k/EIyXvOMd2fA20HORbpmM0pX7dFdFN6ryZiCLUNhVIT3nb6Qrf8IQNj
	UDj/gVXCDDrjx4scfxCnQ90+ebInOkibQb8omWqRCV9KU0o8sFeYhzolKO7Vqqz5+8oAzgREFEg
	n5yoo5rctFjmvTH5k+xSdxgE6B+ew==
X-Received: by 2002:a05:600c:1e17:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a180310dc1mr23212095e9.14.1791363318985;
        Wed, 07 Oct 2026 01:55:18 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document FLINH pin
Date: Wed,  7 Oct 2026 11:54:56 +0300
Message-ID: <20261007085457.98762-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007085457.98762-1-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
inhibition.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index a65d92522c9cf..596b5e284f44a 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -31,6 +31,10 @@ properties:
     maxItems: 1
     description: FL_EN pin
 
+  flinh-gpios:
+    maxItems: 1
+    description: FLINH pin
+
   led:
     $ref: common.yaml#
     unevaluatedProperties: false
-- 
2.53.0

