Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112013;
	b=NhPynNyxTnH1mlMOm7bttv/iNoAySMuvfnZqA+a08We+EkMD7njRyLYQn0nfbXc2CLVF
	 CIMa+7vM+/OAQBcnRbGmZQM85t2xE8D/ZUrAoU6iTzseEOBOCNNQCprO257vXs/8hpZp/
	 SBUBxGeTHCKw8lq26TsE0KP+MoD1ch9nT+mrp8SsZgkfM4aIXVGoMQdlK5+FxDID7I6Xl
	 ucoVmbJEPK1aJb+x2QFU+O3RsIRRIpOIf7ONCrLUzb1x9u7rPny4fpSVGSg++YnVC/rgp
	 URXMMYx3EvuC83PgVJx5adhLDwPDeQoDhEHfQgtvg9EEokmYaLEYbxTQWEjugyC95UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
	b=GYP0IH6Avmjz0D/mPODb1UP69ZOZSqppnsiQ93JWfq67XG2ck9BgG2QKNLVATR9dOPCB
	 d2vgAk8TrbIIXbx/nzYJ6tIfzrwSTd27io7YigURf4ojSPJgLV6WKONnzKOJVnY6BcCAu
	 t75Ubil1sGyqgKy2dxbiYi7OTc2NgB23KzvqY283e/LYvASy+JL1WbvcYE5o2brduWonx
	 nHkU4l8/RyhTLo74HUh6mGCXo8Y/xBhPVV+wLaIcfFxrLw0UQ0cm53E7FEt0xfT51hXS3
	 1EfFZvpVPJX3H18QpDuZTgFroKkV0M7h3HCP+fO0pSMIdslbEZN0MShVdg8DShuqz6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2VJm2rP;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D9D606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D9D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2VJm2rP
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2762445f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112011; x=1793716811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=j2VJm2rPL8dKoGJ5IAD837xozfaN1bHUYYeUTo5hq2LnuJZrIJg+KJfxbTv/5cC0hT
         QXcGC/xhuLi33OWTMbx1SrHFI69l2+Oypn8lTDoXNPcn3uzdDkcNDNbpZWA7SckTH98l
         kxKwbPVOtsrU9Whq67KApMl5KY/aJiHpnL0XUY55LyPFxQBVzRMNNg7tQ7tUpeDqnh7q
         9tzcEZ20wdy7TBHddU1djSbtqFou0GVBzzMBitqcWAjWcnx3FImJJs95qAXFO7l6eJvJ
         9sgB1IWutAaejD9a9uLnhotVH3rU6RQJZTwg8pY5Ef3oWQCwCunmqjaM1sBEF6YO5ugv
         shqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112011; x=1793716811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=V3iIYwzbNx+sQs7v0UYEU3M0Td8Sf6HYlvWZirBczDREwypodbSzyrUsnhkD2RlK67
         BgxzVNjjHpRPL0jDuxCrc+I3XbZMzv+viw89G5phlCbS5SXbPPLZ0KIp63IdqEhbQyS1
         gzWV7agUwD/nfXtECgyFjCzINFCGG8qEDu4NzVz55eQ6PppXpISTcu0Z75FspjFu15D+
         ysLF9g0fxwiKlRuGk92ITdwN0fvfUWcRfQZYR2WZINAhSjzeTvGVbmtYfCuAkstedmzd
         GErnMi5RG3j8iUe7r6CS5/AekAYA7eY2v8M6PECfqriB3wUwEB190zrYm39bceYgvfnx
         IDrA==
X-Forwarded-Encrypted: i=1; AKwUvBwewQMzXf7lp8MR303+VCpCMNIMFaaPUrCfWYJWqyGCL656TPuyDQLBXnahUHDJIztB2n/Bqznlz+ZWI0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7kACX3L9SwSNPMJ+1RqYhiIdeOCCstBY6Nky1MkL9UQ90zGOM
	4rhObacS3tqDoRc4c5k3mineyUc7mjd4LRL6Qm6JOKaIiWdU5SAc+5YL
X-Gm-Gg: AYBFou3g9nFX9o+rdPVPCtOGXO1YofUAh63ZlOLoe4RqOv/hIO4MJNlzsoXRj/N+QlC
	XiHYy3RuokkZBoSzwGYi+0TL/7Y84XeXfSanPlCHFynaqvoxTbX1vt/3jCm1D8bAfve9Q0Eh6Pn
	FQCXv1XCoZXGoFu+QY9IJdLL4NIGHZkYN4+SQbVlKDPirHr4HMdo6r+7DG8igM7NTEAgy0sobju
	G9kbmD91DkUl+yYXwUI4N1k2kpKAm/YiuBQbd/+dahY7mUrLCoDmDUB+Fj55K4tXkfUHgU7/C7s
	DAI+Rh7k+DvvdjJ1uD+6VBeIKJdUHMAR7kV91zIUJXFmTdVJSgHqAO40vnFjsDm/7c9ES4dyV54
	kXHKigPnLVXNQLrcQsaQVmKSLSxi8UoMCN/7rDQwKl5a0n98PinFYTxiYGV6yNPFcYXfSze+3Ps
	BKq/msznGo43rEVXWs4QfF2T49qVEzdMbZ/18oOXIuary7jRMqtppwxIlM4DC9nVCXXZZNjXKxT
	kr7tVg1ELfWFyNFcRef/JqYAj3qDIQ5ffu0y8qdq+Tq/kgPe+1oEPY2SziVpFTlTthP4zi2OUGx
	NOIc2MqBB1Y6TXO8SkUJv46avPXYBK7aFrwgpHCoUYKi2AABjTYg5P1ZZRBZ
X-Received: by 2002:a05:6000:26d0:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48e3eb2ceedmr18881590f8f.2.1793112011312;
        Tue, 27 Oct 2026 07:40:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23354151f8f.25.2026.10.27.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
Date: Tue, 27 Oct 2026 15:40:01 +0100
Message-ID: <20261027144002.10606-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
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

Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
MMC controller based on MT7988 with the difference of having a single clock
controlling it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 5b160fdad3f0..736cff2783e2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 };
 
 static const struct of_device_id msdc_of_ids[] = {
+	{ .compatible = "airoha,an7581-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
-- 
2.55.0

