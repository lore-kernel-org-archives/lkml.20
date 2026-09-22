Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2F5330D25
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046200; cv=none; b=EV6CfICLh6YB4+5/yOcQoMzDV2gBb7zFA97KTMN+eCZuvZWddvEF3/KtPVuLa1QFry9s3C3A3Wt2e1u2FT+l7R8sI5ZNDUT8KZGAgBNzGpgMzXzniDzDFdnEKBV4GrSjuMD57SN3u1gw0QgmbXrJnqC/MRnuILiyZIiIpO1aPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046200; c=relaxed/simple;
	bh=7SODR36kHYK1IakVc5HOz6krTaW3m9saxbK5Vnu7M34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mKmktuE/D+n8a3ozEYwNPqW1PwrxDY53yuJJ2vwVEsYESob0tw/S5mD6sAIcIxIiZ/0UVsbEBlk8eIBr/UNrW8iG4YZ++g57X6x+cExXhO0+OY7/2qEQwRUwrRO1b/aZebPULh8AVLEu2+zmwipjGr6IaKXjeqCJzsEzCT9u1Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3UMiuor; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3UMiuor"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-67109935888so3634828d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790046196; x=1790650996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ixt/Rxi4OM6LS0sSMn+Kn0k0Yx5XJM0PK6LzpYStkGc=;
        b=o3UMiuoreVz0HPKZg4/bawB60EG/WkxdFE2ye4gHBRClkGZh58SFrsVGfW5HQVXsft
         X0ETTi0mHf5ZmSTPYvYGlbVu/oXoT77Y4GWgGTStHw5ngc7UmD2AR17Lq4VwoIbV1KaI
         RC1J5ncG+4AILuXqVpQi1Uvmp7Ha2a0Ch/s3yQZEcvx0RO8+FC0BWsY0gtkwpcbwDAYL
         3WktoJIZYqPGLzv+54mfQ3/PW1ydgygzyyOYVmoI+omDbgdBs/QtSkI61Q45xLNFqzQV
         iCccG3YjyKGmmG+NNIn/bq/1N4d8yWGC+xEuXAVZEvopcsBsy11wt/KyJcxRLsWw9BGI
         DvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790046196; x=1790650996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ixt/Rxi4OM6LS0sSMn+Kn0k0Yx5XJM0PK6LzpYStkGc=;
        b=tAE9MxBCgyxb6cSMHTNvoDmL52rRh7YzH2uclMuMeT5jSOBoOSCdj2CBi5TkGyWF26
         F+e4SiXsf4LKP5auNrLBH1JL3Ddh5gO3mrJybX82QhoYC3jQJTVepRi73kaDZJ8QYB3w
         HE9YsES6qn+aVqpONzxBT0aY4lU9DR7XlpGzSrsqP7DHHeoqNU/VoB6hdYq3e6oLtN0B
         hSX9VX9yju1YawAn3nWzSLu4T8G93m4c5Itb3U2eCxxoaen7NObph0fK6BvASx0a46D1
         JcVA9YJK6hLNtXJjW5szMCTm5KYo+3V6O2Nqq1PFVJJUsfCxLZtrlOnEC/IzN7vM9fOY
         Pytg==
X-Forwarded-Encrypted: i=1; AKwUvBxRUpgrb7Y21ZUU2sDCd8p9IrHygVBlDdjoieje5x13iZg8z5ZnC85tL3OY6Qf03kKSYv+cVOd93Ahtdh0=@vger.kernel.org
X-Gm-Message-State: AFuF++kTNlks1TkUX38EuljVIANkk6GzkM+TT2SZTTauqHuTHC/vAgpH
	6IsA7zQo2MHguZ9ne1G4w4uFq6hYsAvNOEE2FM8Xu/I2xJRqGgMzMYdR
X-Gm-Gg: AYBFou0/ZkyuyNZX8EiAgBr90mZdOiY6pVytoBZKXjC/gNaD65Bs09ToXC8fmQCwjvv
	GCf+ILKHqV41CVI29pdFKaJWp7QipduAECLGxalSNczC8gnfcIEvTtJidfFL8i6Bmmd2Odl7eqJ
	Rwe/C8A0SE+pYtt0bfz0ACsHb3MIzZciLW/Uzu+5qlXGU8adGJyfHqlcUih6P6yDizgHZ9MCrDE
	Q2go1IjXudtA9AjbfXgHj2AJbaKn1dilIh93W5AElefqewwYjJ2ibbTa+RKnRkSAKc3VjdFILD2
	0NaVxymNrRktlhQ30GxZoJaKR3H/K0Mgq5TF5NWgTCRHyT9NrVvoVZOV3mPZfW7Nq8ITEKKI1vU
	7PZc9QR4wRsgE4JsYh+9AqCOjsMbqSWvr+WlMEPTSkYSjFp/hMP+VsyUsS/ahY7p4VmETYRZN8K
	kuEB61EKF4EkC/qKdapF1K1llVNnnK1hwvjjnrihGDz58VbROdSfiWnTR37WyY9lC/+J3Wj+UuR
	XCXJAe5pqu60CLzPfhevD7yYnCKPpikuXKbbMrmn7IOuTbeAiMBSjqbXnCu1oK16SJ1Xt3W
X-Received: by 2002:a05:690e:1181:b0:671:70d2:527b with SMTP id 956f58d0204a3-6717fd6a661mr4352075d50.62.1790046196312;
        Mon, 21 Sep 2026 20:03:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:155:4200:2c80:2875:43a3:e345:710c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2c1b02abdsm1471447b3.17.2026.09.21.20.03.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 20:03:15 -0700 (PDT)
From: Paulos Yibelo <habte.yibelo@gmail.com>
To: netdev@vger.kernel.org
Cc: richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com,
	mst@redhat.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	andrew+netdev@lunn.ch,
	pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	razor@blackwall.org,
	idosch@nvidia.com,
	dsahern@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-um@lists.infradead.org,
	virtualization@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v6 0/2] net: prevent partial checksums from modifying network headers
Date: Mon, 21 Sep 2026 23:03:08 -0400
Message-ID: <20260922030310.8684-1-habte.yibelo@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A virtio-net header can supply CHECKSUM_PARTIAL metadata whose checksum
start resolves inside a network header. Software checksum completion can
then modify bytes the stack has already parsed.

Patch 1 checks the data-relative L3 origin in the virtio-net conversion
paths. Patch 2 checks the parsed header length before checksum completion
in IPv4 and IPv6 fragmentation paths.

Changes in v6 address Michael S. Tsirkin's review of v5:
- Name the Ethernet-only L3 parser accordingly.
- Derive the AF_PACKET L3 offset and protocol from the actual Ethernet
  frame, including inline VLAN tags on an ETH_P_IP raw socket.
- Use the IPv6 base-header minimum for IPv6 checksum-only packets,
  including IFF_TUN before skb->protocol is set.
- Restore Assisted-by: LLM on both patches. Patch 2's code is unchanged.

Validation: focused x86 allmodconfig and UML defconfig W=1 object builds,
strict checkpatch, and application of the exact mail series to the stated
base. No runtime regression reproducer was run.

Link: https://lore.kernel.org/netdev/20260921025341.44846-1-habte.yibelo@gmail.com/

Paulos Yibelo (2):
  net: validate virtio checksum start after network header
  ip: reject partial checksums covering network headers

 arch/um/drivers/vector_transports.c        | 13 +++-
 drivers/net/tun_vnet.h                     | 52 ++++++++++++-
 drivers/net/virtio_net.c                   | 10 ++-
 include/linux/virtio_net.h                 | 87 ++++++++++++++++++----
 net/bridge/netfilter/nf_conntrack_bridge.c | 21 ++++--
 net/ipv4/ip_output.c                       | 23 ++++--
 net/ipv6/ip6_output.c                      | 12 ++-
 net/ipv6/netfilter.c                       | 12 ++-
 net/packet/af_packet.c                     | 24 +++++-
 9 files changed, 214 insertions(+), 40 deletions(-)


base-commit: 1e24c4f2ee44be0eee94092b5d13cbdb4bdf0d60
-- 
2.46.0

