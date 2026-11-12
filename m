Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468598;
	b=htV1hmDryNag9hzSVmtEyc1PoYCjbPxoEmD/qHRt3QvrNTTm/IWtkH7BJZT9CLxJuheZ
	 t7xqImM1wkrSkK2wr2Z1XmZdKqey/iloz7ls4wX/b8deas739qArxw9mdNEoqvS1TwTj5
	 EfRxwpGG0arPRO6ya3WITpirzkYy7noSroX+prDsny9iZy3AUX0Gyloe0al9PIBac9bIX
	 vGPUBD7Um+fWzjQ1U4u2X6wjKn5Wv6v8HZNsYyMzRpX9kTDdycXe3KaWc8LtdDS11A+oM
	 cklC1gDJ4YmOpQtktjXl6JoS05O+4DPF0T2C2uLKJ8+QYB/QZ3ynvAHmljynI+n29+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=;
	b=LG01K3iYkiTLmw6xnmFVL9kI3h7QHYzt12ExBfbZynlsLlbrGQmDPdnJudk6paRG/g+m
	 CBm4tz6/oA7WNaS+7uRPZ0AY7tfojfDRKJYUl08z1hc3+bvIJ6ekMY3M7mXBYOs6GZ+B9
	 eHPWgF1hjtkkpyQL0Jx5HONVo+sRBKB3bVyYFwUduApnmDYgrHEvSGncLGjhr0q+fUG06
	 aFK5amB/6SxvXpvK5tXdI/WH2/wu5bq3mPjAsFoTuVaOsJT0s4Mx8XxggAjyNmJ3kAxWB
	 XDFMGAzeZFzyLlShAOa8i9gDe+GopyPbffjJfsXPZjyn2zF5qQiYZgYTpKvCNm32ICg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsXo85TL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE84B606A888
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE84B606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsXo85TL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so31715015e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468596; x=1795073396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=;
        b=XsXo85TLf73OQfyY7unCjLeRGit+/7k6enEnnBVMA6tDJdrVg46ABvj+RJd5cmgQpo
         v710ok0Xt9oP4wzT+CwV1BwNDyEdpN7WU4kpDLXcmyYj373sa5wrg4zk3aJHhSId8P2c
         6v8NNSL16XZX/Zk5voRvFnuZJZLyIOHMCXKu3mJEcgW65dvOsukAgYDCpp0mP6SyTBul
         nYgaCHHWfn9wSTxFDFzPmnSlda4HHU1TBeBVVncMmk9O1obvFJf1ZauntD5A5vMMXYBV
         wp/iiTyZINFqXAzmTB3XTp7MHoWi7/OfMXg1wm4zk72HR7OZDJfaOMyxZXX4Ux383K+n
         2hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468596; x=1795073396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=;
        b=k8tIyJ7QX5rBdSyQZPXl0VPrd3DCoiNYuuyNFSVbR8uSNpxX1QdkgwgwqQkf1OgOKj
         3aaxitoeXO79eT4VmA6zdjF8TNRsvQrAb9EWGwLBN5/FLb7nz67Jq3o7U2LngVaqKQn8
         wKasKwGKrExmqNUVh+ElAdohWrmx5pOJAGoap/CvILQmIzK1yNk0L6mSegMxQ5cJcaRA
         wq4EZNEkYKOw5F+kmIQupKAvxB7wb86vy0PmWLjxFRz+qm1UphXqjwPcTHc7IfZpjkWY
         S0cA054x69MgQQdIndihPG1aT/xchEPirvGjr/TcSY+bpPDeqRuvUglSIRHzr/7pf+B7
         eJMQ==
X-Forwarded-Encrypted: i=1; AL+hErEIJBzKC+I3+mlc8G8sEPtCnp2qmcMnB+m69+4E8nhKTT3Vsq9zNKHB7Swcc1gDLbjoxXp4+455l5GosKU=@vger.kernel.org
X-Gm-Message-State: APuU4Z91BwMfLu0WLbIRDg32VU0wKg3wrgUJBrOLgITFZOxNP/5GrLLd
	HkaPe5E16dP4UTspKzlJnbt5ZTDWukEvcrdfpDSxkQico5mxhpu7A2ZX
X-Gm-Gg: AYBFou2WS4hCfs6a1Mgaas7CsyR/NMDvYOqRyhQfM+xkGc6lNHLiVt7DnFnl0jZ9wSd
	hOmEiElaujHxufL8A0ArvE0J3/xEC7fbYy019i+VaEp7lBkucgeCpI3QGqtV2h0UlIoYzoSpKdK
	tl7fl1L5xztOGJlw+t2oCTiMg634EGYWcwShDOtOvYz9DRmiKWzrnmx3SwGukcXAP0X03CFOOMj
	j+2wCYHB4x1gkWqHi9yItG4iAR5E7RvGZBc5JITvT/eJSGBjcSMjRItfm76YEy0AZfH+Syav2yS
	BBVOi/4nKa7MDw3Pgee3MBTYw7xUjm9ANEuW3ZKVE6fhPbgvsFVQqPLw11EZGYd88Is3t1oEEtg
	fuW/WzW4yidmswPxBjXB+9S1+Knunysnmv0OcUKsGCas+CWQklY8LBbd0pUzIg0FbALJt7IRseT
	9jiOF1wHAPrU2wMuesciVlvMgEjX/lXJrYSle1OAzR4lMX3Nyjl+OvZdSVXXu0tWVuDkQJCVFdB
	bntWLlbjfZ0VFiki6ucmVrqZwgkn5GYMc4YSEK323v5Y5v0eYQqjiqr9BNNSd2S/cTehLcC+GRX
	XQw+/L0woi7xkm9hPWfpBjW4HyfwnuOOa41m+AMyj2Hde4aGUH5D8COO
X-Received: by 2002:a05:600c:4e41:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ba09383c0fmr77333275e9.33.1794468596348;
        Wed, 11 Nov 2026 23:29:56 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:55 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: cache: l2c2x0: a disabled node is left to the firmware
Date: Thu, 12 Nov 2026 08:29:52 +0100
Message-Id: <20261112072953.989664-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
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

l2x0_of_init() is about to honour status = "disabled" on the L2 cache
node by leaving the controller alone.  Say that the firmware must then
leave the cache disabled: the kernel does not check or change its state.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
index ee604117ffb3..15b5d8c1ebdf 100644
--- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
@@ -24,6 +24,9 @@ description: |+
     early secure boot code. Thus no need to deal with their configuration
     in the kernel at all.
 
+  Note 2: A node with status = "disabled" is not touched by the kernel at
+    all: the firmware must leave the cache disabled.
+
 allOf:
   - $ref: /schemas/cache-controller.yaml#
 
-- 
2.30.2

