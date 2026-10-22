Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677780;
	b=mxAdDv9p/Un2mf5vJul6J2YCfOGmmEMHnZIsAPoc0svm6c9BZG9DsxBnD0q8dJfZXpzM
	 NnZPR4q+O/awKrxoOyI/4NAUXyM27aI/BQJFBh2pq+hR5OFanCpqHRY+WyP4un2N5h+8K
	 MgEWL92fJX2gUurLyUvYQkVILrzjcIoOiFJd2zGstc6PH45jLclOTUy0vUneT8tql5TE+
	 /I/mdlLEfGtKcWBMrSkOgXLglOB+qMjBlV65MQSPnyJ+UMC6l6xIad/sAl/eijRMVlzgc
	 jU79Ct03UhE312F5Z45Wg6uKHc7ayvE2PISJ7lLMhUVTXJXjBh/p9fQPjxs89UuzOIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=peZ+m7/focdlEwmBf1Id9zAuR3Q0V7O0WJjuboiyU5Ifn29HHA2DVSBNCbexx6jqvWUZ
	 ktd6eFdNdws///Ec0agsy7/RRbALgMeV0BZFPUGmuUU65DBYFrXHYTWyqv4Zg+armzIl8
	 M7OBnEIdx4ttb89t/Jae3txen+RtHvM8aXWnlLDbJ8NJUYTjsKCQ4ZaDf2lNYAaQ6cGAa
	 0EXmARKht1zUZRF5rjmr0GL+Q8YWWSUS9ZljDIBxaVQaAqixVtgmbxmqUGtIz/8IxT+A8
	 TvON/1soDOOACc3200O4w2TMG+St9pp5289ezqHlMxhPcHVaCBJNww/rvZGTlNXp1Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=EP8e9QAa;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD2D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=EP8e9QAa
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so14788065e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677778; x=1793282578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=EP8e9QAaUjY6cM9M5nPxnvTYHrWXxXsqbhq5tDF/QGu1ZhClXfcgqI5wS86Rm0gaPW
         rRgOC21yhxH5hxWfDVBw13SYJuwve6YRW1gP1yjDfw7YBP8WbPAlu0dqHSzaGNa/lq61
         ebpg6PvCLvdS+MHzudYMNyoDYASUCFV7maL6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677778; x=1793282578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=VvgVNaaSs1ntJ9qWGYC/ewbi7YW5loprWwo4lH56/+4ivCwP5K/nZZPOJZrQ5DPSej
         YGoYSBsNFXmXHmoJ8Mt6k+IvsJ6aH6oPx32f8QLBvchSuAoxPekRKiR874rQfOQoVTMp
         7yan8IK3nF7ux66Onue6A7oIeXed4vYtZGcqFJfPAJ7wnXKzUJQGpPgu5lDwBSvMwHs1
         nK1u4DEvH1JW4B/5C8AhoDrOnT/vz6TZwsXq5bk7mUArJNZhHukDKS5rTbbKJJmZzf+o
         rwLYAhTKdcdf4aDYnC18AebxVTPPSfsG8HiK2ftBOcbk6J/ln5Ab0AHXNDEiZOg/o5Gv
         EmGg==
X-Gm-Message-State: AFq9FYITI8/LcaAHBxYRSIE1TXRl7MJ+gwAKH9Wkj9Ou1QYnxq/49pFa
	ZZ7sv3sO20MwojtqwzmWL6E94HqkaTMlC6qUszS2LUZCjmIVLptRUzHSzG878TCDihR6/L9bJju
	pqnI3
X-Gm-Gg: AYBFou1utaMj/Ht3Wki5+M9nWEh9WTttGcGuoRLUF1IeW71JZfL4WyEX6gMDtYaNK27
	XsSyqUHA2TRSzNZGJvsZFfgf93TB81zAh0qXVBGTAzhQqR38dqiKLAP11g+dV8aRNqm+0jKxB7F
	QQRy5tLXmbtHkU502KyaTm3/D9uyHl35FfXsqO30qcNahoOt8+CPP1G91FOEwBwD4Eq6WS5o0WT
	041n1dIlUXBocS8b8tI2npPGdocXrGdbZTLZHxfYel+4AiweDKNqtB6gZwtf2aNTskJKSPOz2cC
	m12b9MFIN7WylR0vPuG8/CCkuDS62xdfrcpflNdyTGqbJYa6IappwMoyS5D/hkS5DX7iWINWSom
	IRbGdQBI0R/xRCvsh03NGGhtYS6eJZLnoKmLwQwFu67dg7JYQUuMNJlfqlQsPhy2l6hKSd13+ch
	7Qnf1ro+KIFXXd+jhVXtKhKSoLur9fHMxsctFD3ych6tLQvWIvCdcyt/lChByMYmmK0GU7YhYY4
	z2ibCzCpe9R0nyP94KNdGBipoBbri8c3kcXruM/FHC1m2lz/shiWDnuFUU1LVMXge/gYEoN
X-Received: by 2002:a05:600c:8b43:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a200a9ef31mr92100115e9.8.1792677778171;
        Thu, 22 Oct 2026 07:02:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:57 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Thu, 22 Oct 2026 17:02:42 +0300
Message-ID: <20261022140244.3476844-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140244.3476844-1-petko.manolov@konsulko.com>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

