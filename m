Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E683C98B5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479497; cv=none; b=URpvjlLiPias2oap/XM83u569Rz/BW4ZeiToVvns9OTUy4JwGj36Fr/k4UhmkzDig0xRlrQAmMUMiEe1TTFzR7AogoTqOct3chVCkfWDHz8G0LqXlukJ43uwATGqbuxxQQPGH2hEB0SZ31QJfbFGmnkJWptNq1vxOkyiprHqgng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479497; c=relaxed/simple;
	bh=wath81Q8sOYZgPW+L09LPC3jhwcoeQbhIhgP4/22Sag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZR9RTLOfCAtfa5KLxLxL4unmQnVHlnkj0OP+iczDxg4us+IEda1P2HuxcMrlNUx3A4RSqi6JCW0P4VdbngSNehwtC7ZUhgaKCNzSXYDOnJqMEGPnOhgCKTCnqVAtmSBfY/pw6aB8xvAiOQMd++ySfO3vl1N5r4MR+NG4yERIMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=gPZha0K5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="gPZha0K5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so2283915e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789479494; x=1790084294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5QD66LDLTjuaEtQ+ndFRPFOe58GBU9YDYWhOeJ3k3U=;
        b=gPZha0K5FYnpNFvwf7I+qdgTWsJPsQxSu64q1uwUxwhy0SJqH0qcf85oocUnERAHU3
         IQOkDm+QrmCnox0IweVuCsi15XhJCsGbxbeWRAAyThXH76/1rU4CjOHnaRl+s4Nmcnyt
         parGgjaGZwlWJJgp2VJNPn95WEyWgMlGou5No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479494; x=1790084294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5QD66LDLTjuaEtQ+ndFRPFOe58GBU9YDYWhOeJ3k3U=;
        b=AztbW6b1m3dmjV/r9SYn9RuB/ogzAbWPtB/++4H7+NiNDrzyzcRgZLtXjUp8RLi44p
         aR+Tov7HC3qgRn23HJYOHliTTwiBCyo3uaXwZjd9tdE+5v1p+iQsXak62pfkHOfsEp4a
         MEfxY6GshgljzbKVD5dbiRCl44ZxDsuVghlBZ6Ru+50H5cN85zlFpRNYo0fw2brQLzxa
         5YN+Gg6Uaf498mvK2wFzEtxVo0creoPRCOxaKXDwhGM3DCuk78phJQBCKKXfF479HFFR
         GCiI6JKlPoT2Yv+gyyjY1R//v4JHpvBMdQWXgMWxJHTao0YMQgJaH/D2d3k8BQLsSgF1
         MlOQ==
X-Gm-Message-State: AFuF++mmEViiTwueqMGFpreuCe+oMHKCwgPy5ZsNIe6NIEqcudIWePhC
	q8HXPThHeSNY/olbM4Xtw4X7t1YqiP/GPNscffDQvSLKaP0447wUtTX13RNgUPgduDkj/1L+1PB
	JDdX7
X-Gm-Gg: AYBFou3fJjhv4LDcg3JKsSjEDFYYjNBZJgBAI/6pA/DaZ+Ew6FAwr6NryEtzjatIrqg
	2l6XdQt52+E81EqsMZexg+dmcLjf+EykzEVVu8H7653IA+5tz7bsomfLPoG7/DWSY5GBdSR0r9X
	FOeA9DtxMCv+AkCcw/VRZfMqA8QIbK4kPKPY94qwvLHOQx0HvCwqeGZFS1AAB4NObWXLKrVKTrm
	AvKMsLjq855OCH5PbfIPepyPcx2iJTNr66oczpUndwhlQTO3DetBgUETp8gc0PTNQJQASIm3xRn
	10KBV/VmuHbH2Y2UmFFEEDtf3XKCSixe8HSPXuKER+CwCEW89M6MO6AMdmD2823KbjDgHJ83N8U
	iK9eUTtjmOEpjmEJT2l0qj3qx12lYEO+wQkQVPoMJx8TCFWtsLQ18VfrwX5QrhW9+dOEHJacpaY
	F2k4zMpA0UL2HthItu0gq6Lt2ElGCnsFdXaA6dQUqPTAu6u3eOg556blxkQT0i9QbBnzGzawbes
	5bZHZ1vRRpLQbij
X-Received: by 2002:a05:600c:1d23:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49e8224d49amr21067445e9.11.1789479493764;
        Tue, 15 Sep 2026 06:38:13 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm88186235e9.15.2026.09.15.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:38:13 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Date: Tue, 15 Sep 2026 16:38:03 +0300
Message-ID: <20260915133805.3249587-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915133805.3249587-1-petko.manolov@konsulko.com>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT compatible string for Draeger's M48 CPU Module that is also
based on Altera SoCFPGA.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..8ed1ba733510 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,M48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

