Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113114;
	b=bmy7PMjjy7H4HGGoTIQV9gI0WALDYhBsXnINHwz+UjYq+Yme+20PbTGX9yJS64UssW6F
	 I9reIDvhXcd5qZRN3sT+3pEkpHG2e9oglF1B2eJbU4UGD2txuHt0QfzVc8lt3l+oHM4Us
	 KWUJwqMNGd9RvvJ+rA3DOrQLZIMij7UOtxnn2cj6vMTgbAdwZi3c35LXFYM/4L2NQrVYz
	 P+GQDENcdqqN/LKgXkPnb/7aEjs8o5Aev4Pp3sPYp3eawYwLv6H7JEhiMSWM5w6SIKErz
	 Av6BkctYGMM3+9d8ZWVolp4vV7IrWixCsQRx0HMmq+Cy9ns1MYP+Vmvlkiy6xFtO0yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113114;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=g+E9r6R072S2JWZoJdvZHF5zoxMw/Bs5LeJOSB0+PjU=;
	b=JW2PXcCLEvo2hNNg6MHcbRBqygMGsD6LZ6lT6vLTtqa5nqHtWMPFdgh2VLt3uLQC5LRr
	 bEkROu66yTW7ksUgxmSkUIvm+NmAWoXQcrEGYm7P4Cpujp55U9P/KFTfhKUaKgfU18GYj
	 mxgFD71YEog4CyiRIyId4LSSs1/gu6LINmpa727wdUfFXM9adTxwnRXs1hXLdf2A1OXnL
	 wJaEHQyAN4F7+Y+SoZIT16J15zFdxK5P2bhH8e0RYxaWBnXtBz/eauLutZjE08bIG9XkO
	 Fsodqm6co2b0vwL1QSeTLh0FYe2t/yvYsJCn629Shv0PnqYEkGNKQmsXQb81JS5XyVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="hraG7/ru";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77FE60A6F4E;
	Tue, 27 Oct 2026 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=hraG7/ru
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832871F031E2;
	Tue, 27 Oct 2026 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113113;
	bh=g+E9r6R072S2JWZoJdvZHF5zoxMw/Bs5LeJOSB0+PjU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hraG7/rui8cTIErt5t8WaWVYPdzGK6GzYR5mG3lsijpL+x/6bLZTOh3khzmcrf+5h
	 HDa3GnocZ9xLvWB4vRaENip2tW5osmqeXhqOls4JQFcfXg7ZzuwYoaz/0hxbQfIdJf
	 qMe2MvKhRyD4JoIdvjnTQ1hr5rhcVWg5lyp0hSmc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:54 +0100
Subject: [PATCH 14/19] usb: typec: mux: it5205: fix oops on accessory modes
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
Message-Id: <20261027-llm-usb-v1-14-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=XQqp6YmHkvU+lFtuB4zVmvhNTzODQFjVWlDGL/tkpxQ=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr/frhgmt81DcfWigEdcn0yzuLeoN9vk2cqXN+7QP
 ne/0ourI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACbCYcAwP57B9Wv3j/TIlfMl
 N+pMEH50ojkpnWHBPF8XpZ9OO6dsPrI+pHDew+llOstjAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

typec_set_mode() passes a state without an alternate mode, and the USB
and accessory modes (TYPEC_MODE_USB2 ... TYPEC_MODE_DEBUG) start at
TYPEC_STATE_MODAL like the states of the alternate modes. TCPM and UCSI
set TYPEC_MODE_AUDIO or TYPEC_MODE_DEBUG when such an accessory is
attached. it5205_mux_set() then reads state->alt->svid: plugging in an
analog audio adapter is a NULL pointer dereference.

The numbers must not reach the switch either: TYPEC_MODE_AUDIO has the
value of TYPEC_DP_STATE_D. Without an alternate mode connect the
SuperSpeed lanes for TYPEC_MODE_USB3 and disconnect them for the rest.

Fixes: 41fe9ea1696c ("usb: typec: mux: Add ITE IT5205 Alternate Mode Passive MUX driver")
Cc: stable <stable@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/mux/it5205.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/mux/it5205.c b/drivers/usb/typec/mux/it5205.c
index 2ab2ba6a3cbd..00d5bd55e423 100644
--- a/drivers/usb/typec/mux/it5205.c
+++ b/drivers/usb/typec/mux/it5205.c
@@ -92,13 +92,19 @@ static int it5205_switch_set(struct typec_switch_dev *sw, enum typec_orientation
 static int it5205_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
 {
 	struct it5205 *it = typec_mux_get_drvdata(mux);
+	unsigned long mode = state->mode;
 	u8 val;
 
-	if (state->mode >= TYPEC_STATE_MODAL &&
-	    state->alt->svid != USB_TYPEC_DP_SID)
-		return -EINVAL;
+	if (mode >= TYPEC_STATE_MODAL) {
+		/* USB and accessory modes: not the DP pin assignments */
+		if (!state->alt)
+			mode = mode == TYPEC_MODE_USB3 ? TYPEC_STATE_USB :
+							 TYPEC_STATE_SAFE;
+		else if (state->alt->svid != USB_TYPEC_DP_SID)
+			return -EINVAL;
+	}
 
-	switch (state->mode) {
+	switch (mode) {
 	case TYPEC_STATE_USB:
 		val = IT5205_USB;
 		break;

-- 
2.56.0

