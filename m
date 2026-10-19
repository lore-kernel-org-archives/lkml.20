Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435546;
	b=D2U1U5upW1wKksVEIwcv+yMIOgFSDtaGsUsJV2Dn+co+l/ZpoRLlyihVX9RXfj2PkFTP
	 p1aBPSuYyKbifGfsA7PqZziSxRFYQ2qIpFmjXUyaa4YplwD5Y/VkPZdG6H9TbJDmd0/VS
	 jg65lo51oKY2Tlo8wGqL5l0uxJ2vncHdU4ulbu0aTSOLJkRkkq+JtAxAFZ1JTysd+1hlo
	 ttnt4unFXedH6GE4p8Nqe+OHRY9cAkhXJcdD5T465vvW/D7xlbjla/etRhcJIY8u9TRLA
	 CYUaPAoVDmah1g7Zt/LoHbGJuyJa7CEZpZjs2hAaJUAX7JoL8Fuq8nUf5e+hr2qHn7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
	b=HAe9FYbpvM6gwQcE88/alFW40s3FgwWRz86ZG4bVBYNNSlAervV/6oSaRM0JAtwZ6hLU
	 uv3N/3WKZk18ymIOhudoXZ17/Ci7Ey/MCI5qDolbwkGaEdTdjZCz1zm01Xqfkr8Pixf2c
	 /rtQ7jXf3TI4xQFhAfnemUbuA9WAZDP15HbhdOIZ2Tfc7Q4MAD2ZbXd1LSBmo2JhLQ7yc
	 CVy6kUVvHNn/9QF1J09sZ8gTVmt1jXHivi1SMl93+hivLKKsJ24BbMA1yxjRfyUVH/E0N
	 uX5Xalu2ci+P/hgGel4ivPZFTxqNJ+KxL+kcCZuICwQZorYXI3Lh67ZabYb2mciN6mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFRtXTw7;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E8606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781E8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFRtXTw7
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4449015eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435545; x=1793040345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=ZFRtXTw7gETa3yOcrSTIGpZYMi+kw21LliD3YuH+3Ou03Uyrxljt+Kz3ovut8tfawa
         LY8N//60fJ0qRWZGeg9TlHHGwAwok8uK8CNW220QLmfNiVtgYHkxNBNgLw6Kx1Bak/v/
         KguNOrjpqW8TdJs7zUksEU9M6ZknGedZRtq6NA1Q6cZAc5erECLAlHNlj7b5+HtEldYq
         6Ut5RrSL7DhLmxT6AtCCRDaQJmBtQJlyW+f0qtdmzSbnXCyC0vv/OfumrmqaHcwtf2fR
         2vWheWtUvm27LAEOpoTaxiZr3GH+BWXdKFsEBQ/pmOo8cJaBZx4oKDkOEvQik5MWXLH3
         BOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435545; x=1793040345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=JXt+atUtYLWpwMe+fUeC4V4YGajTDgtYUdOxB1LRGtlrmozSIriwe4zy0tvs8eZECt
         67c2t9mtbnehmue8DX0u9nmF/A51s9XZKZ1uEOfxelAjx4qZOdAzi3Cqod5nZK0acbAB
         nL8Yy8EnAaohBnfSHcZVxh5sJhEeqv+urTk0ymGYKLKsT4JUDjajwFzC82QvuqGKpQhO
         oJeZ71oX8pYJhG39HIsuvJPFnahV6WhpV/tzG2cJqvC8LmPnm0UU5J/IKDsRSXT8MBQr
         i5/Zugx4hwK73Lj+qAUg1/rdKoPdepGV8L8pq3/fxg581tgNeDyK5hAy8QITN8mlcd7A
         NPYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFJW4YWxmj/9X+sQLkAVSpigmyzwLX98h8ibqSdYZeVmbPCOmtKVO0itx2U5n1g7aPqoyoQv9IJgI27mg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdL6VXtVXTanNRMfMPKXOS3RFynLucgtaf5dCvFsBpS9wPzVV6
	sHTdzNdRe/7RKIi1DTVZhUxOu68qJWKScKIETHVsgByVKCMTz14NUPendQbClM5/1fY=
X-Gm-Gg: AYBFou3tHK7qy6eRrSbx+5NpVhD0SR5Q0WsQfbkzVKXzs1qgQ5+w0ZVoTKYiihJTo2h
	fAd2H2OORVQYWT2NzNqErxRh97og7w25poMaR/jJNpjyh5u3X1dGCF+RVjGadSoEYm6WYWffIC+
	x2RrSLIGj6UyqhzxzpOs358aSm7mQMUoZA7znH48k8Lpmj6LVTlYCoFxA/v5RWUjCfFOfg6l9UL
	8cUK0aHOxmgO6YFQJ8kfrFrgx6C/hySkTOhL9sb3fl5MyoDWrQa2C18eX6DEZzj0D9belQ+U8bX
	a/ox5vWNjvt1ksOyxecXc48wdc+qCMDjXMZ0BqWgtoQTOwIopW8lxsDPyTZTecdx+RD2i2I6KcK
	I7Z9LSsyCAO8KcvsJ6ly1V5Uh5peYs8vADoOF9yvTNm6kMxDJpsxsxLWHsAvC8mudyB7ULsDDmv
	lQDsU123NpdhyIsp2WovjiXlQC9mA0DkEWBe0OXc3mDNbp0wuP2tedNJCqcrPQ9L28
X-Received: by 2002:a05:7022:b043:10b0:144:c128:4c4d with SMTP id a92af1059eb24-185139aa945mr12351075c88.38.1792435544338;
        Mon, 19 Oct 2026 11:45:44 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:43 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Mon, 19 Oct 2026 18:45:14 +0000
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK
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
Message-Id: <20261019-fs1603-v1-1-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
In-Reply-To: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=858;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=RLHUZiHjILnHW2rcudg+5Lp4bRYjlbIHyQfQJMexFWI=;
 b=Kh57j8s7DigWfkjHFM25DugGH1/bTpHjS2ftggA6TludMkXbm72al+7MlNKKvjFQkZ2BdLHJL
 cA+nHKU/lXfD8+FFfFBtdWxIKqrGJKB3rxBJfK43MXO25pJmZ/UkQJ2
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

