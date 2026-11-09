Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212273;
	b=18kMTR9Rmm4Id9U6/bkpKadRG5rJ17GwZXU/O1QDHoIxUrv8pmPp+cqalPp9BOkXMAVE
	 iH1l7j19JLeVXUH5kgu5C8B/Qw5qyQsNNZB3E6ltR4NDnO8D57LtH08OolpIeWC3u3mfH
	 Kx8bG7aDtTInD2f2QqhyDZ50mK+OgroTGRQRsANfrZxfGxtrR5rp53s34TuyCLXN2Y1bS
	 jgS5H0eSTrfnl04UzJLYpD5sGsCCokXNJ7dCvamZ7ysFFRbOQukTiUpSpsM1EJvm6xukr
	 tF8Wd2g6cuhv4EknDjaeg6w4wSRlEx84xEL6la361uc0sEca+JyXJyGvxuPeOzvCyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b+9X6T2J+3RyQAnAuQX9Fg8kfH/4OEFG3vx3P/BfQ/w=;
	b=CYzvpewAn00EjcUKr5u5ZDzjLd59itmsWBMUuv7NFyYVBmaDVmunxO8I/T1B7hf2la5L
	 VpdFX7DYeeMe27R8YzMuT+eMM1wZZGDDqM9wTOtLn//zeoWxeLS4R5Wp86O3S4ncVlmD0
	 LgDXLdj+hNH3Wnf0aoGUVgORf+bAwRw1rM9Cpv71NeyqFFH0MYYTi+z856HpJdshB5tMG
	 /+HUjkJFjsZu0K/fVyaKXDtfLUEzIrlr5vhH0bIuztF6eMOsfBjx85ClC80tWMATJtshe
	 4PUAKX0ZrkxN++zogfCu1QpqfxubxvxFpX2vl7cxIDnIs/B/Jc3DVvRqeD5+bXKmA9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNwUGG0A;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2F606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B2F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNwUGG0A
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso689555e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212270; x=1794817070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+9X6T2J+3RyQAnAuQX9Fg8kfH/4OEFG3vx3P/BfQ/w=;
        b=cNwUGG0AArH5cx4a7e4MD+zCA+4QMWJrHBWL/IlUWzR/olJz6Z7EpQtiN/14oRMwkD
         rd6nx0nV3z0cl+SnMQhZdJNyT+0f8OS0XEsW+KkRYvWwNr6xL04201nbK7SNCyIQSnc9
         fEVP9PLwBw7ZYua+6T2/5CHi9UHXhFQChTrMBNbYfNi1v+hqyK1vC7psID22gZnTnKri
         z1YToM3BT+/6iaaVtPlFd8l7Rk6iOKhJledwFe/caQwXuEPPzetJaa0/BL/y0+sphj2g
         7AKY6ekf2i1xGjO7DSq0KbHBXex6XyxQ0g7epXQcWQ1TbL6+rlT+5TDd4qLjz5BC+G7K
         b5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212270; x=1794817070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+9X6T2J+3RyQAnAuQX9Fg8kfH/4OEFG3vx3P/BfQ/w=;
        b=QWfpMDs975YLkpJow2QSJAdW0xw5BSlUAdQMdQtxW7eziycTWNgMqr23gczs6P2+wQ
         CeRbFZ0hjCm+TS2BAiolB1hJZIDWVfFfEvzwb7VlonWSsjUmQ8mTCnXRrTuVgumQHhsz
         C7S/xpRcytCBB2rRp+1SYyC3EX1JoWvCIIt2IlzB7y7KvhbSC+Kt5raUdMFnz2Ms8TTc
         34YZlyi4msnGRatjse9cI4PnIFyGAdMKnLm9rxSMvMSPdL/5UJ1G0GIFMvHkE9+eC8E8
         NtWSGHN+Cgm/lG8TJdzPzw0QQJeC48UxMGIiGhkozYbR76K1Ct2WQLJ43Y+CV3grTZff
         Anfg==
X-Forwarded-Encrypted: i=1; AL+hErGKXPwbN7IEroJ37voOfH/kRyS5TE7fKfmZUtc3U/27EDX2aGOJJw4YGcKPzEazjmZtDwsRndAlEHlObDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JxT+0ynyPG+fRT85iFnKZJrW2sajv0TKr+UPHDL+i4vg4e637
	+GehhT1r0q8ohrLit4mole6r3h9oTox3vRnDOM+BMTWb4NVtUlWLcziV
X-Gm-Gg: AYBFou0A2byFUb1piOPEUs4GEq2Zx3XT5c0Cc8JC1BdAxfPY9lNdvXl+pV3zdfSbonK
	alhBXArsmeU09geDRNYAi25drk0rx7MJWKFPOvZeOvRFCAC33uc2XCSIpTs3Cq8ZcLi16VHxfap
	2Uy32hzJuPDzVjegBLDSjoiu/SOk7z0GufZxfHHWBkbOPUg4J2xwhD6sR8oF4YQBAhzRtX2Kbg1
	HEvh/qEknX63wWsmH2kZ77FGo525AEZsxa17/VEoHMhk1g7aqWcKUhmMBmoyWgTtuJjX6OnHOZ7
	souYq+iaJ2B/LMyE2zpnV1MBBO8Gq2DO8rZnFGOIfQ7DbBM7z2mECDyfnUr3M63XLkk3cozpL4Y
	08Iir60Y8jMBNvgI26cKCGPq69N0J24r8X2VKoIbx/gDKXbjG+uIaDR/b9ca5JO33HXk6TzCR95
	G0EMJ4I1yGe1ToepzFpTvFag0lZE1dCqglUejt4bDSxP79ltDKK8moDllkPlmEyTp5oo/I+XeOK
	qc/AJsufT7Lbi2xZNlGA559lialSWZOxeJaAA/7SkyIG5IV8s4t2Ub9XB6tSJJpKGyO62Xtih1c
	3kVp1JBWOgQjgcSuONluZXAGchxIJRAA7TUD05W0vQfAkTQ5gW6Ym4F1jhBHwBnvUYf9
X-Received: by 2002:a05:6512:3ca9:b0:5bf:a209:f81f with SMTP id 2adb3069b0e04-5c14bffe580mr794288e87.37.1794212269955;
        Mon, 09 Nov 2026 00:17:49 -0800 (PST)
Received: from zephyrus-g16 (89-179-242-53.static.corbina.ru. [89.179.242.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b81d098sm726770e87.67.2026.11.09.00.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:17:49 -0800 (PST)
From: Evgeny Volferts <eugene.wolferz@gmail.com>
To: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@smmh.dev,
	eugene.wolferz@gmail.com
Subject: [PATCH v2] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events
Date: Mon,  9 Nov 2026 11:16:44 +0300
Message-ID: <20261109081644.2790549-1-eugene.wolferz@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015163029.107250-1-eugene.wolferz@gmail.com>
References: <20261015163029.107250-1-eugene.wolferz@gmail.com>
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

Some ASUS laptops periodically emit WMI event 0xe5, which is not
associated with a supported key or action.

On the ROG Zephyrus G16 GU605MY, this event occurs approximately
every 12 seconds and is reported as KEY_UNKNOWN. When the session
is locked, it repeatedly wakes both the internal display and an
external monitor connected through a Thunderbolt dock.

Ignore event 0xe5 globally to prevent these spurious input events.
The same event has also been observed on other ASUS laptop models.

Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
---
Changes in v2:
- Replace the GU605MY-specific DMI quirk with a global KE_IGNORE
  entry for event 0xE5, following review feedback.
- Remove the DMI quirk and associated key filter logic.

A similar global fix was independently submitted by
Seyed Mohammad Mahdi Hosseini:
https://lore.kernel.org/r/d3871d83ee3f5eea3900d8bc0da1de764a8fc2ec.1791672579.git.i@smmh.dev

 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b1644d..6e784a4909a0 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -662,6 +662,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0xCB, { KEY_F14 } }, /* Fn+noise-cancel */
 	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
 	{ KE_IGNORE, 0xCF, },	/* AC mode */
+	{ KE_IGNORE, 0xE5, }, /* Periodic EC notification */
 	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
 	{ KE_KEY, 0xBD, { KEY_PROG2 } },           /* Lid flip action on ROG xflow laptops */
 	{ KE_KEY, ASUS_WMI_KEY_ARMOURY, { KEY_PROG3 } },
-- 
2.56.0

