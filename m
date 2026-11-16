Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790714;
	b=lBLPHs45B/mp7JW7MUF+wZPHnjOYB4ZZ8o44nSX/TN5btxfFqs59sxRvflN411qN1SwV
	 Q2ttsZEMY3fhz+z+tODl6rN3Ff8gXLFkhe+UTK6qyJ8dUcr7tiIVSTv6E9NNu7qNYfNqi
	 JS7Aa9Q8+EsKVpqVVIx78kJzLZchLCs78Adajq1DWlLHCTV43+shhDqFecIhvV1SLEDOk
	 H2T/APQjq7mml7tF2sZKzYgJL6ZNR9D6k1/sAecmusWTHbsDKxSYd+GcihtHyEMCLazRq
	 jfRrpMngYvdSFsvh6lGnFlQcJr+jbZa6t9B/DJBKadLIhtgVEaRcFRQL867i6Vt21gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
	b=3HV3jNVzwFagyzqADbuBgBQ/ZJKl7dSfFUYUN0p21SomY0k/aMBhe+nNTHYcp6WihYes
	 FZaTUAz1ibB4IGfrH753q4WVIsk7Y1Gww4RqfSvWD14PDkLdiw4Os8f3J2nkW6GabqGor
	 fKcwEGoiTTzKvmm9TG1y8Kz9AtFwpfcKI2E3ZYjeXV1mFJe1K63t79ZX45vD1hAFvh4M5
	 /v33WkN0A2qTlyoPKeAteimZC38WuKIfVT8iXYRWTGPeHgXeV4xQkGfJ+CGLYN/SPO0if
	 JVjChULzph5hqEJSIHUVJsbxUV8cmz3r+1gw3aVpMRk+LXzx2MDQnfS2aJn77+DyHgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=adFyubNR;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13205606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13205606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=adFyubNR
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-845788309b4so1863613a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794790713; x=1795395513; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
        b=adFyubNRyB5lbr/hbuJZuDoA/tbLWVfkKW2ELRSEWEjoZpiAHrfISaOdGufHSs0/xu
         BtGZfpmq5zttVgvUP+TuRpGIlYzRVvTp5rW6cJtX14IeC2SCRw22XvOebTvgK8X3OaT4
         s+/kdj4jcoTpxuutgxdxvVupZBGz6tVrr6/wCNcq208GktgtwD03EQWXaTCBHivDJjym
         Q20QVAYcAUoufUDnetnjxvdr++/3DSExpEBOUDZq2i00iu+4MlE7PGfI3x8zhVOXTsI4
         jjZco4sEmUFW2SIeXZv4IPVvLVXsInSyNqphSUAusWOlZFAxgaKvyhSy8RIIAaqx60JT
         gLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790713; x=1795395513;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
        b=gEsMNaHCLD+stpqKPoFkUXDAkXGwIwncp9e2+cF6dmn2RO+5q89b3ihOvmqTSW4gZn
         TeR+MnU/Bs80ieNTCL26BaaIdcv1ty3Zfh4PmouGjwH1h4pWIh2PSCQiANi/opMkm53i
         XddB4Oqbx7nUoVjt8hj8FZdYtA+zyOUQvCSwPqJAPnkeFey2ovrukUQvKLk05DR+ACA+
         Zo3tnizYbTt/fOdztC69zceNV0fLnUmWiG0XLjd897j4u79Fd3sRXXXEu+e+oL2GGkOd
         ZecqkylUFHD4aZTTeCTZjlEjkB2BHXjqEJCkyKUYaClR4CcGKfhv2zaM48J/iBmBKi8P
         kAXA==
X-Forwarded-Encrypted: i=1; AL+hErFjL1CrdItPlWnFRIhpsehfV6xRI8FELYkFm9BaJEXjFvp5SJpjESbVnuKlcRAyWp9OWI7ga1HGHukbe7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7SuxJA+S2eONnnHDP79VmESfEt68ckLDCUe6VetCUeZ6SPiyG
	cAz/xfYLj4IkSBgXVuGCHbkqw4YygiA7ubv26hpvRkT/s2RPv3Cca0bx
X-Gm-Gg: AYBFou2shcytK0nwGaDOkUdZOQQbevv0ocWx57ECoJZlXBMS/XeyLo1IFhEMd6Xplo4
	Kl426+v5o2fVMmr1xN1Tv+l0t7ouJLNHaLBWZFFomDLBYbC4+Shqt+iqjQA4U685DUBU1pSUWtV
	ekto+RPNUa/zuYIqUeLKDurLgcThmVFKfmjKbANstQ8asmz1jhuqQ6oEfQraO/409SknLZQ6FF1
	0CehQy+EQaNOx5IqDTktODIgKC5LycUKnE67PebUX2zg5r1f3in/86p/EVm6I7qL0l293UhRgCQ
	SyJ11tUqc2pJWRA9deZcmyxBoQiI1F9io10tdaqRTeNVuEEdGr/qT7Fz0O0Q3BMECAkq4gEwhGM
	1kLyH3tlv+1brvdqYQoEHQWk3aeKZ7E38kQvUdSim5WuOCJmq66jT1TPjC04Qgkbpx9D0Maq3Yp
	KadjBibqwaVQV0jo8NP8/A4YnCQm3IVR+1w5t5eH3FGIbAaxTVphtGnVaMCMRKo5QU56wpma0M/
	V2wDuhiHeGYSOW7tt5Ajp2xoJHMrJFx3jnL6lwQZgJE6p3KRKqL/c+OXKPUwPDG3svqFaT/a52E
	oicQwoavhXCgNdYnkE41A15tKj2jRo/22bqVTDA4Z8GwPja9m4OM7a++aNGpFgJL/tYXsPO6ZWX
	EeStomi5SK10cLOjHC78eSYDQEp9ANrV/3aWeediQRtN++Ir3GEq37eCtxsIi2noF12+Edte17h
	OpfvcVoBXXWDG9nTXlQIKjD9LEjnJhmg4d3zMhjrrFzgjsSLv3Vr0=
X-Received: by 2002:a05:6830:43ac:b0:862:af88:e9bc with SMTP id 46e09a7af769-862af891402mr4387234a34.7.1794790712901;
        Sun, 15 Nov 2026 16:58:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm9545673a34.2.2026.11.15.16.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:58:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 17:58:26 -0700
Subject: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
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
Message-Id: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UCmkla8irhIx6kdJVEyaSmU3
 t2oq8/7i/c2MMkqBudmgyyLmr5SBTo0wFNId0G9VYbWtR0RebR5iFrqpJOixMCYV+RJ+GlzxIW
 QR9/50B/Z9Q6q5p1l1PWXuECSAtf/WUUP4fKVw75/ALUwtB6JAAAA
X-Change-ID: 20261115-submit-sun8i-emac-rx-checksum-v1-cf565a73c070
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

stmmac_set_features() clears hw->rx_csum when RX checksum offload is
disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
hardware checksum engine. The MAC therefore keeps dropping packets with
invalid IP or transport checksums before they reach the host, even after
ethtool reports RX checksumming as disabled.

Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
offload leaves checksum validation to the network stack. Preserve the
callback's existing success return value.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..98cc7503bdde 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
 	u32 v;
 
 	v = readl(ioaddr + EMAC_RX_CTL0);
-	v |= EMAC_RX_DO_CRC;
+	if (hw->rx_csum)
+		v |= EMAC_RX_DO_CRC;
+	else
+		v &= ~EMAC_RX_DO_CRC;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
 	return 1;

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-submit-sun8i-emac-rx-checksum-v1-cf565a73c070

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

