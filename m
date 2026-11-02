Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614425;
	b=O/rhG3bSdVDXldgRWR2MXPCRxBS9M7IEWx6sOnGK8gl+jenJDit06Zamh+ZPJgxcN7/5
	 DuZ4RzTfbfahP+RRryPJOebiy2IvCZpj25sJFe0RKrcDTfFySWgbLaF8m4xRS2gQNM12Z
	 9yyeGc8ECYtaoOtx+M5nHzA5dtYu7Mznm2CR3prgzwinEikE2Ni50iOhXoI9JJCHRd3TV
	 V9qg0ad66ZElAhR10zE74GrqWf05BlRBBmMtnumYb1k+O8vc65I8z/UJu9dtr79Hq2s2h
	 hANm3zGx5QDXTYXh4B3RXIBnBvMwmr6FZx1j05TYzTaHLTv9Lyvr77GRLwD2kscYB/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0/YKtDl3kyknZEf1poD/4hGve8tGLQ14nN7yKL9Ojgs=;
	b=ywhYv1jUAbfF3JtIdol3btdomQvNYN63O0T2tdS4ylez+ATTAsi+lDFIXFVP+YgCbXMU
	 5StfSe/p2cP26LzaH1HK6ZG1V9NJrpOLgZVl7cuU0/Pz48ggCldsqX8pB50sbcmdYDqs5
	 Dni17haWfmgTH0LP7+lZHRcZtDCisvujYcvGetDFWLiuHcwu0byIPgP2H/+Y7xYfQdkwd
	 4e1Wv5zjo7Xm0yG93t+2aTYL8Zm5A4RKywYaD215Pbh+ha9PHuYv+51vn3Wp4V48lLkB7
	 Ho5XXzOVgiz6Mv1DYL9y4wzIRN49M6KOY56TBpyy08fMx4kMZLW88zkugqgJm0rj2rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGgoNLh0;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23656606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23656606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGgoNLh0
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1488964a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614423; x=1794219223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/YKtDl3kyknZEf1poD/4hGve8tGLQ14nN7yKL9Ojgs=;
        b=PGgoNLh0EZlQj4dyv9MgssIQx/bFbr7KGJXYLtareFgZ5/RICqwI1uLgg3BN09QKA8
         ZGm8OO93Yx0bvbYl8YvMKevNkWkIVmRUo32NRZteidD1Ze/thdX7yjKt/rVD1xR3cdE0
         Txoc2xuHV6qG+HpiIZrlCKmu1qEs/QUU5syyEKZWJtdi8cnOF/1jE9mc/FzUwLOeJE1a
         YlKhk2n9g0pBJStgek4JKrTQ0XOByPzb4KCkdEbWQoIkMNHSyBV92/0PYjxtF1ylAWi0
         JeF/7WHDgL8Z41Zs7DdtPY64TMeN8Dywv4uPGme1gnJFOJoRHMpbgtUg2HQVUwVRefgF
         eJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614423; x=1794219223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/YKtDl3kyknZEf1poD/4hGve8tGLQ14nN7yKL9Ojgs=;
        b=0iwLgfY6YPQZgipe/RQMqqvUOA/y8YFVZzds3OmM+LPwGAT9FBH3PhpCr4ATBF7aDn
         u/zRUE4J1IO4TSEKksbD/ymj5CmpJdUS7XZdeejOSYbW9mNImBwcj848iqCRDFDi1SrV
         3h47+t+T2zJmHCDUu4THiKqMp4F0CgEdMDksB1hJUyC2597kSItLBj19VOanQ+LGDHQe
         lm0i4VvG+b19Prk4G48IW578PmujmZk+SsNwcUPLkU45dS8FSAQwim+oxLbtvDSPoA3w
         TQ9xlzSAfy8U2Uv1Mi0maKztXw8nqsUP65SJGw2WhvKh2obBNSuejevsEKQz7mKNBzFG
         frbg==
X-Forwarded-Encrypted: i=1; AKwUvBwi03k+TZhKBW1nAAATko8sTludMIyVaEmTqR4w1QkVatGM+h1c9luK6ziGZe/3GopM5bQBc8NL96Shq8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lSg61/tBDrN7rqi4Xf9SD8o58oIZb34CxR0dAxFDFmvgV+4gJ
	E0BVLO//wu3IZsbcoYCILAPxZEf/Ms+WJ+9J6N/TGKTImcVup1ygKw5I
X-Gm-Gg: AYBFou1IC4CEzh6XMP+nBU8wPtwG/ac7JJrl0OtAk2CuSU4hHHrfCp+LGMSVgTzqAn3
	Lug7U5sywjM3MGlfzy+WfyezY9EW2Hu8vI/GR6y1KYv/w8zNF7OQ7Qw+ypcEQlj4gdZ2ccHz1sD
	9CJo74oTCglF+/19z8UGjXIWIIMjV2V8iSIq2knLgBB+2sdNKTkPYT3sRwaGA6eiygbOD2CLv/1
	QReTlQPwyFAMlp84KY3sabv5QixAGTdk2r1fltLCjniLQgPRi6I7TO7wWlK4v4qbMwQLtFTQlDz
	hUsUU6EAjGeIWug5r19VIM+o111yL8vKzWeVDzQNLVCzrrAuhDCGKKjCIIoSC6HXVVQaPDW5ilA
	X7QbaW3WHDllKYHvAquoUVMD1unUscgh17iPXL9puOX0dJUU3qJBkvwfots/g2/c4xEjMfWENej
	pOR1c52+ze5cs9oX5H+niJ1rwwMJqQbJZ9vVkzjSjV0SdqiYRK4WZSpiun8vqmfKVXIMjoAw5Mg
	nr3p/9k+nT34wlPUDhoKeQmPlwKHoMFagSeVxGjZtYnflWJX7qZaMINsukFiziHWB5qw3cJkZP0
	eReNCuMRjTC+Qtkp7Lkrsl8rR68Njrp+pIUEkp/ygp6rHZkjkllOiCm5kH+oFGK3Za35SGrwBA=
	=
X-Received: by 2002:a17:90b:2711:b0:3ac:7449:40b4 with SMTP id 98e67ed59e1d1-3ae8981bdebmr6716889a91.45.1793614423391;
        Mon, 02 Nov 2026 02:13:43 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm18762641a91.1.2026.11.02.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:13:43 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: dsa: motorcomm: Do not publish partial MIB sample
Date: Mon,  2 Nov 2026 18:13:31 +0800
Message-ID: <20261102101334.3525485-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When a register read failed midway, the buffer was published anyway,
mixing fresh packet counters with stale byte counters; get_stats64 then
subtracts ETH_FCS_LEN per packet from the stale byte counter and
underflows on unsigned arithmetic.

Keep the last complete sample instead.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/mib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index 6b170fc6e187..bbcc418fcc87 100644
--- a/drivers/net/dsa/motorcomm/mib.c
+++ b/drivers/net/dsa/motorcomm/mib.c
@@ -127,6 +127,12 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 		buf[i] = val;
 	}
 
+	if (res) {
+		dev_err(dev, "Failed to %s port %d: %i\n", "read stats for",
+			port, res);
+		return res;
+	}
+
 	flags = u64_stats_update_begin_irqsave(&pm->syncp);
 	for (size_t i = 0; i < ARRAY_SIZE(yt921x_mib_descs); i++)
 		u64_stats_set(&((u64_stats_t *)mib)[i], buf[i]);
@@ -148,10 +154,7 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 	u64_stats_set(&pm->tx_frames, tx_frames);
 	u64_stats_update_end_irqrestore(&pm->syncp, flags);
 
-	if (res)
-		dev_err(dev, "Failed to %s port %d: %i\n", "read stats for",
-			port, res);
-	return res;
+	return 0;
 }
 
 void yt921x_mib_poll(struct work_struct *work)
-- 
2.53.0

