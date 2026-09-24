Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD03CF20E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240801; cv=none; b=MGIqQVXx/FY5pGSz/EIrMTw9e1wDIWkXOZdXdwGdxnDAAjRcV2aAfJUtlwqQp+DNokUnz8RismLXVYMuxy6JB5T12GzT3rnHqiWojvBBeGscFhLz6ylGecIdHKqUOo7fzZi05DriKGw4+CDR52+3jHsb3xjGHI/wMyJ9pMgB2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240801; c=relaxed/simple;
	bh=nK28L6hxZ9KSJUY90j7KB9ZFcL/Tw1vP3St946F4sGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VF3MWU6scENB1ql9RF1d3kLvuqR18/25fLT4I8NSUt47YoIKQM1DnaN6+hIWO1jewjwebOd41F+j2EkLOW374rhg3ysTLVskwKBgRqFj16TiKSLjRcOUegeohnzu7v2/ylo+A3SA6GY3l7hLu5wCnanzdtO7R1mMNRhKYrk9Mlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCTeg91k; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCTeg91k"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so1044762f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240797; x=1790845597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4sabqfhS2o2uZAuTQZWzjMte84cAzlbbU15QotmRlg=;
        b=NCTeg91kgeO/6hhad3TJi0TyEnQP0uxcb+6OAKEHPKrddLSfUu163NCPx3H3SM2oZ/
         ax0VTOP+qvH9/ZT8zc8Hgfm5oGjRoheNenMPFTTsKJKLhDktWKYxtl9mnniAhSDdjRXD
         +zDm+Jg+cl+RuIBTl7YRK8R9srFdHIQ9IT+MUvHTiAwDeSJx+zOVkW+RYUYhiO5R32sA
         F6cjfFrATQ4U+DXUicBx65GUFvcWeoADV3eJBg2n9T04aq4lNgQ1A8TRFfBy3HBVibxc
         t67sa15+xCm2/8MVSMnMf3Ji+bk1dDBPsnfQGm1yah27KOtqtCmM0p/IUYmjqvbwKzwR
         cKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240797; x=1790845597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4sabqfhS2o2uZAuTQZWzjMte84cAzlbbU15QotmRlg=;
        b=BvCm4Sb8J5vofLyz7AZvUNpyqy+p0m8/1QPMQtstpeoZxIfG0sMJiCaPvpTn1pNoW9
         TrItmiDaCixhnkin1e9hiCpT5hCoSbl42HKOeywc89n8oG89IoUFvpCzYK2RfZVFHz4E
         TzGRzY1Oz/kcyK1P9c69XfF7QuJ6vibb5YVXzYJFr2tgNzDgileHpO047w/nzWub+EbZ
         eVWP0TpUF9/NHThLUW/RZ5+yzfUGgqB2AeNeTIhUlECmie9j4fnp5iCrw1O16NzHp15g
         UyK2AJE5Ut/UwU6WUHzbW35YQrx/OIGsWnxVdNNmpUX3Br6sMQ91VbaHAIaq7qXXXSda
         VD4A==
X-Forwarded-Encrypted: i=1; AKwUvByAmPrbnL4KMBMBpquwIZNr3ECl8EnYkcCbjcyBQV0mQD8jm3CBw8BvRyZe+rltSrSaoCgejOMApb4CgFk=@vger.kernel.org
X-Gm-Message-State: AFuF++kiG8zs3klwNGpjUlUBD6uWTDW5QseT5T/E8DpMy+L+SRflbr1C
	zQIfrKh9/AtL1fWZaB8chq3XxcmHKKignSDIrCqweUm9MKjZ+URXKsqJOG/ahQ==
X-Gm-Gg: AYBFou1F1faOoj/GX5UPj+Jphn4wryQjADNmdPQ8aidjiA5S0jxAIe2Y2ld47dqZNvi
	ZeEX0ha0lpvOHDx486R3dlpv5FmRYWOkwFv+8dSvIiJthm+pK2r1K1RroQQpi9diD9pbrflyX2v
	a1wNNJvWVrVjCZJO5EMqFx7UF0PoMyutOpiTM7ClG3nOxnVX51uv5vWrIajGxLLKQXxCqhjI7sC
	ZXVAstM1TxF670x8mbGWVzWsyD+eYIj2RvrS+npTT37ABfOLl9GHsiAELGao27fri+Md6820SST
	B06He37XKgJi11hSdCPct5mC2Xim18olNdcw2Cky6Mp1f5Y9qilMohk1zT3yrrOKZg8mOgYXn0O
	mexnWQaMh5D3V1WM18x9EqRvhoknLs0uIbaNkXFtg+Ck+ax0ZRTve9mDPktos8afJbn9E8suUj3
	PsyUQHaQSGCcqCiS8QZbYJVPtLZ9ZELC00p9lFouS7iXh2rsZ2KigH7cceyGtNpE7Q5aWQ+Q1gF
	UTFnR2e1cD0+B4ls20=
X-Received: by 2002:a05:6000:26c1:b0:487:342:d141 with SMTP id ffacd0b85a97d-48871679294mr3268587f8f.23.1790240796949;
        Thu, 24 Sep 2026 02:06:36 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] ARM: tegra: lg-x3: Add newly supported devices and fixes
Date: Thu, 24 Sep 2026 12:06:01 +0300
Message-ID: <20260924090608.28734-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for recently supported device (ALS, LED controllers, haptics)
along with minor tweaks and fixups.

Svyatoslav Ryhel (7):
  ARM: tegra: lg-x3: Adjust WiFi node
  ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
  ARM: tegra: lg-x3: Lower supported suspend mode
  ARM: tegra: lg-x3: Add light sensor node
  ARM: tegra: lg-x3: Add flash LEDs controller node
  ARM: tegra: lg-x3: Add haptic engine node
  ARM: tegra: lg-x3: Add backlight LED controller node

 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 106 ++++++++++++++++++-
 3 files changed, 108 insertions(+), 8 deletions(-)

-- 
2.53.0

