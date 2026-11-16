Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841848;
	b=j2BN6OL6O1wu48uFmDzD2IDbqyg3tsTSDJ/VDD7qOwnKdVoIrQkwGCoSRyC9v2RQRQ98
	 ujdEWkFwQeRh1/+vqXgAozzXrMfHuyEDBcgkcut9CMOFlenSLkfgup5ROKspQFZM3eFO6
	 LJDgsYmWrpxUE7zYPi5QQ7Ha6gv71CbI5tjB52uY59KOxbNM3ivGzqYYCcQk3v8+XYWtC
	 Z/107FdmRCr28qY8Rm80xx8+sA/8e2ulUY6Emzku22gTlyZWOiLVtMwz/wG5yVd7MgOtn
	 NhZSqupNFDzWY1+evjXmfSFvwVS3r/Cq6vOPq/+EZwD/YdToW2zjq70ADnm9jhqRbMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
	b=lfMpYMRDUYJSJhEzK2zetP+SXxBhSNhweNYsr2eQC1XMAKNJSq7a1M7qFJMNxJB9y94G
	 gQauH4G+tyxwOhsqTq8K6nD6UncxNpTTsLFZxgr4lFaM4lW5pLQPVx/gVBnius5D3EYz2
	 MNPbKAS+idtXiWSi4ZaIxAu4TsJABySoprYQ6DReSRfkdBZCNEjv2ikDzIiLVtAWjbMfw
	 pEewpKnYIAWX1xbkiVuygyBSrZKQriL6vUQD3JlxJpehv2xr4ngoICf4e9t4bEjRwQTNe
	 3Ec9y/98YPCNg2G+GoEp7e8TMZLLbo+7kIJ/8K8mMZuLey5lRlRGoy1EeDsGLDkHtAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aU/zSNlB";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC77F606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC77F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aU/zSNlB
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so337016066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841846; x=1795446646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=aU/zSNlBarxiJG3HFoMuahCuEfQ+zzg5jL3uVMD/T7px1Q9qIaMuWpd6H76V0CFIqC
         Zqhx2k41sN4GbI1BtizlBJ9Ut+4vB5IEi/nulPCa7aMupowAUeiucrdtvEiF/frfK5K+
         0L3x7Ddvb0/tHTGQi7E657iBmpa+OV5Fb4/MxxTHuCxJCdNtrW1jF5oxohTGAk3hhfQK
         nz7ODdVhI/ybez8geGlgOmZeX4BFWPUPjgXhrfcPgB1GlMJ7WCJQ+TWUI1wKkfeo5/Ab
         oi4k+mrNUnyx2MI8cNA3tM5VwrWnE3RxayFaSR8L4rbDMDw2/nbH9k76Nc1wQRA1a9GZ
         poSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841846; x=1795446646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=DQPfHSAeXNehiiOnhIpK8+VrDYtvN+G4ZXP+jDZeRwk0dKQbdMS5g6Sq7UJfWVY1ja
         1Kj61MeT/mBzmoz75XiW2UkXvls1WR67Ni+/i/K/sfd18gp8Lo9Vo9xTL5JQoMIzPOae
         GLGrAqPnhR1sm3CA8C/xImFVWrIDsMG68Si/Dm2F3PxByhnEpg6KXQOlVvv2ni18Qkvc
         Pu7vMwSC7SKa3s2sPs42VZHF+KpB0sLaOwmxtzUt3DGt5BYXItyxSLAUOzsuHaoWAj/K
         /VAASF3G6PojKUPwdCnG+V775DVKuEEHuD8ANelduj63MkUknxKX94zpdfEotEofcL0b
         MgnA==
X-Forwarded-Encrypted: i=1; AL+hErFluLalZIodI/veBO91iuZmeo8WmN4uxmgAfKNoH6D5TffmlQK/Z/70CQviZkPT0TFnqFCCzBNkrIuqe9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z82c32SsTcd9V2PT91Oll6acZAJhl/xzVyYHBVQJlSZg/degxf8
	pb7CxKmwuUjBwt7zCJanav0TRI34LJ48548p58wrNlocM2lD10lZy/Eu
X-Gm-Gg: AYBFou1+YwpCm1zfaYCJO7tKLT+o0oIB9y1eaGpZf6DPmxHEa4+pQ3a6aoX9An/P7kc
	x/RjazOzT1plDrGmCAGPz1MQrxXJ1KuCK/posUYPHVLHXJZlE8tVcdc2mpOWdSN0rr1lVx9x1xP
	TeEiAvndNkFlKSbB9RsciIErnTs59DLgLLzW3N9Oth1P4YO5E32924JDNmBaMXZSusPjDvPbAmP
	7RD/CK2UtFWgrBto7F6ov4GiWIY/5+jecwZs6KGqoJSRocXsXcEO0YJuV1KeeEz4c+MfUPETyF7
	bS02ETOS4zSqT/Tv8KX6SODIw+Aya7aNT5MsMPi4Ig9aI1zkTYoWJ/oOTpL4xVGaHc8yuhjO/6w
	GohAE32MD2LtABHVNt6LLJORKLvjUjq4oWYRbY1YYkzTYCj4hAnnnN0Bj9d16oq1DxazGVc15nq
	sgnTOpXnYU0RaF6VCJA0xNxnjRMBweveTvDbLjzmMs2GpD8z3Ic9SOzwEIFgLJvXcWerZ7w8auV
	UwHSTbCGDgGtTaGvCHfIXexT1NrwLxO+POVqVrDzbO0skPgJs9jgnYUNE2WIPz9w6d68QhKPexf
	FzP/otFaApoXKk1+ifVpUvSeVywCqeli2MuuXwN8unxiKttQvgeZ8j3OaO+4XCzSbI2FaqHAf47
	UreejeFYSQQ==
X-Received: by 2002:a17:906:7955:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c50963aeccamr886718566b.18.1794841846300;
        Mon, 16 Nov 2026 07:10:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:45 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 07/12] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Mon, 16 Nov 2026 17:10:12 +0200
Message-ID: <20261116151017.274764-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e73..0f4837648d179 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.53.0

