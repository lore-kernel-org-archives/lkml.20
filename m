Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8D3D6CB0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228214; cv=none; b=eK/S9q+P6mgGxR7NOfqrwOVjJm3O3gdwZKoedmfoctOw/Pzc5IYlf/rQRqcy73KBDGG9/Z9uQ9xXLTyJicpraghBFoCIl+sgBcu4oc7BKTcTla1qnTlYY1aNCvYjwOyY+aaHHg5sbEIYcF4LkNZRGfvWehcycCLKnz8y7kdx15w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228214; c=relaxed/simple;
	bh=hJ24dHwYNskkMzJQOdxprEVRtyGXL1/rtztojA+8fug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lWQOeiHXfaKpKcyJqD2pJ7T01CdaE/Koab/hoGUxIuyWzeriNBIykyD3xF6lwKEjKA39j2ynW1CrGrhDghr204HafIoVT1BM0IbgTF5llQyfWfGAZFWllfHinNnZ0XAKgkIbeXEV1QHIcKZ5HxiAcG4yAu8Ld1M1GSy6RjDLzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxHAfTgF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxHAfTgF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso665652a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228205; x=1788833005; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rCEYFhj1mjK96Rv2xJZjQiJk6x21bXoFnt8xqzOlIK8=;
        b=FxHAfTgFZzStqeO89WOootF++2mlHttZwYi0q5auVr6udbya6PA5IT+rs/vUyKIVq8
         B/twtY63Gg68FEGBwolZn7yOmhsKtB7faeHoyKTp4PQvehpl3HK6Px80UhbYDgvJM3Sm
         XloDkmKX6Uoy34+HtfrpQ4xnkr3/mdTwyT0k8emNcYaTiJ91iuh6M7F4luiJmVoANGij
         ixLoJ0sBKAwGE9JNzV93tLQsrq1+ufvCAbkIlnnG84fEOjg/5lSbl8O8dzPzl8Hw99hO
         YcCsd1FSOkpQvhXBeMugOZ6RPJ0rGzD8DZFXrhX1MSOXzZ6XL7HNQz6+q6Vo4A5Sz/Q+
         7AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228205; x=1788833005;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rCEYFhj1mjK96Rv2xJZjQiJk6x21bXoFnt8xqzOlIK8=;
        b=Z8cK2nwEUBayCe59+2iNkjYrnYfUZrhvPAvwfSRZSyeK3SG75MBOuAtUGnnLvwYgQp
         k5xm1fpKqZyxpoE3sU489hhVknlzTY+aw1vSpiwhHeZLCyAUyKo6QYmdd9a5WxASXXIh
         XHic06HtvvfcyJREczbn104zIhKgqJv4o9OKLwpryeRySqBl56256KujL1QLsDJiXBJq
         OjCV2ii10fA8xBoM4IZv5DUnfmosNHBNJOfSJOxbLp2erj52sTZVAXVxg57WEsm06vdN
         C/AurFbvRo1SdOvpn9m2bM/NxWhRu4s7Mq/oftb5Y0vvUp/e7w0s1Jz5RacRjzS1KhIO
         QA2g==
X-Forwarded-Encrypted: i=1; AKwUvByKFMqsS1S83xzZ9Mgl1F2HZKwPeT2/IGvWoElp5JNVRzwnp+UeW7HnQX7e5ccYnjKqQHOOXNc2ZLH15W8=@vger.kernel.org
X-Gm-Message-State: AFuF++km7CHxXS7SOv8fqfqo//BF9lrKL4zBIIS9uzVU3aNs1fTuTo/d
	AFD8IPTJPMKIGcwgRP62iLMog3/3MifdT3Rb+8H4dSYucIPkcgJ0q767
X-Gm-Gg: AYBFou1l+dZtaOzNVgvY5+hnGaLGtgSJ+lPHZQMEmX+KCbz/QBM3W4cIrvikvtvZIpM
	EaCH/CNAfnSWjKP+g/xgBDj7qLgvHyhsHulqCQV34pkq0byQ/HyvdKc2XGvBTHp4IOPbpsKDnOz
	7PU7hBfMbEicYDl6yv9ZET+vM/V2KcHhpgG7yp6AUookKvvZSdx/YAB5jWHsTeL+usScP4677Dw
	Pl8mtgeDKgHDfhGIvsKCMMt5EWLQRC9zxevbSevolYQQEs76yWCkLkiOChg51tkJo3UtMA21zED
	K+8ueNB6OIqfdOjSLNSJ4HfKnM+8WMFLGljlz02nUylyQiDj3ieS1Z66nUrgwszjxV94e2kSdCq
	ArlIELHoo3MZiA57sGL1EoV4D1Jd4mqoWXDhzBnUWQIRN0EwCEC/rNdRedAFYrQAurZ7XACMUS0
	ieGlg9PSs51B43sEXIvhzRQaGBB8or6kGYF1xZBqI3egDaRkzymGAKqPw+WUYGHZfDmSgpSZU=
X-Received: by 2002:a17:90b:17cc:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-398d8ebcd21mr13893358a91.23.1788228203814;
        Mon, 31 Aug 2026 19:03:23 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd46185sm3020899a91.5.2026.08.31.19.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:03:22 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH RFC net-next v2 0/2] seg6: add support for the SRv6 End.MAP
 behavior
Date: Tue, 01 Sep 2026 11:03:17 +0900
Message-Id: <20260901-seg6-mobile-end-map-v2-0-1629bfc166eb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUylmoC/21OSw6CMBC9Cpm1Y9qCfFyZmHgAt4YFlBHG0JZQJ
 BjC3QXcunz/N4OnnsnDOZihp5E9O7sCdQhAN4WtCblaMSihYnFSIXqqYzSu5JaQbIWm6DDTpFU
 kM5nKBNZk19OTp731AffbdeMsDWhpGiD/Gfy7fJEetu5NbtgPrv/sP0a5B/fJRIq/k6NEgVlWk
 lBVnMoovNSm4PaonYF8WZYvj/FCYdkAAAA=
X-Change-ID: 20260523-seg6-mobile-end-map-9cec24191817
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Justin Iurman <justin.iurman@gmail.com>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3407;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=hJ24dHwYNskkMzJQOdxprEVRtyGXL1/rtztojA+8fug=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqljJnrqPYNPJVnghNuErK3bsL7HSG2Fh371Tz5
 WwFYlvsRpuJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCapYyZwAKCRAq19F1Kl0b
 TScrEADWSUE0T5JaaKxPdV7j4zjWEsUKkbwaWxAa8bOdnw8SqTH0e0p6P3III9H17W+VnDNe9JB
 r32rGiRZXhBm/p0BtjGyPMq4/dPqRRpbsuqWpix+7JgFWzIkFFBejXJTfB67bRPXYRwaEWNFQdQ
 ZIuMjtdcamvYalhKkeigGu1x8Jcz5EejrHn8QgL90YmUDmcr+uPT8U2mSXCJl9dMLFjz8ZMq09D
 CUeha4moj5pN/1qx6bADSVIQVNE9AdYickPZ1zKLzwMM3D2gSLKL0v3DbIikG14fPMXkez+jjVU
 k+E8cQ0Kb4vJtDZ3Fk9msZQQO99cWPIBN4zkt1JAfRbsBmXx4ROXSJmJjYPCEJLoD5KRaGAiKEL
 sr5Puki9Ho7Rnh8UAaJeyfCPgzT8h8KGyHXC6zrJxTZJjb2hUhi/zEgTVL40RWdAamHuYV+F7n/
 g4foQ9+s6hnRsl1Qe3gRwy6s9Woe+5EhvDMDoaZsEd4b1dFrbOD4Vl58zViJv3tA7/iV8h/zXF1
 A+eHjXfafh9+YT4gn/Lb2Nw41UyYVqkBwyz3scPOAsJi8YlV7UnGn8Ay2w19CXLLPBXlgS0so2F
 V+5bLrRy+o/APUS6SfVZNTeXfVE1O5ag1ZqRDAqnA6MJyxcduGECkczB7Y6fwcZGMr0Eb3Agj4o
 YHQ6/FoeUqMbjmw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

End.MAP is the simplest of the SRv6 Mobile User Plane (RFC 9433)
behaviors: it replaces the IPv6 destination address with the
configured mapped SID and forwards via the IPv6 FIB without consuming
the SRH.  This series is the first per-behavior rebuild of the SRv6
Mobile User Plane v2 submission [1], split one series per behavior
following upstream review.

Because End.MAP is the first behavior to land, this series also
introduces the SRv6 Mobile User Plane lwtunnel framework that the
subsequent per-behavior series plug into:

  * a new LWTUNNEL_ENCAP_SEG6_MOBILE encap type with a
    CONFIG_IPV6_SEG6_MOBILE build option,
  * net/ipv6/seg6_mobile.c, which hosts the action dispatch table,
  * include/uapi/linux/seg6_mobile.h, a dedicated SEG6_MOBILE_*
    attribute namespace, so that attributes whose semantics differ
    between the mobility behaviors and the RFC 8986 behaviors do
    not overload the SEG6_LOCAL_* table.

This layout follows the discussion on the v2 thread; feedback on it
from the lwtunnel maintainers is particularly welcome.  Per the same
discussion, netfilter hook integration, VRF support and SRv6-specific
drop reasons are left out of this initial series and will be
revisited separately.

A matching iproute2 series adding the "seg6mobile" encap keyword
follows shortly after this posting, since the selftest needs it to
run.

[1] https://lore.kernel.org/netdev/20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com/

Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
Changes in v2:
- End.MAP: patch the L4 checksum also for an SRH with no segments
  left and for first fragments; selftest cases added for both.
- Use nla_parse_nested() for the nested attributes.
- Rework the selftest helper and cases; wait for counters instead of
  sampling them; add CONFIG_IPV6_SEG6_MOBILE to the selftests config.
- Rename the SEG6_MOBILE_NH6 attribute and the nh6 keyword to
  SEG6_MOBILE_MAPPED_SID/mapped_sid to match the RFC 9433 "mapped
  SID" wording and avoid clashing with the SEG6_LOCAL_NH6 nexthop
  semantics.
- Trim the Kconfig help; add Assisted-by tags.
- Link to v1: https://patch.msgid.link/20260710-seg6-mobile-end-map-v1-0-99be02d68143@gmail.com

---
Yuya Kusakabe (2):
      seg6: add support for the SRv6 End.MAP behavior
      selftests: seg6: add selftest for End.MAP behavior

 include/net/seg6.h                               |   8 +
 include/uapi/linux/lwtunnel.h                    |   1 +
 include/uapi/linux/seg6_mobile.h                 |  61 ++
 net/core/lwtunnel.c                              |   2 +
 net/ipv6/Kconfig                                 |  10 +
 net/ipv6/Makefile                                |   1 +
 net/ipv6/seg6.c                                  |   7 +
 net/ipv6/seg6_mobile.c                           | 700 +++++++++++++++++++++++
 tools/testing/selftests/net/.gitignore           |   1 +
 tools/testing/selftests/net/Makefile             |   2 +
 tools/testing/selftests/net/config               |   1 +
 tools/testing/selftests/net/srv6_end_map_test.sh | 399 +++++++++++++
 tools/testing/selftests/net/srv6_mobile_send.c   | 262 +++++++++
 13 files changed, 1455 insertions(+)
---
base-commit: 1bb784eb6e38fd73143f021608e4ef3095d0c0d7
change-id: 20260523-seg6-mobile-end-map-9cec24191817

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

