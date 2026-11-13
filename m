Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557802;
	b=jbsFfm0neo+8gtMt1CW0ZBgfMQSTyPUHQbLTJtsgFnKVBUe27WT+DWuYscnf+FntBTXf
	 87OEJAyeAMXjgd1PtZ6hr9uJcHgyazLcKkKQHzrY7ifm9Hljd+zq5YdpGCpyEtA2sTPPU
	 YYzOcUOSCc+7+dvPbM5xJHrSbjP6AJyov83i6dewJZlZyYNfu9EYnjU8xNYVtCAPnERb2
	 UqJx6v5n3SgVNOshRtV1ynzjheaxY5yU4KPxCh+/4SZ8Vz/GccRG7eQUBdXFLhdr0neH2
	 3iwQJTr1PRNIUC4Vde+7VHSoz18gPukvaykSOWZCBkv0Duus9KG5l+7cnbPcNs9Fq6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
	b=W8tOy+7zgFQHzA8P6NDEu45sbdCo/nzYlSlOsNO2sxvwBvzCJYOH6/ooIXuM5XepvHQg
	 LP9+rE3txDjdgX2JC7VS0FwaeE9K34errmrgWIPyEerqoZOD/jOza0dz1ylIW8x59nde5
	 J/2PIKSLaWWkBXRtQ+olFcx4tEhjAn4yLIyyjSQle/NvjKdMJCI67zuUmTGUTvrqPbcZJ
	 XNnuNRU7UIvC1EhT+p8gh7db3Ldr0kVzWMNGpmzSAJj4J2LPrQ8PSKwGb0LfUPioRZQ8C
	 OI+BJZyZNnar2ew6xzSJIDGPFOTee0ub+WZeQA6e6m+8F0vxXM2knGxIpojelvJ/xpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=M+i9Sqh6;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921A606A897
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C921A606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=M+i9Sqh6
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c45551fa84eso156122766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557800; x=1795162600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
        b=M+i9Sqh65cBeC99GKRtTsjvKA9eNz0Ojf3HZlQQLVFkDeHuf2fyP7xQj7nwPBTorfr
         BxtJD1FlwF/J63TjhMSp0XKAlMq78yP9xnYAcjtnPaEou3Uz/4gxonmqi0QIAhlN7rlE
         Z/VoHH1aID9T9UZ04qrXheKbcAfkDMeAecv5xTFBBXgVWfjjY8yCBXYQGJvStlQiFiN1
         rQlL0C5I9R5Eq8iz+D8sb7u0+fINDGe8S/Adw4/w7fLuHcO2P10u/9CAFCPL4F2SSR5l
         vidkkaVmfhAftFhuOKgymjFj3RQvbGRDE9shADZLkTh3i68BX4NFKjwYdKBK5rHZ+REe
         lQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557800; x=1795162600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
        b=d77gFhuwKlDE38nIqObeaa/RxInvRLJJaXyMnuZ4NSY6mkTmMRA3COjMhE5/coZcYo
         AgacGgSwsVNyfjXzSo9wIrAiszuB9fukTEzdoCcEcXqqvjVWycZbTvqnp+0i2h2xvoYJ
         sPUeOHzn1SAc2JAvnnzGqQtXQ6eJVxkTCQrX2Wa5qOD0qLueU0R+Lj44hJ3C7ov4lLAV
         bmxLJRDwR6pmjf2kui0lnAErd1JeFHC7Rv9g5B+w4rXxvjrC14JYyCmtfs2541AqgSV7
         cwLfdlD5Bm/K/ccqRCgJOpsPXZNDUejYYyxOPtzxo0zeWw6u8ZnH1VsvzaACopySaYv5
         vkiA==
X-Forwarded-Encrypted: i=1; AL+hErErtLTa3uJoNaAflIuuzLPgD1qS9bhV+KX/7I9LTuTgLGrVp5V93eXz/+0SclFEKMMJ0JgA8717D8eaEJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nxhDAp1DlK1ouH2JFQG2EW+x/Tpm/VO276O41oC3Gc/qNJQAi
	MDRQASsKe2ZF1drIqIOt7TO1ImYFpTp0Gx+wM7C+tpvNZyFA1fpNQhN4MtDPUGusxhw=
X-Gm-Gg: AYBFou1R+a7KDLL5dvRDJ8TEaKGSTyW7aPhAfcIIzEcatpcq0oj3DbpUtNzV14cLFBT
	HM6R8OgsUYM6Yh1DOqTiXhGXlgHnbRQfSOgwCo2+TaRvAJKza0CLGEuDslzFiwAE80Fp/XLvizq
	MZF0MJZZVeA1+SibVO/2NhL9e6Apc/XXry6DaOkdFS7uRXgjbBG5tzuFx77frUhCOo2vnNbkv+U
	TxAG5GxFdvjRYM4Sx6AVTKkU4ZZVF20OVPWmhqVtu1iopwaP5ElKjYZfwqrkDYXgK6hao29YmIL
	x4vJbsbFo79qBBrVVsLYlOvQ4k7EVfj+D3drRotmms8weXg6+etAnDdJJVai2BwgiNchrSvpJQT
	P7SSLHHK+bnrtYgvmjr1KerYFKVj8xhOsXkq6vLniAH5wCdUeUbDAigb1fBQpFMo4Ygupgdzzk6
	ELMbNUEsC0+smSne+mEhrqHvrGmgRO8GSOgobnz2U6z7aYMHy5WTW/qaqkbVdsDiypui5UTVsGt
	vfWMasV9yE3nGhkZjCE6wVQQxrdkzKdnKFED4Un6rhcurAyOEEOefAIVgzxobwgSG2C8zisADo9
	KRbvHms1VFJlRM1upnF9SFaJLavUvBaLZ8xRlnUsGvvZjdmCYSam2HbACfF/RbRFODEjjBwgbBH
	wDE4ph/k=
X-Received: by 2002:a17:907:3f91:b0:c42:102f:15d7 with SMTP id a640c23a62f3a-c5096398ac9mr127750066b.10.1794557800269;
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:37 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: pm6150l: add LCDB regulators
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-lcdb-enablement-v1-3-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=914;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jSFr6IDnvz36B8/Z3/vtjUsuHYxlF+1hv1m2I+QA4eY=;
 b=gYNntGCDYW2h8z5NxO9fK4rn5jIALH26kXQ6PcSladSms/2hW6O+tYlHjv3FEYFwHg4rVJ11U
 4WJBHNDkSF5BVgI3WYlq5TENmYxC7hoKB97X5jRUuatY9UMUmgi+enl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the LCDB block providing the LCD bias rails. Leave empty
regulator nodes, forcing board files to provide correct voltage.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm6150l.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm6150l.dtsi b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
index 334f976f1154..095b24a8a01b 100644
--- a/arch/arm64/boot/dts/qcom/pm6150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
@@ -135,5 +135,19 @@ pm6150l_wled: leds@d800 {
 
 			status = "disabled";
 		};
+
+		pm6150l_lcdb: regulator@ec00 {
+			compatible = "qcom,pm6150l-lcdb", "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pm6150l_lcdb_ldo: ldo {
+			};
+
+			pm6150l_lcdb_ncp: ncp {
+			};
+		};
 	};
 };

-- 
2.56.1

