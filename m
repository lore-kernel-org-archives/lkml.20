Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227790;
	b=PqSL3MI0JpvzJHSLYaf5ZWYR+ElNKpp1AU92/x5DSp0dEHnsl56X55UXi5h4kVxfg2ms
	 arGQTceklpip1twOLcBKJToIGjqAoI0h7VGXbT3c9SRDljMxiqPl+Wvy5D9S1MdhQO7cw
	 +uuC4CCUlQOmh7LvJ1fA1PPpnMJX/Pr1tPkaGrhDHXnVCJe0BILJ4imvUEnK/Y1yP2qCd
	 NHNIchipZXViczOiECKkfnVAPFbJ1HAHtGgPqU815NMg+xr9FiwX9/Gdf4ljaesp7b+iC
	 odoSaPrnuP+F7/0VIS6hAjRYW4ZIAgC5YIjKtaVGXpm/Vio06D3fPzauawfPWJRNJtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227790;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZabFNkWAWqv4s1QhbXT4Kzc6A3MJogz6MVSfuPt/7B0=;
	b=WRfT7hDtodU3DT4Z9onJLVASNpWSw667apJldjTwNKUNW6li8vaOMUDF8SE3cPwQfqL+
	 lSkRUPc2Otp8xu3Dhvnshl7uHDs1frjg4Zlw5pW24ELPAQlRVl0zn6LZME1JsRfbAzfi+
	 Cixt1fg9OQRSzmdhFTe63TahN7p5zyKZr0MzJQbNRDM0y3J99UHcrhcWEaEzOBPWa3u2X
	 m6PLLURZwTws5+ubuOcJJsHuTEsYTYDQLQueJnmT0MAmqpbYCYZ2C7Ww0ZqnegNssxwjn
	 kxUoNXB8ycP0XQQZwtsErUSg+NUd62NrC3jXM0qAsOw8PONAP7ANVXxUUqhY51Ig+Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=fXTETyX4;
	arc=none smtp.remote-ip=185.70.43.172
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B67606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B67606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=fXTETyX4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793227774; x=1793486974;
	bh=ZabFNkWAWqv4s1QhbXT4Kzc6A3MJogz6MVSfuPt/7B0=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fXTETyX4ecYTFx8kkm7a4FDc7TpVPxCF0aBXUPREb7Jp4x1Oa2Mun2Xwxj5XpssdV
	 wj5FT2b9awaQy9Q14PlhTaZeSh8IKjEw3/lgCkLRS2xr6BVfsP8vHVYcTzLh/wIY4y
	 dqg/NF9SdjNZieADoy9TD0gHSeubr6/SFCOfCdZydlPMk9af+TSfZCniGilO6KE0+j
	 dLaB9ppaqE1mozSygQkIFWjwQSlDLR4hYhhCgh0eZZ1Zfsl8ARu9I1ijhyErs4cY0W
	 5uYWPZppDYQfG4L9AKSGhWdVkBtMwvahXodKQsULHOOLOPCrWVZcplFhhYshfR7026
	 H4oR+beCvTWCA==
X-Pm-Submission-Id: 4jFMxS2dkMz2Scmh
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-bluetooth@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Michael McAllister <me@michaelmcallister.org>
Date: Wed, 28 Oct 2026 22:34:38 +0000
Subject: [PATCH 4/4] Bluetooth: qca: Power off WCN3950
Message-ID: <179322687811.94538.13174359204402286337.wcn3950-poweroff-v1-4@michaelmcallister.org>
In-Reply-To: <179322687810.94538.4628148055419456389.wcn3950-poweroff-v1-0@michaelmcallister.org>
References: <179322687810.94538.4628148055419456389.wcn3950-poweroff-v1-0@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index 3d688ab75..540014182 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2249,6 +2249,7 @@ static void qca_power_off(struct hci_uart *hu)
 	power = qcadev->bt_power;
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2269,6 +2270,7 @@ static void qca_power_off(struct hci_uart *hu)
         }
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
