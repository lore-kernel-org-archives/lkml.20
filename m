Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DDA4D37A9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952603; cv=none; b=M98h8O35kQhBAAjBraZw+4XZz4nwSxEnp6UHN3jhDsMC7QJcuVXl0Ar/Rn6Qht3DMtyX2ZXjy86jm8aehVZUHY1Lx8g/2DLveke1bnBhrP5X2/PmF6qyfCGIbGYcpVNdMj754Lo/U5GanKGHCjN16grNsR6mpP3SBPnifPuLcUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952603; c=relaxed/simple;
	bh=UFIj2wMvo5XUOBicWCPYVsxIWkd4wo9mTw61yb2XBXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/3QgJglpbZkhyEVoIufZunVCJ4l3gJ4JQPuJxNjI5K9zxuSbeaMPihR6+7y/xRLvR20HCMOcPjSs+QdnSe/hVpqIbibpEgb77jouokpBu5IxMiVRMVBF2adyYfjbOopt9Kn4tmMrTMrMTiw55H5Ut4Ic7+0zNn4mGFBykQiMbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qbHtZRkU; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qbHtZRkU"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so309030466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790952594; x=1791557394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9dINPrQCPR0iqwn2K3Vkhxxuj3wUNi7Zp3ZQDcumLQ=;
        b=qbHtZRkUia2Yp76jDnwnDeyn48Nd18nKAcq7gWhecHeGIfVwVcgYsoX/pDKx9t8Acx
         95Zc3YfAv2H6tJic/a4SFKeWgV2ZLHNEsrO/JojdSty0XA/oG8jo0pGuPdrKuh+E0whs
         YHM3qy/fQdDOWQ9htpvfCHb1vCkLlbpfH9CQV8vOH0v9AXlQYQ2L1jfvWBvOuV4KkPw/
         BBQj133BJ/qvPjRomVGQ+HS0F+3mL7DqVwh/Yb9n7hZ2KxASzRM3BlfvYQ4SV7QvgP7k
         WuChdFOTSdVJCAmqHVq3IunMNOSHDE2AjMiCtDC1C53YXTWsPvfScKNgX0TvGs5HY8mu
         vUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952594; x=1791557394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9dINPrQCPR0iqwn2K3Vkhxxuj3wUNi7Zp3ZQDcumLQ=;
        b=2FmBBM4ne8OOmILFMhvKAnamPXJjR5qskJ/1R01qaDKbiahTNMA5foNN+HFJjtDq0I
         u9/CB4dMDTMZwj1IcAJu8/e0VqAOvZyksOSZ5JiWe+N4aLSpPB1BRQcxsW7s0oS1suwg
         HkvkrV6zzZjN3pQWyyRl/zZpyOUPhKflsOmn9fQtLzOKrjp8hOXEZv02D0u9Jj/QDPxR
         jOM0NuUlywFy8eIOAObsq64io4FJ9rFKeUznMNzg/FSYhqSXKqVyODUSlFBmuyYGWHHi
         cUhj9xCRdrVffXv32aEZB/rtd3Hq6viqHbewTlY3okRQaKGtUK0JJbQZYrxvg8l+ML1H
         DlmA==
X-Forwarded-Encrypted: i=1; AKwUvByd0srq/vkVfiJK6l7mmd3KQ6WuV9Lr6kq7LxUqEe8PXRpZZWKy/uIr7ZEGEqVsN32mLRIsbVv2ZvF/V34=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtxBwZf/5KZ2Z4GEjo+uUwvicjHINMTXwtZTODwVEBqzst0rZD
	+9G9m2jaWvG+32mlKextqF8377Onm1F/kWKfeXbKGouQtGoD8+90tdXwABOrSec7GzY=
X-Gm-Gg: AYBFou1YG/QkYKmmQnJUIgKW8SJ626to0dSbw/Oh9776Epxw71yolDJsgM5Glpy3adg
	oH8rj0wINBU0v5+0CGiki8Rc1GCnb2B1p2KQVj3DgviZ1dZHZClmhVll1f31XlAzlyv2k12Gh3K
	+ZXT+XEQsBPDNhKUvU0iQpDquyTo8uR7EQ171XHEj25mrL4+h84VDJ/prvxnUKdVu3RSZnrDZHB
	tuo7BcAwr+373suY/tDZTYUqF9FaRAAywQ4U95/h9zNNdM274IRIFuNLqsdgJnE7DSjSRSgibOB
	8Lf3v9uLeq4ywoPo7VnWYGvibp3daJl00EaVsYRWYzH518h0ZPYtbdDLYKkBaPlavtlTI3D8KFM
	v68lUjSx+lTdX6TSA/ERgnNy9G3wHPc+740aZyUiFMTst16/mfVpsVvlsALm44pUTBFp8n2eJ+k
	swWLNXuXa2otr+Jty0X0m05Y4qlPQ/fGxtKLQSdj0h96da67EBqHfJPqAGDQ32Rhn1Mhcs7uhew
	2wO/2g3PvwWrQILQFZnwQ7WNbSQB0EbYLiSgTG0gq3r+JFbeMSm
X-Received: by 2002:a17:906:ba87:b0:c2a:4847:231b with SMTP id a640c23a62f3a-c2e4ae235a3mr249670166b.24.1790952594706;
        Fri, 02 Oct 2026 07:49:54 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa656bsm94539066b.74.2026.10.02.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:49:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:49:51 +0200
Subject: [PATCH 2/2] dt-bindings: display: panel: himax,hx83112b: Tighten
 compatible matching
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
In-Reply-To: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790952592; l=816;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=UFIj2wMvo5XUOBicWCPYVsxIWkd4wo9mTw61yb2XBXA=;
 b=PdkVOKEXFAm0sgIKoBhGPzu1gFBftu0qHcNL1NRDXWSJcJrDJjbnmsITJ+q/d43jScGvZmi84
 7Ed2SsdoD+nCXXCG78S/8INaau1afyaoLL/nPkm+xz2NKKuEYhhR0vd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The compatible was defined too wide, we just want "djn,98-03057-6598b-i"
and nothing else.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
index e58bb3d45331..34e97003d293 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -18,8 +18,7 @@ allOf:
 
 properties:
   compatible:
-    contains:
-      const: djn,98-03057-6598b-i
+    const: djn,98-03057-6598b-i
 
   reg:
     maxItems: 1

-- 
2.56.0

