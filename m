Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602116;
	b=wxR0CXhxrCqvlEm4/aWC/6orQFKpPxfac83GSPfPtzwZ8hHR5CRujDhY5InXZJGvsSij
	 q+PFYaCZCqsuGXGxmLBo8cnc8nYI/aUFyLuwf+b/mfHfcDBp7uEvQxqbMhqz0Av8tIR87
	 AA3txBc3dvcaP5b/kgRURQX9u+hH35KpnbOy8H4v2DPeAZt6/txW4UsD1BvqmBzP+VgMo
	 AADlrkuPxc34km1Dd0HrAJiIdExHv0Vl4AlLMAeEXH/f5dCgb1OOgNgs6KAnWYGfEMUi0
	 soBR+4OyQ+9L0ybdr3G7XL/ip9X0QQR3k4Of42zz0Y+6olKkrZpayEV26X0DziySnNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
	b=agQC4JXOQ/0z9mK31yBMVMJ2tXl4JstmGVnOaYDVnIouUXx+0BKQl3qGiJG2QsFjqtTn
	 cLDRzsayNqPWJ32L3trsTLUWrnSse5jP5Iyl9JyfU29PrNKI8HnDEM41BZ1oYs0LMy/IG
	 6PRXMPlGscrJvVVfcGsDfzfuJItUencHJEX2sZ13kN2RLANA/5GE1uavE856rQYEuQqRa
	 H+Crt2m9CZoZIgHUAuk1by+P06SXJwLLp+xwGj6rcUMhJ9TilqpkPviKbnwV9oPvVg/m4
	 Kp5BiPLB0vck13F/qYz+O1f1Dcnc+iIHpZ/fIPB4v8yd1DzImFevDErn9dxMTRNGOnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyARAhSR;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB8606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75AB8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyARAhSR
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-5187c752f46so586251b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602113; x=1795206913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
        b=JyARAhSRNNQZm/PQ8PycF6gvp+ozKGUNMr+qEuggpUblBZNKsUaYmg6O62DVZ+dOwj
         PbDGEeYJCNqtwQlhhGVES9upVFcZjYtaqnUYMg/EkjMNHK58ZKgln4EKWTcndpMxeesk
         uhSs92sVD9ub5eLQiAt2XK+VXJcuxTUXdX8aPOoVq5Ob2VrQ5frB3OKL9HU/aVBrJAR+
         VAeJo3YDhGyFj+Vh8R5uYis16dJMJC9Z6HOAVBCtI/CpibWHjASiDUhmu/N50CHdp34S
         NjW9C37iCVouYwntzFqj7UHsjtJVj41dfAKoN3zuL+oPButyoLj+fUaakJF+YfKUNagB
         Zz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602113; x=1795206913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
        b=Tu8xrUXoNZayBn3VIzqsDefh8OZGb8fj46w8dSnxcqm2gShlAUTs1XmSEoCrZBsUqV
         DeY4koaQ+F4SBaTBptkT6H8TimmpMbVCYFLHzQnClHi2hyFfc0SXn5PMb7JQaoyfzRK4
         iwOCMTEFHkM+xlF9ZBTRMi43GtkXn/Jaqb0zk11BlCuMZgUN39BXHl1wvIP0Y1OTb08y
         4+H4MMfWFsy2TE3t7oP7hSeyFRGoV+VQrfZkvUfi8o9lzwlSJh0vLTO467Z0sFaMKZ5j
         bQpW9Ia3rjbV6bIKy08DT4HpLoR9eXz7BQx+MONZJYPj9PeNNyTFpe0pGYOD2Zt2oi2F
         29dg==
X-Forwarded-Encrypted: i=1; AL+hErFOrEhFeaAqGD5Fck2nUJEa3KLXfvfG156tDY1RN2RF3qmJt03UgRkSfcYFRSjAJyN563vPiX2ahvaWzNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hTfymiuCZNjUchhFDh3IsW45dpDAkPUtoKwS1teKK3KRSICkE
	aeCb/HElQ+LTgSkxRRFotazCM/XEwQWMqjv/pkq4UnpizB/v30X6Si+8
X-Gm-Gg: AYBFou1SDAv+7ot8SKsXbjQTMy4dcHIlty/1573vm0ApPStbNzYbZ0YyfwrtjhVQTDD
	AmcrWnLvmABNtkeRpLRz/3j7Azm6Ih8DS/fy3lpg9SiH/gb4GfuDDWjnSmpagMaaPx7kTBmx/nr
	XOIlmAs3EjM3Ji4qphvDKctHdSGmnHLrM92lrzRShJWIovfkBwQeXhDULbBBfE+rNO9iZ6i95ua
	NqD96f3d1ItWG67Lj36aaMdt8yWHLw8MS6OskbvL8rjhMsTC3NNhbv0mZMQJaWm4leEy5OCPjzF
	nQjW5Zg8q2rSSWivrRAibeGA/1bAOAfQU1amhFjc9H/2kzLrUKXfxbNkTnWRgC7XwgKgtyD/iP8
	mxcxQusodO9PVsjDL3yxiEQUO5hc4JhZM3GV5h30lsg7l08biQ83yIC550yN0iBv8v4l9wUuNSq
	Ipb9kAsExt0/FVMGL/GB03ztnMid6yJCP57/rcrXA1PLwWnZhFjNeuNAkutcj9vne1cmSCF1lrS
	B99nCj8lhvQlmEr5g4ZAf8TBSJkrM5ZSbTTCsoZHGksyK3poBrAyzCxz5R0uuEZ/TpD5VQAn2ql
	WmmS5RGhpu52TXWbnGGFQDvkQ4mz+fbQZQeaxZJfihzRzatTUPzQEzK6ma55fY8hiGZ5WcFn9Vi
	IhuysWzd6bseNN4X85A0=
X-Received: by 2002:a05:6808:10cd:b0:4ed:7045:d3bc with SMTP id 5614622812f47-56e641d6c13mr3204181b6e.32.1794602113421;
        Fri, 13 Nov 2026 12:35:13 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:13 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:34:55 -0600
Subject: [PATCH RESEND 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask
 width
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
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-1-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1762;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+CADWjqc22AUSeVeKeNbBWk6vnVbnoxXOpZ/q/waG+w=;
 b=iLQXE6+fT67k/1+QXFmsj0CBbRIh+BBShAboAlWwKdNv6JETp70VldtQbm1fwLYVRqDFJsRNd
 EbaohlTqIw/A4R5rO4Jb0oapwZN+1s1+IeGmBrmEnDmvq7F1aGrFtC+
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
a status bit that comes up once a hop has settled, and new_dds from
mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
never matches and every hop runs to the 1000 us timeout. The PLL does reach
the requested rate and clk_change_rate() discards the error, so the cost is
1 ms of atomic polling plus a warning and a register dump on each rate
change.

Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
with GENMASK(20, 0).

mt8186, mt8192 and mt8195 share the constant but are correct, as their
hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..327240cd34fb 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -100,7 +100,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = 0x6003c97,			\
 			.slope1_value = 0x6003c97,			\
 			.sfstrx_en = BIT(2),				\

-- 
2.56.0

