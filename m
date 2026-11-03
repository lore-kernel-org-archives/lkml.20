Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705779;
	b=5enlDcY+2j2AshV95V759eFloKovLsCaX4lcxS0dqRQUVEq9DQjt0Jl8YTUw8SkW4HQo
	 rtJFvBE8M8cMog0AOirP4UtrCTavgT9mXDTI14Sc6VFgq39wUembAKORgd51vawwljxmN
	 DhN6vYhJ6XbVO+FdnvlpMPz7lLo6RVxMj5cVRHmRsF+DoBzFaX2emE8Wtf/fkcJQ52o1z
	 u/MyuapqHipEcVZWTvwioiYmkJQx6KPG2ljM4Um8jq2gLPXWyXbZxFXMnS5rvGMWcHBCD
	 eKqBXcXCCifw9OhUQfJ6C8kxSHkFKzErrLw/5Qq1uizhVNnCzNehLkOxG5mbI9Xh6Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705779;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=c1MqLsdZLfJXru7WWFpoL/bAGrI6oga7tiCox+Jwpew=;
	b=oBsTE8hr2GsM9slJHznrQizCU6f8KfqcsxRABI5ZnJyJKJ7vCPFrHF/RnQ7hPFQVDyxn
	 5anfNv3sdjv3NOdVl9Uc1QPhij/aG7UQLyiq5IBvZYLQaZUSlQiqPbcAU1hJqTmNwrU8l
	 N76S6OtAwF/zUhfuLWXcDhiHIOqyI+f9seBpNOjEXapGYxdxzA/NYhR9p3TWFl5h4AYVv
	 7POthpxWeXui/Uo//i+peteMmb16tmjNAMI14kfSLpsd1UrVrLdDJBiFFlPQtcPszpXof
	 +4Auvx7Pr81X55AUEpD0A/rsPGr+trtUht+ORwy46Elxon69eLDBBMx8EMcUDDQbyUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PA7HwPP7;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA86082BEB;
	Tue,  3 Nov 2026 11:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83BA86082BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PA7HwPP7
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D1221F37;
	Tue,  3 Nov 2026 12:33:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705634;
	bh=PqS2ruK7frGkC0TCq9Vxb5F4GJ8X3qRXVBnADO5zlCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PA7HwPP713o5ZrPurkqsJc7F7kx+HyLJpiph+MSzeV7Elf08n4ilzQ7mfsnSpk8to
	 8F3/rTNRNvqpi3IXLM9Z3i/ouuzA1fkqEB47AYRVsq/XrNgxNDAGxc0I07V+hgTw+Z
	 M3lNfVfNTz7GNMRxdLSwItNPL6D4ZOCJSm4jYErQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:33 +0200
Subject: [PATCH v5 13/15] drm/tidss: Add support for AM62P display
 subsystem
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
Message-Id: <20261103-beagley-ai-display-v5-13-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nQs3IwWopJPpCONI45Cyuco5UVYrRBdHvpe+bDQ95yk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6cca65axinlSiBbteoGzJR3wpLtcFhjJWSwnD
 RuFNAUm4S2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHGgAKCRD6PaqMvJYe
 9cBYD/47Pn1bCaMx0NbtKo1mrQGgueUJmrlI4qYyUVbp7dgQvEMnquROrMzH9ZQnDh7A5vprGE0
 MCIpdbfSwJLWoYbXvIpgIqdysZducF9YL+u39rhRWiSznOCC5rbc5feqf/tYXfr08pC2f2BH6AL
 dzaI6aATY/2/1T/TWwv9PxxAdZl62/sZUfC2pnCuOqddkQyECmkQ+Chs5XDR4uPjpapR8x93CYj
 N5eTmitx4gRp6n8vpvbWtdwV0EEHpKBSbRzn7jqiLxW31dPZ6EWtDTo1o3MnWvOvrELQKC60FjW
 8f7A6bBDsG7thJ48zfzMOe6TWXA8C4Tdmmm3lNkYNVDoQEnKJmg6c3/qDOnwl/jQp7twcGwkUeO
 suks5rTINlcfUwv0m+3mjmm9wHtK1pm7Ccmbybc+iB6+H/c2Hr7OKuiPLmcOAMO9Z7LUSNXg/C8
 0Q4OkoOrfjXaWDrR9zCSqE9CZHrhIZm9fbnT+LP0KxERrZD0M1JR7f/5DZnJrgpH7ggDfM9t6a5
 Co5aNfs2fmZHr5W+oxejKY4HrOp1JE4G8uVBf5PGaLRgguIxO4hilqE3ziqJivdJFlf98noBAoj
 9AxtHzm5QOrjiqy7imDWoWocsv+1IJeL+4glwDesBDM9Rea/RXAUBa3mC4F1PgA4uVbTDWd/ZAl
 Us9VmOIagxPTB3w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Swamil Jain <s-jain1@ti.com>

The DSS controller on TI's AM62P SoC features two instances of the TI
DSS. Each DSS instance supports two video ports, similar to the DSS
controller found on the TI AM62X SoC. This allows three independent
video streams to be supported: OLDI, DPI, and DSI.

Since the DSS instances on AM62P are architecturally similar to those
on the AM62X DSS controller, the existing dispc_am625_feats
configuration can be reused for the AM62P DSS support.

This commit adds the necessary device tree compatibility entry for
"ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
thereby enabling DSS support on AM62P devices.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 7e7f2ba6ae82..86b7596ab628 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -240,6 +240,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
+	{ .compatible = "ti,am62p-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }

-- 
2.43.0

