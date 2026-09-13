Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C85938E8A4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789271408; cv=pass; b=qjO8KMNBqoyNHOfcZAcvYIKvCl9rYbgeWbRgvFUkx50abOOPJSinyV5x9PfEdmRxrvMybrfMvA4p3N/3pUB4y0JUp/AGvbzPioIfvRfUU0k/a/j9c1AEd0T5ItDt4owM3WibeLGmcMudooXwib1Z4n0JZOm4CgXCzHLBrrmvm5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789271408; c=relaxed/simple;
	bh=qHDZNZCuNLGTslXN7zpQxKO9uh+VQZC9VcxHHMONvH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8kzSFHKDUMIINs2h2lCC3bQLH+mQ2TsS15lzRs2iRU4Xo7VjwajQ2RFVj7z9kLfcDSv++yBmZVbBVZU9ATyfF9CvvnU0OJfpPxbB/SgsY9o+vjNblBd7NauyC0ZWk42o1kvRX+A8gz6ucKhIgmQqbfzUkIlXqBhiZIHvTii9Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wbg4tKtq; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wbg4tKtq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so1730205b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789271406; cv=none;
        d=google.com; s=arc-20260327;
        b=lAszYqmuTWImZGi66RDGWGfUC55n7k7MsWGb+2OcdJSryNVz0cJr2sRizybD3q+TSi
         d6vkDOsj0hrrvTQciNA7uHBxIJM1d7GBarDdtEUoRszWb3tjBeE6mM2aSrmhv46q6Nfl
         +vPml0dPB7V2lQ90/YXO9t5dCTDTb1PFdodtN1jN3skReuB5cfDwNzdr0NO+U0Z+nYjp
         gimJFYDB3KmU06awiUQLQMyCjpCr8QDPB3EpBGMJJ/l02dFmjCv6Y+lJKBZgFdwT/lNQ
         /8eOO3a7RNAljDY16XBpIWGzhIuZHdyncJLQIQJfqttQlSN4YN478faud+iN3AgifsDA
         J85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t2eI+3BqfqqgWCiKAA4lWMqS7KzjiuarUSAM5ZGBwRI=;
        fh=1x2ScxB71n4OAnXAFAKLgY6tzqujG4/VFK68G600Kbk=;
        b=FKHQh7A8h+K4LlHToUppGFiIj7IeH7dxhEylNEKqAAP9P7JifFc5bne2nI8MZ3erYo
         ANm6H3xG4hGpHnIOuvT4nroMzl9MVkg17ZXg2wynHEvgklLByLAnfhbIdASoKW0x8kdj
         IXX144NnkiecfkMfZ54vUFuAbwH2JmnW23IqsuEaYtaC6FMDCGgoMv+FxqKHJlWhv4I5
         z/nq/+cublaVqH1zuT7sSlTRSt/PHiFYzRDCCEgk+Alaf/qN3OgiM38bWeP97eTzVFbG
         onw1v0dYGeSp19EvA+F82lz9vUcPocnxabnF9ISmSkgTwN8IBxfUcIMFVJRqB/VKK3iI
         JU0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789271406; x=1789876206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2eI+3BqfqqgWCiKAA4lWMqS7KzjiuarUSAM5ZGBwRI=;
        b=Wbg4tKtq+QKwlal4PuJJVvFlyrVbIvn+3dIvDxBXoy1zNg3ccFOUzXPxmRB2b/dXiU
         MPR9N8Y8tM/fnsN+uav4FFEWU81XnfpCACqzP6ZOLWDVyn9Y2nCmx3aCi2XcMQGXhmCZ
         GFZHfXZfn8s+sd7/6GQUoindPDSaGrF56oZx069guO2bAI3rgcdnM2ECCxatsocpnNLQ
         J545PQdMfLF1ByWovUEvQs6D9VTipj5K/L0QSd34rkHSUylnLJINKmpQ//xvUPkhrkdS
         /u/gi4Rx6I7f9Aeg8f2w8Ils12nsw8hlCKyRBhxCCD9ghDcjX2Mf9p+e7PhZo3E08Vkc
         5tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789271406; x=1789876206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2eI+3BqfqqgWCiKAA4lWMqS7KzjiuarUSAM5ZGBwRI=;
        b=lAfNsF37EbUhnbOL2leqA5OvTVgLIcbjl2Fkoo48vzfy9U60vVg0daCgwmzfI2Cney
         t14ERetait7Uo6ReXp0aCef57IkcCHnWe9p9CU7Zx6jr0Q/Vz8YDxV33VZKwoz31xbfO
         D2gbel3zSLJ1m0pLX9xqkwVu170Ucg7PSC2aedtSorwX9fUAtLtUqETxj/G7cS539ow1
         cWslj1MWe81Ti/btwmCXKGeIwIRtUrzN/m4p5Ow/WA0IrNUyCNfyVRpj+b/HbEmUVzK/
         hwobSha3gakB7UO19EoT5p690Jgi4XU28grmmICAOyrZ90JOn1GfxUoVhPaEnqjbcfjC
         Kcsg==
X-Forwarded-Encrypted: i=1; AKwUvBxw/uTL6wFeHPlP2b/SuPHkWT8DxchlGuUMF9ADtztMqFH0AxQnoJpamWI6ZuhKGatldDuzj224SQZXW8w=@vger.kernel.org
X-Gm-Message-State: AFuF++lOg+NKe6tQKIWWO/bJiF4kFbMp9acUTHKdBDS1pyHNKH9v5lM7
	DjHFRuXQ01wcMdkLlUt1XbdZg3mQr8scZwvZxxiQ//l9ciEXuz/fITJSICIftDi1lF/aF9KOdzh
	AS/+MkJyrcaO7KB9BUUlZikyaE2efZqY=
X-Gm-Gg: AYBFou23dMT9Q/dI2S+SsY0FTEgY7dLAM88RwXMxlHq1grv6634x5A5qhJ1VS6iyc2d
	o2M9tg6LGKjuBOzzfSwApxL7MyjWJ0kNmzXbj8xoQYDlJbRRxrL8Ou51GcjRtf60kwZYf4C278c
	mGZe4HS7UXfliQbF7Ti5YZ7nzYIXWWBiVa6DFahgyVF3/pc/dAp2Tfn8ArG5CD/hxxQZoXT9vaM
	5a53rGtwy2vRY9BBe89RHAk4n/iDx3vMmE9isFcwoJlsy0LZWOgjREMB4Ef27HRNvN/0tIffxnC
	UQ2BiNXX19jmBHMXRmzBa/32GqgutpPWhJmyXWVocYHGT5oCiNpdEfv6Lw==
X-Received: by 2002:a05:6a00:4c8b:b0:857:727c:a1f6 with SMTP id
 d2e1a72fcca58-86b3170e7c1mr19369536b3a.24.1789271406470; Sat, 12 Sep 2026
 20:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908060410.3982-1-nashuiliang@gmail.com> <20260908133636.2ea807d9@kernel.org>
In-Reply-To: <20260908133636.2ea807d9@kernel.org>
From: chuang <nashuiliang@gmail.com>
Date: Sun, 13 Sep 2026 11:49:55 +0800
X-Gm-Features: AcwNN1USJ6-xWXXxQWNVK2TyF7NeCudGIJsb0qkkp7Q_Wt7etGNqDQWwyy2_E-Q
Message-ID: <CACueBy4BvJ6E0RuUDsQmwPq_zt9Xh6T19DOAkA5MW-uU1yNpKQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9] net: reduce RFS/ARFS flow updates by checking
 LLC affinity
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, let me restructure the issues.

> 1) Also not sure why you're trying to touch RFS, the change only helps
aRFS and you could avoid bulk of the refactoring issues.

The scenario is similar to the one described in "[RFC] problems with
RFS on bRPC applications"[1].

I attempted to enable ARFS on a Mellanox CX-6 NIC. While it performs
well for simple workloads, performance degrades significantly when
running a bRPC[2]  workload on a 2-node NUMA machine. After tracing, I
identified patterns that ARFS/RFS fails to handle efficiently:

- Multiple threads use epoll to read from the same socket, causing
frequent flow updates in sock_flow_table.
- Threads reading from the socket migrate frequently between CPUs.

I tested a PoC version using a bRPC service, utilizing funccount [3]
to monitor execution frequency and perf top to observe hotspots:

Before Patch

The mlx5e_rx_flow_steer frequency is over 380k/s, and queued_spin_lock
is a major hotspot (6.30% in perf top). The application also suffers
from a noticeable drop.

FUNC                                     COUNT
mlx5e_rx_flow_steer              387594

FUNC                                     COUNT
mlx5e_rx_flow_steer              390142

FUNC                                     COUNT
mlx5e_rx_flow_steer              386694

FUNC                                     COUNT
mlx5e_rx_flow_steer              389094

# perf top hotspot:
queued_spin_lock                         6.30%

After Patch

The ARFS update frequency is significantly reduced. queued_spin_lock
is no longer a hotspot in perf top, and the application's overall
performance has improved.

FUNC                                     COUNT
mlx5e_rx_flow_steer                      43

FUNC                                     COUNT
mlx5e_rx_flow_steer                        9

FUNC                                     COUNT
mlx5e_rx_flow_steer                    207

FUNC                                     COUNT
mlx5e_rx_flow_steer                      26

> 2) You put a very fast path function out-of-line, why ?

The reason is that tun uses sock_rps_record_flow_hash(). When I moved
all rps_record_sock_flow and rps_record_cond modifications into
include/net/rps.h, it triggered the following compilation errors due
to symbol visibility:

ERROR: modpost: "cpus_share_cache" [drivers/net/tun.ko] undefined!
ERROR: modpost: "cpus_share_cache" [net/sctp/sctp.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1

This arises because the patch uses cpus_share_cache() to limit the
RFS/ARFS update frequency at the LLC level. To keep this in the fast
path, I could move cpus_share_cache() to
include/linux/sched/topology.h.

1: https://lore.kernel.org/netdev/CAHCEFEwToeQe_Ey8e=3Dsf8fOmoobvrDCPsxw+hf=
USoRawPX03+Q@mail.gmail.com/t/#u
2: https://github.com/apache/brpc
3: https://github.com/iovisor/bcc/blob/master/tools/funccount.py

On Wed, Sep 9, 2026 at 4:36=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue,  8 Sep 2026 14:04:00 +0800 Chuang Wang wrote:
> > v8 -> v9:
> > - fix errors in AI submissions by Simon Horman
>
> I commented on v8 6 hours before you sent this.
> Please pay more attention to what you're doing.
> --
> pw-bot: cr
