Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91D369D55
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245137; cv=none; b=YKu9W1kancKeF1Uuw3s5z8fG9c1CZXPQZeCDKPOJYvPEedaCccqfX1bl9GilyNIWae1lQ6bZBhRyFDpcZ/snOIbZ1pe5dAGPbgVZKGJ+5QGMD76HVKIG1x7HJKhmeIlSIOXaewgR95NtDBkYnNwSeNpf8+qD3iRyHnmtr1Jwfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245137; c=relaxed/simple;
	bh=SL1wdM6vp1VIszL+xuNFr+53xhHZT8pJnJOiXD1KxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaQIucyv5VJht5L3J6EvuJQJ+TIH6C+UUScpME6QNpyFoj2oviUThJbTD1AuqpUHhiVAi3ZBb0iFRCDUVNxLnpKzRou8TLdwqWWQ+QCK5LiNzZYhOF/Y8z5Ma+qFPb6mQi8NUT2mqvY7QvtXKDKkn1ege3ZShxxtRqxNrXUiPoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx9yH77e; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx9yH77e"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d712281f8bso49863635ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245136; x=1788849936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=cx9yH77e1Z8sZhfdSJZ5Cu2hZ0snWIRFiHpx9+SoiHEycLcu6kPbzAVJYVnshh4wgf
         YG+SciIbDSQqmQMwcRryoSiQozzM3NVhl233uTn7NzOQ3I7A/UsxDvA/FxW/9uSqWW34
         3OeWfltYupz3m5VCzrwGQ4QOxJ249C0UEDMBlJdy5iFN4YFl1selqoR+Js0vRRyYvcLm
         5fYO+JcS1LdMbFpKiddQbrmjXC2ApZMMr9H5M48TXcQPq4VknVKCypu2ytNcPljr0TKP
         jf9SmvH1MB4COX4uSRGA81HA3djyBwGSIZH7iEBp+RXrfeT7UaLw0S3kk5l3hRBR1U5C
         aqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245136; x=1788849936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=FKJ9DwOmickUxlkAys9SwwayYhqZ/yq+0pKCBb+5FftzBrnNCavuxzs6pcVBFbgk1C
         nSiwkFa0uBkPVrnZabnKx2f1nvPTW9YzxOLO+cZw+6K6XRlDn6YJEkzSpzoRTGCb5qq5
         vDuyMhLdlHHk+WvH4TaHj/8cHyOeDVL9HelP85N1ptClLmpHTmnmyjXRrB6D9nPq06rs
         RWVEMcjz0ltaXqm6TafNVXUQfy3YR/68Sa0VdtMDTqF8XnKetvuN6UL10CzLwe+TOrRm
         vIP9/7kJYsbCsgWOahHePgaoeXt2Dlp8+TXhcRm991iQrAkMzZJTafne8M7ST8Iqyi44
         7lGw==
X-Forwarded-Encrypted: i=1; AKwUvBzeFS4RaA3TVYe8b6vLITfvdB8adgKweDwI10DDjRegAHiFs6LU/Dkcvz8teIZnlDlhNBz2yNyOzO1Xk0o=@vger.kernel.org
X-Gm-Message-State: AFuF++mV6C/6kHiQ+X3VKSvhmyiygSEMi9V5NsMh/3KHlu17vWOFNaZQ
	qP8aan/kG168E08mmkupdZT2SFYUeaErYNBQWPxMPYw+anxmAc11yx5U
X-Gm-Gg: AYBFou2w35Dc5XeEXI1+cy0410FRpyYsPGp85St31i7zqFuMZzf3Y6Ax5yGf5anaIrq
	WHfkBaU9iA4OG2lbU56ZU0wWlcNZQNC1dvsoNz3470ZkeHVt6xqRLNJjJiUzWaDP2NJpDijcMc9
	msbrA2KMzRm6rkPKH94RLPixlZ3rmWYxec03rFjWOWRIlkrDUfOuPW+gBAJUlxXkh57ENbr3ITP
	bp2xRA8m4/Hd+68XocvAf9TGNh+gaDkfYfiw06Yhre6fXTbLoxRvlRgWp81SiBaN5kWXJE+iL6O
	OdJLigerHowd10SvaQkwatgRUn/xmf1Tp2XB9RDtKlZ9Iv2vMO5HN/mGiZv//v+KHmS+dRIkDnP
	MUML8oNc+ClAtccGvqyiI7MNUgICtyQCgngUmCoqs/8kSY7+SmT4ns/jFgTX7fbaKRnEJ7g+Zhs
	LmA9FsiA8/O/ykufWieywX/ELxn67+R3xGVu4hltbbbamE2X67oGNKs3gOKpvKcHAH8tpe76t6q
	UHEjMZKdfaS
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4cc:be65 with SMTP id d9443c01a7336-2d94a905007mr80536945ad.18.1788245135571;
        Mon, 31 Aug 2026 23:45:35 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:34 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue,  1 Sep 2026 06:43:52 +0000
Message-ID: <20260901064357.20055-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

