Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294423;
	b=F97SWfsUelzO6FxclDAWqG6lMTc/JdOyfq3DyLLqi+K7W0mpm5o53kmKYUACtKCcn+j3
	 N42xlMJfpr5pWzgBmmC/zuFwiMgODdYOSYcnocBwJPPD0zafKifhRMb60CI71gBYLeGHA
	 fpP7hQO9ShgazBpGtQcp6Ux6xClb9PDrTEvDAO4UwY4zcxTf8YvnWOMzfIAmqN3ybj39+
	 +/4b39V2nantXvWrrEzH6oEHYYRsHEmb7DgxVCVu36CMsb5cK8bBf8KIQjGRCjSD473sE
	 AknEvgAfDyyVhg40SE0st07Rt65H1W1+fwCJbpWtLpECCIDmnE15KTWh8ZHmOqezq9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
	b=qWyCQdf7rQzJdMfCHuv6h+jFIhGv1yLXGkKq5cnGIZwqU4tf2RN99baZhoXo3U5S59eI
	 5wEEL/LTKcx3vVeoGAS5T0Wbbg4SLvDHanIFNTQSDp05AHLA0DlrtY0gXwkYNBGHoZpM9
	 Yqx9/wIvaTDJ1hwzf7AXk5MBLfhQmoTn6kbWL6v2L4KIFMvCm3MYv5LBbOHSMXT0kLoZo
	 hWe4s1Y8FZ4G1YYaU6Z6eskOyrhbLkNpIlu0XFA79Zij7NeIVJEw30Namrcyko4ZiFRO5
	 WFOGRj0xSRLx3hJC5mmgP3WuXrXRftWT4D3iN6rw/y6120pckVb8jumMfRpnN7lSL+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhaAaEfB;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A28560A261D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A28560A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhaAaEfB
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso713505a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294422; x=1794899222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=YhaAaEfBMqkZB+0+kqOLkFu3Xbj2X82jBIa1LXxTPlBEdGlO/dFnpCzU3C7tRpFkad
         IQDD1LkCDyDv36DcsX1U07i4SK1lTkiEbBUFV/iZlKXFiHgD85rK0WXV0+J5Wrzxw1PG
         BSN6UJW9CvXpYcXjIuqRuYrLFPewQU3HV398YzFazEXAelqV0Wi1pwgYUc7r198gkhq2
         gkG/R5JAfLCl1RE3e1n1RPZQnyhN2DMJwS6pQLJTxgQfHRY5SM7VvuIPnONRjmff4KBH
         dP8D6NiNgbueKR83PGPZJA4T9yFxlYWlwB2Uhx0ZPeBGqPo6bB8IRdNiC++4NdyWpoge
         4F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294422; x=1794899222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=NFrwcQGuWOrg0BmSlHUYuvJZQs96UWK9ISRSQX/re+NHt/yp/dXJVJx6ETs27fsVeo
         Ko+HODrZFQzYvV17j0Ki55hL7nPos4PxQJpJVF6VcE8qv9uKebqcYXsQC+2EUDXCKtVW
         PspYgyn3cgiHuBvBWx34yETiN2Y0C63yyZuVcnB1z/ZyWuQMyz3umHS9ZqCuZznUIwSc
         wrLQyoS/O3HuzeA4JyUg9NC/tCAWZOULWLgDiAzp4sFkrDcEyxRLR+3DbXu8AqFnk/VY
         TL3e2kY6dYlhnIZ/ys+T6Zcx0B64JbP6t/M1pTXaKeLE8+s5Td1Tax5LVbvc2SXDAvgg
         hGqQ==
X-Forwarded-Encrypted: i=1; AL+hErG/sOl5bLG0yogZZMHQCed1+fofkdtSaYBHpKH/XAdxqxm6q4pAn/3W5gXqrVP95mcru43wnuIF3Ca9erk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wBtcCkRYdKPwIrC/uLeKN8kj5r7760fQtoGIUPkHgOKEjMat/
	TWFbUZqF3Af+OM6fAwNG59Dg9RISjJydN2RQ6+23J/ZbGl+IMKUiRpoWpYNWGooi
X-Gm-Gg: AYBFou0fYWfq41Dj7YcEBwBqnlbFx7Wj8yrvt+yDSm+POVSGubhM3L+gAkLbbGZ9lH1
	JRPa9xQEplPP/17xjLwfv6ikZIHhW7VCegO+eYALWxAoXMdQ5+3LxOAL2ZYXLqNHmeREiFVQzv6
	vilqRj8u3ZqtnN0wPFhX3bVJqef6b4/UarKBkemr2pJoloA4t4jr18XCweviYzJKGBBVqUUAstB
	o5lVtc/WxqI3hm7XP5bfUw9FjPVGqeG5+SHrqg/rb9JhDBHCVNq1Vjuc7dFRypWUw3lfHbPRHVK
	8CfcRzTGGyWQ613plPa20RYih2mRcpNGTTfz9oHaAiPFPIs7aDeHn+wtvza6oV5Y4q6CD9Llg4j
	Q3p2EMQJmpm1euD8hSHaaze+cG9grF8P5oq9t3J7AQmjIUTrDoWQIlGn6/4rMIn4Qn/g3pcHdu9
	u1Sic1gpxFczF9oIu73OlbrsM9fTGC4WV625RDBAHeA8/Juvu35C63LEP4DRBujOwo2YbC5bvB1
	7qkARyHTr8B4Ffs/TtLOZpN5OtgyyWbFm2f+HKnt4rHrjjLQ9+lzMuS1+DK9+Eiykuwi9fJZuyt
	ixeOnL+WTSFnBy8tICmPSPCT68fx4yJ4NSVthZuUq+73+Y9C
X-Received: by 2002:a17:90b:5805:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b166c89a3dmr2067491a91.13.1794294421656;
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167715fd4sm2625930a91.11.2026.11.09.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on Huashan PI
Date: Tue, 10 Nov 2026 15:06:25 +0800
Message-ID: <20261110070627.217946-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
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

As current the DWC2 support role switch on CV18XX SoCs. Enable it
on Huashan PI.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index aedf79f47407..bf3d58c355c3 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -88,6 +88,8 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "host";
 	status = "okay";
 };
-- 
2.56.0

