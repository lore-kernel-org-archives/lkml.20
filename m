Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162725;
	b=ENDfIWdE8a0MLMKPNOIetVbwOJOisoSFGIDSgORjvBnIzyU+1nO5vbSHPB1cgbCUrCYf
	 jzpuv7yZ6N5X7eSI8E3YzD+lkRxDwLRqsu7SD6Cw5j8ynd5xdliFito9yM4h0hyPwv/3y
	 RFaJk+iXrvqKFKR8ZtVGL5cVGUyGCbRCcHB+6Px0Kr+vaZ8DfOit7evH1MhCVUDVb1dxv
	 Byp37TJ+wd+ttWFBAI22ojX3MyLJz+BRACCLn07MzO9o/WQNV+fBR5e929wrqs45BRTgk
	 uAz3994KF9q1dgHrTfg/2P3sa2RbYzAho+XQTofRCX/MSCCUZ4S9ESsaVBR0efsbcFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dFkadmcoyh6vL70GL1A4zEl8wwQu3kHxlpOJ4h+0Quw=;
	b=tDDPx87tvovS1qlryPx/Ze9HwKugku8AiaHLryTs5qMVl+StGafgXizITmFsqSldX3lS
	 KTw/q7mmWK7U0jZd903fi6mHcC88ObciUGW9cyznnEg6ztxhZIt6brRjoGRXXr8SR1IXl
	 gTucUBR20VJKH7I45epvAXWDdB4vRdC6xQGyCYgg9G32qC0m4SVytJXMQFEj9IaUWHJxV
	 FYUg/v63OgSG17TBX2fZYpObif2CmMN3cRKnvQGs1m3aqz9zj+h95Bhz1BjKr+3rJpsnJ
	 4xU0KOo1i7JXlrkh8sqd1xIFfzBV+YdTCjoKf1uICIPgevTLhV6/0rkzw/GnQE4rm5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IJ80/boD";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856CD606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 856CD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJ80/boD
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b14b96448eso21609a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162725; x=1794767525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFkadmcoyh6vL70GL1A4zEl8wwQu3kHxlpOJ4h+0Quw=;
        b=IJ80/boDQtMRoIwjrZsUSJQgl+ycHU6Grft8+P2IPGh/JQ3W+dE4vtcvHfk/sSqh98
         F0WVJbH70SFLKNeBMNnyTNLf9MSEw23N4XCtkCGWhf3y/GDYlFDYxHGsFwqJH/SS+tNo
         CYgtiqfa/cE19pJQlOI8YX6F+Rm7JEM/Dn1V2Z33eWdAPKWNpBCceOSi80fDBVYxAcyy
         DhfbqGkrNzThf+U/pW9nSm/S7LVNCVZSFnUzb2EzAPfNQ9eUrBD9FeaSZSkwv6SbkJhD
         bGcRH9s20alGfUvsrx299D129jLpAZS9t+iuvxNH4Jxudb/bfK0k+0B8ck+alwYGDjCj
         7fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162725; x=1794767525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFkadmcoyh6vL70GL1A4zEl8wwQu3kHxlpOJ4h+0Quw=;
        b=EBy+JEszhTLxSjxug/JEACNtTxYK3TiFPw+cX/Yob7HVuBq9f6k6CVomB3eeQJaY2D
         BlODaiqAZGXNZR1MtV0aELOPQSwKU50WONJQ4QbbmACkS7icmQkjqe7RndYagiUMSDL/
         Lu2fodMHNoKUSBsx9t3V32La4r/9OkAf0GTDAUV4707GP6ncR2Y5F29xzKJZSxptTb1d
         2HNlRxWFy11s61qVJFjiZ/5Z2mVf3kfRfCJefWAwk3TZ7SPFt4WZiz0OzMcgArcGKqZH
         oJITZRKlxXTEFhKp0KHeof2eb16+kbXGb5OfCdWsgnmKiJAr2uCcsYQ1HfYCyTSnoX1U
         t13w==
X-Forwarded-Encrypted: i=1; AL+hErH+YCJ5LhmKrxEMkEKIopfphBQyjOGRUnw+yBShHGHmBy0e3WS3iIX1fprlqqMtRqCg6jnYQWqOwSRfxKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YUAXz88HVYuRVPjtYgvdyQfbCmNwcL/4cRVqD38QGuyYlWjvK
	CEHmZ+GFfXkAaY8h99rsvJsoTHeOKhqzj+fpYUB5pof8N147QoCvc7oP
X-Gm-Gg: AYBFou3QtU1bDEzP+xC0IpicxeBXoYqEeOJMDaq0rDtnInUX1zHkPFlaUOsUvPH1knN
	0aserRodpxCwgQS/u1vBaU33CB/Cv6l9AnBN6w5hL8tJkRSJg3kjT1QwyNRH9QnM1HP7zFOl6AU
	j8E8JTAIkq4Phz1H2ctgeGk3e2EcMrQXMqrdszyXxVMS5hFZ8a5zmUPbBsyDb3w+5PMfLqgpi4l
	ENYt7ASIhjniIw/QtQLsyblqv9/7E0sQnTaVlYIq5XMswjbivnnr3ZWG24MzXDDp49T70cuod8R
	WuX6eG8XCorTL4A/vJdrHgSqekmyy+DQf2fnU8PwACJzGugC9JzUTurgjSRrQHpXBVE/Tg9duYH
	sAEVWgabKrN0Dkjpjwyadd7ydCyY0kOlLIGjoUbzQjEsTLnhG2O7+PTEHnIPY8XfHltrTrcnynZ
	p1t028ENL9kUfssEfy2vYRYbWeFyoRLQWF0bGQTOCaBs84yccGLCObhcGP5eLPj4QKY17+0QUfX
	PbhSS3A6f6NwPZh+5l73mmjsEzCBF1zznD+MO2UWT8v6eDXoN1gxIoy4uIGS0Y7/pViC1nMCUUc
	U5SJzAB6jgKbjrLU1Uir5AG6k0DSydsEx1N8RiHG5QZr/ve82GSbyg==
X-Received: by 2002:a17:90b:52c5:b0:3b0:9e2c:9b57 with SMTP id 98e67ed59e1d1-3b12d1087efmr2244213a91.4.1794162724579;
        Sun, 08 Nov 2026 10:32:04 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm7600534a91.0.2026.11.08.10.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:32:01 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/3] net: dsa: motorcomm: MIB fixup
Date: Mon,  9 Nov 2026 02:29:25 +0800
Message-ID: <20261108182931.1542638-1-mmyangfl@gmail.com>
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

Various MIB defects, reported and verified against vendor doc by LLM.
Very low severity, target them to net-next.

v2:
 - fix issues reported by sashiko
 - drop patch 4
v1: https://lore.kernel.org/r/20261107132040.1066996-1-mmyangfl@gmail.com

David Yang (3):
  net: dsa: motorcomm: Fix stats64 error counter mapping
  net: dsa: motorcomm: Fix RMON fragments stat
  net: dsa: motorcomm: Use safe 64-bit counter reader

 drivers/net/dsa/motorcomm/mib.c | 43 +++++++++++++++++----------------
 drivers/net/dsa/motorcomm/smi.c | 35 +++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/smi.h |  2 ++
 3 files changed, 59 insertions(+), 21 deletions(-)

-- 
2.53.0

