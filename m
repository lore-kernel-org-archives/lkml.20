Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B18184540
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790483525; cv=none; b=iNyBrRhdc6HO0U9aYzZ45DWksutwxu90gQ4lRacuAw00hx46s71fCBR26MLzT0ElTtg8/wzWVOjVF317gQlGtYTpWXUn4E47MS47iBWzJ9AQvx/krBRLtjJA33d4akFhjDbi4rrWgmi7JVzx/Ohr6Nv/841GqNHc72gOXriSdWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790483525; c=relaxed/simple;
	bh=kKGtxVUKPtQ0j31gyrV1yVNdSd0n7CPMai1BfRcV/zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JTyEEw2MaD9zO51gbJK8i8uh6KEie4I9FmwE7bY6j1snv6UaC3BGYkuEO04T+BeP0vCMRDK80XlPAKiQOXddP2XmIqrz27BovEKHFbwsx8WOf3k+h5ZBOIy/QTkCfy3SAonjVOvCZ/XHdNC60JcWZqtTG6+/JmhJXWGqXWrcswM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=KEc4xjl7; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="KEc4xjl7"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b6200eb0so1539930a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790483523; x=1791088323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwbJ4pEmU8P1v6WkKeChtnGUndufDFY/6HPdG1aruyQ=;
        b=KEc4xjl78+Wh2Xx2cfIlDjPh0MLb+Q6051xzCn0OOXBn3DmpF1SFPYhkJpQSzM8jqy
         grMx+LAN1Q0TtF0Z7G1adWcf6Uj25qsEnq+n85DCPEMoMYChBX5Hr+pMD3C61iCKtDod
         eiufpALaFW5hdpwQ2N7iLoW8VYS64SEQo4rHeh8Sugi3WrlLewSRlPVT4O5f66f45uyL
         zQdytsYOi8wovi/yd74d9y0BnXDj2hnsYyjNmSZTZo43ueq3kJnU8YbbllOefm/5KcFW
         ox6LeFfKG3XeggTOk0sP49S+NkiCML+8UZ+SnNYNapotKJz9UM6ZcAmBAOr2JkrScMCe
         MfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790483523; x=1791088323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwbJ4pEmU8P1v6WkKeChtnGUndufDFY/6HPdG1aruyQ=;
        b=ezDGCMFCH0SBBKCXvQicY7JrF/Zfu81FjY76/mzS0AtmWcuTiGylu9AgU8y51M/Ufl
         qbNKaWnISGvw0tR0x4nY12lb8fYQMSt6hBFObE2t1JSsaqLiIQ+I+yHizPcTAZQnF4B7
         5P5MLvATphrxBx9i2hlVtKhSBx03yQcexwbrvd8mDwbRvHxGwXXlXAMJZvYskqyYboCh
         LGEupCcy+eIV4f9cIfBC5gAFZClhAjNkpcHAviuKj7pj3bSCkMc8wUuEtGmZAaEA6pcA
         UmF6j57x1OpNiUZIHR807gujI+79qeIHgxidaMEM1vBAnKa+liyYdhlQF3uD/y4nzZ/Q
         4pSw==
X-Forwarded-Encrypted: i=1; AKwUvBzAvzM2Ybb0b3pl3HtpQBRa+3jow6qTNCmBg9sMLVpEHxU6jyiKGv+ZZn1IUgqKV3YN2E2VkKtuCjHuNSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQuzsFm8wL9eZmNK8LZUWpXiuZbmuDjXTS46N2AyY8u4hWRn5D
	S6+MZxaOSOwKlv0yhRSdoYhEPK5Hj09QOHTlf9CvNBuOnG62CY1BS/SdKzIOhzm9dj90
X-Gm-Gg: AYBFou1FAIJbOv25iLudLtur+ORA6rOLM16Wpt7ixEceIIjcXQNPTlgiO0ufyRyEsvk
	1oLHU2qjUKswM/dELnpbN8V0i59SnSB3lFmTG3DLKX0MUehoTKpoKQfloeapIm0N4e10+E74UZ3
	3MTo/mNWw8YCoINvMW4iFaJJvK5PQzt+1n4xTBUAm9Haarwz8f81ZY0QqspsQvldOb/6yED9iy0
	ie0IL+6i6mqyO6VH7Qm9gl9a62OAgnP3n5u+f0IddZC7s7GmQnFe+4x94/8iG5YbrFeAE8JW16s
	vjQZKPxNhfMX4rCRZqLhFxQGfDb3qPmyF2Bp8ATxowgw6ACeQK7m0GW1LEwds8c+LbDp0NdrQTm
	t46tPYORmGVWrZ/3VL2D4SygLTeQmCmcURCaRQdFWU5wJJVKXuZokLBhZ070ju+dtKvOr8yEY+Z
	T33wECR9FkFppBTjpctdjFL2U3uxEwbgGCXBXMIGDWXlaOUOG/tUDyyJid5u/AHna/LogecsMGO
	RoudL9eOPkJ2p2HZfPnmoYjlpwRlA==
X-Received: by 2002:a17:90a:ce:b0:3a0:4146:2955 with SMTP id 98e67ed59e1d1-3a0bb6596f3mr3377478a91.61.1790483522629;
        Sat, 26 Sep 2026 21:32:02 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e05d674dsm2795629a91.4.2026.09.26.21.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 21:32:02 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netfilter-devel@vger.kernel.org
Cc: coreteam@netfilter.org,
	pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zihanx@nebusec.ai
Subject: [PATCH nf v4 0/1] netfilter: x_tables: avoid holding mutex over faultable user copies
Date: Sun, 27 Sep 2026 04:31:38 +0000
Message-ID: <cover.1790439054.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linux kernel maintainers,

This patch keeps faultable user-page accesses outside the per-family mutexes
in the legacy IPv4, IPv6 and ARP x_tables GET_INFO/GET_ENTRIES paths.

v3 Link: https://lore.kernel.org/all/cover.1789885804.git.zihanx@nebusec.ai/

Zihan Xi (1):
  netfilter: x_tables: avoid holding mutex over faultable user copies

 net/ipv4/netfilter/arp_tables.c | 49 ++++++++++++++++---
 net/ipv4/netfilter/ip_tables.c  | 87 +++++++++++++++++++++++++++++----
 net/ipv6/netfilter/ip6_tables.c | 87 +++++++++++++++++++++++++++++----
 3 files changed, 197 insertions(+), 26 deletions(-)

-- 
2.43.0

