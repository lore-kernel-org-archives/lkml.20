Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225095;
	b=IPAqMrFRClM828Q1Rw6mkulxlzpZ6a8WtaIAqb7D/qBEAj0Jn6hZG+F8Z6yRgmi85UHu
	 vxYLhMsebAKTB6fex9EFA2zYMEyFlbq5mPSBRdmQnxeqALaulOIlNxhPXnD5IMB2Q3afg
	 pewzfRd2tHKACjc0pNCA8bITGGo0nP5RFZ8m/tAMzeX9BkizuTJnxMHmOohoFwIgasx3V
	 Sugq0LoGNrUJsFvTduAwEmu/nMh62D6BJObxi+dTNiC5Q6p7ucdN95yoq7Gn2ayaOazU+
	 wtu603RJfAcCVODpfP/mBEkWbmoodu8lh4yH95t3mnneYQlXQRexLdyNXQhI5v6SHJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AC/NTXhZ+S+m8y68c6/Vu48pKA1QTXyP89dRVEtMCT8=;
	b=kGgniGy5wIGaV+GnufmIkkOMpoX/0JvlR3G/lH2K44c2YrDFq/BANNbmp1Qh0SI560PE
	 ZekUn+1hC1rGMSoBootgHhgSMnrWwRBBy5CdeBAVdGwqGFDQsMPFiSasRA2Qezq/w9kBg
	 UID6owdB08Y6FMqNa9kL1uBUz3Yz5D2TBYY04fclKYY4rqZhd4WRIsGTUqcB7KTYymteE
	 29k7RABFByCS1O6uTSqLe6vQraHYZsTAOSa8EMaAUktnz4ZhVdTlvUTa3kYTZtj01QGJv
	 xc2Un8DrS0Y+Q3f0SOzQIzD1DYzObK0JQ4b0aLKyb6BdCpqjZpXu6ynBY9kZscxMSrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NGGtDifR;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB076606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB076606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NGGtDifR
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so156956eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225094; x=1793829894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AC/NTXhZ+S+m8y68c6/Vu48pKA1QTXyP89dRVEtMCT8=;
        b=NGGtDifR9sNw44R0ROA7kqnA0Xt6LYOirzfzWAbw0/0M1HfwDspOlf6AuvgISgDOga
         0BPxRerL+TEwUoKbexw0Dc2FRuW+SGkU6yjRVDe+t1IBKeFnlCt3yQU8LZt0kov6uYQK
         6RtM0IuT/NbfITfXwMqnt9gBtY89InE8N76/ReSEOSj7ioxoSbHFY1XFDKxcUTM/QODS
         iLp6us3AyLU3R+NQQ9CSh9CuK52rSU+BMpw4lQVQYh7wLSM6qfH7DkyNJGDu/JxF4kUc
         /uLVF0avUt5YImDOixdx5dVPWN0KNS1Se7Mz+ly37DbI7hKkQ14Vn2661NjSgzfS039q
         s9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225094; x=1793829894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AC/NTXhZ+S+m8y68c6/Vu48pKA1QTXyP89dRVEtMCT8=;
        b=xeAePlam+tScH77R7J08kf3d6AEY1IznP3JoODtjkBi5ra6MDUUmNBedrfNfQQAU9v
         GBcfbNNMqoIW5w3sgCar/4xu37bjnziEyPskESF19eCiVhJ1nU+KaZgyfLZSjhLBBa3i
         HL7heFqn6kdFouxSuPhWnBGLarQosZMwjLD8MCpv4w/wMaRfWZY0o0+2u5IvoJyaLWI7
         ZcvX9KCC6eaodKvEPGLq6PhTdAH/bZAyzSozFrDHAtVVMNUlXQFEv3uWFARaz0hDvt6z
         h+UOmxjuyvNJO0gcWWCi6wr/exb1lwM1qtYIoLaIDI6kjOVNLxz7AH4iO10zoba1gCjx
         U3NQ==
X-Forwarded-Encrypted: i=1; AKwUvByMC9MGR9zLu4HvmP2SnFPtbHTrE1y6aALRN87QN79HO2hW7yCno7fhoq8yY+dq98h6WZG2tZ7M0xqAzTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiufzdsY3ZfJqZFHis5SboWa45zDT6EjzCKdvaurSj94PglWl4
	vndA2wmiXkCxTD38ccVHDFTLI4uV5AEWZjUod7N+jd6p39HMdj/CLz7w
X-Gm-Gg: AYBFou1A+5vOeGJnj3Mah69fGHpjUpKY4T+yJrgiy5GRXokRxvMlqHCQRX2uMmGavmE
	M0+yL71vXRMTeKq9RDB0qkFyICJVBf2DdiioKrsKYRPXf5YD6tR/25snsYcbSWcef402KTD1bbX
	4uNYV/6vG8FijkNytmbBXDy3GaBnvkdXxl8v6e85pC0/Oj3seS/2YrooclcOffZbDFbSP6J/aSZ
	369qqW4IXe4fSPQvIiDL/timAghn7mWR6+h7jftcQKCYeqV9BoNmQMJuSMGkpAz//4HNwnBRNMy
	EWbeEU5m0r5cYwD5ZVxbBbLhJsL6Dpa23t10kgI4adViej4vsnmEtz/e0l95YqTjXn0ZbtNs75a
	rZG8ify6Evp7WyxqdLC5BPmx4fKJ5MJO9Y6H3ERH0hIXgc2rpt1TUcDkNav/SI7rkvDUEj+WJQw
	yLSNcRxfcNCr5RKvfLEB5Z1fRIas6DYCoewB0gzFKwNDn6crXACKLMHCTiPVkqdiFfyIbAFEgR9
	utD7yxkfOj2AmYotyFOaw0usaYT76JYix2HE6aLRH4ya6Bqpt2cYLsUuBEmPWPRShJNmdfkk4Cd
	xb/VFYaPrJREdVQyQWbGIoH1FzufGKz66iGWs411H9h6jwHy1nTNW3gCplWWA7L2CWAx5eY5Rla
	MDpBl0fWOEIEGpcyKWEqtPLB/FLdKh7eEpjSs7fy2n5zSR7DKlDdvNTRbU3ObhTvGVJNjNAqN79
	csi+1WCleZcaXsGkEkqDXJovaSlbLNKCpvVlg1tR0Dbw==
X-Received: by 2002:a05:7300:d20f:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-36a3002ea6amr1020590eec.13.1793225093667;
        Wed, 28 Oct 2026 15:04:53 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390a812sm9924429eec.14.2026.10.28.15.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:04:53 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 0/3] iio: proximity: sx93xx: keep the IRQ balanced across suspend and resume
Date: Thu, 29 Oct 2026 03:34:36 +0530
Message-ID: <20261028220444.70121-1-kapoorarnav43@gmail.com>
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

sx9310, sx9324 and sx9360 disable the interrupt in suspend before
anything that can fail, and don't enable it again when suspend or resume
fails. Without an interrupt line they also act on IRQ 0. One patch per
driver, as the Fixes tags differ.

Changes in v3:
- sx9310: blank line after guard(), and a local regmap pointer in
  sx9310_wake_up() (Andy)
- Add Joshua's Reviewed-by to all three patches

v2: https://lore.kernel.org/all/20261026112342.65917-1-kapoorarnav43@gmail.com/

Changes in v2:
- Send as a series with a cover letter (Joshua)
- sx9310: move the wake-up register writes into a helper that uses
  guard(), so resume can use the usual early returns (Andy)
- sx9324, sx9360: no changes

v1:
https://lore.kernel.org/all/20261026100322.16720-1-kapoorarnav43@gmail.com/
https://lore.kernel.org/all/20261026100408.16874-1-kapoorarnav43@gmail.com/
https://lore.kernel.org/all/20261026100450.17023-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have the hardware and haven't
reproduced a failing suspend.

Arnav Kapoor (3):
  iio: proximity: sx9310: keep the IRQ balanced across suspend and
    resume
  iio: proximity: sx9324: keep the IRQ balanced across suspend and
    resume
  iio: proximity: sx9360: keep the IRQ balanced across suspend and
    resume

 drivers/iio/proximity/sx9310.c | 42 ++++++++++++++++++++++------------
 drivers/iio/proximity/sx9324.c | 31 +++++++++++++++----------
 drivers/iio/proximity/sx9360.c | 33 +++++++++++++++-----------
 3 files changed, 67 insertions(+), 39 deletions(-)


base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

