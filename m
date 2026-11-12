Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794455323;
	b=DtaryRBzNu9O2Rh7Ou7po18nDRY5vI3ICqGpc+s1ymO9j3fwYvi92uM105wpuIcecQHP
	 BmaJ5wte7riOJkvDSArzvmTAR/YRiY1LaXqSUcGFcS1qOHgJ2j8DLfTnx4Bp/Oikf+ssz
	 0Q+KXUL3u7IqhrwdJCI7BWlSlZprhmXj3R2Dem7N1OjXHYwgFdyhABNSSeDa0Ojd4cGWp
	 UR7wnXZHicKOBaYNBLOSDmGRF/ovAhHHSq0f612RPD30LiaJoj4TfwM/zVPFoJGetEfdM
	 S++S7KOSpyIV4QRf229tHqwvGA1h7ua9z8MvUELBuQxKrdovYikxOae2isWzjBBz12Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455323;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GgvPJagE+zuLdLjBExn5vDk3lJnEMFjBQK/8H8lWUE=;
	b=ACD407y6c0wggW4Z3N6OCaB6OZNpBFbpkjRS/DmOIauwmVFCECIv298U7g4m7G1TF6x0
	 PLtDqcckJzaroB1j/gxm+zVAOAIf5uQ7Y/VXk0a/dolLkkCHvmqcs3rC+McIASj0BbbC5
	 IhFBSWqOfV2oxzX5kxS/FSd4Q4Jrxa2zNnCqiBHHce7Y/cN2g5h+bdsjOY0Z6+X//7jpu
	 BoEr7ORmSbD+QTOmsv7sf7FQDtP2ryqyZeEWoLATAzpu3UdwdbqIXnfXFS3hgJgGh04Fs
	 cWG7x5wKhBgyuk1wWB/6wsKrHtI8PavkU07x/pgLqykpepB3liXdJy/tAC9Dng0BuyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2UVtwHl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE58606A321;
	Thu, 12 Nov 2026 03:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2UVtwHl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794455323;
	b=ihqtEIQmRs6DXMFkaME1NGAzcLlgyqyCXEhVuKvQEYE1veTF2c5AKI8h7SXv16wooTm0
	 Jid2qd3zrw9MH1mbZqRj9cWcjjuJkzwuvou3SZTUVpP6pbNRBwbiX7Hcb6keATG4vN4XH
	 jURdnHnbECCFXQRQWmD5XOYvPe+SzNtBq0WdYk3RVXY3xTWOuKiQEre9+JVeI2DfX3WhR
	 586geLYwnw8hSuPAJ9FSDQR8CwMUfH8fVcqvh3k8787VtsEpTkZ9jOJfvdJQG6ApPwFe1
	 U+51IAB0O6RB7V8Cfpx/L8xlsEpk3TsDLuLXEGChE0ewrxvcwrGzotwYHcpZPnsVF0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794455323;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GgvPJagE+zuLdLjBExn5vDk3lJnEMFjBQK/8H8lWUE=;
	b=TqoBbZfOA/oaKhmDEVbywVEFItRbXK8LcUgyuubPnOSn4QDQYa0btnNT0vRXLn59Xw6l
	 gCilj+ZuTpa/8Ci2q2uQG7NXJOG7t0BHLVhsw3f+JZZTzPgdN7HjC69f1f1UXjausYwlJ
	 4OJwtmpQGF2L9nUuvZtI4Jne+g0A/NyamF18Driket38xUbwFvQwEm7HRmx5AeviuYmvD
	 F66FFPuxoDUyuGgRgMXnVv6fZIzUav4yPbykbqam2irKhJCo32FClK+a9EQn3ZdW5M6ml
	 dcaAIoOrWHpiKfv2qOVND9EHuBi4JQUSlC24g794UCDi4gStwArRGjM4RWRzItaonJw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9C0B1F00A05;
	Thu, 12 Nov 2026 03:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794455323;
	bh=3GgvPJagE+zuLdLjBExn5vDk3lJnEMFjBQK/8H8lWUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Z2UVtwHlUmhfN0zPQEdprH0NT4ObA0aF3GwiEhrFSFfGU2aNfT9m2AxWm6YxbtEmB
	 rEqNlVRlQp9eSvn1jNLAY3xUsnQ3lkPkyVgvsOeLYB9uVGQlVg4RZVBR5LqTVjoEqW
	 LFqT1LZn0rLX0E11JgKx9p6oJ1ltqSErbzIJj1bLHOv3r7K/LXzO7BHH8UZRpFeTOw
	 v46d4Ykcf3Q8as6uiXCk182rr50QIIPWNrCEKhr/mteoBuO5rKI3Fu61D/zNutelZl
	 +dkFAEWmsD1q4JXSLSXilqfpiDVzfjYTrbVz8TtPneK1b7i0ssdoFEZJVe+qzXZpVB
	 YTcrUW9vvIQag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4339549273;
	Thu, 12 Nov 2026 03:48:42 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 21:48:32 -0600
Subject: [PATCH v4 1/2] staging: octeon: disable PKO before device removal
 in probe error path
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
Message-Id: <20261111-octeon-init-pipeline-v1-v4-1-5b4f8e613ae1@gmail.com>
References: <20261111-octeon-init-pipeline-v1-v4-0-5b4f8e613ae1@gmail.com>
In-Reply-To: <20261111-octeon-init-pipeline-v1-v4-0-5b4f8e613ae1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794455321; l=895;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=VKtuoP+mIA1EKBGbewR+SjFHAmuHlZPHPWfuOFozPpc=;
 b=F1Mnp1QMroNoVn8WzCbauFa49XqfvyXkl0iE1Y5QLr0PV+0/Qws99GuZRBZcml1OTMSXafk8y
 y3rX/5VUCFbCMQ5JR5IHS5sga9AUuX2MX63rAY/a/CC+BIvDIWEClzO
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_remove() calls cvmx_pko_disable() before removing devices and
shutting down PKO. The err_tx error path in cvm_oct_probe() omits this
call.

Add cvmx_pko_disable() to the probe error path to match cvm_oct_remove().

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..c77678cb351f 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -959,6 +959,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
 
+	cvmx_pko_disable();
+
 	/* Free the ethernet devices */
 	for (int port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
 		cvm_oct_remove_device(port);

-- 
2.56.0


