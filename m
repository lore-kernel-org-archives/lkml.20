Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763857;
	b=uRRAZ+dYDyvpc5m8OZHMK6h6uZJe+DS9UUkWTVRulWcMQ4ZsSeFdA2ArZN3ZrJZ9kAB5
	 ZXIqd1p4pZp7NPdyZTbECksw0/W95SiVaBGlNDoRPcbVl840uBQb+vpDoVocl0hhEJOMt
	 HQmLx5x9tVGcQBHsoRleUfXWEYAK1XQmZYGbP5r5Isk7YFNSDvcuDmINIx8w3iIfpy+vN
	 7tRXccZ5tbZfi5PNQqbJjI0GQT5LFqejpEt+Z1LcuPxZXEMQnFyfybdl/PDpEccBUiHrF
	 k/qyrYmrxQdBKfzxAZ6WlibalaTcFasD8FBFjMhOGCPpm+Jf9CCIq8NWqed1zVmUjeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4AbJL+GJHDouH42I2kH1rN6GVH0vPYGzrGpyLYdLBcE=;
	b=DhatJukE+2D0NUAvUGsGYEAVUyzRUJ8qLo+I0frB+qFtID2VzOBWlH1IpT6LntXCyk7f
	 IjcOQGSPToXntFdTQB3tRXybkDGY8o3fnzGpnLVydnR0+go9beQN94L2bYLXExeznsGHf
	 /2cgPE3FwFOHdmFfkmui72VdqbZ4k25pQkrfAlFl4z0ImRkdbXJljH5//1AKPhG8mtFFP
	 eEVygLtcLKvcnIY0X5dkDD8QEssfSXWgOGw7qmOCgzySQID6huovEpBDOdhdGby8ibBOH
	 0/ziEu468Hmr7aEx+NFNb2z8gjro7e/T4bd1aJj0mRlrVxFJopmB4k/Swe5D4tFtxpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IoUgnSG/";
	arc=none smtp.remote-ip=74.125.231.75
Received: from mail-oa2-f11.google.com (mail-oa2-f11.google.com [74.125.231.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FF3606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8FF3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IoUgnSG/
Received: by mail-oa2-f11.google.com with SMTP id 586e51a60fabf-462dec1c4c5so189616fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763855; x=1794368655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AbJL+GJHDouH42I2kH1rN6GVH0vPYGzrGpyLYdLBcE=;
        b=IoUgnSG/1IXtQck6ePr/QnEL9a1/ILXobXrtHcErpAqPAx0ko6ZyeR1zGhsmEy9EEY
         I2AUIec50/7DpfKWLhaK9xXcGJFgp8zb+EaBl5/gvQzaecaqg4PK7//1x/WbI4WKSTlG
         l83DjVGIcG5s5yrQsH7gwJnBOPddSDzfkch9RCrAsqwHvUHGGEhErpt7VmYfMdv5icRI
         5PK39lxW2S5aCUmV4b2Uy14fmiHrbxnNCadXG1elU/qtwXq5UIxVTL8BU1C6Pfa0QcbN
         2eR1WB0LJAlQLNLYCTPDyYJgRnshlRRRdkQIvzJiRMrmHgIY/e/rTSoY84ssytW6CL8I
         6uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763855; x=1794368655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AbJL+GJHDouH42I2kH1rN6GVH0vPYGzrGpyLYdLBcE=;
        b=1kR8wDsOOP1dw5H/6ZoXUEakPrzIY5a+9Z4TeW7I890NrU24Klt0bTBBNZJf3OIlf+
         JZNXgZfSGk9M3h+oDtSP9vfVnoNJd5qEoTsZRkfN4wh9hVoRbr0sdAxFbzDTZwfMN1S1
         vtWUv3dYzYGNvU813nluHVDTQxMU9rORHT7TpBBDodmNewIbBlBhz2WHpjKvKVp+uxos
         oKNoIuy378NbLeA9yIHfp8aBFs9sdFlPKCbp+2+iZ0QpUrgcC3dd6IyLwlfTn6iLisHp
         t6/wYd6C5OPnZ8wpEYuzlANmtEW78x9I5e4GGOG8wqmKupAr4oL3C7ZP8hgRvZaoCkby
         0/EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlzTUXkIhRyX1LLhcSRq6mHs3+66H7sjdHDWB0awuT4f0A5ulDDhoJ2YC4LlVoMh6B2POyHJ53xFS77Gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FGH7JL89D3pmQ2SAGq9WaDIo3Yz2QEoTiQYaK+s+4L1rJfOLX
	XBEpSQ8zXcfvlF2KBSA93QegxQrT3/vH/tLA1mVSHc2s+ODQNtBohBup
X-Gm-Gg: AYBFou3XEdMlRDBDntpipRyFrokrj4Dq7TfwglmRTaa2y1VnB/v1rw94oUa0zYus23j
	vmmk1+IvSHtbHpjpL2vQQRDKiTCNjAszxpcooLOTGyeD9bFlCEzQ3qs2XYQt4K0rcQpXHiffXJZ
	bZXA3d2XZkLJfdGdqKBziK4ZwEZ4iXoHfkqMQRtfk2YGmf2RmGrdDcryZk6MtUKAyOSYVkYKVWU
	nrmJR3U/8cQpwgkFACLpth0uQJuM7J+K4aVM7tOfIvhgKsjp/XXht1PClJjLZltvLU5/SdXtb61
	oJpTUsfx1T1jRfOJhpvqtAC6tZKEA4nAV3rWUb4pqu4m6cmcrsky6EO3XBsM6+JT2ABV1TNMTFV
	f9/STUan4GMTLcFNFEsOO43xY3dVryfOmlBIVDNJvhF21rvjGKqrBGEvM6RtMxOlMmcMABrKsmf
	OpQcDiPLcOureBJ3o7dAhF3mYScd6MzQnubljKEkih2eChDdePbIZJ1tT+pKS6JnZ3e+xGtt54L
	5QzPkuL/ZEVa452fYSplfffq8w/vJSCWYUWcKqiiwzwyKrPm9uCZcW1mcWJrRXqCasm7eLbJyX/
	ZMx6QqovUY4JGD0/MCTbsiZxGrzNaTXUl0FDOlWR7bSIbGyBBHuF1HKKk9CYWEI6Bi//
X-Received: by 2002:a05:6871:2b17:b0:494:895e:c3e2 with SMTP id 586e51a60fabf-4a90764ca88mr10001468fac.20.1793763855511;
        Tue, 03 Nov 2026 19:44:15 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.38])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61d382sm838651fac.13.2026.11.03.19.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:44:14 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: netdev@vger.kernel.org
Cc: julius@bairaktaris.de,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: Re: [PATCH net v4 1/4] net: make room for the tunnel header in skb_segment_list()
Date: Wed,  4 Nov 2026 11:42:38 +0800
Message-ID: <20261104034238.676662-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <b27640960edcb8e072fdd2e8d282c1deee747b8a.1792838740.git.julius@bairaktaris.de>
References: <b27640960edcb8e072fdd2e8d282c1deee747b8a.1792838740.git.julius@bairaktaris.de>
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

Tested this on v7.4-rc1 (6628e7d4c6b2, KASAN build) with an
independent reproducer (vxlan, fraglist GRO merged segments with
2-byte headroom, software tunnel GSO):

- unpatched: KASAN slab-use-after-free write of size 2 in
  skb_udp_tunnel_segment+0x1360, then skb_under_panic
  len:-64444 put:-65522, panic;
- with this patch: 149 GSO frames over 150 s, all ~4.8k
  segments correctly forwarded, zero KASAN reports, no panic,
  system stays up.

Tested-by: Henry Martin <bsdhenrymartin@gmail.com>
