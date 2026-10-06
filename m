Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C64049CF5D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301484; cv=none; b=Y6Danfpwj3tyXMkgidCpYQNhhwJs33+fW2OprrWMkGvmx8exaD16Dg/Qt8iCswxcXEODxMfEwoZseT03d9TvUGHW2N4jANYFFjWjIfFo5hAisz9qr2sFnThjSKYRb1YauOvp3Fe9mOr//lguQSdfad+r3SHzuY78NLs9LB99/OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301484; c=relaxed/simple;
	bh=d+Sg/QN0vuk5Vbj+git5U7K335HCgp0F7VITjtEmHOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KTbWSvqxycUZM958x/t8QB1kbcT7BT5YnFB1abE339ICX7KzFUq8zUHDep586HlklOuoyYFBY3stVbnGiOuJ8Y+z8Ng0I+glF1AWH/rCai66GRMJp0JoynFZs2zv8ejGIgV11fmUhMbmXnoQdmmLSW9EAbChfhnSsQTIZJz3cpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBxHlxh7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBxHlxh7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-487049569b6so703925f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301481; x=1791906281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OBM6S6WvMfOYmics2t4tBC7RnarAW2QTV/e/3ITAXc=;
        b=sBxHlxh7RrfoszKmp/Q/lINnhi6WjgQrC5iXq9jvHxD0q2koIyO1esP0xnaGGXL1LG
         CE/N8btpBCf1Idm6xHAH+8jP+8/+pnnxPYw6UGw6mzh2czga9pIUzWrOUaiYEXqvsxv6
         OtFx6fNxUB9Wm8CMINP23x62cym02sosl4/SQFehG5lTGNTt2QF82Z+wTBTNNQQIrFye
         8xxOacbw1eWXxEJoLX3NJLMJ4eFBOtVrcZUwaWS6XBjiHm1l5eo7949+sjGxczcl9QCS
         72C6wzaRIvyLniYYGSpHgThnrUB9simOsdWKrASt50Za8dswEGCcbAFFM3Q782PHI8HI
         9vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301481; x=1791906281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OBM6S6WvMfOYmics2t4tBC7RnarAW2QTV/e/3ITAXc=;
        b=y2cFGNnZkgruoFyPWbI9YfyVHCp0GxYPAqdNejkV5SD46/tfMhZS9sZiPtD5gi0FL1
         Cg7gcurgIjxseLfbTgdEvlPb/YpnDQY70GMN6S0mBpZUWa30yybFj9EbhWG2F0ipCjoZ
         L/iPLHM0HYAj5EIKxMgo5s0nO8KyI5OgKNV/WaB2kQG9fy/WtWUohT1mFJoU7CCLeX5B
         EkdRaRkh4uTL3ds56IUDf780H3TBSQUFt8am69PhHdnIgCYOwQLhkziGautfDXvTxUGC
         acdnnYm98SLnsQ1Nn8i8WbvAWMSQ+2r/W01yXsFU4CQvVb+6Q2mg8rVmFnVM5dmOXyur
         VNTw==
X-Gm-Message-State: AFq9FYIOMNP+wtC8UUbkupHk523kx2PW+Sf3TEPWCATwSxtXimV/nW5s
	q1dgWLx1T/rNfcto3XHxWpUzls07c29e6Bi8xZJoe5CAQsvYkwkgpmr6
X-Gm-Gg: AYBFou1nuOTVMNAL8qWQMVu7dxsRV45zOrqT2clBIlzLU+PLwMcLs4KKLoZ+khp+YoV
	C56HPpQUbjKqS52sy2TmnBjsNlolHC+SohhW12on1yQ25vzPLCkSI8NGXJSEWXHPD31ibsVT76L
	tkuu6T0L52zn1Yyf7B/87qm3RP55Zix+UUrq/PVsmqfZB/pqzY3dhNYkEUTlcfhmz9sMaJYQTh+
	15TbnhZD3WTwlfJEeGhhAnvTKYH73hTqsue7FwsrSR4V8dluc7rPEhki8apuPkt+7pzslagPtmV
	qVGZMozh3chJpsMP71AbvEO8L2hVXyRtU0Q9AVCYufcXFJhwwdKVGGXI3J9yjn1z+VtHcRs3RTx
	zlf6BvtfZz93iLjSZ+HP+Aw6Jr5uSKyTUCUK3NJvFaTeQGgC8DAlcDorZ2kZtml9JPPYUFMWCqO
	AnP8zN6mptSOqalvoqfdSJk8ugTQUHTqKADbGuUZAUU2k7Vq9xNvzx+/cRnKegDsWX0d4rAEDZt
	kBYEbSxqdWd7RaLVRg=
X-Received: by 2002:a05:6000:4816:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48c6d1d23afmr2860943f8f.43.1791301481269;
        Tue, 06 Oct 2026 08:44:41 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/7] lp872x: remove platform_data based probing and adjustments
Date: Tue,  6 Oct 2026 18:44:24 +0300
Message-ID: <20261006154431.318936-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert and upgrade schema. Consolidate driver file, remove platform_data
based probing and add missing regulator/chip supplies.

Svyatoslav Ryhel (7):
  regulator: dt-bindings: ti,lp872x: Convert to DT schema
  regulator: dt-bindings: ti,lp872x: Document input supplies
  regulator: lp872x: Fold driver header into driver file
  regulator: lp872x: Remove redundant regmap wrappers
  regulator: lp872x: Remove platform_data based probing
  regulator: lp872x: Add support for input and regulator power supplies
  regulator: lp872x: Use macro to fill regulator descriptor

 .../devicetree/bindings/regulator/lp872x.txt  | 161 -----
 .../bindings/regulator/ti,lp8720.yaml         | 244 +++++++
 drivers/regulator/lp872x.c                    | 665 ++++++------------
 include/linux/regulator/lp872x.h              |  86 ---
 4 files changed, 448 insertions(+), 708 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/lp872x.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
 delete mode 100644 include/linux/regulator/lp872x.h

-- 
2.53.0

