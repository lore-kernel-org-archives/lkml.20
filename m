Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603504;
	b=uxVZF9XdKcIzj6HGs3IbqGE9NTfVUsMKX8yRRIzsOLq70SjBsbIegPgCnLCb0vHeFw/D
	 yuIBWt/Bn+A/noqtXWeIx7T0ZaTHvl2ZjGP58GTJOr1UZkzdAVvRfmPRX/OKs44Ar9kUg
	 G5CECdUw2ZmwdHvSmjOzq9T/sQqk/F8710owBG+9vXbSLahNaUUx1tvr2PCLzIwoR8hQq
	 jcSXA2YAusCxivSAYwrXNMw2k5mMBnaQ4oWgn+isW55/cxcyD/Ti0BUR0oj3zh/lUIGRw
	 9rwNJIlp8dZDCByCubybh2MFPKcGSMaX6FyqVMMSW7xa40YmcPIKqAJTvxtrvQBhWCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mb/1g8nYCeIwcAw01UT60I+xXfiBOSX5Y/kTWaVFrFY=;
	b=LUdC5ezyJ29LBjGZZ2GJefaypUYfIdKI+HW/tyeopv3gWoa1kcp8uH9QpHgqbdp+fTqr
	 RfHk7FwugR6qhI57jluhKJti4LeJAa7fGYv9WBKMC6kCauQCASYIA46KthpW29v7Y58E7
	 7OIaZ5VEKrxqz3FDUp815DokIMnVbYOuh2Retw1iyqGfteOyISW7CmIQQDwhqJMADtCtU
	 tlgkfKoqHaEx2DqJ+X5Mo25fmZ3iFITV1tSi3R0jOz0UXHtDvVJ53fn0CN9XSU6yYQdCA
	 7n8EFubM8VYx3ahWLOBBOux/k+tFgTyKH3byqxNKxomWdY6qzCYAsTdq+2+CJi1CBaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eT3wYLlN;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B85B606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B85B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eT3wYLlN
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06210b29fso984089b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793603503; x=1794208303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb/1g8nYCeIwcAw01UT60I+xXfiBOSX5Y/kTWaVFrFY=;
        b=eT3wYLlNjgKoDJgrmPLVf+z53ie/PBrzWlNf3RchnvysF5anw64TyRRgmRH18FfzOV
         7jivWYbcp0PkW1F6FaEIJPI7U0r4renRH8Nxala5yjWMlzsCJ/beUiSQ4QXzcxewJMyR
         krwWkhhNWxZeS1AOqf5A/4miQ+h5iAQf+SG85kk9+rBSzFjPlscdJcTOiq70rFpA05oM
         qn9NXnsQjtS0g1WwJ4AN/4qTj/Uc+fLzGNGvb7TuJuhOCBkCxWyq8JKVugi+4O36rQ09
         LRax8nRmHSrQgM0RoWu6HSAPUsKFRxEpqCjmyOUmrnukOD9+3RGzyowIZqopDlMr3pWF
         erew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603503; x=1794208303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mb/1g8nYCeIwcAw01UT60I+xXfiBOSX5Y/kTWaVFrFY=;
        b=IObsqg1Wsf5YpVXZ7KH4ZLRPsx89NWBeRG41o2Y8NJIjZNHN+dX7bkZvS73buXDxno
         7Bjcrle8Bte2xWklRdGgIA2k8I/uXx99aSQ/mR+AuwoCsGU7d7p0p8Kvh7c6W9RlhgSy
         YRurjgUJefHqDdfhv5iBtJ9GkQzhwKjpzuuq8YuDRjyZWXo8rbStakmQ1VrqB3lhG+iq
         z/DccEzpk6YDf9QUkuUR0kKysAHzqb5EoRuiCEB769nmTbXlzt6NIzoBKYozbOQs5xaN
         89TTNfTITpECsmBUF3VEUlTYVtInlKkE1Ilb+YMsSGQIrqC/+m9YGuRHKKTBr3EXyu6Y
         9e/Q==
X-Forwarded-Encrypted: i=1; AKwUvByQdKB3zNMbWvbA/9mcmlqWlBxCYl5YfRNMcuWT0F6WVYfdYrUKUa6ja0dDPQLTaOt1h7u3wJl4dEq26ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mMngpJtqZ+BEtiGPVytliT9XTBMeHLqSPA+kx6au9EX9qkHOt
	RD4DtQ3LnYKrgEPFcWmOZV8ivtN5WJ3vFLf6LhLPZwC4REKso3u1tPH6
X-Gm-Gg: AYBFou1dyhYb6dSr0ZIqhKhcfX0HkpBtYFwW6aEkpc3BkpGdj2sMinzuEssgRzyh3cY
	OyEHk2KCuCMw/AWr5oaNCKxTb9WwgVCDCyKkJsdZOzTNo4c3SmeoyqzgEMpBP/fN6YmKRlomGX4
	+dATWPPzUy89NhzjW/XruoAaqgVO1A7gOLCXXcZ4/6VptTk9hv5qLXuICfbOumum/ERJJybfVKJ
	t7CZt9Qx0x1lZatf+3jiaxtHn1Rf3W7xVJ5VpQgSxb0sWRA5C9hoHPxxsZDF0WxowsaXKzG3sKk
	JncpK+2hz6fXSRgpVgBrzf49xGK12y1HGcoSeh1z9nvKm6u7hkFiLq7k+pjI7LzY5YrLUznW04G
	Kh8leSqS24La75rKaaO5CeFdSbx8i9hMBly3NIOUP9t6D9hOLEhbiBJ8JRodHyxU8M5lbx1+TwB
	k+1pwWWA4XSNDhBrALzn8jFUMl3pxg63oNtlaEafDC9uFcpAJBnI3sCI2y4lpyfrnm3Fnt78Rth
	VqUtgQIRa1ig30sdhJjBmtARF868K0q4FcjP0uKhd3BDcqmyDbJ3wfYfc4kJxBEOTWXwZw4dcnU
	GnFu0wtO+3NDhNm55/INJh+StYWPQKPZSxIgVYuyYNMEf4m2KfREZA==
X-Received: by 2002:a05:6a00:4f94:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-8a9c05ab245mr7894823b3a.55.1793603503283;
        Sun, 01 Nov 2026 23:11:43 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8abab0c6c6esm1140566b3a.48.2026.11.01.23.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:11:42 -0800 (PST)
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
Subject: [PATCH net 1/4] net: dsa: motorcomm: Fix extack message on unsupported TC actions
Date: Mon,  2 Nov 2026 15:11:13 +0800
Message-ID: <20261102071119.3435180-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102071119.3435180-1-mmyangfl@gmail.com>
References: <20261102071119.3435180-1-mmyangfl@gmail.com>
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

No extack reasons were given to unsupported TC actions. Fix it.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 9dbd61e48fee..8835907366bf 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1122,6 +1122,7 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			break;
 		}
 		default:
+			reason = "Unsupported by HW";
 fallback:
 			if (cls->common.skip_sw) {
 				NL_SET_ERR_MSG_FMT_MOD(extack,
-- 
2.53.0

