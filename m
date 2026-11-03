Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699762;
	b=a3fC5o65P98DDhmEUow13s2I8umlUnUNJlHSXftkGQr6VaHFuSgTBkSa9XEe0NCAvhZN
	 1Mrw0CPERgM8SHhrN/I3GOWwrTxK2ODj3ubVAkzz16TE7cZTsxxU0E2EvLPxe/M51Afhx
	 YHC+J8o7r7XD1sKpWezyeigMjV4BqCA9YDmDf2JgSPyhkswvjBAeDHpdJjAbZTcmpD/sO
	 VUvW0TxiCn3qSkTE4XuED1u+YmKMetK/PrTCcz1ENZPvczvcsRJE9113XbKpXbGDObcSg
	 hwbyM2PdIcx9P4/ze9HRrGbyFKT8Ea5cxZiQEL0bUxh3x7gRWzF9QW9xdpaSubwi3vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZhlFvLGCrbcs8sxORBaYOZNo8wD7mjZ19zKxzr41P9w=;
	b=F9RjzXhAoYS3Fpv7GTqtZbmp7K/eGhDXJFScznn+Yj397dN60VCGJPjb1ShRMk4gF9he
	 fxjIai7oIAnBIg5AL3UXLgXwX4jydE0bjeSxgkf1YIpr7Olr++hetd83WoZGqI2jsSg7m
	 DlHuAUxhcBUJY+0qCYIzA5z5/4zulgGcxVOfg/C7ClUH2UnYzmIHVpNm3+oTTgWfQAT2E
	 jOJSxPrCTtR5kIKyzchaX5aJoU5v74wmAjTYwh2q3iE2fTfBipIC2KZeoqHZtoX6M2cqn
	 6V4DtMICS9DV+vrtHSe4HivFQM39ontg8Rq3Pib/g5zs6/KRQ4VLHTqW7X/XogdzA5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tw4mSAaT;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAFB6083632
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAFB6083632
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tw4mSAaT
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2117007a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699762; x=1794304562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhlFvLGCrbcs8sxORBaYOZNo8wD7mjZ19zKxzr41P9w=;
        b=Tw4mSAaTJL/2ywfIbTue4iPx4IgxQ435oPnXw7BCDXHJ2QE/HojChsK7gaHZ7ufDI2
         fNdvTKtrK4uqhVXpwVphJKASz5sc2PXTWtyASAx/olcqX5hlCTgp/kSDSxSLAJ7x9y0f
         UX2zgC4l7W7M2PGP+guSo95w8HVq+FU+NqJvk29/8t/1K2p/Ne/KmqBVuvPowZknqixJ
         aH/UQLkAaJezo7x7zJYucsMt00w00mjSjNrjLKqYlhtwsegCfFnEHmIGdDrLdKRfrO3K
         kjn7pBdFhlJLXSxr7Hyi+gD0uUmCs1JaWLIqWlwMHiY41Qqqfe9KwfsfE7lxZrus4H2x
         RBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699762; x=1794304562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhlFvLGCrbcs8sxORBaYOZNo8wD7mjZ19zKxzr41P9w=;
        b=AOqqENrqe2lyylsm6p2+8kSKClB2sUNsm08CkaRd6RM7A7Y+m5rPG+87E1MSqf+xZk
         72TcYsGm/0HI53pm40VjUqN0kpsuKfgrSoyF4gNx6h1HB7tlyWNxtMnQr4N4LLGZYMxG
         T+FEHtvwM8FJcB2M1LTS6o0OSbWshJv0m+PXyHRapCLHrDGLxSSmeIQjPtshgaLhuJi1
         iIiIEtvEtQiEfKHE0pniSsFC7T8izZBz+SCumh1PN8ETYV8r5gzh8sQ3D2z4z/2EjML+
         m9rRh1BFPxXu+kaYM3CGaNG5fVzOnRJ4dpZ6xj351TxsMd7//zABbuqAw74oiweQCo5D
         r3OA==
X-Forwarded-Encrypted: i=1; AKwUvBw8leF1k/S4JWCiVQOR44GQEyz91fR6YDqbqA8taYgGvBg0QNxd7BZVez5NRNkynAd3kIasN3Vx1N7bVK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yQOMiEcpNEaIKMGQmgsJtOS4xnAW8xy6UPLZHb9zg/cf6xoSZ
	BjRxd4/WQFo4opZoORGQpP58Gw0P+uObRJ13XHUgTrugyWd89QnPUJ5o
X-Gm-Gg: AYBFou0x+CxVwO75BGEGbbg1qf24Nz63Bx+VnHxeh6tXcTgG2TfBr0B9MS4cVR6EdYT
	pdDyX9R3SS9vLFxqurbScZvD/46YfK/VpAqAbVVNvOKEf3u0O9/DGX+vH7vkwhu0EkJS87yLf5R
	poz+NjMwR1i2ofc0CYS6tAZe3KuD3eLFnKPciLwvo/Af4INPWVg85tN2hMZIetdGjEY3zTbEUVC
	g+9klgUk9OLmuACzCKhRIf4/k8s3vX6+EE27T91q71H7r3utYKfJLeqxjfAdjzQK688np5b+d2r
	FX8ubt5c9KDJU4hGoziGJUtE+0fgTLDd6whP29FDK7bYYWC9L1ryqPP8iyFrmIlDFWgF8wlONcI
	ktAUa/QS7eYCRvyaKNXOlljXDnfvJiufTDiiYfbphNGyuuCohiYfAxoMWLaaCxkp0b7BAWD772m
	Lq2AGZM1DWUeCeyWIyumorJijICnpzNeLWHdTGj+iOguPKqj5S5xMVgmCPUTduXaqOSRCZHCH68
	VdtuBCDv3imfcTvzTDYT5mtp3p8iK4Bd/utwK7IAEkiy5IxJ+ku4EbsK+Z6rvjtEDCISXtV0udi
	tOdfMCPBtJ5ud5y279cwPbDfx8dOd7BnyA/KQhmSCuhQRPKErsOm
X-Received: by 2002:a17:90b:2741:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3ae896f8304mr10589297a91.10.1793699761834;
        Tue, 03 Nov 2026 01:56:01 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm3488954a91.11.2026.11.03.01.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:56:01 -0800 (PST)
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
Subject: [PATCH net v2 0/3] net: dsa: motorcomm: ACL fixup
Date: Tue,  3 Nov 2026 17:55:07 +0800
Message-ID: <20261103095514.338700-1-mmyangfl@gmail.com>
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

Various ACL defects. Found by LLM and manually verified (on YT9215).

v2:
 - withdraw patch 2 as it needs another test run on the device
 - fix patch 3 to align with software behavior
v1: https://lore.kernel.org/r/20261102071119.3435180-1-mmyangfl@gmail.com

David Yang (3):
  net: dsa: motorcomm: Fix extack message on unsupported TC actions
  net: dsa: motorcomm: Resolve the flower action list to one ACL verdict
  net: dsa: motorcomm: Delete the ACL rule of the port being unbound

 drivers/net/dsa/motorcomm/tc.c | 86 ++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 40 deletions(-)

-- 
2.53.0

