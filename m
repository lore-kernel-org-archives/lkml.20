Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221578;
	b=bDWbvqCY0CRtbzCAbaR3k2meWQbhybRPS8FUtQ4+ABAx0BOGYtVLc3RrvPCTKI/0Qe9u
	 Uqm4DjwyoyLBhr7bM66+sdBrRXiSd4BhhJKMhvAygFbquNRpvFwMvaOF//gsiF9hojTiK
	 aRa3oq5dlQuj8eHuXEZyscFXDM1wiLn9/8X+3CK1Vnenx4fa3Q+MAAG49+H/omWl5j6NK
	 XVys9WtE2Y2jUwHTdfyaMlsWWmyrapSOjwMnndcMNsnV9+omCUwjnuQPm4q97kt/adc7E
	 Us+G7oQxWtTVh3X7zeP+tfS4PVZ9dHsaT3tnS6Mpx40tR85AyHu/90NTUp9jEYWTqwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1zQyQfd7Pg+TzVSNkwUE2q6hgZHqlG+eVtCLMd8G0fQ=;
	b=KfjV3kDbXm7ox1Ue415BagqUCE1SfjwfFRYQy1UTFUJ98+ZuWOlEnF1Jd9DEQVJW/qm5
	 HSH3bfz+wCbhvrflFx/7nAmOb1gHF6a/KsMw7BVsNh0DXtlbXiwIOhw3MacuUTVsAZipI
	 CiZ61/mSKXT4L5y7G5u2MdO2sWvnHMHkPB4l8q/fXGu0YzA8VaOp0914rcRjdInGIEH8p
	 vxyekSK+vHeLtn10T0+nj43zL/E6uGkC1RowxlvEkTNBMdAdDjhrVnMabkV/oU6lE+kV/
	 09iBC8+dk0fFv6fd2Ey8CZyiAgP/Fv8rDLTAnHI9h1SfQlmXyAfPlQ0i31JnFGLN/ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=mrbtu23g;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CB0606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88CB0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=mrbtu23g
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae18eb9b69so701198c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794221576; x=1794826376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zQyQfd7Pg+TzVSNkwUE2q6hgZHqlG+eVtCLMd8G0fQ=;
        b=mrbtu23gmpxDhvj9lIuLzVAcy9ggR/dACUCylfJdr5HPlW7rbfwu8g7y6HvT5aCGLd
         EVv2Mq/Uqm8mrnmUcoSZkM7in1s4s9q47VGjkIfbLhcbJYpCrA4mGcVVo4vjd6fnrpce
         UHC4Tncg/hnG3BZSBbRALWFbLbTOd5B4RyFy/BtFzoP2k6xjKNQPcnIQGvL5oSkXbtRP
         ZMpCCx8vTsm1yg5tyx2DkAtTUA5EkLqkb4o9KChWxZRoLw09fDagWW5/mPV4ADn1VGze
         tCgtC+9kVwqxgIGUDbEDBH1BfwFoCaYdI6yvrPtaOODI8fZmLx9X8zCKl8K0pcOSYsyn
         tQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221576; x=1794826376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zQyQfd7Pg+TzVSNkwUE2q6hgZHqlG+eVtCLMd8G0fQ=;
        b=uWLGN2RKfczZvHkgEF1bdtgC95B9wQDA1hnwWsg5lPqfUQNcgE8Bhk4g7oFoB41Z9W
         eswt8A76Qhu5dVmiKp3LBBeJmF3ZZqc5OFmFPjFLyfpVhXhzd5BOdKsBOnXAJDNkftlV
         E11jYMpRaBgrmSKnYC2Eggei+T+d4g8SaBMSkQTecpCbfJI2xJnF6kPOMacFw9t6AvPw
         xRx82dbyIowMmBZjX4QFQpNSiAMy/7+NK0febqEritpkJgqOVHXyhRjDh+Exmrsk9zeJ
         /fuIQeRZez8jSKeYfzd+0Xj2rECLWM6jPbGEvYr4jgNGvgJfLCKgsMDmw1nIjIjTSNNq
         KVIA==
X-Forwarded-Encrypted: i=1; AL+hErFBR/086V4P+09RbVyTkW3/ck6YE5pxkgd/eOjhEXsC1fxCwHTrrueVG6CLUc9O0//Vlou45k4+ex5www0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HGLWnXN9bbSkzgJQoX2WTfjnDwzexPw7NtoKeL3b+7R/3iA8a
	U4XNf5KiaCCvVGiCa94EM3sZN4pB5AJ+REweOHCl89bWXvwCz1DTI0fzalpAvtUmUw==
X-Gm-Gg: AYBFou0ULlmr8PnxGWbA2DMYsiWRvYP1jLGeAq19uCwiyI+giBOoscyFOe/R70DEyWH
	BNQoRuNLlNAeRQ3kp4vY3eyh+n6Ep7pXIkWliPDVC+1nGAQ9ecld/i/wF+Fhqwcl8LkNRT0k/4M
	q5TMXiqVLzgXetk1ie2oiHbJ4/NCQi5xnD+njYix8gPs1PeX5tKGc+jlWNORe3i9EvXbGDa5lM/
	T8cdlMQVUVQn8L9q/L11zUwnxLGfUN2gDfcB9J7zAjR+CtV4LxUfT6Pi3Xb9L6m2WSz3Tc1264v
	iWvHdTd+W6f8o0Kn0kpg2PkheFq9LYTbVVnmijnRwb/vq3vDuXXX6JYmZhBAxXig/pMahpd1nNx
	4ZGmH4MmOG+d3U91ymyugeZnGl6JbeKJdu0UG2OBzXaaXGJATMkvIpqJlHYFFL3M566IHvK1PLd
	FMPH74jM21BMj/xxDy1numn1QdsMyq21TKFDEbQCNd+LN7/z0rMSe+V+Q6Tf8g02XTOT/oGJeyW
	Tz/dBpYZ5Aa61xOm1+ERwpnkPqqdQIG9PYva0zL/82lzN4nBuiGCbj1s9ULunEdGBpQ9mzJJ0O2
	2OzfTKGVTpOLzEOOKMhSbiIo0uBc2jSLKLsGFA==
X-Received: by 2002:a05:701b:464b:b0:1b2:6855:99ac with SMTP id a92af1059eb24-1b39ff1d913mr5044256c88.46.1794221576448;
        Mon, 09 Nov 2026 02:52:56 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375726fd1sm12228744c88.14.2026.11.09.02.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:52:56 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	Chirantan Ekbote <chirantan@chromium.org>,
	Greg Kurz <groug@kaod.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	v9fs@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>
Subject: [PATCH 0/5] 9p: bound zero-copy error replies and keep flushed requests until the device returns them
Date: Mon,  9 Nov 2026 19:52:46 +0900
Message-ID: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
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

This series fixes memory errors caused by a misbehaving virtio-9p device
in zero-copy requests and in the flush of an interrupted request. A
correct device can also cause a double put, which is fixed in patch 3. A
zero-copy write interrupted by a fatal signal can also overwrite a later
write to the same file, which is fixed in patch 4.

The patches were tested with QEMU modified to send the malformed or slow
replies.

Lianjie Wang (5):
  9p/virtio: clamp the reply size of a zero-copy request
  9p: ignore a zero-copy reply that arrives after a fatal signal
  9p/virtio: keep a request until the device returns it
  9p: take the tag of a flushed request from the request
  9p/virtio: keep zero-copy buffers until the device returns them

 include/net/9p/client.h |   6 ++
 net/9p/client.c         |  19 +++---
 net/9p/trans_virtio.c   | 130 ++++++++++++++++++++++++++++------------
 3 files changed, 106 insertions(+), 49 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

