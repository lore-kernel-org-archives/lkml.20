Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243131;
	b=qiveFIOM3LSpF5VOFWh6KIHYyE0iVBlu0pI5r0VObQSy9KISFwYHKH/LX1jgNsn74IW7
	 lhWMhyFN48DpDjHCwxouUeJYweona+bP4PocljcQJWVSdEU30+Wh/OiHzNcoCxtYRXUq+
	 NtZDJZTPUssD7ddVoLLkBDhKG9J1vODNIf4pG7slCcNJLdA4u1yLpA69/HRy3TZbc5xXF
	 BaV9a30fGpMHh6pBhVN4HD8ZZV133NniXDm7LpTB84yl2WWLLCRqefkA9Ax4KQBKAFUIi
	 UK8D4quTOyo5w+v9/mv3v4F14bG3atKjruFrSSboMww70AcDo4boCDKpSG5GihcL5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1oVOrNmAbP6cMTYfxlkmY7uJOETX008bTznAwaUK8sM=;
	b=xuQPqUV6dKO0MpRUp0awxDELmSl5h9MbGGWw3tV6fZ11Hizgi+TP7MqaUvfJPnzr7/nC
	 LQJdO2slzNtB4VLPL9dLQEBQV/c6SDLQ+Hpnph0s/Lz8gmEAL/JkfPlw78DB9vZeq0bU4
	 S9QFWBEdNRsxQDFBdD3wosPOlG1gA1bIV6gi26MLYs+e5jHhDrR88YNrL1L+XRHHBcLok
	 4ERpspneJgh8j7PyJTs6fdFZg37jAffb2xdjyLDE0aSCQHu/kYP2EybAgxAfBGoXwBF9d
	 125UdQE0FydoZBl/qj5yq8nLDAgh2I0yGDAQ45r94Fe3ts1uyvcgiMHv76xS2UqI9Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u49hmJFO;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2EA60A2618
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2EA60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u49hmJFO
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so937786c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243130; x=1794847930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oVOrNmAbP6cMTYfxlkmY7uJOETX008bTznAwaUK8sM=;
        b=u49hmJFOn9B0OPU9HvxvsauaAchGsbN74uXaEXpzPx+G3roYJ2a1IbOfaUivkL1TTF
         Nt/kBuvqoI3abFNO1KYguKhiTsizz0P2QAx7AvXAnbJ6+ehSfDpWwHzog43iOwF1aCT1
         Dd6SBsRSQe5Ai2UWuzz8EwoaunLM14UfXv9wNQWJC/PXJH7WgUPkNnESdDp1C37JItGV
         F6vVkC1B2bGH+5Ul9JTR8dzrRCw98V9EXJKqgl22+oSh/OFSGeK95q06q+wR2ubM75Su
         EtoExibvXMFfC+zBQR0E3nssfZWxU9JnNX0gv70IFVy+4Z68Q/si1t01n2Mzu9kuAQjD
         98CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243130; x=1794847930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oVOrNmAbP6cMTYfxlkmY7uJOETX008bTznAwaUK8sM=;
        b=1yQM4xMel4lUNIHtMY+RnBDWjEVYhGr+k0ZTwLYgPyTB0aXFuqz8C86ds7fQqxZP3p
         ge7yGxmlkR7ST2dL5XyqWy5hl39mLjTYx2Lp/VLWxfwMMIT+Kmb28TqxqNTvaIXKjkV+
         00tlP/kL/Hip4J8BA71E9D+KDYdtCbjpAGTHQQ4NVdPLMaQwUxY/49A/Ofwb4BeHtlS2
         FhUXaT+WdlZAw0xqv9XEhYY3tsTgdoXpxrm0HEL1GvsMqlliG/93+WjK3iYHdjfLRa6v
         T+cXA9iPWKhmWSLo927WvAsm5TK4uhJ7mm2rYE2+Su4BWkGT3b20dy7m6vgUE4zocm+J
         GugQ==
X-Forwarded-Encrypted: i=1; AL+hErF1dYItUQzxggsOEH5YT/G7MiX8TCgOdTwcilC0WrdUglvLurll7pfT79yfB/UORhR6FjxJ/O7shEyqE0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZYGs6q73iXt52KYzHX3qH+fP29yBIihyLf2aucS43p5vvXQAo
	JFLNshimGZ/0WKhbxXwdGfAs4kNg8xM/CryC/W8DTENtfVg1/pkxJ0Nl
X-Gm-Gg: AYBFou2oLqR20sfCHJyPIsDrnqLP7ufzwHO1gqxg9eKEbs9K5R58N0Le8ch7i2FCu/e
	YC4HzvFUN6HhqtjZ4VCsfyvoILd9YbkjS2NX0HOrdXHt54zcH3mVUc3NozUHqJdYz8LQsN/on2o
	bQsoq/HLy9T34VqM2qm1Il4k+YVG7fgoPgSW0Pcmwlhr+Ggemc/ugNzKdzH5z5OXfqzGbugCMLF
	Mz8jP1adpPQfkU+MESOLVCmFRW4J5N6jsAt9Bl50x20iA+12LfCTjnaAIVDjZEOUfqnKDhDQZto
	FnGts+MLgkL1r0zaclzuhHxYkeVHuYrLVEdtAGNeBuVKs4kBLM9pi2fe62J+lzQK2/K8hWe+bYW
	YDA/6uPAoff+IZWyvZPOcchLHG7uyI0M1k/wGUlN8FJbwKzJqEQGBV3HrM8jcEqG/atEAYQjzZt
	UP0VKtm5l5JOAJ+SA3E9ocgkyhPhcNSib6u2J+Lw3u4yxvg8kuQQmzQy0xUPaog5wz9ftNBqrnw
	rphMTdyj9z4IZsOflByqmOUN2q/Rtrk2jIHFJRrODS36FzSP5/8NJFJC50Hase0Q4xRAH7OihMp
	CEbQszW7X32aoOuBa173ifiuDldT3Z3irjFOpLHIgfUEqVJOQj9ZBx0AUfLKGHtFweT4nxJ292x
	Arohiqj3JwgbEYh+hvSkDSenIdkqOCFRm93wM/ywNU1HiRutZ+Ahc/HpWnLHON5K8iuDyzjsP0e
	mPcOvLlKIltjGX5uzx9zPr9o43UKcSg3DzqRdNrWLPrn5C4I3Xdpq+/wZ94fAetcUU
X-Received: by 2002:a05:7022:1114:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b39feabda0mr6979052c88.19.1794243129673;
        Mon, 09 Nov 2026 08:52:09 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm307041c88.3.2026.11.09.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:52:09 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 0/2] iio: proximity: sx9310/sx9360: reject out-of-range hardware gain values
Date: Mon,  9 Nov 2026 22:21:51 +0530
Message-ID: <20261109165200.305266-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sx9310_write_gain() and sx9360_write_gain() squeeze ilog2() of any
integer into the register field. Values that don't fit wrap around,
and 0 and negative values turn into the maximum code, while the write
reports success. Reject those. One patch per driver, as the Fixes tags
differ.

Changes in v2:
- Keep rounding values between the supported gains down, instead of
  rejecting them, so the ABI doesn't change (Jonathan)
- Only reject values <= 0 and values that don't fit: FIELD_FIT() for
  sx9310 (Jonathan); sx9360 checks against the gain of 8 code, as its
  3-bit field also holds codes 4 to 7, which the driver doesn't support

v1: https://lore.kernel.org/all/20261107111710.442318-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have SX9310 or SX9360 hardware.

Arnav Kapoor (2):
  iio: proximity: sx9310: reject out-of-range hardware gain values
  iio: proximity: sx9360: reject out-of-range hardware gain values

 drivers/iio/proximity/sx9310.c | 7 +++++++
 drivers/iio/proximity/sx9360.c | 7 +++++++
 2 files changed, 14 insertions(+)


base-commit: 340d44bdf9db0f095f99845b5ad8628781d79b6f
-- 
2.53.0

