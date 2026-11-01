Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528729;
	b=YLpKPdjIcbOP45vkWRshu7W16qGCnMJkzNPns7v7rPPbAdi71UEbS0wnV6WQf8po85su
	 FmODZV3hcfiyFKtHh66UGa8oIgV6R98Ocq/MnRxRVALvmGAUeHOw98EJI/R2EuAUwRgTf
	 XoP6p+Ed5cZ3iufQ7eF6oQqqFN0zDuXvsKp2B5Ux8WFHDQhEh7rLJsw3YQ99wFweG41AU
	 AVF10G5BT0hZon2HeHkB697sW/mXcFfdUbsVA+g+P9ftz51VmdSNAgxVCWetZORB7Tt3v
	 hG8UbFPipdesQ9Rmz45mMeu4++sMIiS222Bwji+QR5Ib9um+GpE/RTmCxi3L1+mngRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=paoWbKvqLK3NcbGaFUKJSTzcpwiwtIw5MyG4/oJgE9E=;
	b=oxfU94hkm1zNs+5b3zNphwJ8GBM6UkR+Q7S7ZJ7xWIy+GvP7eIH02Amrd9iwrQZlWA7G
	 Kr3XD166wk7DhJdhgtCxmWOw49FInFZk2aagDksPQmhia0mZR3fNTrYPKOdZ/Zo4QHWyt
	 Yo2cLDTB4LYy2G9hC2C1tZpZurt2kATARQ5Pa7q5BB7OvNQNlCAGDzROJbxfCbDpDvfSc
	 OucbMijjKlPXjPeQIYiPNDTBYeKIyn9V9NnAMOIKWpCDvTlsCkK9wFd4D3Hlz8BizEOp+
	 WlgEMFgTKK+0SqVmSV4AFqotD4hk2dCyJ5ToWO1JnXi5Fz51EMtgcvlyf2DzMIl/dWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkQZ+XJN;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D9B606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D9B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkQZ+XJN
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso2621688c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528728; x=1794133528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=paoWbKvqLK3NcbGaFUKJSTzcpwiwtIw5MyG4/oJgE9E=;
        b=PkQZ+XJNbnFgVlIDTRSgVWtEJWIYgUuYr996WYpbTC04fo+/qKtNRMvi44xHQJ9/6D
         P5XqmOJvq8Lb3QV8R+LLJm8W5KYnS7jrkIlHy+S1tLmCMBbktNcUxvz+EfJSUd2xLS8W
         sl2+LYM6Gv6lSw47at6Hw7PIV5t26I4p7gO8oDaBOkgyRPjfEBbbkFvEdDpL8e0kl+FH
         v6k1VdQIIQQuqLwqW9K29sO9CAyckMwfJ0Jk9FHv2Th8o6u1+0G6uvPv2PTGgUv1dcrU
         ho7nre1YGo59y1tGRehJ/PCO6GGkD6rlOx/XDfh67cfzYFeW5ybFUpp0vi+8Uorpb03a
         iWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528728; x=1794133528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paoWbKvqLK3NcbGaFUKJSTzcpwiwtIw5MyG4/oJgE9E=;
        b=nEmLmUqT/nrdblD9bzJJO9U+2VraypFeNl2v/Y+1iummVlnC2KT5NSES1/ku2OknhT
         X1ojdNKmSYZihI5RMiSZO9gVzi6ZLGBKbwYSXOIHy0v2KgvAUyl16Y6g/tH2ZC23WmHp
         kR3hjrSjDsbV2kuP2oXjPVZMTrrjn+fNXfo9RiJafaRLWmnyFuIDFLs+3+ddel2VRYf7
         ytr6WiWiNe3s507HrX47hlmAgCbF6FXfNvTIF2b/UNdhUca4uH4k3045qwgtErihZfAX
         RkVJLIhMqH5gHtMyp5ev79Hvt3hRzk3WHg0cdqSDuHrV4ctSQ/TlfiQ7ZALsGV0cK8Zn
         rqng==
X-Forwarded-Encrypted: i=1; AKwUvBzLbDzrFgm0WzmOay7CqKTbyeytTeUK0Sg9bY65n8FObK1wWlnxAhbYEJnCtb0gcCHgKF3+ydJXrt4Wze8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlPHQwXVjW0w2+PwP3yGebGtmthIWXI/pk/I2ivBhOmEszp2s0
	7lVn/Eaa+5YhBegZi27Yle4szKsR7EtwnocxLxas+VmFvYabuOyTr/Un
X-Gm-Gg: AYBFou3V7ZpearkFIxmwzuKu6r1Q6E2J2UtgF2ZyzffuA1IpCfwva9lE4DFZBTxdY0K
	/3dgq7fOhQK1N0vRnioNoP4t2meSg6YNfmjPx+JPDXIDMvudu6Gmxq5knW3LfAM0l59HJnTAZdU
	NiXQWm88+TKKmGnuEgVMDsOuGiNgXS2MQI/SbtBJlgEQbE2vuhaupsMD3IqYwsEaSo3yykgK68N
	+h/jGB41slzdDSUxt3ReOd/2rRQ/medycKq+xCNkRqgb6RRlQjIVRbSbiSeeNLwDunqvK4Q8fDL
	0U7La255vN2IYN2pZAu3kzfytWAs139f1FONb9iQwLoW2bqLhLsLYhiPrwZYxQ0kFP2x1OEAdX1
	w6/SfVBjO4Wiqzj5g0D6A4OY1WvQXIIxmMVCa0kpKwPXWC+jSR0s/6kcOtWd31QqdGO0oO4/bLV
	IyFvKAj7Z8Hv5qA7aZNI5YjQufmKwXAI76TemM+8fG415DVxp9fSs28KTZHwfMV+jC9Llk3naBk
	8IKLnUDVnhfpCZo5/iu+Howr5EcLoCgkQUfzmz6aPXuW7xnl5pIV3HqQM1ECYMzVXL89K6CDnuc
	uzGwkbhaqHOX92JHUrBg5g0Ivr+YzD3+M3cxbO8SfmHzE+rNuy4MXQlda9ROCsH//xWveBhQ1iS
	WkzzWstTlDbW9SXhI4EW1KgQURcLGgM24CNPNZEUTvN5Z1C7wPTAOZy3RISEye3sJeLG77eYL2A
	sncu3n6z/Iex8vgsFhh6mDExvrAN5LcFi5KTz/c4/Hp/8HyrKLe0JBcKnTrYHLXsm/
X-Received: by 2002:a05:7022:29c:20b0:15a:9834:73f2 with SMTP id a92af1059eb24-1ac5c5554eemr10126918c88.38.1793528727415;
        Sun, 01 Nov 2026 02:25:27 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm6767163c88.9.2026.11.01.02.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:25:26 -0800 (PST)
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
Subject: [PATCH v4 0/3] iio: proximity: sx93xx: keep the IRQ balanced across suspend and resume
Date: Sun,  1 Nov 2026 15:55:01 +0530
Message-ID: <20261101102518.22757-1-kapoorarnav43@gmail.com>
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
fails. One patch per driver, as the Fixes tags differ.

Changes in v4:
- Enable the interrupt first in resume, so resume mirrors suspend
  (Jonathan). This also drops the sx9310_wake_up() helper from v3.
- Drop the IRQ 0 wording from the commit messages (Jonathan)
- Drop Joshua's Reviewed-by, as resume changed

v3: https://lore.kernel.org/all/20261028220444.70121-1-kapoorarnav43@gmail.com/
v2: https://lore.kernel.org/all/20261026112342.65917-1-kapoorarnav43@gmail.com/
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

 drivers/iio/proximity/sx9310.c | 32 ++++++++++++++++++--------------
 drivers/iio/proximity/sx9324.c | 28 ++++++++++++++++------------
 drivers/iio/proximity/sx9360.c | 30 +++++++++++++++++-------------
 3 files changed, 51 insertions(+), 39 deletions(-)


base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

