Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A733BBB9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790041160; cv=pass; b=VbpFVBtHeeCdF27611EgtnE2wvv6rkNt9d8hcfqHO6knF0GF1XWOZMKTumA79+e1UFViV3wodfyKSSyvzpBZtgkFCjsT5kra6+eopkY0/jUrz3+4Wi5j/dhriRJ8pewUfPfeb+y+ghlamkMyCmNyW4fYNN1aLOuopSqtscke75U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790041160; c=relaxed/simple;
	bh=nzKayMpt5LpI2eLOKchl+ApCZGT1r93JNTtN1iAm+qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJLPhOmkFtTq7zZsfht7VcfLxWd2DVmGjz0TbCMznrHaUWpJeRYuNDr7TkzdfqjfyPbIZA9sNrawocvx6va47/jkN7RrXS7S3cjdiKtj0Qk53aHDAAYQIxpLS6EspwNi38gVynaCbswEFS4kBR2Q54tkgPi81r2MXTgPpm6JNng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PHj02wF+; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PHj02wF+"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso4345025a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790041157; cv=none;
        d=google.com; s=arc-20260327;
        b=nJ8+DRDwVF34fQ2IvFH6CMUqYssSxFP/RThmHR819eKEwCFCoF7om/eJfUxfQn5e8D
         uzGQ3Zw+UTtqz0QIooHIlpo6iNWBVDckJxyEbxGlDOJ2DfxNMg2xW1gkFHST2Xz98hwG
         w4HhaTw4SOwsHGMuVHMKxe9+ZbTt/4MA4Gki3WAmXLuYS82mRW7sa0DMhfTsQMbhl+Ry
         /rh7opS0iAOGBV9JVKY2I0AeDaH7tPQytMDkKAxyfzuML5Cs0DgkI5KgrV98l6kL8C4t
         5yQCBOBs/lr2pywasrHmHI12YfG5kcIQdAkEBbY376CX8dJyiDqSV1y1A6QZT042Upq+
         d/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3+sqL9EndfnUuC3ekBlZfho08escxH2wAgTzkVZingk=;
        fh=80Jo3v4rkBZBalgoWdqnD3b0jGse2/GhISoqRMTrgqE=;
        b=FGVStRCEwHboNVDO//CyW9ZeEx5nTT55KrpweiVHbgRNEhZW/g5r2MlfeVAbIA7i9U
         W9/Glf+413G08R6l7A0jdrTi0NjrOtZaiEAg2TR2FEJLPcaZhOppEIb5ReTdEP9m/JAZ
         W6dL6g7RGHQf2x4s2qy87lmp0ecTpJwAkTPh6xaJIWx03sSTq95AFpz/Hdf3Yd/95A2e
         dFR2wRgDSsjtPyxTyscSqGzb/Deq1G1tqOdmR0H4/TGvvVoVO3HjKArUcc5cBpFl6bNZ
         uC1/Wekg4UJh0q/qAjbjqFX3lOW0e9ouGc+nUFzG3HjVP3X81X206gq68fuVUXmsm/8q
         DdoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790041157; x=1790645957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3+sqL9EndfnUuC3ekBlZfho08escxH2wAgTzkVZingk=;
        b=PHj02wF+S1igaSjToouEgfLXh9CxfHR1DvJwkegHnYIM1twZ1tHdwxaGQ2jlr00fd/
         NUpCIArR9KVskYG/fAkgijnd5osUj7jCzJobZvQoaukY3GNe0yCJoebEvhzv2kTwOram
         GgX/XZXh4jr2x09HQE+Yn1oQ7msb9kwOmXWFu0QgGPLEAXUQ/y8YIuAycFkNgq4sQv3n
         D30pbtc0ZYrndZn52jGrDGl2UaXpkyO0jsO5GOWTj+d2z7ZMv0/KbxI/hZSOIbabkMbx
         GsVHB2Vq7c7Fndt6ODkbFV/ijYG+ugv3SRGfHOlzKH8ZN34Xvz+VPlaaB7iPr/ghAhF4
         k3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790041157; x=1790645957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+sqL9EndfnUuC3ekBlZfho08escxH2wAgTzkVZingk=;
        b=K2RTnxAaj1BjcHZvOrE8k+uR81pC6ch3/2iJ5Q/oHt8nFr0SREHzToBNG4JpWabieX
         gqUhGPwW7L0lWD/y6927agSLsIVZ7o9awDagTegIKsAfnKQcauBrdo/H5+AITXUG9toz
         C9Vmy+oW1LtdTl0DR3jj+FmZiZ2AQLIFjomy7FhqSnRbBz8RrF+Tk2VgvvdZ7iqOtMuW
         HfBIfAsoiiAKeca9TyP4UxP2jdLmqo/qgRLX3KcYkJ0fauqEUK2lzLyEAz4Ujy+Q+ys+
         +rDoKjRZY0xfXcyWnLe3joVf5rG3uYeMOgTzZP8LYH9yol26i3DksvoHSXswgmJbj1wx
         ZTxg==
X-Forwarded-Encrypted: i=1; AKwUvBzI+KMHkbAFyWZkvNXacxC2eLwvtxGkez3upJ5ux1ie5fGLJAB0+Y9q46rJPYIvwga3R01g7p/OEHy3vRk=@vger.kernel.org
X-Gm-Message-State: AFuF++mQDU4zUIP9D3EL7KOPI/5BBYTcxFZNZwTQcDwVNFpeFR6NAhW1
	BRBERrXJhdCI6skXHnD5/NK+pd7o07sYPIc2r1MTpc/yJekt38YTK8kKnqzmVUhezSnFvZsCm4l
	8y2WuWN4n1yoz/Whqgp1RoO96ACxlHNE5uMqKymIo
X-Gm-Gg: AYBFou2rPuvqVkOVWD6KpeX+tQAZetA7Egh/beEe1snVwPjHgCkW9wM6ApK4pUKZLQ4
	DobZ4vCkjKtrTvwJVYYIlpWn06h5ErT8wBZyccucSHdxnydT7pv1V+OiX8X690WTQe6t3Qayr7n
	Cp4HcNLlydVCCbUkkA8ZEDDvqUQHuLE5CBTkrnivR1mJzI5dyzMCOUkDsLZBW2DlV7zduPJ8j8J
	nO5dFYQ84yzT8Dh0SKEoU0KJ4Qp7Xly/zf4vy7X+BJmD/2xJ9WKVzrvc0Ia4zY4OkKbNOH+x2aL
	jVB/IjS9i0DswZPrIDaPYggX+Wh5HeIk4W6DC3NNy8OINKkU/NCwfkiTf6F9INVVyKdyJridMwW
	zykRVPk0Bv4+4iYFC8HIk9P7FjhPJiozsEPgHTLGlL9vuX1yTWZYQF3Yp/JVGFok9jmZRT20M5C
	quMG9ausDpfdmpMG6MCGMt4MyA
X-Received: by 2002:a05:6402:1ecd:b0:6aa:a6e7:b0 with SMTP id
 4fb4d7f45d1cf-6aaa6e70422mr9471a12.1.1790041156323; Mon, 21 Sep 2026 18:39:16
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-udp_hash4_fix_v1-v1-0-718891af0d7a@mpiricsoftware.com> <20260917-udp_hash4_fix_v1-v1-2-718891af0d7a@mpiricsoftware.com>
In-Reply-To: <20260917-udp_hash4_fix_v1-v1-2-718891af0d7a@mpiricsoftware.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 21 Sep 2026 18:39:02 -0700
X-Gm-Features: AcwNN1VS5-tmQwdV_hNQPnVds2HKZ6G4TX5VEKVnNrvmlJfpkS67ooCdmA57lA0
Message-ID: <CAAVpQUC-QN1meeJJedRk7Go3+nUNywi+E+XQpzXFvpWPEtmHWw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] udp: remove a disconnected socket from the
 4-tuple hash table
To: Shardul Bankar <shardul.b@mpiricsoftware.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Philo Lu <lulie@linux.alibaba.com>, Fred Chen <fred.cc@alibaba-inc.com>, 
	Yubing Qiu <yubing.qiuyubing@alibaba-inc.com>, Willem de Bruijn <willemb@google.com>, 
	Cambda Zhu <cambda@linux.alibaba.com>, Janak Bhatt <janak@mpiric.us>, 
	Kalpan Jani <kalpan.jani@mpiricsoftware.com>, Shardul Bankar <shardulsb08@gmail.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:26=E2=80=AFAM Shardul Bankar
<shardul.b@mpiricsoftware.com> wrote:
>
> A UDP socket bound to a specific address and port keeps its entry in the
> 4-tuple hash table after it is disconnected:
>
>     sk binds to 127.0.0.1:21001
>     sk connects to 127.0.0.2:20001      // filed in the 4-tuple table
>     sk disconnects, connect(AF_UNSPEC)  // still filed, peer now 0.0.0.0:=
0
>
> __udp_disconnect() takes a socket out of that table only as a side effect
> of ->rehash() or ->unhash(), and it skips ->rehash() when
> SOCK_BINDADDR_LOCK is set and ->unhash() when SOCK_BINDPORT_LOCK is set.
> commit 6996a2d2d0a6 ("udp: Unhash auto-bound connected sk from 4-tuple ha=
sh
> table when disconnected.") fixed the same end state for a wildcard-bound
> socket, by a path this one does not take.
>
> The entry is counted whether or not anything hits it. hash4_cnt on the
> hash2 slot stays raised for as long as the socket lives, so udp_has_hash4=
()
> keeps sending every packet for that address and port through the 4-tuple
> lookup first.
>
> On IPv6 it can also be hit. __udp_disconnect() does not clear sk_v6_daddr=
,
> so udp_v6_rehash() files the entry under the peer the socket was connecte=
d
> to with a zero dport, and inet6_match() compares that same
> field: a datagram from the former peer with a zero source port matches,
> and source port zero is accepted on receive. On IPv4 the peer is cleared,
> so a match would need a zero source address as well, which the routing
> layer rejects as martian. The stale sk_v6_daddr is a separate defect, not
> addressed here; removing the entry closes this path either way.
>
> The entry can also be relocated. __udp_disconnect() clears sk_bound_dev_i=
f,
> so a subsequent SO_BINDTODEVICE calls ->rehash(), and because the receive
> address is still specific udp_lib_rehash() moves the entry instead of
> removing it, into the bucket that (rcv_saddr, num, 0, 0) hashes to -- a
> pure function of the address and port, so every socket reaching this stat=
e
> on one address and port collects in one bucket. The bucket cannot be chos=
en
> from outside, as udp_ehashfn() is seeded with a per-boot secret. This las=
t
> one became reachable only with commit 644f9108f3a5 ("udp: Make rehash4
> independent in udp_lib_rehash()"), which moved the hash4 handling out of =
a
> branch a disconnected socket does not take; the stale entry itself dates
> from the commit in Fixes.
>
> Take the socket out of the table before __udp_disconnect() runs, while it
> still matches how it was filed. This also reaches the wildcard case ahead
> of udp_lib_rehash()'s udp_unhash4() branch, leaving that branch unreachab=
le
> from udp_disconnect(); removing it belongs in net-next. udp_disconnect()
> and udp_abort() are the only UDP entries into __udp_disconnect(), which i=
s
> shared with raw, ping and l2tp sockets that are not struct udp_sock:
> ping_prot.obj_size is sizeof(struct inet_sock), so udp_hashed4() on one
> would read past the allocation.
>
> Fixes: 78c91ae2c6de ("ipv4/udp: Add 4-tuple hash for connected socket")
> Assisted-by: LLM
> Signed-off-by: Shardul Bankar <shardul.b@mpiricsoftware.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
