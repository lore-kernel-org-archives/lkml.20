Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260970;
	b=W0Rp9YFOUFStJjD9cj62ojZ1TT1nvV0QHAvfy9qldSKgmZZfhIX02EypNllkQDO3P3zb
	 CpCDC1Q6J4qlZb2wmKnGEwTDIGG/Ni1/Zc6lorIGNmbiIe1iK6+TVARYMqEgCl6CrcyzM
	 P7VLamEBQLtqUAjrPT/MUzhBf7psPh3nSZkX6p+x9RZ+STfiuI+nQkdO6NazUU8LAxB76
	 v8RyCUf6cNM/cwg8MsJJzM9e28WfXLkapo3mrIHDs+OsY+Jj6FsDoJb1NKbSZSQ+3gype
	 SA3/mYsx4+1qCzLikgJuEKZJrDBAlStmcbo5rdaJYhVGm+ilJN7d/5MnmQw/I6FacZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jeRcowEcJztgoTCNQbpSgSRY43qw49t8iFvIdVsX2rI=;
	b=Y7Lz9h5qxjWGfILVJAXv1sj3gqtD6aIm8JVvw5vqqhrVgjuGNxMAIhgBrgrMmBs1ejte
	 KTlO52sZ9daGAeL1kf/FTccpVCvlfrwZ9rPVGOyWFoYZxvrXNSUoTqGyH7Pw4LsptjME4
	 PLXMVbXXYM05n/ZilDxYfVxiy2E2HXIGZgNZJ7pwo6cbzPHu6L+fe1z9H53k9D1f4ayWl
	 lnq7k3mg/rz+CMSfHrglbYSW60crwTGHB3Fumrc8VUb+SN/kCpeheCMRCj98OVlRdlYU6
	 pDNvoRdcpCz2jW3uQ9QqsPsHpLy/bx97Sd2DjPCPEi9aQg2rURH+hWc5YW3Wsvby1aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXYStLfA;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB34606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB34606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXYStLfA
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso922919a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260969; x=1793865769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeRcowEcJztgoTCNQbpSgSRY43qw49t8iFvIdVsX2rI=;
        b=QXYStLfAaS4Q/3RJjB4JyTj3cdZli6O178pczsM98effIniqYEf89O3iKUISQ3gNvZ
         rK93o7KSsxU2sXnMNZEvr5LfHdDFW8FmJOAhH0vZfWW5hhe0PNeVDedupwo1/GhkYml8
         wEsYU8WlvsD6AwWp35igI2Lh5r91x0c5zApu4iT6mWNmbVixhdx4+RMOjNHKE3wMm5mp
         vxidj2JmxtPpSKABk9ow+kCasisVEm2I2WgYCZBr45S7xEdzHHc0R7tH1nn2udKj2yT9
         mV/HbRQBzGM0keKJpqKCnLKacxphL9fJgnKp3vFm4tpPba+AGAaFm0noERI4PECeSTic
         J4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260969; x=1793865769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeRcowEcJztgoTCNQbpSgSRY43qw49t8iFvIdVsX2rI=;
        b=SXxak9rsXE6xnhRKOGxEgeGaCxwZ9PerQe4S043EWL3D7p+KuHecK+G6zOSi+tywYy
         1s6qoVEmEAdOxGp6lSSdSs2U9otaurPmGhhQXY2Xkn/vDFN6D9Wc/wMNeJ1yIYDDGiJQ
         v0AY0QzBk2FnQJrwH3I6BUpmMg9pySCf6uzkERulG8/XH88hsrzhsn6sBolaRa71eYry
         ESEEYQX0YC9HF5fXpxIcMd80RmYPytuiEQiJhzWiv41V98E3F38aFb70FhJSB6iXnmrP
         r8rbWrq7VJ2sM9wfEDt4znwTo8X6TqOAC3e79HA5tDVXiSOimCNRKgNZqVG1XC/9fSgB
         SwBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFYmY5QfnpDyRVW+Z4KAIDYWm/mI9K4IvnlCP5SjwBJlaO4C4nAq1qfp08n4jckaHvIbrMPSoZsxjnnQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwTHb3lZOwypafnqLHX/RZL2W2qWdg77eLJvHqdcjD1e2GC3k3
	3jBSW5X9snKOhNfsGZYlQafCO15O82LlKRBaVKDXUAbywN//aOt+gEny
X-Gm-Gg: AYBFou1F0ogUZ6oqhoLsu3z6xDSws4Jk9cDjNjm2decAiV4PAgA5RET+yLsDar9r3ak
	gvse/0tKK+Im1HtAvQNLu9YEsbeYOOuNE+wJbuau2LdSpVwcEq6fXIxx8lPw9GHYDg2Sxxpng8j
	xIcAwJhz6cD4GFz3T1rYAj1lb6QD3l4vWJ8kBNC3DFTVfOk5SR9DxZ+3UgIbtdng9SJ1lI3SaIH
	rUm6i7EPgF0wmoPMT85uMIVaRvrLU0VPvjQU7t9TVXZXHaJhaLgYKZKkGxCG4BSNDtpMRDEL/iE
	SiuWJf14+O+j19PS5MQs8Oyp47fAenWOTBHLsCSuptZNACtfNZ+Wqp/bDA6BPgXfTxGroDkqn4E
	C80ys367i61cA1Gpv7cPuWAdgFu88SQFkb42B/13JkcP8OV2bC9WHJFjAbovraODcM09ryS5a+F
	JGsX0aeAMZOl2TiHPTysNQpoMD9D7o7ZoOTtxZEdMHwcZPkA+z+72ckaAwxlNdICdycrH8wNDLG
	aSXXiwdrBwOCihe+z/CP7VkB3kmrHaKn5hl/JQvUtbfgspGFf6P5x15HLmiXPtIto6e95BAccCf
	yRTJXZ5yzXxv0ftHUiBNSDdW7lObMpLlQHYEfHGDxSdPEod6xseZBSqlCF5xojmnQWJtNzhyuY1
	H7t9wLlVJwZerqIzgRLQzPXhpG3t0rqR/H2YBBGncAVlq
X-Received: by 2002:a17:90b:1c01:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3ae57f63826mr3330013a91.15.1793260969503;
        Thu, 29 Oct 2026 01:02:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm5059547a12.18.2026.10.29.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:02:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: google: Remove redundant error message
Date: Thu, 29 Oct 2026 15:01:43 +0700
Message-ID: <20261029080143.12304-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080143.12304-1-phucduc.bui@gmail.com>
References: <20261029080143.12304-1-phucduc.bui@gmail.com>
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

Remove the redundant error message when devm_snd_soc_register_component()
fails. The errors handled here are already reported deeper in the
call chain, so the additional dev_err() call is unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/google/chv3-i2s.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index ebc352bd9e9b..102f931da357 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -310,10 +310,8 @@ static int chv3_i2s_probe(struct platform_device *pdev)
 
 	res = devm_snd_soc_register_component(&pdev->dev, &chv3_i2s_comp,
 					      &chv3_i2s_dai, 1);
-	if (res) {
-		dev_err(&pdev->dev, "couldn't register component: %d\n", res);
+	if (res)
 		return res;
-	}
 
 	return 0;
 }
-- 
2.43.0

