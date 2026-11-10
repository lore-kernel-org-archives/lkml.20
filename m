Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323972;
	b=DoVdCvnpUkSslbFXl7pD+oI26KCRBaQnMOpf6ZxQD0pG+HQFs9J0TrNPswbly42yw8lW
	 dS5EgXfMMJJ/+yhERx1MUwoEI//VrSmxCE0i2PrixxZt/npjp4N/8MzXvSPozIMXDXT6u
	 lLMOKsAn5qdQK4s2z9c8oDrkyaVoKNXBzRt5ogIDxBZcAYDDEDKK0kD61ZFbR6nqPsl+M
	 UevXl01/NBm8Y6d/LfrEYCkX1lsdtr3aGWKKErzh9j+qRufrnW/FF1235xHeRoy4fYXxS
	 MBbqPnrNKpQ14sh5hzSPgnslWlulo8xMvcHSD3CfFYwR2LcsAT/lpHDyZiI7MHtbCdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pAB7/fvVZ95YxomLelu+IUsi/7sQRWLNuwSNWCsfc7A=;
	b=Q9PP2GF+NUjuqJVMAjaRfQIRTBOZ2PQEY+gCmFSvxp+saOsdnLKbrov1OTgcCpzM8x+g
	 Obeor63yRpnx9ysCyznU2cZCr5lRR88wSqU7+1X66Sbs1b8/NtJk0X4szkQ18Entf95ws
	 DgPDHR0yPuEnQrfSTg44T8/U7tFhV+2rprnZdI9O7EVrEKkJ8bOrTXKHFnpMGYbwJ180K
	 6n9iVfsiga0Zj/PeAJt8LW0sgTZqGOVusTpc4IOiG+YMwVyuQRqRHDtQS49N4PzyfDKqf
	 vycDJisX5MG/HAzp1zuz0IyO8GNseoahdRR5tjWCHkjEURlYOUMCA4v7rA0Qk2/Zg/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HlICEDVX;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48910606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48910606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HlICEDVX
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9995ce866so14906295ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794323971; x=1794928771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pAB7/fvVZ95YxomLelu+IUsi/7sQRWLNuwSNWCsfc7A=;
        b=HlICEDVXxHfK5otqLwk8U8Wunu2XWClI0Q0ReeNvl7DBjdgB+Dn5hxhOdJejFHfZZj
         NXblgliU9kDcQn1NEzBtX3IBbISmDuTZYrSEnJA2+2LNzT6IINBDJ/IhGTG7TYUrp3+a
         u6WRO2QUIXr3sSNUllom3ctI5W/nEekOiYfLQ5gYjJGEQFTxAiAUwmjSfZX7ixz/FMyd
         VsYRHyLLWrsihY6Fnvowk59pjNRZUt1pHiOlg6D1DKYiK/YeHBmsUukHvygq/hy2N42g
         2i+HVx2tfZRYaqjH1tTBptkcsV/2bS9ta4Vi28ZaYefaKTZ6jlDYQT+rH23pz/SAyga+
         CYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323971; x=1794928771;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAB7/fvVZ95YxomLelu+IUsi/7sQRWLNuwSNWCsfc7A=;
        b=tfUqwUCe+smBjwDNSSymek4vNlvzvdIiJQweKECqwL7yyYCFGStJCpvZYGZABmaiKZ
         PBZv+sc1KG5NqOozc4rHvCeE3nhKhHBi4pDPtvi+RseN203RE0JafPKSDIYb1InIhAdF
         ROtSrlIYvnQ/Gyn6SzuRzEFb5wXZv87E0aHqr13EUwOYFUwUqOzGDUYAKWR1lIL2oB0r
         p0Y2Se0Xi5JZtQDykec8EbNNrxHDCNn1RTbeB7fvPxa0lO0c7I7M8X0WDijAD8dYd+9a
         G7SH9UdPQBDSqQFrAmFFzM+QwFDwgBAU9Ybg21vbwAhz+VwDt8c4ZMKPrIWM/H/bnxN5
         Rmdw==
X-Forwarded-Encrypted: i=1; AL+hErH5iSpJqwaaU6PZWhVqUuobHQybExdZcPDyzURrGcpaoVan0PK7UQ771+kJI0drv6v14tHtz8PDSKJU820=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JzQku5IKf+OqGpXPv3RCp5+nS/92UP4LNKSdb7b4QuLLiY2mi
	j3rdT33TgZ1FPqtYjqAxXcQg2PR/gp13ucFh4B2Te05V4/D7R3gy2g4/3q+fXVNIkR4=
X-Gm-Gg: AYBFou0g2zbzCCsAeY4a2kaF9kKFv7SWL7ZZjOWPo/arxaa1tlYTXh1oddUbo+2ftgh
	3fNZROTRowAzaIP7G8NvjpPpQx2TiRC9rZOvzkoffzQNJYAnOCGxsJURIGMR6TD9iVIZ9F7VyOg
	Eai01JQ4IVRL/zW2dKS9g+c7VhAQARa7uVltfgDjBLrkRvR7eYCoGap8S20MoTZ10bkC/wxIGVE
	fi5L45seMg6mEaoSDqyziopryBZiHuQ+UhwcUCRuu3/mbc+Kei+eY5EWJGQr9ORNmk6aOiNPw+t
	nXdcgPXfqKSLjAvKHr6ZSSsaZrJqBsae66t/xLUiLV9us8bjgQvvzBeJmpBp+ssam+2GUi3OCDV
	GWrvJznNci5IzjcntAS548r/jJpy6iTxMJUg6w/E/99QNa2JIRm7cAfAa83x7doe2RpZYl4RoHS
	gHZhtCOGt20BSK5tELNwFF9+9Bub03cROxR/Z2kdpS+48telyEc7GTwlWzQw/ihn92twZG1SCdC
	ojy4If00cZp7ICo9tp6znLMn2KFoiW42O1Ba0300YslopzPuiK7aoMRGeaepQ7etnASFZVBTkFJ
	gMvHtX7x0evFSdU1W8jkhESI4YkzDNNgiDgeUjW2o7LrJWkCPFeuUIcz6ZEhzvVSsxVFnXg=
X-Received: by 2002:a17:903:228e:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2edb912b301mr29703235ad.14.1794323971526;
        Tue, 10 Nov 2026 07:19:31 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d906e4sm10414035ad.40.2026.11.10.07.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:19:31 -0800 (PST)
Date: Tue, 10 Nov 2026 07:19:28 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Ido Schimmel
 <idosch@nvidia.com>, Sabrina Dubroca <sd@queasysnail.net>, Andrea Parri
 <parri.andrea@gmail.com>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Willem de Bruijn
 <willemb@google.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] rtnetlink: return EMSGSIZE when first dump entry
 does not fit
Message-ID: <20261110071928.6e8aebd7@phoenix.local>
In-Reply-To: <avLVfWQEtsLH4BUA@fedora>
References: <20261109012115.11898-1-stephen@networkplumber.org>
	<20261109012115.11898-2-stephen@networkplumber.org>
	<avLVfWQEtsLH4BUA@fedora>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 16:27:41 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> Hi Stephen,
> On Sun, Nov 08, 2026 at 05:13:12PM -0800, Stephen Hemminger wrote:
> > If a route entry is too large for the dump skb, the dump is silently
> > truncated and no error is returned.
> > 
> > For handlers with RTNL_FLAG_DUMP_SPLIT_NLM_DONE, rtnl_dumpit() drops
> > -EMSGSIZE and returns skb->len. With an empty skb this is 0, so the
> > dump ends with NLMSG_DONE and status 0, and the remaining entries are
> > lost.
> > 
> > The first dump skb is allocated from __netlink_dump_start() while
> > max_recvmsg_len is still 0, so it is only NLMSG_GOODSIZE. On a 4K page
> > kernel that is under 4000 bytes, and a 500 way multipath route does not
> > fit:
> > 
> >   ip link add dummy0 type dummy
> >   ip link set dummy0 up
> >   ip route add 198.51.100.0/24 table 100 \
> > 	$(for i in $(seq 500); do echo -n "nexthop dev dummy0 "; done)
> >   ip route show table 100
> > 
> > The dump prints nothing and exits 0, although "ip route get
> > 198.51.100.1 table 100" still shows the route.
> 
> One question. AFAIK, `ip route get` doesn't support "table" parameter. No?
> 
> Thanks
> Hangbin

Your right AI is wrong in the commit message.
A way to use get is to add a rule.

#   ip rule add to 198.51.100.0/24 lookup 100
#   ip route get 198.51.100.1
198.51.100.1 dev dummy0 table 100 src 192.168.50.131 uid 0 
    cache 

But best to just drop the incorrect wording there.
