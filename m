Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024445;
	b=rc+MIQStV0L109iybrsjiQdwLFKkfLRkfdc0kN8kQZSTBWHU19lgEMUY9AdA2il/RtFW
	 DS0QvO3FTTaktykV3H9rgNzmQJgXpoG33D5lS5AzfQdZKCIegJ3X8Pm2cwN1vIl52QaCp
	 LjToBjiUzpZAI21NZUZEziLdryz2QwYQRkflsmOjskCUfiUcVkMvsbCvVlvUDFU5gD7n4
	 OWamk9o7xK4l953i7lNMlp3f2qD7C309SCWPbuKx7A6yQ0tPObrXh6vAhayJA1de3IWAn
	 t3uNvNM3dzoqr0LY4DSyMzHx3DroO3puP6BWe7lA7AQPjEfE634GBYlxEuP42bm3O0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gZsq+xXtHizaLpzo1tER32r/t6mRAs6VUf47ZcMCllc=;
	b=XGRLVfSwCuZFwHLz05ARxRRJsmeGxqDyVMLXFo8Jbkt885sXVeiy0YIe0rF661/goIm0
	 3E7vAM4Jq4WBRe6EFCCpQxpQp4bzwApxfvoiQvNi3XFtyVTlobyhU9QjCybbHrOLo0dOo
	 4OZ661Dg2yw+y++J1/AntL/ukxbkpEWEV2vwiXt6JOvAf0W/XD7oAjwnb/zOhAh47o9JC
	 z8d9//mN6SyO3TfQRiH68UOpGjN5K5SmULSxkwAr3nF7faxW00J+BnNdIw0im+HKq67yZ
	 uHaDV4Iua9DsvPDZTqa4npURLmACCgvwvsEHUWZtlK8xnEd6bv2Gb/x+bC66RpIjQPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PiF1ICPh;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039BA606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PiF1ICPh
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2955064f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024443; x=1793629243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZsq+xXtHizaLpzo1tER32r/t6mRAs6VUf47ZcMCllc=;
        b=PiF1ICPhsZXEQPej5refTiirqNLb6J2mK+PQpmijJDAQZIHVYPOgPgdiMURTByH7ET
         UBkXeOTqyfsvCJLtcrfBSA6rP9+aNOb0g240XThoIqfIJiiaop7HmgnaypCcuWf1s4p2
         ytFIjBB0+KKOuEFkH3avHr4KEUN2uajL0N6Z6jIP81H6TuImv3TO6aK2QNR7vOIWp5BJ
         aBd20eMJyrW5n6WWmWVwLYHdhj1eoq8KizhzKESpCDQxIfPoqJzFjqcomM+uMMMKPgms
         yRTZdmZNEUfzyrBNHKBR1AfCCpvDbO9xOA015wRMWC1U7kjfDDjpHVEjoiN7cOPujFxT
         Ko3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024443; x=1793629243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZsq+xXtHizaLpzo1tER32r/t6mRAs6VUf47ZcMCllc=;
        b=nNGIqc2IvS+Y30wjrr2afIwp2v3W83MeP5PVVI9kAN9ov+1Clr9KH4jPMPOI718OjH
         L57seSOrzx3XcKdY/jN8xi2PumYl9D7U1Q0Is8Pr+GZKveKzbqFz4oUh7/Bvs3xjolSf
         yogxX3rlIj7Xw6uan7bFGMHuMwVj0JtGWk0+3Cp/6AyrCdL/VMTZyM/X6SZUVlPujQGV
         yeU5Xe5ECet4i5cMHhcxXdCicg9fgp3+9ezFN9FbaHdllWGgppbalTTZkGH761cqZ8He
         U3aqTcjQG9hZIGQgm+aKlbs2vl3Gfwn7gfKsvAKjZVVlxk8caMKuOGdS2t9V2wdMGgxI
         XWSg==
X-Forwarded-Encrypted: i=1; AKwUvByAgFtEJT1Xun6Qwmq+XHyzlBXbWR9n2ziVGYXEsNzdatev6tbTd4XdF64a2xwGYMCuSkLuvupzuh93M0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ5Zwby3Vovap7j8dJVlv/EC4uyy3c4PJJG/hna72XyLy/Tl8U
	tFcc/rxyRyZ4GiHsgqfP6WsM5VeWNFKGEeyeGxY4GYT+oJ14iJZxmf8=
X-Gm-Gg: AYBFou2VHBIWrPXSalFmsDY4OIHWwrOn9U/NNEMLZ0PWe6l09adIqXvUzc7y5F8pQR8
	z9v2lYx8HuramRmxyVaEn4sb/hqOQ8HE6Txd98/8/lUpxWTAaoQgEYc6qk09buvB+3sxhZa2gOo
	7+W5w9mMN4pOuOMY4WwY2t6Y+aAyB5/VpUhOLmhFbjBAJosAvAJddqyc3J1Krlx1hUTKNUKFH+L
	RROzZiNa6EoLhCVXweKYSlhcucoVAnPIiWwcB//xhRcV28iUsZFwOFdqpTVPqKBcjSXrEs7qgn0
	7lUVEkN/QxXbIW2X19yi3z+eWAyuBOLxo7cTIMm+V9kO2tm9UESCwqhh/qc9ebwcl3AKN0pNRRc
	+XAgms4DPpnlFlbPajtb2xLwlIxXu0+NMfRLZHFfAdC0o/SGLEJWonnI5ercXjJs1sDlwEhgB7x
	kUIc75Zl3XlHG5FQVamkYXcIGLLf/mS+9mfBSONQQmqdAKIIkxXtETH+wIV7Rhc8Luo0KXELxcy
	e/DvGIqEnkpzCJn234rSSzH
X-Received: by 2002:a05:6000:2881:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48e3ed2c7a8mr13855318f8f.16.1793024442950;
        Mon, 26 Oct 2026 07:20:42 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm17484186f8f.28.2026.10.26.07.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:20:41 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Kevin Tsai <ktsai@capellamicro.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 0/2] iio: validate ACPI object types before package access
Date: Mon, 26 Oct 2026 14:20:37 +0000
Message-ID: <20261026142040.62383-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

Two IIO drivers access ACPI package members without validating the
returned object type.  Use acpi_evaluate_object_typed() to request
ACPI_TYPE_PACKAGE at evaluation time, and replace kfree() with
ACPI_FREE() for ACPI-allocated buffers.

Changes in v2:
- Use acpi_evaluate_object_typed() instead of manual post-eval type
  check, as suggested by Jonathan Cameron
- Replace kfree() with ACPI_FREE() for ACPI-allocated buffers

Tristan Madani (2):
  iio: light: cm32181: validate ACPI object type in
    cm32181_acpi_get_cpm()
  iio: imu: inv_mpu6050: validate ACPI object types in
    asus_acpi_get_sensor_info()

 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c | 7 +++++--
 drivers/iio/light/cm32181.c                | 5 +++--
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.47.3

