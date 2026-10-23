Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788131;
	b=SO5U4JaONQ4b9PIanmjKQqpDITlVcvVPvBQdnrbunvZjNbWZHX6Sx4S0JTlkfFDixEc0
	 ab+k8Dv9DHd5VARhSTS0QrhaNz3RUPwxCTAb9nb7LFfEOxaKl5Y5ix7jyBP/Iv6wiMJol
	 z3a4ph42lupU51v2qTDUgKPZfbzXJTBvGt4ApEyV3FGubHj4URUT9LHUbH3cHHCjrm9Lk
	 ybomOg7luq57AMiEW6Vl4oRnANH1XtXTR9qu4OUgbw0I/DoSdXmfdbuwesK+IW+pG3ThQ
	 zJhr21Xx2UOtB2v5BzquvweQHEPBBjScounTWTO5mccBGhsCo5GJnUcUfNdGPQnjVJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
	b=Y40VLfdmaUaM9ZFA2NhVV6NpMIb+NcJrAerAFJVEtRavtBtlgL6bSRXtHgmOyxSkrgH8
	 GvkOSSbGHpGOvfIRtsqnwyWoV/I0mP2iMrYWdD1R7tvxhtL93/3gkVJvzZtgbBVOhL4Du
	 E5Dstd2wXZEe6e8dHEtyGqrKzSKk8BnsG7EgnwCpvwOE2yBYJ0F1FKvA5FMmIj/IlWhxv
	 Nn5IpW/rMAoyyR2lnZI9eAr/0/MHLbSmYPtGOM3gosKu+lKRe2CwMAvrjp5KfN8wjqHwY
	 6wYS768CDdvav3ltsw0/jzfHdH/uDuiP0NEh4IbXdvGJbyWF4o+gw+hxN6trpanm85Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pGG+kwUr;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63573606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63573606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pGG+kwUr
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1020668f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788128; x=1793392928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
        b=pGG+kwUrqpe5A/QKNgH2S+nkATS7olAO50nfGbt6mhyG/Zsgrf3rVvM/AKyZTjKXAd
         vv5Fs44g2MljOHzKPYv+EEBOx1bwYDjU35BGn2p6fEsGJ+jS0Le+4axiVU041ZZylKcS
         YpeRU6mN6VRtKYDr8moYFjXNnrhzY+fwA4y/UE2TboBVbmI/jb3Ncs7Tj88qowkFnrtW
         13xjITpCE7k/1oqRyAOSa8KzFJFRa4yNcH9tfZlPQTAXtEpVwhelPe0PY5Tcqplp5EiW
         1RBX8ic7BM7feT/hgCfTffJZtMTXIjrJSdmHwEynW2wGCIbmw2xn3JbbO03Hr62pQhKY
         jHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788128; x=1793392928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
        b=S0RW8vlb20+9vc98mFvFAfd73Cky7oa8aqUaR2hyaTY0qDPszSB7W6VGYQO8pjh4J3
         yjofheKFUCFtlP15ZjBL8a+hWhmyAzo1YEF9O15fQktfLCzDJ+JsiUlqYHkF+LE5EjK8
         8Im5MgNsCQPY9JzzNCg5s2v9ZydNkRKt0upmnZ7yQpwtwIdhYk8HBe05GNKjdJslL7oD
         ut/h5WKb07Bo2LuT119P16Fl2x0Y+th87lvvimejYN54C5OyFAeVkc/5i9kl/bLb2OER
         LBCvqNwRrNz1fzLgJUQ5i7tGW5KusaXNC3woJUmiVC0Kd5gsNhA5hqyJp++ebml5pP+c
         8W9Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6wAQMovK+YeAxbciz3ZvITlOjfMLYV6BJVW5xS7krO9WBMlLoc7Us/osVfHQWCUQYeSqizHqBGKN2rD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvQ1jid+i6Da5FiaRKUIvj3/GiFnPGH2qzK2zdu7X8pI2+YyPM
	6gbfdZ4gr9VMC2fjZpKYM+ewKt27MpPSMOWxk7D3GdrshNRuNCURMoFYqLV1KVY9303IcNuNuwj
	VBZVKgcw=
X-Gm-Gg: AYBFou1IHEQWWHZ1Y7XetOb2VfMqhP+LPzKEkOroGTu1mLXwwmXJnaA2cju+GQHM9HU
	2Tx5nrVKNs2OExsIp+X41J+YRekpmwhes1AFSwSPTjm5iQfqsHekYInXrpWsfRgStjLcWOtSBgH
	JoQ9BhOfaMWC54HWxSs4zyWzirpuuoGNXM9ruV+CX73s15/DzZ58M3kJ/QzmlefZPa5E2JDhQz1
	XQ5BiZYWqRctFEblGQD+1KsAyOE6n8tPNudSpMHUs5s1nP73VGD6UTqsAp0FTrZ4OrmtvkHPah9
	//CcqrmYpDnX95FO/dqIrf/vnuICVxk4Uulng78wUQoev6H1CWDO+AkS0egfL/2CGmEHZz8H5PX
	N2+1oBNOrAQU5U66QOTC4ml4E4oOUJb0WdX0qFWyfK23McgBVpb/jNceMmorEGlwoBk9uw9CebG
	UkwwAsVG04/+CY+LazJ00KVDTkqZnU+Kkiq7v9M+cATh1iy7QAdfSb5e+PusMNdrpq761I7hgKS
	SNqMHTd9Z/WOP4wlZ7rzHznrkgu7yRpGhzBISgI/aQ8phe5tGy86qXjdapKIYJQNLXA3uKQbfrr
	6528X+uNW6SeyqoNZWYbuegDy6uPjop1
X-Received: by 2002:a5d:6e4d:0:b0:48d:bae5:41c with SMTP id ffacd0b85a97d-48e3eb7e458mr188254f8f.17.1792788128507;
        Fri, 23 Oct 2026 13:42:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm253565f8f.38.2026.10.23.13.42.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:07 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Linus Walleij <linusw@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] pinctrl: ingenic: Add X1600 groups for each I2S system clock
Date: Fri, 23 Oct 2026 22:42:06 +0200
Message-ID: <20261023204207.48277-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600 has a system clock (MCLK) pin for each direction: PB22 for
receive, PB26 for transmit. "i2s-sysclk" takes both, which a board that
only plays cannot use when PB22 has another job. Add "i2s-sysclk-rx" and
"i2s-sysclk-tx" for one each.

Used on a HiBy R1, which only plays and has an interrupt input on PB22:
its DAC takes MCLK from "i2s-sysclk-tx".

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/pinctrl/pinctrl-ingenic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 1aa6a6dc1209..28e7f1852054 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2411,6 +2411,8 @@ static int x1600_i2s_data_rx_pins[] = { 0x35, };
 static int x1600_i2s_clk_rx_pins[] = { 0x37, 0x38, };
 static int x1600_i2s_clk_tx_pins[] = { 0x3b, 0x3c, };
 static int x1600_i2s_sysclk_pins[] = { 0x36, 0x3a, };
+static int x1600_i2s_sysclk_rx_pins[] = { 0x36, };
+static int x1600_i2s_sysclk_tx_pins[] = { 0x3a, };
 
 static int x1600_cim_pins[] = {
 	0x14, 0x16, 0x15, 0x18, 0x13,
@@ -2493,6 +2495,8 @@ static const struct group_desc x1600_groups[] = {
 	INGENIC_PIN_GROUP("i2s-clk-rx", x1600_i2s_clk_rx, 0),
 	INGENIC_PIN_GROUP("i2s-clk-tx", x1600_i2s_clk_tx, 0),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1600_i2s_sysclk, 0),
+	INGENIC_PIN_GROUP("i2s-sysclk-rx", x1600_i2s_sysclk_rx, 0),
+	INGENIC_PIN_GROUP("i2s-sysclk-tx", x1600_i2s_sysclk_tx, 0),
 	INGENIC_PIN_GROUP("cim-data", x1600_cim, 2),
 	INGENIC_PIN_GROUP("slcd-8bit", x1600_slcd_8bit, 1),
 	INGENIC_PIN_GROUP("slcd-16bit", x1600_slcd_16bit, 1),
@@ -2539,6 +2543,7 @@ static const char * const x1600_i2c1_groups[] = { "i2c1-data-b-15", "i2c1-data-b
 
 static const char * const x1600_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-rx", "i2s-clk-tx", "i2s-sysclk",
+	"i2s-sysclk-rx", "i2s-sysclk-tx",
 };
 
 static const char * const x1600_cim_groups[] = { "cim-data", };

base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
-- 
2.39.5

