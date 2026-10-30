Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334697;
	b=my0mVcjTXiqTiEPAJ46Okp8ib8qFrv2tWTBFLwgQjBa+j/MV8Xre3QnXo6LSEkecC1Gp
	 MlhNkeCyM5U/Fp0kghfrAeH+3Wn7jLwEtt/g+yDnylnq4mCWhnTWYm30tKyIh3CH2Rxiy
	 25rf/Zkj5QB48inBOFDgk0wtXpw9E+JmsDThAUNpZKgz98teR32AiEjOyKUgY/jfl+xty
	 WGhVXwjXiGX6GANPcFAvE085urJcbO+Rp9qKMvdplJLwHpAmpc7Xwzmv4fUgjNvnHOWD5
	 jgC2MY7Te3pd1AEzjOO6hIZu1HRO+IsTbxYSRWZZrJCdWd93yhoHjxCDH4lFTiwdvxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
	b=yN2QHecb+xpE395tKXn7EfTKl12obbqdBSgxQbyG3+4uZmTN4IjHh9SSviehuNpc9kaQ
	 HufqGQ340mpeqeLz9Gez3Qmws9PISiZWJII+q3ocHr4vrL5ezTo7ayIYrlGnCFdOiMsaj
	 yzqI+LxKCLfVH/GK5u31MZq0R91MjwqZgTpkhlmrzkj5zeZdAbMCcUjtpmfUgmpV8EIzh
	 bodls2i5HPYrpSIKCQUoh4gU53RxE0Ur0FX2XmOP5FojWBuEAoAy6eSS5nKYGjVRW+CXo
	 z7uXOfUOyYLkiDRQ1SWCc6G6noa2yBKnOlcR2sDNNbNrnFNktBxCWkPYBC/g7N7f9dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xkWQC/Lo";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0406D606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0406D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkWQC/Lo
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e987a2ba0cso1761565ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334696; x=1793939496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
        b=xkWQC/LoB26hhGfn0zGpbbOjvSjxtSvYyfsNZwxGMLIKcHiS4oC/ac+8BnkPoKJsXK
         yie/eewiy7K2gOWpvcw+6+mgJFwYlY0gJam/wCfuASg7yUN5dOCQbFmVNkMvrjBjSCqK
         e2w9aihkqgJPcf8iActWxxlpYt56dcdC5hLvm68OthfbKQ9yzhFKF8bEbhnHNkfHSOSF
         hj8MDGd/yWveymrYwLb4Ou68GcjkWKjgVPtFqKTw+An6X2XYlAXNjXscYzK0PLhcEB3i
         hk0sdQhoCksFeaVshV3t1YCbfo89/VekNeJnrkUe0p5BgbAbXKUazjiRfU0hX6qMz7by
         229Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334696; x=1793939496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
        b=HVVSAwQ0Emgg/fmMY3fKyERX7cAirVkwd+UXKLNtfNFyD9kA+VRnG+3UcRM7elvDVV
         eYeENDQh+DmWI60TxdcekFK2GoZdm+F8CD6Ct9eQkAT8yaW1oqeFi7EKPjSe9w1J5ob9
         s7uJI3LT/bayXxgk4MKCRWtpB455qn/qd3gLtWc10EjyMElxDJoFnmDtzfMJZxZpsMzi
         11PWm1cpcyIJ9bFqqS0ypjn86BZuOvLjVBT2BplRP+JvBMqCdrQcffm9rYOIZSDPYhyd
         DKEX/dLY9Vizb2QicIASmAwnX9wSqfMbG3FKBPU7FFcLMKHQyj9ZA3gBn+p6Ew4XbWyU
         esHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxphasLhFDfzkuNlhdu2gHFuFvjNdwgob1XwHtDmbRinTegMLYbbC1oPvRbgUwv8NqJdjM5XoXP9PPBY9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8V5S4jAgT78h9OLimcswlRtnISHVdSJJsMPq2e5E2Z/zc/zvc
	+mpqg6Fq9EO9CSnQyXp3NqN5RIIksU4unnaRBlM+GB7EHLq4I8hm0HY=
X-Gm-Gg: AYBFou1EZoIiU3tujuOfM4iaSkHWumaiBZHxqEljXrPW4YDKGFadcpkmRxaBdD3fbGr
	5JQ1pnQeB5sg5x+5d5rJqs7u81R9UzFkDgzLWL4gMrxWLejFvbA/STrTpUDbzMxk0KwnGaFZznj
	4xUiWg1+xwotxLRlWsJ1J1Bfav92Q38CJoSjb6JnDsOHkWPREmwCFdLKi5g1GIi+heh2z9i1CbH
	jXhRL4MBzH3p5DFxi4Q0c/BFcP2vvv2n2XZRBi3CQ/jriBjkLs0X58gZEX1PQFrxQJqvJYU3L8M
	IMFg24N6eXpKUNqpFGMOODBfkYJwb/KyHzs8BTCSexaAi0JmlAyczIhdVe965c/HbcuvLsLlMzA
	jfLlWAllZygQ6gikeEFxFsoUd6d3lPjKhW+HdiNQz8O3DHqjKNJPDq7qkk7v3Z+e70vpUD7OTRS
	8en8pJN8BFMs1Wl2wdWG2wZtL3EYW9cJ0Ui0Jo7ZISeibutZ33BvU5H27LfXC2itaKGNlEUIaki
	4zGEbj3Ea29QgqAbXpZj6cgdg2N8dBDmiS3MxFp/gqJeUmlrAQN26hStHeTW1wThNxAI3QvEvYI
	N5vMn8UB9F22kvnQ706+5xvx1sRybTjiw3hTd0sCinEYQ4ufgBaKh/1x6XazVC7sGOKt5tz4etT
	597WKQ+3ocAI2bA==
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr914461a91.36.1793334696274;
        Thu, 29 Oct 2026 21:31:36 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm2259922a91.9.2026.10.29.21.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:31:35 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v2 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Thu, 29 Oct 2026 21:31:31 -0700
Message-ID: <20261030043132.2746814-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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

On 14-Oct-26 16:01, Jishnu Prakash wrote:
> The series also adds support for skipping interrupt configurations
> which is needed to support SoCs where the PMIC's interrupt pin is
> grounded, such as Glymur.

Tested the series on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2
Elite), on v7.3 plus out-of-tree Glymur platform/board patches. Its
PM8010 is described without an interrupt, so this exercises the
no-IRQ path:

  - The MFD and regulator drivers probe; the three LDOs the board
    uses for its two camera sensors (OV02C10 RGB, HM1092 IR) are off
    when idle and switch on only while a sensor streams.
  - Both sensors stream through CAMSS: RGB at 1080p30 for a 60 s soak
    with no dropped frames, and the IR sensor at 560x360.
  - Both cameras still capture after s2idle resume.

I didn't test regulator mode voting specifically, or a PM8008. Happy
to re-test v3.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
