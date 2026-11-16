Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846403;
	b=gUQt6qk3B6tSzE16tzqbXSYu9MGxurMKBhRXTM+q3cvuQ+dGijhZ2LXWzFYpFxp/LNiW
	 qrYr4FpxTR8gSQ/6M1c1wniQtP7MWiSX1UkmFHdUHF0LESWMMpa7dhbNXrUMur3zXJHBy
	 J4F2GY7m3GB9tWSRnUMo7t615VN5g5TUQM5LwHRZ6DPNI3f3xLI7vmtd6Vke/qjAvf2WS
	 SEbFp7CCK2u73lWz2kgSpnoPnCF4nYAUeC6V0o4htVKyWVJd1wq6j6RD8fVix2ck6Ihqe
	 MdunlYZnS8UxXUbNOqufxv9lwoV3FtIrCi12tzjZGSbuBYw2u3mY9Sm8VwbWTkBXduw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846403;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3D0u6TnXn7cU9TzO0Oe/RHRjfSNFZVI4UOig4klv+f0=;
	b=Q7przfAHjKGKgV49HLyqyRFY/NLXQyEv7p0BgNkA/5GDmG744fbG/hN1yjuWos2DIuUt
	 lWbBbEluD0RYeKQm/BC3WP8BmxNQoSL60OR/R/Uw5j3lMjP69tDd56UDc0MoWZkiXzOMn
	 KvJmyBC4uAn+B9NNi5LgRpqDrl9TGW852giEwrxnbUXsXXn3x+ElCRjJFEldbTiiXLzXk
	 it1AlW1c4B1bqhx+iwlw2Vsa19HZT5TbPXSUGTz/sWbFOaR7MevnPuI1GaAUv9SoV/H4F
	 OSVtwUgB4BQkHFIjS10HVEmDbOGCLZKcN/ia7Fq9P2Y2TFjxEhkClri7O2VRF+IiNrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=B1m6Vh56;
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB174606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB174606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=B1m6Vh56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794846401; x=1795105601;
	bh=3D0u6TnXn7cU9TzO0Oe/RHRjfSNFZVI4UOig4klv+f0=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B1m6Vh56e8ymf0dhDN7YDNu8Oe4KQCLHEl/MtoxqARmmDc3mFff7CLhekWpCXkVEn
	 pCxCLR7B57iAepjHA3/S9/gyEpWv2oJHdtAUZwvlpOFEOLO18rIx8CgeN9OBWwCH7s
	 ox4oNIpPKPdgCqYpoMy2zX4lBQETNo0mb5ynw8ZkjqtO1yUYO6mRvBoDds48z3sNN0
	 pNZSHDzuWFE0AsCKKhzykiRus/JIj4s4kHzoEJTbQrlGooJrW1BFMtm5uZrP2UZOqm
	 XmW8Lxzhz219UTqa+PSmEHpXUicySWAevm7LBim0hjUg0J6TSi0Hx4yVXbuojf9QTA
	 +otlRjF2xu3vA==
X-Pm-Submission-Id: 4jStXt6ttdz1DF4s
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: brgl@kernel.org, linux-bluetooth@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_bgodavar@quicinc.com, lumag@kernel.org, mka@chromium.org,
 me@michaelmcallister.org, markus.probst@posteo.de,
 shuai.zhang@oss.qualcomm.com, enderaoelyther@gmail.com
Date: Mon, 16 Nov 2026 16:26:21 +0000
Subject: [PATCH v3 5/5] Bluetooth: qca: Power off WCN3950
Message-ID: <179484638195.54009.16877279504978739528.wcn3950-poweroff-v3-5@michaelmcallister.org>
In-Reply-To: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
References: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Turning Bluetooth off on the Moto G10 leaves the WCN3950 regulator
votes enabled. qca_power_off() handles the other WCN39xx controllers
but omits WCN3950 from both switches.

Add it to the existing power-off pulse and regulator-disable paths.

Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_qca.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 6642af781..bd8cfe95c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2283,6 +2283,7 @@ static void qca_power_off(struct hci_uart *hu)
 	power = qcadev->bt_power;
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2303,6 +2304,7 @@ static void qca_power_off(struct hci_uart *hu)
         }
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
-- 
2.39.5

