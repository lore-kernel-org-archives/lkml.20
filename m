Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517228;
	b=X0zQN2Dn/l2yrx9pE+QGGmLU5vnDwqfVmfaTlLCZ3JULn0g7ap5WPh6Za5lf4JlI3kR8
	 4aKsC4X3TXB2CU74YU0pCH2Nnts40yQEfbvdF2DPojgYjJxpa0LpQ1/mRBsH174jAZ9Sp
	 sWHhNyu7NK3BcqUF6qIwrar4j9tiHtSAonila0Cyk4UWPnOE9ArphOBYtBLrG6r8kQviQ
	 JPUs56hF9EMaoih7pBOY6FRUAjMXfvmbYIRbUnXSq1tQfFhJFMv/pQYqlr6KIzHgrgZ7P
	 EaQ878X3J6syCCxboe7K2UHo/FfBJMfTu/Dle9TOnQQPu5L3o1YCUVS+T6k7YSLZChg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NHAmGjcfTdm8qHvpHOWbs3PA4mhZ0gnX7tnDSRMFqS0=;
	b=DCS3aj0hrwBDIgMgq0uPKVNVBz/syI84Tk+W7GxUQFyeVRwWqBu7eLelp0E+N8ZuMP9T
	 6/gkkU2MbywNY76KuEG1m3xNW28rFe5oNi2GYRG2xDZyDlzkxGBT88re9Eqgp7RaGbty6
	 chsPwUHEbZduhmVy3hifJuR89brMdAdSn3/mdlmzfP7bb/WHSmTWrt20tXXXjS4mhUmyC
	 b/cqQWO/PJYurDEcnIhB2sQ8O8PRc3ZnLrNv5dy+0lrx1xQ9RxCDDANUyaeeivs+fkrsA
	 wQDy3CYcy71G5NhW1161XZtBhuEUvqx4xhqF7smdCuVCXG/U3bnXPXeKQAG1DBx14OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B5jMLift;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA1F606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA1F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B5jMLift
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso18709085ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517227; x=1793122027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHAmGjcfTdm8qHvpHOWbs3PA4mhZ0gnX7tnDSRMFqS0=;
        b=B5jMLiftl50uzfRJ9Ytx4MTHqxHFkHmokX994LfPaRx9pIkV0QcoUI3rFafUxnK4X+
         M87zfm0eROxTPvS81l1ICDsYOf4Vv3A+0Zw77IA5JJpo+65bD3NX6qNycChMVAWTx3XQ
         51nipwU79FTekphCszbzGqXBiiyvPYxL0uQc+050JnTm8IG1rG+WuYinzPC4h/Cx4sou
         Bt5FZueogVkYnYZI+Mp7VpTbJF5CsM9FxBGWveNigmO0+bI9DNEzSqlc88Z8bmhdEgzh
         nGAgSRxx/qQ1mNv9kWOtMqaDFXE05LWnj9jLASIF2YMK44NVfhOD4U4AzpOOaQHyEkpi
         43ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517227; x=1793122027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHAmGjcfTdm8qHvpHOWbs3PA4mhZ0gnX7tnDSRMFqS0=;
        b=khlBUWv4D6LASUaP+D0HfC4E4p+xhpDWxE18Cj0KcL+vB+HoN+HZ0sN1VY9DrInrNr
         tqt6LfJHaFs6TzsbI+Ihoy7awVssh4NKwMyaPFLW8cgU23TPb1+eJIgXr3PPIJuL8/wH
         XKUTRn3UB78rssPTmKkSWy5V9XrYUl88nSUnETgG27qWOdyNI4jkbtNkLMEHZsqz2T4B
         8n4lwdgIHrR4z/UKBUt5aM/iBeIDxov7uArm9tv0aKLSSCrLg2L80g0loUbUgZEtR1v4
         EWT8gv29R2ssNlnUeM+6ZDLLBPNGSQpvMDJMo88Hy20vygPOjXMou+paVDiKFkuFBHhP
         ZYhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw29GVpD/PZ/hwGrkrBq8tAnfMsmzJrE/S94ybA3Zr1lQYV2+Mqbev5NVf5ERFQiqasUwd9uieR5hoZDTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMolCpZhdl3mvqRrpepfPFOB6zVniF2G6svEoYNAGRk4ZNAi+X
	QOaU1RSO/m/CzYzpG16z8zhzxKeofIQ2FRCSPsDVa52Y+jeNF+Qg7tqQ+C3kKA==
X-Gm-Gg: AYBFou1XZid6PVzZWLpizFs0VKuxb82ud2qA+2CxkGjL6oUz7LFFTwf3cEiqQPcyvno
	89gY3NKnr8ajcySHYq6/8fDuHNzQvdpZcHy5OcWOlI8iCsvClBsMNkoNmIUvV1T7yTWgxq63bof
	ACC6DWbdzwWXUWpyLvGVUxYZZBXU/6mTLgzGPz1hV79C8BiMg7vOPrpIqR/RLrw6UuyiwinPWD7
	uc6Hv9CfG2ghBJgqhlimPjOVZUVQVidMNABzy6dFg8PMaapHrZkL7KXb2GH7ZmrbOMBr9cDXQxu
	jSsHd07B+FIEHpWW6tpeable+84fsdv+9fXiohjL2VGpAuNdR3rNZGrpPnAmBetB0KOdW5GEkGT
	paJ3KUBObK6HTBz2rbss2ijFNCccKHTPLUiuzv3nKZrbBWs6xuO8Z5+FZMdHViD8odgZw5BUn5p
	QzfxX1wED13eyrqq16C1XfTVWSiiF3rk8M+8vlB72Pjd8fP6f5FAxyFfpBF7RwOFglyhzIKteZg
	H2iJwl+YL9GAI8PxTyk8EJqD9B8QP6BcJSbHl4XNWVzZuVwPJmwbcHzjVJK
X-Received: by 2002:a17:90b:28c8:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3acef5f1ccdmr10361895a91.56.1792517227458;
        Tue, 20 Oct 2026 10:27:07 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:4::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802917c3sm487593a91.7.2026.10.20.10.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:27:07 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Dimitri Daskalakis <daskald@meta.com>
Subject: [PATCH net] eth: fbnic: Correct packet header prefetch
Date: Tue, 20 Oct 2026 10:27:06 -0700
Message-ID: <20261020172706.1090951-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
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

From: Dimitri Daskalakis <daskald@meta.com>

The existing call to net_prefetch() fetched a stale address. The data
pointer is not initialized until after the call to xdp_prepare_buff().
Thus, making the prefetch ineffective.

Open code the address calcuation to give the prefetch as much time
as possible.

This was found by manual code inspection. No issues have been observed
from this.

Fixes: 9064ab485f04 ("eth: fbnic: Prefetch packet headers on Rx")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 10caacffee0f..69cd96a4508f 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -1011,7 +1011,7 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
 
 	/* Build frame around buffer */
 	hdr_start = page_address(page) + hdr_pg_start;
-	net_prefetch(pkt->buff.data);
+	net_prefetch(hdr_start + headroom);
 	xdp_prepare_buff(&pkt->buff, hdr_start, headroom,
 			 len - FBNIC_RX_PAD, true);
 
-- 
2.52.0

