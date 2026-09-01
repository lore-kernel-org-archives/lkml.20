Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03781489871
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283268; cv=none; b=urKF4r4SnsqmBGq0hjrGTgztb86V1WJPR5llQ2uQgYjZjYrT2VXYXKroGpM6/Rh6eLqDPxzumWcWK+/Rzh1/CSqUPD84YJPgOfADngXI4broNgpymKgie24N1JfU80F7I0G+N0j+uH2QAG/iFayW9+KuwsB3Y5XeWBOURmI48+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283268; c=relaxed/simple;
	bh=OQLNFPvUQ42540MPbj4N+mCmoR6LhlUTwjDObKA096Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk7jdf1sDZ1BI3O6mvuenCDG9mAmzLg/ChJgRTvj2vjYvVMYmvM0W5Ub/jhZt+Kv8OqUCHSmjtIsdbLvfqi+8KSlqqIR1twPDPpQDS/SldcqwzXgjtxxR2VqW45r+sth6OSOcwKVZP0CFF64YQAEYJlkhkEGNb9z8WZgZkVb1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=AQqjXECo; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="AQqjXECo"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c2a449c57so202061cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283266; x=1788888066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F86NIStLY9cGoGB3xcagvq9+EPuFUydagIKpVoDWv1I=;
        b=AQqjXECoDXFW3/SbH/KCJD9TxYC1OO5AmNMq5zXo3mdVQ9mdXpaXhxtIaI1Q58JxCK
         n7KxZ8EfMW8XfMBF3bD0yTJBvO1bWIpbY15T5h2Dqej5JstOTutQa6NMvpDKYNB1DEl0
         YheKK4xFgPirifEckSJtFTaOkKEGvOjLCVvr5FZDG9JZadUeHF+OavvMifOR2sWwGAdJ
         d5UevThE2xpSbIX95PpbgSSfeB2w5soWMxsffj+6oVQM3F87a0M3BrGrRj8dLRQRAwHc
         aptNHszZnD3WOHw0ZYJnyCJFXJJehUQrnUqgCNo67PH5NoCbAGzEywt6Am+S22PrZG6K
         nmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283266; x=1788888066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F86NIStLY9cGoGB3xcagvq9+EPuFUydagIKpVoDWv1I=;
        b=W3qBUUH1ZlBkt+/cw80yyj5mCoaa4PsQFidX6oHkwMnS2f6C9yEePphYqXII/NYc64
         075ChJpAypnVAChqtzQfPZgvPmezAelW5iuUDlC33oMpg0nGYLT5sB67bh3szaDUJRH7
         b5Vul4b8qAGk+aNg2FIS4GRsdJTd7KDB/US8WA42kM44xVK5t+4D+X6uZyf+a7/1k21R
         NV9fLCQAosEC7avUbmsCe5LGypCJfCMjhGSMaCfp66Wke+Ofv0E+CacXKUBVWfyZzqf6
         vRpl6lBfHvSCId4iApCP62ZSimUBJwn6xPxaLVQ6sVMxJqXU84QcaOyniOxx3fqJ7zzU
         ST7w==
X-Forwarded-Encrypted: i=1; AHgh+RrB/rCOq46P6yZPpuWXP+pvq74P70V7NkAB6aPyDK9AUYx1tgRu0GIi222htGhJiude3Yp47kcVRrlaocA=@vger.kernel.org
X-Gm-Message-State: AFuF++lbYd++RLZnUdm5hYqDjx1Zu98ZNc8xLBnryL7NcpbdCz8gcA/T
	ieJ5Df0QMTK/WgP5dMpgNFJnFb25+QLTVJcFUufZ1lryyzNEyn7NTSfnBfW+hlQUHLs=
X-Gm-Gg: AR+sD11eFNb3UkRKWY9znCsRe8hqYKr38oC9YVkxzcSRrPYvKuFllvhFaIS/LDB3xMl
	B87xOJ3cVeGFIBbwsI9aUux//qbCOhBaR8QqlFXplMbvbYhdfogZMy7v7FjTbwt3XucV9RiqlLx
	C3NPGdX1nKFvRBmVrr3Ta7V1M4UDDK7qTjYucosyYrf60H5hXDT3xW4gZweHureKhVfc7JKh70a
	kmVJabEvunMYPfh685RGafAEB+RJnBY0kc18ee0rpEO+n4PNiNBgsFFvmDmcRGhMazRGmJNV+Dr
	QramG3CQoCodmAIB8S0X4x6B3x/6x7w55iL9MOc1mZ6Z3saDaulIUfkCiq1dVlGOw1KBQOGRV0d
	Yk8mIzZPJ4LxTBALThA6cEVFqvCD2qv21rflr+aIvGobyfNDcO+l5SHndBn4gC0erksX8365PVX
	Zj87e1cb1yVfjAjRwmQX0y2VcnYxXwN2yBLVRCdLItx68h/WEk2fL9W7Tyl1QO7tmAzZmF3cKYp
	IY=
X-Received: by 2002:a05:622a:58c4:b0:51c:ba4:d837 with SMTP id d75a77b69052e-53021bc32aemr151866041cf.18.1788283265551;
        Tue, 01 Sep 2026 10:21:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: lemans-evk-ifp-mezzanine: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:55 -0500
Message-ID: <20260901172058.1512508-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The Lemans EVK IFP mezzanine has a TC9564 SoC, which includes a
PCIe switch with one upstream port and two downstream (external)
ports, plus a third downstream port.  The third port has an embedded
PCIe endpoint with two functions, each providing access to a 10 Gbps
capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
treated as PCI bridges, which PCI endpoints are not.  The previous
name "pci" matched such nodes as "default-flags" bus type, defined
in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e9..22c975628ed79 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -271,7 +271,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -279,7 +279,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

