Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA1545D914
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981668; cv=none; b=GaZhtyDq10PFgVWBg6qwm9xpwOLwhkMhFXv2Jskd7WqCRe2RhKdLCj+n3fAJdZPeTB+m0JyJwJF0Q8pROKcZnlpP8SjoNC887BpAIIqNXgvnXct2aSNAG6+ee3lSG+IG8v+3B+JtnjBAPvxP9o++GO9K7KTx/QaCQNiEz4/Ev9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981668; c=relaxed/simple;
	bh=V+3RbJaYAK3VrAAlEI5DLvOh2bhHgNZa0FG1HxRZpSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JU00i/z7yhRoZ0obfS1pIaJ9X8bkjdiRIjYcsMmRMQOe/Gi4Mvqi4LKswlA+sIEeYJs6SGHiveY+PnlztkOhpAbLdpQlWYQcdWRoNQzkaWhEmVh37dtcR0tVgdwlQuoXzyvqUOArkFBME9pNy40y/CBby/ANJvrWBcPWhiemWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=O7lNwxU8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="O7lNwxU8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so13836695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981664; x=1790586464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AwEoRaf4CpQfSOW+6VZP6ArOHJGwJE2NbP8zHQwxp4=;
        b=O7lNwxU8qXia6dEk1qeE0XNx48rVs6trvbDhReoZqxKUpJ86SA/0A6QgXJcGUkA0QF
         CrEOT5Sikduy39MbqsS3cEdvO6MAUjh019RNyH287RjvoGq/h8a/IFQZzaMlF3lEvoBs
         0YPpscW+UT47gVpLQcEHQTnbXjTUw2I58WA6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981664; x=1790586464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0AwEoRaf4CpQfSOW+6VZP6ArOHJGwJE2NbP8zHQwxp4=;
        b=xnypCnlWComThanqGm8ZNkzEm2vzV/RNrcpllFVd3txabvAU2DEZF8bxQIWH+5a9cP
         2Oj1RPkhsPCZS6YrUbK9jAGEzVBiLY2+2YuU/sjYxh20TknKmRDXB9UympWVvEDVZZfM
         EVfoDEZn6n6yzKIv/nNEGjKZYn9mEFcmFuUe9ko552GvCKLDAZdqND29AHTTtytA+GAe
         83VlTZIJRvq2egUdXmylw8+lpiul2eAgizRdKaB2+Q5jO4YmVsjuLvN52CPRZzj0kd6n
         D6pdHJy8YHGy1a6tWmeMsqjklEJJDSGYE87ihlIOGUF1suGDkIYeF+Z5D9pJyC0xkPsh
         gLug==
X-Gm-Message-State: AFuF++l2AvTLhywUBqy5XQddfHj1v77PmwZLPEj4nIefiv8kOnoIxKBM
	h/GaEvSI2SsYpzScsUHNRPFckES3ArHo/k3+zKE2zCgbKPzQ7tDfJefWEBrCdV2Q8pdafQUVVZu
	u2dSkNWc=
X-Gm-Gg: AYBFou3tieoZxd9dXQnfTRmhDNaSAe9hiwpnoFWGGfaxihlk1Krh3DaAqzksf6VmwbV
	aZfeQRtoooyvIhzQU8gdv8xiBRtN7GY4m6Ewee7wkL/Z11NXz3028OMtmYb7euM1Ct/cfka1T/n
	sZkKZkafxl3QjU+tf3vlqC20w19QCX9lE4djUE8ny4iL9w9v3zS+fImvH6eglmV/XGAyoIaVjEZ
	TVk7SWBNc6r4trueQ/+SaV3lZJnWHoOAkUpstS41ZXIcW/aP/0DgK4yXpgp/X2lkO9mSv8eiNFs
	STAaNCmKIvcl8sU5eeBJgkgeAEGIzdgxDHT1a73vvleOUlKTwT7qH+DU8PUeAyz7IuXs+M0BAY7
	zyEZcR9KqSak/DZgE0LcjPxAD272R5t8ldmpc53YDMZRa3vpwg2c48ZHUKMFfjADXBJU/fwtfXf
	m1e7SE/HTRTier/GAKpPdyTA3Re6Ra9/qPSeOBMvoPRVufo2/24auoAoahF84+DpnQYrN8KzBY2
	gsCKAbYI/BLcebw
X-Received: by 2002:a05:600c:3584:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49fc584fa71mr183381625e9.24.1789981664647;
        Mon, 21 Sep 2026 02:07:44 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm587218725e9.4.2026.09.21.02.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:44 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v7 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Mon, 21 Sep 2026 12:07:32 +0300
Message-ID: <20260921090735.3174292-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921090735.3174292-1-petko.manolov@konsulko.com>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
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

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..e1e4bba248ad 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

