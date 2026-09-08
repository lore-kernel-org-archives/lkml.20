Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C055921E3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888282; cv=none; b=SnN6QgkZeuwC/PQuy6wTMWRduyntuXDrohlJI9ZZlNs3J0bVICxptyichp8s4W1m3ljaFZ4d5r5N2g1FI0dHzptdY3ehkgIfuUs4Omd8t98+5/i72LCtnA9nk9c+uNdCUcpUl+pO0Z+x7uAu9SBiahMzhTepT+WkH32vyAswi6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888282; c=relaxed/simple;
	bh=767t6hUgUdxrKWf7f2A3xysTdQByDSk5Uj9b4Un6JX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R8xEKJwVro013AiBzHk2UCK/jKaLH6Ba+sHPiRHzvEECffa7NoarAAtDe1ktRpejiJwyo3CRlh4y8JurgVwSC2ON1GxnqIc6EXji8jORSlQHwZ07HOsau5FzpkHP1vI3igVexeThMjvg3+XlfpGs+Ca3O+n3tLOpF/v3b3jqPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3nzLNNa; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3nzLNNa"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedf433a99so4510464a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888280; x=1789493080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1HHJlfn2XcOV1TeOuj4SXDQlV5H5y36ip/NG6d64DA=;
        b=e3nzLNNaAECdEtPUNrK+ne74rRbOpME27l+zFwxxcvpVh17qbtNAM7N9K/5nVKIEL1
         2NmsPRJhtbo2tjesnSvewDaBrguhO+DAcf8vJvfCb8BG3j75qqEM+ZbSeQyQEd0YdTLT
         xIY7G1vFi7U0PhVPvd8Sb8vf9i71RyTOWw/FTsmIJqxfx8RcORkyAizrwIQGyhGp/8UT
         3L4dcJgIw7ifEzJEYY7a+dLdao+oXHRVlKQaQKttjKDuUAFm0IOzv3e/ZBz5LJtwk92t
         lZ2VbH7lvyCKY292F0j/vZZhMGadp6t8VYkqj9/nwimSksamewn2AX18q65cI9tOW4cz
         4D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888280; x=1789493080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1HHJlfn2XcOV1TeOuj4SXDQlV5H5y36ip/NG6d64DA=;
        b=WE1WRJnLzQVqYkXPFjU+IcF4aaa1yGFuycJ9gPESPouwBFU40LZ3/oLMiuYp3cOGn9
         IZg8Xgu5qBUnwxTe7luiVlBLy3F+7rT2NgIC0izuNCutb03Ob+ghhNqjjIX6+Em0v0Xt
         1fEm6x6f/iMhtsoRej/wHCs0kGRtwyp2ODwbTmisiTkSemJMA2kf8g1npUWoxWxQIZuv
         wSz4PTidZkZcfomMd8+Ulgfj7AriQpDgqzt+ycShE+pKHbsbtkui6/Aq3U+sPiJLDqsC
         SDr8+ZGs77QPA7YsMN/7/O17DTuJuzkExZZzufBEFzL51uT2KyH+YGiBlhn2jdgWgRg8
         EetQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHCX69HwKIpBty4uiRV1OkdjBVhgV5SgNpcJ/PHGNMOicBPRrvp1srMaM5RWMLS4n2J0tU8GoqPPxPDhM=@vger.kernel.org
X-Gm-Message-State: AFuF++l1Jor7Hfc14gb+jqEpAeEgW8zMFdCADO/tz1lHe+Bal3DJGIRc
	5NWDFCTw/hrNcgcF9qzlDOBSpbjRSLqxv6nURU05ttQQ1FqJjRsLrPqa
X-Gm-Gg: AYBFou21JJq/aqVAixRQeMo/yEl/F6WLBVId5ZURXXXrnL710hsGfinvV+bi9JqHGu0
	tX/m6HJyC3BUfmOb2JNnJ/uwzK7FRHOkQDkkCgmn0+pLjtnrns3d/QsovjxAXbHuMLc2uwT65qC
	MzXcMgT3stxu4w+0DtK02myl/BUS5aemqnSRKOmmihSnGkwAMBh7SGdPW7CjxJwH+WkRuNv8W6v
	bNcwYmU1leCpnPErwryZ4dBV02RB7FsPCnKDo76DHimXo9jZhtN5/WpMkeP1lcnSwGRK5xJFNMF
	SLa7uLCIKlkFaYGls5P8zBlxobVsTiP9PLnmrUwivYS8MpLF1PN78jCceGnKlwFazRqa4prkN/c
	Ted5PgYFRdRwpawtdc+a/Dr4siQTZLVYLr2dBh0UGq1sY9y6T1RDVl0ly6BurTea0g9SVBW6lk3
	4Vin0sAd5ATyeVBBQ4upJQed5pMIcyhkdQk48iA0kW3jfTjzMFXWdA9KkEEZ8F
X-Received: by 2002:a05:6a21:6487:b0:3d2:2afa:d77 with SMTP id adf61e73a8af0-3da3a0b0a9amr44752599637.14.1788888279580;
        Tue, 08 Sep 2026 10:24:39 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:24:39 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed APIs
Date: Tue,  8 Sep 2026 22:53:53 +0530
Message-ID: <20260908172359.30003-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Changes in v4:
- Move the ADC enable error-path cleanup simplification into the
  clock conversion patch.
- Simplify the ADC devm cleanup action.
- Restore the blank line after the copyright header.

---
Mohammad Shahid (6):
  iio: adc: bcm_iproc_adc: sort headers alphabetically
  iio: adc: bcm_iproc_adc: fix include dependencies
  iio: adc: bcm_iproc_adc: use devm-managed clock
  iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
  iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
  iio: adc: bcm_iproc_adc: use devm-managed IIO device registration

 drivers/iio/adc/bcm_iproc_adc.c | 65 +++++++++++++--------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

-- 
2.43.0

