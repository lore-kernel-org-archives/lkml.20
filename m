Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746172;
	b=I7aEnNXMh3tkr2Q1VXyWvzvLAfE8KEJvOV3xK/hDQVmYEMxam4PQ72IYSSwKZ3HXaHzK
	 iTzQMRbQGbCqKrK9RprhCC73BRP05AHd5JkDPZAVn7HBR9McCUz8jYyZtzSXJmQHFfc3j
	 yyJZ028I5alpeX78K7HMFxoa8lvIw8cPDVCUZi6p021u990ru1mpexfhVW94kSyrQcrkv
	 BKo9h9YjVMr129G2wv/Y8Mz+yML5FSXzChOg2aDvZvF0xbZow6VDiJanmrSFETL3fw6S+
	 wZXpWjuR+8/88Zc7LbMJ/uF7WrkQZwfC8sXKPTfh+xPvR4KecVFgyiD+eqUSzrPykGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JO0tB7Xd9eWgQ+Y6nIQYBILBi0lSDC/RKqQDkgfwr9U=;
	b=o80+gEITZKwvhmpXFfscwKaMCSY+JWxCreq3zYveQjFGzmuIkxSoDGE2gE7LAqEUeDMt
	 0d22+VOlyVKboCZEUXhQr1/vDfdis4xwDn5+aAQD3xxYHlYT4zpSK82C2JqdbIHwPK1zO
	 2QvQ/blt0BID5u36WAQsqf3MAVyyGW5FE66PuXoo6sK7wRgEGS/7lVD56pKB6d1qziG9U
	 TVEikM3I9madTkukNADmg3DsjyMBOjQYp/S0KLmJ3wHNHdT7nAwEm+Y/oxX9giR5J2HaK
	 ebNoEVHzJeqonkvY4T52sJKpxkDXIQYjeLNceKThSwidqoi78dR54cJHftvddEb821A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tFgcO7MV;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A30C606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A30C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tFgcO7MV
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso327939a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746156; x=1793350956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO0tB7Xd9eWgQ+Y6nIQYBILBi0lSDC/RKqQDkgfwr9U=;
        b=tFgcO7MVBOnZiWQopcfBHuDRSroc9h0A5wrBiJro0X7bFyWnJb+8EThzICDLOR/A3v
         qMurC9aR3UJYR0jm+gzLuJKDIgULLbl7qfHC/paoV9LJ+zpocymdFXHClhPp6PTMAZzj
         EBlUBgM88fe6867MfY+9fNtEf1YrDRq27Y7LDuGqxvWX0xfHKU1fDRZSkUsMZIlkrtsZ
         wRhivkJXph9q1zYAL7/Bux2C7ugHYcku4NSKshHtUjkEn4Kuzxn7HD1ZGx8nCjjqQd7B
         SDQ/xKcNKh3i6+KE0/BkUGmzhKBQa41aNI2QjdrD99a0DVqgaKTJSREjRO5cgqFzO5M+
         q3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746156; x=1793350956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JO0tB7Xd9eWgQ+Y6nIQYBILBi0lSDC/RKqQDkgfwr9U=;
        b=O2JOEFka0xAM7PM6Ca3oD5EdV7mk99KStFRTf55DrtZMLwu8P0Vjzr0M79i8gdByQP
         7Vc4b6H1fGoY1SIdZuHqtBvXQYVNi/lZ1p7wUt841fTgCDZX2EfecpY7D2yJCsZDiE1M
         vN8god1pKE+TbfBRqPGSoiQ0qbIv8wiO4+vyjP6aojF9z1+H8RyWTrHSpfX5iF+HljIV
         MgHuevAStnYx7Fxo8wHyydEQh38CLPVloqsGmSa0wL1KDLzWlhYWCYS44bi8nOhYcfsG
         6J6JE4iqsk+ZkHBQcYelCxAUn9rixxw5c4xrTIr2kg3wRRP/myv4WCBw4pVGEq13bFmH
         3hMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzGnLdym5uznIBFbJUC9ueeUL0NIz68JM9eKLpzg1mHEE1Vj/QFY5vpyoNEWJmbqVS23c6tTInvfLXYp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhQlEVyuxns9qr1B+7OnrKXqHgMywZCLB8qb7b+o9wI52c54yS
	4mStoiiyLkk8ZUOJ8skN2q5LWjK1df/hxdMoOoNVEni5tSU5/2p50r7W
X-Gm-Gg: AYBFou3d0kAE6HIJtRpKyxdpHkEAgwf/aPxjvf24KtZh4wnlNacaL9WDV2DXcaveXLt
	Bn9+dF9N3nhcibq8IBiHYIXGYuyyMyqNgVoVvxdjsIMwXk7AawvJkWJ7Wjk4km6hHo248UeBhVR
	Va7JW8xQYYm2v2AwQ/lXTdcxHOIQMI7kmMJVm9PyPcFDHUquYgSp4wHp3mbpo0Wv2AwnMDfGYzM
	Jpua2b4btZmjCHoyS5D8rQC9tVPLFfewnfZf0x3vRknFS3a3jBqlRIv+x3ChNpDnwqAFwmXZ8ST
	xfPOM2sMd6VQbQrp6U+tZRvlQwnIFrFKnEpClj+4a32RL7SZCCR49m94rWOgFKl9TIgftSLGBD2
	zqSBSJHJLsJuJp2EP8LtwfzvL5RPXEOPZrlTLR2b+t98qwgxvmhdBbivroocLk6H7cjM4NTpO1F
	SN4mAmoJQUVlwWojCPMzwaOL4FNLmltf3p2JtDRE28bvrxiPVTF12TMWd7KSU4R0qGxqKnCpFgR
	dpVvui2E9zW4HVXCBpSj8753lCdNjsnBweIHv3rQtO+Ular42jg6G6wWD0pm9jTIz+jUC59qOrh
	b6lLj7sVn8m8CMeThC7l3kf7qOZdIP+5fbaoKv+43RqodYpSYC/yjxSoPLHA7ba0sQtwlgY=
X-Received: by 2002:a17:90a:d40b:b0:3ac:9785:4c32 with SMTP id 98e67ed59e1d1-3adce03f56emr1208626a91.30.1792746156497;
        Fri, 23 Oct 2026 02:02:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: codecs: tfa989x: Handle hw_params return value
Date: Fri, 23 Oct 2026 16:01:56 +0700
Message-ID: <20261023090157.518032-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023090157.518032-1-phucduc.bui@gmail.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
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

snd_soc_component_update_bits() may return 1 when the register value
changes, but ASoC only marks the DAI hw_params as done when .hw_params()
returns 0.

Propagate negative errors and return 0 on success.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tfa989x.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index 7204be155eb9..885b3ea19c2c 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -160,15 +160,24 @@ static int tfa989x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	int sr;
+	int sr, ret;
 
 	sr = tfa989x_find_sample_rate(params_rate(params));
 	if (sr < 0)
 		return sr;
 
-	return snd_soc_component_update_bits(component, TFA989X_I2SREG,
-					     TFA989X_I2SREG_I2SSR_MSK,
-					     sr << TFA989X_I2SREG_I2SSR);
+	ret = snd_soc_component_update_bits(component, TFA989X_I2SREG,
+					    TFA989X_I2SREG_I2SSR_MSK,
+					    sr << TFA989X_I2SREG_I2SSR);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	return 0;
 }
 
 static const struct snd_soc_dai_ops tfa989x_dai_ops = {
-- 
2.43.0

