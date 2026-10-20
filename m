Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514906;
	b=jFFAdrSbDaqRnNfPxBACFFUcme/8s96ttASNVZ57IJhMclhTsN7gWZQD6/vgLX2l313u
	 Xpb6basXboBlDKeuqusNzmoDG+KuFmjEEkX+d6Uz9qTWqiOQHYSzoDMy6mGujIGhwtkKR
	 H5WkCyCMG8ZmL14xsZ8JtNqp8kCsf5whK/Hh1DLBRa7skshrXKT7du22qmAsl8Q2zRQaR
	 BAbjVvWA8IUQlxs+9pUOI32a1TSLj3j4c/+j8LevDMdvjSRVe5a1CcvGBak+fUgeyql/N
	 6e6rzdo0V6IbSmMXSNuXUqQi43xNNIF1Ewoh8zBWHjvu2XsMOdoC3APP5jTAE921Lzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
	b=aDSOxiDcccHRjN+NR07aG3NmvWJoiQiCuUkMr7jNr5cN/UXuJQ5kvgEEYtC4GIn3KWjT
	 xo9vwVKnmfoTxVrA1TJ1tT/Q3VNupXYDNH4pji+1meV+AT1ukmfbC+JdHvOVHhii/TigC
	 oZpQ+IhEPkHr/O4ZJqw94bWsH3bcxjxW7+idmU9N4gzjYO1R0vIJcwMIctdzvNPmzmshV
	 lq/ic1dkBcCwQKpsJBUiq/rS+cJt5lXeUcphX5hUpRyvDl9zi8FWg/Lcw+j8TN/cGQVV8
	 RCV6lXQjhkZz4dZ7srF4k6ROeYTYsGAn78eG5lrh0EipwKcGBzslMa4LadQe54FLuuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MpsKsNpU;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719D606D556
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A719D606D556
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MpsKsNpU
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15943c9c005so3468889c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514904; x=1793119704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=MpsKsNpUPa9OV+dFwz6mIl+c77SGqOYzrbVx2rnpteX5BPlPEJwM44zo+/HlLyridu
         Wh5Y6MzKSI6U8paCI7G2guImYowAT5lsf6NLtyhhUaIjEoBLTobTeGX1YeGkP/5OB43c
         IXvGDmp4lpSuJzRmU7B2sYkh3iDXc9nsRpOj6CsO4uatd6o3Yfx3G95/uwS5L7ptzX09
         pGi+0u0SPEIPdEvH0sWtIsOWH8jTd4zf7w4GaLZE8yV9l44zRSNh9XGnUTutIWKTJm+Z
         AmyPoRtzB5LxAC9tSTuEAV+vazbcKN1k/GGXqvPT3+auHUE816zL2doQBTUbeLN7AcwB
         SIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514904; x=1793119704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=li7SQdyGzeUN2/5vo8bxbnt/k/LG0naeujwX+dhwVNb3MNUvdbGm9uqbHZS0zMsWc3
         TUFnGHt0pFOWqXpK0JffEVE5hFjBP/94p07Q9HPh+CZRsOk4MZJYQ+TJPN0MpmF1LfvX
         UpjR221loa5mOL1c9BLTByPOfcEnHkQRaomM2ldcPnQy/9NHACvapTWddVklroiwlfwj
         fNz6k7Ggcd2qfCevIb/A1dE/Hx7ePrAnhYxaJaZvvLk0KOEdwKy+pbT9W+Ui0eY0gH00
         YXBpHyVzFHblHPovQOMcYx9C6bzDzuYceFI+m2bjKMVPemmdA4YLvQc73dhZhgq3WQuq
         lSmw==
X-Forwarded-Encrypted: i=1; AKwUvBxeH3nOt7QcHlpeXLitf3y/T2pnsTfrkC64+oAUjxOtoI0VrS9FdfaTY5JgLxJWypJUa1MIS3vwleL6lpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXzEKNohr9QRVRs/cjVhDluMR/+mcVQ3w+P0R19i+tojTepwjC
	3A17MKh91RHixlnTTx351THGA3I/CoSvhrG4ZRlaCa/nsaqSffl/jAkq0RA+n21RcEI=
X-Gm-Gg: AYBFou3JW4qCOYY3tIAciWulkjjdMyn2aVlFp5IRdgblBMCnBxzFUYPp3tMrHNeV3R6
	Po2QVTF7fSO6O2dPwBe7qKObT40bCSHNFTt5HR/Dkb2+3j+UcCkI+0kLmUQ6jQXdkdraTFCyn2P
	446LgCzOqCnXeZInTP/bAgdNe0EgGmUFeQotSxwWa7e6qZYNrNcXZT1fxpuapyWVAF+H6h1np5h
	C/GmqltKQyxXt9gk8O+0OAXTqh6sHy4tcrZpedBSHB5+xgYYh1bVAqp6/h3+rkIj8zJTdYEGlfU
	TKqZ0gtQXXzI0ccZx4lTGyTiM86ceHVQdqgDBXJr0qPW1xX2OYahpORZSpSPug+6M//blJJVvQD
	QXO0TWNIwPwlaPt2IVo9FOGeDGE2mFHO5muih12qb9U+nF9FE/SgWU32EVfeNNGSVKh4Q5eMPz9
	ztZH2gwv3eTOnZEfoAFvuby3qbuaI95yDAT7HA9j1O4pdeZII8M0q/H5x6bQXFPUO+
X-Received: by 2002:a05:7022:7e88:b0:153:7a27:b7d with SMTP id a92af1059eb24-18512c381a4mr23295394c88.20.1792514904284;
        Tue, 20 Oct 2026 09:48:24 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:20 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:14 +0000
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add TDK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fs1603-v2-1-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=858;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=RLHUZiHjILnHW2rcudg+5Lp4bRYjlbIHyQfQJMexFWI=;
 b=YYXyiFzWZmnmcU5S2oOonde7bNLiYUA6N0ss7PIEEY7AN7tqRSbLfGp6g9tqO6P5vmrvGqDew
 z7yU2imn6/8BEoDXMMxHqN9uoxvqj7QFD4cLZ40g0DV4kCszBvsqQKb
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add a vendor prefix for TDK Corporation.

Link: https://www.tdk.com/
Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..b82311759c47 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1682,6 +1682,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.43.0

