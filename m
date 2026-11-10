Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354333;
	b=I2Zmd1ReGPqMHYUZZiAwBBN8IvZI4hEhZ2Kt9/chZkA6hWf4JAsqEycLjp8M+6fFf1+b
	 M0CeAJtwIzpyxJSaUmbPdj0zr/sneMVIVIPDMbtF5bGcf16sI5tOECAYVzJEZnXelv5j9
	 Ww2GJ4CCcSp4Je++N0deYLFsFYLXdC1Qinb6wHYLwCt1rCKHoDJSaTfVBIDcD4o1ysNlU
	 txrJSGeZjlKuAnGsj4Ttdp6Sk0WX25tSdcPFsFqBz8p3Qeb8+P41PLv//QCNobEftd+eL
	 jH8bZIUxDwSumZ6A7hzV2yOJ8D0Rcf0RlKYhD9WvqltmY8xNXdPgfo7FWr7cQSGJIkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z80b0kOprqBXJCQHVSp5eJ9qB/tGXVw8oMunX8BeLbA=;
	b=wjSz1BTcetnz6IlK7z4/yD4uzupQ63Kfx9stUC49+delu5WeXm55gWiOyg6jnucHLyrD
	 PejTp3SyJbTUIhPtjabA4kikjb9ItaXqvfPbysZM/mJ8x/iofGWl4IDqzQcPRa8PFG0hN
	 xg+VBy1nsuLz40OlX5UNzLpeg5C1PCguemRSceWxYvIyallWj2t0auEJp0VkANLF/EaI0
	 66JjqW3ikV53foIFgRsuQgiUkA+x0+RJGh9D4vRVjRL4VtUF+USFgfTWh3HUDH/1rrHo6
	 SP0oQqZmTKCG0a9eYMH8SxwT4m3qqtbHZ+Urigt7J1TlFi5IuET3YVk3iJqUru3rM7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AloBNOqB;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CCE606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CCE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AloBNOqB
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so4480727c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354332; x=1794959132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z80b0kOprqBXJCQHVSp5eJ9qB/tGXVw8oMunX8BeLbA=;
        b=AloBNOqB4kQhoGjT0vpJtAKQ1DgaDo9i21QVmYkBnBn4lKOhGSL29DF1B1yxGy0iMx
         jmOFxUlzrv646NvIX1DbbJWj9YX4SgaW4LoLKnQrxSZatfh4toQo5bWzt67q9IWpHbCd
         xB4LDmRn230Jg5sfTOEZhPRcW3X/HqEn6fJDwOVUbBoBxm32Tvn9p9N2CRwc2Hf6tXEH
         B1XR5TQPM0mTONNleai5YNJkD2kuWUD6TEF5Sqw9bpb2brXa0Ai+mLHVQflnrkPHiYT0
         HfPL64BPTNSXCjAHbcB5pGr/NOf+isrMRDeO5hP7ogR7kcByrIAM6C0AloYSwRhjuZiy
         eX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354332; x=1794959132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z80b0kOprqBXJCQHVSp5eJ9qB/tGXVw8oMunX8BeLbA=;
        b=lVTE8csNUFX3uNc5siS6/eQ+tdU1j50W1ev/b5tZeintSBiMF8L7gNdYFqyMUTYB+G
         jZVxJvSP0V+cHG+XxeLyutLnCIDjla4lG/o4qYE35yriI0oIvHDk0MPDe4KrAmRWkX0F
         +E5RvZD/gWLTk76lF1ewZ4BM6KSm61fGTGEnWb1QTs1yMsKAvBABDcq65O4uHKTr2DS6
         GUn5bjm8B/LdsfYqs9D6JSQlM4lUrPn4Loar52mrVT9MPZ4CPHAHNgwRbdZKMEE7Xoha
         j06rSZHUALZhpWIrcxRcdq3Uj0e9QSchQikwxSxUlCzkLGQr6ekFzPwsmyj4fOV96net
         Gz5g==
X-Forwarded-Encrypted: i=1; AL+hErEBtiukS1qbkhEABRuAoGCkFVr0w8r7wuRe5Cz0Unw+6Ye3N3cgL+ZBQr+Zpl5rvftNVN8ssH5IO/huSEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+74bQRO0J5VubuIn/oqqkHMJGZlfWBDXq6R99RTuPRYExPLyJC
	67+vszGaHbpCF24Wbh5ofgajD+V7ixvPUMGY7p9Mlf1i2BN7a7FhHXJB
X-Gm-Gg: AYBFou0fGWrXFMrAXD42KU9nGTGOL4SgeeAxYNT1tiRHxPWJR/XOPEKlne8+DIYdeP6
	PHl8gjcecf7B6oepNL7Ow06nv19LAR9acsz09W21HUUZTs6lmQpyB4jXWrZpQfkEUA3m0Nu/d0R
	XeSshKD/CkTLjYXtdEvQTwIMNI9gqUqiUzP9PY/ijHghk4WgTJaeN2+wfZyUyMtR4K5tIvCckKk
	XXz1wq1cYP0jCv4Ql+664TVjCoZ0A55r1eAORCkvoZDou9g+E180ar2Nc9CTBJnXBLz2NjpiJBu
	RelGnc5lj/6JJQ0xRXDH7/3CBzhyZTMKKGOJ96l+9M9VByuxFh3+B6RtNklaEcTLTgydNlOthSi
	ODu13/ltaK82s2U/pxe1R3X1/5ojigo2U8k3ffl1XS5W4SaHe7dRlPh1DlEPN8qEyTpb1aqrn5Y
	gdvOVCZVIMmuDQFA6fNFbTYzTVQX9g0RRAMPitDKahdamycqgnrWXMRCGec5aP7uM5MRxwbXqen
	p0OuVZjkoBhHc/mkoa2dZcbBs+ta7AyGIChPMUzdFxIpH+/tkEvqhOLcskm14OCGa3gX1lUI4+i
	n489Jk3u
X-Received: by 2002:a05:7022:3a0c:b0:144:fb87:5b91 with SMTP id a92af1059eb24-1b3c036b339mr655736c88.44.1794354332061;
        Tue, 10 Nov 2026 15:45:32 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9145881c88.8.2026.11.10.15.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:45:29 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 3/4] net: sb1250-mac: Add ethtool autonegotiation restart support
Date: Tue, 10 Nov 2026 15:02:59 -0800
Message-ID: <20261110230300.2769327-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110230300.2769327-1-f.fainelli@gmail.com>
References: <20261110230300.2769327-1-f.fainelli@gmail.com>
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

Wire up the nway_reset callback to phy_ethtool_nway_reset() so that
ethtool -r can restart PHY autonegotiation. The phylib helper handles
PHY locking and returns -ENODEV when the interface has no attached PHY.

Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/broadcom/sb1250-mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/sb1250-mac.c b/drivers/net/ethernet/broadcom/sb1250-mac.c
index 546415d3134c..433aa1e24439 100644
--- a/drivers/net/ethernet/broadcom/sb1250-mac.c
+++ b/drivers/net/ethernet/broadcom/sb1250-mac.c
@@ -2129,6 +2129,7 @@ static void sbmac_setmulti(struct sbmac_softc *sc)
 }
 
 static const struct ethtool_ops sbmac_ethtool_ops = {
+	.nway_reset		= phy_ethtool_nway_reset,
 	.get_link		= ethtool_op_get_link,
 	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
 	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
-- 
2.53.0

