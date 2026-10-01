Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5F73C9EE6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839500; cv=none; b=dzpAoli++NVLnJ3imJr1o8pqo9biinYbtM2Obh03EfSom59wCTG1yvVenHVUzaz2BYJZnQzvTbhfwG6pI1DxSLid1xDwqbYI410L7oGOFjd182I3o3135T3j68cbUqJFm5Zvgak5EhFTALRPmWmBDwHKSG4Vo+a2/7RNJgdJ8cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839500; c=relaxed/simple;
	bh=6bQuJchSgqUSLBdzanf6l6vSqrBYCP3u4E6cN9VZZdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVZAFxJv+TY5ujGbd0WUEs+2s2Wmyjb5pDHxW82YZypzrezpADBmmqWehuPztL7XtXrsz9Zix/dTavjF717oAxuKIJZOgcAAk0pQqwdWFSDGDQBtUxyWfLf4G93YCdptrvGWyH4xoyuWhajpjKmqCqnDMysh+/NR/cP3NGAn9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUObueRP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUObueRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B946D1F00898
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839492;
	bh=6bQuJchSgqUSLBdzanf6l6vSqrBYCP3u4E6cN9VZZdw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WUObueRPZ7NFQjzzVgKruFFZQ3ZgvqaCzv8iK7E3iPsfnNYccGKmUp6oTAVHTxMZu
	 SgD45CtKZTjugY1t6rSbX0lDq5+lFFo9HtBnFTbwQRXCKarfqrqvqph14V0lHRTO4u
	 hgJPNVjMBYpTq+l+7c/4l0rsihyjKLAx9Mx6GArQzHKHNyiu2TL2jzzqt2WPM2XKwT
	 kGJjUmcqZZp1PrAwztiEuQcXeIPMSNEhs6aBKvb7oIklI+EnO+YE31YmCp/V+78+BE
	 wnnTB/uVHBNTKgps3IzNKNz2RO9VJWkMA/fEgcAKDNMJGkvEP/yxwtlPyzlFEWUh9B
	 ktpjRK1VY51Ew==
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b15bca7e0so3542441a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwk3Crr7htTmDJC0nJAttoYZ9oO0XFqTXP9STWnPqYf7G6W/3lvUqng7X3Rekk75XcAWlAW7rvJDt5Sqfw=@vger.kernel.org
X-Gm-Message-State: AFuF++mI3h30Mc6Yh3i9qYLrsJSDixapuR2AvZk3y8oreOCL++/WFYAI
	OFz+YDDw0TehgqmIdU+DLapi8hqQdM85et6ZVyaIunJoLjpC9KztB+zQJdWO/eFZO870wFuT7YF
	REbPVJ4iFY139QXd7/QqJfOUOoqDGcoY=
X-Received: by 2002:a05:6830:270a:b0:811:4f31:c1 with SMTP id
 46e09a7af769-8204b6c7ca2mr4657707a34.30.1790839492163; Thu, 01 Oct 2026
 00:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mptcp-sk-err-net-v5-0-0cac04d6ea48@proton.me>
 <20260925-mptcp-sk-err-net-v5-1-0cac04d6ea48@proton.me> <20260930172116.42e1ec0f@kernel.org>
In-Reply-To: <20260930172116.42e1ec0f@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 1 Oct 2026 09:24:40 +0200
X-Gmail-Original-Message-ID: <CAL4WiiocWZf5fXGURGAomSmJnuC2Jn-izGJibxDtncYucE4gZg@mail.gmail.com>
X-Gm-Features: AclHuK-I_kflPmKn3gFrhoDGOJs1zq_vLXf_Gu9ceYMkIh7omYXy0vjV126WHhc
Message-ID: <CAL4WiiocWZf5fXGURGAomSmJnuC2Jn-izGJibxDtncYucE4gZg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/2] tcp: annotate lockless access to sk->sk_err
To: Jakub Kicinski <kuba@kernel.org>
Cc: Quanye Yang via B4 Relay <devnull+quanyeyang.proton.me@kernel.org>, quanyeyang@proton.me, 
	Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	Mat Martineau <martineau@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:21=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Fri, 25 Sep 2026 05:47:56 -0700 Quanye Yang via B4 Relay wrote:
> > Subject: [PATCH net-next v5 1/2] tcp: annotate lockless access to sk->s=
k_err
>
> Updating Eric's email just in case this isn't ignored intentionally :)
> https://lore.kernel.org/all/20260925-mptcp-sk-err-net-v5-1-0cac04d6ea48@p=
roton.me/

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks!
