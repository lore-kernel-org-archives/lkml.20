Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351705;
	b=lYiyyXzY6GeVwRrwufHJg6TH6/hHvnENMDh/bpvcK/h0jU5T+yHyDc3jXyU4FfimcHsl
	 1jS6OfULuVe+9vyI6Lp4q1UJMy7CYYKkvjkpgyuhngVsVSIjIA54/lFJGz5MrjNyzwRnq
	 V8kP8I7oTujCMowgPVWN6TUfKhE09be8Gw+r0dn0tP0MV+iQwRtZ17JZLqz8CcjowK/eV
	 na2hy7Zdz0w3BzKFfYNGFfrM/1JiLN+98zvUZj4wX9XhDk9BMopcNpK2ahWTnbzjNq16S
	 pijdQ02lQDobHinrVRRcMAQJSnSCy0cI1BGEIzx76RDdg2pCD5xBNDAoVamVgAksc4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
	b=Ly2wZ1tpnSqAfjiUEr+f0T4VS3tzRAGeOAH/LW8jFV+vaWwz+JnuQSNKuhuKjWlH3D2t
	 0SY+nVuNNFKUJZy1+adRXtUOLNMl+E0NA+rFL8QAVW4XPLjlOoDZHYf7ycrOcspyaabqb
	 XmP2oTuNDUEFso1yHho3bk0cd9MWzU9HIFx+fHjsxve72TbuXEXFcTMeBI3xGEmGhImYM
	 E/zvA0+zTlprIBC7URdYodG5y/+/uO+Nk2UrWES8l2eFXXRMDO7Ivd4x6hzBtB92YpvBa
	 nqPhw9Ne39zYFXJX3HKqSYU+jIYCM2M6RCC/o5+GjxV/TFMmsbOoyNp2N/XUA2AgE4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggwNbcqh;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B5606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67B5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggwNbcqh
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8fe8e343fso3166875ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351704; x=1793956504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
        b=ggwNbcqhxPysnARVFOm5hYRe84p4hysDACIXJyBYHZ3gfywBlWTk9IZcOATvCdlmKh
         Ak+PrxmwaHvl93tBD3QhHhSoyij4z84YuHF+xY8VSiuaEGVJ4P2TYvKzxfa1OLqYVd5A
         ViHiaJkbS1DozM2nRj4tXoVY3A5UJf+D4IBEu/MocQPb7KpU7HHcvH0VDcuvV9eRERll
         xcuwEEuFgawBIFmh96qmd2OSOuaGzh21OQdrh4fw2qmNpHTJBDtn3kgmLXqwMw8Fk/MD
         m+HQEPGTByv62feTbQxlJvS+cWORbjMWkabXxgvPh63+0dTkHRTshw8IauO1K1MweWO/
         8n9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351704; x=1793956504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
        b=nv9r163X18J6flAFTzzPd+cOjS30ZtEAmwirP67/xboL0wd37atdrI0x8hrsLU9p22
         4QGT5mS5u9eA83pleBKFk0iel+y1l7jKq1NXkoqwAPr1pPtt74aNn8u/avQUR7T64hYR
         WhgPzip8sLFDf1eg7zfahexWABJhrnThTOrVcqDGF0yNYVWb9KDQWuTeYmo1oKvCv5rO
         v0ji5rEcJXS5DTIAyRbx8bJ01mHsKKPqLRATzyXX++j58hexCmojIBChTyPDeeWqXRIp
         Vj4HPetCGquihV3EERLto1Q7bq2rsEjZKXJ6ltu/i0G87xMceqS58EZREr3DFPsybrej
         UehQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKfGHj3lMBBGwDtsnjJJcsiJ/yf02/yNItmC2eZjoPYBvHQRX1wUqPeXuk4mkEN0Ohy7xD/xiHppQdbOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi1FFFZE1PR6ZLiwyKLoC318kd8FN+LO0w71yQoW0mRlzqOEYr
	nQcgsKgWjVJEqOowSv+YamhWLN7qwaYG4eAPh41drKokjTm40rPTfzv1
X-Gm-Gg: AYBFou2Y4lK92LdvOLfDgLfQgu4swHBRsvwu4ZQmd62EF4qHTJJBHZFqittA40Yl39g
	efW/htTE/bBzL6TDx+k+B13BFct3gWZkcjZdpXJhoyt2Gu5czwPO84yTpEuyn6hU4c6KrvrfiIs
	956Bjba4yjVIMBh8eLwfFcHV+g5l3GUBnHyr0LyRWxJ695XlML4Tz49VX10m/RyHODxYBBjken/
	EHEcf8ID8tsHEiT9uBwRafAoj0K4xYd4f5tGQoijgf8vWiZ8CcZMb55gz4YSbXjkCvVJvdc9met
	DgSTmqMIzPY27sBd/CJ+GA05e9R63saQNZmRcu/E+er9u2A9RhjtauZo3BIbT8NkngtAUCUjf8w
	VgIVE661lsg1DL0MNifr0/tMvr6TtleO/d2PqXZxoe6mMQoNSvKmtHkARcC7H4nBcSh5AFVn/QR
	2WFJh7uUOqSaMUNmvFUA2cctOs71msUDjQWybVpWY+665bEAMdTRv6nfJhm3LVkDIsm85dX2khq
	YlyeEixo7UufQWokArCvekzJvwyZlK1PicmrUUBT6hP7Gl5QnI63T+dP0GIkNAkzrOOMi+SfQFY
	YN3n2sgTKCtuHaIfhd/fN14fw5d8/RQgIPEJ1mTfTDjmtpFI2mFWcp5ns4sIM8mCqWKljDj0nVu
	KN5RC6N/3hsmQ0TQbdlQzJh5TMHbuLXyf7NCHUt4BOt+IQ2QJjvJle6bP0p+LU37pUA==
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr17350985ad.24.1793351703935;
        Fri, 30 Oct 2026 02:15:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:15:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] ASoC: fsl_sai: Propagate device tree property read errors
Date: Fri, 30 Oct 2026 16:14:03 +0700
Message-ID: <20261030091404.18757-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Return the original error codes from of_property_read_u32_index()
instead of replacing them with -EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5532fab80be0..cb07e7d13132 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1495,15 +1495,15 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 		 */
 		ret = of_property_read_u32_index(np, propname, index++, &type);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		ret = of_property_read_u32_index(np, propname, index++, &rx);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		ret = of_property_read_u32_index(np, propname, index++, &tx);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		if ((rx & ~soc_dl) || (tx & ~soc_dl)) {
 			dev_err(dev, "dataline cfg[%d] setting error, mask is 0x%x\n", i, soc_dl);
-- 
2.43.0

