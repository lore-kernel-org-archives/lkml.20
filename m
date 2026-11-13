Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606350;
	b=4PpQhbVSRpFm0zWEAs7x4F+Vwm1Muhhoqam39lk66xX4utJAx+eXDr2FoPuZi00rwcF1
	 u0WWdMKsMndVE2CZk8v2IRotRqMMfCsIWYiVva3B9co3sR8G9boQe5EZtzxswNagZsb3P
	 Ma0fXeJp6+Qxcw2rF81qoajmfxlGUXRzIodKi5jGvIjK9qXt7ua+Jyvd1oeoO+AFz0+Rc
	 zfF0aXc3aYxumLEt0QTovRdxr1gFTXme03uejNRosgqElFzQasT79BbkGNxIKRvYsSetX
	 BuryRJIVDXU1MQsZQW2wfiznAYcHfHvI/+6iRUduZouQmuf4JkC2homEcCbGNvCvJQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
	b=nD85exkNuuK+CHVP/smUh9g1Jv/r6hcM5Xx4Q4jE93akrTRfRXYNC9Hwk/dvO0TOXp8e
	 fx4tH0MTWH6bIDTX28Ymkk0OsY/62PBuHM+0sJx+WFw+fYBtO2+Q1ujQCRLLjrme4bY3H
	 vsdgGrPJsxyp4wnT1uQs6g/svOnfHFsBalkPOmKCeYdc/8bTR+EArH5JKlfaIr4me75Nr
	 nvbYT4RMcFkxit7yk5egZgQRlNVRbFee1nujb31DeogV8f/qvmgy1QiWHeJhktfLjDkto
	 0ZgfUNytrBgDsxdUmhimZUA5BZUpouVk7HSkrXKkSFP9HPCAnpUg8SWmB7zii2880Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3uGx+gv;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE4606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BE4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3uGx+gv
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8172555e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606348; x=1795211148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
        b=U3uGx+gvuZDprzJ4de+g1kPBhFPsmhOG8fbWOLie4ZXFQmNrteTZcEMXX6pVg9UPSU
         cApvRPxr/1uid9VGXaDI7fxh2MVOBcFRqUWH2DHtD/cscVA6C0/NzWKxVDqDhoxyWuGx
         cltzpA08sMXM/KOaBCfELHrrJjlb8BLhdMc3huTbz8UuIWR1aETLtG9wFjgS1xjlGo1r
         2eOPseEBdATET3c5Do4XzqBYi5H4gmQt7RdvuiujvD6mjqz43N8dP1uaK3MilzfHJewQ
         jPGJ+jJhe+0ogNdVhfniiW44qkUTFtHl5e+9i+IjD8ywpaYz3ECFIbZKhHmmPIkOASZM
         TFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606348; x=1795211148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
        b=AG0O4HqUsewp/ayiMPJrJzxm/IwEJj7kpjbcrnMO/vmovhXFIG9wdJO906iwqvrfbA
         3PyNAsxd76ujB3kDtNiJMd6tnyyRVwmY3K+bERE0JFIiC8zXGZbR+fZGbCaC2yqwmW0M
         kjKFk296DRNJvEfomj1iOwOxMSfNwLFNOutLkCgnedXSmi9wFKetpDjBia06E34/+zVR
         44GGBokU/F/6GXTcC7MHR9Ci49v6DdC7HXExWXvW0f038sut3o/ybjBEuhur8sRCJ0mk
         Jvhp8p7m6/sP5XKfuozkiDXceb+LwTb5RD6RqMtRQZy8j1flTg9H9FY5mFYXDyl8gtQC
         C17Q==
X-Forwarded-Encrypted: i=1; AL+hErHwvnuuWG7JGloQ+cTcED/fI12wAnGHLdsXEGmcaJl/b/Hl0R0Co2lh3/DaRqj+ZUy5X4ILkYv9dXlnYh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ua14R5ddMbpcAjMEy3MIe3xTINHJsBj0JH/LX107txt59iB7g
	AzYa+4AmH2kO2+dC2cwmL0Lj0lu5Z0XvFQQk3N2HN+7oaGmpxw6JBkql
X-Gm-Gg: AYBFou1FthlCD11n3LgukEl/oCM+T86ZYvGxqtjypBZ+sJ9YKEV6q+EoI+t3j8wY0hZ
	puVk9fSwl0NPrTB5LtFPBpx2x+WEj8U/VjiBGwer75/tYBJE3moKPRPf5b5ckdFuyq+ELaiT4Cx
	kQDzIcqTqSDskw2PI93slI5rwCz04qWj9pa6GgHhB1nHssQKB6SQyLvtsB94zBalb5JCIwU3KEj
	/CRUb7cHT+6l3irB0ZExdzodtpKXEeq3QVPCEzKstjsC96nSLh6eAQjOKYBqQ8xanyjXtdENB5w
	ohkiwMZLMCNuXkfZtt01TR+3c4NiYI01uop8WkSXS87WqjnPcRqX8W7i8VmBr4gtOftB4PpF+gb
	HCpkZJgJxgHHmA4kNIXD8Z4NUAxUrIFkNNqAr3Tg//0hTZFmnIRnGIWMjQUIHo30WdMPa9g4vlo
	Ej9uvsZwlkxMkVIL+ba/mUeItCtF5QuEXd5iAcCgwRq8VonFOiMz3wvF5jWYICibnVMxKOTy+Be
	WsJSVEzomkpNRVs9IFqC/oFIfpR1savTmtCcv5g6YXdf8HB1ypkrrapeUwllqzXpCXim0SUbg2J
	cXfH1s+KCx6IHFRYeO0/kK7oOZJWACUJrrlLnT3yhnV//XtROg==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr82664865e9.11.1794606348036;
        Fri, 13 Nov 2026 13:45:48 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e294420sm175346295e9.9.2026.11.13.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:45:47 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] ASoC: qcom: common: report line-out plugs on the Headphone Jack pin
Date: Fri, 13 Nov 2026 22:45:35 +0100
Message-ID: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The WCD MBHC classifies high-impedance loads (above linein_th, 5 kOhm
on wcd938x) such as active speakers as SND_JACK_LINEOUT. The
"Headphone Jack" pin only matched SND_JACK_HEADPHONE, so the jack
control stayed off and userspace (UCM JackControl) never switched to
the headphone output for those loads.

Seen on ASUS Vivobook S16 S3607QA (X1P42100, WCD9385): active
speakers measured at ~20 kOhm per channel were reported as LINEOUT only.

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 sound/soc/qcom/common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 5dc954dc1cb2..af5cacddf67d 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -335,7 +335,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	},
 	{
 		.pin = "Headphone Jack",
-		.mask = SND_JACK_HEADPHONE,
+		/*
+		 * WCD MBHC reports loads above linein_th (5 kOhm) as LINEOUT,
+		 * e.g. active speakers; treat them like headphones for routing.
+		 */
+		.mask = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
 	},
 };
 
-- 
2.47.3

