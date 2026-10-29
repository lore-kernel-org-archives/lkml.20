Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290222;
	b=g5uC29D3y7mt+K8QeciQOVKuBfH5pCBfkjWKR5gkKIT+hRRN6gG5liqGuDsNdS/p+P7+
	 UkSMKcXhv1fCP60C1iysUrgzZTyNjBhZj+/xy1s4+eh4PQGDoQErVP5zWR2rIejhjT6jf
	 0MDGkeqlK9po3tK37kC752V98DBG+LvOAPPolAXwtx0gvaejXpb7GtmiEu8tCvgCgWKPJ
	 S3+HMXW9FN1KItaXFYaR/E1oPDUvYs9NkWb0bfQ2HmXHAEFkbgstGH+nvQr7RFMKWxFo8
	 R2FwJTD0d4LJGuAH7YGNXQGjXut5vzKcXOMFx3NA5Bee7IBwVwYer9/Ul4hi5Q0W8Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
	b=1OUnIFSslB2UEspodKWUbSmw8m/zKowtL8Yh9YYdKJkI/ysfl3yLCWgF4af4q3wWJOpV
	 z3TD76POkb6QOFGit2akWM47eXUQdC4ZxWTf9AOiaiTMxmUDHPmPas5FRpblMIJBLHNBb
	 iw/nKiATrLZL6iWvVyCe0+Qrlwi5Om7bB7oRgJ3iHSY/YQvkPnGYmCa91TQSc5LSlqTcB
	 DRQuijDBOsKdZFxAsLbIu2Xq3nrlmrQDxg4wUZBSUcOlZ934iAm4uV0S3kt1A68yu/54H
	 k/Hugdoy5pDeboyLePmRF19hq/ogdMKKBF65aK7JOZkmHU1u7GFywIufd6AWupUjTqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pO43cown;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B2B60A5BD7
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B2B60A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pO43cown
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso24024275e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290221; x=1793895021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
        b=pO43cownntH3QZT4yq+8B7fuN9WUIoVpaHrfgUOUnFeeU+cClsLyXbA1zrywkT8CEt
         rjUjkaFmx44/Gdj/B/fSNj+3rSZWD6EWGdOzI3eKOT4jF+bCcupcxxceyeg16j80Uwqm
         Sxrh9+AyyLzz7wF6Q3Q09VWDBKeq9zYhwJa0owWclg56XiF5pRXQohJ0IpuuFHXuf8K6
         Tv5HWGN1ITkOd2CC0LcRy5r+lBfylHJZ5x6SlNv1eUfrkeYhImBa00diUHDcAGU8Q6Kn
         qGIjC8FyzkFrBYPd1LW+op6KM4KhEBzghKFVvT3qHFrQFhkJWL7R0EcwQxqbm/7aB9+l
         +gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290221; x=1793895021;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
        b=OgxobVVrWDmVXoVJE8zovQOvLmgLvAavgB1RE5ApRt0d2evX/T4X3S2qrm1noG84Uz
         kkj3AtyBozVFa9lQgYLVQMxZwGIg7ULDSsnyU63J8Pk3EnYdfRv+9MeKXhZCJp+4c7cT
         hOgS8H620i/AUoo5SIcGG92BWGrgkJ/SDAp9AlEKnFtaxSNlJaC+/Rfqb1rTqaN/7dpg
         E5WCv2zexHUOYRB/ZEMg1hS+PNowggWBzbwTy9V774utgF6k9/WXldjsQKXjVbrJXNHE
         mcy7iaUF6h2N1uxCj1URFItk5wdiKDFDSbB1dry2jhwpviFtL1HyczF4SeAmd+O/REHQ
         KZUw==
X-Forwarded-Encrypted: i=1; AKwUvBw3DAzDqtbLQnuT1sZK+9/IH3ZSW3V1xt8mdl+d6Hphssllm7WMtrPq/JH/7cmK7HUeo76uTnIemdgHk8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLO7VKbgAPMNfh6mw3Mznsz9p5fq7Xz9LE+hBqCZ09GCd3vta62
	UnuVCIiFouG0hHYWZrrQTcEjs0nzbTeO1rIugWieuyhzPJdcvX1igTQxBslp6ND3trs=
X-Gm-Gg: AYBFou112gv0IvSS0sTFvaX8lPkSCJX02cT3KBQMfB3Y7yvYL1uABS696qaPu0v0yql
	4B71fDn24hx+6E21nucEhDCzv0ByFxeSmZxc8CEKRNVUDo+MJdoaQZJmacv8s4dYITaw0bLV8fM
	0T47sAK47AUY4C+LeenEQ0+xLUDt7ODafDi792ycj5p1rT0PbjJoOc8bCiw69KUv1XIYRs0lFaJ
	ZR2w1PhH0m+fyX1A+Thr8HHvXXhaZKTu8yS610P1NqxLpFv8cwQk9aa1L028+WWBWiKONeoY+Sq
	c5rjBKlcbsbJ+VDSGd8jmQIDvw/+l/In1hDl60GJdJwbEUOiIDPSwHe3F5BvI9kioQMTbIGUGmd
	KIqZ66paG/FlgN6j6E/FaYfaYUNQjsAq/FQDG0nPOd6l3s9u+hIHcj0MIddeNhYFF9lc8tbVyjM
	HZa5mv0yAPUF8hEl5rd+yBjOnCCMyW7LycvWeD6BPw+4t9o2yHqRNiv1+GNMbPemFJ3kV5BYGcn
	v0oyBN9lZnWUiM7aBkgsNVa6Tcl0O7sMAflZa7WjlDq/0aljQtrMCl669hEW6MpBYes+bGAvi67
	P6dAa1/0HnhhdXfvu1HO2w9XuENIbGVTHi6KD4R458dhhUZZSQMgDAdYdrtswDr8rWreY6jQgpJ
	Ij4AguUaQblatNn/mQd3s6PscpS+xeKVrisF4f3nahzQb+90tQPaDdBkCkS9sibxxKlzFFM32aJ
	I5z9q7S4Q7YfpTkoA=
X-Received: by 2002:a05:600c:83ca:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a9672030admr147844975e9.23.1793290220695;
        Thu, 29 Oct 2026 09:10:20 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df1dfa5sm146254f8f.2.2026.10.29.09.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:10:19 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: krzk@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v8 1/2] dt-bindings: vendor-prefixes: Add WatchGuard Technologies, Inc.
Date: Thu, 29 Oct 2026 12:10:08 -0400
Message-ID: <20261029161013.52866-1-lefteris.koutrakis@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the vendor prefix for WatchGuard Technologies, Inc.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..898bb9396454 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1891,6 +1891,8 @@ patternProperties:
     description: Wanchanglong Electronics Technology（SHENZHEN）Co.，Ltd.
   "^wand,.*":
     description: Wandbord (Technexion)
+  "^watchguard,.*":
+    description: WatchGuard Technologies, Inc.
   "^waveshare,.*":
     description: Waveshare Electronics
   "^wd,.*":
-- 
2.53.0

