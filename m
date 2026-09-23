Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEE753B34D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174956; cv=none; b=szDbUE4oscms7J8LHCOufdiHkmPDHoYTrkEbYUySXJ7Q3QL/L904LoP8a29qvHzl0OaexuBAzle1xYvjPvBWMlk5WUbDMYnlrTWmlisNCd5mx5D3TdFNyw3wYNbw2/0+hajFL86KVei9VpKlCqB257dcfTziRoVtepdgLmd0L6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174956; c=relaxed/simple;
	bh=TzXxpYbafFuLEWOlOPwWeQ6+nw6AQz1JvlONI9AydL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9Cf8Ws3sJk7FIqhkCoLIu/7ZwnDILxgN4lHgrNnjQTIQN/QARB2UMGSK37P9Jp+H6qtpph49l9xmTPFifLYHvNjkR2Qrv0JwDdFvVVydkUtizqZlUZAgzLHHNDlRZL6fKLKPR+Qgjo3dRcXKV7wPCvg4A4M/GPM1WzFv9kbJoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=s4BSppQk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="s4BSppQk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so5543105e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790174952; x=1790779752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUIUCzm7xQrDtXiiFYGfOI6sfBFwp+dm2lFFx+iPEL4=;
        b=s4BSppQkNHmbefMHkqt2n7mfyMijmCHL72y37DHNxK+XhrvumDkAp4Hb0s9ICqXpLl
         inK0JLju8DH96XOyX91YnoGi2JOxzqYbeStRqlb+Izsf4ry1voccWrQe4rmlm6IeR3tp
         uZhf65EKC6PfMERoKyCc2WO16b3HGlLCy4is4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174952; x=1790779752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUIUCzm7xQrDtXiiFYGfOI6sfBFwp+dm2lFFx+iPEL4=;
        b=V5Achj5xs/N5rzLcL0dslJ8xGKRg1S1VU3tI1KHECXqWjAsbWRi11IbLA4ybzJb5vZ
         czAurl9/8cAiqziJwiTaxWGUD7bow0BpBj3akuOvvQn9ulHv7IaUFLBltHs5RbgTMcz3
         Ji8uHNZLjeCK1wHApWfWSYBaK6m95bzwwFtmNXWY8pKgEkv8HvgJ6a9K90XTg9Ha0TKg
         4Tdu+bG3pIXSxJJjzDZl2eC4RG1uOsI4eiP20cPLjx04snbEQTOWtTXOoOrXDmMjLw9f
         Jr+NE/bvQ3ff+gP47cFwpGFcXdcQyk0lJfKNgDnMatZFMZCSnj1nd7HzJLkRUCdObYu2
         S5ww==
X-Gm-Message-State: AFuF++l9wn/BX+6YqNlmyRpOzu3L/PW1STXMIZAZORGRmzex96qvzpHG
	yDBFkbkJsUYIMDzdqFzmVxi6R542FId72cgQnMLg1uNw9F2WqkKBdjsYcfy9GHIpwW7YSUQAGLt
	JqvCg
X-Gm-Gg: AYBFou2IjX4S6/miJqifUveGP+LKaKZ/uzpFtvlVFliM8e5n1cczqMbn+lHir3/QIVf
	wED7uGi5q+HngjZjRdLgfxnPpytWmRxIHByeMg8jhudT5CMDGO51TV1kf8hGzCZysZ08Iq7D7l9
	ilQ3c1fzRrm7kDLRG+Fe4EMwR38fJYD7WvWHB0uIQDwqLPi4XhBQjYNtNxVimyFYasWGNutIVRF
	hXOxjtJiIzcv6MXhdO2b9vDZYMjr35J/RnrSjwU5ta2hVbHPErUhy0ud0e1/WMWaTSIOa/qkhD8
	pZ+mnClViGGVz/LG8sMfrZtFhrXW7c+srPzS9sAz0M/+JhNLKThQtluvcGehxDtIDL2uNvcvII2
	mqS/MNhwYSs2Q73vGBQ09UNykWB9b4HEp9vmpMx5nA+bnygAkU9HxiY4lJa97SkbNNnjzt4gnhl
	K8JuRVOG1Z2PylW0hswdsSfXWJZW/Z9m4VgUD41dw0w0jvcRcl31QDNP8g15oRbSM58Xg+UDVrF
	KhjNSqfxAO6OfI=
X-Received: by 2002:a05:600c:6994:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fdece13dfmr43378995e9.12.1790174952299;
        Wed, 23 Sep 2026 07:49:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm82614915e9.14.2026.09.23.07.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:49:11 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 23 Sep 2026 17:49:03 +0300
Message-ID: <20260923144905.3365851-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923144905.3365851-1-petko.manolov@konsulko.com>
References: <20260923144905.3365851-1-petko.manolov@konsulko.com>
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

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

