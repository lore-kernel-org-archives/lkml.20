Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602113;
	b=zz78ELpNnxK6XSf0KdUkGUbB5oSatsb3Ib/BFGiHaqeUXw/rtwievHAky6clDXft2+Eg
	 U+W0ran6y1ZdASQxs1tjEylI0qnPkiYvUSp0vIXiAZi8+BKMLJWnK1xMYlZ4AsyYclnj9
	 2oVtupD+05ie6Q+AvNOVnlXyuRbwi1LxQtCbokeB1tNSoxNWJhmcA7C0aF1CNobUCkj+n
	 Cl+thpiJECZRo2AuRdNP5o2sq9G9VgedEt0v8xF+Xny7sU3NvKr/cHYgTwoS0mixE9lv3
	 tTs1TnvdaQQ8LIUANjj6lCYoR0aEVyaHkL3R77xsSjYLmOL5UMEpr0NRv4Wz9Uyrluw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=;
	b=xYnQzSMw4l0AHS3i4/KV4pujPPo0L+ZhmNk9HScUr13WQFnxGDgbDci9irPTkEu/ljCL
	 GMY13PDgn0R3oOZ9Ca9c3bTPmtppipcxcs7tGWHdFXS3YX/wjEOVkMWP23EWbQCETZuRn
	 bL6CkCm4VC9TeeTLxDEq1YY7U5NGFlNSIZTCOz0L5rSj5F8gwb7CCL2UsJRcXdRDHYsyr
	 n/ae7G1F9XIVv+ULUVXo3VcEswIYzITqdFsOkYGfiWaAShgQKEHvBo732RVAUCabwK8Hr
	 VAx4D5dk1ZKAB3/h5okdkFiPqKWnHu3iRWVDvZuFfPiABERaaxW7uUcvIjY/zA1Qnqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbmNaLuz;
	arc=none smtp.remote-ip=74.125.231.193
Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83844606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83844606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbmNaLuz
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-539d2baa897so505663b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602111; x=1795206911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=;
        b=xbmNaLuzNf2nX/v3tDmWiuNZfGEZ0mk35mIXBjjfNlwvl71QBSYwR0atqwWI4oEnYq
         wQs+C45gyXiOjinKtUZn/lwgW5HDm9lCvv51AIRGaqDFMqeO6pmEBbfbuyApC4oUlcaP
         e1ygAnsUZfFL4a95sS08bFdwW/9wpMu0FM2vu1EWWJk/Sl9Y70vTe6yY9yk9DX/7Sy63
         PNOIMkj9eNOk+ICn+vloV5QTxCNumcFCsExu+ecQ5/iBVp3LDPfyG8Hrsvve+1Es0hGX
         xikhXSLKgMafuQUf3K5sulsumv+5DZJl4gRzFhWk+Sq2w6oZEUhWzLv4nWoC2aHzNWEU
         Ik0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602111; x=1795206911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=;
        b=qFmV1OUmpaURswArKKat7Uo/dD/M5yyGEepDkViDXKOPc2tXgsXsJll7ReFrmCld8J
         /D/FDKmndIfuNL3z3duABMRGJ5ydZkT8lkRILF83QUtcpqeEImuasaJvwRb7v3gY1msp
         bxKojOttAnAdrUnTkBDqbs54t4pBO7Hv0Mw48nd/L6irXD/g8UrvqAfp9ixiezD2/f4z
         tkhg0Xv9661vSfffFG4mcQQHQh0yYNuT/6BPPndpKeyQLQurmxLvEgVC0K4DeXm8jEDm
         j2cj4LFxWuVZCOJet3OlCg6DKuZJoeJeKJPK8KZilgPXNhTZw0mNsUP9rD8/MVI/QVN2
         J5mQ==
X-Forwarded-Encrypted: i=1; AL+hErGyE5WWGYBzMF3kBdLkp4NEI5gJHgzLvYvlNEWKQZoRj8XNar6yA7dLnapWox5naMTw8r8iRwAiw7cUfUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B84cYomaS+euUOmtKscDxaKkXhA8qiayvbhrDH/lHA/N8RZjr
	IVUFr8BhVto/s47Z4/Y0XjNm5JLXTw9gvxOR5ChDg9Whcwt5mHRvJOQa
X-Gm-Gg: AYBFou0ckY/tNZuX7jaVj1O1zGNtoFOnNFORRzGG+alE95qWJNEzQS1qOBUmXo+gotu
	+qaciNV+UHHgOgDgsRSZRhLQVBjpyK1rOYSF+HgdC2mIhPuxlxe4oLT/LT4vW6LmpPfbbHRp0pV
	g+q9maip8MtzB39RiP2HKSCpkU26Y4846uyw1B1Puz3LwThOFiKYPcOqck1L/MAH7oxmOJtb/7D
	rHl0bB5LWrk7OWSI6cYza9aPfr4zlEZs4OXRfdEX43NNFZPyILus0BY38neWsF7UjzbloiutzL0
	n57LRaPHoTdCSM2CC3pLHxD4MvvdKDcH4ONTJm/WLY58FFvGTviugAlvGiFVgKzzljVCcH3M6C+
	7DKlsy0/bfHnmzcJzGnUqysrv7gtvsmDW86Ioc0raRp8IQCUbsAvx2JxPRSsJWZD5oTDtpZxth4
	giYFPUYbJw30KsDe+jyty9pAZq8vketheHAnthE/golM0Qifs/JDmQaHYsXCCIKqVQ+mwomR0a/
	pZyp5ZEiLzfOG89/luJibmsHyjhFz31k6bZFddmNVvsCY8zCI/M9kOIG7CZnexPRKwLN8ck/kD0
	0EZDwi+/vucak4TqiLgyE1o1eehXrzDnRBYCYM0e6pyLdaiaHIbLJjfIekaq569HlR1XsWV8SgW
	x7Bxgd5EAjfTnjp6MlZc=
X-Received: by 2002:a05:6808:1527:b0:4a3:3108:866a with SMTP id 5614622812f47-56e637950e9mr3481169b6e.17.1794602111487;
        Fri, 13 Nov 2026 12:35:11 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH RESEND 0/2] clk: mediatek: Fix FHCTL DDS mask widths for
 mt8173, mt6795
Date: Fri, 13 Nov 2026 14:34:54 -0600
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/42OsQ6CMBRFf6V5M8+0RQGZHGR10NEwQFvgqQXTI
 mII/27AH3C9OTnnTuCNI+MhZRM4M5CnroWUiYCBaoq2NkgaUgaSy4jvhUTbJyIOsaIRtfZoC3/
 HN+m+wUiVsVBRZbZaQMDg6UxF4+q+wjm7ZKcj5L/dv8qbUf0iXsiGfN+5z3piECv/R28QyDHUX
 HG5lyrZqUNtC3psVGchn+f5Cwnp5IDcAAAA
X-Change-ID: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1971;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SOLu4jzxQrQXcZ93wAkCZjEM/VLMoV7Mr0LjnwhotLc=;
 b=fFa1XmGpk3uBIN1Zz6dT/QjiYTDVTbfEew2GPALp8trqTIHfGKnKk9edIoN7tUBqvwxjac2jk
 emNoj2NFPYmDGP15GLsBdV+AHx657qde8qsIrnkzqjM7JUqLtbxn51N
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Discovered this while working on bringup for the Amazon Fire HD 10 (2017).

In f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping
through FHCTL"), and 45a5cbe05d1f ("clk: mediatek: mt8173: Add support
for frequency hopping through FHCTL"), the DDS masks were set to the same
GENMASK(21, 0) as mt8186, mt8192, and mt8195, despite not having the same
pcwbits (21 as opposed to 22). These two patches correct that.

Tested on an Amazon Fire HD 10 (2017), an mt8173 tablet, across 6 MMPLL
rate changes. All of them timed out prior to this patchset, and all of
them succeed with the patchset. mt8173 currently doesn't use FHCTL, but
this will correct it for the future in case it does get used.

I do not have an mt6795 to test with, but mt6795-sony-xperia-m5.dts is an
actual consumer of the FHCTL node, and switches it on for mainpll, mpll
and msdcpll. If someone has that device to test the second patch, that
would be appreciated. I do believe this is the correct fix though
regardless.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
RESEND: no changes since v1 [1], rebased onto v7.4-rc2, with Angelo's
Reviewed-by collected. Jerome noted these go through Angelo's MediaTek clk
pull request for 7.5. The Assisted-by: LLM trailer is dropped for the new
contributing guidelines.

The patches were still developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com/

---
Ryan Brue (2):
      clk: mediatek: mt8173: fix the FHCTL DDS mask width
      clk: mediatek: mt6795: fix the FHCTL DDS mask width

 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

