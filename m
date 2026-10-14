Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B206850AC3A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982963; cv=none; b=hToyY/chNw8uCXdFSW6uqHc1u+lzdO3AsmUvb+qU5h06g/JViGL5C7FmyNnT4/Ja3K+DjXJQ0tFLCsmVVzXIGBQKnm7Nyfd2DM4xwxRI9B0SqMRx7bKyZCuIRitDbv62HNZQ4BfVm+KhEQv/EIz74x5qznM8DKRdygE6IFi3yug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982963; c=relaxed/simple;
	bh=NExAlvPnpeNrybroIvK1yu+2PtogQY+t8w4M/9D2m/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyirjG/9ZVsPyIyP3DSFE9nRtmVG5zDaQKDdZgHhE0bcjatjmnIPwdx/V2Cy6ICPQNCfwmo3DkqBxDaLSELMKYXwo/fJVv35ohvofgxEUlnjeXTdcxqDoHqNl5kTjpKPbqFXhcAq8aG69J5m1oNWRncphryrW2L3Leu/4PDJEIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Vb3VKmwe; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Vb3VKmwe"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1364001a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791982958; x=1792587758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=Vb3VKmweXtFMK6iYuBMzOvVpk4gy5kqZ8MZBf6li8sIEbW/+F295xJWVSDtkzrS4uJ
         aP/hqoX7Et1+ZJYAn+FVKx9VpsmuDkHiaSWs9JkTPFYKNHAYmEViKFotQ+1SFt8eCmvg
         zKQ1OTTfPyG57D8Bi5KJOlEujJxvosvDJb4xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982958; x=1792587758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=OaYFHKvuA1TxzS8KuHxG/Mv2q8UoegSwyeI/bXQP+AwVJi2x9M8PVpT6FMpCWh7y1e
         ej1yXB2DyrbqiJP77e1qRp5UMXTM16F5J7ujG4sbtHFcLHFkfMsUoHWCRvQJTxnHMYO4
         VeJtJtnZu1ugF0jmc14gIv3iASbpHlyWkT8C/G7aOt38SmEQwDzFKmAmDpoU16Pol5d/
         kwoAtW0yqIcX6TcvgPJTa7Hoesb4g4PgVcB74rsfeyTjKNqUKtMhVuMy+k8KRMxa6m1+
         bHOveoJrQD8XIkXKcePCZH+ZzDsbMOOY2UmdNOwjbRkjL9oN9/c6iFssd3JrPG49nIc+
         ZLNw==
X-Gm-Message-State: AFq9FYLBaJ+vge9l33IkR7DLoQfBV5qo9ni+0yQ+JNNYKVHy1VaCJqLA
	m3xWd/zgHyAmWtEukN85bHwQpIk+6XSeujxpT022KN7WggqT78aLeyzQWVHf9sJVcZkmBs3Bxom
	OZjVr
X-Gm-Gg: AYBFou1NdfoCXUpuhZubD/NJNMpvNYKtKKCgVon+2Mp5jYS6oFNOl6A/mWbZe2+J/Ar
	AaE+1/iakn4dtwGm6rGdbf9AhQP6+6l4EfVYAA2kzJENmjd0eRzBc0z7CaTiBzP2+P/lB3a0nh6
	FaID5vlBBx2CLLurdaUxWszEGsF+cVKQ4cTrzi06ohY4mPf4cjUjGOZ7+PSMR5LHa2luIM3qwnL
	RGvswt7riCVEhllUFZzpCe+FwzSoTzLq7nB0s7hWsTB2pswIUrgM1Vz14x2PREDP9B2/h95iGcG
	P0QVrmKXBxyNOYZ6RyEXVDQjYWgpjPSPb613eYa9H6kGAfOqAXYxWhOC1IX8sLahS4nK3khsPpE
	w7LdYDXDjUcel6/qfAS7fRek+EbKWoEJaegwyQ6DHUWJR3DrDlmDzUYjm3M319bs1ZdLs14e4+y
	8iy3mDGrmqnuNZCCkgUy0u2JzW1aCYOsXEWXHRgwz1HK5vgWi/BWIIs/5JvohfJlp8FYdAVpxn9
	4o0WUq4bATu9Dc=
X-Received: by 2002:a05:6402:a0d6:b0:6ac:b861:dab3 with SMTP id 4fb4d7f45d1cf-6b17c296bf6mr11720589a12.39.1791982957834;
        Wed, 14 Oct 2026 06:02:37 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm12608292f8f.30.2026.10.14.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:36 -0700 (PDT)
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
Subject: [PATCH v9 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Wed, 14 Oct 2026 16:02:25 +0300
Message-ID: <20261014130228.2780803-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014130228.2780803-1-petko.manolov@konsulko.com>
References: <20261014130228.2780803-1-petko.manolov@konsulko.com>
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

