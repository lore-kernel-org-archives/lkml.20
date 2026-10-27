Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113116;
	b=jIiUDB2pQNOThSOZD/WM4oeV+rbh6PMwhrUyUbrl+6IU1D+NZMDqdGwYHnzz88zZmNGL
	 iB9RHdA0Bv1TwF+cFYLGEil6dDCJbnb0ke1NJph4gpMzr6y2en1DKHoXSv80glUGgzlb/
	 EksjwRzdzBcQrNXd+gV0uDvVCNpOPJ2et1lyPM9bWPU7dNOKfvBGNCLL0++Bk/mVhjq3G
	 DoqbGIyShAs2QwmpP9huS8rZctN8GYUVYmzV2njQkbakSZBd8JOyDEfQJ+VNMn8CdiSXj
	 VXTykm2Sl1JLuOQ5tnaXXf62N6DgUgIVhwPk5UBNAr15mB4rs66ApJbqL9mXn43AXPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113116;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jkcE8dlNum8RVvPTh5ZR99rnS/ElCtgUg3uiOhWn4Sc=;
	b=oVI/384k4QCBhrW4oysnN92IjbJ7ZP/ygRF7FtUmwQf+eaUolti/GtizPXTZz0YXiDDx
	 iJM66D8UPux6Mcv/Ej/Zfdiwv1bcmTayEkFS4AO5CwW7NUJserkDJFOI/KI+tEm1k5qAB
	 h0CQV5QfBWMpo8iuCE0NIhmNNpn2bPPb3P9ZYKwqa6fv8C8wtKxnQshVus0L4Up7mygR4
	 S4Z0/76FFeU7TuNjWYOCIxOtyxcWrHIc0mCCPQiYZv/hNC8hY8hu3+aYkvVviP42iCTqd
	 1ZpdOnGtVvzaYcINWxtnNTsnmjasTgY6Ul9W1wkVYYpfcPPam4t0G+J8INj1YA9wHwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qPURsHIq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C560A2606;
	Tue, 27 Oct 2026 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qPURsHIq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9E21F01825;
	Tue, 27 Oct 2026 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113115;
	bh=jkcE8dlNum8RVvPTh5ZR99rnS/ElCtgUg3uiOhWn4Sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=qPURsHIqWy7vh+b2/WqHhT5kVo02CglKoIVIzVUOqgS8vglK2zIblxYZ6VRqzgS0g
	 /UIYykClomQ5Fnlzoz5JRbKjVo1dHt5S5mHT1W++W8TfNuBc5wH8Knhpb87A/AWJbv
	 F89sgq36RvWNG6QJB0ToFu8APjLp9X70YHIwBg2o=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:55 +0100
Subject: [PATCH 15/19] usb: typec: mux: tusb1046: fix oops on accessory
 modes
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
Message-Id: <20261027-llm-usb-v1-15-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2250;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=inOf5Js6PvFXFLTqRCgL/YumeJnBvJsDiRiQs8Z6JpI=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr8Pu8YVOPXGarMEl9vCT785HolcFHvl5W++8ogtB
 nO6vrz+3xHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQATURJimMPr+OhoA4PG41W3
 G0XZEgQfGKZ2hzPMlVA4tO2wmK1JxOodTBEB1kc2LuATBAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

typec_set_mode() passes a state without an alternate mode, and the USB
and accessory modes (TYPEC_MODE_USB2 ... TYPEC_MODE_DEBUG) start at
TYPEC_STATE_MODAL like the states of the alternate modes. TCPM and UCSI
set TYPEC_MODE_AUDIO or TYPEC_MODE_DEBUG when such an accessory is
attached. tusb1046_mux_set() then reads state->alt->svid: plugging in an
analog audio adapter is a NULL pointer dereference.

The numbers must not reach the switch either: TYPEC_MODE_AUDIO has the
value of TYPEC_DP_STATE_D. Without an alternate mode connect the
SuperSpeed lanes for TYPEC_MODE_USB3 and disconnect them for the rest.

Fixes: 7c561b8c3e83 ("usb: typec: mux: Add support for the TUSB1046 crosspoint switch")
Cc: stable <stable@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/mux/tusb1046.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
index 34ef81f75693..a463ba5f53be 100644
--- a/drivers/usb/typec/mux/tusb1046.c
+++ b/drivers/usb/typec/mux/tusb1046.c
@@ -43,11 +43,17 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	struct tusb1046_priv *priv = typec_mux_get_drvdata(mux);
 	struct i2c_client *client = priv->client;
 	struct device *dev = &client->dev;
+	unsigned long req = state->mode;
 	int mode, val, ret = 0;
 
-	if (state->mode >= TYPEC_STATE_MODAL &&
-	    state->alt->svid != USB_TYPEC_DP_SID)
-		return -EINVAL;
+	if (req >= TYPEC_STATE_MODAL) {
+		/* USB and accessory modes: not the DP pin assignments */
+		if (!state->alt)
+			req = req == TYPEC_MODE_USB3 ? TYPEC_STATE_USB :
+						       TYPEC_STATE_SAFE;
+		else if (state->alt->svid != USB_TYPEC_DP_SID)
+			return -EINVAL;
+	}
 
 	dev_dbg(dev, "mux mode requested: %lu\n", state->mode);
 
@@ -60,7 +66,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 		goto out_unlock;
 	}
 
-	switch (state->mode) {
+	switch (req) {
 	case TYPEC_STATE_USB:
 		mode = TUSB1046_CTLSEL_USB3;
 		break;

-- 
2.56.0

