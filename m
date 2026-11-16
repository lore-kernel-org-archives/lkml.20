Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790160;
	b=XIbwBiplTeI4pUhZtlems4vh81J7lch2wQtRzDXwSqwrBnTyDr3E4t7dcg0hEzwD+Yd6
	 hMdkxe5WE4sEBBT8Y4ftm6Yh5o5qvOj7wHPiTBHy88RTCnjtn+C2TFGSBPkquFkz72+q6
	 9aBZ82th47bi1F3Erg3/z8N/6TaJqEqU3Lx3QGm7rCWgv7YGFhWUZULJbm/a0d0qarPo2
	 UB81QXPqrfWUZGxEIunTd1BeiCoIPQTnJvuj2NhDc/xflhSaht0atjzKaMUolagru0j3d
	 1i7gyfcGyCS8kEruHcGYDXPxaQD9kcc+Jvou4Jb8uSuTk/1uEDRK0FW5Fi+Y0xMcUQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=;
	b=smTN6J4ciN2jMOqCc+QCdjb1tk2cevzBV/FixIKf1xZXbdRILC3OfovyUd7OTpbmxMNi
	 vexaJJVehRy63GgRYeavCndvXxxUjmM1ljfUO8XChHmuRYEAppJwAXouIY2Q4Ry/RusM5
	 h7jNSEikRpihxD6Ph0q5iB9E6TWYTIDvf20x+DMeNVh00xybcBPdG8qt6HuLI5BAsNYhW
	 oZx36O0kIkhXPNNhDEpYC+ouwt4YRfTz732sHhukE8XdD8HqfYwxYcnas6LZkdV+X18BC
	 mGAk0tLDv/aXCgnOBS0ktEUf2zFoUnPcoHd4yyoBQZ4iieBRULMlBWEmMopmg3fI7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcGGRzgw;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A79606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A79606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcGGRzgw
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-86103aaac12so2668309a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794790159; x=1795394959; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=;
        b=QcGGRzgwGQsL3eNKNOsWPVren8fyDGfV+MneFZ+EMg1vtK2Js/vzW9RDEpBcmgGg0j
         L5C/z1vMan0ckoUThnVwPa5j5JHJvYUupPi6Pc+4lqxjrZw4ebNTHMepsLj1l7ZY7KWe
         7dp0Fc0RaNG+1+nP3lUTChYHftGY3oVdWt0v4MFGflJ78cgE9htOrKw1uZ/QBakcEOqc
         ZCL6DxiJ9gEs4f9qLVTQ5a79hnBNp19o/JO25k1hDvrs1AshvpYSKDqhD6NI6s48HpIS
         ckzhpmS1dMD9T0/pR8F8rNNq9a92Y3e1QL22vSWlvfUmYO0UVf+vBzjApHa7JZda1sMA
         GDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790159; x=1795394959;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=;
        b=ZKLyNyInwtgJROlsQbbsIfaLUax87Q4/k3L0d7dHYkmyrQhCtfX6NuZysSab4IuJf/
         raMGBgom9+4jdb6vSygabqPXT+QP8sAp5OEx74YJzZstqBKI+7Pmw4lQGL6jetArxMQj
         PKW9qXiACv8BO+icwCqr7H+r8XwcjX17bqaKhVsHZHGtNZKZm6P9AHIpfCImL/t3eAXh
         7PqeDJMBsKMWSgH+8GUkTfD1FNsWXFgC/rZ6sfx7ch1kosGfACqyxPKNEOxC+m6e8pm1
         D7k0vDMzLqonydTp6WIJYTcuMPHuIk4rJM7VIN113bj7iZHRnVWCmQYGU/cdL4UzQNKU
         Blrg==
X-Forwarded-Encrypted: i=1; AL+hErF1Ig5UlcaQiS5NkIH2W6eYHpCJqeX9Sq2x/NsIXxUvltPhJBbX76Ln++9wITR2a0TCfc5TFGEyiSAjG38=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z2PUkcCTNWWXkA9/J/oxOerbPAxKLq5saksyhrman24Is/Xlk
	GY27ivYF5dkw7WsvgfE2CvTa0JgNz/+838bCE97jeAP+KgdTOGaD5mjTqrqzEg==
X-Gm-Gg: AYBFou1MjEki46EfkVp9Z+b2idOKKlUXBmq9AgTWB0QdJWBerWh5ONNnopXPtI81aPx
	ZTvawq17YNpYhLXRs6a0iDUn425luCk17RbwkJiSh6hH9pV2VZOruxJ2qFjsmFIx5rIb0+xHiV5
	TqwvXTPFRNAV3tsMICFpK1RsMRm5mXQLP2FLZaVQE/nx5uDgZaGPMIaRZpqnkCS2hwu44DK5SE+
	399Kac6uayRRgdh7ES7QL3nMQREZIFubTK/zCTwcabk0PCA6Ouq71AW67LzjMgRldEaJUzXkhMG
	UJx3BceglRk6uXvA3eUgdKdjDgdn+Ryzfm1pYz/e5Xo1mCHhArcORSfmGMWOdSkl/VXxJwJkNoa
	SK1q+03o5yPcfTyJL41TTajvcmB6jKAL3Yn6LynQcYoTZwV1SuwDaqwcKKi/WEMNMRm3GiMyLs4
	k+2tlZlaP8JjCHlI7j2/SAVpIP1q/Lbv5ck1slNk02CKLbLNDC/EH9YCOyUJo8Dr41rQsAVnneO
	dhRyIG54n6BgkVB+62ioprrGRREt3JX0k+4tGdIJ3QPnhSlsyTQsDR2SGPTPX3HWGRLEFJpt+fd
	CFGklitHr2pxZ1OHoCLH6RVJdh3uJUtgx7q2QcprwJXHPlKeELn6O3JgRHzw9v1NQc6DOCZAD/c
	kJbqusJbPUIiKawWf8G2Z3zi+OnqV9GR1/Ngwm/yi3ucX4UAjf/fxxRWO7kSF3dfFZAbqf3Ueik
	BD+9FuSjY8MY+t1v5XMOSyEepnXwxrfytxDbDOOTpFqiHjuz5KP0Mg
X-Received: by 2002:a05:6830:6816:b0:845:8a98:3f1b with SMTP id 46e09a7af769-861527cbaabmr9725195a34.35.1794790158623;
        Sun, 15 Nov 2026 16:49:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e9abbsm8685537a34.9.2026.11.15.16.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:49:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 17:49:15 -0700
Subject: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
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
Message-Id: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBAAv0L27Ca2kQp+xXgo6yKrtpJuIRjC3
 616nDnMrKCchBVO1QqJZ1F5xQJmVwENPt4Y5VoY7N46Y0yNOnVBMmoOwROmBWlgeugUkPzoO3l
 KfuNskHvnDvWxadrWQqmNiXtZfqczRM5w+cvSuzPl7wO27QMIgLnVkAAAAA==
X-Change-ID: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offload
is enabled after programming the requested state. A zero return is
therefore expected when hw->rx_csum is zero.

stmmac_hw_setup() treats every zero return as a lack of hardware support
and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
then reopening the interface loses the saved capability. Subsequent
attempts to enable offload are rejected by stmmac_fix_features(), which
uses plat->rx_coe to filter NETIF_F_RXCSUM.

Only clear the capability if offload was requested but could not be
enabled. Keep calling rx_ipc when offload is disabled so that the hardware
is still programmed with the requested state.

Fixes: 0f280e4d23c2 ("stmmac: fix the rx csum feature")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..e162976be2e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_safety_feat_configuration(priv);
 
 	ret = stmmac_rx_ipc(priv, priv->hw);
-	if (!ret) {
+	if (priv->hw->rx_csum && !ret) {
 		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
 		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
 		priv->hw->rx_csum = 0;

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

