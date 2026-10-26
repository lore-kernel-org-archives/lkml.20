Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008658;
	b=HHNo++Xq35SHeOZYKfmsHN2fmZEnjE9j4fpGAb9sB0hBDPf3dem7Tbt7AoV/NN3eclwp
	 oXZMAkAPG5anFbDVp/YY2gjp5Ah3UsP07eyMOInsxqabEVrtFwnkTgUylznANo6zw2cLg
	 qe5yJtIw28zfME3S17vCmGR3QhTQ8rCaarVT3Oh5SKNmYPthux7rZRw4+PP89RF2ph2z6
	 hFIHdKNL3M2qzipXWS1VeORphYdZB2NM2hTh5iwAL4h9nAjm0fZIVjdqZD/w7RVemg+mA
	 2a3COTsqG5yFKP39WvKIo3kfA45+uW/ERtGD7yNEKsKRqT/+zYkynZFtj9e5EShfx0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
	b=3OJjcQHr5DEfe74NwKsSCNxoAGbXfXDgUkwUpIuZuQDbzXPMwAzg0ep6Whf23OajblDK
	 DVJUJB84vpRMpKZs8+gmEywXZj/jlZC6ZVOGLN5QrNrqMsZno+kNIx9YHh7Z3+Y0ooxrl
	 Nq0h3p5YuiXQx/dedYxakGOHGf4YdfOBkOSU7bjZI/xF6Ehs47didFI1mOlEQ5A8MfLTr
	 S51k3RB8vcz816WbQO34KUI3RdslRVtjlbT8q+CFgf8TdJvrljTNSGLHMEGmx1/h5wbmS
	 Kjy0vVxaGtOJHWfJKWUFnnZi8QOVOmDOy3IIolkMAGFohcBJB9uvBe8/hGXJKrOBzww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I9AINkwW;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D766606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D766606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I9AINkwW
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28311575e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008655; x=1793613455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
        b=I9AINkwWJ8ZYrJ01RIz5nlad0i1p4Ey5rx3qPRZrjwVgkvVfpgias0jPNHD3yDLmPC
         ik8oh2SJ4v8gpGM59obQWtz6CNjfaWkOfMbXKlgZjJcZXY4sAW9jG8IrJwNH+6HZELBf
         3ttqpOSIy0b4cKURHN71PSzEbx3vPhv6tQkqhPgIzOtzBWGQSc9F78si2s0wlQ7jMeWp
         0Q5z5pXhClPEYQef+nt+3vW2V6PbCRmFo0gvfk8wX8pqF9hVIUCmxWb6gEAa2IogtBO1
         uBAetd71IQL1mZPqj/meKzfcoihEmIzN5C7alFcpvih4qre/t4qyOxOOz+P9sHU0mXri
         ZKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008655; x=1793613455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
        b=f/V8JPsf3igMg/frRLT5a/cEjGTLXvPznrqRkm893YTpo3TYFaNC6J3fLNJlh3847t
         o5cAMslCeqniV+Dsgnnmr4NRSK6jj+ZONYGVUDrryiLHCq4tMFmWSvXWaIyYMuG6uNnJ
         8MNlS/lldIRHukJd9X/axQpYwe7U9k6L/eLLZ3piBjJLd3LTe48QXOEIZRjTJzvQAxSg
         2gT/fHybkwEXygp0k0JEu5J7jCQCPTXilUvmEg4gQbPb0d7+DbbVf4rgG0bT/XyG6LnR
         tahpCiTtb6ZxI0uIRIlaIKdVMIpaQIfqFtlVWTWIZnBNgXfV+nxsYZ9lD5UCItIo2qtH
         4Qxg==
X-Forwarded-Encrypted: i=1; AKwUvBxSnkxGp6h5pfIMU56Lvo1nlYHOuvCpsJQNHysvgFNtLesivwfTW/bfajM9yaUeuRFL5O/FWq634VCth+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Xa43PCSrSar1T8jA1jS4cN1IIHafnrzSIETQZ62hnpLBmnvm
	WNGj8VEeSPcIeqzbnM4cM0KHVt7rryFOFtfwk6yFRNCgnZxh8y7mru0Vh5lSoA==
X-Gm-Gg: AYBFou1NNfShEUTED57sYlyhVH0er23egZD4Kf17L7KeMqiBr7SHqcYIFUYOiO8jawC
	lVWbsgii81AlpHzE77vP/SnDXUzbqBNK+XCMeTYSZg22DdY+bEE0ONx5SpsJnADgyhXCjkcseIP
	oBVHZnTW6X+SXqNHqNXVLFJofDvRAfyiwALmob25HtHiOVw6UM1/4t0mczoCE6ipcvlc2AhZAko
	cs9SB/FZZRlFyhgoQvnZxI67isbE00vnhF26ypEPcway1zsp/Nnji3InqyOr5CrtAFHT8wEc4Jn
	2MP/Y5m53kUn9vIdLZNJMmieD1ccQYWSkxKaZ0az85IkRZ4dk61nfPPmJ8IryjIWxtgrSd/hMV6
	t+n+u3lXL6d+xDvVjF3MikmjB5NS8zcTRacz94f6QSOGkMvvO/TRuMEp4MsnT1zA3hqVV5XEg6G
	P3yLfYsm4xsMjjZRgRFEW55WYtkSi22bza9/Gyip9j5iQj5NV86ekiZOfZ3FOKXXh5/kJD3g3vp
	CBMRxh2DmC/33DhUeWBf2TzWpF1FsSjMS+94H8vNMRTF6lCJaWb8glF2IU2SwS18+NDIckPi4FO
	LcQRjHZPPb3ZLAtAiOw8qfjSRovtNxnVF1a1nzA1jbBhLCjjDmGeFCdBvBm0u6cGaF20a6Tc9yA
	vuwbcgQ==
X-Received: by 2002:a05:600c:4e8b:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a35ac3cb16mr111294555e9.2.1793008655265;
        Mon, 26 Oct 2026 02:57:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] arm64: dts: airoha: en7581: cumulative nodes addition
Date: Mon, 26 Oct 2026 10:57:06 +0100
Message-ID: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series adds all the nodes of what is currently supported
upstream for this SoC.

Christian Marangi (9):
  arm64: dts: airoha: en7581: reorder nodes following incremental regs
  arm64: dts: airoha: en7581: add CPU OPP and scaling nodes
  arm64: dts: airoha: en7581: add Chip-SCU accessor node
  arm64: dts: airoha: en7581: add thermal sensor nodes
  arm64: dts: airoha: en7581: add watchdog node
  arm64: dts: airoha: en7581: add PWM node
  arm64: dts: airoha: en7581: add nodes for all supported uart and
    hsuart
  arm64: dts: airoha: en7581: add crypto node
  arm64: dts: airoha: en7581: add integrated switch node

 arch/arm64/boot/dts/airoha/en7581.dtsi | 673 ++++++++++++++++++++-----
 1 file changed, 553 insertions(+), 120 deletions(-)

-- 
2.55.0

