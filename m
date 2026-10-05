Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1B84E3EDA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232117; cv=none; b=AhctUJOu/F6fFFYrdWQ8eZxT9r0Oqa1m5vYXdJ+kvTpiGnTeYYKmH5kntK1K+4XeC8qlbOYTwsMjsC1W/PrcKcN5cDllfbQDC2HVJjpdYBRPzNbYKgL9kSQ8XXSfh/KvQeaXxWXTVNQimMq2j/j4Z+jcl3ve6o6aakoJy7cWl08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232117; c=relaxed/simple;
	bh=3h/9Irsh6hLdvhKk61bUEKtRVcfu/x6aEEt8IH3OiO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCQSx0ZhlLm7XnUgmRlf2+My4VJyGKwLCby+7V4USR7ulTAdJjLhd67TyxpGPrW00BUkHb4qsoFcCY1uj88uk+t9/OX6QVr6Pabrn3fGTXx91qo6TTr4FAvm/J5hNqf+4jVAa93GgrzsL3gIR7HOlpCsH9245T5rxYjEfzttbOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUiKLa+s; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUiKLa+s"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso3452614a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232105; x=1791836905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=EUiKLa+s+dLlbnmH3pv9ysRRgy5xdZFtOw3eK2E51qz8g5lTezWuaNQmRq78ZAbQ6m
         4qCEArzqW+E0GkMBtZMb1CldDPxc2ZdbphKNGG9ttDZliieVijMN7riC69zQilKqlTAZ
         WjYPVyL4yLvPWT5ayYhfiLCFJ4s6alr4LMOeTLB+NlmmKuE4KVl5Yyr79E1HoBiEwe72
         9z3CtuFF7x/pf7If4MW/nXQIJqfUVpp0sVmMOCSe8ywrsx1F06DjJL7f5QttI86gdIdL
         hu9Fr4/LufNDZyqTYKCMvJqJjVrEsUSXzGswlhc0S5v5cigaPS5cjjfIOuIzhALQFbfe
         /3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232105; x=1791836905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=zMOGdah+6ZzOarbHJ8g4v2iBaXJhcAVbyEt0EQB1LDtwB4jNUP0ZeQefeJDTNGU29Q
         Z9GoV5fOzvXd3LUQlvOytpYoagjVYLn+ss2qv/pUFYA01lVAhyq5u6OzVfQEb3ZeugA8
         +g6SeiX3NT7bVJnDdWarxMU+AEtkcpzzLezvzkkpzkpgp7+GOeHuhYrTrvwzUgetcM8Y
         E/0ieg7vTPr8GM/rxNzTRN4f0U5Wd7n+FEWon/zEgeq65EX70h3DvcJZgwZMVDERKcU7
         TlZcuAbXn0F0AdY+rUwK5ZJi8DPPmje4Her0Nk6hGYRqa+mv+eRwUnjxEnjPVBi44MVG
         snCg==
X-Forwarded-Encrypted: i=1; AKwUvBzts7PGg4GacsVxhjnDdLCgF4yXLiU8uMFg0oDWMva9CWnQVO7oeJmzHcPmgu6lR94BxFtkmBCHuiidt9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG+vekgPiO+bwzWG1wZ633u1ornLWrzv0Eh/LFDfsAOVksYMwj
	Pio5O+EOYqgwXnmM2R1/j6t9jTp9zwMgyuwYfV/3nMbhCPPvGS9nGtmH
X-Gm-Gg: AYBFou2+y3w130Y+00+MwXWXkSESwZDUS8M/34CEGZVkiphdLGyrEZ+3aFAjM5C2dfB
	9/nnLanOiG35XX6BxQR6+LIbMVzsJop1hS9o7n/9byZooaOY2OK62KmtLvtpd7zRb1AW7O/qEis
	LecV2EPBtjmEtOr6L+PN9AGjIAqmUpBFz5SBIYkX0XTQbQOoY+K1CV3or6LOcnFex4AVpLQ4ozR
	Xqh2xYf0qNrL58jATNzJr0oi/hKAP1sxo38ww0OXPKuMWVNvmOWC5qLW/AHeNZ4n+ENMqPnUzAP
	nhgieMhP89uWjmcgtjEcIvs6k0kYaOGJ5JL2sXDpQg+loPNF/UHRkV2sy9py3lQmHZxtDiZJUoW
	L+XaPfuKA9Fyz49QPu4x8SrsOX8UuG46z2tn3ydNO41M8KyESLgsE7DEtnWH86SRJM49YBLz0qw
	b1LOyE/hQLthSHA6H4HcxviZ80XO8JhdFYhtQtWwR5TZnGfpnT9eybUi1+CU1c9UL7MvsjXQc3n
	QF1Geuc2cLsbl5ILvKe4UFol3pf6V//
X-Received: by 2002:a05:6402:4021:b0:6ac:aec6:a3b9 with SMTP id 4fb4d7f45d1cf-6afad90627bmr7128320a12.24.1791232105212;
        Mon, 05 Oct 2026 13:28:25 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:23 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 08/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Mon,  5 Oct 2026 21:27:28 +0100
Message-ID: <20261005202731.153971-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.52.0

