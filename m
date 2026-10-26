Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029272;
	b=Iairz23bQts5XMu6x0EbSPk0M4rsER5VQv9D+y6fwc7fCeuWUbnMLalshsprNZR96mbl
	 J5kWudXszvpboeuILqpVUUxW2kObVBMvHgDRbx0XY9xEX8zUzqtATi7j8OeSyrl1S6TBL
	 GpEky0rMQ6M06TxK8Zt06f10z0riSOLuMeJ7LEGCv/s7gPoKwCYamyrpCnidIhwHXJCGi
	 RqcDnE8GIVazCfQM3KWO3YiQDZrWONqEW+aXfnKxzTbw4IH+ACssBbPaBHsyEWpLygm8w
	 fa4XhxG79bfQM6LutTIOov7I3KVN75+6lgT7vnYkkTSAVJrTvaz8d4Aja/6rtSmPlDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
	b=mUFoZnuXONbloCyqVUR9tWr1qp0x3WaxG0+goXwFe0ZibRV1BIprYdsIxQ0W5uG4LDtV
	 em2l3k5kfXcEtjJ836l6kEimJEr71cxE1DKw4w9nayBQRUG1ghj9B5DGTW318esq9A2kK
	 PB8XZMd82yAezEj234AUESHXKInBDn8BkZ7aQweaozqYcyOauUB80jfwY3jG3b91P/YIb
	 LEg8+cbZaD3/ADaxGwOkwHEBkQ3Gov/Pt/BOJs49Du1iqOrXYzNZ2i8dmWkVAezWjSKim
	 nhQxRKvgLDq057NOl9UdotGX/Kk4nH5N93pjoKLXvGKwBdJBQs0PCYG3xaEBYSSuP9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHSv23ao;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A932606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A932606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHSv23ao
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8253bc5a613so2038113a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029271; x=1793634071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
        b=cHSv23aoKBvmNZzrwMqxEQ8owFyPvY3MMf6al0nBxabp4LETXHemewHKhv7Q6xdcAl
         PP/BiYXMxGMdvPNh9Jm99FqfF1st2GyowVSbDLa2gaQrPEeClPc03oCijVPXssWs3ThN
         t5y8eV8XylNDdIX7Ar/4U3adMFLuWENGGr771idWkJx/FRH1q+DOcnKoCV/pnu+zyTrQ
         ZvnCif6tg1QJH8KlBjDJ1LCSWPqSquzsPzb02HFJbUYBJrCiWsKOnNVL6bgx8rtLrzvR
         utd60SPwNoJnG0zwcSxlX4PJ0H9zHCnCPPlVq5pZZ9yK4tr6dRnnOcnxAjEt3Yszd6X1
         9Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029271; x=1793634071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wa7jpdJ887MlxcgoqqazDZr2I8peh/arTuSgNh6Gg2Y=;
        b=g9GhAPtap8TpgNDDtevlFtymVH0e4VxhlvANyNQA6kb0Tk27IlU59T7J6iVIrobIsl
         ZNsnLuV+lPZU/xapL5GoJwGgtGVHbgvLBWmlWm7/O5o2oHItv7UnK8vc/CGeu/hZn971
         us5h4u5Dsg7sJAD/RufyzCpdIYBjDSXrJPcy1ocYEDjoV7O68VGem71+YVhtesMfPoIr
         fkTA5YhlQhDEW0NsX89H8zScaDuEslM3IYQBKapt5NnivT11b4Zxf0ftaUDk8lretpf8
         cW/QVmUkIE/S3RoYww6CaD73lJAQK5w1xiGTuQhLSJnlTiF9+14vt6JiLwgVX7wAhHhl
         dvug==
X-Forwarded-Encrypted: i=1; AKwUvByP6hhgERYQq2AHlJSESmd6d3pVqYzVsjo4LeF94vZV3jBtYEfHmYgapMt25V+ghl3Kg7vxguHqkaTsh18=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOOg4GtopqDzE/jri59HNAdyTwL8M/wg8XeZJrWYcIWj47VM/w
	/gDFyYY53o+oJ6Re0RFFbUbP5dliuNcZD3ggb8JtET26BNM1p6tjAGdV
X-Gm-Gg: AYBFou1uB00ckwkZggKa9A/jFGL9AkqgsJam0Hidd7pqYyLTUSYVRsmWY2dwbsugU2w
	FzUwPsbS8pLpRdBHE0ySAv8Uw6/fz+n5bYHWNkmZiY2B5VL3T6HRANqQeEyU+wHC6elGeY92/G8
	pQ2Xhkv5mvQ2526yBOmLszHISvsV6ThlSpfS9l1JPCPHqNPKiAEYTCts53VcAoLA6rVT/X/Byyc
	t1JaV9F7wFoS5rPyF8QBJzVMq0dfKfqOOMfy5fbn3Pog9aJtMQ2qGpnCRzl5Ro4PtxsfmyTJ5Tt
	z6Yjx728RTxiWgE+o8+RsBujzrJ4hV61nob5eEIJ4Iys+sNWJE9uOL2916qhVhupx/sWELcpWf3
	NhTmv7VD5K/FZYXUAmCk06Dglpqc80rcEqxIPqVlev13TP8TPveWLOHy6I1w9hsMblf2XopGS+y
	xkNee8i1mxKlrq0aKKoRaeALnBfymVnt3yYyH1TzeGIZrjHFd5u4Db32WOrOzczcvYrahOsVgZR
	JbdhkWhcoc2ReOv7B+BYAilcjCirA3ICCWwsifbkFAqHBmZWGnCYKWVhJwPryKAJn76/dNFyxe4
	eqM0GtvpEw==
X-Received: by 2002:a05:6808:1202:b0:4d6:90d3:e185 with SMTP id 5614622812f47-55c002f9613mr4694800b6e.46.1793029270943;
        Mon, 26 Oct 2026 08:41:10 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:a95b:f8ab:d834:50c9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84315c0c9sm4746441fac.7.2026.10.26.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:41:10 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Mon, 26 Oct 2026 10:40:00 -0500
Message-ID: <20261026154001.9323-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026154001.9323-1-jeff.roach0@gmail.com>
References: <20261026154001.9323-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0

