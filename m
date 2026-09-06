Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19E63CA48E;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719828; cv=none; b=GP1OV7o86docP44uNdwCULEKwhKrvLWxZhMlqD3zxESUmVeXohf0Dwq0i6RUo2lZBtMaMzEx3KPZFydsc8OB8eGcVtIB/BYIXNX6+vLiKYFXWF/ZKDLAmCyLVm7jf4eZBB1vqImVU/Kws7IkvoTK7PXYsIoBj7zVIi4kkxzee+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719828; c=relaxed/simple;
	bh=nAvvsoDo0FnW497Le/eu1wxUngPW7Yw1+XhupbJs0xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKCoyLaOTqDcs9lVCwIfQWTu8nIUlCK3ZzROoXk+BUKL7HxNd5w8KrqApyJkTBDug8ACNOcD1hOJA/LI+kWbTDC0ejBWDFZruqrBfbSiUxJ4OFIlcPDVOjY2eA6IFthNgKw8gO14JeVsMurEsUD1SW9t+Xi5Qx7yfxJ5dYEjALc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ng91M1NW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ng91M1NW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4385C2BCFF;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=nAvvsoDo0FnW497Le/eu1wxUngPW7Yw1+XhupbJs0xU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ng91M1NWr74/M+6TxNpdBaMm6WIRW4iPdEgAMHzkp8Vm4B6Pugj/LuI9FMeZQZOcn
	 JLyhUG56klS+puycggm74hdhwcEHe62sT6G7DIULKGrLOCY7EyCcFY8VOlo0R+ATK0
	 VUrbZeDg/tzjzWUrAUcEW8gy2YgDUApTBJLySugf44hXEHvdv7fwKGOAFBhOop9Atl
	 gtMjnpo1cGl5sEby2ctfLBtqjbs8WyeUrXkhaUP6JB70YKZuf/u8IlVZBrLvVWXohh
	 AbbGWBKFIhyh18z3bbTi93wwJlNdRZ7vHRHGHIHKsrTYrEs8S8y+GQlUv+UlZJUKqe
	 u0feJkOnt2RDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FAFC79F85;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:31 +0200
Subject: [PATCH v2 08/22] thunderbolt: Don't read the UID if we already
 know it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-8-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=nAvvsoDo0FnW497Le/eu1wxUngPW7Yw1+XhupbJs0xU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTft1bIN3s71O0l644+DSY66WJwU0J+ZPd2KNX6Jp8
 2rWPMMLHaUsDGJcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJbJrDyPCP8cBJFrGu0xry
 bS2MqjJ5+b1LWh7XS5bY7Ol+1/NbUIuR4cFSFi6ZL3ExVSc9XOZEKQpxTJogVW5WPvXiadWgyyp
 yPAA=
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
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
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


