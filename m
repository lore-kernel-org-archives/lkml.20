Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347758;
	b=wxmpSUiDpYARzXVwIqQsoJQLHxmQm57au4dhDS1pqbKMJDIPXOar8IYv/LpEIbRXwuRV
	 5BpqaL2YzqjVf05GGqtyOhCN+icMeSY1LY89VsMQjW9V/SeWVZAe0R/V5iJPCUzi2Xmzg
	 4LzARAO0H/QWK7urue+CqfBDn9G0tDb0woM9PiUF+oSBp21Pv5ChyEKiIIweN+jUVmha0
	 EmaFOpCGKznJblf/xP3AYhLL7ogKtqRJx8hKJme+64zB5uX0f56GEi3cDJxLHbl8ETR3S
	 x9jxe0oDc16Lu13NQpMxdTPr9H/6VwB6oYuVJEzZ81aE9XndX0qMOrJ+tHbypq9rqXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YvMpOyVW0nmPdshmLVoyb9tIypIcw4DpcdinU28KPJM=;
	b=bIkVTKnvcqN8znpbTF84cpxpIicIa68NaQseWz4Z2OzJ1kH2YaA+eQgFrqYy/7uV7pZw
	 nwycjuU9aaGADKMYJOchWxqPPkBAVRHRtMoN15mzm0sHZQrME3+HZP6hhnkkZwDzo2JmV
	 86Yy3XtpAKoBqKcJbDRaVdGZlErwmT/o2M7GKnDMR6EOz1o7UahTn3p+0J9VZjML42AMX
	 i25HuSAqv51/D7+c325EnVpqlRVViu4YTLu6vWHmdZE3DZd6ZymioTrtmghbiTaWXw1uI
	 x/FSA7REzIeF68i0xrV8X9k7D7PnEwXOVfqZzj72xqe0/H9XLq9cNzu1e993PopgFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B5d7SS9S;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB8606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EAB8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B5d7SS9S
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso27799815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347757; x=1794952557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YvMpOyVW0nmPdshmLVoyb9tIypIcw4DpcdinU28KPJM=;
        b=B5d7SS9S7sY5BEcAjwqPRUD050ybw7tf2DYn8XXJ3kkFANz7v+lJ+IN8bPLYlsXk1D
         Mz5QPVUgRzlxyfxX/XPKawERYROTJXLFCTRBVwVDQwFhLbVkgP4txLbf+ilEc04x8sSZ
         JWiilKF+c1C+JVcODOUGvWgKNEccRGbIx/1BcngHbvBR4SR44BwJEkz7TOBS3ET8dSrh
         ARw68NyEP9zrL2MYYR/eN3vhfsDP9EJiQ5FP6dkLG418n5MONVgYAQ4TKzR5/NjBNm2Z
         0la20mwg6QFaAfEz4ariHboCEEyKkw0L+9dnXCfj5zTcydh4MIZk0wh9+w6l+OEC8k3d
         G8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347757; x=1794952557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvMpOyVW0nmPdshmLVoyb9tIypIcw4DpcdinU28KPJM=;
        b=IQrvrQ4PLWDi4TSHrmTYpNfWs+LXzPruBScuLiV62a876auMYakNmk8Ai+KM1EMA0q
         hwdkOB1V7eoffVhI/vRvMylloUY3/9foFBeqMZLWJqv8eQBoNkh9iCmRcVesvtTGYzuG
         nWt+ZOchU+9AZ6DxDbKaTZg3ET/x8Zo6peY1EYMjKi09Ehb7Ld4ntxIBZYWlpcB6vRif
         YWL1pu0voU2ULwA3wywGVX3vMIPaSvGbvZTA8AtAloexDUAQRutHdRT0291QU/hGEO0K
         NIQDpvUP8bUpvluKl/A5JIGScHE8zo1KGNSJmuHT+fiOMBofqMlzvEGwEWmOenBeuKbl
         6DyQ==
X-Forwarded-Encrypted: i=1; AL+hErFmzeipAeA9JcvCIdXND98ZihcgIUM6sHCPsCr/HWBnvUKbP0501oFGjXDCbVW6k74r4cjs+c+08TtWtWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6lfXfNUGQQf7kukvpJD+kTH5gpMvelK0ObrK/rsUPqnIY3trW
	qVkM+ZTw3AGRKqr9yiDH+kvIV4fhTp666/kfJMg1gCBMVa8WtHuV0P3wcAxwO4Aapi0=
X-Gm-Gg: AYBFou2CpsBpd6SGXbYvnHpQMvwK8LPh6uqKCvwaaH3x3O9Eo4Tey6rnBQWxGDxlyS2
	XJOfKvV1zyfdY76GidHY/BGcsNs5HJWVLl/EJ1hn+Zshvjc7yRKhhWGeswTH3JhQiPKW+qtvRv+
	uo6Ki3xWJ+uSzqP7GqXpoyMAeZfjtuGmq43d5bE60dw9N5mmTI9QqQRpr42YZXwfICYnKszcFC/
	RfvBnkbjURXoGYfsfbC2Yp8In9yaFxM4cHzx9yGVcYf1Po0d1Xjzgwh+mAb7Q53Syd3WlrRS0Yb
	gV3g9LOjYwOb/RaLm1J1ZvhpZLApe2DTyaFSV9xQ9kRPkrx+EabYGwXehBDjAbyGkdcucmvKCrE
	D2BRsK8QOo+j3YLvJTfzXDdyad+bsbU1j7qX6S5Qek3YonZkANH+rI19H0SrglcC8QQdnBNMdQW
	JBbrdFr4dWkSH/+SwC3H9wjSyOARtj/VkVKEbnpWTpluZPggj0wHEARCgF7e/iRW4g46zzeYE0c
	HAFa025TKsEDb+/VI2NqMXmVqjYfEr2AjEZJNcXmI+4HjnKqEckGrx0ZiPf8IC0bn29zoHqdw+O
	niBRw6qfRfMvMwQLkOxc4jq4eh7gSPTSL/Q=
X-Received: by 2002:a05:600c:3b01:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4ba09344911mr6417355e9.1.1794347756987;
        Tue, 10 Nov 2026 13:55:56 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fba476sm107163905e9.2.2026.11.10.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 04/20] mfd: lp87565: Explicitly set driver data for the generic dt compatible
Date: Tue, 10 Nov 2026 22:54:29 +0100
Message-ID:  <8f0bc82073121d4c2af24ef495873f486cd53631.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ItI5605JHOVUrr1auFKK2Cyt2oOdQ7yo3fgGcZk951c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KecaOWAIjbliGaieC3F/az/KAF1oOz0ppUT Cs0rvDaBquJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSngAKCRCPgPtYfRL+ Tq2eCACjSWO4t72nyZBiFE17tZkmvXuwxGTijpJde+2sKH+N+/ekSU9BoQgQSohU/SCjod5MS+o hljqIT0giS6pAajDTzfEdpWe8I8CHxgrdJSnIKZ04P9wk+qBol3vLHWQCOh8Rgf0vnDN5RwA/20 KxIsfwg5Z/YL/nhmkuZv1ZXVpD41pZu9vUwtwUeqgNa1gFkOToEvBCa7pB4pdlEBwg5Ovo7RDgv M42pICHxxChHhmt1Dd0r7esMP/aMnncsy9W1kslYHgHRfnBmQiVirBE2s6dR3hetjRWzP1LuuSA miwAv1Byb4WxVpaldyT6IkNuZdmHM5k8c0MoKOQK/B17QJNO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
(i.e. NULL) for the generic device tree compatible. Make this explicit.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/lp87565.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index b78ae79df5fa..efea1ba82811 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -26,7 +26,10 @@ static const struct mfd_cell lp87565_cells[] = {
 };
 
 static const struct of_device_id of_lp87565_match_table[] = {
-	{ .compatible = "ti,lp87565", },
+	{
+		.compatible = "ti,lp87565",
+		.data = (void *)LP87565_DEVICE_TYPE_UNKNOWN,
+	},
 	{
 		.compatible = "ti,lp87524-q1",
 		.data = (void *)LP87565_DEVICE_TYPE_LP87524_Q1,
-- 
2.56.0.rc1

