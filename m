Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792965250;
	b=sNdSzPCRDpo9uuEQpVIlz/rV8gJET2YsCNLSdeo3+Ii3afz972notZwhGm7w3hZ1bH2H
	 pcde8cGXUN3Dxg84Yc8XXWwFPSs/mXInnPmwTNE+eZ/DlmZUqzV0q5btIhXpXmj99nRpt
	 mPU33xK9J6H7IntQd/iYCKAfCba5tC7/7rJK2k2TGGsbkcx/YY20BzCJQN9rDCrhM/PYd
	 AWv6ObLvXa3JVaAyac/IeSGLU7SelvEoaIUz5L/4guG0cVgCvvMXZbOCKpJYEsNkZKgi/
	 B0U6sG2p87b+Q3/bWPRFtSJCn6I2nnOTCeyljf8UPwboG+H2YSBAjyP8wO0WBxSR27Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965250;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Nuq7MU3cVWezrN42I9uBwDrHZrV36YTul38Xu0nT4BY=;
	b=op7R3Um/s8HZyVb0iKBOcFhPmQWn37Yz8s3vBmpKDazF2JgGKxMtWp9960qxUSwiuXCj
	 WvRpiUCofCq9997HNOJwHCQds8/9xJggb6lbZWJUiZXf4AmelKkTpOzo5RRoB4CABwsKl
	 02LjFEblZZSNpTJqy1Mpf/XByJwK4cwwqbNTQmUQXJ+luPZcGiv23PzrV5XQW31gv4jN/
	 h6McmNM8/wwgNEEnP3H3ueQ26baOu8V+slmF573IL4teuYmdYV/EMSXSkCDw4Q7xU5Hhw
	 ydyHmO3M0Zm9VKNOartamt8rmzmUjKB62L87Ra7Yclvcm1Elb9Fx2SAhmm1AYDXtqKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZL2ACjcY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93F606A31A;
	Sun, 25 Oct 2026 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZL2ACjcY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792965249;
	b=Y/dvNagl+EGj3Eq7PjffL97F0KLUPjqJeM8fSGQ/80+KMjahIXRHepZZzJ4EWt1R6Wqy
	 FVY5H21+M6O1jY+PtVXKJwT06cLhwtwCd9lljXjPkjsTw/HLAm6UGCTl5azZtqfojvKU6
	 gyNTPMXJFYi9Gr9ZQk1S514xl05LcnT8U24g3MmGCtAlWybsf3zWEAylJfS+TefIVDnJo
	 TOjSyfxxxW81gphkStGQg3AhpWjobsoGQYsUfzWhC+vzoKb1q6ZJ2HJECe5ZDF364TxKN
	 A1XGxxIl2+pq4i/Ftqa6wQtWb6NKZxj4gv0bZnHtJ1Rc9KWxf1wFDAo+MOzsz4y0kHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792965249;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Nuq7MU3cVWezrN42I9uBwDrHZrV36YTul38Xu0nT4BY=;
	b=rvKUdYMi6TnMb3kc9UCOWmZs2x86pMEhYLDg/ZBA8LVkjLRIUjAH8ntkaBRNIc/yEl8w
	 gj1vTbIu2Pik4cnllcs2AEU8cvq9ytzei1si8ZnVMiibZMZAAdm4eA6mDOVNixHZJKtlk
	 Hy00GC+Xd6tVmWzWJ/sf5GPVXDfxuzSCbQSPjzQExtJLWhEUDKysqvcJcL4PMIwzEcVbo
	 ohOi/NbxO4luwR23H5YNvnqJs+kAH5s3nOFznL3XmDmk8dX/GiVcH8A3VaMSyB3c73daJ
	 KUi9iVrNmiKwKOZ9w/MD0G0rKWGuWGyu77hsBYUQA9PAm0PYqGz+oCoa5bZdDOQjWkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 703891F01825;
	Sun, 25 Oct 2026 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792965249;
	bh=Nuq7MU3cVWezrN42I9uBwDrHZrV36YTul38Xu0nT4BY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ZL2ACjcYXaSjsR9ASSRroWcwRTvQOPTSYFgb+9AWRDZ48bFu6hDLt7ECM20v1yDGV
	 eQz1jDt3r6v8MSmsrnLVK+mawjVa9YpJWNinPgmwPS7E+iGWXKT2qO7v2SEsZd9CWm
	 YqbH31m+9PG8OFPsHW13a1voRtmLkUG+z309eI+vRrOXUNTJn8XO40eXba8qnjdFJH
	 exP6Y35ym26FAjrNsd0df+jz6P9rl+zh4FgXhIBz48/6VFQyXBEA7mPq7LfFhoOcQi
	 4gei2fIzJt7l1PjQ8NYn3VlnGN9qfPDWACxs5eYc5ON8JApAFNP8sm71QRpM11skTf
	 dmFQnWRt/DTwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BD1F444ACE;
	Sun, 25 Oct 2026 21:54:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 25 Oct 2026 22:54:01 +0100
Subject: [PATCH] usb: typec: tcpm: qcom: Release the connector fwnode
 reference
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
Message-Id: <20261025-typec-of-fix-v1-1-06bfc16a7846@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrE1SbdC4ilhQg7FopUWIuLti+
 b3k/RcE8kwBquQCTzsHdjYiSxMwU2tHQu6jQQpZZELmuJ4LGXQDDnygLlWnWqNzLRTEy+Ipzl+
 ubn6HrZvJrG8D7vsBbJNlm3AAAAA=
X-Change-ID: 20261025-typec-of-fix-873b3ac85803
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Selby Mashiki <mashikiselby@gmail.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=wXV9haqapMKGQNSewUN4c3h43256Fd/Lnk+wuYRTZWM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq3np/VtuNlfdNDQsmOnb1DMkwGZSlfij8G1UNP
 ZraDEArBESJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCat56fwAKCRBgAj/E00kg
 cv4xEAC7j7ZSblq50tssC6MUVCJEF1l2TMGXXMZ45V+mqK0KjPmOPQA9n4IwLRS7ozvSt4vPiHm
 38nwy+jX4nNQ9H3P3G/BRimv77x6gAZYm8OCUNA8EAcWBNLgLGSH+sI21ADgkSZVs7p4gwobujX
 9aQ/IMv0OwFlX+y1WTGmeDWKqZ83CcH+d698YBzrxK2nZmzHoY688BZtxb4kxfhVmt9LhS7+DCJ
 Scl3AAVpgvopiSzyMhGmczr9vepjUvDYUz9rHZGZ12VfEc8LMoOr5/dSU/q73uvczXB2G7hqv2G
 4+eycz1FnXAoN3SaMdwj4kBr390Socw4z/esA4LJJEBeDoY5UL2C1UuUoPLrTANUn0mdS37wVb5
 jfh7vjK6kGtf42Xpaa7ONty9fKasg38OLMUW9nguWxV+69SyNGKKlCmNJRJufteySqwNmBn70cA
 eRhd430VxRsyQky5DGlyGLb1dszaXPST08chtDKFHSaJBl/7NceomcUTu48TS1pB695kKjtWi53
 Kpa5KAmZsB0yQ7HYChtHePhFjIMxpy87hB+r6H7AxrDj1V4u+wiWJ6K23u+4bDEM2dE0YQlW8Nh
 NbU9//nD1nTNqGz78w+Zvx0QnuqT6Nkf232BmMe6718ucwygX8Qf7/GJdfDHhaWaGwcBI5wqAOS
 683ql/eLubxDDsQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

device_get_named_child_node() returns the connector node with its
reference count incremented, but the port probe never drops it. The node
is only needed for the VBUS regulator lookup, so release it right after.

Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Separated from (for stable):

https://lore.kernel.org/all/20260926-typec-v1-0-31adc19f32c6@ixit.cz/
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index d3523435f3e01..6029d51db4393 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -5,16 +5,17 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/workqueue.h>
 
@@ -728,16 +729,17 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 
 	connector = device_get_named_child_node(dev, "connector");
 	if (!connector)
 		return -EINVAL;
 
 	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
 								   to_of_node(connector),
 								   "vbus");
+	fwnode_handle_put(connector);
 	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
 		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
 		return PTR_ERR(pmic_typec_port->vdd_vbus);
 
 	pmic_typec_port->dev = dev;
 	pmic_typec_port->base = base;
 	pmic_typec_port->regmap = regmap;

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261025-typec-of-fix-873b3ac85803

Best regards,
--  
David Heidelberg <david@ixit.cz>


