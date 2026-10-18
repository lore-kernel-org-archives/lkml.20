Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070B23E6392
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302884; cv=none; b=uS4CVUA7a5JaNK0EVBitBJeql21ktCA96aTYhRXFSfjoNxrzFebdbUuuDEyOeMMUdmxG4GS74MR9rwYtPiQMZhaGbGzyuzt7ixgju73sO/ciCMddBV0A0UIto1V1EAKXaIvEuLswLhZFJrXk1MxqLGh7NidllBo2BQCP8NSFQB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302884; c=relaxed/simple;
	bh=vyIYXeTvpK7D1QV50HT+GFALOmTzN0QImSyZ/l8Csqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIzNzdrOK2WCD5zRk+5R8gJsIqkzMfTUO2WZj2Z7QmCsP/ApBNViI8R9vu38Z5txHLcaTjcC2XaHXcJNyWvA/mFE52fwZl52cc8vYaJZxfoyo7+fquG6X5hmmd3+jWKpv3pLazQl6ph3tCe18o9zxg9qsrq71wfCjVCh+xghfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dK9P1nZ9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dK9P1nZ9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9cf928dc9so1512385ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302882; x=1792907682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=dK9P1nZ9qsE0cYr2YcaJBGmEL39LHzBLfhUcxMXL7QJVJ+HMHmtHnpfduKhXJQjoiF
         H3tpOCfxr/Ob4xG8P2HtlAWC9oxp29n8J22MRjq5ZO5SPot+1PjUVeyTgoGUPc6MeWKi
         2u1HQE02gOTb7Zsv4jmJtEIFr4TOMgRGi1+yC18pu4DMP3edBbBHFnahTnycafPHaxfw
         wQcfv4xg50XM2aIEEFFDYJ8GtQvH0n4dRp26UKMkp/LkNt7C7orjXNvzKuCjOQPZOdTo
         llcDFbiNrvyRH8UgYOKrJykxqrImdj+g7QztPNQr/Gf2IXl6RB1QGZXak31OZzuso4N5
         U71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302882; x=1792907682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=Rikz3HUqnv2iBDmrtGbAJtBwXE3SryreZ3k9x1M6fOm4OlmHTS1ZWoi+imjghKpknQ
         BKTJdvOUAiBqOTxrv60D2aS8+5aeuS2F78P7sCdN3RolWoTgcDwDSML7w6+/W0C0Nqjx
         aC3HGSgzbK9cVzvovs7eXAXr006JKUk4+MC8ovhurlZ8Dri5wmG0xTuOTq10ZfsIaiID
         WmPRFucECNVa0AMtGSfQwKCsrvXqJM6b1wAZAcjTZO1uBMYRXFpHg6ZyP/AAk3C6RKVm
         bK1+r05oTiS1CXR5Nuup9i8BORYTyNl4S5iS/lmjo1ogRBKdVGLxoJ/aUcckOn5mFEn+
         RsIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDjYOmIl4VTENfTZ5J/yFBHPT5V1OviiYSJmD4lsz9Z3LGa38VD5qaCG6g2h2l3Wlv8JSmpC+ooLaWiPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJVqoUGUiDIalWy+Bh2bAP7WyOyLXS9uttrAY1paV9g5ON5BpE
	OmZKtw18L496+tpQ81gBxI23e+eZRS6x1k1n+BA9J5xJMDTHLfbHFjbf
X-Gm-Gg: AYBFou17zz3QSuWdpcXD6C96PI/Pv3jEU8EcH73xAjplnU5usacBd4oW+W4Ja73r5tv
	5eBpGiqr0WXHAzz/S8M2FHYWLZfEfq02q8PSzuSsqPHBU9nHMRjn5e1mS7Kvm8guttv8j0AbAFx
	0Sm+GBSSSrcTqiFp7+c74IZJCRFGysg8EvI/Q5eQRuudZ5u93wNYdopYdhoyJH0J9jpOlXx0KVi
	6DREmyQrMhgKc8/O/EWwZmc+IIsCjaHpFr9DBTepWGpjQKqEdPITIp+v+aM+SgrKjzL28BeGq9u
	4SP8d1qNw/99+1ZqCvEghJnt5C7rQV98EVEeiWThFFfkG2j2++SKT2Q0HXKgMtqxBSTwE+fO/kI
	IfIacMVPiFZJ1ej3xFOvv3O1KVww1KNt58oC/C3Yvr2B5+KVxArSk9se5mK2pzlOcgTDAPZuO3q
	RcEr118q5M3DY0KvmMA77VX2AjQUZDRcvjJ6m8cAOKOAT0MNlY+Ck7Otj9EuAeRaDS7mJeiwSMM
	tWzb0WW0hoJDEFwxpHOfD8MNk+PHmFMK9K3UZKbaBFyJvcmM6j+7eMaijnd6R/DeEJ6tb0E3hK8
	uxU0WLYrw49s+nBZEZ3a3lxQqlECHeBs9sYHIkOcjvfleQ==
X-Received: by 2002:a17:90b:4a45:b0:3ac:b6eb:e0cf with SMTP id 98e67ed59e1d1-3acef5dcc94mr2797709a91.40.1792302882329;
        Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:55 +1000
Subject: [PATCH v3 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-1-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vyIYXeTvpK7D1QV50HT+GFALOmTzN0QImSyZ/l8Csqw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rn9v1rM2RbwXkbirPLsz4fsNjM/kRQz5nGODOYKc
 ej5qWHaMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGpbf4b/fiY1H4ybv6Rw7+vrXbuf+8/0fd9/cvhsW23Edk9s36MfTAx/RXP0Cq1
 6awsZZE4+mdUmqcF7qnS9vuaD7RLe2eslDgmwAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l84.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..ca137aa57461 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -32,6 +35,8 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - reg

-- 
2.56.0

