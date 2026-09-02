Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597C83EA977
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385426; cv=none; b=Y7lqK8ptHiKCjDODvJLwttN01acAv9P5aH4qZ9iUXiaeY4R2dV2E9a2waczyK6oqaF33U2xdCAm/+2ijtRqI6aSIqM04SqzPRmbFSOWcwUoIXbOqRpT83Cnz9DwJmiFMG9e7fLjktMWZTxD1ohfvj1odCRfQPNTdcS4nhFef86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385426; c=relaxed/simple;
	bh=Yp9V0DDM7pBN4oFzQoY+w3CvzCQSulT8S9p6P3JO8Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4wgmcg1wfEvdVA/hmFipL5ys/G57HS5FCgzSN8wttc2/CyUNv92mw/K9sZnQNv6e9NPf2VE62pB94Wtmmj9MsU/xpPPbCx2gEOWEr+edBxUJAqIZZwvBJsuxNN7YbO5Tyou5Bgn5XR7FsYZib3jP8nWqr4Ayh6c7iqhuMguH8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=WuqaxmCs; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="WuqaxmCs"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90e8e70fa02so20399646d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385413; x=1788990213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBSlViqDjCQ5gbe8ZY0C60syox7ylssOjTgWF3IsE/U=;
        b=WuqaxmCsNCE/3WAEUBssLC8LdqNv4vEAAzpXwyIcvpOHLlkJwheNX+pE4jqVAnNMT5
         ogxxvbRA+xnUH1MDEQ2w+28n/zj3V9pC6j0FKa5um1NrhVSnywjJgkH+ejx73b14ccUj
         jE7yPNdKsCoCOhxAXwqZQITVFVUE/i1VW+aGF3XEXf/02nBEB00vizIb4bLJsm5CLbO6
         zfSSddQDpG6cR4YBXNQ4mNt64uUjaTFrDb1nRDlWJOH3SdT3/z3JODlrrpCcl5TXhljY
         4arM80t9V5S6rYPjGCAMRGIFfJqHlW8pb+lnOfhtX07DHV0Fse1O6lsWJnifN3NpNPn/
         D0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385413; x=1788990213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBSlViqDjCQ5gbe8ZY0C60syox7ylssOjTgWF3IsE/U=;
        b=GnNl7x3PtNTzWr5H0Jp3l7+lUKKz+5fBIwCcjDiuIVdXBXFJWLVGcL/kMpRk4caD/c
         EzvkPU3GIf39+m6lygDJ9VUCZjSrDKqYSxkcscK+zB50r8xEaQ5Q/Ynf7jZc9Z2+L88n
         2rFV1fIvzaj7fR++Ee63dFQFKNEXlHStPSabYah/v/Lf2unmxWZYy43PMrTkO9KjBQnU
         5NGgtOn1o4wi0daQOw/7B+gioDxORYkMlGzYTN61fuN7bkzCwILH4Htf35mX92+FasXV
         NERQEchjd3ypU8AhJK/931fwNgQYGyns/Oualv33LXqBbFW2VUb88locZn+7zqkqqgKj
         AmVg==
X-Forwarded-Encrypted: i=1; AKwUvBzvovDxhJjLJKqjkmb3pgDrXOcLZinAYDoKP286AfcvN+ZPdX/0rMPw4EPCv5aRGhLiAOUH1mjs0O/FHuY=@vger.kernel.org
X-Gm-Message-State: AFuF++ne6LdxBCuHCxwywjj59+7vV8BqZoez5nXthQpNO5sKIgJZlqNl
	FEpKlyrJwXrV2uxopSU0Jx85JL4tcDobWPvc3Xld2xKyd55rZc7uz4ZNR2QDeCMPlwg=
X-Gm-Gg: AYBFou0bkgX24wmbIZU7QA1O6yhrNP3g6ePl8jrOeKERnmD2sHTlgaJAHpw4SqntlZ9
	RFnPtm6U02yEFtzvGU8SF9pnAV0AuRY8zj1WXamXn9miRgRNPOOWquDie00JsgjRQOV2HiMl2eD
	9S+E297K/b/05liHCtfcnYgbv0UuSkO+9krT66EJAsWTvQ5cS9wSzUi2exrYs0oHVf8mF2iaZ2P
	KMsGLACuH2DW+wV4OlxMq5zz9ZRyNARaJz9w2SpLYF1Y9nc7M+wXnz7PGoYVPIM7RNu1yulXGLP
	M3pLkeBaeShKk9+/n0VqwaO9uC93So+YvE7aR0uMG3Q8UGzWv/G2yZ++7oj7AhqSGO3LPTJu8Or
	YLtaWwXfhQE4w7XAl9KpbXUcLvqHC4KCFg33AiRmoOmtTNdZzICsbAwDzbi/QvydhhK8xvFxs8e
	OP8FlbHT1TKJrzp1fX7nsfY/11ISe+QQs13x46C0TG35BMQCWiB3GLruAmDI+4ie48
X-Received: by 2002:ad4:5ae3:0:b0:90c:e8ad:7fb9 with SMTP id 6a1803df08f44-90e9f205935mr108583056d6.5.1788385412590;
        Wed, 02 Sep 2026 14:43:32 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:32 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 5/6] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:19 -0500
Message-ID: <20260902214321.1721477-6-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902214321.1721477-1-elder@riscstar.com>
References: <20260902214321.1721477-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Thundercomm AI Mini PC G1 IoT devicetree source file defines a node
representing a TC956x chip which contains a PCIe switch and an embedded
endpoint that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, only PCI bridge nodes should be named "pcie@" (or "pci@").
PCI endpoint nodes are typically named based on the functionality they
implement (e.g., "ethernet@").  In this case, the role of these PCI
functions is not (yet) specified, and furthermore they will be used
with PCI endpoint buses.  Rename these to use "dev@", following the
convention used in of_pci_make_dev_node() for dynamically-created
devicetree nodes.

Finally, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
these properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Fixes: 1cde54c54b83b ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..51b59a75c1e03 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -790,20 +790,12 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
-			pcie@0,1 {
+			dev@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0

