Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660607;
	b=Y66aEdbpaTlwmTMdiTOcyNXolTrI6iYfsgMc3DOFPFmHM96si0BiMukcTQCJiPQ0Hm2e
	 JD9xHQzQo5EQxvOWrLiyRVxpCMw6SqAE1395D2nfSycXw1pAer7moYfB8JbeVdb+zhIY/
	 5dNAQ6wRXpZf9N030a2FTMY9HG/iw+c9MmlMtmv/LUFE4TiYh42BfMpgGqNroAsRSKAXe
	 bVOBZBzUXFRo0+ZjSvt/TdsrwhCVpCIMJhIPshjdJf56aEEY4gr0/wT1FHRRsYQFS7c3B
	 zdmWpUv2wVQEC6dvHLIfpk8YlPxRgSE2OnAymiugs1qEgycAAKZztHA8trCd4jqKo/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Pv1Dk4E92+Y81x316CmYEZVjvBF08c29+bZvlM2Ctvc=;
	b=HxAWS3ieKnuNIzyqbBzMdjdsXw2ulgOxBefgd6Rkd8kCLVPXmoPGqEwgHcsp55kUwZRE
	 bXc57y6BLaRih+X9UVBdjZBPeUsCUH7RwXLhpjW9N6prUBobEnSuJGwJuMILYadYEpwLd
	 pzDZgzusVL/sthb+v8VNBm1RNAif1mwZ4/O7jLYYlaHa2bvU/DJtB1BRHMdL74R9q5OCp
	 UWa5l9ag/2fZTsqLV3m5rdncwG83+z4/ok0Ze1gTi6L0CaWG1h1IGdQxxouxrmopaR6yQ
	 zmmIRNGiFjVu5UH1fjdS74LlSUuorm2MrdeE/LGv9RDvan72iI7LUPHVBs9PwYD91EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oBDig0Gy;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BC606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876BC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oBDig0Gy
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so1587636c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660607; x=1793265407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pv1Dk4E92+Y81x316CmYEZVjvBF08c29+bZvlM2Ctvc=;
        b=oBDig0GyceFjeMjouhbaHdVz8glcE6nwPqlqfYYJQ9xnRX4ItsNi/O6LX+JHJ1mQcx
         38oPo9ZYyKHz/xkZTQjWD4+ZwFoFqbAgkskL4gShySEx4wGghy8XJg30/AxIPEC17LKC
         5dxPb9CjKF0L5WvLc71m19Jf3zxSj47ztTndtkF8udzBk6tCcEIgxoOVwe4yHWoosQTx
         PK2X43kI/Nqh0POmwy758utryhdmqzJd+ronRlbF1sBE7bzZ5HAIvOS4gpuhPDydM8WP
         vgVt55TO6Lv1ucxLKvKjrxPbbw6d1FrQQDkCtV6287BBr1lMs8WmnW/ctxoPLaZNrGsO
         hZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660607; x=1793265407;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pv1Dk4E92+Y81x316CmYEZVjvBF08c29+bZvlM2Ctvc=;
        b=gDTmFge3ORmGtBSknIZwXkcHLBRpCHBKDP99VkNSEieBaCpFAHEx5fkcWRsf/UIZBP
         ITVG0klvmye0ZYqadi9LDCvvnbLD0J7kJslrOnUoFDSwP2taNLEe4ToH1R0I+Pz0PyqU
         iCU7kfwe0Gis8XuJYb+lOueykQq5wLxK+bYx72UmK+c1IYCKOFMTbWj0HjyoEdf5ZoMr
         hYRPqE5uBBX6pByn0jE+AP7T4OLyjQKJKDlhk7V3biXPaeIn7cH9huN/T3KwfFF7PLX6
         siN/Kl/cyQ0ZoR1jv7b+j1DLhkfT4VrgHOEJPJNnYpH3ROKDpAvwaOu4JLLdW5vO6IWY
         4ZUA==
X-Forwarded-Encrypted: i=1; AKwUvBxLIYYdiR28gPyzBuN32kD/ZMatgNP+6ENH59dKmkIL872B7hDkqdDSlv7IshXcf0ZTD33tTlMLj8HRrbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK4q1hO0N0yqR+aIquYgrPPI8+VRUD7cj9hhgscbEZdPQ+SOw+
	yQiNPIt1fOo+bMlnKpCBftuKJbFTBMlWNpWO6flPt0AI82jQvDn99hjpAjNSOcr5
X-Gm-Gg: AYBFou2/PMTwEvkX4/s0443aWJU9oYnzggtOavDI/SxYTf0PFUIo9D2zw+2NbtcrUG2
	ybotpl/YSkNPCGFmMrF1KxxGhGXK+v5noM3N+r5lnA4q0kDXlShLbZZJrGmepZy83nS0jDxJiXF
	8z0pTx5lDw6u9CPpRajQbppORn5vWk0BTpoDwskkAZJHIsh9Avdb7XlWn67ailVscs6EB21810Q
	zcxZ/j51uJaN7zwRRHY+LOJG/qDEncOn8HHCtvueTQ9wSRavCiXDOI/jeULsI+zCIouHiad13hH
	Hr/FIoQnKID98Z9GqTiU7yLn+zZ/ROE8sIN7xn/uCPsiNgg6gw1gQ5+oEWVBWinimfjcnyhhDaA
	Gd6AS+KRjqxfDCA0YBr+PStyJd0LLOO2nr1y7uv7ohNojuCaBcjYm18nfU7d/zdwlEw/hxtf/xs
	s3ceT7oRneRy4XO2aj1lC7D2ngymRd7MfMBK3QIo6sSoP7ikkcD9yWaCDNFDqthJ6MwlZQDvhD0
	qSLH+RYKkAxxL2Rt+n1p994+BIX9nGYb4zASzKj7QKQfiZ9r1TrCgqfpx/EtmFMXVsbbcsLZ27q
	M6My5DNZt7ZYckSD/84=
X-Received: by 2002:a05:701a:ca01:b0:149:50cb:2175 with SMTP id a92af1059eb24-190a67f9f1fmr6394878c88.33.1792660606730;
        Thu, 22 Oct 2026 02:16:46 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm13188815c88.15.2026.10.22.02.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:16:46 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: tunnel ID zero works on ingress but not egress
Date: Thu, 22 Oct 2026 02:16:40 -0700
Message-Id: <20261022091640.3652180-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

__vlan_tunnel_info_add() accepts tunnel ID 0, creates a valid
tunnel_dst, and inserts the VLAN into the tunnel hash with key 0.
Ingress looks up key 0 and retags the frame.

The egress path treats tunnel_id == 0 as "not configured" and returns
before installing tunnel metadata.  The same mapping therefore works in
one direction and is inert in the other, while RTM_GETLINK reports it
as present.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1:

  VID 100 -> tunnel id 0:
    ingress VNI 0 is retagged to VID 100
    egress emits VID 100 tagged but installs no VXLAN metadata

  remap VID 100 -> tunnel id 3000:
    egress immediately produces VNI 3000

Two independent cold boots produced the same result.

Either reject tunnel ID 0 as reserved or stop using zero as the egress
presence sentinel and make ingress and egress interpret the mapping
consistently.

This is distinct from candidate BR-063's netlink-size undercount for a
tid-zero entry, which has a pending sizing patch.

I found no matching functional fix or CVE.

The self-contained PoC and both console logs are available on request.

This was found with a multi-agent workflow; the
ingress/egress asymmetry was reproduced in QEMU.

Thanks,
Cheng Yongkang
