Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098247;
	b=bx83fAwj/o3tI5RaXW1Pz9Ab3uFSX8DfAUSRSZkt8kG8DJFkIY7aENNkVKNxGVaO6GH7
	 bsPBVNT1rd2iPRiWTKKorZL1AOGstXlb54xIA3+954wZmkmpsmex+bDupzCeF0kz2f+My
	 PDXIsUDEhn1BejOiFKtJyXV4v4Y2jj3iFNXaGYnam726/g79kdbkQe+1eoGRGTRCVgW5Z
	 jd8dwPL6rQlMV+HoE4UFY2QR4KbUsWvkgTMRZvdo+24I0qSF+kjLBAPDvH5bvvYEo6yuD
	 9hR92+zwWDknHkfPA18fCmNcZ5uyDkOTulIdR3yJBgK/Al3DyaXJp4Qg755cZqSahDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=iput7aG/xiCvSa/y4WK5WCJXc9/uU3fOh5nemna7zUM=;
	b=DLYK0zDIInJxGmAd700nDWuRv6QVaNE2yc8/TxYDzLTvnJkvCMEYxrg9o0me80RfJwfE
	 Nqab24TzDRuzXtOjyGtZdCyjBzQ206L42MjqsznyQPGTg4JHJkb//8CR5XuJP5CO23T2n
	 2vWpa+dvPyxX+MmfI3I3KPu3c5CzhU1rZKKJpVqG7nCJe3WC0Q3B7JXu98OaAXD4XD1wC
	 /znm11PMvI+rfFfcw72VCoRi/bTyw6VqSKYGqTcd+wjTj1ffmbKpMI5beK9xJYRPmrpx/
	 S7IeP2OJaRRQndjpm8lF7HnG/DMjH6FG8Vsils+YJ6wn9FL+trdj4bBR4CZUyXP7d4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DpOZGB7i;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E28606ADDC
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E28606ADDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DpOZGB7i
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3375060f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098245; x=1793703045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iput7aG/xiCvSa/y4WK5WCJXc9/uU3fOh5nemna7zUM=;
        b=DpOZGB7ih8PWwcpYlkx7xlFOKFuhpaKS0nJWMllNS9JnYWPAsIpQS/OL+ebTC0MFFg
         4gnWW2MAKtItRLBN6FKencazG6Uz7fJOtx7H3MjEAhIBC8uEHGwW4hXODWknTNm7PEF/
         QQJDQjG51aCpLaOEbW9ebZWx/rpn2+ti35PVMKpHUVIiU6JEZXbCBbXbKwwTx/xqZFiT
         LofLxiGKKkAc6Xso0oADA59HTGcNcmnCchER5A9TKuF8sT07CN/W/tKzEvEk2IkYSHX9
         uvADtSZXd29qFCNoViAJDxSHQ5COJXFVDhoFVr2Of5WpnndarRMeTQZ2j+h6UQ6qEvqa
         Pimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098245; x=1793703045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iput7aG/xiCvSa/y4WK5WCJXc9/uU3fOh5nemna7zUM=;
        b=LVW5wpTzu7LwETDg2eVQNVPi/rFOHaYDuXZrZNSuACa5+21DU3Ue0ssDa22rHJy7sg
         sKvo34TIhmpnCw6rQCBpw0AABx4TbJab+3qkVVro0jr4Rih03sFNqoho2mlt8FG3BX/o
         NgRO5VpyQuN0KeLiPWmNEzX4d9Dbt3XPRYLII4kG3BmAsJnQSE0c+Dp6ffAVcAIF9slg
         xZ2G0W+S/wYEal2GjwU/tb2mbZRm7cpaf5vhocUtfUEcRnJhlpRsw2GnxooZLKRJZT12
         H1AqDMXZap+ezfx4Ns6G4aj4Ix7kg6Xaj1UMo6L/NjZBctYz5a7zN/UUZZXUikCMzG4G
         AwRw==
X-Forwarded-Encrypted: i=1; AKwUvByoceaTcmHjKW7sLwbJr8OhtD67sIpX6L5EFQheTUxDhse6Hxo56x0slj3xJpL++1epvk1fQ9Orhs8N8vw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7qkNlEuSgejXwLfv6j9JBPR+Bjw3MZE5lTxsnWMa8Ut79qBt7
	zr6j0CrSuXrN5iKwMbY/G2OWrUgQSZ8ZcWr3y68c9h8LPCZqep8l+HD/1gSB7WXP1i0=
X-Gm-Gg: AYBFou3IJmFfJ9o0pfbylSflfWOYKy3YUYBtSCeDATP4WDiuvbjk7cfpS/poBWsB1c6
	CaXSJxxvbSNMSzSk/yzOJMTR4cUJXYXnGzuvKZMHk1/OF/z9fS2JXLASlTbexpYDuRsAZ0+/ifT
	cpypV3NOnFz9QkNqIuLxz/SqXT8ypxPodxasP169FzRefo9hxJit2y5SN8V7grK1DHu/hQGFcV3
	Kr5M4A47udObsVX/VCCgdx97Sj3mxlYP/Rx7feFUKN/JiTXgwQIi19nQpC9zYVxaCwt4Q/DWADY
	seMKyucyGloGOVVGCp6lcn0x4Px3OrSuAo282PQqJQ5kw+WHriBcrop9HqESBNZWwsxLuw9mElf
	ftxW2fykEP7JTlo2/S5JBTdLHv7YMg/ILPe55Tt4kTnJryeIk7BWrZsJui/mh7lE7zS7cGSUnU6
	lvn1OMc6Gau+iHRN0vOeW3xWNQ65bnCzUn94XfENW7Ohu40EvBVJTzA4nrBp6TPG3PxjSl9tPiq
	/jWAMCjgtI4aEojhsf+aRsWCjDKIpAxXcnbY1TIQlK3v/Ec3ca1HdjHAj9XONLILTv3kZpEifQg
	iqKxPzEM4x51BTWq0wNIxTGkWedVadwogV7WikGAPms=
X-Received: by 2002:a05:6000:220a:b0:48e:20ed:27f9 with SMTP id ffacd0b85a97d-48e3eac10b1mr18208716f8f.0.1793098245195;
        Tue, 27 Oct 2026 03:50:45 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc4d76sm22611211f8f.12.2026.10.27.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/23] gpio: bd73800: Use named initializers for platform_device_id array
Date: Tue, 27 Oct 2026 11:48:52 +0100
Message-ID:  <c956437a51c89f5158fc79d61c8cadc2f7f81477.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dtKVjzO953dNgnO1/VKUCTW9qRuHv/M+w0O6aXTtYzs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHDgwBuDuXM1Jwsh/47McVKLAOph7zZzdC6q Ql/KZTmPeqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBwwAKCRCPgPtYfRL+ TuUMCACfjZ5ayS9TtmPoY3mSYYdDukc977i2yQ7d8qjGNoX67KArndVz0ijSMl6/z0fVMZnhbvi tX437Ap0ID6WMNrQtNUUqO99zbJ8ICSU9LXPE5D2eY82SRFQs1LKIgq67D2J0k8uEA/AaMjKZWG sxFGMNOoOvmK37QD5b+g+ccUlXRS9P5YrI+HtjYY+9Rk6/PYOzveSVHCvu3VMCTInyecM/nmWYF doorUmLp7rBqc6HFW3LTD56srQSp8xcjSEcNzkrz6HXFMyO+8w7bbydkWcErBV7AFMOWferCPxf 7FeFhDujl6bk3DYHWz6ZMKjcfWk+wgUSJ7C5bCdokvKRCEbw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union
(though this driver doesn't use .driver_data, so this patch isn't
strictly necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-bd73800.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-bd73800.c b/drivers/gpio/gpio-bd73800.c
index 2be2a885820e..c960ea6e8426 100644
--- a/drivers/gpio/gpio-bd73800.c
+++ b/drivers/gpio/gpio-bd73800.c
@@ -189,8 +189,8 @@ static int gpo_bd73800_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd73800_gpio_id[] = {
-	{ "bd73800-gpio" },
-	{ },
+	{ .name = "bd73800-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd73800_gpio_id);
 
-- 
2.56.0.rc1

