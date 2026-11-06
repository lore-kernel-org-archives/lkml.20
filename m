Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995715;
	b=rky+iBNnD0//84+adEZI5rLwb+r35T7+J5KADczWmGi2bm1YJfgZbtWjdt+A2Z3JOlfl
	 hndz5HdwsEzWfa7xAGFFpxpEYOqmcTQNm4KQBL1EGzSP1SqIId4B9hrVK5FNm9hIrje9L
	 kdvy8gxxM8CTmWgUzROv5TpOsMQIoTRuyZZKCalJKNyZZKb8VegTXZBChph+XJ/O3j5a3
	 r8xbhmJ9xKnknAF3wOfSACSZXmHWyA9sasVJDFsdj+3e14aR1HEHNWChB/b99ugfwY0CZ
	 jfUmhVFkmrd6c/LHpq8+2K0wUYWtuKPc8dnv35dQMWN0E+RBugMbEWJ45dREPLDJYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/izIbDRAeUawScEMYwccdPIVGb9e13gPN2dhH/CsbGg=;
	b=oMIwg4QYMp1cq5OLH7ZD3dAC8yZbkLR2h633k8PVENhh2VbAuPwD0zaYU3JMOuQ9GSya
	 17LKlAEwFCJsEHguPUjwfNm8D324Ou64lmiEQ8h2CqHIQHVpsdHSJOZWqX1V/tzsuTMeb
	 WxA4RdueTAYOJOu6f7UGbUNm3v5zlZO7dQHp11PiTGaZVUX3hS0iDjrezlvlbci5OCQTa
	 7EnihoVYbo9lOdbR3a0UDG6aN9HyEptmoAQsgKIWNgTaryh2UTx71mRuMc91f/supR6do
	 d9URtsftqwJeG+YgSly1FWS42MPre8TrLeLSSuGHo9j3Lf4ZmH22jy+/puo8N1J8O3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ct7Rt5O5;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13AE606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13AE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ct7Rt5O5
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so7653895e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995713; x=1794600513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/izIbDRAeUawScEMYwccdPIVGb9e13gPN2dhH/CsbGg=;
        b=Ct7Rt5O5hRSK1vIxG5RBjzXK+jQ42CkDB7+Xtjgm7fcG/f8A3HYJO7l1ns9blSk8iH
         FLPSMUKYRVgNA5+4GhjUWZA6iZ9SPG+aqDg10BVyTAPcHlHuSC6+1R6ynUc28tx4codn
         upK0LeYFC5z0XBXFmiK/yF9rvRXuyDFjL0nauJJgq5xfgIepfOSAPosT+HglCOWMOkSt
         xnXA9LkqeB2+joZ2iQQLAiAmpDx0eX3oaNkZYxGO+Buac7gnlPJPWpX35mvJrVaCoewp
         UYh4H4ElT4VPIyXFD6HKX0NR6+fhNcf+8SLIgeW/FIgYALTbh4PbRLZm8hRWosFJgZpf
         qd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995713; x=1794600513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/izIbDRAeUawScEMYwccdPIVGb9e13gPN2dhH/CsbGg=;
        b=UuXz3JYPmkuOBFkVLe6pyv3OIGMlAZDfmuhmcsjg42PUt/+OaZrqEIRG7F8haLGeyM
         emCOBOEa09D0qI+58JPoC/1OCapAmudwZJz38pMOU5cEyFqM1AsS6K84PGOwZG5C3fkx
         23wl1tLWzbU7RVLROvwf6/jzXhar4Iq37dnOrFtjH1Na/95OLALZsE+ri4BoS853dOWa
         8YJ60rCw6A7XjoxCQM/GCMJ4e7DFjILYblF/+Q8BSNYt0raVI0XeE43XcvKR0860j6J2
         mvk73QCv2qnhiFUURfsOE0xri0E0zdCFlM+QXY6+XuZV4+f042OIuaSHbRXCHxp+Sz+5
         dDNw==
X-Forwarded-Encrypted: i=1; AKwUvByPvXdc9TjTN3RG2BoFILs2yk+IfG+DfeN1FAXKCQDM0Vqsri7WvfozeKtXb1s46K7GTgAdLM0rqvZF+Gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z89sp25hZkDc98QtcnpTRzaEyEk+TQsSPCyV0toW8yqA8EKwv7l
	Ld9qtTDndUyjqKT2u+/fTI4dqArUZZ9HjP5WDvZc5OiIVCIQoOA3Xrwz
X-Gm-Gg: AYBFou1Cz7Vv1ljgtEsDzOQcx4htTNcBR6DKQqqUONpbamfqYBzJSCPAw8rbYOOLhFU
	dRH3/U+FgOhXRrLGxHd+361zsQZJr3+GhGnGctevVSQrpQSwS9LbVDMBo36rFEjIgab320yRDdq
	p1pyjKtJ8Hz8j3KWZVt/1bFCaOAYrD75vuwDDE7QQObBy742frFodBKNdVUHzwydmAtO75/ek1V
	7GYI0RYuOgpNvIDz8W+3nc7zvRCcRhLSm4UL2a86OCtixUAm171hHM8VCVu5DUG8//aQqc2RPpz
	JY9DvXqRGI9/Dm9GkMd5yWv1FH2K49JBesww8fHgQO0EcCWgGab8vrJs9y1UUjmXVuVCeT18GNI
	+BAYb3C1ZOBqda7wFqr8so+tWnSMPQdwNNWrEEVogZ3jzMWtbJ5Vv2hMZomZUVz5mzS6k4MmbSk
	hP72oF3VV01IMbceut5vxK9YGu6kxuACLIGZDHLv0H8vhbSUQgtzAn2JyFLJxGg63XQN6TE5yGl
	tNo9tAp7Hju0j9UKRLYq6pGjx2UdvTjXUPwYC0Y0RiKSM8GnQFaBrkeKOvHuy713AVh3LKZESbf
	vySH1OG9x8PJj8Fip9389jkbYNoMJr/06zuqCA==
X-Received: by 2002:a05:600c:1c23:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4b6df3fd28amr69391975e9.24.1793995713061;
        Fri, 06 Nov 2026 12:08:33 -0800 (PST)
Received: from fedora ([154.182.80.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbdb9cdsm17132835e9.1.2026.11.06.12.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:08:32 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] iio: adc: at91_adc: fix NULL pointer deref in trigger removal
Date: Fri,  6 Nov 2026 22:08:09 +0200
Message-ID: <20261106200809.53799-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
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

If 'atmel,adc-use-external-triggers' is not set in the device tree,
at91_adc_trigger_init() leaves the external trigger slots in st->trig
as NULL. at91_adc_trigger_remove(), also used by the probe error path,
then calls iio_trigger_unregister() and iio_trigger_free() on them
unconditionally, causing a NULL pointer dereference.

Skip NULL triggers when unregistering and freeing.

Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0ac74ad92fca..c7fc06214c05 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -660,6 +660,8 @@ static int at91_adc_trigger_init(struct iio_dev *idev)
 
 error_trigger:
 	for (i--; i >= 0; i--) {
+		if (!st->trig[i])
+			continue;
 		iio_trigger_unregister(st->trig[i]);
 		iio_trigger_free(st->trig[i]);
 	}
@@ -673,6 +675,8 @@ static void at91_adc_trigger_remove(struct iio_dev *idev)
 	int i;
 
 	for (i = 0; i < st->caps->trigger_number; i++) {
+		if (!st->trig[i])
+			continue;
 		iio_trigger_unregister(st->trig[i]);
 		iio_trigger_free(st->trig[i]);
 	}
-- 
2.56.0

