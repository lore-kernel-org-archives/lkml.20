Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A83C10B9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226631; cv=none; b=YVlea8i6pR/ZINqgLAsrMF7kz6rDfLc//+Yp/0Y6rDURvm+t4Tm0g6msEyLXLq5XzgyBMaTxDEuysVESxTwFLT5ot9MePdNH5zID3e6IhwuDcDVyderku3iY0dQE8qICHOAVq5p4CBqEMk5jsm8B2a7nErke2ApwcAFdPB4EVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226631; c=relaxed/simple;
	bh=F4uRNuOP+2KFkvrPkqUx+q/oV97b0GVrD9D00eeSPPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u96kaxQ1TIw5XGeOe5W2nEScX7ROofhQi5ZXLTPHxvRLk+z8tYeiCC+EENyS2qg9bNwJ21Pef03dRX2oZHbQKl2CtIFhMqoorCnWR6hhul4wrgeaYxYl37EL7lrTwqqOea6iTSDJEE0ftsHzzGpK1G7xlOOVPs9Va+QKRRBbrzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=U5uqgJTy; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="U5uqgJTy"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9371bcf1f8fso295364385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226626; x=1788831426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYcquwxkbINl1+Lmd2DxlHXKbpatPe7WMleZZ+FNZlg=;
        b=U5uqgJTyYTN20/WhFcR7vVlhCDRWgjSP95Vyqctqy8x5qvBM/cq5qJ1CJxKfxnKCUd
         Wxv7H0YZ9DNnWlqFZusB6eZqasj+7H94+vJeqsJUb3bsZ1cIzRb9NbLBdtKZD94g/3Wo
         MZsOc31m2neosMp/sSheC5VvaOkoyAXuWVcZEoqM9G64RzfQT6EZJzQiEl699putfCNz
         lmWztcOCT/LnxA7gHMTaeCgezr90laq4xxJ09UJEpxA+w5nBr55iNkbXmfz48+2s9TVq
         RNwYbNKgdBaozH7jb8Z5tUjgUHE4cl1jdrcdn5rP0nFJHPcMeem5/Fus4W4F2Leaye/7
         PSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226626; x=1788831426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYcquwxkbINl1+Lmd2DxlHXKbpatPe7WMleZZ+FNZlg=;
        b=nFfGevpxYh0ZQul/9KVhDelaQuNu+o63vTNUB8KB30i5Ghdf8hNUSZxpVFHV+reXLV
         Vf3z736tB2HWRj3Xd0v12PIHTQHVvQrHGsj+uu7rOEF6wpDh76xhbZ+RHB0WiO7X39gV
         wJGGc4TfkV7kla7GvzS/QmEK9pE+SmJhjxpTqlUacG3IyLONh/AEC6D6FAQJEFfOa/OV
         Ux7hubDnaGcCpmCv6kI29saOBBMpew5ZwMYMFV9DEB26qYKsWCKZ8vfBNWDG3Lzz0l7c
         7wtEN/uHcW3PYdKLEAvOtdf9xEziB8dsR5aY4sKlVjorHW1Zv68tP2gfjtakFMMxyRDt
         ZqXQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5/FntwdG5dH/aTb60oXEbbNdcVK5QOd7ENArlj9H7d5+yQnFcpAk8N1H5IQAHm8kaIgqqE3QuQUvJfCY=@vger.kernel.org
X-Gm-Message-State: AFuF++mnjaOw68MhlTiugyKEpBm9Ytkk0NMJYvkMSAShdkIqPwM3pizv
	RbGf2DV8ni0IV+xLrvAyTSGQhQE+LoDfXvjbCj9jKF+l4ygNwo9luDSDLXI31vJNwfU=
X-Gm-Gg: AR+sD12TOZIE2YO/s7kbeiEwkPvHA7AGXjwnDaJLHi42i/ak15NGpbd+Ho7vStIAq07
	QSMpU9aib4t4VwivnZtKdB2KDCQnNd8184jfqbmUEGIPHJawFDXGp4Qp1fOypXWh6/RZC+m2jcv
	U5Id1IjUs92tJnyfrhxaUqqPFfa9ZDma1cMvEtgxzPd5i8R+A+2tm/1ib2KNHtCaqJ+N7d6B/pn
	8vn3Whm0NbweioJucL7GnoDwgcs2PQ/ny8CgeAWIe9kda1dCHxTJh6uldEqDIVzDuPBQBFsp5GH
	0xmDQI7iKKM1gyg59WLwlcZ7DmrDZ9z3ze88Uy/X0gVQrQiAcAs1AC9Ix9n4031N+kQrTL2S1NZ
	TWh1oDNA4wdAflkREJ4rqMkbw3qMIwQSN3cetxKdRSMFduxU1SlGKtYvVsltu3O9O1uTnryMt1+
	m+Wgii8Nyt5dJY9rOVCTfbCirxvv0QBKyx8DdN8le12ZzPE37ybLFEbwuF4V3rohoW
X-Received: by 2002:a05:620a:4686:b0:939:1864:343e with SMTP id af79cd13be357-93918644403mr2684993385a.40.1788226625629;
        Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
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
Subject: [PATCH v2 4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:51 -0500
Message-ID: <20260901013654.1343537-5-elder@riscstar.com>
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

The monaco-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

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
Fixes: 5a67924d2fc57 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
index ca5bf0fe5ec6e..9b5e911b83210 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -119,18 +119,10 @@ pcie@3,0 {
 
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

