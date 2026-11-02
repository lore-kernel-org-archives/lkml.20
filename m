Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793597718;
	b=pgrkTjja8iSS+1yw02QoL6u2oyL6Bi8t+re8ZK9QGNzoP8dzzrwOP+vXJHtNb8N2ZlZS
	 vN9t+opltxe9AkBh41LZ1C2fBKvOVKLzUPL68iwUjcd/Z3Jlyhp58Ajab+OMfmD+kmHto
	 tc9/LGdSEpzq4OxOM9V7iSDkTP14/f5xDSRxQuTf8FQyphg1gGglhywyfl5fPQEWZPuwy
	 pGH2RQ4mNnWZGqJ/zNTxFQSD2OlC8RetzJ9pTj2g8h6X7oR2wzRn8nMdAgxniG3TQGvBK
	 On7OxDA7La3PT0smk8AFyjZM/MPWrivK/PKrCU/mKcShSsnOyCNT5laizti65DesLVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W+hC4F4hAwm9joqKZ+fH9u/y7V0gzk8Wl/nmjTnVbjo=;
	b=QH1JjJk7L198xlemJfHNLATqIuQZmuMGGI9p9FK+qjOYnDhfSE7lm4tapM4tFec68++Q
	 2sNM0RigVo2x22YUBR82r38OVZz8hnwTTRUBtPgcvCIEhA6GQXnYisU9lwkPuA8dtXBd5
	 HeXE9gZlYPtUVW8+0g6JsZi/Rah5kzhtH4xxtIbkv+oMzJeaNwC1PWnciNSJh9AHovQej
	 Ad5gJt7CdpzFXuaE+1WLGrYR4+Q2PaWbYD8EDkcZFMHVL98MDkvOX/cMjgo7ZN8DXt1Um
	 wajINEs3jQqGTPW460ZX9QBAyqIca0075O1k36AVs26xtD5b129UVUk5yH0IPEHCEPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gfRtvORV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B44606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B44606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gfRtvORV
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-194d0c31715so5161c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 21:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793597718; cv=none;
        d=google.com; s=arc-20260327;
        b=U398Z/6AcxLies6hStxRHi/waSqbSXNQCo7+Kfm96sCf08As1gXUyBREYwc6bNNAQk
         9SwTazdaqMy1ZNclIq4qvpGbfZG8dEYPW55IbR05Q0MMMZDSEejyIG8xhDcNKbVGAZdb
         ZMIRAOZbXbuFqUoFtJrc8IfJzZGvDXCCJGXqfwzh9/ejTo17VbC3oyhFFTcFwYPtLyf1
         QG8oJJXYWvbqHTZ05g4HBR/8QQlVmcowNvYZkl8l1rXdSx/BNKpWKaPAhJS5Hrr3fK6J
         sHSllREkSEHvJ7X4EeLQzdYIWHLZW3jJbPyW+SNAChscMXavz3f7zlZK98Jc2BK5kHHe
         K5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W+hC4F4hAwm9joqKZ+fH9u/y7V0gzk8Wl/nmjTnVbjo=;
        fh=iWTbTgkiCYDFHXK5QhTDjkdZCm1wCujpM70qCtVfHms=;
        b=WfONBn/uR23UHIEFDZkn/D9ttSpyArzAdorJzXCW75U5ssymZ5WUI1wp5d9YIF0/YO
         BdBeVGBALeghfdc/pv9HPi267EPSVjc7l56utVR8kxVjI/vPaGbWmH05Zo/vURY3Jm3K
         5WUXqStaIVx2b2qMM7kYA0eAfiAfUmMesCUvjEByFvutDhCeMRaLF/sg2IhYmGJETxMb
         Kok4Zs+HOojKMhI9BtsNLN/azZuM9nLJwb6+s+AIwUfksc56PXlABl9+tvGi74f56byP
         M3sJgkBUaejHRZy8e8CEnUd0bXxsTUDMzoRSqEU9sPZ94YjZuGJKTI/J3a+xnfizCM5E
         DpLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793597718; x=1794202518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W+hC4F4hAwm9joqKZ+fH9u/y7V0gzk8Wl/nmjTnVbjo=;
        b=gfRtvORVMla4nCBA+g1KRdGm5xy2G7i82zYfxIC7+MGS0ahIMJw5JiKT9JWIXkC1tg
         8b/PHZNBpPoZkQ+obXIaft4EJT4wp/aay3pkTQ9lii/Wf89lli9Y8f5kLXCLw2iPKUS0
         95vLNFULVmA75kI2rXr7AvEtdNCxPnF3OOtvJT3xxUXbFxJgZMzNH1AqrqGXdEmyjXnC
         5FkLZabGbUxMjxtJtNHu5aQM9j0sa3SpR2wY3XQV94jk/lGlCkYFJfBt2Ag1TUzRzI90
         xJaf22bOnYtQpulm09ttHnuLwCSXnmbcqtfmY0rkmw5bs8u/pNfZGmvUCH/wcrRWpgYE
         WSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597718; x=1794202518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+hC4F4hAwm9joqKZ+fH9u/y7V0gzk8Wl/nmjTnVbjo=;
        b=0iJaLZ2EMDvxROyshF+URJrWbiN+SEUe+OJu/rs+ofEKF9mXPkWbznlHqVErEJQd7Y
         pmM26L4mWEVk+ThJF2MOHzVaDnyecpM6cbIzk6Nfbj22H2kk/lNBGGm+hbjq6r2qswR6
         EwlzIX7SJuR45QNpSeFE23SS77cdOaxUGEDXIviMQuYVk+qnLRO9EN41UzMqCI30krdE
         dLu2TdWJ9c7l1c4TYHzTL6ANvEy/zy/It2Nl7OSi4FpgOWlIKI87PWbK1GLqtNyCmHFN
         MmSPZIp7ZVSP7dSG0lnSqk4h3F/7pX5OhUhXxvxA/6ll/+waqxC1LivgQlD/dlndjXoL
         qHuA==
X-Forwarded-Encrypted: i=1; AKwUvBzIaxzMlJF0yvIuuTYyWP+ZHktnrp6LOY+cyrQBr1QT4WPjm+51oECndnoQw9onurhyCdXt8vCfmbSyMzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVyuz1o9NXrcUfPdpoAZOcMFu77oMSs9BDZsyq8PDw1zET8UBc
	Y3b+3BPpo0ACJ8QkWwH+qBXKduoo3Fporj7ObzE9jMt0KA4zf1h6kDAvaZ/clvmsvt9KrP2pY+9
	fojJ9fx+eL7y9sUt/JNZCaiVaRn2NVSFV1SmqlslL
X-Gm-Gg: AYBFou36uWz1iJGk/vc0ns2wJ3Ptvf/L9QCFjhWSdYLzMjdqjp+zCj0e7iyMdD1qmlv
	pf9OkqqUviKsNR1EhjRlIh0Z/uxiwXcdT57cBgCh2GJ/ndNrJvFnxQv6ieMu9+GxHcWwnHNb4iU
	iNBButGClD2s6fQMa81urNxEZE+naji2N+A9SJahccIapV7hPfUgfq+AsZI8NcTlMA4/dBft2H7
	iBLz8eM9uRfQCVj0kb/yzIgwHwRb/jGD/Gc9QWlB3syGYsOW9ydfHZ2sg07LouzNq84a4x/Ddwr
	0w83IKkPOOn/UCPZ14hKwC7B7usyjNwfdMRGzyh+e2I++BRaPBHOQqmwRoAld1ZrdHLk8AVLmJD
	iVCEsuFHy4P7SJZfwnP8WJzljo5WMaFC5pPzwOZ+hhIg6EVQo4iJGxFjV8DLromQnG8tgY1Y=
X-Received: by 2002:a05:7022:7f0a:b0:149:8916:defc with SMTP id
 a92af1059eb24-1a9546390a4mr1658978c88.0.1793597716672; Sun, 01 Nov 2026
 21:35:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101075145.698399-1-sgzhang@google.com> <audwphXNeZhVItS0@google.com>
In-Reply-To: <audwphXNeZhVItS0@google.com>
From: Ray Zhang <sgzhang@google.com>
Date: Sun, 1 Nov 2026 21:35:05 -0800
X-Gm-Features: AclHuK9nicuZoXvOoxzdD_K3_bDawbdxZQ3_9KfsA-zXkExzJY5UTfRe7i8Lwvw
Message-ID: <CAPqVEODgo=mr+3viog+bY1XOKHLcrEVhs4CtZ-SiSYT4Hh+gjg@mail.gmail.com>
Subject: Re: [PATCH net] net: count last skb of each sk_backlog pass in __release_sock()
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	David Decotigny <decot@google.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 9:15=E2=80=AFAM Kuniyuki Iwashima <kuniyu@google.com=
> wrote:
>
> On Sun, 01 Nov 2026 00:51:45 -0700, Ray Zhang wrote:
> > Running 500 concurrent TCPv6 streams (neper "tcp_stream -6 -T 1 -F 500"=
)
> > on a 2-core Cortex-A53 (CONFIG_PREEMPT_NONE=3Dy, HZ=3D1000, LATENCY_WAR=
N)
>
> I guess you tested it on 6.18, but note that CONFIG_PREEMPT_NONE
> is no longer selectable on arm64 since 7dadeaa6e851.

Right, we hit and tested this on 6.18 -- thanks for pointing out
7dadeaa6e851 and for the review!

On mainline, cond_resched() in __release_sock() still applies to
!ARCH_HAS_PREEMPT_LAZY configs (e.g. CONFIG_PREEMPT_VOLUNTARY on
32-bit arm/mips/sparc, or CONFIG_PREEMPT_NONE with ARCH_NO_PREEMPT),
and landing it in net lets 6.18.y stable backport it cleanly.
