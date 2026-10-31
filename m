Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463876;
	b=D4zkgxBbNpYKjCasJU3RfiR0ebMRjRSkTVHTypoqs/mREg05NKEOX8qyeqUaDwi1ZyQO
	 yvkPNGq0p7DrwZZHp4ur8VFte1iecw2YExi38C455pjwoVGbLN2R8GUSrOzzhUDzFQiOQ
	 zXY5y57BLxZOUZaoGoD+Icn3Ywb1BV6Iq6hR7m+ZbaoM71rIGuDqIodKaZG63LKLPFSdH
	 zkHFlJ9vX5AlTRl7jPvk3YrVKtNzjQ3T74aPTW9KUpO8E/Fk5HAMzRTPLU8LgG8s82FSj
	 BnSSNDkefxP8H67rd5ecVaTg9T6N8t6LCyjKhU1V4tGLsXHBPd3QYHFLuC8SxgZHSEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
	b=Ul7Ct2rZM/DcUI9ZDlusxOt7DHt9qEwut3XgKVU6PrPwSug85+mOS7jxacqcx+MxVdPY
	 gxpTdseu0yQnKPsQEYauV0X5cEWeQ0f8dVYeiAtXPbw6+JVcAesAN+bxH75dzEILPARzo
	 HiFuEInm7ihCP/4YACg4ld7VkAM8oE1N9QBhOmGTAIfrxlSsGUPraQgPgPBdxKmkqJZH6
	 +BUL/giZT0Cs8Y7S1oTZtzWHnOTyu8kccqcqgp6byDIj2LiJX8eNDjxT0FWKhrFKzYE1Z
	 mbMd/BLKnHHy8o0cP+QdwEDBWTs4JRcATP+ogM97orGNP+rBIYLB+O4MZI7RTUDwt2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lGqGKHJz;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10B606A337
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D10B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lGqGKHJz
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9441591aa5cso266379285a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463875; x=1794068675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
        b=lGqGKHJzDGXW17jD1pryPBA87LDIwWyOzi8ssjyyiVNdhFFuW5BBmlnYMDlxTFxKTt
         PI7yyIZlXQ2rk3UiSv2OD0mL2nqff5KNMDWzhASTkZtDlOVR0qbZ75V/EvbO0d7VhEeR
         LuDxSX84IBSJYV7vwANkLCkq5ODi5x1RypITAppVUuEhdPormTQR+OqrF5fIKaebEseV
         4zGWOGDG0wiOz7ZwvEYqWs9h6r6vNXPiSWW3by6mIzIUA9xOOxKIp7yYXOjl+teB3K85
         1sZovvR5gYzTsezBib9nOY7Ie0npgraHz0HAAThVt9wRL7/++PwiEluIX4vXC07q7tSS
         LUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463875; x=1794068675;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
        b=G+eX+sOse06ISzXhQO0wFL89Se8C2/mh1h+XMRaHxTWOhEobDu4KAlgOk9PBsHvajt
         2GYvN0QxWK+RBvP/Gfa3pfaaxWX83MAnYzhHhEjaYsvaLKpKMd8GLV/GHzkonFenHhIL
         zFJYHE+yuJWVTEZ5ijgbjXABqbdLQu+E8MuG4iyJtAcRNktSE8SiXKlKcRpnkVP+FrMj
         S5NGKFMF4EkHA2nT4DzE8s/V0rgGyzH1vhsTc52VMbd30XnD+lpiyOt1kmM+7F4pLSV/
         rYae6FR8O/35OGLfHoXFPAoxpMj6TtKDoCXE6guU8t9A8JuC7TZBUvcp+PE2ke4cjYdA
         DqwQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7h1sWC5fbV8zG+hGG7PIVH1SyW5ygcRq407Y0RH1jN3HDflnC/e/j5pFG+PQpfpkTBF3a15BUtmO602E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/Gt8GyN0jDxjAqY/Z2DZxAsez2sGWpzPssujaVcoDZX1SxOpN
	+X7czeU2E/5s+prLd5z71ohth4l7r7k62EQFZvT/Y3FT5NUe9AbJSxb6
X-Gm-Gg: AYBFou2fOKxq6ojTrUaXWKI83GWwU6pg1NOzwubfB7BD3rclLPFCSyzY0F1WjY7cCmz
	51Wp23dihVXoqZzAxI5iqZA+6tiV5JFzFJvdefbGDWeV1TpkeGrOKpAaSZQZktFZTUQA5zjxDAF
	vP6WolzN0OQjIjPG//+GfaLs7no03iWhnyB8YQar/HPFpCsLNAmVEpWI6WwjON1L0bmmDSCM/Vi
	Q8Gn9pFQzo0zPnYAbNjZ89iOQt8k1AqkvqLaAyD8mipa30+LDnEqByIYsdNg2cEwvRf5Y8gPr1q
	sVdHKKdqxyAd+s/UqoInCC6ONpUmwltADkxoRPcrmg04SCZ3C6k/5XOG+QmNTRuMAAmMjvVY7ow
	Fxr8a647Xhf43UxxCcBbGuHd3umt3eEq3xp/yqV185GlGynp0zIy1CxxPMTZkSH7RB3ex5ZFH0G
	lIwSXr0NqRTMRvJ1OCXhSK36KDKDy/JC52n/jo9hg4U9LyNxlc4YlBC2+RgcqwGiobwhkmXRXiy
	zKda7nAijb0Guf1ODlyeq7XYCQhHF4ddmCmnNiWDiErZX9pldPqjQ/WIqf6nF0v+oZ2PDMJ9T7z
	/+Z9RDxb6zhVhjFZNPaz5Js8vlNJ/Wgt/LW678KuV3TiIXtr48K57Y3snpwfSS+Lrhrj29bmDFJ
	SiP/fEw==
X-Received: by 2002:a05:620a:1999:b0:93c:891b:90f1 with SMTP id af79cd13be357-944133ab8aemr1377062085a.26.1793463875288;
        Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ad7431sm414076885a.40.2026.10.31.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>,
	Burke Cates <burke.cates@gmail.com>
Subject: Re: [PATCH v3 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Sat, 31 Oct 2026 11:24:34 -0500
Message-ID: <179346368316.44447.5094215662368347048.x2e-share-pm8010@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

PM8010 at 0x08 on i2c5, no interrupt in DT: it probes, and its
LDO4 and LDO7 power the front camera (ov02c10, 720p at 30 fps).
