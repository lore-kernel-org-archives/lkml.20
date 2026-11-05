Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907923;
	b=hxu9xj/juKMFYgO1K2mPkuT1J8DXOJFTj+AjFuh9b1CWS4cfLwDCGZQNJXDHEzBlecZr
	 /HICmipX2g4uaxl1Wuqo8rf/HMdo2ntJqazW3YuXU+ob9bHEmU2wlH2Kvd9+rN7UagM6B
	 540qGybOZVkCLJahwmpZxxoLh21SIdHNaFGoMv0yuKHEKhIWer8mIl12voGxhKGGZOkkj
	 5pUKU9Pj28i+s9lW5867DdA/9zbUV4wY3Ml3eoxS9rL6UJqLRtpBJRc6aG0NFE09mtj+8
	 0LWKR0Y3VoltjF+s6bvyJobOCKHkzBPyxU1NrwUF5XSUcWybIMY92cIug5KvRZYcyOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=hnM7SezlhVAnnTxMv6A6kH3OyX37d2rL1Wz86MVNIE6w0d5YjJlJyVntbdn/ihPJTSjD
	 7aP6l1I0b0HKOwPcHEjqNOAOBcbpJOhxocTk8jOxtC1Xu8Xi1KJhol5y/+8PqJcryvOus
	 3t0wOGlhZK7ZvP7Gn2Cs3QBP2nHYLwwO4mXLlpcmNU46dK5IFP2+myxNA5yI/fO5vXLLM
	 7SJmFg4tSdWvMcePVfMDc1OylelTaRd7+42LuIYaR+VLKtH/8nzd9kqBSIh1MRZ6qFmqj
	 QAjaNUdSCKIBOO/qLELIsyq8pqjCNufmvcRwje5Y7vbsLh0QsPM5fMMODYNPhYmtCEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrX5BTtZ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6206079561
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6206079561
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrX5BTtZ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso17628965e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907922; x=1794512722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=RrX5BTtZ25KAkyVDqIgIjSieI0yowwfSr8T6mwymv0DBFz5APBPsQ60BLti2G0x05q
         6boqmc8T+fJnxWSpzn8kJusKUm60NFwdJju/vVYZ3iqkbGQzDtfFvv/qi3tNuErvjFQe
         11nINNWnhw0ATZ5Z0jI9ua9qp/9M4BXOQh8gsE8HOJjK9+JEh2ZyMaKOxeec2cZVtpKK
         k8HMWcB67/FgMv553KebZ8rp0aOtZ37D8ZbsTaxepxk5+SsWn0SA5ZeuI9H04WfA/VaL
         WJq5E68OZ+r+EbYxT3Ff7TSgkCiF45epeHQoZdEWx7D/vK7+0qaxziCcKWwcGhlSdQT+
         Ybnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907922; x=1794512722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=AHc6EYMf5sbubMreaxIlCLGBzyApw6GXIoy2qFFvOeRv/X5YxYNAk+illEP8g4OWUE
         xPjlV2PrNnxxWuFLrpWyb0/Eyoef72RUn3UrnS7BpJLYGlsXLI5VdnHg42HKYiZMIDd4
         WZjTU9+2cEsPTuuNBCSK3CNMtCZlNzTniVucS8sRQrFVuGqZrPA31+dPGfMr+AVpaiMV
         qwoiRDPXXAwWuyrrBoIqORQbkEl9mO7s4i8asYeJuGHQYYVx2brVu6Uvnm8w6VuqCZlY
         BraWy9Q+Pk4mgqvuOB7AhESPTysPi52vBfMi6gLzIIh3UhQ0n9OV16fhOiyBFA8fazdm
         nsbg==
X-Forwarded-Encrypted: i=1; AKwUvBw643LVVoY13AuTdCeorFqfCL/mGyKRHxXOrAPrIIo6Jd1hYacaMp2L+xWAWDgZXK07VyhOJwPdb9KEf6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EjWu6VqX29ZY9TCFcKou+6aiv+6aFZ2NtUfqRxb9ArWOWrknJ
	UUZSekyJF4K2yAP+68WY04KS1lLOorl92aYZO4Otzo2d99R/mYJ8hde7
X-Gm-Gg: AYBFou3pnDZ82G5zWROkRggPd5bU8Zx9yUovjvdRguOGH0YxyEMvakbudjKjoenmrql
	CE5XWY/zo1oucOgIHVK7gBZWrnATdwZQtpQFVDXmybRtCbUuqfpJQZo9hAFmsAPbGrc50vOfjQ6
	D8FlOPIlmehK30viepT4cvHukR/LUA2Gd4H7tB2F7WXdcAAbtKxD2cfGbFj1HR/YCVY1Erl1co9
	ybWZ633S40Rm41OJ262+qjePA5jS3nKxCQQepwNHgiKIUT+cZo1Hk40krQI54NF8E1uCRwCRBbC
	js488Q/KTcA1WdupjbUFehEelnslorweXQ4Hwgxtf9k0unPvGdHe4CfGdNyZ9GpW2l5jXlxNJK3
	iaVo0VtP5wCqf97TOKt9EpRqsT/7yuRobqrmCU7StTpJ+o2aLHvVZVnYCU8bznSbh6p9b8OUt3x
	nxpc757dRInIVhNLW95nxHW93AV1YEZ9gxqVvdE5fvb1vM+p/j7K+f60P3mv1pHpxmWF162qGuU
	NZrnij9krNK3TwGpsqYCw8MnJFz/aLDADQOSFRBwzGzZT2EkU2w+M4/LL8ik07R1796kTI1qkJE
	xJEbbypI45Q0qyWxwA0jLoOM
X-Received: by 2002:a05:600c:5285:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4b6db4a9a2emr3123275e9.2.1793907921887;
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 2/8] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu,  5 Nov 2026 20:41:33 +0100
Message-ID: <20261105194426.1113050-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
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

