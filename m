Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410DC3B3BED
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226626; cv=none; b=BwN5DIMv5lGghA6wtv5y5NuwflRLK+7e7ZWuiCaXsTbLck0VE8caMtfyuVDOFUdij+Xl7vuQIWgAispB7drw2r3V5J5qpqrY5/fe0mdCu16PFYMCXWhMxDROVPTI0S1XyH2EYPfVXj3I3YCtjH3H1lh5GsvvcJZ96MXDeoClxm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226626; c=relaxed/simple;
	bh=ooCrCfo7oLVOrvAobTBfT5HplE+C8HQJo3SAieGJjk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwGckvgeZ69nWcso7zQao1NwmzympbFWEEP1dQwYPi1Mw9xnlCI7ACjhvqYtkl/RABRBkSnYD0FCUbTZFUTGIDAZ7zli1IuRpa0WjrLe9V8GJhy63cSfpoE9PNTpOKfX7P4o5waYxjlK9u0KxMDbLMdVme7wR2S322TbRWKHEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=hIIsHE+G; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="hIIsHE+G"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93905b1dc65so291657185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226622; x=1788831422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNTyYnbC0W+gwozSIufWIpELF6tjMCW60rG99iaQh1g=;
        b=hIIsHE+GlQdcBwdsmmTUkAsdM4xtoLNkarcHdbLGj5FXaQ1aXrFIDDc88rU96dknNN
         l01mB+okJ5Wsortsi3CkgairRmFpoAvniWwqORhRem+5m3dkZXgpUQhjJSk2nRGNtaX7
         p6YkKqP024up0YvksMdGgViCFVcsH/XQhk2/oPNHiizLX3SbnRY0Fe6qt9K3AdrZg0ak
         oGPPAB7wC8ZJ5RgyVgqSR7Z7OgSTjggh72y/waSc+lkum/a/mrOyjPVpfcCfXuDTSoUj
         oKAyx6JEJuPiwALgh3h38W3hkyjl2CVRvtCqNLY6N0k0TjV5MFyE3iqUy8OsXbXIysmJ
         PG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226622; x=1788831422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNTyYnbC0W+gwozSIufWIpELF6tjMCW60rG99iaQh1g=;
        b=UkFya4uEw1qLCdfp8dQ3dWFNBpbaF+NB66zOG4fzMdS4iR7WOa45kBO2epeY54/KHo
         VhTwwCMrJv3mgExLJipaXxz1GCtZR1qYnA3DXwgxwwdr4nSL2ZgarSSepTkRjcr20j0u
         4Y40vd3IF7Tg0E54Z+XzTUBT+Zo194Gm8ClVSoVnV+XxfxKTitZiQOfVlJa57TIwa6Ri
         AqOhViBQ+aqmXZDQujxTfFlL9qesfDVHh4efcQkVNO7INeIj+QMUhBdB0YIOMFrhmUJp
         4NKqfI8pDeuhoQ3vmh/KhxXtFWRU3kYebhz9RlW+JTE/4T1Jd+HhM8acoAGttv+94tAE
         cmMA==
X-Forwarded-Encrypted: i=1; AHgh+RoBwth9H7dzHDA44oqQva3DUmdMN31fn1Hqdq29K+3rjddYBo/5SAX6wRqXcrlc6VViFaynRWoFz5rvlyg=@vger.kernel.org
X-Gm-Message-State: AFuF++kFiyeC23Aq2QnMmJA6A2aBwUZRoom38w+rT38QXeYHvzfsNzS1
	e34FjFuA+VckBoCLQQB6ioLLP+zIM6WuvJpqJ8r1bFfUEPq5TNOr/UH/qvMTgjyjs+I=
X-Gm-Gg: AR+sD13/mL70TYt44GJ0P7cgjXw6fPpBcsB+NHMAqakWmg0DteJNzfOYcbby8P63608
	UCp6MWup+Socm3TW+FhUxktQl0Tjrw83TGyqtbnEUN0NT5raUCM62ieHsQXeKxMlIPRvjTo4zEh
	0vnsdjqsLnsMXyo8uqC4IOBO1MsY+St8orxhI9iZlEcWie9F4DlEycdrOArqVxMBaJIoMhQIkmk
	AbNK5UoHR69GtdRfrRdfVZEEh8jUqMinz/kOtdWM2Bkrfb2F4j8lsVYUr8+ypwMkFam1M4r4nNd
	vAULyAT07p/BG6bjwdYj0EshFSwqx1jjraOFK5FRYWfpsv8b3gQsTGAUtYWFCbHinm91vxdelQm
	z6e3qVEBcu/1ZzlESfccWDjbnqexbZLhz8R23Gwv68ufD7RUS55bf4xl0oLB8B21AL1NTo8M3Iu
	cMSS0VW4JAd57ArX6t5OgauJfO4W76xP5BpCL+LiT3I7+p7OKR0vQlFLSIB4iCo6p8
X-Received: by 2002:a05:620a:440e:b0:939:34c6:a333 with SMTP id af79cd13be357-93948135358mr651883985a.40.1788226622264;
        Mon, 31 Aug 2026 18:37:02 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:01 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/6] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:49 -0500
Message-ID: <20260901013654.1343537-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901013654.1343537-1-elder@riscstar.com>
References: <20260901013654.1343537-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcs6490-rb3gen2-industrial-mezzanine overlay defines two nodes
representing TC956x chips, each of which contains a PCIe switch and
an embedded endpoint that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 4559b435f741b ("arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4d..82c4d47fc2aaa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -132,18 +132,10 @@ pcie@3,0 {
 
 			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 
@@ -227,18 +219,10 @@ pcie@3,0 {
 
 			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pcie@0,1 {
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

