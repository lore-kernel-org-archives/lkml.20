Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9204F55AE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369471; cv=none; b=DB/ufRDBsdl3WS7FgSifDlZloh+WpLF0XvemdH8W29f5g5WuYQ6zDDzuuhvhgOr6i5ISWQYKI5ajZqi66ppUaaY976lNt52q2ijhpEcPgUJCsS3l15QcfTq3bCJQ+K81BmbLYDcV82H/Wcj4VxiP8f9o6DUjK3wZ44UOmHyQYt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369471; c=relaxed/simple;
	bh=6USNyc5xxVCFFsAWD4sZciwnMJCKEn7B4pxnM7sZR0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p/xC1Rv8DziXs404/AXik3b0OIHjvMlMOii4zNoTVaje4up9dxkpxiNQGkWkzDLfyDdvh0GS297NBsT+ObptTgleKGKcqyYRqgBYZqK12z9rT3RnLj0y2UcPz3udjXKhA6r7PlHlMnMtRa+vHsQFmU/schdlWf11KnEo+IrdKxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C75jfPqS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C75jfPqS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so7776675e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369467; x=1790974267; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ahg5ua1PTUMcgmuM5eYk7uL8e9EmcDVrOFvRyDnDKwo=;
        b=C75jfPqSWrMYCP26j6w3PuYEzpqbGnu5TXB/Se9z7QpWcxP+UhTUgVTQBa2vEcdrsQ
         WDVY+3MILY88GfEk0n+ckp3u/1CqaTOKd2+Rbv+3NjPaW7jrzF509sv7btiqWjXNDi4L
         H7Q8qlowz57fo5XBq1BL0aTsxtL4Jb+zzzeL7oIkcf287Pm53OPXH+ZVgh9agcWFLuE1
         I/vQp2YIghcRs7I5BJBCiutwhzvzCNZBZq2IzTcEmNnOdSiPNkEIpBNWOCT36hf2U9cF
         8DtsjkWTX9N58XvulWl/QeL8wYy5JbbDr+QPs56DXrr2PW8mPSQRhmlHWGXXgnB7rvKA
         qDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369467; x=1790974267;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ahg5ua1PTUMcgmuM5eYk7uL8e9EmcDVrOFvRyDnDKwo=;
        b=XZ3rI0TCchQkPugReCJp8JhFfhWtVu/9IDChWxNp4WEa3XT0+JQcJuqE1XiVcvvIlH
         1M9HJoMxWFHdvsoq1R9Pq7NiTkqx6tJmrTKPMdfgpPy0Gf/TpUAgZ4KFtZDfxOvMhK15
         HjTbFvngtiJOROpFV3TZlhG5CC6j3Mu91SCu9TmibM2ysN+P+22yAQgnM/poyzDPPSYe
         k8jTr6XPfMDxiHsJ9QIPqbzZ5/1Zo9244DtAGhcdgZalewWAPTaTpB1a2QQsr2jSD1b1
         PfVDu9Y4D+IHFOkf3BVnDrzUhlpJtGEMr/QIP/ptvEqkkb3N395RTNA0wT9NzHBHPvV9
         1LrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+xEvHc5wsAzIsj59y9gEpF/CINz6tBsYIF/1jZyz7/IIkLjirxqKNboDJU3VFv0yB0C9pU1dYjAd+ENQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lecDzpT+4c9ki/mrT3em2NzQhtgFo3O8h6jbcdlKyiOU5EwTbF
	3OWfn0MpYdatwcmG+ftEzfhnIj7tbfEvSTe0AZmcOB9r7TFNWdPA7Yej
X-Gm-Gg: AYBFou3/ePeFQV7uag4Vp62iR7NAVDDU47tkDml9z8YxUebqjZjuPGP9hAQGrhaDT9e
	ZdjrzgBzpzoGN2he1K02riCKJHdlYelRJC8kw4k5YNIL8xuKgTRANjvQBOQcAA17ewePGDzWeWj
	r+GcYWLPoATh1GAbz83F28NZn83iiWVGhRi0+pjbwcitxQ0QAXSKrF1+mn9+v35Kx5GovQbT6Y7
	jRjcFMfEqiLGS3WZ9SU6o0HhIyE3BoNry9x0d3OXCpAu1AyaYl7HprApGjs3G9lzBjzxQxfO0AR
	c4wqLxJgWQP0FDaetY7ASMotTIut0jBOVtoCPFhje4HrzygEcXOkjOZvCTHcUwu8UkTJB1cqfbR
	PvUcqd25qF8rNmtCpTS5wTGFMezWZAt+3kQV0vJkhAesqjCQq4+rpLoLM4rnoaQn6cvumgTHr7G
	nNQgPFCOC/JrC1Q3D1KNBZ37HCiUFoTXrbhtuDKK+UO8qJGL/9AWWdUTWrc9f3gmSBm9QIs8ov0
	LD0TVWwjpiunOr2YOCggGf/OOUT7Q==
X-Received: by 2002:a05:600c:620e:b0:49f:f233:4439 with SMTP id 5b1f17b1804b1-49ff2334791mr58719225e9.30.1790369467326;
        Fri, 25 Sep 2026 13:51:07 -0700 (PDT)
Received: from [192.168.1.9] ([148.252.146.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm8688433f8f.25.2026.09.25.13.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:51:06 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Fri, 25 Sep 2026 21:51:03 +0100
Subject: [PATCH] arm64: dts: qcom: x1-denali: Enable IRIS video codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXpVEjqKmLR1mAskA4iEXdXL
 F/y8y8QikwCdXZBpIOFlzkB8wzC6OaBFHfJYLSptDWlkhVRcWRRxhZYOYfaewupXyP1fH6vpv0
 tu58obO8A7vsBBqjHuW0AAAA=
X-Change-ID: 20260925-sp11-iris-29316aa10bb9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790369465; l=1694;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=6USNyc5xxVCFFsAWD4sZciwnMJCKEn7B4pxnM7sZR0o=;
 b=Q/Ln4er3K9ruBTo0rjsqXa1WGW0M4BUkd4v8bQpLlRmC2GVbM9MNZt0VU30JrR7Pmbgwfz3Q2
 ZhZoAkqy2CaD1ZslVjAuoSD0nZ5akp7pwc9d/BKbNssN7vTkfWoBDGO
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Enable the video codec and point it at the Denali firmware.

With the firmware in place video0 and video1 appear:

$ v4l2-ctl -d /dev/video0 --info --list-formats-out
      Driver name      : iris_driver
      Card type        : Iris Decoder
      Bus info         : plat:aa00000.video-codec:dec
      [0]: 'H264' (H.264, compressed, dyn-resolution)
      [1]: 'HEVC' (HEVC, compressed, dyn-resolution)
      [2]: 'VP90' (VP9, compressed, dyn-resolution)
      [3]: 'AV01' (AV1 OBU Stream, compressed, dyn-resolution)

$ v4l2-ctl -d /dev/video1 --info --list-formats
      Driver name      : iris_driver
      Card type        : Iris Encoder
      Bus info         : plat:aa00000.video-codec:enc
      [0]: 'H264' (H.264, compressed, enc-cap-frame-interval)
      [1]: 'HEVC' (HEVC, compressed, enc-cap-frame-interval)

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index ce7d958ca687..a75f55879463 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -853,6 +853,12 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/microsoft/Denali/qcvss8380.mbn";
+
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260925-sp11-iris-29316aa10bb9

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

