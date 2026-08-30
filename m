Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68972321420;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121184; cv=none; b=Xs2pxRmIt2gVrS62hWZNrCmcxtJdWZNAqeiDQB01CjgMSEVZRC2FVaqcmKQFKqmJs9qLhv1kGFzPw+AvrfSFB+0GvHIgpGaGP17ECemiGRKiD2VxEAGPuCwYxOqUnKVepZkav3vyidW39NAXAJJh4/vX81Egp0mQR3zBReQTRYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121184; c=relaxed/simple;
	bh=dVz3sxP5vavj12E7kkybYYbfTtTMRNdpjA2Sq4nGu8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Np7ucnQTyN3iXcKkne+ElqrZpKranVHww67YMtFMqJ1LLJtJ036JRz5i6kehQsVqcM43V1QyhXIcey+TRDobdk2P/U0HYLa8XzZIh6Ch8t3JBfUdn+KG5uxdWCavA0Aeiy8BFXAH7Wg3+WU7UcOxoaAkSLlZlKy/1C0VToZDglk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXu80ghK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXu80ghK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37033C32781;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=dVz3sxP5vavj12E7kkybYYbfTtTMRNdpjA2Sq4nGu8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tXu80ghK4IRb1eEhdtZ2u6/bPoKAg/xirRKLAxmWVNlHXTeTKfUoxV+cCJ/PSf4Hi
	 Fpxt3QT7lnhQOswOKVw+hmj77dJ8wI3U3Zi4PcRU65AX6cdYoLclMmvrD9jPOq6x3P
	 2JPYIeB8FnrOIHNrYqbbI8IYNaXWuUe6vYMTRxs/FeOhe+Own5rsHuayz7Jg+Jx4dU
	 hxWrfuSJCbS1wLsHhiOgp9XggsMVYo75DwubcQYK82SA6ikPHMfa4JOCxVnrdDuGe1
	 UedLxqZM/aLAihWWkf5lzsci7yJVT/oZzsCLzyGiP07agQBdtLXejAaVJEEE4ZOWXb
	 uGMf/FhocN21g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A9EC61DE2;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:25 +0200
Subject: [PATCH 07/19] thunderbolt: Don't read the UID if we already know
 it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-7-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=dVz3sxP5vavj12E7kkybYYbfTtTMRNdpjA2Sq4nGu8k=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCWEHI31Y/sqHXRNsDqvs+ZK+//CSLoNZ3yborZ/m0
 LNIRXhNRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAi8m8YGZZb1coYeZ/ee7gz
 89ENte74xapOrX4blglPYVm4Jv2S7FFGhu1hJ8TmxivM+X1t03/nT41XLbRuWt77xti2857VNfV
 wLWYA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

On Apple Silicon the host router's UID comes from the DROM provided by
the device tree and is already known by the time tb_switch_set_uuid()
runs. Skip reading it from the config space again in that case.

For other USB4 hosts this only drops a duplicate read because
tb_drom_host_read() has already filled in the UID from ROUTER_CS_7
before tb_switch_set_uuid() runs. Device routers keep reading it
unconditionally.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/switch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 404c0693df50..3f54a5ae56b0 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2692,9 +2692,11 @@ static int tb_switch_set_uuid(struct tb_switch *sw)
 		return 0;
 
 	if (tb_switch_is_usb4(sw)) {
-		ret = usb4_switch_read_uid(sw, &sw->uid);
-		if (ret)
-			return ret;
+		if (tb_route(sw) || !sw->uid) {
+			ret = usb4_switch_read_uid(sw, &sw->uid);
+			if (ret)
+				return ret;
+		}
 		uid = true;
 	} else {
 		/*

-- 
2.55.0


