Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262550;
	b=22ixJ9+ou4ZrZwM7eeGUvLUxxSzg8i5MZAlGxXRE/Ethv5AtuZiM4v1KnfAsmI+AHU4g
	 vd+Drn5HqHpfr9D2kHTAtKkahME2zVGpokCcsV87OVlIaqN3mEFucHJg7nBg8rUdJpDPa
	 6OpPPfeJ6tscithQko4d9NQAwdItPaVFQG1/a2EOLH+BK4RZubTyHkFGAPmRVDGu0dF/9
	 zoU08KYG3EWDQdgl+8yZnY+F8VwE2QMXngOs1rv3dWmOj1DNO1FrgrRVGc+nKr9u2/BNM
	 TMeeWB5rGb6K+jIvhOte9HOtJ2TIHSd1IaCo/UQpsif4f418+67C8q4xU2HxcwAlX0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262550;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Gvt5jiBDiNulHHrYg+BrD7+VVcW2lBBx5OIqzR4giU=;
	b=vyRNJ9zSLBCVLsOiwMMYCayW9+szhrUvyY+FFKGxTFl5V30Jgd40LK6fGFgNyMAB5Usl
	 bJgn6OjwUhFuXPkW+bJQ7zz22DwhrKZ3DOX1Vg7I1WnVs3PpqBqGGQKbhuwwFtsA+2d/T
	 +cj7KssNEJ96fHMeLZZKyfcIavx/WusYgMflafaICWfDk0micIkPXUuxJBJ8JlbL9+b8c
	 y9k9zjDtuvfj5PKRyGW9dGu01pRYHtbIS5SnDEKTb77IEUw7XVw6s/jIXboBWkNoKssFE
	 SW4c0sKii2isH+H3osadYFxFOxZjHFcZhfb6F6DasY60G7+JpHoag7JQOJK0wxHS/Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b="Ns/a5WEC";
	arc=none smtp.remote-ip=95.215.58.28
Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC728606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC728606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Ns/a5WEC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DoO8s5WtZwpzyo9LpQKIECh6IieoqjmPFfrymZi3V9E=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262548; v=1; x=1794867348;
 b=Ns/a5WECT4Kr88Y80ZJcq0mFcHzmcOKiouEhxqo5Yh+qA+ShVGdQKmHgdTV9rOq4S0TjyYIW
 rX3ol7VoC5zVs1vLha+7+MiNk0niHoybjSSXI2/omGeZHxGfj9sl0kRhNr+YwEx4EZrf0BNpG7K
 y6a24ty6MZpSgkzFmd6X0Cy006AkXBkVHiyIgOBp9GFEiviPOt1B9AxC41Q2iLy2Ku9LC1YzUQl
 22TUVGI7/7pw3z4cxLrCjDBm9dFqiWaA0BQeYkJgGh9MEojRkdMDYATFaTne6cl0Bu5zhTYclAX
 fc9FdkluRofERZoKF7I44qJ5dvSJpOncRDJsWfq6KdpRQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 392b2637e9b1699c;
	Mon, 09 Nov 2026 22:15:47 +0000
X-Mizu-Trace-ID: 392b2637e9b1699c
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: qcom: pmi632: Add LCDB regulator node
Date: Mon,  9 Nov 2026 19:14:32 -0300
Message-ID: <20261109221453.658316-4-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Describe the LCD bias regulators provided by the PMI632. The ldo/ncp
nodes are left blank to let the device trees fill in the voltages.

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index b0ed35094a98..ab850050eb22 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -204,5 +204,19 @@ pmi632_vib: vibrator@5700 {
 			reg = <0x5700>;
 			status = "disabled";
 		};
+
+		pmi632_lcdb: regulator@ec00 {
+			compatible = "qcom,pmi632-lcdb", "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x3 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pmi632_lcdb_ldo: ldo {
+			};
+
+			pmi632_lcdb_ncp: ncp {
+			};
+		};
 	};
 };
-- 
2.56.0

