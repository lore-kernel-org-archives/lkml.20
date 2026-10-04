Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C401484882
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149082; cv=none; b=fYBCQvSI1jSu+o3FDeQme8lKcF0sDVY+V7396ClCFHeBdKCZCMNcpIFI1Eh0HxrLPJxSk35rwuviRAKzNf4QYr/pQ4rU3PoKh/K9RnFDAz3uJuM7AnUWEaSILUsv00kXHdw3xpRW4YQ6xRh5ZkG3a2wFHa2EiAMXXu2d02NouDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149082; c=relaxed/simple;
	bh=g4wrCZPfDP7wCd12CyPcGfR1zTDHVfS0kS2wAb83fj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwM457aelG/5dYJ4El9yCWpsKrWxEMmIguq5UeDSj2xwM/XECdmQ+vD73UJ0fF92d5MSXrpEs/E1Z56Jeg5Eyt9sRdglxXVXG2SCv5Ei4ntmryIT5ZmjUdjqtMXZMWnQiddniRmJQkmNpqHl///p/BYJ6pio1obiY06ks7hdINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCUpQU01; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCUpQU01"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1152525f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 14:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791149079; x=1791753879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iquxO7jnYX2lg3f86GXs02ckl6WQPTZjoaobmRLuQcU=;
        b=CCUpQU01Lv1NGE+Il3KDrp25QTAZ7kx6DavhIz3lMYR2bCTzwh2NIkk27IiSkGOfJi
         lqOFssOR4opwNZV8pQ231NsSq2d7xpHAnsZiWqPCEat8Ql2rGV3i77lao7sbuR5VpNHA
         WB4bgtrPU7axCCS4yEgTFGerXEHg+Sc4eKBFc92K+R4IoT6tSSefqdjwZjK24wCsuRUV
         Hq6hVIHMIxSpLCAB/XN08xnz4aiR9kiLADBtADMM/EoeRjUPkcm2BejyWZpVZg/HArT2
         dQdVB/gCI8t0EL87uRj4ZOuReU+bCGPYUhHHuXu5DSjn64Nvz9gE0frIEDRJVjg3t8/U
         xb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791149079; x=1791753879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iquxO7jnYX2lg3f86GXs02ckl6WQPTZjoaobmRLuQcU=;
        b=oDB6useTz63T9JD3Nt5rHdjrxtrOzMymg6G2/k9I7Sg04ONoAA8+8/HD594WuKFWim
         SxNBAfjNcftKsdjgh3EdRlo/VQQp8J2lrFiXLeHYCBHf8EWIsDQiGgSOqDJpi8jJaYqH
         AFX4q3zdHKiJx9BShUnEQzNPHtPDMe4noyYR7q3uMtdhl1YGlDesoWV4EdYbI2GK8c+k
         M+9novLDE6VeG2TepFSBBJyPh50VMGAKsvL3O9rmZMhj+s1GBa0ntf060VELwjWYT2sT
         9KMaIrROD4dMsr70okhHMb0XKVmH4E5ZbX2+PxK76lZy9ge6qUci5XHCkt17A4YElWF0
         m8Zw==
X-Forwarded-Encrypted: i=1; AKwUvByZQAgbg4/oUEh8aydwmwBDKuo+cKgiQ/zTvr+JpEHZTjghMmXJtNotgihofMDFIHBciqv5phoqr3ZifLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOK4Qe0wOYBwXOtxGRsexjqwLzveLDSEx2OB9CACNXzSenIQdK
	FmLjnLTFDs43WB3qgNOyA3egkthaSZCBFawAo5qELmDuYbNsF/6nuRJI
X-Gm-Gg: AYBFou1pkxv44FDw9ka+6YF+wDke44CjlXDowYq6lKbH+yGO1oFj0OydzExcnfC6/9s
	Ptp/yTYVqAvVIZrmlYn66Zf6VJqzrArcDaxneJUCSqDMG8ct4tHasDDa5pK9Br8OaG9LVgN77+F
	H+I8b3Wqk9cGWqaDQ4pw3OxOd1KFMLjXqr/IQOVaEbgBRi+0WzVvVnapK6XdePNCZb8NRcHi55l
	DIpep4arWRx5XqdbP7sUWUnX5ts2+o6he/GkpnfxXAXfy6ODwYlqqF7q1C2QDIpG6V5bTzJ7LsU
	RlInCmc4m/6/QJWUkhz0eSRj79nUZDoBDor5VGSzKcfe4DFBf2NGTtZ7AfH6a7SqcVEesPbnS3a
	/6ayNg3vG1wV+++9JOxDv6rSN/OGyH6bhXAS4IF3ZNxHP9HB0BqP2O0L/UeUJjC/V7nZudUEW11
	5/0vGY3DIFJLIFYwGBkvf5wgnXdXGp+o3H5Y6njgOSMQdhJNtRJoHFLPhi97XRC5JnDQrQ7maFY
	YZ0te5+jvx+sfW2z+80UV8vfR2cm7E3B1wVQI+vdfQOuWGZO1ogqYbuvbRm
X-Received: by 2002:a5d:6f01:0:b0:48b:6b4:db5c with SMTP id ffacd0b85a97d-48c47c8d305mr9575410f8f.6.1791149079168;
        Sun, 04 Oct 2026 14:24:39 -0700 (PDT)
Received: from andreayoga.localdomain ([195.122.200.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104417sm20407354f8f.27.2026.10.04.14.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 14:24:38 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	netfilter-devel@vger.kernel.org
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Phil Sutter <phil@nwl.cc>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Bernhard Thaler <bernhard.thaler@wvnet.at>,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf v2 0/2] netfilter: preserve bridge egress VLAN tags
Date: Sun,  4 Oct 2026 23:24:26 +0200
Message-ID: <20261004212429.3648-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conntrack-reassembled packets forwarded by a VLAN-aware bridge must
retain the VLAN state selected for their egress port when br_netfilter
refragments them.

The first patch saves the VLAN metadata for IPv6 as well as IPv4. The
second clears stale ingress tags on reused fragments when the egress
packet is untagged.

Both patches were tested under virtme-ng on a VLAN-aware bridge with
br_netfilter and nftables conntrack. With the series applied, all
fragments have the expected tag. The test is available on request.

Changes in v2:
  - Add a second fix to clear stale ingress VLAN tags from reused
    frag_list skbs on untagged egress.
  - Document the reproduced symptoms and the separate IPv4 and IPv6
    origins, narrow the first fix's claim to newly built fragments,
    reword the helper comment, and make the helper take a const skb.

v1: https://lore.kernel.org/all/20260928161830.351199-1-parri.andrea@gmail.com/

Andrea Parri (2):
  netfilter: br_netfilter: restore VLAN tag on refragmented IPv6 packets
  netfilter: br_netfilter: clear stale VLAN tag on refragmented packets

 net/bridge/br_netfilter_hooks.c | 51 +++++++++++++++++----------------
 1 file changed, 26 insertions(+), 25 deletions(-)

-- 
2.53.0

