Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632594;
	b=SBYwW9T1/lQ64SkoRj40rqocpu+9Uw+SF5Hxo/RdtwT3/wnV0qgFkqk+CijHkr7EtkO+
	 wRJtUDJN0/LWR2qKwK7DFUE3aJTr+DycFVE4sBOUTH2oE7yFTnge5unJh20/aBEe7lG2R
	 wtHYZGkrsPljUabX+FzC3hG2WnOyeS9lMRyyPhr7aUzM0y9G2kPpggeBM3PcMj/nR+tv0
	 L7xtWYiDbPnanz1QeLCjSF9+X+hYowiQoSsyqa2SLvLLa/fX4gRr7rG2fRk3pJ0TxZh5g
	 39JpsivkpAzQPv+zsVyzTbG2zmpw7NsQQsYeNhh5yX3VEKeWnfGLfZWEqqD3MO8MCww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
	b=maLaRQx+7XPBee/wNWlmWqfiViGJVsV4HksVUwmThtUvmSVJH98hxDQBDw2GUvokgYY3
	 iguXHbO5MtCbKejabXNlcgqySLrfR3SE/4x61K7PdTMD5Hqii35N4iPgnW0TU+ABoHRat
	 C/0a8+uunNtU9WCYbPMj71z1ksMMczDslethdQMzZewRSiA8nSUt4sN9PvKdbukY2ByFC
	 0ZCrbQE4pQWD/GfHY/hYwSkcKbw+u6wPNUq5GnQlBzL4nhHKN0Urhz2NF2CUvgKhmF7tw
	 pc6u3L5gbqAjgT1d5NQM25kLLs13XmGhyFv+D9CWUnjqErs9kSKHEyJ8wqq0gc49Jdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=meVKerlp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C91A60B9977
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C91A60B9977
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=meVKerlp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so23669695e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632592; x=1794237392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
        b=meVKerlpBR06p2xu78USFrY7qxx4y+v8+7552sDFZMA8i0KEUjtCFSxu+ZVvp+aLvC
         vAlICTSZMRXqjlEP6G/V6FV66qZGolxBie7o0HDWkfWOm5q2Ka1TTfMzHs4mcM1nmJNL
         ddCHMKDctIdSLEbRsHakjmCMFY4rp+KlnFKkte63FzJ0oWzu0+6mW3JhVaZNVVAQIKVA
         DttyTw+OfR+XSC9Lgi4hXW/qkzCIYDraC8PHOBlEdWmVAByC20/gX2FpAmrUo0G9as9S
         w5Z9RHlwJM2Whj1VS7mX3pQToSlsKXI/zx/l7wMhRZN4/GJ+LkRDbwwtr0YoM8wibyF2
         e5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632592; x=1794237392;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
        b=JdpOlFiwPsQZQPn0rP8iSO49YPzS5ImE2dFxZc2tpYZa3FyGLBg28rjEVRO7EAFAWY
         6FO1DDu9BUi8toSYB8by36pfl0ORURw94w3JqhLwnmtX8vybRlM9WrIKVUtuuQtYlhnc
         CbUV8bl5uYS8G0JaSvd+cg1e2Jqe6gIFfajGqwGyJ3cxq97STdlvFulHXxa6VruKWnRY
         +NLI7PEc6H29s68Bla/Oh+l2gMLQFbAO4vaJaekfzpHl0IqL1BB/zG8jaE5ntFTTBHwS
         xeMzShtN8Pq6C68fc6sVaMACHNFBOq1iq0AXU5BPyCLiRlEFawiPoM2VhRIfcwLJCXRF
         7zSA==
X-Forwarded-Encrypted: i=1; AKwUvBy3GsWRAwi8MptJGXMgJPXBdSs+UopLOCoSpDJyUO3NZ/gc5Sqb+2XWRcgc5y63oHUrTEZFK7VN9RHtpnk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8Z4RR7IN2xiBYwSk+Adag+cRri6pQDbjwvhHL4sjoFrlYB3Wb
	PqHvnkmlvCQMA11ZuInU5ehfo+MRskRnjlPU2sp56qhqIprzETPWeJyg4OwOXkfeVjg=
X-Gm-Gg: AYBFou08CBN2v5ZMFoAQO+0H+Co7ulG96mBH+XJQlHrL3b3UiJSUO0LRY6+o5m+/6TR
	0xYur5Ahj/5Zj47rTztVx3IwchG1tSE3GfozK9eA/IjMldLuyxcWnuATlbHFFRq4csMMOmN8ZvJ
	Wz0uhumEB3381TKHCpV28jXtTUC4UnDcG6riFqsNNYXj7eXGgGCOqPD9OaUqqG4b8YnYhm1c9ia
	e42M8HGh9ZWl+xR+h8FUVVMN/RgnRwB3w46LnhvzQyv0m5s8Hl/wSsPJ68QfUlFIt0fPSmrTV4U
	cCJVWWIhJl1cFu6A654gNewSfDnM+ggc2sF7B8Pw+XGbpGW9IVTU0JG0EZvr4SWHkpLc806ea3C
	GFsNNDMenQmvQNwzMin7L7JxOPKmcQVt6W8aItfcZaYu61vuu9dCH9DOI33qllL2qfC54VuiNm1
	SkLzMPYsJdDYybV1U9/oLtomZ/KSBYANPSjAN8x1cyuMi48WGVmWEhl1GoGmPXJsMB4TySze27H
	O8cFytJVG0wltawWVhp7W9jjZceb00x183+TrQVqBPTUuv6WNrmm3e9vSASAT1Qr7E4btl9HDFG
	CaWAxRR7d6Zc1Decf1z13UGdjW1eT1hBY5W72dES96NcWMjZQRBrZNihKpWkJJWcDlAx1Q==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr78414005e9.29.1793632591746;
        Mon, 02 Nov 2026 07:16:31 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm523955975e9.15.2026.11.02.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:16:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
Subject: Re: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A
 and S4
Message-Id: <179363258546.2870673.13247205665671196595.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:16:25 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=393; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QkKO+7KRF9p6IxoBwO0rqMIDnmIJ+8dF2oqr4paee6Y=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVvptqUrhvGV14pzz059soU2xjl9zPhutmLT11fbZy
 Rdu3fvJ2lHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJBKQw/JXjWX1Y2/5yktTy
 RsZfjaFa/tMeetoHxe05W5qwJelVlyXDP6VY+cVbpzBzXLlkmeSpanBhNmtS3yrpktO/+A6Vftf
 /ygkA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

[1/3] clk: meson: gxbb: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/17b53ee5a743
[2/3] clk: meson: g12a: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/8fb4c1084cb9
[3/3] clk: meson: s4: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/7c328cc402a8

Best regards,
--
Jerome

