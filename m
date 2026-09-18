Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583E365A14
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701221; cv=none; b=YL1ZY8zTxSFgIz/rKKLNxWeSGYJhzYWL3WBmnVq4h4EC+Zlnz+Wi6pNRWl4hlryjR6F1H/GGkXZ1x5BnMbA/LVrlgJwNv7qpeR2UusW5Wj8gAcCDjQFDTbQTa7KcL6++8fpEKbQGz3gGOM79AfNcd03qdytqN/zgXg7Plwy8cag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701221; c=relaxed/simple;
	bh=fuiyPDZncbmrS+1tzoE+tYoQNhb9wDdhb+YHTNeEIbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7iIXOCibvYvG6rCmOA1l489C8OQH5khz4mey4ukh779s+wLJpqKlEYpCM93O7hH2j5W8DuK28sGSCnCtxOtDIJ8E1k0os9FFp6rpTU2wVQ4rmTnNguJO3Dm5Ps25iQ89C7fx5sz7KcSnoVr0mkFWeOBav9Llagkr2QOsU6EDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=bC2+hRuj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="bC2+hRuj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so1150505e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789701213; x=1790306013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANatdXebkZ1BuiimhU4+FlWt1nvjUZ5NXOb6LB2ATX4=;
        b=bC2+hRujem4bueLxqDnu1fTrJ9ggKzkCYYmibb7szaANrjpfotZ/BmCpt+mW11D3Ap
         /QERKtD2YpHugSrBol2/DtfDlyTCK3f4BT8DcgfsCpC2nujzFRnjrCqdiB2ADcIK6jZY
         4JPkoskg4+ZJJj+S+b5epuKuQ5V4asWkyx0/t75q0ZL7s8ce3pWiglfq9/k36ZTMhIg8
         iLLyRYpTPfGh7eWy7/6jF15s0+mu5Zu8sb7ITTykKeRMeqPqBjImObZ/otZt2DAkr2GZ
         UTyB5/gByAAxwQqdINMjeWIbuXjZWK6L8F9FmmuqXIgCXBq75kVaaaNSfx8ys5AXlFDc
         9hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701213; x=1790306013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANatdXebkZ1BuiimhU4+FlWt1nvjUZ5NXOb6LB2ATX4=;
        b=BUw7KmNMCu0X5WU18q0gIXGd/H77JblRlIuzo4gbrBcGK05ZKIaYvnqjezqwlG9uH0
         r90UIhdBrmqABORICJaXpn6D8j/6m2v1ygesgWW6zAEOkjPEllCKd3Pt5Pqd3cYRcp02
         EnZOVb64J2t0lzku71FKLMXZrl7nwgzsqw3Ck2+NRQAQ7TSf/aZjeh4lR7HWufbJjdC+
         raUMGaXl83wtrxatHLh1eYXnRDkRInSPmFU1lpFT7G0SCiHotR3UByDesM5ud1gYO5Gw
         yIeJvLUV1l3CbBWkbo9cHBp4iEFlz3TMlXaQepHWIO1Zkoj2fatcOkNPYroihlKg3vHe
         2ytg==
X-Forwarded-Encrypted: i=1; AKwUvByCXcb+5KtneCX8cLemkKNyslTKPWc+c3is2yu2NgnUTgnLSCthD/CYBZntq6b0+OfwDr0nHfbVhcHRQmE=@vger.kernel.org
X-Gm-Message-State: AFuF++lLJJFvEmZsTBcuOBhStgu//+DjulkJdjbEHQNF/GxmmJWsJIu+
	OETDrEcWng24LEXGg78YJ6MLnDFkMBKW+kn89TS9fFa40PAzqL7Fun9EfGUhZ0rDgNc=
X-Gm-Gg: AYBFou0tDTxhhQr3+8HfwCY1ACEkL9K/jLWEf2CDQEJYfthiJSMcfR97NhkQRWCvqKD
	k8kn2bcfP6mIFcc/tz2jMdUnX/Re9yqzq3S5eJHqKcCP0Ch6IEFDmchIn2ltcl5PQCU+s/Gfief
	vwR6/QsjhgZSwfgLCz38aGevlQEluPeX+vC4In5Cm6F2qlj0IxUrq/+2J1bTvFxjYJ9JMPNFLS5
	cWUz2Z4+aCTN9RIyYx8Pr17nHeMvNkZpwrPo/bwvZZPynpiaZSLlO36zZG9EvRziBaRN8Io8Rkk
	zK8DIOPZcvWBNKCAtctpRA9g6twg+qFhH+rJ1XV89v/pf/FKCbEBU0q6Gq+rJkFjWghzMHw/Miy
	TcVeMOSKAWvFzujeEfP1EmSx4p4VFztj0UvyJRxlYNldwTpPrlpOBkOJmp9N+XBBZY9M/XtvpTK
	tlKuxQlwxUSDSDCWIZTXdlG9BuH463OBceMwn18r7wZetZIohLBhucCJn/21O7WfqT8KCtlhQF5
	a/f8GnOym+Mpw==
X-Received: by 2002:a05:600c:3f18:b0:49e:6c47:1433 with SMTP id 5b1f17b1804b1-49fc5868a9cmr9307825e9.33.1789701213006;
        Thu, 17 Sep 2026 20:13:33 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc79bdc35sm14533685e9.0.2026.09.17.20.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:32 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Fri, 18 Sep 2026 06:13:23 +0300
Message-Id: <20260918031326.68542-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918031326.68542-1-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs. The prefix follows the company's domain, esstech.com.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: rename the vendor prefix to esstech, after the company domain

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba200296937..ff4a85f4cbd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -559,6 +559,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^esstech,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

