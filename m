Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E443AA1A6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903584; cv=pass; b=YNOjMc+37Eem4FQXe0HeJZjP96vl2wf+ja80KXDps+viNz1TmV307UCyPhF3P0g1f/dTY0nhvTaiE+li9Od0arUqIZTLNMDfmFg6rdKMYXjiYm9yifUbiwuY2tghG7zxjCUW2rylTA+cSmBOEfzFbnBPj0ZZLCJEXn5Zuc+4H+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903584; c=relaxed/simple;
	bh=TNafH1k/IbhOZ+c1ihZUoSaIWJuTHLQx1WBK/0hi05w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxyHxTviTBvddlxZvcIvA142JlJ1XwmghhjNOzT1Utz2qJpy2l11dVwJ0WyTr7XRzIeZs0bPoc53bWNjeTkF86PL0IKy7u59njv//ilt8gl9aJNycFF93b7Imd2whKehobC3VE5L2c84LRiUapx5FSOeQEB1HkTfUkE/DUe8Znw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=tWnSTDcu; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="tWnSTDcu"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a2e9851ed7so5302131fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787903580; cv=none;
        d=google.com; s=arc-20260327;
        b=MGoY5cPRpAmWqf+CXI3ZfKy2iUmK7x5jfvSnYJDMUMJrGLC2KqeqpSQJ08qa88WZg0
         iEjVmckJzKMkrqIp1BlCPJTAe+iZHFp0GF0raaEp6nUYNT36hUmk/bWpfro52VcMtH7I
         eBVik9svHK8yoMe6PTvSgTeImgcoWMI3tXFsSu8C9QsN0u7st4NzjWVy7jgEA8la9cSt
         zZfa+eIRbdZ34ElZcpbfxc9PbmrEtlHJ22+ZjDUPaUkeWSY/6TvOC6eM71axo/4k3emt
         /rzPIzhEBy7ZnlyEAOdGcj4dvyQNMwb60ooPfg3kPbR6A+Tqh9qg4h6qekXyonKCggfq
         KA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmYleCXYZYXRkt4vuaUJjHHMfAWiaxlT7cmkptdUeOY=;
        fh=Y4ss/mTe0Z7S8weLMnPhHs3JlSSRPY2tIklkgz5B6Vo=;
        b=qRGfOtYQ3j2K8YlJI/GWkl6WYUN9pO882HqlvSKPxut/BeYQ95KFDeku8R9Z7CbmO4
         tOTbyWafsPLPC0G+h31iXYc4ayrNnZmdGH3oCqCzqjanHsuAYQu5NRmpYLViXFXudpGg
         Sdy61hFCe4Uw0iMLhhtjMANXbZFh4j9kMtGnumZabGTB+HL1X+nGdg7y74WEMB/AO5W5
         LCLrDLiZhvbTLqtf2/AGSb2bd4WG7EeWVvQ0IC8EWuRAnLY5GQv9/OFHwKxvuNrt8bqC
         SJ9nzHy+BprTRsDjo4oXoSAbbWYvDT9UgaX6xOJSl9Yv/xm4te4w2g9Fmq+13xBrcB+S
         T8IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1787903580; x=1788508380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmYleCXYZYXRkt4vuaUJjHHMfAWiaxlT7cmkptdUeOY=;
        b=tWnSTDcu0GYyc/e7/d0A8y7abDGzZs9N+RbdkkoOaQLFmpdmEjOxitrgNF8A/WNezC
         oLxucOmUo5SleW6WaOlYhtmtXO0Sj8isLirx55mp9tR+XD6ruQL0HYimhLtvXRSzMBqf
         OXVbxir/48YTXMgen6r3nMuMOGvI3U8VZ96ZxAUn4ViaVBCUucJG4OZFHZmIVrltGDTP
         jaQRukr4qeNJsPNg8u1Hs5dQtQDKSZncHvmK+BvMNqp5jhjw7giMhIdf+sSLA5a3KFcR
         3xeiIwe0cZB0dRlXfuibspYPMC7StEP/T8vdmY9RbDLSqYFyCvr985FcVGzlXmMdgleq
         SsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787903580; x=1788508380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmYleCXYZYXRkt4vuaUJjHHMfAWiaxlT7cmkptdUeOY=;
        b=qMWVCO1jVAF6iZinhI6C4pDj9k9508nz7McXEn3Pwq2R+iqimCI9nDzSAgDfcC7E1c
         qBeK1WogVpf+srmyOVYxZEAh20TVj1kuRbQfznztnp181rpd5gzL2i4TKVHnSKa86n9m
         de8lsS4Fjie3hBbfAuwMMDf69JPJZ4QWyei6Y/hSVqI3lX+VLrr9/jdgEAG6EZOs8CWM
         OD/6/um9GHvqNNpDz9aHZY8GqKXFPInslvhLpxAmoF38jpcrlHy05mghfm+6Orap7Ihx
         ojiXJgzIjo/u4Yrt094rHSVAqv6yxMSfPxgD4bMivgPdVCh52bOLTLVaaXIWQprTLNA0
         5/KA==
X-Forwarded-Encrypted: i=1; AHgh+Rrnh6H+ms9uBF+A6Wn1n4UEvridA/b7f6JUCKQPBFRDHoVuakdm0S6oCy8lCdY40oHIFS6A8TZh0QoDa2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mElh83Ze1gzRqGAUAZILc+Doufp7Ey92QbrZtU7t51rXhNMuOE
	7MUwpHxeS9R072i1rzKozopC53in0QZ629DOKzm9/K40EKVyEptosivgfj3sc7Dk/MJE7XD1k7L
	YbKqj6DJ4vMKvp95PpLvRhPlF1iHv93u1kekMUCqwCpA=
X-Gm-Gg: AR+sD10sF5B5nD9HxM+8WCb2fIpN+Y/OeWmIUKwFDoNcpBD3iciJZvgfX42GAXZCjKe
	QwFaSPsUFnHYyxYCmaHO2OQqcQsnGh6H4dXT1fZQCJajlwntZyUJCtzQ3tcuqwU90CqIZ2qTgI+
	oAXzwN0TDnbXrEYh2xLagZkt1mDbuxG4zu4CwVzHpYv/lmGK53q/MwWWyvZ+vXEVtDhdBS4/wPZ
	6JWAtNNMzs4o+RIGZKTiLhCYFV86M/VlNqrO6Hpa7PnGZ6u/N1gyLddBZXAtWpyMofNev//1Kjm
	YhjegkwYg1vaEXB9OlSrLnn2M84Iyj/Tg23sbbhXKzhjVqsS4kCIqWaCf9xN2S7kyF2cKYncetm
	7b31I2659A+FeuVLRkuGx
X-Received: by 2002:a05:651c:3056:b0:3a3:a3:3560 with SMTP id
 38308e7fff4ca-3a301b1b926mr7137971fa.6.1787903579652; Fri, 28 Aug 2026
 00:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787854085.git.zihanx@nebusec.ai> <a31c6fb1ab9846c85e245fcf34948ac2bc27e521.1787854085.git.zihanx@nebusec.ai>
 <CANn89i+1xLiL=nZOwoSH+OwX1+8io_Cd2_5b4s-_NcN+kBh+8A@mail.gmail.com>
In-Reply-To: <CANn89i+1xLiL=nZOwoSH+OwX1+8io_Cd2_5b4s-_NcN+kBh+8A@mail.gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Fri, 28 Aug 2026 15:52:45 +0800
X-Gm-Features: AcwNN1Wlw2xmG9VSQqhlLFZOqVW920HInRT6-kbppYVXYZCPm1-sEjFLBIVBm2Q
Message-ID: <CAANe3eSydRy9qiDQhQMPO1nEni_Ekz4aUjnhYh-o2gwEn=9Y8w@mail.gmail.com>
Subject: Re: [PATCH net 1/1] ipmr: restore a limit for unresolved cache entries
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, stable@vger.kernel.org, Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:33=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Fri, Aug 28, 2026 at 8:52=E2=80=AFAM Zihan Xi <zihanx@nebusec.ai> wrot=
e:
> >
> > Unresolved multicast cache entries retain up to four received skbs whil=
e
> > waiting for userspace to install an MFC route.  The cache entry count w=
as
> > tracked but no longer bounded, so a stream of distinct source and group
> > pairs could retain packet memory until the system ran out of memory.
> >
> > Restore the unresolved-entry limit for both IPv4 and IPv6 multicast
> > routing.  Reject new cache entries once the limit is reached while keep=
ing
> > existing entries available for normal route resolution.
> >
> > Fixes: 0079ad8e8dc3 ("ipmr: remove hard code cache_resolve_queue_len li=
mit")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Assisted-by: Codex:gpt-5.4
> > Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> > ---
> >  include/linux/mroute_base.h | 3 +++
> >  net/ipv4/ipmr.c             | 6 ++++++
> >  net/ipv6/ip6mr.c            | 5 +++++
> >  3 files changed, 14 insertions(+)
> >
> > diff --git a/include/linux/mroute_base.h b/include/linux/mroute_base.h
> > index 4d55827e9705..af9247bb3f4d 100644
> > --- a/include/linux/mroute_base.h
> > +++ b/include/linux/mroute_base.h
> > @@ -224,6 +224,9 @@ struct mr_table_ops {
> >         void *cmparg_any;
> >  };
> >
> > +/* Bound unresolved MFC entries and their queued skbs. */
> > +#define MFC_UNRES_QUEUE_LEN_MAX        10
>
> Wasn't this very very very small limit a reported problem in the past?
>
> Nothing will prevent an OOM to happen, even if you set the limit to 1
>
> If panic_on_oom is set, it seems to me that this is working as intended.
>
> If we want to silence the OOM, just change ipmr_cache_alloc_unres()
> to add a __GFP_NOWARN?

Hi Eric,

You are right. I missed the rationale for 0079ad8e8dc3 and the
earlier report that the fixed limit caused problems on busy networks.

The reproducer was run with vm.panic_on_oom=3D2. It therefore only shows
the expected result of forcing a panic on generic memory exhaustion; it
does not justify reintroducing a per-table limit.

Please disregard this series. I will not post a v2.

Thanks,
Zihan
