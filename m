Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364641;
	b=i2Kl6trv/P37fQgpoafEDYqMIYhOqPxyJ3KbRZgyVAZqlrGM31nB3A8QgP8U8fJvm5NH
	 0vTd8B5zhKTJq1NpBnO4H5ivhndSrdruvc3hMrTZ8dg4XWF5/R5nsb/g8jO0Q5URsTT8q
	 r5xlZTyCEcdQc2wuChVeHILOal9cF7jG/lP6o9CP/4MPz//zuqWL+haVNMHrYJz+1xgiW
	 aDZaLQCygb+hwL653KoQxoREBwcRZJaOcNgx7sN8SzPEjij6M2hyaqpucBSC71h4o9x39
	 I5VXeQ6ltiXIYOSPetn6W5VGQyoKHeWsfJZYvKPINvdf2zNJbWEQvvAGC8XCZvchzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
	b=dXmJKwShSqNwTWD8naT8nQeX6lgTktSQvhNCNgTQq4Af3QBxgIt2XoxZsPnY98US6Pnf
	 7m/PylfyZICT6/3LZvfifHirD/MVb85LxgYWXtJdZWzcL7cX151SucKndZb4DnSd//+ax
	 nh+r7rHlpcUg0p74c2zKIMPb9OV/H9m41wb+joF7Qi55CKctg+V01wG04ZmD4wfQ/CRjI
	 xmGEYL++fUgNGva2pAUi5nUnBLume8low8Cy5G+HAdjSNyRwDJaNt04mgZMGwXr/yu10Z
	 YU+pyEI53zQKsgub4JUMZo7c0xmsrETvbvp4boM/46xdwFYSheuE4JEB+fiHC4IBy2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyxfvUBZ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5960A2617
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E5960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyxfvUBZ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4649b35bso633009f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364640; x=1793969440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
        b=KyxfvUBZR/SWaeaVg1526LVJlvn0bFpKNqn9Y8myiDwNEY0JoawgwcKkCQizSuM9h9
         EjI6ggQimnhzOv0MwhdujWqcucj0s0KKItbfo09LT7ip2inPR5XXTDv7C2qS8tIE+B0p
         yUyfplcSyfMl2N0JixNjHC5NYfR4Y4tvTf5b4gJ4QmURUSNWPCbRK4xxrzdiNSuNq3XR
         +ZSS7f5+fSCk2g0PzKOJ5lCyeXH0MU0+pqVbFw4QRKeU0nC575RUJexjDoAul9ij/2eE
         MAMZu0cEhCS+R5u+B/zkkJD9Pz0wNT2Sqp43OlWX2IuAvd/Zoh1QYIsuhCQuP58zPXpU
         46Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364640; x=1793969440;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
        b=TswVFhbdJIDdKxoMPYjNSTtVGIC57yxOvvWYQlsTkX/Aa/Ufurvez3ZelzU4ekHO1L
         VfIaCXsnz3gJLuHX34ThoKigjH+HQ5U7qMSUKN27Mwkm//2XX/Nl1RmXD2FBrPwbzDfy
         3lpzjjsgGnx+tAtS5uG92/p0n47uImb0yUFDoks1ej//vGuy7idFsskpCqv9H6tC+GQQ
         N/efaqne/qxAxDwgeB8o3m2U2f/z49UxQ8OHzmmLcMEOnLmKW4ze9m5z1uGSL9hZoyIk
         gM3/438dPQipUR8TswXk05utIgJ0dbdLYkYjXk1wykqZnIjHl1XiK3SYDxt0M40CC9Ap
         RDBA==
X-Forwarded-Encrypted: i=1; AKwUvBxXp8ZTeneIpOPZ60I4KfjiEvi6kXZ+MyNp5GOj9GlJ/BD+/AckbyxYKnkA9oH1QIALk2nz6ZM0Xe1UaVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE/EHGQ4k5qx/6/K/SDfc9Xz4te3vc3rGpBflsNuDCvnxmT0Gv
	To/rPfsx4WwBpwTyQ122hXjnH8GGZ44PWia4hGKK6K93oci+HU6HBuxP
X-Gm-Gg: AYBFou226NKwLZ+ufxcIEeklv07XUg0imYfn4UMTGAF2zDcnSMZX+IuPHqlYPWHip7e
	DFOirlIzlRrLY/VAo09Z47u9N9ZjZ3E5PxBRaBw8NusWrfVukDqUmzKEczdi/eLDKfa631iZGIu
	X4Gea0UNmpVxSIP1KI/dRvpVQIjKYfXwys2bc+BHZAALymLN+qfG7j2UxCc1T8oBb9dBRNHHcyz
	tEQnq0xaiKaIcXZVpso3Y1WY+v1lnHgmaCFoum4y4fR7Udx4P23doKFbp8Mi8tNjccHtFRYwY+B
	g7UZjlSk1z72AxDRtj/+XEpf0XOwbALo/63/yAy1/o+bDjauNFO1toQMjp+314P9cvjwwuVO1eP
	EQffB+EMMWTsHJC8J/E/1wlo41uF3CJqPK/8+uAShXy4tEYEQiosSAm/0O+OYYZkDfpVd5AODiU
	Tt7cYvIMdEwgLfAp0rYL1Dfo//RRiSxv8JKhycZr0H59ULbj7PrVOZyreRdujjJkVN0/GZ6O/iO
	UaPYaH26XwZcDcO4s3EhMT4FiXDmdN9HwFPDECIGX2QBbqQYFJMMYGwx6u9XRvhcqspFUN6jX8m
	0FjxSsCKqsSB8AF+/OtFW7TG48C5m/xaVKwQMLnxllbMV4bWDnVVcjpmwLp6raxDGIYZmim1qNT
	Kh78P7m3wstBr2hHWh0FVjtgvIyVQ2ewxgN/k1770012ZZMq21B7A0juCKNGuywuNgU6Lq7dpS1
	wJTpMQEONQCMhqM9U=
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr49842075e9.4.1793364639460;
        Fri, 30 Oct 2026 05:50:39 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm93079855e9.3.2026.10.30.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:50:38 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	maddy@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v9 1/2] dt-bindings: vendor-prefixes: Add WatchGuard Technologies, Inc.
Date: Fri, 30 Oct 2026 08:50:20 -0400
Message-ID: <20261030125024.612396-1-lefteris.koutrakis@gmail.com>
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

