Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034742;
	b=BK4h8Z/8TDCmaMLQjX60Vzxf/Jav9el7fRf/H2JdsJdI7Wqho4V5F40LxJYIY3iC401P
	 UZ9L1zcj2h05wOnjp8YM6pZj4kVAPefZ6L/UhA27ZQFNJYlL3YszU7K8q2rCxN8It7gR5
	 w8W7hzdUVcDEPCCrT/bJWGVPXxMpGKtGWMOStnQF9LQJRPtv4joAyoJez/FEfE31zrcr7
	 USdz7ARoQBI61ksNMWNLYaq9GSWzvniRDe1/QwtYVRXJg8V391/u0aiC8LUlN8OIqGbKi
	 zVOi9E7mzihCjdIlGi03fZJXWQuFR+tcMPT1W3cwfCCpdFurZM+m9LmZAe3GVKqk/lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/UWa9cXw4yw98mMhsberGzcPxMx0T4HT1OYdgpW1NKw=;
	b=aQtLasSFrvjX0pcfTipSlCb609HH7u0cQOc4LwWcOF22+YpktzxkyJsiCCXoI4gLRHoz
	 tOw/rYr2W7dQHPHgRNfVS1DX0BLUY2vYEPdZ5fxseNQBQonbrPkGNpSwuMSJIuRwIkWQx
	 H150NQAdBjBdHQpw2gahBu3kUMm8Nji24FuUayjGUYLViIeR9Uk2siLaFcPFD/7bWdDSv
	 4mqeypa2fuXsoUF4RKC2snSonvbE9LFyn0HUkZOvtLdCvntMAD/BKEJFa9Ex0EUwkNb11
	 32KyUfMrus0CnWbNSvklHhXCjSY8pyXtmWe8do54H5mFgC+4HOQzg8/PZTFbiU6gYmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hZAvbhrS;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A62606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A62606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hZAvbhrS
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so5889951eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793034741; x=1793639541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/UWa9cXw4yw98mMhsberGzcPxMx0T4HT1OYdgpW1NKw=;
        b=hZAvbhrSMainnQpfsPBEEjcu5q2TyNtUPH1dDMKzJCIgYBPtvQUv/WLBENwclcvtSw
         B7p63z96Dw//7bDqd/WqceKFM5ItJR7cwIGZSp/koDwC3iU/A+DLL34p7uXe5cfZSgJ3
         A80scB7/wdXobGzBdFv4B/k9r3EZCNTWm/DZJJFU2f6cV0KqZG1p6wOnOcdIaHE0BFwj
         /1WJNttieMFtlvA495SGtNISLfvab1BdS/SwoSp7+IkklFEwq2kN9GinxxLQElWERpMS
         KBu6u6lbceDVbSOP5dgOZwXaw4Xap7svxzoBSv9MFbDqedkRCbc6HnU4HB68KIZKJnBL
         KS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034741; x=1793639541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UWa9cXw4yw98mMhsberGzcPxMx0T4HT1OYdgpW1NKw=;
        b=BGt6fLK+9O3GB5AYPsFlkdakPc8kMgmcroIeNCPK+lviGBExyG2jYvoeaYiajzOoDO
         iGxviuhlsYk/dzU7rUaMpE86Ivmkl6s7zPca8qqLG4j/7zHkX6YwaTKLsVMFpa3hoSqo
         uReLNJNPwb4I2N9hW2yyGhzmwADXGI2HR+Ums6TXbYmprHtaSus+OVxtj0Hrss9bReOi
         K1Dwn07xsl7ELBJivxFfCuGooXfSyBIJlLRjgUcZQyNvLzCD0SSPoea1m/v0vsPxQZrj
         0y9NA+HnYaZlPSJYZJYVI4wtTgkWpOAnm3DlYqqKJj0Gf9zeoZzXjPJTqCU+T1yUGYax
         Hsww==
X-Forwarded-Encrypted: i=1; AKwUvBy1g/FmlDQf+aBfB5YhfpmlaKFt1FbKxsGxkDZBLWumQna1IVPwDiB1yiEOVZUGmLtlltr9O036KJ1oFpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtKV2hoIR9ywWe+kTRkrgLG/adwySp4pMT/gJrf0FwKxOLyTnc
	u96VlEgUKdPJXmbnNJuKX0YmuewoiJsBRHxRwridbCkz3aNtctSmExhR
X-Gm-Gg: AYBFou16iTehzXIPHOPbqKbqds9pN7mlzCx14PdCkGxCupbbPDGosxR0gji8vXvBers
	g9euPcID/tXlrWfasTTo4s8YZnp1aOp4p3xPfuQlXJn9iGwnhrCCcUC24Pr0sMYqPXz8ggKZyCD
	vBDqhBemRrMfn7nDo0dXf/FlwhUPV/ERnV4hJbHga6Yp3it4okIEOBgkZe7QA5FkMixey4Hn0d2
	BHpg0Wj5GAGIV4yamesksK0ArKq5hUkPzEqniJ9kLOjuHhspjyclxpsxAbfHK0w0QyQMxMSb4ME
	fEB2+5AjF9Hz69Uw9HcZi3WkMoY4QumI74hIUeFO5iywT9eqK/EhwZhvsWwjc0SN5oSxkYedM3d
	nHMHL2k1L4q36iAD1lbpny/PO25pWK9y2iWD7DHBQM8Vl7rvLtTpmgaisoXVkUjk+93Wrdotuyy
	lMkbQzp/LSrwGLB5W0pl8ga84f+jZ2GoEw6L0irzcPSxYd5fb4llEMjmGMaz29oW779SBxUSi4y
	isaaxuMm653Fo8s/wXDnoIs7PTwEEMgv4JJiZAkQorte5JsfV/l86P0O8wHEI3RvGRzOSixWFI8
	xlDy6w==
X-Received: by 2002:a05:693c:415b:10b0:368:c6b9:d3c0 with SMTP id 5a478bee46e88-369e85080a0mr13138493eec.28.1793034741233;
        Mon, 26 Oct 2026 10:12:21 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm24878750eec.4.2026.10.26.10.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:12:20 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 0/2] net: dsa: mv88e6xxx: 88E6171 stats fixes
Date: Mon, 26 Oct 2026 09:47:31 -0700
Message-ID: <20261026164733.737299-1-f.fainelli@gmail.com>
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
Content-Transfer-Encoding: 8bit

These two patches fixes statistics on the 88E6171 present on the Linksys
EA4500 router. These changes were found during testing using a
resurrected version of Andrew's dsa-tests:

https://github.com/lunn/dsa-tests

Changes in v2:

- cover all of the affected switches in patch #1
- add Andrew's R-b tag in patch #2

Florian Fainelli (2):
  net: dsa: mv88e6xxx: fix 6351 family statistics snapshot
  net: dsa: mv88e6xxx: fix 88E6171 statistics type

 drivers/net/dsa/mv88e6xxx/chip.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.53.0

