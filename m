Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393464;
	b=qRrcDt+/7X7Yt9q2oIFLSiFlcSK2B7aWIYUneApcksRfGRouQYFzB2PfP4hqhj/qIaNB
	 aldg+VUVdI7CHm/Vv1ZBp0NQ1gLlFMW7koKCHnQzDbhB5lOJCPyYoqU8OPT6SuLueXbzD
	 yEgIH58+Yy82ojjuGs3ccQT5PDqqVOv/cqW8qrkfJsIa1QN0HrAVzG0XCIqapd2cVqLh9
	 HQ7zMnn1VS8dA0cyc4E2qgQUkjSE9qDOfbtcFW2hTpQuo4XuJQsjy8pLP4B01TEoQID+e
	 AbEcNmr+6t5HyyN9mBxB/sT8uT7jhroMJbyOBTYNjLHDEZMOYpyBlkI/dWksmACsc8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
	b=Ds5I37TXWq0dWaC5l31qwbsXLC6Jr0ajeLxAYvrR0yc6piyebgzQ1iWY5jej+V2XRQM5
	 UYhVpt+5DzxJqTM2MAiGK/fWGh6l72Ges7rZFHVHWDgr0xFSPEQMpslUZLCEhJFirjUMQ
	 W/+FXoxuPFCUvMnhCJkQhvwO2EPvn7OyKwJ6BWhzPHx+1PKOiSNb378skOrDHGfo4kT0j
	 KFJpvFYFP6Pmd/Rd4qFZ6tOo9Y82soAUavqtlG2mKRrXyhY42HLON24enUBvJ0URZxMVA
	 0BkhZwYYlG5E0m+Yn1g/voncNnA27544mABSqXwYbqvxljOPFQcnBgZ8zw15h6A4GhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qc8xrak4;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F58606A894
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F58606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qc8xrak4
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4357928c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794393463; x=1794998263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
        b=Qc8xrak4/32Gna3SdE8hXByhMXfk5ZZ39ef3KlM7LHsk/FC0f7Gjv11KdQfftmNbKi
         ZtMFOwXoIgdUsue1L1z9jsQjczEeNfC+aru77qwkE0bRpriBwNJj/5HhYqznr8rtacKj
         JcoVLxM3d59zgKMcBFHGHPpODNY+xk7Tqy/b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393463; x=1794998263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
        b=1KBootIBtY3o843uIWThYK/O9jRJNFErqlxwaMRPmvqLggbGlF+5exfjtAl7xUnI29
         +upEL4EMuIw8Ky2FdaQnjsKpNlJwTPITnemr7Ci5ktXtM+kDGeqQpnDdvWnQ4OhjOuZy
         cBULpAxsR9j5cMV9ker1zGMgDjgjnl6VEQwAL4XL2AkKcsBxzXZu2inv2KTnxfb//u6l
         zXazt3KN6sT3t5OsPCn5NyVmxvU6eeZS+dxkuEa0ArE/YEj4j2KyQnUhLcUcqPBHaAc1
         FfmKW17achB63GmT2U2877zCOkwyqr2Dz4cTbGyBEbLBkwDYgA1OKL/afDe1xioauO/P
         HmyQ==
X-Forwarded-Encrypted: i=1; AL+hErF4fkjz7Tf+b7ktMLOUN0+2oqCSrBg15pz+ZuyqpduEpNr38xkmI26Ox19uvpUVKSZsMPwBtxX1fz/F3es=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h5CsWxTXehioB8RQTVgAbLthQ02C39m+mJEiRISATtsqiRP53
	02bWb8jXoOwUeK2GD8kddjb6W7zZXIPOeKJxiqIjxLqa2gb3yMKO/iNTqBAA8KMFVw==
X-Gm-Gg: AYBFou3ebMrK0P8QO/NhXPjLgCF7vId93TIjRJ3PhmDwskjuBsTGOFaRr01j7t3Es/K
	QFC7smR6CHTQ9xhF8VS6serAkPl8e6vLpz8QfWmN8DOGSdmoqz69qXaN/PX9BmC069mPdvM7PAH
	GTBvdhsEXJd3efsKa7UkD5Wc+uRBpj8I+6prXqt9T3FoSDzzpy6F09BAWfJBkFL1pCxgGPm8hWK
	gqGVNiDMYXtIsBfl/4JKDbftEGPuDfLiQfoKFYbF+F/Bg4h5qO4v3DhmbeCRn5hkzu9ZOCrWtdm
	d3XgaUUY2eQOx1x4Y6Oh4GNqSn4mz/rnHLTrZOptFAc+ZO0ZbiyJMKyJQRoAtjG3t0KFOTviGW6
	p4tLH8skwwqCmxnUnkLq/aTugDPg2ebR1l15NKwQdlp89g2FEG9/agyYdbiREycPn7AMdAqBnkD
	lWiqdyh4VumSr+129lbHVpwIgNgr7G1jcA8Di0cqODHRxfxuNeV1A3yhzJnGxMWA0QjmQKlOA+J
	DTul6T/02d6Z85YmSGIOlIdSPfE01fps4qYFXWRw/vraVM5IjBGimbdM1rP6KuUj6BwK/o1xDaZ
	WbcU/i6ynsQqzN2gXTYz8hdfNfZXPfl65/Qoli/p1ZA43YKjB6AsPZxYg1GL3Ked604PooUriu8
	rvV0O8c0a58ikdkvfvduzp+ZlWUa4zbmYcis08g==
X-Received: by 2002:a05:7022:c91:b0:143:2968:564c with SMTP id a92af1059eb24-1b3c0318478mr1829313c88.26.1794393462774;
        Wed, 11 Nov 2026 02:37:42 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm14735194c88.2.2026.11.11.02.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:37:42 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: Add Genesys Logic GL3525 hub controller
Date: Wed, 11 Nov 2026 18:36:12 +0800
Message-ID: <20261111103710.1393311-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111103710.1393311-1-fshao@chromium.org>
References: <20261111103710.1393311-1-fshao@chromium.org>
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

Add USB 3.2 (usb5e3,629) and USB 2.0 (usb5e3,630) compatibles for the
Genesys Logic GL3525 hub controller, which is powered by a 5V VDD supply
like GL3523.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index e8b8c03f87a0..5153a988a835 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -17,6 +17,8 @@ properties:
       - usb5e3,620
       - usb5e3,625
       - usb5e3,626
+      - usb5e3,629
+      - usb5e3,630
 
   reg: true
 
@@ -70,6 +72,8 @@ allOf:
             enum:
               - usb5e3,610
               - usb5e3,620
+              - usb5e3,629
+              - usb5e3,630
     then:
       properties:
         peer-hub: true
-- 
2.56.0.542.g3ef89b7020-goog

