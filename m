Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384386;
	b=TnGaNg9f089SD/ugLqxrhjYLT8c8U1Mx9yW7NsItsDlgqrJ8+SWVeFMcRk59G7VNDtO1
	 uuYXlPKrrg8fKHoy6HFLCW2Fgx7uZmi7a8M1JFECASZnmvgjgNIQPc5KwJ4CGb4GWzuxt
	 YwE9il6Xj1NyLHxBVL9znOseiKTQuJPvLzGSLj6VSGnp2kFDz6EC45xww2snT51qjuVnB
	 XSL//ElcvJN55qXETpazMln9tLa2bPNO8ye0dW0pIe6kfYFMWvoxwVcF5gZA6xkdvkC6o
	 6/pM4Mij4nhKmjhb71gYa2AKGgOGlM2cEXQnx+OOwwf9WPnim13T0xjI2Fa0aPNsF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
	b=CFpSEtwOgdzQHKBpJYUF7nIYpyPdQb/2z04BQMo6WW5XhT3yyNGvpBx9/gY0lagcLE/O
	 432BYz/+hEQQntXqvoytA9CByedMbZ/mPROiLNmw+K0evE5MKDTbfkrQkArFL5cWNi2pu
	 +68ozsLbr9Xamx77+fHPnwjwKBiafOX1MD8qUzeCNsVhBnq/e66pcvUW/fHCvXQNo4o0w
	 sstiLWkcWrEDzW9I3sBAKjlRczGuZdc9Ayv/Fyi900bAgAOLU1AknLKoChZITUoA6Wwi3
	 Q/UF8O6GP0tHl7G+bQ6+VnVy5x+AVyaHWvg27JrCzq9DmXMBDcSdcNxZEfhWPYIMnhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=NUC4A9mh;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CDB606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0CDB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=NUC4A9mh
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3364866a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384384; x=1794989184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
        b=NUC4A9mhEV5EFNtVJmUMjR1IWO1JU9ubPwuA7ZaHgg9V8BBJYZ10BrhMQFF/eQKIde
         QFMcuXy8k7+NiZf5hhmLvCi1VyMGuVGAZBSFEKQCpWI7VYwfCr/81C+3dF415EFErq3+
         BMPANWUEm4QHlrsI/bVM8HwVt4BSSTO2mcpKJuIYdFyg3LF709mbdEwrhfquYoA48tOU
         4AMBnOIrL4LgkcQkNPENrneWO+xYmhp//e0mhf986HqEvwqGetyM1IiW7dl66Q/VueJo
         Ix0Cs8wAYkYbonjqXUtuFB6DWp5NDb0GxuXrZdXYp8aLtCtweicVn1sUHTZTmL1wk0/p
         qY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384384; x=1794989184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
        b=umll03ME6qW7gsLup4iWNolzTBabtrfRybaEpWkF6BHfMYvaTl265FppFgUUcC2/j1
         o5KXbxS3/aGaok3rlIhhuL8d44yOeUqtzl0hdAz2WA5nhQ3QGXaCuFbcXpvZLFxoygy7
         sNhEBZ7UwFxm3C5Th7JazA3xne8PL2lDTj3mlHklP0z0r2scsYMuERXE+pyWL66XCvjL
         412RXtraJjHtq5U5Lla5RV7n6COjrRoA8en+KHS3OExmDCrJYw4eyD8ITp/djELU2NiG
         vNbmrD6qO+fDRE131szE3C5D3aTSjddfBRyRISxudE1Ns282mLkD0ZhC+eHtnOtMk5Zj
         GfjA==
X-Forwarded-Encrypted: i=1; AL+hErHkqIwGTtQZHKSwASwKf/tX3YGbaKr/BJsxl7qn4csKEKVS8PJQWpINrqNItP2+HJNFkRyMKMw8hG3TmWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DcAE6entGRjdXMZ+rDkUw5gZtPb5WJC6VtsBx3abEVrHZJVBP
	w8ubHqQX6BecKqZSpJyeHHqJbVEhl+pGXvPx4kmdJ3HVis/6/PFHzmKSoeQAupwjHg==
X-Gm-Gg: AYBFou2bkK1yhxtj3RuHoxb8hhpYWlDS3oUZPwCnh2oqEddlHRaX000nkvkzPsezLtR
	1Htmx/JQTbQpqaf8aCHXBOH/5Wm+m+cb7nJMUM1fzgbce7Z+9uOCNmrY+3c9eyg8gWrG4nl8xWI
	m2bMLP0ghqTLZXcG+0OKkEkrLckvIb9hlUsrs8XTlk0yT0VSLb1tssqmk5MT17oMhWHSGDzZQ9d
	kGbn7ZsV21jpO/wnsHefOcqdIUsNNcdVxR9b2fgLVwMbYnMuQrsKsWhfT0w5f0120lOQq26DKea
	kdxITkOmOJsAPdQarraWD3qSN65wjbNHRHFIB5YxRz7MKhBo5fitSRexJS32vjPKb8jm2nvnGV4
	6eSHiRQqenZHArkFFU38Vis3GRD+69sEMGHM1iSh4wLy/+X8TVPe2n1YwwhNkN2bHGW9C2LSJGs
	g2vARvu4iv4RWPNXlGhf6hx76zkw+9Dxh99/oZ0kRNvFiwwMFIzQfsYqI6eKLtkFGjf+IB31uKG
	d8jcE2ri/1Ip8Vl/vuTfW7nO4NcvoU6HmDxQOK5sAE7E1z9IHv+jtuzB5PHAkL/ZQ2QkOFs1Qcn
	Jx9ByIyf2CX0xSfx7emzvwzktCr5RDlBWESo7Mi7GF1QpRj5K5I1w3wpLkDe331A/6wmP1kpoIk
	YdiUn9EyVsjndV3ZA44JEW6VruiHE87Xve+a6dTZNFBScVgspOr/oXbz/i2yhEQ4i1ThsFs8OyS
	LYboQiyrE/iydkpb1McBPBkiPSaOWHtfroC98cJdkBVeSiCwdsgWbUpRFIbBWuh/gpBCgaueqyZ
	UrMXBvLxTTEdHqqM5LO8I09jybAbtUkbDYw/o3QZ3BENk9myX8CVOD47RwvK4s8lLi+3inatVhj
	AIVLXASekqZ+1BQeleM=
X-Received: by 2002:a05:6402:2346:b0:6b7:8b36:93f3 with SMTP id 4fb4d7f45d1cf-6b78b3697e0mr354778a12.23.1794384384000;
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:22 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:18 +0100
Message-ID: <20261111080620.244164-1-julius@bairaktaris.de>
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

ath11k and ath12k check the Michael MIC of a reassembled TKIP frame in
the driver. Both compute the length of the MIC-protected data in a
size_t without checking that the frame is long enough, so a peer that
holds the TKIP key and sends two fragments with fewer than 16 payload
bytes between them wraps the length, and michael_mic() reads on from the
skb data until it faults. Each patch drops such a frame before the
subtraction, as mac80211 does in its own MIC check.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath12k: drop TKIP frames too short for the Michael MIC
  wifi: ath11k: drop TKIP frames too short for the Michael MIC

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 5 +++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 2 files changed, 10 insertions(+)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.53.0

