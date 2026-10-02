Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE76D473C86
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934596; cv=none; b=fwQ0wk5KfisA58OW9Ebt23d+2Jy2YYPK2W7gd8vm5/zlN5DkSN3lue5chAbbf9JbEuk2hnT5QaCU6R1bQuVTJb0uQKqx0ZgxvbPmCdXDfZRGOYw3wVkZ1xqReFsXDxOBu04o2CBQbTKHnQxzhMylvo2u8E/7sfay0aWlIh0RSGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934596; c=relaxed/simple;
	bh=cSMKtHhDDIrlu9/TZiEcgG2pQVjTFVtall/R40Ims+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNrlxO5dYeNlQLY9eurmVU7boD2Iiu7FRkPtjB2Boiw2/AdKh16kVoie26TEBhSwkdHy+owtfrhSg+9xB3LIt+kaQ4MPqnqlBDXp0rxmTKwLMpBtZoe1Rfg2ZTfYAYTRcEnWAM3rdgO3fIHsuF7HRdlbc3AzOBHv2qEJGBCR2HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RjT0BpcV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RjT0BpcV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso11477865e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934586; x=1791539386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtlxzGADVLpRg8uWTI/BZ9pWlYGLrKbVbyi3KlCt684=;
        b=RjT0BpcVCkKgNvQy0BrMfBVvYalTZXVXg56lB07HNdeU83RLXpowbRq1itEJbe/HOs
         3A7E60NFQpfQkWreeqi08HUiD4tIvSQvBtQ14Ax8AKgAcUGw+zn25IG9onYxB4f//Sd9
         5uzB4A9XQauPmwOAa1RPwN/hw7XIE/wD04pko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934586; x=1791539386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtlxzGADVLpRg8uWTI/BZ9pWlYGLrKbVbyi3KlCt684=;
        b=uO0TcbbYZ/fQhaE94Y7fDMCK2cD3+Ry5+0FoytcT2SferqRNuLBFVe8FKHhBNz20Wu
         IcJ56Pim6Ugzqd4VO2NzJVTkliOMalhg8rQ/oAZo9/m7OFVAH4k64QamtrXEhUOHDrSv
         yRZeoopN2AALsYceGkKyt8gye6AZa0gcXeTGCLCkAHDpA/xIaQ0xZ+g4JKz88x0D5jSp
         vxtSuENQnOKIhUt249R5gfba2unJjzqLyvSycV6gGPD+T/64OmSPd1du+BcPzagVNEUS
         IDJAF0L82tF3U/md2mpOqRs681Ysh2avKdqv54YGzJJtGJCE5ljoAH/wWZAxrFGHNyp8
         d7bg==
X-Forwarded-Encrypted: i=1; AKwUvBzhctR8QasId+p8Aeq8zEStINly7Y9yScayhGXwncy0mCXV/OaEqdqzeCzwG1GxFNHrabKlbRxa70HYG8s=@vger.kernel.org
X-Gm-Message-State: AFuF++keuPZrDgN1qDJmjQbwcNsyBDba2+I7gfalw/dcUQnleZd0L1jH
	ijvZ+ceZIwrtAeAiZBCILpNnTXZCKFoQ0x4lvXp5nNbwNBifPJ+8ITkW1ahu1wJCNS0=
X-Gm-Gg: AYBFou2kfS50T4psuRTxuNUEBzo/hddUilFypbYblAIc0dE9vW22sFxb04f0jFHvDTF
	+8tNiADA6+12MQ5ZH16vBrtZKXp7DbZPcgGg5LTCvq4xEaxuPbL0PDbgFEKr0lKihPvi/VsPags
	Pi39pMD38NO3gfBz+cW/Bks1AScJM59Vyen+wpxE3n99MUjYBnokIPpUqlpRmHXY9igEGMB3N8f
	nD0m63uvKBl0AQMcvriWluasqwO6R8WpwtOIm8zZ+ovkf/qhhUwXRokrp78cupjf1MyXIzO24Tu
	WjnZJod0eDcInNkRpZAUrj+cGHT4UY5MJfRLVFenepfjKrq1lEi/tSDtVUr+ledph3bgB2b/Dr9
	IeY5lBwtyecxYy+r2fogT7gDka2CE0uTxz6HDD1MM/vL2whii4uRhTSrm+OFLZGc4ZNnxMfUNSN
	fbMuu3OBQFipJmHBkxOsYNDPCJTC3NxdKsCx0u+shgrNXXPJ4kiU6GE0/b/UijwSU++aFPOn36d
	54=
X-Received: by 2002:a05:600c:4e55:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-4a02755a141mr40643525e9.14.1790934586627;
        Fri, 02 Oct 2026 02:49:46 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef5950sm37281695e9.2.2026.10.02.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:45 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:30 +0200
Subject: [PATCH 1/5] ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-1-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailer: b4 0.15.2

From: Michael Trimarchi <michael@amarulasolutions.com>

The pcm179x driver gains support for the PCM1795 and the PCM1796. Both
are register compatible with the PCM1792A, so they belong in the trivial
codec schema.

pcm179x.txt no longer exists upstream, it was folded into
trivial-codec.yaml when the trivial codec bindings were consolidated.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 Documentation/devicetree/bindings/sound/trivial-codec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/trivial-codec.yaml b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
index 9a35dfb17349..a24a21c855e1 100644
--- a/Documentation/devicetree/bindings/sound/trivial-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
@@ -36,6 +36,8 @@ properties:
       - sdw3019f836300
       - ti,pcm1789
       - ti,pcm1792a
+      - ti,pcm1795
+      - ti,pcm1796
       - ti,pcm5102a
       - wlf,wm8510
       - wlf,wm8523

-- 
2.55.0

