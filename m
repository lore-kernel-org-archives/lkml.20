Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C23BE659
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788215629; cv=none; b=QYzqmBPQTceg+CFHjaNyI0SNoF0/Kj5bq6PfVH7+7aXDUNVkn6IpP1zyY9Hx+I4iggCvq231ZnIAPA/eh5YggfqRRWPVNpCBKSl8TNWX+XGPVCRdB3NnIMnyAiquPdG5uCP1LkQ0HNhsnsNPdByKWUSc29IHcPyZXpVqhXrX+tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788215629; c=relaxed/simple;
	bh=UwgdN0K7gnHlOTkjqBBhV4oiNuExOuc6FRGBeHc9TTI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fc1akT0u9ieWwIsme7eNaLvdY7P9yU+JVZsqgHBB+NqdDCF6bEci/OUyfaQKZGX2UNzzDXmVgzyu9sjfpgOGoVql5D+8HvdXxvzIN5sGMDZfmsQ7WwbJXkSmYoe303KB7JtkWSjOETzWFHiqqmIw8QxbnybZ3vHccFWQs5icsLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Hq2s6VTC; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Hq2s6VTC"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f18c0e03e3so2403093a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788215625; x=1788820425; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u5FPFvneOuCmlRH9X10KUb8zYPvC+ewoTJvlKieDUdY=;
        b=Hq2s6VTCvFwXIZ4hAZjRlVNsmDgGndyHar9FqyRpVEoEzV27FQv4scuuQoyhLHRnpY
         BFtaFH3xjomcjgzIrBitsXci4W0W49hDVHuYU18wj9HN8YIVfZGzuzZQCmVkF9An5NkT
         bzbJ5OV2BBZ1tc4g0FKdkQJqr3Jm/Yd2rNtdh1kGGi/8JEMbwwNT8rfedisY/AIAUqvv
         negfQsp1qm0QZptuHH+4Q0gKfkQQov+8fpxJyGd4OodFIM2+AFVDOtTu3/AU1HS6kv8k
         4q0KZ5l9OWNkEXzFUgPe+bDtL7igbsQDXaO28HdH1hCDBwzfjL40eE78wDij0rvOICPU
         Ya6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788215625; x=1788820425;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u5FPFvneOuCmlRH9X10KUb8zYPvC+ewoTJvlKieDUdY=;
        b=ZS9Y5ffFlAvwaZjlO1+9WBPJohtazBiqd7xlkCQNUI6b7X2QHjIKkfc6CjIQ0JorzN
         QnF8qs6lgpvRMhPhtp/K2IfriZAVSX+EXJHU2yYjx8pjw44juuxHFegPx1N3rGOv4OAu
         4Us/u2ZoqQZPJKYVhTQLUEwsCsUO5Cixk6MFu0Fv0llXl4mgjX+p/jbzpEPx4by5UO0e
         Vww49MfVeaL9nDKSbOChSVIhzmDEOjwxw3gyjjZTj+CHyK+GK3ffkUE5Lk/o8ti9C9Cv
         AaVzuzWFOm/kXFmUF9UnlTwHoC21QppL3EoakR8QAciJSAApVCLMBfxlECbBOk8xSjox
         7tAw==
X-Forwarded-Encrypted: i=1; AHgh+RpDc7533IzbKLNMR2KHc4limESltgxAnzJNa2IzFqdg3eYgpnyy7wsphk23bzlooHiyty7pidXMk71tauU=@vger.kernel.org
X-Gm-Message-State: AFuF++ljw16aNHze505jX2sj7NZ67nRyQ5E1V6ybdocpSxl+itrCTkY5
	5Y3ZfPq2rJjdB5t2PNWGsbOq15gwaJLtT+UtOFw1qgsHXLOBhzj9ugEWEp5Ekb2VpSeKXJYhiEA
	N5ofQ
X-Gm-Gg: AR+sD11nWfaYeNDrscBKnp1JE3k7beeISiwPHxEisn4qUOVUtRDAP9tjoJ9jo762Rzv
	z5aLhvOp3JBUtkuwIPtXuc+Y0vvPKVkj6sxh4VyhB0vfFvxYD/gsCI3yEnyJq28kRmt2jb8hb7r
	3ZbTrtHS10WM9gnBH4/eyUsDs5QpeKWRRhuT6wE5HcHKWrqq3LYqO9zIyYED1DFHJ0A0kp7jqFf
	oT7n1N0RiO+te4RSQVeUiKWO0GAN9DMZXLKVcowMVzrj/k73mn7PdB13MZjFhBwaKITIJ93+AyD
	MfN7/+fernQO9if8Tzd5OCxIOgcVMT+UlSmfAMFVWQG0/RH6pxRnCosa25QbhG0PhevtCtq6Puw
	lTQ9XP9Hf4B1KbmKw2EaAcH17rTIz20o6hUKIHK5sddcGbsiKPw8V0VwUJDL93/i7fQi/2xqNwm
	A9XNrS3SiVFdnP5f5wZDjLhfLnulXwhyJ7V803b6axpM9rfZ0M1liHNQbSgW+/BzBk
X-Received: by 2002:a05:6830:828c:b0:7f4:d68b:dff6 with SMTP id 46e09a7af769-7f4f22fb1efmr32935756a34.7.1788215624843;
        Mon, 31 Aug 2026 15:33:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:778b:da9:a8a1:bc78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa7efe09sm9190551a34.11.2026.08.31.15.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:33:42 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Subject: [PATCH v5 0/3] iio: adc: ti-ads112c14: continuous mode support
Date: Mon, 31 Aug 2026 17:33:04 -0500
Message-Id: <20260831-iio-adc-ti-ads112c14-continuous-mode-v5-0-76f80a04b94f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQS07DMBAG4KtUXmPiV5ykK+6BWPgxaY1IXGwno
 qpyd6YpEhXqIqyskWe+f+wLyZACZLLfXUiCOeQQRyzqpx1xRzMegAaPNRFMaNYIRUOI1HhHS8A
 jcy4cV9TFsYRxilOmQ/RAved1y5paadYRpE4J+vC1xry+3eo82Xdw5Wr/dCT4nDC/3NqINRkQH
 oZQ9jucz1WCIeJthStUeGLigVy1Y8glpvP6hpmvw/9bd+aU0Q4ss41RPRPsxZrzR7AJnnGBNWM
 Wd67kG12BLlguvZEttL174MpfF39soyvRbTQwLxlop+0DV925Yqur0OVQc6NBMKO7P+6yLN8wv
 oKNMQIAAA==
X-Change-ID: 20260724-iio-adc-ti-ads112c14-continuous-mode-dd1580754609
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3174; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=UwgdN0K7gnHlOTkjqBBhV4oiNuExOuc6FRGBeHc9TTI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqlgEij8KTjWtZoJ6FBNDr7783jPXDDgTXTiSfu
 omkUCiuW1KJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCapYBIgAKCRDCzCAB/wGP
 wP/zB/0RL909eE56rrerP7yj3Pr7E0XwhdwJ1HhvbsVvaooW/afDYPvto/zRpyPwtj6dHSQTJPa
 Y01DhSuE5QKS5M+3fdb2UlohwrasSzZHubtNgtn8aal5qIyAeAkRzAfKkvJ/3A5NX9SXnPxCXW2
 Rm+xRNSCfw9XQPbjEU626L5GfiNecLB/yrPZ0McQ+54MA1wC8A/H1qajQ1lT80mVVMIC058+iM/
 kMaF2wNNvHlCfITjX4oPCDjC3hFXVeO1hZ3FuiszpLaXaU6Yep7+DsM1/bPfku3Dz9dCygdKim+
 jD3j0xwMYTWdFnfbncQTa0/nPqKjoUOFeR7k+lfKLwPXUb7y
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

The TI ADS112C14 ADC has a continuous mode where it can trigger
conversions using its own clock and signals that data is ready using
the /DRDY line. This allows capturing data at higher rates since it
avoids the settling time between conversions. But it is limited to only
being able to sample one channel at a time.

Users will be able to select between continuous and single-shot mode
for buffered reads by selecting the trigger. If the "own" trigger from
the /DRDY interrupt is selected, continuous mode will be used. Or if
some other (software) trigger is selected, single-shot mode will be used
as was already implemented before this series.

Supporting open-drain /DRDY is deferred for future work. In simple cases
we have just done a `drive-open-drain` DT property for this, but on this
chip there is more than one pin (GPIO, FAULT interrupt) that could also
need to be open-drain and not all at the same time.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
Changes in v5:
- Use a flag set while the buffer is enabled instead of inspecting
  indio_dev->trig in the /DRDY interrupt handler.
- Use ads112c14_using_drdy_trigger() in the trigger handler instead of
  iio_trigger_using_own() so all of the checks match.
- Use update_scan_mode() instead of ads112c14_validate_scan_mask() to
  enforce the one channel restriction when the buffer is enabled.
- Link to v4: https://patch.msgid.link/20260827-iio-adc-ti-ads112c14-continuous-mode-v4-0-1e51a6e20a69@baylibre.com

Changes in v4:
- Check for the "interrupt-names" property instead of "interrupts" to
  detect the /DRDY interrupt so that it works on ACPI systems too.
- Add ads112c14_first_active_channel() helper instead of duplicating the
  find_first_bit() lookup.
- Use regmap_update_bits() with FIELD_PREP() instead of
  regmap_assign_bits() for the CONV_MODE field.
- Link to v3: https://patch.msgid.link/20260807-iio-adc-ti-ads112c14-continuous-mode-v3-0-76e0d30e6c6b@baylibre.com

Changes in v3:
- Leave DRDY interrupt always enabled.
- Link to v2: https://patch.msgid.link/20260731-iio-adc-ti-ads112c14-continuous-mode-v2-0-eb13da38e8fc@baylibre.com

Changes in v2:
- Split out irq and poll code paths into separate functions.
- Split refactoring into separate patch.
- Use iio_validate_scan_mask_onehot().
- Just return immediately on error in buffer_predisable().
- Don't set default trigger.
- Code style improvements.
- Fixed null pointer dereference bug when no trigger.
- Link to v1: https://patch.msgid.link/20260724-iio-adc-ti-ads112c14-continuous-mode-v1-0-9eb0b7a4f020@baylibre.com

---
David Lechner (TI) (3):
      iio: adc: ti-ads112c14: add DRDY interrupt support
      iio: adc: ti-ads112c14: create data read helper functions
      iio: adc: ti-ads112c14: add continuous mode support

 drivers/iio/adc/ti-ads112c14.c | 298 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 269 insertions(+), 29 deletions(-)
---
base-commit: 26bdafb3bdf58436579a1f6f0ef1ddb9011015ea
change-id: 20260724-iio-adc-ti-ads112c14-continuous-mode-dd1580754609

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

