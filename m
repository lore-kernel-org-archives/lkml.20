Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748CB2F616B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507373; cv=none; b=gfFnmcX1McE0ttJUZLXvdH+R3Doc5TuebdxOvF5TsXn3uXO5sVdwRugXpzpXSrz29I7irmFn0q1tKBAMqok2cefV/etPHWEDmZZTeKzaG7JRqcZbK3KrNMenk7Ci6A5M1zMI0lPnfj2Rui2lTaTiCnxSXBPI0MbyrLjNNxogM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507373; c=relaxed/simple;
	bh=yy63d1ySOFQGedeCRXdnVMp+NykFLNzr65iketikEgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kko6ah74MapJ+27jep02vOSYvM1nfJFv66NpBiMpkfEe8oQF4UC1DkbARbwSzn8oTEmy08PMfPFw230bOoa+M2p6Nu7nVzg08cJtcIBC0Gw6Lr/y4PpD13pJdm2LXMw4G+RG+g0b3gdKjHZjL9YETk2RSrG2c4fUn1T575T9E38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=AgpMKZLH; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="AgpMKZLH"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3518cbe59b0so849427eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507367; x=1792112167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ski0uA9iXMK3c01MK9RAwSltkfrOdMZ7bYUX7Oaxv3Q=;
        b=AgpMKZLHm46SBcoVPlb13Et14TDyyKEgdg8vxDk+wuIx4g8HguzhTOyLmyZc7MDl5I
         SR2H4BpW6E15ARyb6adCQIWppNLOpgB4J8WqLtfhaDPGL/ddJwkmwCYOYi9ov+K28W85
         VgJO774iW1x3dj9NpFYIriRW370U3NzFKMN1PTR7JXbNan6sGtRFFkq17WqH/j+mduBD
         NFRppLByNscAcXiiF9ES8cFmUuxMzfzHK5u8Uo6p/GPnhYf42KoNWYDI0E9rgw0zikxF
         gXX5nvQ36ZL3Km19S1KEzFfdtNUnAuegWHfrPF8sd05Et0TOt55JKevFflUeFLOUsVcG
         6jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507367; x=1792112167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ski0uA9iXMK3c01MK9RAwSltkfrOdMZ7bYUX7Oaxv3Q=;
        b=OR8WEpaagV7TcGrhkpAyEuL43IRtQ1y2IalOvHx6+N4QrwcOa4JFbsrO+MP0Tch8De
         CsOsflidr/Empb2oJx6al5j6M9awGUW5fnRzzQvJv3c+abZxkzA9yz5m99rNwJ52fb0d
         WIxxL7Fr/cjh3lU1Z7dBx+KUBQj1sl6gsGt8SPRCujo5Ij9dFy6Gis2DxhDAK/syGhS7
         9mu4WTXPf5xWBK6OSTJ4C+FyQg+zlqeDlPQBPVPiocdshcPe0Z5Uh2GkYwVZEKjesZqB
         279oEZCtCMyJEkj6CmObNBxWaSsHroCaZxyYKHhhaFDw+EMavaSnIc5mO3FBGNYgqn0F
         acsg==
X-Forwarded-Encrypted: i=1; AKwUvBxPn4gbYRTX+q3i+9+CDz0BVd5YPdo2ZMPuq37YJaM0N7pTJjw8yqBSS+OjZYTI5f4qiat+wRjd3M2FgPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuxgIwpxO9ClpFUhuuYPd3cbDI/PVhaUfI9IhXcP5K9wIOSqhq
	e+IkiREXzCFnpBirnzbxxmWg8yc9ycuPDhrkuzhch0ILihEdely48zhJnJ2dmWdacRQ=
X-Gm-Gg: AYBFou1la8mNM0OOptBefqLStzUxdnxuHR/8lbQ0Z7sQssCTfTQf81DpFGYHOl5GtfJ
	y8R0fU2DVhvhC9ZY8AZ7yWlQRG+OkoduFZx3P1yR3RmTTSNVPZqMyx+fBW6d4J08JtPwqJReK38
	kD2ktsHc69P+6zQ2h0v72/SWlwx6YIOXrZRcdnr8Z7ssgKq/sSNt9kNg4J/SJ3FHoTk5cRYezWo
	Yw0MIaStj+4yas84omvSeEquLvGQZMvVNL/Djt+E8u7CzsjvhNLdH3noSVTXuljgEpwhoCEAKn2
	PI88DHaLMNuXdG8PgzJwSR3KdZukgeBO+QPL6Keccw2eygzAShlqC/4o+md976OYgEMH3gyyXLq
	S1uUaGWbFdGIwtk1jX3R7q3hVxmWQZXVpMkKesKxpRF96se84BGoRzPaQqifaap8AbzkIlhJg2X
	5tldnVXp/blmBsyO30W4InHI3Q3OcYlY2wzrHCmPScIhoUPWA0nrEaZ3JBfAlMq/+3CF26y2DHv
	Q==
X-Received: by 2002:a05:7300:601e:b0:339:851c:4c1 with SMTP id 5a478bee46e88-3536c593e70mr1308972eec.18.1791507367192;
        Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:06 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:02 -0700
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK Corporation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-1-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=899;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=yy63d1ySOFQGedeCRXdnVMp+NykFLNzr65iketikEgg=;
 b=CWMjSE8OHUG5p6XT1QboxHkd/VxQbJxvEmdWkIGcaaJNDehDcs3fHs2t8zbEQi/i4aFsI7j1Y
 UDZ7edbIvDqBH/d0wIB32JHBhUCNiOPPI2zgI8zVgcWuC594gZIMm20
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

