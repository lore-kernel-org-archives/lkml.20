Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1233A493621
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617930; cv=none; b=f4z41rzzp06rrZd3hx2/KTauXG23qAiGqMaTEeIse7Efyf0xJXFEgKV+F+yfQCCB4XlDTYRI8Nh2M06Wekfb9N9yy/BLDeZHqoT5eRuQKFrPp6w5lMH55vPA0dFx6hC483QOLYKr09hNv+Rhyr7sHyiMRn7/HNKbrrisclYjsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617930; c=relaxed/simple;
	bh=Q+vmfJG//p2Rey1KhKL5FmZQroywJtuh3/k2Uqp58iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dn0MLKk/+NK1OOTfCqC2R1TSRPIbDvj1jNm81S3N6KNo+GSCCFJTwZ5m6njM8xEAf7uztrkImiYQ0szcsiUcsOiUDZUhBF1ynp/pBIZwQB9VGrAxuoHTFaJrekJ2PZNwS7jss827c5U9K8uObCpb6X8tkjQJqns/3LQxatGgHPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUkKTHqQ; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUkKTHqQ"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6d817a94799so692023eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790617927; x=1791222727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJn16IjQM6K4l/OhzyI9FQr95uDpWojn7sleNnAiD6g=;
        b=XUkKTHqQ/AcGibmiiXcgy9LqNdXQ9UeE0WJxB0lmXtEGhQazcuQdR3yPqj6oTvnz9c
         F+rj/TNotvWGjPYT1nKeq01SK1D6+pV7zKZ1PaFxUpwPQqg6eQNp18xTrt+tMfTZ2Xir
         GZFlTHZkbF/oRRFX+StfWf43bhHXXmkOTIQH1b2jrtzCElpvQCXsPkOLR8ZRCG4kNem4
         MDQZd22vL3NobahCTl1Req5iNJUJKGjmkaW9m/Wp904fCaJifVkbDRVAOrvL4ay+vx+q
         CR3Kk8xZrr70lpc8dUUn4DSZRpZOpgdZoK7Q9g5wr5g+rWMGLr00PK+fyz4VamLp7uig
         QO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617927; x=1791222727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJn16IjQM6K4l/OhzyI9FQr95uDpWojn7sleNnAiD6g=;
        b=1Z3q/14J1SChIhv0ypAM+gDirD8tNHWHfuW0tbjmgp5Hyislh9Mss7VtIRs3kjUMMv
         XetbTf5Z0GAvuuQKrqLSv526aYrgxiadEGZtZLVTC0/gpX2BoiQWBLfUgygo/0XR7SeU
         6g6lwwfxHb2XIMDnejtHyiw+7QhEYp3k5HcIT481vb6gxwtHKfYYwj35jf0NBlHSqMr3
         wL8zcpTAlPiWH33/mLa4psrhMAjM8WIONfzU7JpvWXzwefC94XCltACA1L8UtSqzSmWQ
         EOuRwlmPomhflL7NQK3QSlpkWzsSBw4DQ4HxxTTAU9XTm797r3RgzWEH2Ogul3U2YKU/
         880g==
X-Forwarded-Encrypted: i=1; AKwUvBzSGCSRIGoQ+spI2jpFAdRw35lbG+aXjya2Ti6qwgZrEbxyJ3tqbD6FI8XZwoSfb+N95UypVuNaK+Qadx8=@vger.kernel.org
X-Gm-Message-State: AFuF++mbhqtvyhsUBrXE0ZkHOV5zlpvTWyCN5FAbBneSjarKk8tMwDj9
	5Oi0v2spoN+ZWYnoZvXGpNb92DgS6SlWhunKbcwxGEi4xgpZGK/NrrbT
X-Gm-Gg: AYBFou04sfIgHmY43pyBgUWDhnUeRTYtryCcne13TBBD80xg0e8C2UDOH/7cfEo9QiR
	jqUYTpMRoSELUUe5Ynvg7VRnNjI6gAgB1cg8qKFZ0mdNUUEiu6GJGE0AD0bSLyTBO6B1q34Vd0g
	wTFjhgLDiRzZW4mgHpxQGqAc2WO+hb8E3v4aGeOWzQ0bWTHL/lt4L2j7O76uN3K4gejrKmNcCdf
	+CDsLPQ2hE+iA45tjCmWgE8LodgrlSw7Xtk+1P9gMhUqdgmG+0NxlAU2QDwGHNLGemQXkHIwlbK
	OkDbCEiJ+uL90m+qhFfZVVyVzHyM5R51xCIZs1ZAIy9CYu54PxYIv5dtt9IwriRi1ynX33Dt//v
	H4rdO+eUtki42ZUp/qx998ttSSldttJt3v995vQBkorz8dJJTa6DCR3nncWgWPFpqXBKuCP6dD2
	7sF55QSTs6IeLEljwmivU6JuudsD7dL6/VfOoa77cM0zkLpp7v2IbfuL/itj42rRB4iBVhQbXL8
	vsbgsSizZ3WzRUDpMGuJ+0=
X-Received: by 2002:a05:6820:1f11:b0:6cd:3fec:de75 with SMTP id 006d021491bc7-6d441c7cac0mr12797774eaf.75.1790617927580;
        Mon, 28 Sep 2026 10:52:07 -0700 (PDT)
Received: from cachyos-SlimIce.lan ([2607:fb90:9a26:9349::e71])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8822199cbsm5971644eaf.5.2026.09.28.10.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:52:06 -0700 (PDT)
From: Jared Wuerzburger <jwuerz@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Samuel Dionne-Riel <samuel@dionne-riel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] iio: imu: st_lsm6dsx: Add ACPI ID SMOCF05 (Minisforum V3 / V3 SE)
Date: Mon, 28 Sep 2026 12:50:47 -0500
Message-ID: <20260928175049.86941-1-jwuerz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This adds the SMOCF05 ACPI ID used by the Minisforum V3 and V3 SE
tablets for their LSM6DS3TR-C, picking up Samuel's series [1][2].
Without it the accelerometer and gyroscope are missing unless the user
carries a DSDT override [3].

Changes since v3 [4]:
 - 1/2: convert the ACPI match table to C99 initializers instead of
   only dropping the trailing commas (Andy).
 - 2/2: explain in the changelog why the firmware's SLA0 matrix is not
   used and the orientation comes from hwdb (Andy); drop the pointer
   to the cover letter (Andy); Link: -> Closes: (Andy).
 - Assisted-by: LLM (Andy).

A correction to the v3 cover letter: SLA0 applied via hwdb gives correct
rotation but inverted tilt (it follows the Windows convention, see 2/2).
The correct matrix is -1 0 0; 0 -1 0; 0 0 1. The systemd hwdb entry [5]
was merged with SLA0 and has since been fixed [6].

The full STS device from the V3 BIOS (1.06), identical on the V3 SE:

      Device (STS)
      {
          Name (_HID, EisaId ("SMOCF05"))
          Name (_CID, EisaId ("SMOCF05"))
          Name (_UID, Zero)
          Method (_STA, 0, NotSerialized)
          {
              Return (0x0F)
          }

          Method (_CRS, 0, NotSerialized)
          {
              Name (RBUF, ResourceTemplate ()
              {
                  I2cSerialBusV2 (0x006A, ControllerInitiated, 0x00061A80,
                      AddressingMode7Bit, "\\_SB.I2CD",
                      0x00, ResourceConsumer, , Exclusive,
                      RawDataBuffer (0x04)
                      {
                          0x53, 0x4C, 0x41, 0x30
                      })
                  I2cSerialBusV2 (0x006A, ControllerInitiated, 0x00061A80,
                      AddressingMode7Bit, "\\_SB.I2CD",
                      0x00, ResourceConsumer, , Exclusive,
                      RawDataBuffer (0x04)
                      {
                          0x53, 0x4C, 0x47, 0x30
                      })
                  GpioInt (Edge, ActiveHigh, Exclusive, PullNone, 0x0000,
                      "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                      RawDataBuffer (0x04)
                      {
                          0x53, 0x4C, 0x41, 0x30
                      })
                      {
                          0x0009
                      }
              })
              Return (RBUF) /* \_SB_.I2CD.STS_._CRS.RBUF */
          }

          Method (SLA0, 0, NotSerialized)
          {
              Name (RBUF, Package (0x03)
              {
                  "-1 0 0",
                  "0 -1 0",
                  "0 0 -1"
              })
              Return (RBUF) /* \_SB_.I2CD.STS_.SLA0.RBUF */
          }

          Method (SLG0, 0, NotSerialized)
          {
              Name (RBUF, Package (0x03)
              {
                  "1 0 0",
                  "0 1 0",
                  "0 0 1"
              })
              Return (RBUF) /* \_SB_.I2CD.STS_.SLG0.RBUF */
          }
      }

Thanks to Samuel for the original series and to Andy for the reviews.

[1] v1: https://lore.kernel.org/linux-iio/20251223025351.3099978-2-samuel@dionne-riel.com/
[2] v2: https://lore.kernel.org/linux-iio/20260201225450.1649001-2-samuel@dionne-riel.com/
[3] https://github.com/mudkipme/awesome-minisforum-v3/issues/2
[4] v3: https://lore.kernel.org/linux-iio/20260927220559.24169-1-jwuerz@gmail.com/
[5] https://github.com/systemd/systemd/pull/43935
[6] https://github.com/systemd/systemd/pull/43941

Jared Wuerzburger (1):
  iio: imu: st_lsm6dsx: Use C99 initializers in ACPI match table

Samuel Dionne-Riel (1):
  iio: imu: st_lsm6dsx: Add ACPI ID SMOCF05 for LSM6DS3TR-C

 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.55.0

