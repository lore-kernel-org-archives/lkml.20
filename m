Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=94.100.137.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794122613;
	b=byEWs/rSekBxFLj7PTbXrS7ZtCPU/TR7sRjUaQmq8R8idA9kEho9MqvCgtMHT/m5g34e
	 g0zPQTFy3AciLXY9Fx6NS5vL4lNT4j4XNttk9y1Zg39a15M6lUYFnLP5ukV5rpAcYRSgE
	 IQ6hlT7I9gafgz+3B8akP4Y1uc4BspsmqVECZUl1hSf5JH6AkYqzYLq9p6Rro4Q9THrDs
	 sDwigc4Zoq5JOYC+4c9nJ80+1jGXB7mZHquE2MmZQuQPHHBuNYEw84yUgSeKVV+TD4gbr
	 GaLinD9VicET+lbZdmPdN9YxBj/O8Sq9aIy2s4SPiQ4e2O4UbockR3OXdEJbGsUqDrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122613;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-cloud-security-sender:
	 X-cloud-security-recipient:X-cloud-security-Mailarchiv:
	 X-cloud-security-Mailarchivtype:X-cloud-security-Virusscan:
	 X-cloud-security-disclaimer:X-cloud-security-connect:
	 X-cloud-security-Digest:X-cloud-security:DKIM-Signature;
	bh=Y+FQJ0zypw4oW+399fIPqM//JlpCiJSggbCdSifvem4=;
	b=OxpJoBpncrkz5Fei1ZoiuH0+LzscKxc6GKDyRq6fXvJUCZr1rb5h2wECotSl6nXa+TjD
	 1sH119kpkiyh73ZQj+ZM5zaSdPIzYtq54lJGjGTrPStiUGtuxw7gu/Wm5p+wJhBzdYIYi
	 EQfTJhZq6nckfkTCJYU8jez/9rYf66SMHZTI9V36IqbvUyRZGub/Uspm3wFqBaoAVX64G
	 xdsdja7WfbarC58dxvLIEfRYIER7m0Ce/lSsiFEKkxjEIJQJeC3sx498t52GVy24wTyhD
	 vmocwWcR2CUDGjb7PXAqU4QtDHSJEwz+6QHshTMiXIgjM0q4JypvXgnJl5Ggs3+mz6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marcant.net;
	spf=pass smtp.mailfrom=marcant.net;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=yJ0SooYI;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=cYqDFVyf;
	arc=fail smtp.remote-ip=94.100.137.46
Received: from mx-relay36-hz2-if1.hornetsecurity.com (mx-relay36-hz2-if1.hornetsecurity.com [94.100.137.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B29606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B29606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcant.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcant.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=yJ0SooYI;
	dkim=pass (2048-bit key, unprotected) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=cYqDFVyf
ARC-Authentication-Results: i=1; mx-gate36-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Y+FQJ0zypw4oW+399fIPqM//JlpCiJSggbCdSifvem4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=1; s=hse1;
 t=1794122596;
 b=fJRYGIgc5L/SP3MsSo7x2VsekGKUbwQCHElZcaWtF4zTRjdRdL1vdw3km83GEZzxjPd9182J
 XWvP/xg2OfrRHTMfKa4o0bIzN71Wsa6sLcl7//2uxB4AO5Vp1mbvB43RYKHyH/NZtwzc0KNJio3
 8RSBvTybtayEpLQGMTDOV4A+ucgBk43HRB6ggI5xsmhUTTaTqgdSw8rmnRQCJCFHDFt5h+yLwY5
 tnRpSE4Wp6BIPw4ujew9qmn9Vwb3nzgzL7ByC2ELBZqGz40dKnC1i/PlV4zu3nhzR8ToSiacrlp
 IN3IYanAvHAIGHjHHVqtHRuJqGdm430pX3skx8yMa31wA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1794122596;
 b=WjUvG3LazNpUR7FTt/FwQvoeXZh8af9jX+kPYN/ZH6q9M4OhBu2ie+0XOn27iFDbQeQV0YgN
 lpoJU3Y0uzGz04xpI4MSgETl8zsrIXo0kSC/xfMUJ3gyq3/vFmZMN3l/SC+oWFu3WWzojoPLs6S
 rKPQbVbJJ1by1W4srL370F+qK1QrKg/0Br4Umo3yM6acnnt16ESBTJ9OJ9T7ZGhLhwoitu46Mh1
 yOz2Kj8TkxK1GUjAwkqKD8Vhn4OEZWrwYQV53pr0q4tqOW1s9w5PObVzoNvKc5GzRMw27dSvYvB
 16E589IInkvLsjp+T1zD3RncDAVN5hXcYFDngJ6ApWz7Q==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate36-hz2;
 Sun, 08 Nov 2026 08:23:16 +0100
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id E351A9618A5;
	Sun,  8 Nov 2026 08:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1794122583;
	bh=Y+FQJ0zypw4oW+399fIPqM//JlpCiJSggbCdSifvem4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yJ0SooYIuLAkuiUdxHJSCvS6WIAQGjIVUDxUEZaHY14sD4E29IFSN/9CTzW1amRSb
	 7y1CB6g3/O9BeNqsgjOWySA6/Q8RKWfQg1dRgB0LRFZBTTOCz+6vCYmwfnyMtRMsiw
	 zCtT4RyZyWa9Dzoj/VrPv97Uxp4NHKG3uMQnI2YE=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
Subject: [PATCH 1/2] clk: qcom: gcc-ipq6018: keep port 5 on uniphy1 at SGMII rates
Date: Sun,  8 Nov 2026 08:23:01 +0100
Message-ID: <20261108072302.2311227-2-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261108072302.2311227-1-avalentin@marcant.net>
References: <20261108072302.2311227-1-avalentin@marcant.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:avalentin@marcant.net
X-cloud-security-recipient:linux-kernel@vger.kernel.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate36-hz2 with 4jMksM2TmYz1S50Q
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest:70b48bb3e2da5c3c2062b1e9f6970276
X-cloud-security:scantime:1.567
DKIM-Signature: a=rsa-sha256;
 bh=Y+FQJ0zypw4oW+399fIPqM//JlpCiJSggbCdSifvem4=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1794122595; v=1;
 b=cYqDFVyf3vhlLSU5L4VKjQeTBFP5VHzQ2r2pt6InfvcyiDVJVNY2f/Vi4inKVjhbbHqEspKb
 iDP59oH+VPGmrIk/LT4CoV4zzBX9cbrzPqa5GCrcve7EfFc05/83BQ5buhj6xrpaKVkwTdeNF+y
 t0EmFn2WGPcwzai3x4qI9rZMfuDmjUseLoCKhJLUindSduBHJyaEKd3GvDNQ+MllcnjT4y8dIai
 Q7xp042IBXuqmplyLPpDYSmtr+oZmJHq2X3KIs0JxGSpAVM6q7ps5CDklzyBSxINVfvlBtDmV0X
 WA27N+0X7n94s5N+NiOrJOX46xhbJrwsqRKr6htAvi7UQ==

Port 5 can be clocked from uniphy1, which runs at 312.5 MHz with the
PHY in 2500BASE-X and at 125 MHz in SGMII. The port 5 RX and TX
frequency tables serve uniphy1 only at 312.5 MHz: 125 MHz lists
uniphy1 / 2.5 and then uniphy0 / 1, 25 MHz lists uniphy1 / 12.5 and
then uniphy0 / 5. __clk_rcg2_select_conf() takes the first config that
gives the rate exactly, so once uniphy1 runs at 125 MHz, a 1G or 100M
rate that reaches the RCG moves the port onto uniphy0 whenever uniphy0
runs at 125 MHz, and otherwise leaves it on uniphy1 at 50 MHz (1G) or
10 MHz (100M).

Add uniphy1 / 1 to the 125 MHz configs and uniphy1 / 5 to the 25 MHz
configs. They go after the existing uniphy1 entries, which serve uniphy1
at 312.5 MHz, so that 2500BASE-X keeps its divider, and before uniphy0.

gcc-ipq8074 does the same for port 6, whose tables list uniphy2 / 1 and
uniphy2 / 5.

Suggested-by: Julius Bairaktaris <julius@bairaktaris.de>
Signed-off-by: André Valentin <avalentin@marcant.net>
---
 drivers/clk/qcom/gcc-ipq6018.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 6943dc51153..a86b52e4276 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -513,11 +513,13 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 
 static const struct freq_conf ftbl_nss_port5_rx_clk_src_25[] = {
 	C(P_UNIPHY1_RX, 12.5, 0, 0),
+	C(P_UNIPHY1_RX, 5, 0, 0),
 	C(P_UNIPHY0_RX, 5, 0, 0),
 };
 
 static const struct freq_conf ftbl_nss_port5_rx_clk_src_125[] = {
 	C(P_UNIPHY1_RX, 2.5, 0, 0),
+	C(P_UNIPHY1_RX, 1, 0, 0),
 	C(P_UNIPHY0_RX, 1, 0, 0),
 };
 
@@ -568,11 +570,13 @@ static struct clk_rcg2 nss_port5_rx_clk_src = {
 
 static const struct freq_conf ftbl_nss_port5_tx_clk_src_25[] = {
 	C(P_UNIPHY1_TX, 12.5, 0, 0),
+	C(P_UNIPHY1_TX, 5, 0, 0),
 	C(P_UNIPHY0_TX, 5, 0, 0),
 };
 
 static const struct freq_conf ftbl_nss_port5_tx_clk_src_125[] = {
 	C(P_UNIPHY1_TX, 2.5, 0, 0),
+	C(P_UNIPHY1_TX, 1, 0, 0),
 	C(P_UNIPHY0_TX, 1, 0, 0),
 };
 
-- 
2.47.3

