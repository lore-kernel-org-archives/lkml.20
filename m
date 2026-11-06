Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990912;
	b=im3Tqh0SoESiF4HaBSr2mvhAFaD1p0Ck2cAFDBWEyp0mQL9RU/EwXfYroinYUZx85CZw
	 C40mXp/Nn1o8jrdHc83e5Iy4uz5iO3uzcL5MfqBOc2bLE9vC3GeVTe8VHeG9JJCq7uTOc
	 67s62NymYBsqgwcK+nNlRHFYQQL/fECbuUzKNmKo5EMDWWBaa8SK4XF9FyP7lKgat0jkX
	 sNxP9zdJwW1N4xCwOZafH+sEZTeeqS/v3Aa80duLCVteuCO225cfQ3a/Q6lMxcgyt44+q
	 Lr92hjxhYQ8KCmvg0RU6tbFNFZjC8Xh2DuZbw+TAotKDbD26InQYNcl+Ln4dg7G4Siw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2HdBXlaJXaYgSMY4eXF1sMxsmXNGqblFIccArGP2O60=;
	b=dxt+0yGnSbZy5CdfJXnOFt6s9jpdZHbtbkjT60Jy0eln+3tMiEf2g51x/jxGIzx9r94/
	 MCaguYx8I4WdjfD6U2hHNiLejlXTj0rQ741/Fhd8/CihskFV72lVT0CEO9wMjQJOkbcQX
	 raFTE3SDizdPQcz7C0Max0qLtmnsVc0M8cbN32gEobGghIzJPGf1ySkVJm3Kj5so51CMs
	 JwWJZorXlyJmnAZdxE+p92Lc9pdpnbORuNeiCkbRFEm6VUHgfna8OoeZH4wmEavUPhjBM
	 SIbBYjv+V0kKND3NxW4iGXlgDQnTJgEjKfI37KsEugfvddm0pBMGzGly/X3SK8AAkRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVV9lyFc;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CD0606D811
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CD0606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVV9lyFc
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso372858a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990911; x=1794595711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HdBXlaJXaYgSMY4eXF1sMxsmXNGqblFIccArGP2O60=;
        b=IVV9lyFcxqRWIXGP5/aKRAL4R/xuzADJA6z1/gV58kmc2MSy/Auc7xNH7zVrmhVKqC
         eMVyhcti5GUxCK9fWzBE3xQ6nFWXy3OQWJCsoDWlwBbbOnsAAzjLhU573zYCq2hmHOhO
         UVfcFIQQTHiNY+9IuouTikXbesNZpJgwWrHEaWNytfoSvjczrORPSU1PLazz6xBYmPRx
         kZrud4KvAf3zH93+CCPUvJayVaxNbcVDHTYpmhsAl3MpWWC+kh1QSZDAnAUMfkrmj171
         V3ZYb2tCELXEJdsTLQtcTzdRMEZzpHNqOCC7khM3hXJQn3VClPEKP3mLikTi9Vm6kmP/
         uRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990911; x=1794595711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HdBXlaJXaYgSMY4eXF1sMxsmXNGqblFIccArGP2O60=;
        b=xlj3MLx14nkZXEvThcqddnNXkWKNr5mG4ThXnIpZrhthTm4DvQ0iQ+N5SGG5RBwqO6
         ubD6U0oswIukb570bDtk8JLEQ4TlU30y8BOnSxYYMhl3HBGIlW+WT7v2cO6OLNFQvPxb
         dhB1IRDbuUexkV5Fnjdod5elemVVpdPEXvxiz02vaicrUZqVaAkDCcm0LRAs5H94WprH
         VlPOCq4WGH1CilAhLshHgPh866urwYoG3JT9fQgBKPArTOoVRoh6EVPbMllhfUuSx5Wo
         4q8UmuaF2CW97V/Dp4u7M3mAAiuCpS9vKZ0DVwlu/OG9i/aEpV1DCBx4aT6JInpYSRTo
         pRWQ==
X-Forwarded-Encrypted: i=1; AL+hErEzw+dinhmKTRVYCzJsopYSAb/N918nszQlzdQ0jROOXCl2AMW2UE6d9f405s/l8PHSDWCix6MFjEi93Dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qa2vUZyvMCTejhAziJcdaJQg31RW7i8mzv+q6I/ucXYQb3mDN
	NuyKGrg22AOg1a9rL/TZg/UShnunyCHdCu2xSMpl6P0JAttNgb/MCaSv
X-Gm-Gg: AYBFou13s6PvXRzuDjp2Kjrq1W/PfzjmX/0Qivjmwm7ARUDo/aKEYNsed/VH8VFrkuB
	JJWLG3G3gO5DwpqBYwtTXje6UDyt373c+oMtiwzOAOWpmZGN1/QeyWVvt60LLpX8YdH3SjdVZnl
	+80jls/gqr+Cpc4twKh2Rbs+efJSzbkwzGt1+DfErTcFN2GEgeJR6h4L0zgBmCujs8YKvTJ45Rh
	2QMV/OTsyMLnrwyd8w4rAszFu1nlqnfV03bToAt7eeXBaB2BgHW5qzP0EEQWUaZOjSWZes/Yaow
	EC5YhH+wwA8eNo/N2Op37l3yMmKnIb30mwH4w4xRq41MrxdVpb9j4A3h3TM7UKX+mXkgqzxEqyc
	rL/VBpbugGSDQi2/SMp3byGeIrZJ7U2qKoXz3F+LqSL4Et6yjIpj6lYV5nP49LKrFVuXvRM4y7a
	MUeMXoaFGqm56vHIx0H9bTYAJpjQbmJDecFfOc2t6S5YVZcQCK0PBdJ+4aZ/g8ewIqe2dMGVENz
	DYDQMlh+vkjmQY9n2iEdXYyha2fDoq/ZNaWhFqWiYGYroqIuJhh5YODW1MPabDbUnctdLY3xiah
	RrMvKZE6CdqdXDKA2fE/xSEDiDrB7XnJEgKwX41uPVNg48Zfqb8j
X-Received: by 2002:a17:90b:5343:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3b0db72df1dmr3442049a91.66.1793990911494;
        Fri, 06 Nov 2026 10:48:31 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm45036a91.0.2026.11.06.10.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:48:31 -0800 (PST)
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
Subject: [PATCH net-next 1/2] net: dsa: motorcomm: Report error when FDB fails to add
Date: Sat,  7 Nov 2026 02:48:07 +0800
Message-ID: <20261106184811.350700-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106184811.350700-1-mmyangfl@gmail.com>
References: <20261106184811.350700-1-mmyangfl@gmail.com>
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

fdb_add() ignored any errors returned by the hardware (for example,
table is full). Return error for that case.

Note that this does not affect userspace tools: .port_fdb_add() is
asynchronous and DSA core always returns 0 for that.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..a7a9a7439304 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -725,7 +725,13 @@ yt921x_fdb_add(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 	if (res)
 		return res;
 
-	return yt921x_fdb_wait(priv, &val);
+	res = yt921x_fdb_wait(priv, &val);
+	if (res)
+		return res;
+	if (val & YT921X_FDB_RESULT_NOTFOUND)
+		return -ENOSPC;
+
+	return 0;
 }
 
 static int
-- 
2.53.0

