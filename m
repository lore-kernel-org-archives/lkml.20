Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B34AA020
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637248; cv=none; b=uC7nMhL1Nc0bU/+C95rhm3piTiwwvdGXMYHyHVG7hpDGPiYbcgwUhuPlB7LtXVrN5igi5N/6XuMzmqNCfFMs9QYgnZp3xwbQBGUKuFTtpPAlqTnl98iUUq81uq4oKY81nj4hnc3VSKraGN4tx5zxfGLljZ6eVhhAKmD0nUTNmQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637248; c=relaxed/simple;
	bh=RvIX/B0FuV6C95HhNeUmyPB6jkzc7KAvCE1LKhTrId4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uo9TdNC3ZMLK2GhXjuyx6YJwb/tNCnqjm1RE9WhJ1nfE914wgdqWovEZN6a5i428ZT/PTWQt/33KdVov1KBMwpkgiYCzVGH55SLL9wPar5zgA8uvKadBCIRIRHFgUJGa6TcTzFC8vmHSwgr9Q8MEJ+g/zTUTqgoEN+D6F19lJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVguU4wU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVguU4wU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso1865381f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637240; x=1792242040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JExfj/tGlMkKcgsuSdq+eQx1ckrlan0UXArxeYkCT0=;
        b=MVguU4wUK6RVJfQxRL9SX+i1e3b5T2kOjlZAoG3P+yVqSkXB9YsavWpUquVQoXUNEs
         +myv3qaEVCObnps8B3s+v3dpM2pwDeyPDai0clgHuZ/SBucD0TzWmtPPpY3N6dAkschg
         +fouMLdce2wm1YE+y2fZYwdkV96hFwYz68npf2ZV4JEP+4AzcnKPb9aaXXuAn/sWbkwh
         Lvli9mYU20pnf7tJFW/IYl5Lp/Qtsv6LBHRUR4gss6VyCKsH5d/ajb88p4UiT4QTD5er
         CE4lIJI0xD6Sf8a12/tiw+TDYSSpv1wjqffvlzJUY7HtSazk/SncECgXjmmVQP2gqeLo
         lrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637240; x=1792242040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JExfj/tGlMkKcgsuSdq+eQx1ckrlan0UXArxeYkCT0=;
        b=0L9dKea8VF+Z1NuX0beICGc6hGN8Ynu18i/bdiJ06RwciDF7W1IRuHMQOFb6WL+a1p
         LvLv7dyHOiyz/tz6ST5C2JVlt5Rqeu+u3N+z3zRtZonaADfNt6CVC4yODlCJsUrfop68
         /xBOxhT1uddpNuFGqISvBU6Qea84dz1S+1pcNbKmxRRHT+2PL9CnfpTM9CtfRX9xhwX8
         9PdMueRoed8T8HZO1BDkb6O6yzM0/2U7bu2YbWVe44lAdKB2CFFHsJRCu6FLS36NViII
         ugXVDk/PHAlt+seSEespRhY8hhL6REtwfZs/iHlt4uzS+E5RDfzYB12je/mXTeK/AOD3
         ipcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1AjJb+fqNs66/l5lZyZJZwLYrhCWVbqMWoqOcfPSaqt0vG5F1uVsqendVg7bfRwWPHxQQNPGxLkBJmXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfHaof2JmxB2zTxTyqKbhKrkMEWBsrSdCqo1elIuizq8YP/M7z
	TuKXMdAwN95GlTm+BJSQnojCYBQS2zY8vqPt93a9A1js4QTSOGuk5i+g
X-Gm-Gg: AYBFou3O90LHZHP5sXBkSoKrgyxaaUz+8R7o2Wb8gK3OpV31MKFNPBl0uLRH8puc8Tm
	TMumBlD2hXec35OJWwzfkMFxA/zQrZc2OgkByynFnBbE1m+OC4xicBaUkDBxUp9ewNS9PF4yc80
	aNIT7XNv3dn/Kh/L7NKFy5ve2GYgECZs/gqFQx33DvGC9sYCdVk2Sxw8d8AGji1PbT7xEKQ+qZt
	mn3Fc8ZDU44N8Zk1/HCKz8/mwOiXqtUHU8yReDvQ0jJ/9L2+LUrJIPGE0tOvg7iABtLp68aV/tD
	xVsUaiJVKsdYiqXDE3dMKFodu3AcrWQHL/sxCdH9kzD6llhnz//zjHl/WF3MK136G9mlDJJQKkN
	PoX7XGmWywPBlLA/WZVRK6jKmFzM3NkZkXZkm/V3OeG185CwOlkp0vtawPM8i+1nV334Xx4babW
	RP3tvoUd+G7a4jF8ksGQaDDqDH+fUf+7qLn5m6OwFeQ3vXhhMn5bNWAExVsMyCQ4zJk4a6i+/cp
	2DTUeyHENyq9hnxs6FERCrdYG+Fd9RV/uRUF6tqpaDcN56N3AtFm46ca+od4FtABytJi/rKdJZW
	YSmURYaOgfEn6JnYHCc7e29S365X1i+HciT2SAKQhWiilKu7gRFsZI5dKatoAsnJOWq6TKAL
X-Received: by 2002:a05:600c:620d:b0:4a1:8d46:6235 with SMTP id 5b1f17b1804b1-4a18e483d48mr88612985e9.3.1791637240254;
        Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:39 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 11/24] dt-bindings: mfd: syscon: Add ZX279128S system controller
Date: Sat, 10 Oct 2026 13:59:49 +0100
Message-ID: <20261010130024.177503-12-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the remaining system-control syscon. PCIe clock/reset/PHY
modeling is explicitly a review question.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 945a168b61..cc0eb377ec 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -132,6 +132,7 @@ properties:
               - ti,j784s4-acspcie-proxy-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
+              - zte,zx279128s-crm2
           - const: syscon
       - items:
           - enum:
-- 
2.55.0

