Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551568;
	b=WI1ZdXwVsbZjC5A6YIQE/6ZXH6I7dkqBLZUevECkx2hkR1CKebvSFKVzs87KQEYEfHl/
	 2I0iu/9AUCkBk76S58iAIf+/fq6PXxXT30zFgUg0qrsyT2+N/BL6joVimS9SNBAS1APDY
	 yn39uGu/72bN4lr1bIj5XZpAOHWrAjFrRnVW3oVe28Sa9W874SLXp20WotHQ/Yr7WrbUR
	 76jn6MV96rUbIP6KAbYLi8HqpjsurRZcothaHsTTtT6Trs0P1HpcJvxfNFXYaRFFJG6cH
	 bkMn6D1mdQGCu9hJpB4TmqJPON8hC67M15M0wzm/2FkWM8nFQ8Blj3e31X1CFOGrvjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iEErhRDl3S56+aNPJWVUQgzwmxLxife0dB/9v8Rdiiw=;
	b=FUD5eC2W01lu1aXJ6fCvc5ZNRxvtDreWGw4A3vfSV9zISUz7hqA7+Hfwl9gCPhES2B3v
	 AcLJuE4bH2koE97fzgF3WG95S1BPRwIblBTsCNfXJgyplzLZWmYI2Cf+JIGHW4EYqyFRl
	 HUC+tFqWKYGlJtGQizOzbpP7GmN6tbwO5ucb+8OWQpy9i6ZNQaLkFztHxFd4ak0jHqwom
	 chy6eiYMt3x86iHQA/19iRgDRzpA1n38nvznHTqZSbulAMbaHwV5AQBCwOAaFn66sNKI/
	 Y+nbADoMApS5zO8nIed6j1R2+17CUsOL8bRY+LfHidVIJrwWUYofrJLODGhoJ9DrwpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Mo1VfA1Q;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8AF606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF8AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Mo1VfA1Q
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c423b145922so293493766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551566; x=1794156366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEErhRDl3S56+aNPJWVUQgzwmxLxife0dB/9v8Rdiiw=;
        b=Mo1VfA1QYS7med+7h5C2VSJWUvErjNDQBkiMVwcSRop+V16SphII3OJte2cUBPuAAr
         C8BxL3wPOI3Ky8AhF0wkCfP3ORb3XvxQaceMLD7ffw/UtUYG/wbM7k78/u5Pf4glpx81
         Fqn2aLbG0GQnnQayVcf6JUGvz7OPIfCcBPlIs2FrxS1fSHoHKiDs1OuEuv6z5coc9JB6
         DFpWyK1uLvNXJSZVI4HyUj/iAVHfJSx9LF9rX+JqQXVZDS4vg3Wal83xLp46YguuOWX7
         Pu+f3MhVPkO842hG1GXmkAQt4ghJBd26E/ujEws2yX4c54RnIKcVS1Jngr/RZvIYI8af
         LmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551566; x=1794156366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEErhRDl3S56+aNPJWVUQgzwmxLxife0dB/9v8Rdiiw=;
        b=Oklb8z6P/Qqgo8W93jABfMyGh9ThBGFo4cFwtM4L/uFjv0ODdh9AJPCDriWA7vbQBS
         N9J0eFLwUYCHqEtcH3NZ8mTAy7W8hY7ZIL+3QLvQ0ZlGLG9RhG9aR/xFNtrfr63SVT9s
         ssH3p9T709VDdy/VpzK+c4Z4SUDooMaBlOy057bKpooEnaRnLekqrifMoaUXiVTI2PLa
         0iMSOgROcqx1MHGJLUeLv4l9rqvT7MntQy0XL39OzGL/yjUY39mO8J0IYE/LbttnydIG
         U6cvLKg1422RDJq9wJWrnbTl/asP9SbKURKbG0mJbR2mUHW4SuCHeSEmbIJCNO/PQ97R
         kZEw==
X-Forwarded-Encrypted: i=1; AKwUvBxkbi2vFF5qIU3STyOrC95GLUAXHstpXGEK7lyv/QrzrCAJNLEYN8kHU+FBtDwrtQTyj5wFQqGpnkrmVv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfkG5abzZOtyr0OS9UXZ+XmT68l/TVLoPxQW8Xh8rqMMrfghJO
	LeE+OR4EX1D5j1YXeMIsL5sKYfoB7tQkdkfNMETIUTvPEHVss9WCiM8l1rLmHLhobQ==
X-Gm-Gg: AYBFou0XPR35SbvjiuNGy+RkBxC5ijVaFIW9feDSIBLNxWRyEOJJg2FQ8eSx3KCvBu8
	p2DgoaaJTzUYoL/4wQ+bOXv62HJXdoUXiyv59jSDeQgXrkG9DHMoHe5Z0PVYfB1wmxcCw3g7IXj
	FMTsWbkzBYHaa3F1igO/DFnefOe1SkeuryxVqddWQSXkDb7UwtD6gdsA6ko2GvVRNCwJKTdopBi
	gzi/Fg9GDapyf8pghFsZTRurT5j1iGelQ6XQIcNHP0NL5R1VIiTJzIdh+28odomJ+xJxgj2cVX6
	Pw9a9714If2XLaD8ca3rDJWC2RyAIjZiRM5wuliw/Law/j6Uj9isDPPp6Ponp0oDYQMpwZWk8Yo
	xjvwvdNcq+B5lV76bBeG0fZFXJ/dstPaIKC6wCvEXN9FshA1cInTxL/gpnOTemHhDGh092U4X1A
	JJQfSs6WZ/KNgZurv2sqmIjljzb9ntNa6pLMaFVooUt/iup1kAY4Pqvdiqb2k2BkvqvFrgHVlF2
	pogX3EJh2dCkAe28Jc+ud1pPA6ZzBJNBjwqsNx/deOuLJ9jbb6KthF+Y0D0PBKsA7KG2SCAE9x8
	ECj03WmEy568Daa6zop6OJhCPZgSOb6Ujtl5MCh/eOJr1VVAB4f+PRGUvMT/KUxczgCB4K7FJRJ
	T7cmPwXuuC0iyncAr7hHecoQ+ZXXCOGThwFbkITY6KrV9wQr8bJYxkFLOsEhBZwUtgIqRVGR6n6
	y9Oot6YMbX9VnVbGm8I1AAk2/n+IOWXCbFDneVNJ4HKjMmNN1pzkjyodrnuXI4CxaMWTCmnMfNN
	TmD1NrMjZdi7OnWo9S3EnNC3Q3rSzhDaYDJ34fse2YcoNwvn5kj/Wydy5mt2W7pCMCLrRIVsCyb
	WM3Aw0FmR6zBt5ZYYx373bHU0/yFj9F3ny8QaWuG
X-Received: by 2002:a17:907:3e9b:b0:c2d:bd87:7fa7 with SMTP id a640c23a62f3a-c4ca7a88866mr599588666b.24.1793551566094;
        Sun, 01 Nov 2026 08:46:06 -0800 (PST)
Received: from Desktop (p54aff790.dip0.t-ipconnect.de. [84.175.247.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd254sm296928266b.29.2026.11.01.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:46:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	richardbgobert@gmail.com,
	willemb@google.com,
	ecree.xilinx@gmail.com,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	martin.lau@linux.dev,
	ast@kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sun,  1 Nov 2026 17:46:02 +0100
Message-ID: <cover.1792857378.git.julius@bairaktaris.de>
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

GRO sets SKB_GSO_TCP_FIXEDID for the outer IPv4 header of a TCP packet
whose IDs do not change, and SKB_GSO_TCP_FIXEDID_INNER for the inner
header of an encapsulated one, since commit 3271f19bf7b9 ("net: gso:
restore ids of outer ip headers correctly"). Encapsulation,
decapsulation and the GRE and UDP tunnel segmentation paths do not keep
the flags on the header they describe, so a TCP stream that GRO merged
and that crosses a tunnel boundary is segmented with the fixed-ID state
of the wrong header. Sashiko found this in review of an ipmr series:
https://lore.kernel.org/netdev/cover.1792293419.git.julius@bairaktaris.de/

Patch 1 moves the flag on encapsulation and decapsulation and keeps the
encapsulation level below GRE and UDP tunnels. The three changes are one
patch because each alone loses fixed IDs in a case that works today.
Patch 2 adds a selftest.

Tested in QEMU (KASAN) with the selftest, 17 cases, 400 segments each:
- net (7076f684d513): 5 cases fail: fixed inner IDs incremented after
  IPIP over IPv4 and IPv6 (40 distinct inner IDs), outer IDs repeated
  after GRE and VXLAN over IPv4 (10 distinct outer IDs for 400
  segments), and a VXLAN stream with fixed outer IDs whose outer state
  survives decapsulation into IPIP. The same 5 failed in 3 runs of an
  earlier version of the test.
- this series: 17 of 17 pass, 3 of 3 runs.
- with only the decapsulation part, or only the encapsulation and
  segmentation parts: 8 and 5 cases fail, among them every
  encapsulation followed by decapsulation without segmentation, which
  passes on net.
- fou_gre_gro.sh and bareudp.sh pass on net and with the series;
  gre_gso.sh and udpgro_fwd.sh (3 paired runs) show the same failures
  on both, which come from the slow emulated machine.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  net: keep the TCP fixed-ID flags on the header they describe
  selftests: net: check TCP IP IDs across tunnels after GRO and GSO

 include/linux/skbuff.h                     |  30 ++
 include/net/ip_tunnels.h                   |   2 +
 net/core/filter.c                          |  11 +-
 net/core/lwt_bpf.c                         |   1 +
 net/ipv4/gre_offload.c                     |   1 -
 net/ipv4/ip_tunnel_core.c                  |   5 +-
 net/ipv4/udp_offload.c                     |   1 -
 net/ipv6/exthdrs.c                         |  11 +-
 tools/testing/selftests/net/.gitignore     |   1 +
 tools/testing/selftests/net/Makefile       |   2 +
 tools/testing/selftests/net/tcp_fixedid.c  | 396 +++++++++++++++++++++
 tools/testing/selftests/net/tcp_fixedid.sh | 291 +++++++++++++++
 12 files changed, 744 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/net/tcp_fixedid.c
 create mode 100755 tools/testing/selftests/net/tcp_fixedid.sh


base-commit: cb284914e749388eef402938bdb3115fe1f6d337
-- 
2.53.0

