Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72031349CE2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339300; cv=none; b=DdTmaJY0HR9+rxZBs5VFPpF/snHWVV725esSA1etFgoD2pEGlmAVvxlYV5rbSjf5oSDRCOBx+ljfy35LN3LHz36S9VX+1oYSm5gaVZ35Q9ZPR6B866MhbAspfFMeoZkJ+J268mQkVaiGbXLwTM41/Yl/ZD9FcZ7BVz/E3nskqSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339300; c=relaxed/simple;
	bh=Buqyin2BRLK9uHcTURSSN8vZvbm9YK/rlRX6JjPtwBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBEz657xoAXSmh3Khp56yKukiaj710Wqb3hGgCT12sYDVKVTXTTylRiyU/ScqdYyA6W7Vf8TzaVVIInUjSKazEjlQoVpiSNRbHEayZcAAV+wKdBiGY92RowHtheT45g9JGhRW79G0LAbwMXiOuWHY+ixYCW4svDGEHu1POsEj+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cZ+CLF6H; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cZ+CLF6H"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3000265e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790339296; x=1790944096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=deuk7VvN7Dp02rRBKFxmXcYurefRWx2cWJSZzNnIkL8=;
        b=cZ+CLF6HWqxZws42n4qHEzDUtqdBN8Y+EjKr9/Udc5W816cKXaaRNnTFFpbkB4TaVu
         GBpGw/wt4A6ILK0yJNP/AmiE1bdTB4j5c7WHk4ymtJsRH0Eewyzs8zsrNccuHWqzcsFD
         ypQymBzvQaZgjCbS4xmdGFVvBlcvfMGhJEV07L0yvH5jyyEewWTL/xu0k5Iso9qAZqIa
         yWA0KnejHG9LAyRFvNp2jihQUxuzzn3qoCYJItBb+iHI96DD7+diK8I8ga3dg+v9BtMM
         W8ME/T0WZDaVygaDP+wiROLwdl7wtLkqKkGAj0zRHoQ8qV618l8AAVVa2QqoxL/E0HBD
         Q9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339296; x=1790944096;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deuk7VvN7Dp02rRBKFxmXcYurefRWx2cWJSZzNnIkL8=;
        b=OHjznhl4X2vvs5v1jIB0jwyC0guWzA3guOmWJ05IzYw+512HeaMGNty/A06UKp1L6X
         DrKU8thTpDGCUn7MgvgaJlq5/5lK/zF6rw935nsP4GbSP8O26IS0QoQ4VZ1MM0+s9t4E
         2F0p7GJ3f7hhZV4uovNoy0q5kFkxJSx+ZVQ4sBWFIBuPJ7WBWEm97RWPMTg2gvb4hb1b
         Gb7wa5S7/S/x/VubGFCNDJFkHw35llMU0wL5m8DFh6DYMIWs2oUQLhTMi/XQCvaIU7tv
         /9MbD9PyUw/I6utjRKQCr9qptygLcul1OBexAWmGCPofqZroJ6ex+9kqCWdKW9438mR6
         9s4g==
X-Forwarded-Encrypted: i=1; AKwUvBxomb7qQjZAxVT98pok+VgUKpNLhzWDMuW6zVid+vCuHUA8nW1ETWZ13HcW8/6WUf+q57CX3uxXE3g0WWU=@vger.kernel.org
X-Gm-Message-State: AFuF++kKIQeY5PQDBIrXUAr7YHsMKV2uYpIdNOuCSDAC6t1xSIfuIM4b
	qARmuTc/d21myVjA/UL0ukiqCeXzK6wzyvdP10AFRDlljCruDPuEXSshGJe8kbvqxLA=
X-Gm-Gg: AYBFou3l/JsFxxLWLmu4CE/USiyZYqaSjlN9CkAobl3D3BA1//T0rsYDbKjqGVNuRhj
	CXfeFHcIYxiiPwZcI626Rw6PioB3j1b3C4ILUljBk7WjGbsusUJb5nPj/MjOKkTi4el78vKLVJJ
	LEhtFSDTqyDQH4RdRCLVZ6eSjBRGTHFBySotzNY0QMb+Tie5VuSUsMiQHemXk3HbUhFWEzH73Z+
	XDq004P7lMChhtCveptIPI6M/vcrUGQn5q1X5TsQM8aobqknklef6UvUMe2sCcjk8og3SvSgtx7
	/psgov9SnuoGIzmj55PVfhI5XZnlEmLBamyCPeSIPL+x5157FFW9Ky82iqdEOOnu6b2MMBhj05Y
	EpxTkPoSpw6GzuLASVcEyLVMQcq31vjmgFrT5jmvVRs15/ET+HwAtAsv38IyaQ+Rlr7pnIF60md
	eCQQvhN7JrcWO/GwQsOd0zU+hy+/vYugNhY5ezs7pfxKmK0AlxHkWpwgpQH3WZ0pWS03VDsYsKL
	4USMQ1aEy0Mp835rw==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr97213455e9.4.1790339295735;
        Fri, 25 Sep 2026 05:28:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm39306745e9.10.2026.09.25.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:28:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: clock: Add Amlogic A9 SCMI clock controller
Date: Fri, 25 Sep 2026 14:28:08 +0200
Message-ID: <179033924420.2256964.9574069512756367245.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917-a9_scmi-v3-1-5ad843766774@amlogic.com>
References: <20260917-a9_scmi-v3-1-5ad843766774@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to git@github.com:BayLibre/clk-meson.git (clk-meson-next), thanks!

[1/1] dt-bindings: clock: Add Amlogic A9 SCMI clock controller
      commit: f25652a1c0d0b0d2cf6615f1aa693f7f941aff6a

Best regards,
--
Jerome
