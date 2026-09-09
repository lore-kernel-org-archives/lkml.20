Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34740385D7B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952535; cv=none; b=ATSfenCIqIaYl/3qOIERovMeCNbb7jdzKywrTQEAhtzn35iecsTv4f8cziuVhYCbLlo2pSqwZGkBsmPmDQY/TxRsBCypaHZZbz0YB2cXElKx4caE8GFHo35d858LER/v8XKSYxBhk0M/mqX3KMyqgGoisilc0dGGL0y9QHxPx1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952535; c=relaxed/simple;
	bh=snlMqwyYUafP7d/pSIwvzXmTqJKkpO3QnYy28S7ZydE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YexzZwjvmvhpT9Z05y0CxHe5VLEBGu9tOXFzzU3dNIckdl0NT0u4mfVAguTVw8Clky0Qhcd866KRmjeR7AJsPGQwYpRzTrJaGYyCkTuE9UbpSHB7tVv/ZQ6C5/sx0qRJi2ySkP72RJOyTKEZ8WvzUsI+YhZ5acCjGoDsSy/D9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Gf9qvHpn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Gf9qvHpn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so80140685e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788952531; x=1789557331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoxuaA9JpWMgU56nq3M5cvSZAVoUseUX/nhRtKSz29E=;
        b=Gf9qvHpnH/OqfJzTCcCsBTaoRO2wcXlhi8Y3dVYcEKPUs4IjhcC5rPR/sOMoPeSYpB
         PAJpQvyTy+0XY4oLjbslzMIHueeRPyFo/HQwyDYI2lKNHEpNdV+vRUxTMUxfNQOkvqi8
         V3mvsuVfBESLa0jgRVkO1GwTR4+MicvuURk2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952531; x=1789557331;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoxuaA9JpWMgU56nq3M5cvSZAVoUseUX/nhRtKSz29E=;
        b=Flru3qGRANW1VUSDkpK72f9OefP8m9rYnXmUJIk/90sLKzCm44IixiouwqTvNQspCO
         fIs6UN+p5vypJtuDuIPGVBZW311tJ8M+PPMLfpfPhUukLQlCKeWVHW8OyDJ8yU1KO1qt
         8TrtFD7DKzhhHv1GpVHp5wR0Tt57lsh1I4j3Y9UTc/j/oygOscKqn9JfDcx11bysZWrc
         Y7OlIF8BN2p6ZfExy2ZVgz7ixNiuSl65ZI69t4v1PD7IKD5QXvkyqrNnLc4gWYtohDCr
         9F9cDduVAd5QBRebaWmKWQA/ACdjvAnP2XQ8teI9YaAHCbapBFhoCnFwN+BvDzwyFDPS
         H2NA==
X-Gm-Message-State: AFuF++mDZQoRuhL7D15DBLuVlOiwk7iVXPBk25El6FRkwONofNmsaXTc
	VQyTiE+YQJvUSrsbh5T81NBc/0OFKLwpXY2FclBS/BnBO6QKNhNc61pwucGiomwWspShZsfaGLK
	hPei9
X-Gm-Gg: AYBFou3qRAsCrZhUMA6qCkEsAgiRe8BXv+iGkVF3Ho+XjKM6KT+Px54I/xkdZ5z5bPP
	qjQqKDqP9biGlIIjAxRDQaxcvJixAV+6uhQknZESc/9+AY7mv3HTXBolDRmnIoNpkBy6TaFFxgN
	4W76VZHB9GJ0VClKIrzkz0BRzuPn/dkgLcgGfMVwXKFVdlaP4ss3J4rZIdfNpuD8Fi5jz5FieUW
	hEwozsWCbXldKApGG/QaspYPgEOPxqlWGHulNgVaetKki6KTa6TSEe8KGMoHay1oIFa1PVx+wcS
	q5rogAlHHPIMnn4LBs9puMJ8RBCiODf2gJzCUIe1fTipxIhEejSg+casDtsTVmnmpxj1lHMwjfS
	n/Jq/eufTVs10n/ig3K/p3w+17N92DnByxXRT3/KaMH0Uc1iUXtY7RMwhLMbmaAaW9moqmtM7zG
	aycDxkUR56JB58WXnvOF1GzxhrUK3L8CVVDuHyaGXvBpnXfY38OXNUS0KkDfamkBMiJgxbLTMXH
	97/DfOQnIVfEWpz
X-Received: by 2002:a05:600c:1551:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49cfa211d5fmr340935015e9.30.1788952531125;
        Wed, 09 Sep 2026 04:15:31 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm107391915e9.4.2026.09.09.04.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:15:30 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 0/3] ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.
Date: Wed,  9 Sep 2026 14:15:08 +0300
Message-ID: <20260909111513.2259643-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

This is the SoCFPGA devicetree part.

Changes in v3:

  - add Draeger AG in devicetree/bindings/vendor-prefixes.yaml
  - separate binding changes from the actual devicetree patch
  - remove "earlyprintk" from the boot arguments

Petko Manolov (3):
  Add Draeger AG as a vendor
  Add Draeger's M48 board to the SoCFPGA family.
  Add socfpga devicetree for Draeger's M48 board.

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 129 ++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

