Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150854;
	b=c6RANEjGfNFGNPT5F6mD/xrbpFS4iYb/Hh0P2RCIJqMvWKxAOtgVwVl7VvrGlSsznqis
	 lE01aNGlmseRNlw8ap188yDmzWMmXg94iyu8stFLprgQs3Wvo/mB8CgD1yxkvtNXd1j22
	 34sSJK/DBBCNtpppNKaohow+rF1CuzPaS6zsGt3LdIdq0In+Ua5LEb4Yki2cJFbzWleKB
	 3MntZ8ySYVce0Lm7uH4GeWn+YXME+ky4bXNJLjfWQuRmLgpO5Vlv9mfT8L5JgzPSp9ycF
	 g+pnJ2jAxejcYJ5vl7337FMVvVW2Q3EKZmJy6lQpwXX4W9KgWjVlLa43j3wxAT5OnFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
	b=tsZYUQ2lSNSkCaOcuePTfw8cttpqG306ct1dohQuLp94+p3/Zh8ZX3wb6PWvWsKXY1yy
	 hGYLDYbD1531wSimcLpo+ki116QVyMHVS9GE4tTEGwBvdkevmna806f9jkEX0NxglkRgL
	 kYbG52QKqn9DRQ/6fn5kgQsdmbeF8fI91og6PEmEdItRArZCwn3FLdqus/6tAr2cYjPee
	 P/+xAuSnKwGGyxrN2XZesAEZSHroiGMWby+YZAJtb4KsKwIqtYM5Z1ztMxzg5iaKwBKOq
	 +aRMQyFtKjTUPy0ufzGXUIgXwtXOFQqyX9qSWe3RHbUVXtD+7RUF/PSBDYhxdfQzJ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ppgWgr/s";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9747F606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9747F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppgWgr/s
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40f29667e6so19275766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150852; x=1794755652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
        b=ppgWgr/s7DYE/0NT8hkbf4w3Avxhq2ynyyFr2FFsRzliUFC7ZzSCPTwzmYqQuQU5IA
         Rr/u2iEhEmoV6+YPhvsNFMWG2JnoVqJOfVIyrXG+1egKypY8gUDsKG9rMFt2psmA6kRA
         locbvJ4rWpF98TqxIZ0HUCdjb39PU7aBKl8bs+a3Qb6Y1+tEyrtf29iI0NM5QSNnhjTd
         k/oCMvK6n1IBgqLDmgUDoLaxVtB+7G7u+7n5Gmh/prURYwgCEUe8e7cAf1uUrSlmcKwk
         VKtDMTQnZXJgnJnuVzS4RtMOXVnzLfqjGjqE8Dxb27TlB2mgxOhN78fhgWYXFM80Te/1
         3cLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150852; x=1794755652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
        b=Aqbs1vSYjS8iIumNgjCbWAAEwlsJITvCi0KFG3KaVkH5JJjmyerXcNV2UhgyPJ9/6i
         rttIzH7ugLK8Pc8bSxbdoz7IHz6R/6SP4psTdOu52zVCadCTcs1x7fwqMbH+z+bbbqfN
         2aFYbQB/UGy4PZd6vFhnQyJ34QuiHvWWWd6uCLk2yeJQEDBTL4xN0Vx/+OaX6RJEH13r
         aIDkCwT02GUTlXCuwMBv3tFy4SASu1RWXw8H9wyJzCx+rQyIQNYfZWTgVMjl+Z0UndOG
         KUoAXYssGGzFTQeNpcQnhicQfkRwaJHDzOxJTfF40X/PHtiqF0Q9cXmRfDEtikp7ixeE
         ypFg==
X-Gm-Message-State: APuU4Z+LZ7lyPqaDUG0wD79UxZyfoWkJjLCR/le/kZxzkVhDbQqc403d
	1SLXjEcd77bU8kgzh93J/Wohp+793W7dMQP0WxouyEIOEf3xFIiHKwr0
X-Gm-Gg: AYBFou10M54TdLnsyQ8zepX8nWHbwjX4ZwATZFNX9kEeAN8U6NDQFp07CrpvQQ6dGDD
	Rv1X7eIHI795+ZEXcTVOYajV9J8lcgvr4oudGCFxOFaJdSq+UrIyBONnbNy6eAAdHmoiPVf3K00
	jUmBRjYsKS8MoAb6CbUr3THv/0HmO59p7q7OvZs4n6iVfYMGYGOk2hs8U6QNaQVdfeIuyXHDxC5
	XpYXgP3q6GWPim4nGsCVzkr7CsiXePYdRHCru9LgUkxozJ3vs35c0DSqEE+sSAn581pBhG7ZzEf
	89/vaeXarsrdFGnuLWFjAXl+kpA6owIFx8E21PA4zHTpgKH8k7vhtQ+832Q8HhN9qCXnr+YH2DL
	qJqaSddMHMzW/2uZc19Scd+WBDHenNpdFYlWKS3k3NdnYZnOBYSy0ul9sb1OEJr/Jyk/ujv0Ybc
	W2hD+W9rf9BDZHPdAd7n5QqmLBxXAPnwHcJqfwvzJocHtj6sxOwB+UQ6YFh6SrNNCC+qFSfNgnj
	P6r7xli13KKTyom2pH8sfCQiiLmbY/gSJTlDbGruZunCIVmyTgujGXK3IPqKWq8iaYemQeFiThJ
	sLt8SRRiVPouN7SsCLTrDavDU/xUEMcgntsct1rY0WyeNqIw0ODmzg8A9FlNuNboZvIwF88jnkW
	ljYfR+fAngw==
X-Received: by 2002:a17:907:9624:b0:c26:1648:a062 with SMTP id a640c23a62f3a-c4d6d79cd56mr106518466b.29.1794150851962;
        Sun, 08 Nov 2026 07:14:11 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 1/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Sun,  8 Nov 2026 17:13:46 +0200
Message-ID: <20261108151348.204182-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maxim MAX8907 PMIC supports a single LED; document it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

