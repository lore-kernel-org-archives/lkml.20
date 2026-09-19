Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF47137C911
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850121; cv=none; b=sQaoAoNW+EDeL+O7bqke/wh8VJzVLt5KzX2tCOZQ2oO4cZO5K4sAti2vLuNp6YaXeSLUoE3QGkjSKaQTP2W5bsqklrGtlSiJAbSSjY0fp84MSY3F5n3Kj5lWQnbsx09ZqcIN2QPuQI7oQwSNgCq+hTlJWlVzdHPLxtmdMahDwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850121; c=relaxed/simple;
	bh=OfksTvPub9kNIDxmVS42dElSISmp30hXX4Hjtet0m/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjM6GONlLlI+iJ4HKlsJavvjjQTd+bzIlO++/2ww+r35Dz6EiHP0Z4RCYYsvp+Ukh9AlTYXkV1mGjWY17Zf7m89Ssa4D/UFqRwxSUH6oWbTuXGKHzYmGeltoshs5U5xodamnAgs8/fYOKKB9qb0TFI9lz2Hs+FQZ2rpgY1dZ5JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXMmC6MO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXMmC6MO"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so18684775ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850119; x=1790454919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/G/e4ACavZZMwX4fe/povvUI6kdfCcPdqxB1SDfaHUI=;
        b=kXMmC6MOyRJtiKT0vyaCkxzHDJ30Vr5OirCzlXLueoC1bsznt+qSCq3RJ4DvN1rftj
         SBoozeiQJaYn2HikXQVTmj5ZwpBWfRBmaW9jNE4V7NOArNwxvtAf7KG9TXOso62FXIZo
         5s89jfoWM72wZI37gVK3sZ7cGuDUmvQGfnC9fZSWFpGUraFTcCiviQcasPZyZFWKuMLf
         it3jM1sdrTp83SG1hw4+IXjZc87QKeyx+jjkgAjMrh7fgYIQ5b/QhheMzogfOUH/rDn8
         F2IowNZ5DeAp1FLnU1WPpu/E70mGSnEUWToMbtBdMR/cXSotsPs4xuTch26o0w6jwBVV
         Kw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850119; x=1790454919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/G/e4ACavZZMwX4fe/povvUI6kdfCcPdqxB1SDfaHUI=;
        b=aZ0bewKDWJy3ypJVxMPumHgYxofUO3x/LCQOvbDg0QWWACA1U9nJCu7j9tnywqrEgr
         qaXfLBvu52wJZ/s+dFYtK0A8MC6yOHFkn13VQAHasPmmKz4kJMXqkjFBVxzl/kjGadg+
         bi8GhdqKpDJCeVqKN6XkdsrQ0klQSSgrK2YquVCIlh0dVQqWe0p8L35ErlTktPLR9wUy
         4gZJIlm0qLlb+IYwOO0hFBitf91UIPy2wdsIzsVu+aWT+oC+a+pXS7cNq1V82kxg2eOX
         JOFb1yT/Wse9LU6pZBZIKrjlGBMhnhikuPH1/XZ2YwAf716PwpRGzlFUj6LZ0kyIHD5B
         vOUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbYtZCZAlcsnz3Bj2zF4f8O+rjjY18ZSaWoLS655EYHK2tD+CUKiFZV+WVO64ZuCCRZnMrJokk7gpS5D8=@vger.kernel.org
X-Gm-Message-State: AFuF++lkPpUI07SzWjIAQFlaqGFT0cL/q1Gx20pNbcFLfHnVOwz/SreQ
	03w8vGs6zXU3MgNZyirgsxT7YdaAbWkMOBInLLiOWHJC8LCWx+MKYMWY
X-Gm-Gg: AYBFou1WEgyJj9GLDV5ojBPDUdsf7rXYPuaZ7M6yotiRI5GxoukN+JVZG4OtUZ18KLF
	AAp+NNzB6hD6/vQwneXJM4P0Pwz/n1vKY17OfU2Xo9zQrkN04+vkns5YGFhfREA6rX2wvHIe22q
	DfiFdp7tahTwOymR1Yi/nsM/DQ+J3MjOiXChPCtgtGP6fTaGljl2pgR8n7D5QYoa/S0KExxvpTG
	1UTMUaByvkglSmp/3HBfVUFMM2X5fmcqE6tMXETsxfMxQWDAzS8E1HgxXgcPAUEQ76taFHhdePR
	A48MVLkQ3bTWiXKCdCEFMeIe3/BK2BgcWDtB5/KPVeQzOdK/jNwhMsttxE0CR2wWRH+FpVb+SCK
	55ZD+Ys8nhQjHv5hYsiLllMmgUcg6OnV/kyASTcn+yEplS9cAe8EZM7w+w/LM30gJIHogqn6ZZW
	rgsdw6OTrJFMn9X+0azybm53GgHPbrX5OM5ALe7qaz02GsWC1mHmmlLoJ9Babo7Tz2/GNSHAspw
	j9NnyuDyTBA0PSpOcAu5UA7IHtUe5S5PNZhf9N5eRdERW8NM7EF5bC5IRmx3EpczlWXBsNj2Pk8
	lsCM/0lM9w==
X-Received: by 2002:a17:903:19ed:b0:2db:3d84:effc with SMTP id d9443c01a7336-2ddb1ab3ccamr105266095ad.6.1789850118925;
        Sat, 19 Sep 2026 13:35:18 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba54dsm12550755ad.54.2026.09.19.13.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:35:18 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bpf: reject unset network_header for SKF_NET_OFF in cBPF load helper
Date: Sat, 19 Sep 2026 20:35:17 +0000
Message-ID: <20260919203517.2581484-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In bpf_skb_load_helper_convert_offset(), SKF_LL_OFF checks
skb_mac_header_was_set(skb), whereas SKF_NET_OFF unconditionally returns:

        offset - SKF_NET_OFF + skb_network_offset(skb);

Unlike skb->mac_header (which __alloc_skb() initializes to ~0U),
skb->network_header is zero-initialized to 0. On sockets that reserve
headroom via skb_reserve() without setting a network header (such as
AF_UNIX sockets), skb->network_header remains 0, so
skb_network_offset(skb) evaluates to (skb->head - skb->data) = -headroom.

When bpf_skb_load_helper_(8, 16, 32)() then checks:

        if (headlen - offset >= len)
                return *(u8 *)(data + offset);

a negative converted offset (-headroom) satisfies `headlen - offset >= len`
and reads uninitialized skb->head headroom before skb->data (or before
skb_mac_header(skb) if mac_header was set without setting network_header).

Validate that skb->network_header is >= skb->mac_header when the MAC
header is set, or that skb_network_offset(skb) >= 0 and a network
protocol/header is present otherwise, returning INT_MIN (-EFAULT) when
the network header is unset.

Fixes: d4bac0288a2b ("bpf: support SKF_NET_OFF and SKF_LL_OFF on skb frags")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/core/filter.c b/net/core/filter.c
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -231,8 +231,14 @@ static int bpf_skb_load_helper_convert_offset(const struct sk_buff *skb, int off
 	if (likely(offset >= 0))
 		return offset;
 
-	if (offset >= SKF_NET_OFF)
+	if (offset >= SKF_NET_OFF) {
+		if (skb_mac_header_was_set(skb) ?
+		    skb->network_header < skb->mac_header :
+		    (skb_network_offset(skb) < 0 ||
+		     (!skb->protocol && !skb->network_header)))
+			return INT_MIN;
 		return offset - SKF_NET_OFF + skb_network_offset(skb);
+	}
 
 	if (offset >= SKF_LL_OFF && skb_mac_header_was_set(skb))
 		return offset - SKF_LL_OFF + skb_mac_offset(skb);
-- 
2.43.0
