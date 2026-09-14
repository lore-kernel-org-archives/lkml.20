Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B6847ACF2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396682; cv=none; b=GpmS7IOMBRPrxmCiK82GOEDvS1nP+n6B4uq2T6mZJfIqSgCx9A0sXLS97qQ9WGu2e9wu2GqqQUZAxRUCKpSC9vpv1ZPtfrYfuXptWzsigc/r1XZFCIKDFpuB4E+gwZW7P2u3tVOiHKjq9sPNBnGYCvXlykXEQoTS7lqyQT13rTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396682; c=relaxed/simple;
	bh=Xii6+5i2RWZ67oguwNdM+TArT/XjMPtr0J/Bo/t/+aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xbw+fMA064YLUQHbse70iSnLiLiZqKTRQ/uEdqGoF27ZPEcOOVZJRboSc2+5LAQ4cimkJTTLTPmlzQZA0vujO2WyVgsTdQX/Vyff1mVThDuoj1Clj7JfbbgYDY70nB5uvevOr4x5Ej34Y0qXI4ZFzX7+1dolVkdRkBssT8CwvzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=C4E34uey; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="C4E34uey"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso364803166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789396677; x=1790001477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmWbIrFCJbcoOz/Ivl18PXQXGPM1nMkA71Dhun2P/WA=;
        b=C4E34ueygueQD2bAjMENdbgz/JdsKfVN6y4eP6zyCaDbg8rw4MmJEGiSvd8BDE+VSd
         a1GbcA1Y68Fp/Rz7fU+1nalqNDbF8OpsJM1DvAzHq88mi7iHeCuaBjQ+0+Q7sx3N/I8X
         qsvpAA8otrvpJmAXdDexEFck/F88J1upu3tCHdHHBqhjYPjPINtWD+1qi8gmf95OyVMH
         oQ4is0YQfEUVA95UK/BbZ3woeq4AkMpxPtRNswcOcMo62hfRXVbGF6OpOg5WyvkI4fls
         D18j2pgAJnM08bP93IUFT5minSI9Gf307NijwytlSCXz+vuRBHlVe5UM6shgRBIw1/yf
         BXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396677; x=1790001477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmWbIrFCJbcoOz/Ivl18PXQXGPM1nMkA71Dhun2P/WA=;
        b=RD6cdTlmHiHHgXmPlIH8UQhmT9cOyRCPiNWARs/TkvIAafm98uCYMB1CzGzXTWP9/r
         vEJCfUfnq6COVaD8a0DfSxA3+YJxsTgLT267IEtiXJf2d3jUOGuwUU0VDFqqiu2hZUc/
         5tzuLs8QQF4gVupiONiju3ABYEpFvB7+DYBvvdI79XcS6cC0uDM3yshkm2kjr8xw7jo4
         DPbFyz/bLRMPqMIhAD9aKB5nZrXIWX14Zpb5ZodDJ9exzLAgAFMRh6G0JUI3QWkgMojE
         UghR4U1FtrmGLs/8ku+aCdCo+GGdWyonQU0kMFNLrWzLiEXVhBDPwTVJR5c8ZtJKHtO+
         v7uw==
X-Forwarded-Encrypted: i=1; AKwUvByghzWvAZbyoHQXz1Ym5eGzmSx3bDnmrLH1N29wQeGhb+sZL19BIeV8W2LRmKTOCYx2RHGUqQByarqEcYs=@vger.kernel.org
X-Gm-Message-State: AFuF++m4xO5ED5PqYhOTt7qZDB4GkEOwcEq+5NdkZ2MmlwZZ+gAbTB4u
	r8azHC3AwTU941X7qIxfbJm2aZfEtiezLfps5HwJJwcKw27bRrclcWzACw53AnIS4mU=
X-Gm-Gg: AYBFou0I527x3vFT4x+70SyuebyW+aYeWLJaOOPYZWOdBhvYi5pQngEf0ARC61QkPk2
	tDCBTyDUCxA76XsOVdLCT+ozcEnjT9ehNzJ1VHkItcal3RzdHiaS7OkrgJjdnroyd0ySU5tk7PL
	BxU1teuZOZJWRsfS0Q7XxaBG3JPdw84+rUUnFpOqPBtmVUPOEzKs7FakGtGKUO+GJJZmXiIMz6h
	zpWYYRd90c65P0GMg2aiaXLfJ3bLwwoAHzpy4laxJOQZlGpuWUjubtOL7UMu337oFvRRC3sv7iv
	bwd4yZMYZoyhO9NZKbgPqSJzTZmBZtVNZc5VUgcwj8Wogfin0PO0qGP7zqHBpWExBY+jNDFiaMy
	iNgoFq7Dex/dkuGsAClhT8hLIKlka4qkXzNnx7P7P+tn0Y2gGCdV/N9pz8UV5IfMdnhijzgSR0I
	IafkFkXUaMQFHUvOloNSq/xz0CJ213PwI4CX0cBNCDQx72R6uFfPLvpH53tD/Uezo3HgN+NqRRQ
	etwv+Z5hgurTtS6+ZJ+XU8dMu6Iv7+hbUyjPFO74nij7gpyyeLaHXEfgg==
X-Received: by 2002:a17:906:6a04:b0:c29:6de8:d143 with SMTP id a640c23a62f3a-c29b865bb71mr184948966b.19.1789396676843;
        Mon, 14 Sep 2026 07:37:56 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660b29a7sm449634266b.43.2026.09.14.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:37:56 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 16:37:47 +0200
Subject: [PATCH 1/3] dt-bindings: input: Add compatibility for Awinic
 AW8695
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-aw8695_haptic_fp4_driver-v1-1-156f7549149a@fairphone.com>
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789396675; l=987;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=Xii6+5i2RWZ67oguwNdM+TArT/XjMPtr0J/Bo/t/+aM=;
 b=2s+aTG38QL/Spn6daVe9Zasok8uq+7dTkNp9krZfUHNNP+/5qMsAvuyY1kBqrIeztV+2URR38
 7g8kDaxU9xzBWIqs5SScJYV3ShRWxo8+oJ889JkjyAMPq12p3MpXVuh
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..d9da85499cda4d62f14f36f1ce77627e37e348d7 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -17,6 +17,7 @@ properties:
           - enum:
               - awinic,aw86938
           - const: awinic,aw86927
+      - const: awinic,aw8695
 
   reg:
     maxItems: 1

-- 
2.43.0

