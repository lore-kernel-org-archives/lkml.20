Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102454;
	b=sR9mbu7twUYhp9ze+/JaYAIGrSKHsTWUrSo89b/InFix5SvtO1ylRAAhg362m+e9ySVy
	 QELrKtdrhOCNuswDQ9peOhSn5ocd0owtDVfGXqnNHgHBtxHtI3FWsPlYWJCjDNBiLn8hN
	 TJim7eh6HLXhLH3f5XGUdDRxp1Vaw7SNzHyoTp98Pp8LuPjygJP7IjtM/d9qQnazIio4H
	 2I9sGa0eeHdTKBRaoInHCES2oGfy4wpN2uun3vor/ZpzTN2O4W+GioD8/1d95e3WEMnMb
	 jUjhIOUzHKijGKigcIe0TRCPw9MkH9bqhIe/O3DW58W44MPTPZO1dpm2pc9eHzpPBSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
	b=qXow0kto4sJrLcm9LA27gmJ+1KhVgBeo/cSm66kVHhln3ubAq531aSsoHvW2PRLpElzb
	 1MV4fIWogGecm/e9Vb972jVchmPnJfH5WYH8MOO7cBdrXrKucgo4nYz7kI0ti9rPjL9zx
	 W3g0ThzJao0UVBdZqyFmh5glF5Fx85muXFB9VGsdpvnleIQKaREUOb19beUNAzPLM+sUh
	 sKsv61gt1+ToL8Hp/w/Mh2PzQcAJNTiqKORUmMJWMtFnrhM1QC9Z0CmuDBIBXYVBHHlK0
	 215oklcF2GB7oI8k+sZz2LJYnI68wbIL+z/iuubu2WcWSqo0X6x6wR3Itd5HHUyc5Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXsK3c89;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BB360A260A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BB360A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXsK3c89
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so4741085a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102453; x=1793707253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=gXsK3c89vpWz088eJ7ug3RXM6pCdHmPR51kIClm8GCuTOQnA0rnAqT0PKP3KJSiVEO
         UpnTeF0Vo9pMjQ0eTH0W6EnXIIWmKw32WkkjqFyx8HA3h9jgzpRst9qtgcY23VzK6bfW
         zOc8AymEchMnog9IaOt/l0ZRXFFBjoGgwoGVLAh5QXQf4Y+262AgDfjq/Fv5J2r3phsF
         7+7gOeFqRj6oSEvDwKYHKx9NzzMGMt8U2hr94fJWLGyI6S3rgKDsN+e1utgPGHSD5VKe
         rwk2B+pDqiM+EEsY2sGXt6hT3lH314BbS4tVdUZlnf8DGZlVu99bmtoVA/Opc/vg2Rih
         ZDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102453; x=1793707253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=gxcQCLtFgOnTEgjmmjksAYpdsF+Qb567vHkZ/lYLx62n1G+itJPfz7+KBDdKsPSgj/
         PYeWw4KiM/hjYSuHc6XJKj31mYVD7aX6GTuzepjEMudjMp1v4P5oiXJwuyqWTnIr70Zw
         VRxPPFzD9GGq27hOTCbh9+Nw1Po5pT8T2vcIwcQmnmfGFcl3pxlaz8wqRwYUcIQ0FkD9
         lfj3dv7lDwLJChE9oz3DF1WAHoH3gmgFNp0ADQKGQJlYG7sdQV97YAc+OHN6Q4WcozSU
         Cv6dzugx+dXxqvX8pCf0c8S6C514UfGjCXBPf8J/snbBh3xYf0wJg7KzcE8F3SjGl+GE
         cbgg==
X-Forwarded-Encrypted: i=1; AKwUvBwv/KMUETRv1Cu22uWQigXJWLM3KVdYIabOO/cbhpjK+bNYDXuL1RzUKtMNlw6LI9ZBBQt4Up1tpGpruWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG/hpmSgYDtPmEH7a/az5syf9c6qbyO33njYvElA84Rhc7B50B
	Yyx9TMhFyxY5glLSBYaoZbilRU2pPY6EnBs60enTrIE0TcYpgSOr9cQ8
X-Gm-Gg: AYBFou0Fyo0wdaJrBwXleNsm/y8lcWzJ3QLplDfAdBYQDtdEM+AlnINdMkLcTH74pzJ
	Z3baTSelWPImgjQgJXEUOyWQf5hKCCIfm1T+gqcxWXLr1up+prBlUnYqK9dd7h3ce4TYsPf32Wf
	XBJrRICKPVAlkbaXVf8nVn9HJHMTQsv6lCU/c52XOFDHyV9O1FKIGWPs2MKurQxY7fgR8TYeXgU
	gUdu5hfwyOI+Ggsp85qhCFDZunSGSCRVH2l3AfXxbDA0AhgTDrwzz9kVzt2ILWMJy8l8DZGhqyV
	LLt7H2UWn+n/DFTlheoFLjB+1FGruth99TMmzDP3opdI+a7+OwqJH/wfkzjBBP0wa+gRRV41G8I
	G3M22b1uuJLnTLlDeozvO+qrgaBL9Vgq+ser0hBaG82zW9PPVKsrQTnmJOrEXws99CuyCoOWuk6
	FcwXaSjCLuVU5dflXJnA0NAT38gGMLpUsm9rTyp31pptOirw7X6I62DNgkL1vVCJvfdXLAom/dM
	1DUQaNcPzC7tXKkg2jgqB6AxPimvsf38yIA79/6F8qs6Nw3HRybjSP5+xJcIoVfAHpO6JYcb27g
X-Received: by 2002:a05:6402:e03:b0:6aa:9284:9a99 with SMTP id 4fb4d7f45d1cf-6b442a806a7mr10453861a12.6.1793102452579;
        Tue, 27 Oct 2026 05:00:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/7] ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:14 +0200
Message-ID: <20261027120019.93611-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Realtek ALC5632 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
index fb05988ff7ea0..939b1fbf2afe6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -28,6 +28,9 @@ description: |
 maintainers:
   - Leon Romanovsky <leon@leon.nu>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,alc5632
@@ -40,13 +43,16 @@ properties:
 
   gpio-controller: true
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

