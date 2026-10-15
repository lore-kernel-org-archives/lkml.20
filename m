Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797424FC8CC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085449; cv=none; b=VpjstSpJ9IKQrKHKGkhbKOE3sb7ZaItvLx0vbeOuFTLyKqrIXmJyM6FNHDv0IFujsT7qdpwsI96Vo+i2EiRS+rj/HkNDEB6wd1P3snMMI/F3rf4DNYvGjkykk7P44i6EzpMt5C8A2aIVHEfz/dNFD3DCQt4Frzy99CWGwUvCFZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085449; c=relaxed/simple;
	bh=jzXshqsq8LpTtp/eHftavX8CC47Hi2RgETXeFOYwq6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cMrQPVqTjLtT2raS9NUXdZK5cSRZ+Xtxw0h/4lFbHUVGYF+X2ufX3ywDHAcoIH72nU2E87kBT+ajsctj4YWiNOkVG5b5AJddMrv04apW/X5l34BETAhMGS2vW6R4XaGZ/YtTCxA5GKfk6VEvEU+PJaE5Oean90aOujDFRsicl0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XYO+kwr1; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XYO+kwr1"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9178aabd30dso55152046d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792085440; x=1792690240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Ij/yqmblFjl2otRcuDhQ5WPtlcQLmq30NR3nWc3SBE=;
        b=XYO+kwr1XGq9ffky7iQedv7871Sf2Y4pvTbjHS7Q9wng5YxOySEgCHbulG5rwVPNwg
         oIZIU/XZgGjCFbJGZ0nKk9/yenG7YK0mCATWX4+Yu5AIg5ErS57SjfrNQSS3FXr7ohrl
         3ew4yRX1MW/diHWRFQylD39rD0PjNsqvu8Ap/wLlhatctfRJsFHY7M6z4wAd5HvnRdno
         1hemMZD8UIm9f48RBV8JzPRZXwDCme/0Z25BzQJxoz8D7NFLd4yBfEb0m1hddFTUx62G
         InHz28+S80Lnm2P+GJhER1zvC7m7zBf9HFY1cr1BoI2Fukg1VBIHluRahQO/1IbyvbmR
         51vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085440; x=1792690240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Ij/yqmblFjl2otRcuDhQ5WPtlcQLmq30NR3nWc3SBE=;
        b=cYt5rN1eJitcByqWaJT8E3qtDz7EXqJ7sSoJET3XZFtlGWcbtStMSQDIU/17eqxBjp
         fNJZAd3YNypr30n9vp96OlAUc+oqJDB3MyNu6HuLq4gyx9zbMvPUqAbUyOS37jUcV3rF
         aH0Ipd+ezTR9B7NLEHItsy5Y1Bzcock3/b0JJHkn25U+BFFfjLNFzvxqqvAmarGFXTQj
         PnGH/YMJdSp78wkbt1J9reLk/QqaXQUZxaP+DIDPPwptZItRgT6VINWxBJLsQ6/owjL6
         UV5r/PgQYCCNdTikAXawlYbiM94a+C4rm/ZkemFUa+S5rPkQIVv2Xq7ReS8HG0VPBrP/
         aySQ==
X-Forwarded-Encrypted: i=1; AKwUvByW0tcdMV29l7HUxUT5kH9OqfpApP15hYKryGs5y3TmEJgqw8bee76LjF56dnN+zuUM4cR0tZOY1jLvvwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj2JPjTuiUvqmDyynjraxGqKlhUE4hpNZhySLzH//EEq1aj9Qe
	dQr+mr3lk3uarc6dN6lKS5p2mqegGNxAsWy6RMr7keeMBuqK+LqJYT9JdIY2hJ0/jTs=
X-Gm-Gg: AYBFou0fX3tDMOWHp7gbNoM2CDRiz83kQpc7gAydDlyQzbynFU3g7p2q1Wu63kCk7aY
	+illnM/oRehCA8O5Pupich5oLdiN8jPi1Y7c90nRkMAPLq6lGbaCbryrj2FCtNr7qFQIh8kZnov
	zYRYZcmrlln/InG/qcjmiTR/E6qvw8oGk+QL26UhDUjbuXmzxweSEsurxcNF/Ikvea+tEtUTTjR
	wR6XE10YZ/7EcziYOvmmRGdqMQW2R0q3mCuqtpJSPUPzaGqH0Ut1AoOP9XO2qnQMyLwVV7Ia+0e
	z6yB6QeJJpnw5Uzl7LJzG1TVDUbA53pVNmiOpQaTtdmNle1XT+iFF5yl1RrQ/VMOj7mRTwcW3i5
	J2BalAos3vpG5uU01i1guR8JlfyIaBdGxTr/xc6S+Uye8kcs7Mjd5ylx8IOXfRsqqaNWtQI6zLv
	kqDIlyVFA+P2Xm756kyA7YJ+YpLStDxdS2j4Zg7JRGD6wB5ABT40pKEYdHNY9XlWbbmFtQduY6F
	LXlWT9fBeBU1dU5Qc0bdxxkNzAkbUuPrqFo2matGwRp030RHSRYmrufCRp+B61dYFV56ao=
X-Received: by 2002:a05:620a:4141:b0:93e:d364:ca10 with SMTP id af79cd13be357-93ed364eb7cmr2739104485a.12.1792085438698;
        Thu, 15 Oct 2026 10:30:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50095bbsm825062485a.9.2026.10.15.10.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:30:36 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-rtc@vger.kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	alexandre.belloni@bootlin.com,
	rui.zhang@intel.com
Subject: [RESEND PATCH 0/2] rtc: cmos: Fix ACPI RTC alarm handling
Date: Thu, 15 Oct 2026 13:30:27 -0400
Message-ID: <20261015173029.3091872-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resend of the series first posted on September 9.
https://lore.kernel.org/linux-rtc/20260909225132.1392883-1-gourry@gourry.net/

RTC update interrupt emulation can stop delivering events when rtc-cmos
uses the ACPI RTC fixed event. On an affected system, a test that waits
for five one-second update events completed only 40 of 50 runs. The ACPI
ff_rt_clk counter stopped at 218, exactly matching the number of events
delivered to userspace, with the event status set but delivery disabled.

The ACPI SCI handler disables the fixed event after dispatching the RTC
interrupt. Because dispatch queues work that rearms the next alarm, the
handler can disable an event that the worker has already enabled. Move
the clear and disable operations before dispatch so that rearming always
wins the race.

During diagnosis, an explicit rtc_cmos.use_acpi_alarm=0 argument was also
found to be ineffective. The automatic platform selection runs after
parameter parsing and overwrites the explicit false value. Record whether
the parameter was supplied and skip automatic selection in that case.

On the affected system, ACPI mode completed 150 of 150 runs after the
ordering fix and delivered all 750 requested events. With
rtc_cmos.use_acpi_alarm=0, sysfs reported N, HPET emulation was active,
and 100 of 100 runs passed without using the ACPI RTC event.

The in-tree RTC selftest also passed all 8 tests under VNG with
rtc_cmos.use_acpi_alarm=0. VNG does not deliver ACPI RTC fixed events, so
the ACPI ordering fix was tested on hardware.

Gregory Price (2):
  rtc: cmos: Disable ACPI RTC event before handling it
  rtc: cmos: Honor explicit use_acpi_alarm parameter value

 drivers/rtc/rtc-cmos.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

-- 
2.56.0

