Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737850;
	b=otx/DrfXtFpnKd3hd6Fyl4TVHDeM7ZufTXEqhXTHWhgxWh/0+T2u9++m8VDX2I15fZXC
	 9q8EqZmGZS3JcEv2vzV7I2rcE0d3lWOM4HJd6d2U857XCVG+P8LXDj8pzCkLMSfTkKu28
	 JSd3HNSekeJgiKCUKPpkGUGBZotk6eC9c+nJo2/JkOpPEEztZ0K/8lpv2wC2UODQ/WN2i
	 prOJa0720zok5/zG2CKmEt0yheyiM3Jk0c2Xu3uiO9UNUBZAz2Ijb91MfyyrCE8vv8d1y
	 xQFs7MUhDWCotD/9NE9ZflVRHrlJ/Tbx5YLN4fU+fcKBlJqLDfvsptflx8asLqVqL6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
	b=guIKsBVMEAjPK/5SAJuoVDK2+rSELgkDEzZCfpzWzq3Hh10wBF1Treg7PJLy/BUNz68p
	 u6nprE1nqHeejFcIffzNzxKIjmReuz92ay+Icqc+zDw8LLqNE0nvhGpDaOvgLAqPp+bYv
	 iSJ/qyVGq7bjDko3ajqGs/QQsRc0gPglUOBFjiDQsInMeLUR2v+9ePOKB9J8B/7uDT4Cl
	 WK7RB+iFUnf+CA1idM3vGR06WII9oOPe+9gziJxgGiOyDc53jHU4t59CIvhgcdP8pvtoR
	 XujkD0bQsszVuTc1vBWFW71NcrxEXlB8kFdArXcZ6Hd+xG1DYotFDymwITjbyuk6wig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aL5Q//cL";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B2F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B2F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aL5Q//cL
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so29535345e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737848; x=1794342648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
        b=aL5Q//cLEuNpA634+unzLV+p9v8p+a7Em0DbXEgeZ0BLFIFGIyCSbF3Nqsauxl/uRJ
         Z0E3nWzxoIHGm4saKx1SkugDmfWNjfERJjzc2mGvK9o1fR4A8I8ep0/y9wUCzO/xTXct
         2AghvsWQ4UHnlt3GzSn5N/oSbJ7iixOUtMD6yjOTo0yErvx90MDFLpR6N9zITulkJLxm
         +L4fZy5hfzCvmjy56S+mKCyD8soisxcTerJ+ev5vhxjOqbr0ghbI+i+51cieCni1Ldaf
         JfLaNVjPToruZYOsf1EPv4IX2reBP4O7yCIBI3538/FyjRca1MqZjJBeSzXl8HL2nDuu
         a9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737848; x=1794342648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
        b=E3NqtoMc/sXPV+dF73bp+fwYXqB577KKsYJGZiXdw7QemTMjCiioK9WmV1hue2JT6X
         mxIN2sMbWahTMzZ+Sfjbaeb1pJWCk56OLfperU87XHJ+uieCCnIl8gsAV96/6MFgebLE
         zBOMFm+hL1NEY7No1kvFqo6YzVPmaV3d1k6qkVcFpP1AuFL3FghpAzBUoL3UMBEQYYOB
         g+CAcofZyoKqry1Dk5ZCccz8UcUh/y/SfkrwQmOJ6kSsIlYEj050JWvlZOm16eVcs9xt
         HMWwBbJfvkGo+J0zXmH+inEuU+FbFFiAKv+32vDxi6Cjbb4ziS6XSIYOdqwP7yQwt78o
         sNcQ==
X-Forwarded-Encrypted: i=1; AKwUvByr0rBJukb7FwnQCPT5vzEYlxZ8TgrUdVy1LjIiPN/Q9dEHt5oC4y+I3+3zEZFIY4Y0Bi6hAXhe4kOdK5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KnU6l9DjKALCpre/Vbm30t8HqCC5ePI5MW7ZL5zkXYlKismTB
	IA31/V4Oz21H/QIVSJ9X4nNWIogHrTuPFRg7hQY5DDfxB+5FjodOBP2O
X-Gm-Gg: AYBFou3HRo8yY1PR8ZUzVp7DbUDt7Kip3QIBmlHKRuuE0a9MnGgJ5RVfpPJl7FI1Ae/
	5L/3iNP1pnhS+psnt836TvuUjsRwHeRILBx9TR/N3u6F04bSKLtjWoZUBamKNtVZlcKt5KZR77j
	zAA/vrrXWfMu8oUR3Vais1YMrub8Zi3Ca3AURi/94iZiTxy/LI/YuCTHS3jpkxaWJ9+ea3z10GY
	ZLrRHE1ZZjbVLY1ZcXRuBZ6xnG0o5Dab/rhfz+gAAaZgIFnvcAxBTWJ0hxyrn+imiHAM2uVSRBz
	aEzusF776uwgrWTI+gGqgFYJoxVASX7XJH3VFUD++msyD2tzr6ZOvV0n4QX4O1IA/2nnVu7NNE0
	9GB26ivtsWaDkLpBltirV5jNZnJVQqPSGiptb3gSxPUU9YX77mrv3K181ihM4dLdmcu1M0iQ4Uh
	XPNW/RbvsTrb6ofL60GQ7n4DskGLgvR0hDQ/5VYe9C4kdYXubkVcGgL/NPiJygYkLI1Y5m+PcOU
	B+oSPOTCeaI0ZYBRwKG/AUTlYGpkDJQ6dZAnQYgzt2QfXtQgOY0fl1+xtD+KrY1VgBY6+Od5ggG
	phgfDEb+oBrX9VibtWPxVaU0ENf5WyytdS5KBU+FPNhM9GkfulRptWVyNSiRX9wC1PDD5w72TgE
	iTmdtY1SfiWThvRX8Zte5GZDxesdpAtjjzw==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr323378835e9.18.1793737848028;
        Tue, 03 Nov 2026 12:30:48 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm75110245e9.4.2026.11.03.12.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:30:47 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] an8855: add MFD driver
Date: Tue,  3 Nov 2026 21:30:30 +0100
Message-ID: <20261103203034.12869-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This micro series is the AN8855 MFD driver that can go
parallel to the DSA driver.

Changes v2:
- Rebase on top of linux-next
- Drop switch part from DT patch

Christian Marangi (2):
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 134 ++++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 579 ++++++++++++++++++
 4 files changed, 728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

