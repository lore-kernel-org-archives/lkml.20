Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391977;
	b=1fUYpKghAdgnTWPLG+cKv9np/ZfnPPXbvZ0n1o1lUE/TRw2chUF6c2H+UnHQ6FSqzjc0
	 13wnLVa4Nfqlqry01E4kPUvm2RJych+4V4hb8glG5+WohIliM+7eLeJve5NdQrwsHSrRE
	 BdvsYiEJNree+6k0dYsCCRCo7Dntw9yddhOv/4ND4GBBHp0MnGsKxgOcmG1OdN5lGrVH6
	 g/H59n9u0t91vMt9pESvf3Z0r3aHx9IO7BL95kJItIA9gA+PR44nckv9tHTijN5w7TwnS
	 KqAfAwDpb2ltYqiD75oi3InTyKEqckNLwggZsSG1Q6EUdLnTn+WAK1dHJN2mUMeRAQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=;
	b=LQmTnBAwU1RKtSU9dV186awnj685cLGgjyuInrZtgDqUNxPp9kg4ZnsKRPPr/xidPDvl
	 1Z2RlFd8ftpD+zn78vt54y9WcSKtVw92025SBg1yIQC/lX4aJN1f4TM7zwyz8XvTkZbz2
	 5m8RNkUbi9DlIOxIqFQJzpFKt3u/50BIpI+yPxlebgxCXHwN8h4zq5e/kBl+pJTciO8kr
	 gCMsYHG7CAWRSmFhwrnvssoju5pxy3NThW48RQT206+0uMsOLIf9gRXYLxW+++QKRcuLz
	 dmNtj4Qd6jkZAM+JWbRUQyZtB71Kw9+X2SIP7qDOvLozA6Ndyrgli3gtig19inD+rHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M1BPuypu;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13B606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F13B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M1BPuypu
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so30913545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391976; x=1794996776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=;
        b=M1BPuypuqbOYuIE3OFv7eu4t5Z0ryvnYo/c0POh+pM8jus71+rhZO2KIJgZLydhafJ
         q0KVqwg5aHm7DeeNm2O7U1YD5cGeavuDSQHqLjyKKeF/Es2Zqjjzgvtv2H9il8ZuT3Pv
         f+ELOx53khbGuWY4jcYMgnAlaxrZMywmcWOoCBSIl+Yx17tXUJiSazCq6/vZSghbn8D1
         yUNc9/j6Rjb95DNy2KrNqTdR7qhCYxQyX0Q2HS6NP5nVZuJoiRiQ4XT1pSmMLwyawYGs
         a6kzPXFayQ3Ry9Nbuqf/pF1Gh3XITVXbKDrfq7siRMSO+HsZ9TfpFzhfD8NtoYFnUfjD
         9LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391976; x=1794996776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=;
        b=yWgJOblM+rqZIKx6RRJUJGn2P7sxum60f4J89+7K1rDEPB4kupUi4VrbIzxBpNb3d/
         WJ1K3g0tdSr0vqLnPpWYhOF+pXeotJ2l1CU2PMvqn4wHlPRhZ8IZtuktYqujh9AW3n52
         tHVT0ar0KFPWBzoEoiAzojh3xrME+0M9ILY1fEElRUYoYbXmpj6XMqN6VjSqwRMO94/w
         /dh2QJj7TvCrx6zpfFXeFAdLSetv6PTI8LHCXhdB6EzwLtRyPs0oqwJa6wh0D59xuW/j
         rrsHzjh6/LxnEF7pDraYw6MEV2o7xENQO0U5LoADZYcISRAYMTdig55dociDmi7qMmrZ
         ymnA==
X-Forwarded-Encrypted: i=1; AL+hErGfki4Mg888vJ2yNrptqDBCfIt3/FRWt7wceJ7LXN9qzPb7amUFbQq0erlDRmTGTFzFkJC2gOK1duwztmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hNBi7efrC4A0qWg7oOCnsphosj0XKaCY4+xylpzRrQEJoNJsW
	qcNOS08/SaCy+LzjZiWjZKqKusYoWXKj30cjIb/NkFG4z+QcueMQjBpf2o+GuJjig7osui/8ktz
	soYSMcSI=
X-Gm-Gg: AYBFou2zQ2zwXfycOO78vY7rFdW2SJNIgLWBvlikbpslbmESZ6kJYUHDCNEfDfwboR5
	ARZwKBWwipta1h04D7W4RSIxFhjDJGuJgA9z3pbze6C+ghUfuJ0+V8Z7bnb5C7u/n6upjK8cYVg
	VSReyd5+aVey/S9SooLDZNddWgzOilfpLb6hrtUhfrb7slPs09DFa9NKZt8mBDK4K/yujt3Reg/
	hpAzVsLGQqjPRavKKolU2i629uqBNonFFzCR0m3oUNY9DGHtTQLTrzcGBUsOW38760wiobIUyd8
	cQ7FKscW69UhT7GFCrKZ9m2Jw5JN0wsPWcWiyqbTgHNUxSuSuHjKxhF8IZwb78+Z/VUCy5PKFGg
	RgD87QrwM3oz7p8Hack7asO+ECHIJ5uXXtjWikBWngv35IIMtNCTA8kz4AwbUvB2PzrZq0/tMwv
	FUuP/pJRhVGXo7ZklZIYtZjh1aXdOpw4zvWa9nUbUJYWZ27JaA5OXI6Rc4o+aSEEDoqMvJcS5lr
	0jzI68qrnhc5yge8f2uViQvD23luw2V5YjUgVyJ2Zn1nxbj2Di2zhUna7eCFtXCw9czEFwea+Dw
	pQ86372EmDHtCZShesYbWcFTk/U=
X-Received: by 2002:a05:600c:888d:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4ba495c2fe5mr18878685e9.9.1794391975803;
        Wed, 11 Nov 2026 02:12:55 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:55 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:12:49 +0100
Subject: [PATCH v2 2/2] ASoC: meson: gx-formatter: add lockdep_assert_held
 check
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vZUPcnmxkAiby0ImBP4p7xGG24J8BAgjSTNkADYSIMA=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7Jd0Ttd0+Gv7UCOveuLGBfyZezWL16bIlh+c8LR+d
 v+dqRrpHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIXAOG/1mGURtdjiyrbC57
 s7r5XsGPhnn+m40Dlt9qvtLML16S/4CR4Wq+vt6UL3Nrmtf+C/zyRbZZdreH3MHvwXftHDpvXHz
 zgxMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

The documentation of 'struct gx_formatter_ops' states that
formatter's callbacks for enable/disable/prepare are called with the
spinlock held. Validate this by adding 'lockdep_assert_held()' in
'gx_formatter_enable'/'gx_formatter_disable'.

Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-formatter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index d3bc0c6c81cd..46efe34e84e1 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -22,6 +22,8 @@ static int gx_formatter_enable(struct gx_formatter *formatter)
 {
 	int ret;
 
+	lockdep_assert_held(&formatter->stream->lock);
+
 	/* Do nothing if the formatter is already enabled */
 	if (formatter->enabled)
 		return 0;
@@ -46,6 +48,8 @@ static int gx_formatter_enable(struct gx_formatter *formatter)
 
 static void gx_formatter_disable(struct gx_formatter *formatter)
 {
+	lockdep_assert_held(&formatter->stream->lock);
+
 	/* Do nothing if the formatter is already disabled */
 	if (!formatter->enabled)
 		return;

-- 
2.47.3

