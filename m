Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C33C1D73
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076299; cv=none; b=E5BWUvaxPLuOzdPZwrutSrSsQg68/1SBqC6qeNdU8uk3Nhew5QCh8GUGakT0MjtKzGlvvSrIx7lIaxZ200uBWZ+IhPT1+/9/bdwdwthFrzRZ0rDjt13OuBlsIgBnyn6earHN/bth76Z0rPRApZZ2qK9NlleEgQEz7uTJY+211b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076299; c=relaxed/simple;
	bh=NExAlvPnpeNrybroIvK1yu+2PtogQY+t8w4M/9D2m/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcuZuzB8/4cMpzwSd7kYHd+QtOAB0b0uOb5qomIL/XXMOoCt8WSRCOfIdWbZzq01mMfPueHYK4H74Yvp2+Yfxz+/32ReaEhRF3DTJkYZ8vt+Zz7uPBg1G5HYHB6Rmp1r5i+x9sVl/mIu86OSI3nql0eG4DxLLLiObt5O7xBUWv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=oSCqI2t0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="oSCqI2t0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a17baef589so20231545e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792076294; x=1792681094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=oSCqI2t0SYfvuDNEbO9vAjRU04poI1UjsKBxTNgUpRCQsQ7jPB0Dkw0brRQQMgt7cv
         4B0UAfqwNgewPOUgH+NHXC/0FWqiI49bxKKpMtCKrJu3S+VToKNEHi8IWE1VfHp8MIGP
         b/RjBYYoEEMN6cQAKa6fIJ5A4i+nrwp9oBCjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076294; x=1792681094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=rC+An9L4gxeTVGWY0JaswGnN/TYRUwHis9cSxYTjhm8BC3iczcMdYX8VN20ySuuQzZ
         vFYYmmC6P9vvCqz3xStrJ460MAo/Ont2i5otm90qOLVdGuda0I9VMwa0LAC4VmHk9cCL
         4VaI56eIKvADBxWDjMzbcrpMvCqd0/aGGqE87pRiQTjmwwovuSVbl1GZR6SRLCVHsDNe
         S8a4W8MuG7otgk9wrZZX2Hk9shhq8mZ2VI/Po63wjLPbn2SsOrGN2MR73LsZ+hxv2oQw
         QsyEa0dEse+D4ZzFL07IpAH38d2A4se7HksHqlroj68P3gqW/y3NaMmOX9Ixob8V2CGq
         LvrA==
X-Gm-Message-State: AFq9FYI8T2PyxK/zsSTYdnxLK3kXzDW4eWW1ROE5edTvEmTfcxnvkxBw
	jBjDEOCandjW0FLPkDUVpSsn3pw3+Q/icAxQnkAPttEB2jtWRVtBQToMODlAhI1m+gNusdaNpL4
	FSuZw
X-Gm-Gg: AYBFou2QmNGgYQIDOx5uxNkIzk8efGcMtZ0tIcr6wf+8f4QZ7pCFIHKiPB+I4Pm1kfW
	V/eECZxfCb8uX+OHt0ZmUWezVhO0NEvJuLb1hqWDwzC/qMucPdLrFVMgXLbno0Hfk4PuPn9IUqV
	p6SSqZGJOd3XWk2nHCMTr6sxxSRq+QDrWRlNJBUvz47Ii2PxInkYLEckl3ilUQ2iePy8nIebcJm
	udoRz5q27qz+MwBwC1TrnUn5lHkN6LlmnwjB0D9uicknsEp5fvhQQKXSUcb6WWxB0X4dDrEd9cK
	eJ+jvcBfjt6zMWGYzf331WzP9gDZ1bsJTGMlwsp94gvB+xUc3E71nYoTL1zKsBmX9v6tC1hp9we
	ZajA23mAwrdiuBYVoNJDQXaNJls6+6MSvOyFOx01huDlSmFCUAPtqGLU/0WOVmhIVdU9DbXIzdb
	EtLj1/fpeXSF+uboHgNb5732AV4jJQaHFmr1FNaGu/lv4e7hk2LCRCy2o+l6JgngAFdkWrLCDsa
	7o0MwugRjlTnoP2
X-Received: by 2002:a05:600d:82c1:b0:4a1:6a10:4dc8 with SMTP id 5b1f17b1804b1-4a1bd175fa1mr90873675e9.28.1792076294116;
        Thu, 15 Oct 2026 07:58:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm88053985e9.5.2026.10.15.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:13 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Thu, 15 Oct 2026 17:58:02 +0300
Message-ID: <20261015145804.3632839-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015145804.3632839-1-petko.manolov@konsulko.com>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..b67dc10b0a11 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,socfpga-m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

