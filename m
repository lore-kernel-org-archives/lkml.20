Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846399;
	b=tMuocjlqWceUk3ror9LpAjzVL4rOZWocHT/GhQFt5vZmiGK2op86YoB6l1pt6Rxxsj/q
	 NunO8IUx/ChHd3O+XuDevidKmA/iBbdoNJLqoNlR7EdEE/EPhas5uMFkOsiHdTjHshGaB
	 fGeQSZIDymbROLWT4YDe5xyKXKNNiX2aur7pvpJICPei5lb45XmrQOgzaFClukcrf1hUX
	 /jHsgqlzEPUvdTCBDI5SHHCE3KyEuhmKYziLEbWk0Bjwi5Q4Zc3CK1g9LbgDytjltbPlF
	 Kq2E8yaHI/OqatEf7wLZfdJYvAyWqPR916+D/wAKSLoWCUSAK5KE60e4BELFkOyMAzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846399;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tzQ6ctSR0/sKsCuuNeE7tQxGB9AUZXtthceaGBqh6wU=;
	b=TGqaTyzypIhM3Nsb/mOHG1KMVBsbdW98gw9rLHoPEi0TTw5M+yQ8YZheKzVGuUtS/EtB
	 6WRlOu7obdvic4MrzqWjKNRh7fTknf3CUaOQDE+r0NDtVhhvT2pxdXdOm0u8Qz7X3+R9/
	 vfmmvBxjXnUyi1UP6Ki6rQUrzKSRds2CvwLN4Z34A5GDeq1nuoxD0r2IiMjHHPYcBu3z+
	 QeCjbn5F3p/rXvcNXFYL+egM+4geud+fExCYuU75z+hIDRwvDpgf//Hcg2U+N8dM7kQ7s
	 a+cHeqiriuwSjvfjaYvNeS/lJ2OYKEye8BgkIkMVgTpU6ndMS1u1W/1zz99Dc0sKDbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=GrO2wg8r;
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D503E606A33B;
	Mon, 16 Nov 2026 16:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D503E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=GrO2wg8r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794846396; x=1795105596;
	bh=tzQ6ctSR0/sKsCuuNeE7tQxGB9AUZXtthceaGBqh6wU=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GrO2wg8rj9VwoQsrIgXmJTtLzao5VM5eh8HjdcViUExiG2ZWmjCpOls1RsGCqjTsn
	 E+57uDOS8evskyVzOZ2bP2Axla2/XvGRR3zQUPQNuKCDgTLpe7X5lis3BapOXIz4nM
	 AWHwg7fOxFVvHP7XBsPfv0/xgH3hXw9O2yx2TbDh4nnrTDoo1CviSX3Kz0u5Aha6ow
	 g5FqgVc0X2j3SktLmfHwJnFjJl7AEHcAx4ltbaXbSvxSiOX87PYPwapHDZYKF2ZOb+
	 iKtvmJoZver91Ll2Pcbp0Skx1HaThsjAyj26tV8fgNBLG84gxjS2BGv1Yk9x4IVvge
	 K3XqgGwUKQEzw==
X-Pm-Submission-Id: 4jStXp5ZnQz1DF4s
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: brgl@kernel.org, linux-bluetooth@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_bgodavar@quicinc.com, lumag@kernel.org, mka@chromium.org,
 me@michaelmcallister.org, markus.probst@posteo.de,
 shuai.zhang@oss.qualcomm.com, enderaoelyther@gmail.com
Date: Mon, 16 Nov 2026 16:26:21 +0000
Subject:
 [PATCH v3 3/5] Bluetooth: qca: Power off after unregistering the HCI device
Message-ID: <179484638195.54009.7102999657318109203.wcn3950-poweroff-v3-3@michaelmcallister.org>
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

qca_serdev_remove() powers off while HCI setup and UART writes can still
be running. Leave power-off to qca_close(), after HCI unregistration and
write-work cancellation, while the serial transport is still available.

Check the actual port state before sending the power-off pulse, since
PROTO_READY is already clear during protocol cleanup. Start serdev
controllers in QCA_BT_OFF so registration failure does not send a pulse
before HCI allocation or power-on.

Flush controller TX after stopping UART work, before protocol and port
close, so previously accepted bytes are discarded rather than drained.

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_qca.c    | 24 ++----------------------
 drivers/bluetooth/hci_serdev.c |  3 +++
 2 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 28e84fc24..ddbeb0787 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -620,6 +620,7 @@ static int qca_open(struct hci_uart *hu)
 	hu->priv = qca;
 
 	if (hu->serdev) {
+		set_bit(QCA_BT_OFF, &qca->flags);
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 
 		switch (qcadev->btsoc_type) {
@@ -2285,11 +2286,7 @@ static void qca_power_off(struct hci_uart *hu)
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
-		/* Both of these write to the serial port which may have
-		 * already been closed by hci_uart_close(), which closes
-		 * the port if HCI_QUIRK_NON_PERSISTENT_SETUP is set.
-		 */
-		if (test_bit(HCI_UART_PROTO_READY, &hu->flags)) {
+		if (hu->serdev_open) {
 			host_set_baudrate(hu, 2400);
 			qca_send_power_pulse(hu, false);
 		}
@@ -2618,23 +2615,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
-	struct qca_power *power = qcadev->bt_power;
-
-	switch (qcadev->btsoc_type) {
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
-	case QCA_WCN6750:
-	case QCA_QCA2066:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
-		if (power->vregs_on)
-			qca_power_off(&qcadev->serdev_hu);
-		break;
-	default:
-		break;
-	}
 
 	hci_uart_unregister_device(&qcadev->serdev_hu);
 }
diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index f86d417b8..e279a7d61 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -464,6 +464,9 @@ void hci_uart_unregister_device(struct hci_uart *hu)
 		hu->tx_skb = NULL;
 	}
 
+	if (hu->serdev_open)
+		serdev_device_write_flush(hu->serdev);
+
 	/* Close the protocol before freeing hdev (intrinsically purges queues).
 	 * Some protocol close handlers (e.g. qca_close) may still access the
 	 * serdev device, so keep the serdev port open until this completes.
-- 
2.39.5

