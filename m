Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC5502573
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062163; cv=none; b=WqiJa2iQpBFIjXr/BXlcgrAT3dWNFTb0gQs7+WpaYX2+eTPraobFkUlGUbWTdaUhon3ow1aRijqHl/f0lqU0eP70/V0HwZeTedFap5dR1MV3XH9DPw4v9QKkqyBCTilrx1AkNPkOSuaqS/e/gWE0j5/j+RBdrDLEMoRuBtiIA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062163; c=relaxed/simple;
	bh=zngBcOzPJZNXJXBSaO+Bhwj3certzptc+V1LRBF/HJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbRKlz0QA4XZon48p4aWzPnOIIJnQFo7pMB9vPbJ+PIdrrCct4162fEtR1tEaWASA9UqMJOHT/UmVOs2c85KLjgeFg5eu57bey3qA8uTLTS6ivU9flznLp3uAqKkaiwF9saes5PWrl4+dU0IeOKUDLNsLPx71zzdwzpBPKZSddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KA+D5dBP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA+D5dBP"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3ea5a102so433109e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062160; x=1792666960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVKbslMBu6CF5quy/19Uyj5RN4onsoLySqMkVldnW5c=;
        b=KA+D5dBPU+lzvhIvu/sQN7Too0enquUrNfVE0A+R5URLjeUlojrNCuCdRE16SWs2V/
         hiavojrT/mk8PVN/zHP+opn6hwJvHFipH+zuLBFH1/KLlZAUGSB+PM+vx8OoW07fd6Co
         WdJwveF21mnhdXuhwT3/lfEQEd6gCxRjLmycs/BwBASAeoGAbwhHifU5U6lcOtViQ6pW
         sXfB7DHUGpCrX1TKA88ZzitMpZDm+jTARH3hZ+n0m4pZ5mU7NO016Lqo2ZZ3Yv10mlSf
         9DC3vxRGobN08tohjSlHIbLQDCOiPmRDNl9OWF7eizI9L4UYJVABchivzuexRXG+dqkE
         doXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062160; x=1792666960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVKbslMBu6CF5quy/19Uyj5RN4onsoLySqMkVldnW5c=;
        b=CtnJY9KP2DlOqvy2c7L18H0S+BiXUgA7/XGYe73MnM/CZBaPDt4qfTf5lY+IlLhQec
         ghAU7o+FxPM+0KuIIOykp4KHctwwxW/iEJuuuuHNuToXQQ2Nd9uI1pva9suQrqFyjoOi
         oWf/6I1If450WT22QNp0aQWeZhuJj+MaOo+ovpgUSTnktTUGv++weMxIaQ8RWjyLlgIQ
         0/Jsz/sMMtWBe77aiCvlPQMnaGyQFy947QwPlFfH1Rwpa+9QDa+LSNCsvkTla/odQF5G
         0mCK5/a/Sd99OpQ6z/wpmdVbwo47aD1ww6fgRYS9KcvhgtH1kCmWnvGirxcnUsJ3GOgw
         JTtw==
X-Forwarded-Encrypted: i=1; AKwUvBz59MDnBDEYqM04H/+dd+MW22d5NMSD6EPkdj5ibtO00XLMYPWVyvoKnSpcMGJ0bQUUllSZg7+sov+7Xno=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8S7xORUPF3pgd1U+KNdVcw5r2Fxf2NWc87/sUSMbhulgohzA6
	fWUCIaawCKuRAhj4ZuAcOWgjUs0Mb7xWjVqXq6E+tK23lj4vSVj0GvCN
X-Gm-Gg: AYBFou01XdsUlBwDnQuGZlBUNVwxnM9B1qX47A36IcgANpq5JEvZGwn//66FUqhniCQ
	pxnh5cY6rjJt4Zxg8kjaBleLjC69i6rKCv/lAfcV7eqIUXTt0fIbWctoZ/DF3mCS3CwnbX+h3v0
	Qnmpmj9nBGmR++NBpDLR6KcP7vYMmlegBNj1Fj2zJNb9WWvdEJyH2dwAHTi43gcikPYBop4qhtP
	wBiBaZt7bGZM7RDyBx24i6AUcdIN1BZapi4SS0XN/G3hGZWu/qta8Igdqj9KO6XrhdSTCGO0jPm
	zZizA7TqdbZKYq68QwtPNSoKlZ2XA7iE/P56jxMujeO9Qqw07kiii/vXJ0SBtOHC5+bmtUFuHvQ
	auinbj6EAOvWuKz6KCAuEHw4QK3xZrChQPYg21oUl0TETh66Pkotb60q3VbAmLH/AaHfNDzKlzq
	KevGncyDW92CeEhl8+u4/z2K3eAq8vDOdD0Hwx7KiYHKAR+nxRHz4IZux8/kf+G01EP1WS/Xna9
	Qjg3lpTWkyKZm+yn6GylVaxVN0Wi3BItPEHtgDMgb+HHoiEGMDcqj/43Ql+9w==
X-Received: by 2002:a05:6512:110e:b0:5bc:ca67:c343 with SMTP id 2adb3069b0e04-5bcde6c7391mr7040404e87.28.1792062159834;
        Thu, 15 Oct 2026 04:02:39 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:38 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:53 +0200
Subject: [PATCH v13 6/8] i2c: mux: ltc4306: set correct idle_state in
 i2c_mux_core
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-6-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=832;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zngBcOzPJZNXJXBSaO+Bhwj3certzptc+V1LRBF/HJk=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LK7uxsiuf5sSWuXq08m4qXSSXd9tuLkxQadi
 el4mHZgHKmJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyuwAKCRCIgE5vWV1S
 MuSPEAClGqQeffmMOx41qycz0kx7UJFVmXuNT74EfDW5aSAK0d72cYbdTBkpngz63r/6jBZr00s
 xVd/Xahid1XaEr7Hib9vyhUn0GK4R5FOPiYxK8Od8iDa8SiEo4r06Wb6AjwkoTSFp7UWax3m6Tt
 jZ6l7Di5M0tQ+aHjrd+or8pyJfomwn8ouf3lCq3xuz+cu8DNobGA6c13ClmsdEMdgDcL3MRPUcT
 HNA3/Jz79vSVNq3p/AlFRNRKoZgzkS33TZtp0EYBqj0Iszym5vsQa6x+dkodnKA7NKe2IYFSaaU
 xHsaCDiDHxDkyuhzttaV++AEmqv/L9UofoCFBJtVWB3TSvCtXPWMLkeizSpTWe/5gq3rFpxKf0y
 v3rEPE/8i271U5VOKIS2uj8cJskgfgLmwZeXe6OthM+5gdgmkjRswVNHIz2z1zLjGcitZgdP9ae
 s0JfyL+yHjnpg1nNmAVl9R/YIQ+ixhtUHDNvectfRuXskocuYDiZTam+tF65EI0xn6DLCrmDdOk
 5+VDR0MQmCwp1pXwSkWpZsQrjbATZitOS5b2mzKU9HAor3qXh2Gzot4kXHH0JjAHzTltUkbbkat
 pnov1NOrg5f6Y1ekNvXxuYfWJ1rWiGBKT5RVhLP5KVXVU51eXaef8ch0Q41T3mVK6wHHu7owf/T
 9c3zJ7G07j0DNQA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Inform the core if we intend to disconnect channels during idle.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 18228f5b80e8..b1150a18ed06 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -232,6 +232,11 @@ static int ltc4306_probe(struct i2c_client *client)
 	data = i2c_mux_priv(muxc);
 	data->chip = chip;
 
+	if (idle_disc)
+		i2c_mux_set_idle_state(muxc, I2C_MUX_IDLE_DISCONNECT);
+	else
+		i2c_mux_set_idle_state(muxc, I2C_MUX_IDLE_AS_IS);
+
 	i2c_set_clientdata(client, muxc);
 
 	data->regmap = devm_regmap_init_i2c(client, &ltc4306_regmap_config);

-- 
2.55.0

