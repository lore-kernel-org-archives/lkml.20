Received: from smtp-outgoing-1801.laposte.net (smtp-outgoing-1801.laposte.net [160.92.124.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9F48B397
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206464; cv=none; b=LnRo8YNtIc2kMuUoyBkTIHM/TjNFBXbOwXPaIz+iF0MX/P5+JsRfxlJlitihQk8hJ75Yt4/UwDkIH723gmzrldCpRxV1jvUBRA0M0sNPVV3Z8a5yAA33GZVu/ivKESuaSAcxibV/SU0JY1XLiOKVm0VZW9TEyxoXDEzW5X2ctjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206464; c=relaxed/simple;
	bh=mKSZKMuL4Yjx+hBwcc91D5xCsNIkW/TINPNYcNOWD3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vlz7ijccdfDAki8w+D4xuM2Nb/RZK/I1eJHfI5JxdKbT5inwemLBWwku/pALtcA3w6cLkk3EaBZPXb9UXXTMRGm37DQhp8410s1MbWjQogbnBzrBTMvl4am6Ow1WZIyoHQd2UyLj74tuDRkeeYvVqb1ODNDED6FpQJtOPKRcjLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=IkWx4sj/; arc=none smtp.client-ip=160.92.124.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="IkWx4sj/"
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Ph5Hf6z16Hmh","contextId":
 "6dc183b0-45fd-4196-86cc-3a57a4eb010c"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0105.laposte.net (SMTP Server) with ESMTP id 4hz0Ph5Hf6z16Hmh;
	Mon,  5 Oct 2026 15:20:40 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Ph1YJXz16Hmd","contextId":
 "54a855dc-25b4-4cb1-9e26-1a4ba3db4ec8"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from [10.199.42.99] (unknown [147.161.232.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0105.laposte.net (SMTP Server) with ESMTPSA id 4hz0Ph1YJXz16Hmd;
	Mon,  5 Oct 2026 15:20:40 +0200 (CEST)
Message-ID: <e416c2c7-4a10-4061-bbb9-cb1aa5958798@laposte.net>
Date: Mon, 5 Oct 2026 15:20:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] usb: typec: displayport: defer instead of failing when the
 port is not DFP
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20261005125645.17899-1-jean-francois.bobier@laposte.net>
Content-Language: fr
From: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
In-Reply-To: <20261005125645.17899-1-jean-francois.bobier@laposte.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1791206442; bh=mKSZKMuL4Yjx+hBwcc91D5xCsNIkW/TINPNYcNOWD3g=; h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=IkWx4sj/QmyCZbAs0/cRiqBfDj3tc6C6HevK75eGdYrBo1w11y53SgVC0zbPxVfVKmZ7CsUHgGpRpPvEwizWoy326uWrCvvGgZiWoKYnX5GJSWC6c1Y3/gaQJns/vnf/qGP8Xtbfb3O2tI25nG218Z+u5yUpAzR7ZmIoszja4opvZzdQBV0Drx/Uav3WUj2dJsmznSHXtdDRuYm7PL+8/wo2h5JZsOv9en11Mv4muNxWG1iCrMuIJiw30w2rhOc8sQjg0JbWt8dwk8pO0o7D0QV32c2lc3Jp4AEAEaKW0n17+ZYHnZwsVVNyj7Kwn18TRf0MZcmt4QfI9OrnggYLPQ==;

dp_altmode_probe() rejects a port that is not yet TYPEC_HOST with
-EPROTO. That is a permanent failure: the altmode device stays bound to
nothing and the driver core never retries it.

The role is not stable at that point. With a dock, the partner's
alternate modes are registered while the port is still UFP and the
data-role swap happens afterwards, so whether DisplayPort comes up at
all depends on the altmode happening to be registered a second time
after the swap. On the OnePlus 8T this made DP-over-USB-C work on some
attaches and not others, with "dp_altmode: probe ... failed with error
-71" as the only clue.

Return -EPROBE_DEFER so the core retries once the role settles, and
release the plug altmode reference obtained earlier in the function
before doing so -- the very next check in this same function already
follows that convention on its own early-return path. The leak existed
on the original -EPROTO path too, but turning a one-shot terminal
failure into a retried EPROBE_DEFER means it would otherwise repeat on
every deferred probe attempt instead of happening once.

Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
---
Changes in v2:
- Release the plug altmode reference before the new -EPROBE_DEFER
   return, matching the convention the next check in the same function
   already follows. Not present in v1; found while re-checking usb-next
   for related in-flight work after v1 was sent, which turned up a
   since-stalled June 2026 patch proposing the same cleanup on the
   original -EPROTO path (https://ratatoskr.run/lkml/2026/06/17182803/t).
   That patch hasn't landed, so this isn't a duplicate, but credit for
   spotting the leak belongs there, not here.

  drivers/usb/typec/altmodes/displayport.c | 18 +++++++++++++++---
  1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c 
b/drivers/usb/typec/altmodes/displayport.c
index 51c92dd88..91d72789e 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -766,9 +766,21 @@ int dp_altmode_probe(struct typec_altmode *alt)
  	struct dp_altmode *dp;
  	u32 cap = DP_CAP_CAPABILITY(alt->vdo);

-	/* Port can only be DFP_U. */
-	if (typec_altmode_get_data_role(alt) != TYPEC_HOST)
-		return -EPROTO;
+	/*
+	 * Port can only be DFP_U.
+	 *
+	 * Defer rather than reject: on a dock the partner registers its
+	 * altmodes while the port is still UFP, so a hard -EPROTO here drops
+	 * the DisplayPort altmode permanently and nothing retries it --
+	 * binding then depends on the altmode happening to be re-registered
+	 * after the data-role swap. -EPROBE_DEFER makes the driver core retry
+	 * once the role settles, which is deterministic and stops logging a
+	 * failure for an ordinary ordering race.
+	 */
+	if (typec_altmode_get_data_role(alt) != TYPEC_HOST) {
+		typec_altmode_put_plug(plug);
+		return -EPROBE_DEFER;
+	}

  	/* Make sure we have compatible pin configurations */
  	if (!(DP_CAP_PIN_ASSIGN_DFP_D(port->vdo) &
-- 
2.55.0
