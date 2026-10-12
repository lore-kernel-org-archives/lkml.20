Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D14CEE6B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841738; cv=none; b=b9qUinb1CNbcZbE76xY4HLZcjt6XEc9LQV96uL8ItrWA/+3vKvMp5485XjRf5icBmhDpi7FU7pl5f+TwBJR31J+d08a67S51qgbU6vDTYa/PX5LXjihwYff+Td32zztsWCGm4169sCgJJMaG4DAF7vxY//RlACj6HJvz+goLhv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841738; c=relaxed/simple;
	bh=+LM//r49lcXL5ulzjzgjIm9/ZR3GBPhGYI9a3F9PvLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obDXBxWhQ2zRz/OwhEE5AzJvid41bjrRu6802h9n1fDBJddnMp9bful5nZ6y0bLTcg9X4izzddXjvxfKMmO1LGQKiRoGzVmcljym7WSQqwI4Sl0Rd0QzusF3JvFiOB3B9/V6KDIFO31Fy8HhVxOrohuO7VOxI6h+zsdCtZWTr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPHTD69Q; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPHTD69Q"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8d2574fd9so9699335ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841734; x=1792446534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzqsIiDe8Lj5/hNhbQ747+w6QQ1iGRWw+s7eZPb+FgI=;
        b=WPHTD69Q4BSSs8GKF56nQ28NGwtzMmd/jsMN/EEo2BkL+mXjWRO5XpDSu0u/bK7+xN
         N8CQ17XNUvtuM2ak7SG6AW0rJ7i2VqNmVNZ9GxDXB1JQERzjImWU0mkElVYTiPCFL7nJ
         jtzRTtwnN5OqzML+aeq7lRq4QuyKv8qcisJuyVFT9gM58js1ZO2UgfBDsm9rIYUZWemR
         IZgGJMDiKdEyWdCaRqeih5GCeNVtzzxPbKpKB32vm+90KjPm/VLx/kF22DFdsyjP2Bcy
         bTdQTRkE5Q0iG8VNsv7Zf8c0RI8DFmbipdQikEdPR4Imj82b9rT4Ao+jeXybS1l/POXl
         DQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841734; x=1792446534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzqsIiDe8Lj5/hNhbQ747+w6QQ1iGRWw+s7eZPb+FgI=;
        b=eGzQ+BVYuAQJX7Kw+rCXOtTtEoWA5/f8+dv1S2YYcVss5m93cNz73TK1TGJF2gBAAX
         kvA/3iu1+mmZE/k8Q5Rzoa8eOsnP9VyAG5W33Lt1pSPvWmQZeaIO2K0RhmJ0Rp+Q+/1z
         tDimollmmXYqS7+ah22S8HqETIzsxhQ12evbMCCbUsD5odr8xQrT417zmcd/Ou8ryK7E
         w4hsaOv7pRXjv0XRisU8B8tOGiCwiI9jP5SNDsZ4Zn0KXXLpwuW1uFFE9X9Epl+fkSP/
         qi1i5jXosYycmEfsSgsICJFuYqWrXm4HeRfVUNXSXJr2ll22oB2Ov7skw1t5VsGLwPkn
         3qZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1OjXa9DCOmlZRcYQNBIVKB0OnG05jdN0lTllMzs1SIAISUWD731UZcOvgPAqNtNACnBYNbZdYkE+5pXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt+aZtid8ZjiMIDfspWr559NNhCQ+8wyAH7hqBNlnMCANq6Lxo
	bWxb7OLhBdkfxrVwGPiX7+w1ezhEnOD/ZohhBhU0s8je+XHCH0ZmObjrx6dXa8U+8/Rrnw==
X-Gm-Gg: AYBFou091JFBxqqyCMi/GsAwmS7NaBcN6XohwW81MqYbePUOh3z0iI9R1NNiKZiYXII
	Lz9BENqQcHt6s2ami1Z8TgvQqL+Ic3A2pvdaDLQ0Fd7MY4FwiYXVjZ3+Rf4UcsPRzejCNljTBao
	4428HxGP8eJhUOufcfiSzMrrrcb+GzAL5segFhD4s/ED3aDRylDT05NVQDI6ErfmRQA3r9gtl48
	enZEwbVg7bt4mX1xWQ8H6lMGHMq+9h5GPOnACCdjj3ykEA44Yb+C3kef63CXvDfT5QboFMLWsVg
	p+VohSwZ0qIYEtA8KR+EPktg/f5JlaPXYWN1O0Wh4bgfohBwV6XxFPVnXWk5s0lRYNpw0YiLA/O
	DUr0+wM+mUjFfY9CGquGLheT6o2KHVfruxPgb7g6ASlhbAsdzEpBDvw/8tafamPhGHD+59imG0n
	lmPQBjPZJy+vhsXzBz2UlUj1bmCCIpMRsgxbYjlUsJJBlMrcJoz1eopmYokU34o/2qKBEXz4Nig
	tP5EznimxUNfQe7us9SPpEOX0USAtW59Z4XWtPEmbHf6DgEwArrc+jqalTdKA==
X-Received: by 2002:a17:902:ffd0:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2e842aa662amr86633865ad.19.1791841734180;
        Mon, 12 Oct 2026 14:48:54 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1c89sm45467445ad.75.2026.10.12.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:48:53 -0700 (PDT)
From: Lloyd Hazlett <lloyd.hazlett@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block definition
Date: Tue, 13 Oct 2026 08:48:33 +1100
Message-ID: <20261012214834.357754-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A14 (UX3407RA, X1E80100), which this series does
not enable. Applied onto next-20261001 together with local nodes for this
machine's OV02C10 on CCI1's second I2C bus and CSIPHY4, written to the
pattern of patches 07 and 08.

The media graph links end to end, with every hop enabled:

  ov02c10 11-0036 -> msm_csiphy4 -> msm_csid0 -> msm_vfe0_rdi0 -> msm_vfe0_video0

carrying SGRBG10_1X10/1928x1092. libcamera captures continuously at 28-32
fps through the software ISP, and the frames are correctly exposed images
rather than blank ones: a captured 1920x1092 ABGR8888 frame samples to a
mean colour value of 118.8 with 99.8% non-zero and 203 of 256 levels
represented. No CAMSS or CSI-2 errors appear in the log.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
