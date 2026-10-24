Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851128;
	b=ayrEE6oQog0WGCA7a5xHGx4KyGd/7qLv5dw56MWnkf5WikMf/biVVe8GsJL4TI6V9BQ8
	 kkezDjYTj6q2wwLaENydqI/KSkzcGp2VCHYwgQn42WAHaDOP8myIDBgaB60U01QYb7UXQ
	 kM33jN1qOp4+nNkW0XfBRyRSYVOvg2yFkwRNLnESBE/VaotofXXWoiJC1lVnJ1iNVZ7xo
	 aXTO3kiOvcC7K1kplJpw7yMcquuXQqxJTVQlnl9VADCitXu3OtxwH38K4VM7I9TPVMOGt
	 /Ib79N6XiVChCGLTD/2tOPaVOvIW27noVjl2OGk9Uwl0anvFvZqFZIZHiPJNbnGTnqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CGYl3C86hfPgxp/SJNcGcvJ+3Ge62EjjXQJjZpVCIVY=;
	b=L96ddB5CB4My0jcg00y/7qiJ7soDhFD9EKnpspCa8hm42c7sds/YAr3BHHK7hXtB7t8f
	 vojzHXYo2uUz2cwHQEzTP7m12P1LiM8Sg/yrntkkMRTFAMVE6LW3BJq6msiOmrp3JPTdD
	 mn59BAtprL1kHoLAm50mhzi/vRnUvFzERPL1OA3e2GT6vc/w13LxkHMUVBPfMkJYuMDq3
	 IZOYLmDMkdHw63vj6FvVC7Aq2JMR0wZfUNzlxPr0vOyaFwxPD4NwIKqSmrQilNimqI9YL
	 SAcq5OSWNKN6WlLuUwfvYarlNx3IRePTJNtjZ4qpWzb0rLOjeg1cbVuSBgCpHRw6XRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qN5mw/Re";
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F65F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F65F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qN5mw/Re
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so1648242eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792851127; x=1793455927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGYl3C86hfPgxp/SJNcGcvJ+3Ge62EjjXQJjZpVCIVY=;
        b=qN5mw/ReCB7w8Fr8wpbp17/Wt0LcVzV62xdjLQJ45acFlyX54MQXD0yvZoA6L8h9UW
         SiiD9IQhqeUWGygZQriJ8FqLzFn9RLTs8083oNXLfcKarEq3cvER4owatxsYqXeq8Jkd
         W9C1Sz6G7shKH5U1M8kbiBE6OgQDySs4MCSjBmrQqu9wSo9UlV2qE/T+bfMdQ+GA5fU5
         r0f7O+Yx5nywRv6ffU3HEQ4x2mFkftgZJu4dvT7m66Afx1IY4sR/aYG94t4t1bczeWFi
         mZHgp8AqWv99yVVShTVN2KQTRP9ugWMbOdhS++FaWnokQ19pN6smKvYZi51G1H5Ozps5
         0+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792851127; x=1793455927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGYl3C86hfPgxp/SJNcGcvJ+3Ge62EjjXQJjZpVCIVY=;
        b=pR6QC+RyIrMSVkWxvD/CPnNmZ8429ADmPz/weOC7YlbRKWB7wJKuWrNm+d9vduo0uM
         yBsJt+TqbXrRXliMoXFEap9B2F5yTElnPtkSbYIOhZgeClSOSbeYdAkJXgzn0HrANp9A
         7zHdBLpexKUJFUb1X0GWMjwSrEX7AcIcuGLf9TD/m1rEbGYl83lIxGiqUW08RkuuTFev
         vcTT3ApNQor/pV7/Px17PVkTeIhXfMurOumdpeCb9loHPo7/A9hYDPKXi+I4c4yIQT9v
         DecZuBGdOKVY/kPdQM5SxrScIUpZA4GURYUx8p2Qd1IrR+4kgFpOvJzPFMbcIOJGF9+k
         Gy4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwKJwzQtJncty6q0zpCZ6SuX2NEuzicshvpXW7RXss4qIOcBw9EkJjdH0tY06jkB82qOHG6xzOtUCE7G0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvISPJlzJBlUe3QFMAj/n/LuNgCCzZ3BbPpljYUIvKXqYB6mnx
	MbJbdG72b0Fbe2bayhbInGVR8QXqfSXQCFkpHoMdt5FwtVFyU1W1/hsQ
X-Gm-Gg: AYBFou2loqVMvy0azgCJmUgguBrXjav6Bf0cNBAw3cJIY+VgKBjNl445972tQ9WaQ41
	CEQIihHtH9l+7F8R0LPkesIxEsZdy9x0LEJZuaVianPd4iiG+9BLWdHRDHGfEG+e3HplfFZ9ans
	D2acpFKEIYEKRIUa7yhcCUjwG1W7X0Q6JgzS/Dfux3Ut9482/te/f5d2yyb5cug+cqVGw5J+T55
	yLfRihm/m4r+wXFsTfpKPQ9xo41d21gMniDqhFGybyd8EBPc2trvx50Tfp5CdmunJenZazqiUNV
	FZWUuFRKqH8oJKpFfRvXOukmJ6gHHM6DApx2esQo2rWeMtJOcEh22ryu77ibzMtR5OfNiakpdI1
	mJRZqPB9/lClndzgI49H+MKZQhihm8QEeVvvtLPnhEc1AehUdMyvq+2Dec1/dNYv6iUh87dIz64
	c/NDMO8tZGBykA94zvbStGSI/InNUj036jWjCBeXj1cKTM8U1Lwe4fzlYnIA/68bsjerahdMLbi
	OBeDjupgWsmq9Cmk1DPC8fIA5T8mXOsRnGPQL6lJbuDWY9GKG4V1jz2L1nyRwS+HfiPJF5A5csZ
	wXkVy9BI1y/l6naIONoxOG/N
X-Received: by 2002:a05:7023:a8e:b0:14d:c9e:a356 with SMTP id a92af1059eb24-1993571a2eemr3465311c88.12.1792851126409;
        Sat, 24 Oct 2026 07:12:06 -0700 (PDT)
Received: from 192.168.1.7 ([2409:8a1e:2330:4ef0:6887:87ec:7e6f:2a79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm6366905c88.12.2026.10.24.07.12.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 07:12:05 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rongzheng Wang <testwrzwrz@gmail.com>
Subject: [PATCH net v2 0/2] xsk: fix multi-buffer TX software checksum
Date: Sat, 24 Oct 2026 22:11:55 +0800
Message-Id: <20261024141157.59301-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261024091256.17918-1-testwrzwrz@gmail.com>
References: <20261024091256.17918-1-testwrzwrz@gmail.com>
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

This is v2 of the AF_XDP multi-buffer TX software checksum fix.

v1 was a single patch containing both the kernel fix and a standalone
selftest.  Review feedback asked to split it into a 2-patch series and to
reuse the existing xdp_metadata selftest infrastructure.  v2 does that.

Patch 1 moves the software checksum calculation from xsk_skb_metadata() to
the point where the last descriptor has been added to the skb.  The old
code calculated the checksum after the first descriptor, so multi-buffer
packets only included the first fragment in the checksum.

On a checksum failure the packet is now dropped after the descriptors have
been consumed.  Metadata validation makes this path unreachable in the
current copy-mode implementation; keeping the defensive drop avoids a
retry path for an skb that is no longer complete.

Patch 2 extends test_xdp_metadata instead of adding another test harness.
It reuses the existing AF_XDP setup, packet generation, completion, and
verification helpers, and sends the same UDP packet both as one descriptor
and as two descriptors.

Testing:
- final exact-else patched kernel: xdp_metadata 1/0 PASSED
- same-config unpatched kernel: checksum mismatch, xdp_metadata FAILED
- checkpatch --strict: 0 errors / 0 warnings for both patches

Changes in v2:
- split the kernel fix and selftest into 1/2 and 2/2
- reuse test_xdp_metadata helpers and reduce the selftest patch to
  86 insertions
- use literal else and unlikely in the checksum error path
- document the drop decision and test it on patched and unpatched kernels


Rongzheng Wang (2):
  xsk: defer software checksum until the skb is complete
  selftests/bpf: cover AF_XDP multi-buffer TX software checksum

 net/xdp/xsk.c                                 |  22 +--
 .../selftests/bpf/prog_tests/xdp_metadata.c   | 126 ++++++++++++------
 2 files changed, 100 insertions(+), 48 deletions(-)

-- 
2.39.5 (Apple Git-154)

