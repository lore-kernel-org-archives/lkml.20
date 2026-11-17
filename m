Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924335;
	b=rqsjYpUgatuAQ7elsego9zeUoofetx0aYmkixQwZH6unH2l/Icc4kecFp5BRqX8eVhuv
	 bdsMYfNhyLuK0VRLvWn8lJgCkYjVRunAxv/vBU8DbmEBSm0oqrKVlW2fLYH4+RqCu+WKz
	 mYahWFQZjWLf+fYj7Gvfb2eWHSJgBiGUTY7kiqKp4X5wOxABOvm/YZ4Htble1QTsTx/pi
	 Nc39y0ZO0nr4jfzXJerNqGhde+kDoHX0FzGyQDMqNsF+vUoB31WqfBPBa9oyozMEjAXSW
	 SJZ2kfInyS/mbqHdYnOh24LvaP/hkBLgU9TmOq6E+xw5Y57MzC+bAnx4RGtwyqs1jcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gwpUsyK05NpebcZHKBuJHcLynXCmkJRULUp5k1SU9r4=;
	b=Hwi+L5HkpVYJPh6YBB/oAkM9i4/4doX328G+/Uwr0uHpX39lRTg2kFbOWe/bm3ojUgMH
	 WgIZifPrpN80lRxuZyXX0W0uDIDYeA7C2ckB5n6DxdFVj4D6ylZNp0JUYJcIZy+dO9s5j
	 RR/CqugxXlDfg92FxR4F+EmIG4n3N2fxQwaa3wtKScLoAgArH8fCwzv7uiQrMMnYGoDlh
	 ZpPkhbdc/wm2qX7hImo5sXYQsLFCc8Ze05X5JFimvp5pZFQAisr2sZ8CmR8iuMmZyR9Ty
	 xm2EE+8mYJVYhqCjTZ0/DyrX4CoZSsPm9+VL/bBP1uO4shdfRs6XPrFdWnJIF5UgFiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKHskOD5;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC92606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC92606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKHskOD5
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4184791f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924333; x=1795529133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwpUsyK05NpebcZHKBuJHcLynXCmkJRULUp5k1SU9r4=;
        b=AKHskOD5yvtPtNt8uUBx9uoc7lmOQ5mI2ikTE4ijykE+KE5TLWi/ugg19NADcDxYyp
         0s8jr7Ay9ujYOFALwAciOtsazWJQpFMa2ldUigg1sjIOIzYc9OcPAEVBZWBH+e2IwP7z
         5pZYhmh4A9t7wI+fwUNAIj+bXG1XFP1m1FqIOaSweKGB++wliRjCFDdM8PiwGRdJTScz
         QCkXP4B86/RIxsUrNdelmFqQuiMDFp/QHaLPcOk6cMppEN+UpijQGm5b7vL9NG7Gd6lI
         S+mjt4zF+f/+L+x7C99MSn+Qt2qSnMdgbPWwunwMeA4jwew3gQFskiXNvdwschYXakxw
         LdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924333; x=1795529133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwpUsyK05NpebcZHKBuJHcLynXCmkJRULUp5k1SU9r4=;
        b=r8WYlcEGzTQdJRaS3+SFSeluvXhtyHsmq07i42WcPZRM3TPa3nXd+BcPNQRhrcwBqb
         mvB5hNLhrBke4l9EV4GSCF2UBVN05K5dPMb5OOsZMBn5vmqRkFGTFeeQA43d5a+wcBbK
         M8Gv42f3N1+FyN3wYMJe/iEhKsAsIu1lTOwqOeFL5OZa35mNvEdzthApDmiuCtfB1B2v
         INhq8BXiM5nYgXyQe+cBmwvyuZif5+qxCJhX0Fp3c8NBajFYZqIvYNhU7ozdnIha5S2m
         8kMAQzhGOAfnQA29GFagDAfLQ71XKLNgtKYP6eLH9Wwm79LZKBqgPJy6uVf18/WcUiEc
         kSYQ==
X-Forwarded-Encrypted: i=1; AL+hErGphf/bES5559JRzBirhPCALV8PqBgTlr5NfJKecF/QIYsNh8vPNpxLMaJZaNQhF4sbImgAA1fyI6MewBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bl+2j0CbZxjyUz9XRd0lmtqMbGCoKCMTIZqVEGNnjZmwSi/ec
	63AHLGqKAT5Q6JBSEco7YH6Jik2wcqYtZVV5nmRImLXcP7Ml8cHCh8rO
X-Gm-Gg: AZFdTZfD4/wXWSjvLF1RYL4Fd26R/wQvv6SqVafJkZ+MZY8PNfcQ8Ct7U6VMCT/W3nD
	B48GIwoZ/UxEjFFjg2Tc/vkVhq+mqS3l/S8vRSyfKsI4H95xkBGCJhLCTiy/Us4zlKQcFrn2XnR
	UofVRrb33zFjML9i77C9hTVLQ61QFOyNWsoa9i4QT+EHH6BPEDZ2tV47DxsY+ZhOgl+dOLG7/Lx
	dE/fB6CEV6O2N6kf19a1ym3rcHyLD1iUukoBGZGqWaefJ/Ih3dRCpPCksdxN4XyYInrmkQwjLA0
	IUgeP+fDN4RrVNtDqopiXUad4njhzlivHJtb8jXtrGl5N9q+5/xlc7vmMJtys9AlWEtfYz+suZY
	t3EqMCNtOpTEssid+/JD2rNS16+2F06kAeX8fGB0WoPZ9OEH01l0r+kExJejKov221wHbJqLoON
	pjmVf3SuS7UKcRJbrKJm4Jv/VB6WPd/q/+aX++6Sz8kGOB7CLd7Nsj+YTdTmqhQq0knDVB1fYeN
	JLJVEkEAjjKSH+7qAzXHea/VxYX8IDhnZOfBsuJOQ1vLS4k8aIeSpUdU3ttEiUm83fDIuNaEIit
	smtm25l+5DNbvgamUHzYX3fsvSW1aWKleA2KSQ==
X-Received: by 2002:a05:6000:2602:b0:48e:7476:9205 with SMTP id ffacd0b85a97d-49c71784d80mr30330262f8f.31.1794924333342;
        Tue, 17 Nov 2026 06:05:33 -0800 (PST)
Received: from fedora ([154.183.162.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm2623032f8f.8.2026.11.17.06.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:05:32 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 0/3] iio: adc: at91_adc: fix trigger NULL deref and convert to devm_*
Date: Tue, 17 Nov 2026 16:05:07 +0200
Message-ID: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
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

This series fixes a NULL pointer dereference in at91_adc when external
triggers are absent from the Device Tree, and converts 
the driver to devm_* APIs.

The series is split
into three patches:
  1.NULL-pointer fix.
  2.introduce a local 'struct device *dev' and use sizeof(*st) in probe().
  3.removing manual cleanup and inlining trigger
     and buffer setup helpers into probe().

Changes in v4:
  - Split v3 into three patches (Joshua Crofts, Jonathan Cameron).
  - Patch 1:NULL check.
  - Patch 2: Separate the local 'dev' pointer introduction and sizeof(*st)
    change (Jonathan Cameron).
  - Patch 3:
    - Remove at91_adc_allocate_trigger() and at91_adc_buffer_init(),
      inline their logic in probe(), and avoid relying on idev->dev.parent
      (Jonathan Cameron).
    - Remove redundant dev_err() on trigger allocation -ENOMEM
      (Jonathan Cameron).
    - Use dev_err_probe() in at91_ts_register() and for
      devm_iio_device_register() failures in probe() (Jonathan Cameron).
    
Changes in v3:
  - Remove redundant dev_err() after devm_input_allocate_device()
    (Andy Shevchenko).
  - Introduce local 'struct device *dev = &pdev->dev' in probe()
    (Andy Shevchenko).
  - Declare the loop iterator inside the for-loop.

Changes in v2:
  - Replace the simple NULL check with a full devm_* conversion,
    as suggested by Jonathan Cameron.

Abdelnasser Hussein (3):
  iio: adc: at91_adc: fix NULL pointer dereference on trigger remove
  iio: adc: at91_adc: use local struct device pointer in probe
  iio: adc: at91_adc: convert to device-managed resources

 drivers/iio/adc/at91_adc.c | 229 ++++++++++---------------------------
 1 file changed, 62 insertions(+), 167 deletions(-)

-- 
2.56.0

