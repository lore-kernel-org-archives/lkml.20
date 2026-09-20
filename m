Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBA82FD69E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789865270; cv=none; b=YjFgWDLzm0QHMrac2veMsDmaqZh/w3PQV2g58tVr7PC63t2nWzE998GYu1E0hrvLO/1n5vQJaMLY4iiQTvrLca7vi5fCCyVPV654YdeWutB6gUWFdFbS3V0oOhlDIV0xJldr7m+R54JK6oxYaXPHhj4OQG92UmDhzevPM2SKs9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789865270; c=relaxed/simple;
	bh=MJvGxSsNpYy/kU91KFXt9TSv8kDRgzqAw11+tcx0VCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9a5SuVz6OVLoz79+AjcXhlXxMzuwA6EaqgHHh4HKqUh/an4/vYavO+6vhEvtEJrBM4Jxs6zx1E0ltR8GIHHoUjaKEZcYEllhyM2LeSE2AIVJXJiwkyL4oYYHHfiq1YuGiwZvh/bOlpVAjLii0xERe8L1d5YIXiP01y5oyH225I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMNAj4RG; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMNAj4RG"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so19962936d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789865267; x=1790470067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2mvB3CBHopypng5GIwWVc/CrGw3Rh9PvRGGQJXfiH0=;
        b=bMNAj4RGm8Akkz3eoQl6pOTon4FQJqNaIn2XPBfbHktbjewff+Z9Fxes3j0QESWkat
         3ggWuISwDzQcm1KMp91q2lmb9VTbXxgh3Fn1Q33yGMhwGAXnUcLXJa+y2k12Nctey+/l
         QNialvg4vWs7CRuji8KmLrG8Cdl1ds5Zi7/T2PJNUKcffmFNtWthVA+0ly/rH/r6apFn
         o5ZvqdRVA9ye+kK6SU1myidrMH3t9aVbCA6jbUltSRhiJJJ+HvWTHE70zdhvxst1pSlY
         6VXKt0V8BffHY2BSG4l08dWgSUp7Vt79ydwoUDUz2Jft7aOWJZb4zXKEwzz6qKRuGvUU
         EERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789865267; x=1790470067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2mvB3CBHopypng5GIwWVc/CrGw3Rh9PvRGGQJXfiH0=;
        b=raye1jw1tlFrlKwL3JNqZmuHl1DonHnaGXABWr+HYeg1r46RhRABbFcdcAVzBdHXqH
         U5kHYEZA3GDVcYVk2i9Ooxi1ZOpM+9AdMKqg0ScseQwnrEDlbBEshi5DgE9nIX47be91
         l/m17l+hc8pzvFpPdsybN0hc8qmMt8vKX4Xff1z665RRpqWvYUCHOYJn9XeSwyXWs6aR
         DG0P8ZFAQwrzOzLP1T4WjNHWTr++Gb/pgUm4Z45N+LHZRariYA3VCs26jB/ZsIfzaCwx
         gQdP1PPjh0RlGrrN7vBbBeNMlMpN8JjwFZ5nNb3qPO17I86KLwdOgzZT00YD7NHJw/+i
         IXRA==
X-Forwarded-Encrypted: i=1; AKwUvBxxVubGQAqLCDDBg3wUmePHmbca6kD2b6n6goaYBtA0GgoJ+Xqwfcyh1Mq5Kj07x9vhXE2HdQz/N2rHwQc=@vger.kernel.org
X-Gm-Message-State: AFuF++n61LB0QkBgiYdpbYtWNlzwS6x2mLuQUj7NAk79mTgvqZtecPEA
	5gX80Lg6rUpCX3UgAhVmWVLQwUAn5Ir4PtHoKQqk/J0Xz40HINgHCigh
X-Gm-Gg: AYBFou188qlqb2a8klPGvcDau/hpMMp7Mk4mTS9q8Kurka4rnGA1x8yuU8hE1m3N6Z9
	Ej2aVNBB+cBWsq800+j/sZPHbGNRwyOlfoD8WnWi25gDA5g2eNH6fLRXGxHw+DP3/52K1M7R1Dv
	/G9SyCqevN5n9rV3MTZloSa9IdG8X1JbSRFoPHMNUw2fWHXTI4Q9nj436pXTCXiMdP3fx5d/PeG
	38GBbPPA3GIZR1ZBkm2nulspKxSDKiv8lm+NKUqjYQVxXwiFoxiRN81CoTDwY+fge3BlSk19zoP
	1NxS0zO5fYIw8f5ig5uuKeSHPmNN5CFpwTI6SeQ5c45YfBJtNKNtHQd5QS+pOR7AzPr+Sdhj+rC
	tbomUW9Ryq6X+4CU2dGvpTfZSMFXv46A8iCxwOkXBHYOJxyjkguOr/ixFFZkhGwesqhqyd/oFzC
	r3XWxwQif3yM15aLNPUw2RH7TUbwebYRdupPX0u9cmU1kMWgTnJvqh9lpl8pM8SgrVssPyg8x4h
	HPl3O4niS3b7Eg3sMxvoX40n6nCF8U6ZupisxRPqPHseLLcmVJTfiSPLfRqq1vrzR2JP+T0
X-Received: by 2002:a05:6214:434a:b0:910:63c3:5c70 with SMTP id 6a1803df08f44-9129c780e53mr36692256d6.19.1789865267075;
        Sat, 19 Sep 2026 17:47:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:155:4200:2c80:c8b1:39dc:7ddc:dd0c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9126078cab2sm32122436d6.0.2026.09.19.17.47.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 17:47:46 -0700 (PDT)
From: Paulos Yibelo <habte.yibelo@gmail.com>
To: netdev@vger.kernel.org
Cc: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	virtualization@lists.linux.dev,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	hannes@stressinduktion.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 0/2] net: prevent partial checksums from modifying IPv4 headers
Date: Sat, 19 Sep 2026 20:47:31 -0400
Message-ID: <20260920004733.6473-1-habte.yibelo@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A TUN or virtio-net user can supply CHECKSUM_PARTIAL metadata whose
checksum start resolves inside the IPv4 header after link-layer headers
are removed. On the IPv4 fragmentation path, skb_checksum_help() may then
modify an IHL which was already parsed and validated. ip_do_fragment()
subsequently trusts the changed IHL and can copy beyond the skb's logical
linear head into emitted IPv4 options.

Patch 1 validates the checksum start relative to skb_network_header().
Patch 2 independently validates and retains the IPv4 header length before
checksum completion.

The issue and this series were reviewed privately. The source reproducer
and complete runtime evidence remain available privately.

Validation included strict checkpatch, focused W=1 builds, a complete
build, two test boots, a legitimate fragmented CHECKSUM_PARTIAL control,
and both forged cases.

Paulos Yibelo (2):
  net: validate virtio checksum start after network header
  ipv4: reject partial checksums covering the IP header

 include/linux/virtio_net.h |  5 +++--
 net/ipv4/ip_output.c       | 23 +++++++++++++++++------
 2 files changed, 20 insertions(+), 8 deletions(-)

base-commit: 9d565b6b72fe3f41fd43636e143072848105189f
