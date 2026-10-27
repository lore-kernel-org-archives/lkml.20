Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113110;
	b=5cBAB4WF5ZRZEUGD1VraQZ6ZQMSn89NCyno79ngpZEkFA4HVKarGc0sahhtn1+3mZrT8
	 qMXDbnVr3No2InGLwx2RHJoCYg5S9yVqP5pbT/BOyz7OJ6j3Jp0GjVpGnAVNX0tCQ9AvU
	 rPKu+1mpSyEDeekydzquMuTvGlbDrx8jUAS+2EamCxjOtvZnriE75fuQW5THh1DTzl11a
	 RUyRt15TDLn4G0AHfLLKCbBH00NZSrv8uRMDKcODj+QUcDutmLei4XV5wLEkn1SJsYbSV
	 wfCxAfrXO3GBNV1ueblifU56+Q5ckgsinoewQpB2pFNUC6G10v1og2nLpYynQtfWhVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113110;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2baGXFs5x7SBGxnUy0sRu/ENXxQGh1g07aJbyLwcNBk=;
	b=UaTEVejCHBhhiKAAXiQYsr+3VUVwgxzIET0mSfEWz3fQ9gSe4Ya3dpdymLtxaYew58ms
	 IIW6Ii2ONAEy5C+tFKt3eq8TZxDlQ91GIfj/EKgciqZTtgxXplK2JASIlaznxnkmt5gx+
	 SaWbqmgaRxr+16vkL6wLeFe57fEbzkRkBmlrp4MsJpJUoTcNbE8/YE4QRtiJZONajvgCC
	 qRsEUcL2u8J6t1AilMOXbkUgYFENZvwPVCVb/HZVjIqtCrYlzduy6Fswp9HxUdeoyKYG2
	 5nQN6r/ocp0Xbuxh9ckOOt3otWfNos1NHxK9zIcOiFCqJOwe7bywQkKpb1vD6lpo8kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fVsh5aA1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5F60A263E;
	Tue, 27 Oct 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fVsh5aA1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84101F031E4;
	Tue, 27 Oct 2026 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113110;
	bh=2baGXFs5x7SBGxnUy0sRu/ENXxQGh1g07aJbyLwcNBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fVsh5aA1cdhn7bUKlIf4+snM4h+Vbr5Km6LmKTBuuoBf6+0NkB+u3fCWbvs+itfLr
	 fLM1JAJRziLWPf5i9kphsh8d1gpFNKcFnJBrxPZ9VW2KenA2JIrXZOlArsEqsh5k1H
	 vAC2FAzv8L+L+VRFYjLeO+R5g3/hbsIsrqF5vvtk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:53 +0100
Subject: [PATCH 13/19] usb: typec: anx7411: zero on-stack alt mode
 descriptors
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
Message-Id: <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=b5rKabsfSBbUleb1plvF6gVWeYK1MY6iIxFiYsW2aLQ=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr/fr3DzT76dmMzSaa5qewofz2CevYRxOluHpJJWw
 j/h8EdrO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAijy4xLJjX3JdzrHzNAT0G
 voovM/RZFt91aGaYKz8loOnT+RWvEo5eEwk4XCO5vWtGEAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

typec_port_register_altmodes() and anx7411_typec_register_altmode() fill a
struct typec_altmode_desc on the stack member by member: svid, vdo, mode.
typec_register_altmode() reads three more members:

 - inactive: a port alternate mode is registered with active = !inactive.
   If the byte of stack garbage is not 0, the mode starts disabled and
   typec_altmode_enter() refuses it with -EPERM until somebody writes to
   the "active" attribute of the port;
 - mode_selection: the DisplayPort and Thunderbolt drivers enter the mode
   on their own only if it is false. For the partner alternate modes of
   anx7411, garbage there means that the mode is never entered;
 - roles: decides what supported_roles of the port alternate mode shows.

typec_port_register_altmodes() is what tcpm and anx7411 register the
alternate modes of their ports with.
CONFIG_INIT_STACK_ALL_ZERO=y hides the problem.

Fixes: 183b194d8fb6 ("usb: typec: Make active on port altmode writable")
Fixes: be727d400066 ("usb: typec: Introduce mode_selection bit")
Fixes: 7b458a4c5d73 ("usb: typec: Add typec_port_register_altmodes()")
Cc: stable <stable@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/anx7411.c | 2 +-
 drivers/usb/typec/class.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 06c25af094b3..ac122ab3175a 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -552,7 +552,7 @@ static int anx7411_typec_register_altmode(struct anx7411_data *ctx,
 					  int svid, int vdo)
 {
 	struct device *dev = &ctx->spi_client->dev;
-	struct typec_altmode_desc desc;
+	struct typec_altmode_desc desc = {};
 	int err;
 	int i;
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 54c7810b563b..9d9703c70820 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2684,7 +2684,7 @@ void typec_port_register_altmodes(struct typec_port *port,
 	struct typec_altmode **altmodes, size_t n)
 {
 	struct fwnode_handle *child;
-	struct typec_altmode_desc desc;
+	struct typec_altmode_desc desc = {};
 	struct typec_altmode *alt;
 	size_t index = 0;
 	u16 svid;

-- 
2.56.0

