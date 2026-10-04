Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E393D16FB
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132739; cv=none; b=bQOdI+92PBe6CkOJ7fFer5iQFFzQ40WLFGBxWoBF2Jlg/pjhhftAkPFAA76g9G/RUslHdUgLpIvatROoaRn0eb3VXtKNUcGppN2vjgnuQLvj/oPZqo4mLmVV3spL36uPN/uyCj3Hsw8PopEwf1abTexNIE2RTzsS9rAIrYvL49A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132739; c=relaxed/simple;
	bh=v+M6jZZkpPcV65ZunZ7LyGs21aPM4qlR+wPHbDyhJRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ES5fWFIjrjBHh9hlOERhQdLLf3wJ5kGW/dAzcFiDQjXeq77y528VeXTM1NuLR8q7T3VvMUHfNSBDRokr43yi4YEjWMUPDbPrcUQ6ZMzCys2MVi83tBVo8+7cQh4C4W0Uz8EbB2QGJpHePM1h1Jg2YMB5sBx4e2IXzznlvtRlj7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/8PimF9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/8PimF9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b06bb6e40so755586f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132735; x=1791737535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWLAU/sbLj4UO8gIVZOge/N/7MAezvztdN1AgRtXNUg=;
        b=K/8PimF9FwoLvW9WqIiGJP4GMxTwD1xLltHZWrAfNRIWFb3IcYuPT1DwV/A2uuk2WV
         +itZ3oPLVDIT9BixPyQQX1f1EDA267huN/+CbmeEkl0mTAD39CJ11wJLRQuSoG7CAyYk
         Qd6/eHOV8Ys7SVz2LGG/+1+qgCL4Br2YqcJcMIr7Cn3OTYhwUKldsfhKDbSdqs79w1Bt
         xIwmaBLPrwVclr5ZU5O6Z4/r2+GpvMFZoY76tqa8u9VCN2PvTUq6yLTtxBjf1XMXNrL1
         vNDbBrAFDa8H0KKEdr4oCY5rBwNKu6YBT2Op/BqwLClTIblLYPYFsT+zR1hbAIHQPK8j
         jwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132735; x=1791737535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWLAU/sbLj4UO8gIVZOge/N/7MAezvztdN1AgRtXNUg=;
        b=P+q8k2HPLmnbmYIsOjBe8K0yJyhG6es/Ak7DXa50+gifZD0Y1y1y0LQkOy4FDshAGl
         b7vLWhby7h+kTc0CNzumya3H1taP0e6PiETbl7nbWaN5m1B5qgiYSdDmj6ilxoh9rUOR
         6w/IIHq8SdtdZ+FVBWnBp8D2g7j/GP3mefET6jTwNGKgqXipFLf4pI/lrQZxDg4yl9VL
         lZl0fCwXh0cGeDIG2LOU8DgWfFW9K9wM31QK66h4fkT1fvFa/SdzBKAnfQikfldfTFJ0
         QUfmW+4McFNnbVo59pi3+Imq6X9MCqwcIhY7VeyRRianDLj7jkkp+qUrKHkIENT0DT+n
         DNnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs6gb+8YS9tGAKZM16CrOEWXO6lv/u3I849R+g4+q8u1GHH5Ueh36ep45MXE4GkaEJh1Iy0KQ9MbXO5ak=@vger.kernel.org
X-Gm-Message-State: AFq9FYLntpIipxTN94BlztBHnNDcjkY0DaHqCIcs7UPtkyIUIo9kzish
	MF1LI73YlP8THSiJoT473NTQmPv2e32tKUUHRty7L+JCrpyk3RZy7MPS
X-Gm-Gg: AYBFou07x0L3/akeOVxtxtdxYGgxM/r64roZWPPHWkiRxyrSRyDB4XvCQVws8c2ygmH
	IS7ZziEfFIxWlNuTmJ6NMskQh7Hiq5n9d/eOnRArZyHxzJsznJzshd41ls2nYqP3fseE7mUpP+I
	OxLcqy8b/8i8w2Bl4aPNEz3Oeqd+wCnHI34v1qr2A9F9hS6jDKkkughDldLcvo8qCKvilsAdQkC
	fRr7F8sj3/wDtwfnd2/6MRmKo0U3kcxVPOU2tG+SRbYVdI/ZZKV/WAjPdf3MQ2q7uirnFhuNOze
	DmVdT4UCKaINfyUJfkAk2qR9SUq9t2CXxxZrm5bxVJzmTkYPylpcO9I9uMZFWA/9GVoN3Cn4c03
	fDVPTL8G/nF6NV6/r8iZBZlIMVW4RzASPgltnA1YdKIiUEOladGaYeGzTWkajFMNoZmSns1zLHh
	FOcsHQyMw6PEXp+BCS7Dqu/qu3F2qwNR4Q+SKGsPLN/+CV+heDl1WzJHizp/EC0MCB49/UUZ8v5
	KWnhKuYp1LpXaaZs/RzN2BsGJ6Oeg==
X-Received: by 2002:a5d:5f86:0:b0:486:e835:ab88 with SMTP id ffacd0b85a97d-48c47fc5cb6mr8242586f8f.13.1791132734865;
        Sun, 04 Oct 2026 09:52:14 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm20902213f8f.37.2026.10.04.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:52:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jordan Viknar <jordanviknar@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: tegra: separate schema and adjust OTG logic
Date: Sun,  4 Oct 2026 19:52:02 +0300
Message-ID: <20261004165204.205660-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate Tegra specific USB controller props into a dedicated schema.
Adjust USB OTG mode behavior with extcon use.

Jordan Viknar (1):
  usb: phy: tegra: Disable internal USB sensing if extcon is used

Svyatoslav Ryhel (1):
  dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
    dedicated schema

 .../bindings/usb/chipidea,usb2-tegra.yaml     | 88 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 drivers/usb/phy/phy-tegra-usb.c               | 55 ++++++++++++
 include/linux/usb/tegra_usb_phy.h             |  1 +
 4 files changed, 144 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

-- 
2.53.0

