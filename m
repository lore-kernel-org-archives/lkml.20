Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375924;
	b=GI+yxZj681DPA+1qSe35WEgHr6A5troE+B+zst78CVY0Q3vEunQJcJqCBYSi+5B2adtU
	 RmPO9hjwzDjmKPE6gUCEBFh2uMuO8KR8APlS4OWqVlym9i4rzjs7Zuz/T1oL4RaywBpgT
	 pjDJXouuklUuxEv/N9iQ/ajtgPfoQocOaR/YFcIcyD3CXy1eDG8LgOjjXSBTgvZw411F7
	 hW5c19nnodVJ8aW40O6aB3cgKeXahmsqi3Ka5bwj4kU4M/TDejwfLQxKeanZOim0JqaEO
	 5SB0dHswLN1CTWohAhaUoxEsgwlcfRH0Xm53dupnra/Uu4NLCzJcO4E1YVbUA/cMv9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
	b=XgIVTA3mNUeBbWRrTVECDE9Nt4SF3AVbgChGi2HwqfLO5DQ83LDuvxQjJcU/8N+RFEQa
	 afmjajD1+bOdWfHiD5delhUvc6QkTuEJHHd7o02zs4TwPgkZba/aqNnR17xGWqbjxbaQ2
	 OV69vWafWopsdgdaDB9EZAgPrRCG0hF9E1tn6VwRHrMLHji0AnkQAbt3F4jUoU2zCghgV
	 8l+gktavG6YM2vCH3pXM1XaaW4+NrrZd/iIKo4Yr95p8IT3hEAssAoR20mNpxogK9ipxG
	 asV0kxx0Vhl37eJtML9i0++qJAGtK5MlpHwvRXO7i+qzgE97nZyLfa+itmjs8s51nAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k6O1SYsD;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1446F606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1446F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k6O1SYsD
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10383965e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375922; x=1793980722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
        b=k6O1SYsDSVANxNNncBHsTL2zKt4/f8ljHmJ7SYl3TJrL3w3FUhVt5OsfZch+sG8vyz
         XKU0m9LGvta8AsVbxbCSGkGhBGYADZE3EsfvCoGIMqEuAopf9e4EB5fG5KuGMW6Wlkh+
         rS8D8ftTYLpVKV5iKTfQIYd0v9E2zjTBTfPHtk1T+p3QNUnzBZnt/DyKLFRpdJQ7h5jD
         sex6DHDEoLQOUpB4+gUo4MsUcdnH1sI2os8UJkidevVErmtKVvJTbVyuc1zDYBXLUyBD
         /z8EOA6UGtubC6HBeWh29Av1KRvL1xYqRvTxwbGj4/jPFuA6Q2b6qlhpRRiLIafJylol
         mQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375922; x=1793980722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
        b=dCNKWKcRi68vLiDnOytoJhDPjON/3oaVaqcwybGMR5ulEM3trTWQKdHxBbz/nvWwEa
         TrZ8mFFApneVmVzoTC8O+9Qde21EuH3z+1ozkrujDqqYDsB5a9znqOhBd7pVsdRVJQqf
         gXzbCMGk1rF4asj9ZmUZjYubpQpc6Nr6hRZYDZJH+jRFhA8bIskGvXYYuZATFbgyNM1N
         wtEjyuSnYn9xrOY8aiVEp8iPadhynyTSBVg1wZK5uQMIu8SPSV2roPC+CpxjYw01B4l/
         fmZgADAwWrO0fNl/g1I8I7kdPmTho4bPt8fEPodVzHcJtm0UIFNoM/2i4K0HHkzV+f5D
         +JIw==
X-Forwarded-Encrypted: i=1; AKwUvBxkqaJbb2vf/MWgW8IxmHMuZWOzUSdyDUeW1WRc7MAiQnzCYKf++TDcA0nLEqqpYBjyG6wASLOkopa5AAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlZ6XCeEv3iEK76jXyUdQkqxkAleCUelM0LVwfHT1jpOGB1PZ9
	Ucni8R7/DLIBRzV/qUeyvQNR+JfaWbrNVWXQEuNOSjMoX6PP4KQL5YUOndplVJv7CvY=
X-Gm-Gg: AYBFou1JArAH9WqGqoJo8CTRcZEVJaYCYlLrs5zpkgRa+m26ug/Fhe6uXXUvyhq8M94
	5Bdma8cpggkGT9FmGN38r8NUntYHsf84UEDXwCKLZ/SDhxorj8CIoRXaaq/+Z3jP842rUI39ok5
	dO885U8AVP3oS+3xNhfHOvH5lfk/RdYdc6znqnrD3FJTgsQoisCRH59bR80fBih/vU1+qCBuLXG
	UgkYOSzEt/EWS3rinSL/sR/bQxUHswCykRC16zehyVSX3fMoenJ/8frqkAoSy+b2MZnT+KvbHEn
	7ekTB/R6p919Lj0N86gq7SYw14tf7qTbAKscrSUosek/tP2aAGPjFfKpa+nhw/wQV2kEIi7KnWW
	qJ2xOosrVlcHGRy+pshV+Lwq3D0le6NvnGMYaYdgXBUbNDVPGnA8eseoTh3SDI4ROeBBBfqYcaH
	L+HJU+eVAVHHwDUTUcpODu+dQKW7fkqYuJwC3nAyR4CSXMfY4Al5z0hJxXzENyBXmHuzOvzygF4
	gMS0a0DJUFpmIWkQopZcTvecgOaATf3SIluBVVvLKoSfkYHZIpzoQmSpyZKGDF4G/HoIji39F4T
	Tm8Uerr7h59SXsUciJml5OUWjmkRq/IQUia4DiIk1KhE6IFRp+g=
X-Received: by 2002:a05:600c:8116:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ac182dc29cmr57138645e9.15.1793375922493;
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe885d91esm50402805e9.0.2026.10.30.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:39 +0100
Subject: [PATCH 08/11] pinctrl: scmi: mark the GPIO functions
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1a14e254f011..24e02de543ca 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -486,8 +487,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.0

