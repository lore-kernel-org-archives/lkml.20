Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699970;
	b=0attCLlnl5P8Q3SCQgJFzD0e6+X977tPVzOMDicHMuRmp01hFqGWpOYF/bVUjFSRlox1
	 HeM+h9Y61V1q1M3hOJQZiYuBkH5nUbYCX5fQBGSeySFZVT0DCzhjOikSl9hIuQYMgY2dp
	 VoEZWweD4Ah/NS6H1gpkbjzr3sxHY5hAs64dBr/k0Rr1JsdCYuWOb3VGdRA4h/ldq23Jj
	 rqMuSmGui+AKRK7ivTs8o+E1liI/uoO9AmwBzyB9fquaNE4lSqcV1Ghv2jOHZYrjbwfqb
	 iN9EX4tThhWYrQrCUS8k9/s60C1jx/XiMT4IOJddW2BGIJn59ILIeQHBHYIGUzIkJJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
	b=dcpRNMYm8AJLLW4307ler5GF247SF2DsR97R2t9kUuB9CImKcoxtorlXWtpw6GYFNhqB
	 Bbg9ua1SrwPA9LdRTuPxTnONK5LcxndiYmLE38d9DhAwE3UXnWGx+44QTU39KjF1806bd
	 hJmtKaMgN5ckzgI0ZUFoCjAEtUKeor0ilc2QVuf4skJMgtLUuG/55QkJL0O/Q4iKSyfBp
	 KLRooqcLdoL8BcYcf3wpVF/mp54LZ2lo5hrEAsfLO/cKgmzRbb90U6wKfwiD5Iot1Ncnn
	 FBl91BA7dXuNEkM5P/xTUEeThjVD9vXK661ki0ao9EOB6Ht6VTWpbS+19mBvbeHpSmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GuIr7Nrt;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7CA606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD7CA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GuIr7Nrt
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so84044f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699968; x=1793304768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=GuIr7Nrtmb4TQhSPs8Y79c3A7KbhRmGf5+yBH1zb47lNhphBtwoo+1L3B70dYmpJcE
         GWA5BSfCRJaGQN+lvKVhiNkOvqHesw7/HX2KjBdJokoe11qD5E/ggr+Yo5BvyEnxQryy
         +XuOnbuBilqPIMT4hdJvimPGRoH8JYqv3S4UZAvMNOu+LIeWeA/MCvi9leyQ7aH1u6vs
         MFtF5gZGeKdoahIlqKX0IUJDiv4jaUq935JvzNGsAXgSJAq0bnriXznjAUkfPGLDNBBe
         UDtDrXMvU1wUS5PPN9XIa5+e36jHyhZu7Avu63gQtCy8R6plKPbK2oRY7u85ueHOKvn7
         cgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699968; x=1793304768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=apuS6MRFNFoeaVhWa1+D5ajcoJijUN9T8A7CF+xo1UG3yoUuYs9m8hZXZREzu+fhv0
         8D6pnky85JDgmG1FOqzrVfi9k+1JK1QSzBkOUsxpBjezc31b3WZQ1Dj5FhXmA2zXeleJ
         BOeiCXUSQnuKlp4EOREuACZ+qcuAuzLunQ7vAfSUFLmOtpwwbpLMHHY4JaKjU84a2P5c
         NRcQ3pq6DikbLCDG/0wIt4THUuICtTfzf/dgr/fnhr/25lIxSw0E1s5Yew9fyxPPfZEp
         hi2dYBWFM+WcwGoQ8TjGbHx+GbU1GPVLkYq6FRfTQr1ZdlKIYJF06DlnRb0+rBCgHEzg
         ECpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjIQ33Q/MTtD9a8gMbvupZkWBiHpYp7VeYFWYVorm/hnAPWQqGU1xJLV9ciDXyWpVOXBmYnxgd7+6TSXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxrt9F3+rRWMI3MG1puBrTSrpshLyeZlBGg416oxgcVEnS5W5I
	YlaRYjSmMXscPJgzLVPZQfYy89rfQp/MXOBRguvfBJBv/9F+GuSjs8fKXDR8laJIrOY=
X-Gm-Gg: AYBFou0e5LPEG24SttfatOKoGjbKbJxSOKrn2VG06zT6JkfyYIGLquALTWfOAaT2JJk
	WpXm27FRMyEqyn7XfDEF4va/Vpt8qxJjEr5aw8I063oqAS3a4sHaJ+LlygU9j1qbwXrkwRB//Pa
	7hqMaHImqaW1TJl/xA1ZErjq7ztN+xqS2IB+xtv+wOiOCTBAVeFpZncYa2qyuzOi8KytSVwn9Ez
	+knDWkWMTCtXZ5SFh3nOLeKT8XwXmcoHjOd49nAI6gH/6zVfysqTrBpajJhX2dyRWdvVdsWam7t
	HEu5ZB6MDgeUvhyB7oifHN+Sj3DVTEmZUcRr8XWoGsHw6oy3cS6gCXQUGTA0P+CtVhyl8QrJXxF
	qbN2hXMDP4YH1BFazeOZwUeQVjxo4vo1vsglaG2J83/uWeBbishdXF8gw7m9G7uYwCDudaD0cIe
	AqisEdeykF8VeVSJC111LxQxdTl+x47hEWfXzwidElVzgJe4MuwS9STEGXcy+h8z70ZHAYgmW6p
	VcZdOQ32bJ4diR8hcWCBhmnMYyd6PkrkrET24HAIsl7uMSn54tZ0bqwicDHKZ4jnJo53fU7OEuc
	TTjZburzIDD86Gz39M3ns6QazgmPe8bN+kUioc9NBw==
X-Received: by 2002:a05:6000:4206:b0:48d:faa4:af9a with SMTP id ffacd0b85a97d-48e2d102ea3mr7429893f8f.9.1792699968427;
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:33 +0200
Subject: [PATCH 2/3] clk: meson: g12a: fix ENCP clock selection
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
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-2-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905D3 datasheet 0.2, Table 6-109.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..fdf41572be84 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3666,7 +3666,7 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

