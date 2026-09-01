Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388136F90A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226623; cv=none; b=ApHC/pjKEXaKwVfj79tiQwTEa2EayQi4yXRo6p/Pve9SoZ5PHmHtZNVEnAjUBFDGxZB2LVjJbkWQDK+p42PlExuGE2Yo53CLYcPg0R2vnFR8xV/a43pD2S85c1mqqeSHIU+hoq8/V4G8dvpoQIabs1HDa7jaIeZPpxzOoIrHTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226623; c=relaxed/simple;
	bh=A3ITwJ3sR+qec2WwQGQ5KPp1IsFncmE7QnQCzTPVg14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dpU9CZ/wRBUcpCzkHFrKaWAwDhzIe3oAS7STHrBhtt7/4m1obIl3lPnpY5MXoFTolptYAWy1ZRsRDvzy3ov7ZyX+86xEFbRgTK0AN8IYYnAbn4KfjH14HpNoxLKc45Fqbl6yWm+mEaQZC6lfZC3qToY9F2pCAlECiXYEs8pxN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=alk1BL3k; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="alk1BL3k"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-930f618435cso364418685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226619; x=1788831419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4YT7BT93vHyyYCSd9nX5alb6pkdBUuB5YMQu5Bqr7w=;
        b=alk1BL3kjlHyFTFO4J2mUUNDV/1XhjZOcXccJSBnUytM/uZppsPZHUAS0Ayi62OKi4
         F3XsJQe8SN3c/DKPtTFkmPbLNlDj4mgteLmMXy58e8ho48FUc36NxohHL7mXyRMrxoxx
         HSZc/pNYytWQ/ZmJvkD+j80izU6VWuWvpgYcffL7TpF+HyshbTdG8zQ0QuQBgRGYd3eV
         4+SE0PlafZ693c44s7h7u2FEHrtSFSEPM98PxBS0R8JySATOAT6xLwlVrbJ/UDPoYUYV
         wUKTtuRufbUupw8Li98SRrwbkL5syh0Y4EKQo8rEuLrkBQRSWUBUZA3Un2xHzU7WdlVF
         hLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226619; x=1788831419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4YT7BT93vHyyYCSd9nX5alb6pkdBUuB5YMQu5Bqr7w=;
        b=lU6fUyYhWscwrjmK9XOI48LKLtrcZ875rU6T0PThRhpzC9+NTh/ser/vl1pZthbnvh
         VIiWgqRS5dcdvg/utSkWZqARr5iDpMEGlWJOjtTX1TZa6QgsA+UK0EmTqKjysswPnqXa
         m13IKUBQl/zokEAio453qqgfJ1k1lWE3iGs7pvXkJ5sdC51DvWGCHPbm+rtU69XLSl61
         BvDy/zqyAPTEj2OfiBJJUTHSLeA/9SCpy53QaXQmj7bnVSSAGkRk4BCyy669FrpZpBr7
         C7/RPr+kRtEd46ivQIH4XhGgnp0RIbz3gUggPJHmM5n3dOH6JxEHPI7KIGZCavlQCYMw
         Tppg==
X-Forwarded-Encrypted: i=1; AHgh+RqZZkzrUEr11wlep9jlGkLC8wSmh4f74ndqUfC9NXorzH8aQ6J7X5qOHq982GNXYv2OfWg8VUfSsmfXOL4=@vger.kernel.org
X-Gm-Message-State: AFuF++m1SJhW+nnJuPy5vzgPQYLa4DA7LFXy9UgMwNQfcO8DUUNZ1lp0
	gxuy0PPdGR3sk7fTzP2Nsr6JhhfA9rmGb7GpUivupNHHtnIj6AexO5LA7o5hz7eevao=
X-Gm-Gg: AR+sD116jxYj1vm3t36y7jMT1tr7/o45TjbufBFBzwTCOc8Fzmle3cgbNvKtu2Cb1Vg
	hh2bsoy8sgyMCb9DkLzaw8gqQGw5bdpB1C5Y+OgPcOfd8kPm/Pkz0Te95Q+rnsoiiH4nKrSwCDJ
	JI6HZJ62RErwfJJx+1W5c19MqG+Vqu0kXtCyfKdBtw65g1AYI7OdJg9pm0ks5cUyM7nAaT21usj
	Kanc/+dZ2fZrsVno/qxKU1beOV5AMyiZKx5ukVgz09bUlk73/BMHAgVMOdDkVcOoS6tWX6bENpi
	KGHEkrNAP4kmpMXYbxW1NtMaL3r2kchVCUqrq7eLnROKFSlKEVKF+Pog4W3mza0LLqmBgL0qHjZ
	INawSIUjaBPhiDt7KdztP+T7pA7qvqr4aSKRzsmFicvzl4OEAjDV+aWkard7qbibdMqePrxVPnG
	fBIB4+33Gevg3lJ+yJHnh5kyjg5BKGfqMuLHcE5StA1QQMWhEtLBjNwk7grY/npyw91Q==
X-Received: by 2002:a05:620a:f04:b0:92e:6a33:7118 with SMTP id af79cd13be357-939138df202mr3269359785a.30.1788226618911;
        Mon, 31 Aug 2026 18:36:58 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:36:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] arm64: dts: qcom: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:47 -0500
Message-ID: <20260901013654.1343537-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on upstream support for the Toshiba TC9564 SoC I
learned that its PCIe endpoint function nodes included the
device_type property, indicating each is a "pci" device.  Herve
Codina pointed out that this is not correct; only a PCI device
"that implements a PCI bus" should define that property.

I looked at other upstream devicetree files and I found four other
places with this same mistake.  (All are for Qualcomm platforms,
and all are for platforms using a TC956x SoC.)

This series removes the device_type property where it is defined
for a PCI endpoint function.

It also removes the #address-cells, #size-cells, and ranges
properties in these cases, with a plan to restore them only when
they are known to be needed (to implement pci-ep-bus sub-nodes).

					-Alex

Between version 1 and version 2:
- Added Reviewed-by from Mani and Konrad
- Added a patch that updates "qcs8550-rb5gen2.dts" as well

Version 1 is available here:
  https://lore.kernel.org/lkml/20260807195846.456079-1-elder@riscstar.com/

Alex Elder (6):
  arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
  arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI
    function nodes
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function
    nodes
  arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function
    nodes
  arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI
    function nodes
  arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes

 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso  |  8 --------
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso  |  8 --------
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso    | 16 ----------------
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts     |  8 --------
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts    |  8 --------
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts     |  8 --------
 6 files changed, 56 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

