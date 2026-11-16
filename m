Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838536;
	b=Ck64Ek0H/O6EWJ3HM0tV6bJ5HKrjf0UKUYMwMIQhb4jCmztL/3mGMkZ+DEdYed9u31Tc
	 cHf8dWynDY/zTf1ZqJB4XRQ5wFs1mjhRX2RQb5IR7TR4LpGq40YRW7S5p/TVCwG/o3vde
	 pWq7MHVYFfOKxNqgo8IAxHT7gHeAxtsljf5kG7IytLcYjR2M+89VTi5Y3CiUSD6dLGffh
	 L9UooANP+GQM3k2pdK2ygVgxQhrCIhXRd8z6Dk6mGuGj4aU484rUV7FKAvveC9YuDyNVF
	 iTmDYDvdhtYJaLG9WK00wYns4QbN4mA9Z6aMJGNpW6QIYMLq1dICTNffqLQJ5zq2Mrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838536;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PRwvJorxkByLGTSFno1Iu5DhwXlwxTrPSjgbw9+lMxI=;
	b=wkbeEr1jPbppvBY4vPUot6EgGTFISlfi58ClmjsSImI8mycdYDdm7t6qJumKMibbNkts
	 qzurRxGRaH1RGaJvgJzRepBApfQEfZUg+FmV/WXgx31eFJhUmmJMJEV55oTSGxWM7yv0O
	 zuhmYAGWss6yt7e3scG74T4VTrwSmHlEWjEb5LiHjSLiD06WZ0/2WSmdIa26OgVI7pMjA
	 3k3At7/1ECctrY022rOZXcWzIHnuqBnngl0Vb9LWyRzSnicNyOTsblqfMoowtctQNEfOv
	 aktyE5+YLSJnv7rO8kTU0gswBZ7L1B3LIKkmjukCJUYNIlh9hpusDN1DLUYd1dL3HVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTP6ZJtL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB94606A336;
	Mon, 16 Nov 2026 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTP6ZJtL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887571F000CA;
	Mon, 16 Nov 2026 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838536;
	bh=PRwvJorxkByLGTSFno1Iu5DhwXlwxTrPSjgbw9+lMxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iTP6ZJtLdVdpd/VbF72VakFFel44De5q9eZV8MHs5WSmwU6X6M18VK+RDB/lBwbzU
	 8886RbprK5AIpxpbR9LKMqh5V3NkpFExHNBlmwwjuR1JDeDfQgulYVUpycuCVKK3tq
	 lCjFqhYzNQLGTegetqNFZEifPnRG36p1zMP7O7PehM1OsYyuurb9KmZZtBNHtZeHVB
	 GsoHwNzQebSawKrXdjEzTjDMrfq8gmtGHnwcTgceC8scsQ8Ff7DjDjSCBGI5AAe+BE
	 wiBSxjg8BRdQLxFeiv7lS4N0mnHN5bByILcV7PYNRg/UEDo2DuilHw/vpM7OOspHUQ
	 ic8XAtYc37vCQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/8] soc: synaptics: Populate SL2610 system controller DT children
Date: Mon, 16 Nov 2026 21:54:40 +0800
Message-ID: <20261116135442.4827-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SL2610 system controller currently creates only its fixed clock,
reset and pinctrl MFD devices. DT children such as the MDIO mmio-mux
therefore never become platform devices, leaving their consumers in
deferred probe indefinitely.

Populate enabled DT children after adding the MFD devices. Use the
managed helper to remove these children before the MFD devices during
teardown and probe-error cleanup.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 drivers/soc/synaptics/sl2610-syscon.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/synaptics/sl2610-syscon.c b/drivers/soc/synaptics/sl2610-syscon.c
index c6fc2955ac0d..b7965f4bb963 100644
--- a/drivers/soc/synaptics/sl2610-syscon.c
+++ b/drivers/soc/synaptics/sl2610-syscon.c
@@ -6,6 +6,7 @@
 #include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
 struct sl2610_syscon_data {
@@ -56,9 +57,14 @@ static const struct sl2610_syscon_data sl2610_cpu_data = {
 static int sl2610_syscon_probe(struct platform_device *pdev)
 {
 	const struct sl2610_syscon_data *data = device_get_match_data(&pdev->dev);
+	int ret;
 
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
-				    data->cells, data->num_cells, NULL, 0, NULL);
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				   data->cells, data->num_cells, NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	return devm_of_platform_populate(&pdev->dev);
 }
 
 static const struct of_device_id sl2610_syscon_of_match[] = {
-- 
2.55.0

