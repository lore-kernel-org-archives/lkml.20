Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584883;
	b=b/bENVKfK5Z2X9lr0uvK+azvzqltCDBlUkA+sR4/krfcQXWnYAD7yrJa8AVD+KOkXD/m
	 B4+yDp53HOcHoCm+iIxYBOdGh2ZVxY9WgTr4ylYhAZ4TilsRhJa+cvJwL4CXS1+1iYlwX
	 t2oWe1j1Ap5QRsQoBAffdKoV+QaFY6gYZpppugIRWZoTlvac6jU6DZQ9HjDViCqzwEQ/Y
	 VvvM/rrfKJQvA4XCg8T89X0JFmi1kbIYwIzi+H2F0P5f3kh82rT3HHmuZ9er9b65z8xdK
	 P6O5ngb9vRaNKPwUjaH+t1KoAtLfAGjNrkJYAcKvIxAyVVg5gMGQBgXEgNS2glIBKrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584883;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gqg9AUkKMFzGjca4P8T0j7dfc1PjK21o+l1aCM99D/M=;
	b=Crz38BjxnIiwQrGBoovOWSEDChlw7/LEQ6XzXLRDZpUCa7H47KMzDmk99Epsz4kPN+bo
	 HBzl5b4UV9IuAac5V3L33hP6zlo75EVp1ccut/8eUy4MSzPkiNHVtS0EivxVdeYqH03ou
	 vNG2Hf+OWPuB1vpx3u3R1S5SWs3+JSZ6eUK82SRj6d96p253MFyzGvOAd/8igca+Uq87M
	 yBbAsVkjv8QDDsb87t0ckBhyI4zAyXNB9rCcViesPFixLOYHrxyTVfvmbLc94yqJ07woA
	 ffsNV0nHWfuH8rQQVMDBtSpHUtWaGH+YexEaRCfYgwk+SmgZn23x7FSKOSeaAO7Uo1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZR2eirAs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F3606A319;
	Wed, 21 Oct 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZR2eirAs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235A41F000C6;
	Wed, 21 Oct 2026 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584882;
	bh=gqg9AUkKMFzGjca4P8T0j7dfc1PjK21o+l1aCM99D/M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZR2eirAseEOQSteV5fGTHuD7jgmvGErUNFgsPw7hP6u+VHrrIKQu8+DCOh7vRJ4sD
	 SnSRuCBT3N7C3mTYMlFZL7atpBp5s2B8Lm9/LYE+jm09bW68zu8dStZevJ2CDOEaWv
	 pKY0zWnxPXz5h/onSYAfHBfgoteb0/h0ebEnU9TfV6aC1H8QNGfoXi/XCRP9ZiP6v8
	 3unjVDVtSrXXDHkHvQZywgMjoDSVmB0qkfOhaSb9pDS7dSMsikMP5oN0Fr7DlvwNIB
	 CgsQTCkbuHAyUNu7+LVxg4oA3PhW8b0Q6eLfIGaI1L4HzMZZV47UP3Cvzofs0SriFD
	 cHPlGtHXMh/Ag==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Kumar Sanghvi <kumar.sanghvi@stericsson.com>,
	Sundar Iyer <sundar.iyer@stericsson.com>,
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/28] mfd: db8500-prcmu: Make AB8500 cell and IRQ resource static
Date: Wed, 21 Oct 2026 12:09:29 +0000
Message-ID: <20261021121245.3111563-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
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

db8500_prcmu_register_ab8500() declares struct resource ab850x_resource
and the mfd_cell descriptors on the stack and assigns &ab850x_resource
to ab850x_cell->resources.  Although mfd_add_device() deep-copies the
resource table via platform_device_add_resources() before
db8500_prcmu_register_ab8500() returns, the shallow MFD cell copy
attached to the child platform device retains a stale pointer to the
expired stack frame.

Mark ab850x_resource as static and the ab8500_cell and ab8505_cell
descriptors as static const so the resource pointer remains valid for
the lifetime of the device.

Closes: https://sashiko.dev/#/bug/linux-554f3a1f-ca41-4078-ae9e-66d0d7fb4c9d
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/db8500-prcmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 6672c55f2ebc..cdfcbeb2a88c 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -2953,16 +2953,15 @@ static const struct mfd_cell db8500_prcmu_devs[] = {
 
 static int db8500_prcmu_register_ab8500(struct device *parent)
 {
-	struct device_node *np;
-	struct resource ab850x_resource;
-	const struct mfd_cell ab8500_cell = {
+	static struct resource ab850x_resource;
+	static const struct mfd_cell ab8500_cell = {
 		.name = "ab8500-core",
 		.of_compatible = "stericsson,ab8500",
 		.id = AB8500_VERSION_AB8500,
 		.resources = &ab850x_resource,
 		.num_resources = 1,
 	};
-	const struct mfd_cell ab8505_cell = {
+	static const struct mfd_cell ab8505_cell = {
 		.name = "ab8505-core",
 		.of_compatible = "stericsson,ab8505",
 		.id = AB8500_VERSION_AB8505,
@@ -2970,6 +2969,7 @@ static int db8500_prcmu_register_ab8500(struct device *parent)
 		.num_resources = 1,
 	};
 	const struct mfd_cell *ab850x_cell;
+	struct device_node *np;
 
 	if (!parent->of_node)
 		return -ENODEV;
-- 
2.56.0.218.g1ec904b173-goog

