Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032178;
	b=kEAATOKyn8iRPw58FTAZdAXFYWwk3n7uho//LIizebz3GDthMZRxnIPiSD+d4eD9WBux
	 VL7HKko+xfsmVYi56o0flQ0aL6+o+r/zh+jCTe+RSHZRLG9BdrYcAoykwjA9pcUCXN47g
	 pC+RLv7RGEfjMQNJfxIk7EKFZ0PyEdxANDRXfbl0XNolq3uApSwQQGm9SRTEh/MGXdZlc
	 Yts4hIRC1EoIBlfEpfemqhuHmabkfpWnl+j+33k6mpiYffDVDoN+IDM3hSxsQkhtjDX/X
	 d2aBxFsah2h4dMEgmsVpc2bWlgLNSMySCETyQLgaO58m3wmog2+kGiiuuFs15/v/AJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
	b=NMMwyzgEptl57gW5DDPzF+9C8PTHcjmWRbMTWd6slfn/AaeFg7BNAO2bkFOcBexnH7oY
	 TQ0bot1vwlfC5CNNcrIkKp3lmQKxBldCw96xksIzwySzu9mC94XRYucNmgULAKjExz2D0
	 lO1vNBk5O9jgTYvv+YXTWSSsW9G7zU/e64EMXUZt+lcgzwnN8KcsJe//+YA+nulxCM7Y3
	 Ynww3s0AqRy2VcT/9EB35Jy67rn2i4PMlARKszDdKdJAc7wfGfxtwQugYAp7igI3mP0bT
	 E+FwnlORtUSGs0DakFccmTAMyQeo2tS/N0d3MEK7wCzRW/+j22Ft4BB1Mdsi0l/9V3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E0FtTemE;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E62B606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E62B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E0FtTemE
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1659166f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032172; x=1793636972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
        b=E0FtTemEXX057tr9SgI3unFAxonc+HEyP0zeKgE2avK+1AkgKsWhuwCwsNUnK5idoU
         ctArH/iZC8z49XrEiY42bMaKr2Euk5zbd+YsUELX/H+vQvzT47RuA+AdYFv2CqzEyGLa
         qb2abk+U4PiUSsBHnW54TV2Nvtczsh77yT5wzJsGBd7+ee99TmL/WGI9iF8qY+HUKMYA
         SSwHs4qKbP3zlnLi2JJfE8ZelS+whXoHXWxMuN7qvqCRxhNzR/ycoSLyAtQSrp8MI6Ew
         2OFB+QCed9B/HgLMkilzUs364x52iRHWbvWbZyUVgP8kkz/PRuQbKE6SSvKE9axZoCP/
         PbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032172; x=1793636972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
        b=WoFUREzdgiLklrJLvq1mK7X+XxokiLvgMtrGbkGFF0OUuoyhJm9+ZygO1aZxltvJPI
         +5xY6kQTn7+tWMIHR2KslfoR+cMx7yq29TYAJX1JE42n5Upaw+ldriI/r+3i/1cgaGY2
         KZPYDUU3L6/MiwyIzb+6S8aK5Xe6r+xfDPxwqoU5TMNOBt011x5qoFsSAmRG+IqGL6Uh
         vZR8evlmgRUKGIqYrH9KNZRqaUqVTYKCLYMiIOlaER5XEgujnTZzsT1tTMYyqxKf7zmj
         OeWzvoDVtD2EdgzwWyTfSJYNtxJ7c1uiR4aLpTygmVL9tL7bRp8JqzgpM6ga7dbkTktk
         efTw==
X-Forwarded-Encrypted: i=1; AKwUvBzJe21DqdgMqyoswM1rJIUOGiT24ZaXul0hTrodAmY7Be5Q4KvBgv4zTtNQYPxqbnRG811E2Lm7vB2laSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkojhvPKSiGkHKfuNqsUlZgFysFixcthP09ncrMjJxP1j3dB27
	1qi0UzAOS60Kpn2v5aXyh1/YU8GV1oxNhe1ivIlzjhyLaSo/XZQSsIPsxVN012D4swE=
X-Gm-Gg: AYBFou0Vzevij22inhF9psuuDoFPpTiOJHs44TSUBrQsjkfWFPq0mQdJ7pjoz2wgaHu
	Mfzsan0rbSFd84cA1OTcKVRNkEM/DDHD/RdV0wnnpAx4wDYzcDH0au1FI+kC1Dyph0mVaCRmjFg
	ajMxGijf0BRvE3mYZL/PQmJ6XZ7OrprYhVIbyTT5Jbz3uFks3BkoAajG03No6/xvE1Y+P+DLSSa
	gLOhEAq3pIg5hwNRKdp6G/o+QZHLEtfkc+2FKX2t9UDxCeHadSmZKxxOwAbrTa+TJyK/O0YXaSo
	cRTidS8KZRoyizWsOBityqTxY5aBFdCmwhFf1TJE3HUVqEkQTusNQnB7mPsnJ7q1an9G73CvyT/
	FqkXFDGjkMO2z2H22VRt29waWgkPKy9A3yqW9R0+dOfmUf6TjkNu+18VORJpITQ/pju7at64Li8
	nuD5p5P6Y/0s6pmkrVL88z5WR4vik2cp9fCYZSs7m/e+0agBohtEnVIqElhaX1I45oPWY2eUG7Q
	Wf4IyrvzqqPxMKgvjJAVdrOtxnMR9/1snfVW20e4aFWHRTx6L5sh1L8UEDO/YcEodZLDR8NeeCH
	wNW1liRmz8hxlnozA69mliWhlmHU2TZu4pNVbaJjgeM=
X-Received: by 2002:a5d:6881:0:b0:48d:f14a:917e with SMTP id ffacd0b85a97d-48e3eb7e54bmr10139771f8f.11.1793032171585;
        Mon, 26 Oct 2026 09:29:31 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb9cesm18148057f8f.27.2026.10.26.09.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/22] gpio: mmio: Drop unused assignment of platform_device_id driver data
Date: Mon, 26 Oct 2026 17:28:16 +0100
Message-ID:  <cd5c33b74b630f31841f4c570d61c3bf47ec712a.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=874; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6ijQYwjczGie5kQc8ROmUpQycONZ/hY8dLBsJPtE8rg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+oqOpj8Oq2dnINrnmjMCAZEAXq9JE8ombgX lTj6fI6s0mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/qAAKCRCPgPtYfRL+ TtUWB/9QrH/LdSed2CsRA2n+Dgpg20IphUxMyZLYPYEx/UpH295YbPWSvVcWjoObO4lNJZCBSup Icukqbi5Q602/PJPktuTA7xpKvTpQhSbyTLRPBP7VMFJPwP1uH2OOTrlyKnzbzAFwRn7s9aaVV2 6npGor9MmJkWL94qRIq9vMd+sMxqi4qMLokI6J+gSl0eY7VaZtJKjmdGvFu7d4vOUlMWwlVNg4s cMIpsaK+WlJoAGCmUcQEwCKAuOrjlCxoQ1IlmWPbDtDHvxM/tBS/gDkUSpAI1fSLvnTgFAOKcQj dFMDTs9h2lKZ9LDPMeomNYdYQmvwY9B+0QryuuHLV2lPg/AK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mmio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 0709ffaab4de..ec7c2b73f2f6 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -870,8 +870,7 @@ static int gpio_mmio_pdev_probe(struct platform_device *pdev)
 
 static const struct platform_device_id gpio_mmio_id_table[] = {
 	{
-		.name		= "basic-mmio-gpio",
-		.driver_data	= 0,
+		.name = "basic-mmio-gpio",
 	},
 	{ }
 };
-- 
2.56.0.rc1

