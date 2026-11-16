Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814807;
	b=20QFU6dU+tzg0N4Mh4HoWyvWmpAQJtewKyPt24msdYalNd3/uYN/RlheYQ9+PNdNnPgP
	 udlQiocU+cDYkGwt9a4k6HEvCVKIDuhXypTXhAHscY921rIhcbGRoqGvjZrPtxpXITgTN
	 uYkJB7H6qjP1nuk9BamVPiCGm43CB8NIoP73bDg4YIMSc6apk97wQk58tt4fe8agUDi7i
	 4rj80kaI+DW8jYh7oXICeJhSow8gtFWlASS3oRcJCLqseAHNj8/0boAZhvnqt3Oq0eJYg
	 ksicxA4ncgwFuVqVtyFanzKrTQnAWzCIPfi3K/mvJ8RMUvAr92PHqna3bbcnYYVzT5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jj+IS7H9YDNdNL8RPmf+32zqBN/ZdmMeOeOXwXdvnNc=;
	b=lGUOWyCyvWJgNt4pv8P7rOtwOyUdliviv3U/7HXizqYIo3wi3ospqNjVOHs1lApycbv8
	 T6pbkRvGA+BxdXKF+zEue5eYTMmSJtB+B+E54r60L0KfHiur6InyJV3G8htF3a9dWAI0j
	 ONzQH1hB3goBWGgX5eHu37fZNzaiHkXzrgYqAlLwskZys0IAVGMkRm5baVdIPr82pUaqp
	 MxibTQ+cuLCevkZ4GTnUGiy2q2oCb9MFEHTSmPcE29v9YkRBSDtLbxh6dykP5h4zx0uVm
	 GgyadNePnHe+xV6dsYmmSeWxHxeOzHpLw1jWZGdkHYmCQOW/zGUtSq3i9PadnN4Sebw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxlGkhht;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F1B60A5BD5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F1B60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxlGkhht
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491aaed7565so1360201f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814805; x=1795419605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jj+IS7H9YDNdNL8RPmf+32zqBN/ZdmMeOeOXwXdvnNc=;
        b=uxlGkhht5mv0MZbfIcJWS5enQNYPPrn0khTfJVopt1uwsrxiZ38cqq8jkyosmbjgYz
         5F9SY3nvfwpt1mJZ+pG/oiXpK0xHYr4oiw+XvjyJRvIdKEXzPh1kL+mpBexKTB/MVvKD
         MgpEeKXUkOk4JV+xbZydfsFn6Sne2D1nhbU3MHCWs93T9sWewbPrGNF85ocnV09ToBB0
         Vg7hU3y/ugh8KYOTDeW4R9mSdVUIQrLaHSFx2WhDBxUKw/6LZyGTwCqB/G0UiEvIV+4H
         24WWuKcndH72pLzKUJEdSFdGFfoXMOwptllW1kitzbu7ZC59HiCYwUoz3cZ5St149oou
         b07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814805; x=1795419605;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jj+IS7H9YDNdNL8RPmf+32zqBN/ZdmMeOeOXwXdvnNc=;
        b=yz9QVHOduL7VW3uHEi/z9Ffc3lLOg9YlS5cuflSP5LIEkqsZH4P2/Io5rp+wL65121
         gBPSwr5ZKwqokAOFhNTYAfngHUYUZ/0XzCzcM0aOaiCEQ6WCNz5JOKGo7EhPWMntffZ9
         ns+hHZb4/KaoH8WlLIEOGpjbtVlcv6Qt9EB5k4lvPaDmOCqrbxrrXpyBbaGCTdgIxPm2
         FJ7YubinAUTgPOICa154rCAy6wViT5YoSZIdUP2DBWz0W5jcymUi2v9bXwtvGvbM1gnE
         NZWXegC/bsB/DiR8NnhTfdxK8C1MbNxEpvoycd3EiKY1+g9nmPs2FWiYi+MZIViK4czC
         oGmQ==
X-Forwarded-Encrypted: i=1; AL+hErHtf2mU24w1gtsJFIu+BIwd+yyd5d6hBBj5cT5XTjSaZkJeuEin7lb3nuPBxBcAj9goxxN7WJdKV5niRYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eKPqEMEdW7buUP1/Hy7vHLJWPM/iXthYT3A3jl5+I7v0WYLzr
	Id2f+kxwhc9TrniUFtwhQKHkJ260pyCXOv/WlBxcbICx8KUuXeVc4/1v
X-Gm-Gg: AYBFou0gwUN3DLxGMJRzvAy7DUuKu3UtzjK4sYOOhN9kxSPMaGI7F/BIWnCECU5/rTU
	co8z4Xl3oS58Rfw4pPX0dMWmZzGLSsSYVhrk2H06wgGTcR92Kwvfbq2JHe7lrY0E6TdwMAirHzH
	w6JAk/QKavR1nVW4xPIfknqsWpMvWPtydBdmYX6eUU73e/uK97SsWrrnp+LKpVkL2f0jkch9oJg
	h+k3ZqHFspxRkagS2IySoU0OmzO5FbqXdUCiySHCl9PXAdInaqHtfkFNCledmQOa3HwBwMgybHE
	LeZZPiRqmzgAL54xJLzpj5xgxH+LtMxpWYYcVLI/1BJo4CCJjQT/srf5Zrq95A12wkgpvdQv64H
	agYtOio4vRuXZVv267fa2zzXCDRFIylSJ3WmV2fsJt/lqmP9O1d0rTa7TDnqlFqhZR5WBp1iQpS
	fYxbemNMhJUaBd9mIW0KsBhX5j7XQkF3COPs1J/VV8PJ1xlu1G8uI9ptPCxNjzuF3+hU90pfDvA
	l1y87muzAYTD18i8kI47IgTwhvAFh3X9jZar9H1Fs9tqCjK73+ZZAxpPArBWQk1w2u+ZGcWaxXJ
	tTDEjuMW//HGHFNPehMi3rhxCS6g804=
X-Received: by 2002:a05:6000:40db:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-49c71e3e248mr22685484f8f.12.1794814805520;
        Sun, 15 Nov 2026 23:40:05 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm20354115f8f.35.2026.11.15.23.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:05 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 2/3] power: supply: s2mu005-battery: make the alert interrupt optional
Date: Mon, 16 Nov 2026 10:39:59 +0300
Message-ID: <20261116074000.355176-3-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074000.355176-1-tadilhusrev@gmail.com>
References: <20261116074000.355176-1-tadilhusrev@gmail.com>
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
Content-Transfer-Encoding: 8bit

The driver unconditionally requests the fuel-gauge alert interrupt and
fails to probe if the board does not wire it. Not all boards route the
alert line (for example the Samsung Galaxy XCover5), so only request the
interrupt when one is present; the gauge is otherwise polled on demand.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 drivers/power/supply/s2mu005-battery.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/s2mu005-battery.c b/drivers/power/supply/s2mu005-battery.c
index a76154e5a..9798a62ff 100644
--- a/drivers/power/supply/s2mu005-battery.c
+++ b/drivers/power/supply/s2mu005-battery.c
@@ -273,11 +273,13 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(priv->psy),
 				     "failed to register power supply subsystem\n");
 
-	ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
-					s2mu005_handle_irq, IRQF_ONESHOT,
-					psy_desc->name, priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to request IRQ\n");
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
+						s2mu005_handle_irq, IRQF_ONESHOT,
+						psy_desc->name, priv);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request IRQ\n");
+	}
 
 	return 0;
 }
-- 
2.53.0

