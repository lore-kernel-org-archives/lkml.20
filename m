Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E198470E8A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200459; cv=none; b=qadfF3alimN2bdkTitJrrhSVIL5eQjE5BXp3UoYQR9SakiEIzKBNGGFpcUN1B3BDKO9HT3xFb8GrL4DpTjCicVI8p06dImvlkn4HPbyod0bEsOJR9EWNyzBV0Ujpde/UONIRHPhBv/ljIX95Z7wqWKOzfKV/do4IOCslYhoND4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200459; c=relaxed/simple;
	bh=rb3HKaLLxJzwcBkHRVKkVwDnPxrRHTfCEOty9h/3Dj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Onzzp7/oxTTJRjBheSz20WiyvtXaF5D5fADXTkfCzNJ/vJ0OIPYlCXWoGPsTMpsPww1XGqG/dde9z9B7Wm8Gpylm5Ty0W9sDTYNgBBBtpYu3klJ0vZbP5L2LXGas5NfH/LrGhtZd26aAtpNDsgwJZd60aOaXmz1XfendSsnekdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfFA0NNC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfFA0NNC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8687630fso27908945e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200456; x=1788805256; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQu21g+jvYzg+hR8nIxI4Zsc1brzVFs3c2vxWfEZwO8=;
        b=gfFA0NNClt535kbQ/Xd9ftznrAlSMXcdp2NW824ufMZp78w9HO3iafhEBE1AwH7ao4
         b1oPVNS08Ef85EcgF1xuvAxiLH9O6AK9ZVTfqW4SLX5q6AV1iMduJ9DuvzDWZmLHkBQY
         Npk8GYlRZo6ST1RjAIjUfaF3fKfa/M3Po5scpDi7YxF1hCRXl1x8zm3jxMQvvtsZd3wv
         y19QSX6t4aGmL6RXQNaNcjH1UCgB/0fxvsdH+iaDvnikc7eUM2EIKQVVGQjWdxjUDZho
         zLaggydGcqoSqBPXwgiooqjX2/CapgKPiPT4g+EIfFw2LPqE6XxY1888DtUnks9/blpG
         3fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200456; x=1788805256;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OQu21g+jvYzg+hR8nIxI4Zsc1brzVFs3c2vxWfEZwO8=;
        b=oQDC6vszn3YARvs+ecE5G67JkXYomfhMUdKHzTVjuG/oNrHzhiNSOBFzUQ01YkHv73
         Yn2ugVO6hJhar+BMV7NtyhK1UGGjwTYHMEnVTnA+VvZKfCpnD5W3q9LNcULiON4oKb6D
         k1OSdQrmGAJdmhuICYbSygXfkpN2iuD1VlP0/GTLs3oLIHop90ozktGbqyrVqT/rD/V8
         0WhsKYDeC1yY4CkcSZgdRZGQHuav+6NH/MgYqXMqN8s7Do/Woc1f4bM+0DILhd+tfxQj
         EWZsMNacOv+ufbhEQpwDaFBMPFOSnLULVuNrBVM28aR0vAinx2EjYwxiumQlGTyyMuNf
         jGxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrr2ulhuG6+kTXQn+GPS7MduOKfWRgv7azP5tKFxcqaghGC8W7EhMn/uJu8QKtMU8S5bxw9OgWbzS+Zbuk=@vger.kernel.org
X-Gm-Message-State: AFuF++mfNDCoJM3BbtwWLF+IUGw7pEl5SESkBVVY2+i7DTZxYENnQAJe
	ECu20J8SiHN9klsY+JHM40RWlE75ReBuDkFUANC/RypCDXN3ay8OHK8r
X-Gm-Gg: AR+sD11sviiQL5kFTTHo2TAcd0Q8m6Gen2y8+o+36Acq/o8frDyZQNJOeMCpQL9JO66
	OXY50ulETYhYK/Om1NMS4vtqY2bsPTKzb865m1z/A2ZTEoEiceIcRWQY88OHU3rItyvnodAuSx1
	BbVwVpLRLQMJHeOCBHAbC5ECeUUQVkYmJMXIvTwkDtBiVSaVsqRxBkMHagYBfYO3PFicTjBFgxc
	e9pfTC7WsEWlzko3DqCzKlxuk7pX3+pLks3KIB16TsTlN2mHMM0waOfPQsWaQ3E9XT1CWSbDaY8
	GjTnFTYxOyNjA5576tOqhPKwftuuHnXVzAO/Tn6mDP93ytD7zwimJ4fWxHZ+MzTRvIvbKA+dxrR
	bVTQwOgK6v97pLG6ZFNDpyrY8RCBoUs0REFmb4Q/pzsqO3KAju8JAH9kpNjN0I6iCeNFohz17qW
	n0p/mJNrtbrZhJB0v0YSnksEiULoN16h2XBuGBGWMvRWc0K5RvLWA+aCTv2y5jEO6ERavtOokIG
	Dv1tjt5ChgKFygRvQ==
X-Received: by 2002:a05:600c:1906:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cdc555496mr39483805e9.15.1788200456098;
        Mon, 31 Aug 2026 11:20:56 -0700 (PDT)
Received: from [192.168.1.9] ([148.252.128.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm10721955e9.1.2026.08.31.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:20:55 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 31 Aug 2026 19:20:48 +0100
Subject: [PATCH] arm64: dts: qcom: x1-denali: Add audio playback over
 DisplayPort
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-surface-pro-11-dp-audio-v1-1-fb9c0d3216b7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ7CMAxA0atUnrGUNICAqyAGN3HADE1kE4RU9
 e4NML7h/wWMVdjgMiyg/BaTMnf43QDxQfOdUVI3jG48ulPwaE0zRcaqBb3HVJFakoLhvD+4kB1
 xJOh1Vc7y+Z2vt7+tTU+Or+8O1nUDVFJ6DXsAAAA=
X-Change-ID: 20260831-surface-pro-11-dp-audio-394503f0aeca
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788200454; l=1386;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=rb3HKaLLxJzwcBkHRVKkVwDnPxrRHTfCEOty9h/3Dj4=;
 b=0m34U2jSQLU+yNJSgYdPHWwTU3Re1UwGoq0Ng92diwb5aZgzY1W/jRL26WqpaCM9abGwq3uOF
 AyIlcCFxtPMAqxFNJre90wdlT2F0oj45p7nbB4XmDXN6oU1x7OZth64
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Add the DAI links needed to enable audio playback over the two
USB/DisplayPort outputs.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..bc8e00e59dc9 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -314,6 +314,38 @@ sound {
 				"VA DMIC0", "vdd-micb",
 				"VA DMIC1", "vdd-micb";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wsa-dai-link {
 			link-name = "WSA Playback";
 

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260831-surface-pro-11-dp-audio-394503f0aeca

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

