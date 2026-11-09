Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794248317;
	b=ZV5m5Gkcw8f7AsFVE+cFTiKnGOVtfnRho1YtXrMUhjh6LFJ/Jz33UoBlQXPrxw4IhaC/
	 4WBuMJ6C5KioloQBwjg8OEUKhaGcMNhDetwQlxo3xUEyOdl6BAZhu3/2NZIQLmDsqYYqf
	 mOYge2D9qeoIIguF8yK8Pe6Wq+8M+XHAShSJyoluYZJhN6Q4IMJ+7fDvWxc82tQrYidnM
	 lQEpfaX4QnzkVjuaWTLGnunVzrDQmUYqtNoau/nNumyR7fqgAJSgV0WwpyHRSTq/CouiL
	 4ljqjXcyPVYaSTFJMJtFPnSUAkOTjCIDSJw6DGz04a6/zQOsAvZNVrf80pJDlckpYmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248317;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EUIHDJF1HJnlwUwYfUdtmtORr693jDiKk0JRv/rDZfE=;
	b=kkIt7kGNbdVngTkRORjUUknJB5/enUau4+Xbb2DXHI9um9/h12nQKzfw5W2/+JopLekC
	 wwJQAux/+jg7IQ90hxhWk3MAtOWH6cCJAjUHffMQzJkaLWbjkiZ/PLrbxb6Z0whsdyTi9
	 yO9RY1PVZloSAVXyArJspPzgL6QiWgVewClKRHaH+83fAiZ0ZcTPZIyuzVcepl/+3DeEV
	 AbnJi/fHv+SNcTSHPvoRPT7cG9p3NpCBZnYidrc4D9Emf7UZaOiuVM1KNwJAM8dtaViPr
	 gDrTjlvwYx4EMvd7CyxMqUMfISg4vi3gdQnbpkajN1dOdPrLY4RMRlukFQAQNPkkZMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qw6/l9ct";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E07A606A32A;
	Mon,  9 Nov 2026 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qw6/l9ct
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794248317;
	b=IVFFBu6olLKZlTwbrxc/d+EiEexMAbD8jhm6H1Xv808Hq0HghwSBibNZhxLABy1y3MPH
	 06n+ZTLQwi8ecI3djG4klx+2KeRy8IJ+shGcOiK4W5G/zHNGBnyuwzpGoT3aS/XZ3n99H
	 Z1tNFR/JIPu+P5LtH0aDnWqzGY2tMZmqZHfUAEyQtd4RBwUl1BU5/fCYSmTmmveb9gR+Q
	 08i9ht1NKBeCbv41Js1K4piq+NJHRw9G6YWbbdEuhf3OiVnicEpfQa9nqe/HVH4KG7TD/
	 RHLD3vz6+V3z6NxKSKga4p07nAJjXbk8tZROJVYg+FVCLJio9hKuq/i3WGrgTCweBqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794248317;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EUIHDJF1HJnlwUwYfUdtmtORr693jDiKk0JRv/rDZfE=;
	b=sf+LvgXPM6lybgxjqAbL7ilZa+xrWT6ej3FkfUkmIX4FWwv1JTZTvJDyP+4+ZoQBsBYI
	 X34kJd/QbYOMqErlj8AgjE3qlcLK5hKztmXH/+moxF1wxGfM7s6JHYWTcyYCFHCYBeYXY
	 Lgz8fp9SQBvq1rvclcMpaLUVlojnzYHY9N47eG5/cT1c9RlGT2tV+Cw5nApNuC/BFULaC
	 1f9tLvsnxw8mlOas12zfO8P8XU20pcHi5IH0LEcWAL/149IZ6YE4pZcuEW+aixR8paF9K
	 pZ/NiV5MXXlndWTp8LgN3P+yB2li24TZXzdYiq5Gi8DPAWE3oaXWvGGrYlpakpZS/cA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 731891F008A6;
	Mon,  9 Nov 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248317;
	bh=EUIHDJF1HJnlwUwYfUdtmtORr693jDiKk0JRv/rDZfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Qw6/l9cte8OhOx1KyTLb3Vk8Y3fVAc+EAf7I6yMxEFEnxu21qGQW3pmHD/JlyKTZz
	 Qd6c/xYHWx278grXPwssMmz9PXHT/MEhGhzeoTq7YdPWSaz2ntSiL5BDs8PGjB24fX
	 EuiiXqB/bH1XbSLsOzYB84m/FKtPx9B/p4hOvUK67wY0AR6XiunZb9DiI6FLZO+ApW
	 aMnhY4vRCYkj9x32Ne45iEFjjFKM4bC81baq3ZtnCeVSUvYZgWSrHaoZAmZiXWP6Bo
	 +M3RaJXMck+fRB3D8kQnTdmko05/v96g0+l1TbdVOjFp60vtp4n8M1gAGW8iyNh5nG
	 y/nneDf/qPYHg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F2519485BD;
	Mon,  9 Nov 2026 18:18:35 +0000 (UTC)
From: Tin Posavec via B4 Relay <devnull+tin.posavec04.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 19:17:52 +0100
Subject: [PATCH v2 3/3] media: ipu-bridge: Add OV9734 sensor config
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
Message-Id: <20261109-ov9734-ipu6-v2-3-0481b512c4c0@gmail.com>
References: <20261109-ov9734-ipu6-v2-0-0481b512c4c0@gmail.com>
In-Reply-To: <20261109-ov9734-ipu6-v2-0-0481b512c4c0@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Afonso Figuinha <afonso.figuinha@gmail.com>, 
 Tin Posavec <tin.posavec04@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794248315; l=1249;
 i=tin.posavec04@gmail.com; s=20261109; h=from:subject:message-id;
 bh=eQVHwvgwGlO3Yl06SOqVT2v4rEicQFZdXN3NaM0IeJ0=;
 b=jl97J/ClFpJKUhdnSThRmbsWQkTZp/tPO4uLdMJowA4FEgr5/GeMjFXPpM3kLmV07kne5/cg7
 kmN/AHsRazqCMtRtLVLoRl2ycIordoBXYIf+xu63rOW7Xe2SjqgDQOx
X-Developer-Key: i=tin.posavec04@gmail.com; a=ed25519;
 pk=h4O+VaAXzwd3B9L6H8RltugTkzF65lam1c1ls5knAVg=
X-Endpoint-Received: by B4 Relay for tin.posavec04@gmail.com/20261109 with
 auth_id=1463
X-Original-From: Tin Posavec <tin.posavec04@gmail.com>
Reply-To: tin.posavec04@gmail.com
Content-Transfer-Encoding: 7bit

From: Tin Posavec <tin.posavec04@gmail.com>

Add the Omnivision OV9734 (ACPI HID OVTI9734) to the
ipu_supported_sensors[] table, with a single link frequency of 180 MHz,
the only one supported by the ov9734 driver.

The sensor is the RGB camera of the Intel NUC M15 laptop (LAPRC710).
Without this entry ipu-bridge does not create a fwnode graph endpoint
for the sensor, and the camera is not enumerated.

Signed-off-by: Tin Posavec <tin.posavec04@gmail.com>
Tested-by: Afonso Figuinha <afonso.figuinha@gmail.com> # Surface Laptop 1 (IPU3)
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..4982b77de 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -120,6 +120,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Omnivision OV9734 */
+	IPU_SENSOR_CONFIG("OVTI9734", 1, 180000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */

-- 
2.53.0


