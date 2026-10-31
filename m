Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417337;
	b=ZzBK7sfcvKDqj8vcTwfa35uWNFa6pR7OmMxqmoOr8ITdHAGlwCA7hQ7HMru2PlFaLpVZ
	 9wt0Ia3k8cgN58swhYOY7cSP2AJ2z+Jk1b/RAxP/rxIirfdjPIg64/lDTqgzXXBF299+q
	 W7CQiWOXL5pXm4LrZ9EDAze4qFNRhy0VWKy/MJBgc8OQmgR+rtvH9erS74PF90eT4qh0e
	 n/zik3sGpGHGx8V2IfJZW0nyGrOao+G0zkblDc1+5B06GW1aUNXftRaPE1R49TfAAiCJR
	 czB9TLax/uhNf683tYZZ5KcGPifsekmFz2pLpEXkugU7tmGMiC0hv+FHoiZGgZCLgBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M808A8cdafbHu3PCH0DvbgfosKGzLw5TjgtHg7aUNV8=;
	b=dOYEzxPLHHtGKC/+VtRMXq0+awi/PqZ/wKpNkkzbIvSB/zCZ3Tb2Z9C5HV//ZAugR8/h
	 FX8CtX9czm+Bh9sE4HfwoykDiAXdAus5JoM3rUJR9gn5wdDiw/wxuEemfHbUO8F8WzQJd
	 NuPVDEmF/+zg+OmfQipx7xhMuHMZdAL5Wa7ravKGqdS4NAUfacWMoRKL/8TvtxeYLXvdr
	 ysK5gU6P1g9Op7k3z/j923d8KDE+tcfVjNhVRsE9NTNSFlCELObdxwrFZdKhkuFphFSQE
	 AwO5ItutN6aWgr0CGoQ5BXhe2m/yqbdaH5c4bib20SOFLxLYb3lImQyFmVsHkQES38A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+Fvv+XB;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F24606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+Fvv+XB
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e977109392so9664895ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417336; x=1794022136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M808A8cdafbHu3PCH0DvbgfosKGzLw5TjgtHg7aUNV8=;
        b=w+Fvv+XBYkX7ai02Vc4XIlsGlhWcFO1aMMn1edEw45FUatWNt4VkrYjSIejMFF+TKL
         qKHtwo/dp9AhCZZp68T2WugeQqe4Br8c/LQqjL96LA9B+OQ1A41kDxt2u/CkpZOoR8D9
         /x4fOMW+VJ2IGluH/ftfC/zGggeJ8pwKdfccmh4Asn7h8ywNlXA/xmslGHDXc9iNoXYC
         hOOTrAM65wlZKq4arnnPdGmQE0XGs7yMuHcRcaZo8Zc57yQbRPa9Yg7cM+F14SEs/4qx
         dPZG7Q2hf/nt/RMxoNTxiYP6vfYz0evdntPFW7G6cfH7LA4BA/UmhK6HdZ8T7kGeYIp5
         5Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417336; x=1794022136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M808A8cdafbHu3PCH0DvbgfosKGzLw5TjgtHg7aUNV8=;
        b=FUK9MHGRS3aedCi04tpy6JDPVaq4iNrKFvGst489MhTvb4kV4d5AnM4RecmvSz1FgI
         k57BJf0R5BJTdH2PHhuB4/xCzVTtRH90Mb+opJrNFDejpkJZVcdBayQRUlFEe41aisoR
         tzOnVqrZrPXpqaKOiJRPNaMeab9OAreVrnDKQCL67CBNQEeQy7yOcUI8GtCwhB4uJg2T
         0KVrbrlzuuFjJb4MInUQAlZwRYo++OCxFaBAOMZayPYTtlJrwUhtIjUR8i+UpD+KwlGX
         FIEl71A1APPwOun0rqvMkqpKx4rTK5zGqS6P/E9VbSX7L8I2JGKjefBo5u2AAWJGBQTY
         kwJw==
X-Forwarded-Encrypted: i=1; AKwUvBy65P/Rh7kXUR0YMtCJctRCklmsCQwKuOd3Tt0UNl5cv1ESwL09ZtcBvEYE5z8TuB8chCp0zPMr/ivL2i8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX3Dw9CaRPYZ4J4rVfwC//Z+uN7pfwzZ7iiZDfw6Xnu+fJDpr0
	Yt/HQQIbm4pMJNoRrf2ddCIUG+10qXqLU5c36n6T+ge7qDIZ0sG/EFJm
X-Gm-Gg: AYBFou0QCIViiVwGG1/uVLYp4a/c+4Db565h9y6fS3p4bkLI2HB8EbCz6USXSkomSWm
	7f0jigP4evKsydNuJn3Nhab8EzbE20nPYnEmMfb5b6ALbPpjd+sU+NPCSsiy+Ov4tZwP+CMmQmp
	rv1UZv8usCur8WKuPpRCKGo7qCy6Ajh+tmp7RfOcpAxqRtQpBb8EDqnvCDEWr84gM/GtikMrOgb
	lWd15wJBkC67BS943XP46zjJGtNNSE14gRY/ktz5CAsDlS152pNOEyRTdknaC9lDw7fWkJFVV+e
	rC3MJ/NurTjT4Zi7ajVVA5q3F3pYrKANSou0WLn4z4hwqgllc2Gvzzsr8x3HW6UDjwh77g6MAcm
	fVC7q28AhMwkSqtWynejrgzx2YFpP+W7b0OImT77lEIKlXPyhT0msld4i1NOGF40pzTfAzBNAoW
	Xe/A/jFApPOx0LnuAGwZ7OW6SST2jGOztMchsIwTh/N7TSS5BPaoaecRq1qFSb/JQ/4hdPut+qs
	vmAEDb4SujAFGCZR9+QWIVXz2bUV4wmABiDjvFrQLAOwrkxb/djWdnIEAWpzRNvYrVd+K7NhLNg
	g6HVDb8TlyHDSuVyull9w3no
X-Received: by 2002:a17:90b:28c7:b0:3ac:83c1:2bd with SMTP id 98e67ed59e1d1-3ae897f33cemr3295046a91.28.1793417336425;
        Fri, 30 Oct 2026 20:28:56 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87ee7765sm3212773a91.2.2026.10.30.20.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:28:56 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	antony.antony@secunet.com,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH ipsec v2 0/2] xfrm: fix offload state use racing with device teardown
Date: Sat, 31 Oct 2026 11:28:47 +0800
Message-Id: <pm-xfrm-core-objects-candidate-0050-v4-3c6b8c5369a802e9be0e-0@gmail.com>
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
Content-Transfer-Encoding: 8bit

NETDEV_DOWN and NETDEV_UNREGISTER flush a device's offloaded SAs with
xfrm_dev_state_flush(). It deletes each SA under x->lock and then frees
its offload binding with xfrm_dev_state_free() without that lock: the
driver frees its offload state, xso.dev is cleared and the device
reference is dropped. Netlink requests that hold only a reference to
the SA can still be using the binding after they checked xso.dev:

  1/2 The offload statistics refresh in GETSA, ALLOCSPI replies and SA
      notifications, and in the expiry timer, calls into the driver.
      Refresh the statistics only of SAs that are not dead, under
      x->lock, which orders the refresh with the teardown.

  2/2 XFRM_MSG_MIGRATE_STATE reads the ifindex through xso.dev. Use the
      ifindex cached at attachment, as state dumps already do.

Cen Zhang (2):
  xfrm: protect offload statistics updates from device teardown
  xfrm: use cached offload ifindex when migrating an SA

 net/xfrm/xfrm_state.c |  4 ++--
 net/xfrm/xfrm_user.c  | 14 +++++++++++---
 2 files changed, 13 insertions(+), 5 deletions(-)

---
Changes in v2:
- Address the incomplete RCU protection raised by Sashiko:
  https://sashiko.dev/#/patchset/97864
- Patch 1: refresh the statistics under x->lock and only for SAs that are
  not dead, instead of using RCU, which covered neither the driver offload
  state nor the cleared xso.dev; fix the same race in the expiry timer.
- Add patch 2 for the same race in xfrm_do_migrate_state(), also raised by
  Sashiko.
- Trim the crash reports.

Link to v1: https://lore.kernel.org/r/pm-xfrm-core-objects-candidate-0050-v3-dbfb7194ffb750193d02@gmail.com
