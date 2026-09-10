Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE154BCAD6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054703; cv=none; b=P+/D3MMRWvh8dR23Z0WEz3Q+2uuAQmHrj+eUMlKaDIdn/zYz/1hrjZXuh0BRgmjvjt1/KJNpi/h6xItAlyyqy07oxhexuuDFJKUhr9FP/rhJwOleiMlRLf/C3dWJhj8bOSZWZHX/Hypilmvx22g0hJQMSmr/FzSx8lZVgE5fnDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054703; c=relaxed/simple;
	bh=ZxqeS1E771yr0ofEeWkRJncYn+0HDmT7Y6kC3tSRRLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btsRJBwXZVZ3hsNik/xESt1UHdggl5NRWkuRm7+2XWXX0KHXRqh9SlazaQ10ytQMXIAknZ/F0AS+yvfexjS3DKolnoTWJ0AjSbRLHj1Z9mO6D/nu1hEkDQ3/cRjhzUBvY3VfO9PxJRVWCL1rxU3WHcCTLCqoe1O7d8m8vZRMH8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=N4HrI+01; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="N4HrI+01"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso65369505e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789054698; x=1789659498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxqeS1E771yr0ofEeWkRJncYn+0HDmT7Y6kC3tSRRLQ=;
        b=N4HrI+01u32kOe55aBgx/5Fqt1Rgje787WB9kHAqk9J7O1wH86VXlH66I9ZjEsKDI0
         xhaSfwqZPfRFjAE1zozPoF1RO7P/w39HBXbAichZO+q7bASHiuVVx+GpQk4cYnZLCdFb
         i1HwMh8+WOzNAl71LbCMPOxqj9WBOHPX+BD9zZEI3OYDYItiHmHAROZqmCPSUfDNHZ40
         ORlNXspml1CdDQezdx4HXnk6IZYBACvOMAeVX1bxdWDM+F9+FjF9aiAPhoI1lUtd86jL
         WlzJgIWqGLSXK4OzFY0FC+NVZtOa7TaykJNmcVNIQtsNufFie2wVUFizMHGocsY1okp0
         pLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054698; x=1789659498;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxqeS1E771yr0ofEeWkRJncYn+0HDmT7Y6kC3tSRRLQ=;
        b=ZV1Ito0O0x3pSER4Hip8zppttqwypvyRcKVmpwmrlvBmpSk9M1nVPFVIcisn1r4VA2
         E/874fLQF5y0JXXT+ePJ/B09sp7vlNKcMVyyInY1u48t4oKAyB9eLh3Th9Qk/d/4QbA3
         wIfOF7D9y02t5/z1RV1JEyd4cB7YevnUftrkH2WG1Jd0g2bRM97vY/hGZAKpQaSKLFKU
         VzqO1XpTxGzRvtwLRu4eZ3dFcOv0X9b0J5GtYHjkaouHi6vCLU336zUliaGS2Dv0Xxip
         Gc1vLwucfOTv9QidB1NznLO9ySwR9Lc40zCfmMF+8cwAb0//Lwdaow0tigQwYZZNRW3g
         Em+w==
X-Forwarded-Encrypted: i=1; AKwUvBy+Kmfwp7wmQOV9U3Wj9BEp/5wmtvY+x0juSzwHaI9+HLVis2NtISTGe2e2N99ae44N2hYgzyQe29FDoe0=@vger.kernel.org
X-Gm-Message-State: AFuF++msCdjxmzXxEPyRDW8lx4u6u0P6kNDLc/aIm/uP6MlYyc341Qi6
	rPftZifhSS0FT5QGlRCjA9r6CcQqZkRzj19Uh3MVHPMzkUEAYhxUUj48C+Rlh1VygMg=
X-Gm-Gg: AYBFou1FDUudsqojMXj7FdVWVQ4aE24LP0VNaRNWjvilIeso98df6E5+YorIrlG2SpT
	XhGM5ETvhOTka5xAlBger9sG1ylvQTWKvzZY8OVUgXZ4ufO0s11viV71LzE6iNyCKj3TUKBNe1T
	pYEq8oOwJ4MGr1ayR+/N9yNbc43kGxphxAsid6KVhirM/QYRZgFTn+1++owGGL/TAoT0Aoq5Mgq
	nnM8UtEpspA82OFJqtNkCZZAR8c90yhDZoJDULZvnG9i4lecZOvE0Fz3ZDia5g+zlHwmVXgsHki
	9vJPs7XzO/730FGr07qrLSTldcWZjP2lDZXEYzal3M/fuFGWpVQahFHblXt+3pdeCLNNRVwYC1F
	7uCvPRGzryD9iUvtA/oT1XSi2pXCEv191HHiHHnRQ03HyRwhbqyqhVjz5QIhiHCgtdqu0Cjp5sg
	Ubqhsl9KR/OHW5Owb0VHYU2m4ogt5F8EWDzVD70OF5gz4lEFjqOht2nzK5fUm8gQ==
X-Received: by 2002:a05:600c:3115:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49cf7f48645mr421170135e9.0.1789054693628;
        Thu, 10 Sep 2026 08:38:13 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5dcb40b3sm16903555e9.4.2026.09.10.08.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Conor Dooley <conor@kernel.org>
Cc: Aleksei Sviridkin <f@lex.la>,
	linux@armlinux.org.uk,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next 1/2] dt-bindings: net: ethernet-controller: add phy-needs-host-firmware
Date: Thu, 10 Sep 2026 15:38:11 +0000
Message-ID: <20260910153811.778387-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907-shallow-universal-b614da6fe0c4@spud>
References: <cover.1788711837.git.f@lex.la> <20260906174621.4107320-1-f@lex.la> <20260907-shallow-universal-b614da6fe0c4@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 06:26:31PM +0100, Conor Dooley wrote:
> That doesn't seem right, sounds like it should be on the phy if the
> behaviour is caused by the phy.
> In fact, it seems like something that should be determined when the
> phy is identified, not really sure why it needs a property at all? Or
> based on the fact that the phy has firmware-name.

firmware-name it is. marvell,aquantia and aeonsemi,as21xxx already
describe a firmware loading PHY that way, and as21xxx requires the
property for the compatible the chip answers before its firmware runs.
The node on my board already carries that pre-firmware compatible,
ethernet-phy-id03a2.a411. So the new property goes away and the wait
keys off firmware-name.

Measured on the board today, same kernel, one line of device tree apart.
With firmware-name on the PHY node the port survives setup and the PHY
attaches at 7.1s with the interrupt from its node, link up. Without it
the connect fails at 1.83s, validation -EINVAL, "error -22 setting up
PHY", and the interface never appears; the firmware still lands at 6.37s
with nobody waiting for it.

Identification is not what is missing. The chip answers 03a2.a411 before
any firmware runs and the generic driver binds to it. What the kernel
cannot see is that a driver for that ID sits in a module the rootfs has
not offered yet. In the other topology, where an MCU driver registers
the PHY's bus, there is no device to identify when the controller
probes.

One thing I do not know how you want it: this chip takes two blobs, DM
and DSP, and the bindings that use firmware-name allow one name. Name
the first and leave the second in the driver, or allow two entries?
