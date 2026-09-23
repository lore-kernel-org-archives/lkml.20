Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE29524468C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170334; cv=pass; b=eLhIv0zqnjqg5Sl1YqNdC38rC5seYEc0homgaBbeeOvRdeKvoSSDBZtSarjXuPOFqIc4U2jZEGj8Kzc8Fiviz3Q9tDHC6M7jZW5x7hrwGQRh9z8IkqI9Dq5SyAoGvcM3S0MUjEUe+x8cCn6lfPzWZLxWTuTNrkBNVBjRuSDBo7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170334; c=relaxed/simple;
	bh=+0Qare12DEG16J0RTiw2d8rZiqSc1q+82VNYMNxwBkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1Yey/r6qV77ClMwKozhhhnhf2BlcHWxuv1PtKpdQdFHNFK2kmtMa/I4+1BkNV/P0VYwDXi9sc2O4spFtSVVbMGg1yyoQSs6e08YPEu+8z+Ejvj3GQSTZDZr2pDwRxWUYFrkzUTRMadga9ntgqBhRhE6pjWbI4ZEnU9EsxLdarw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=SRVclZrX; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="SRVclZrX"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2939b2e4caso11246066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790170331; cv=none;
        d=google.com; s=arc-20260327;
        b=NZfjPJg2oU30txVtvNIACTsfbqw18fqGVll0B5TYLPFOfGoHIMJr2deUpX1OLLmvfB
         qkkrhIxRwn8g4SMIiWCLmfr5gSLPJAChcfH+0oNm1YOpcEpBA7iiKR3C7JgM36VWwXxG
         qz+N5FudA5TCDcAqNNDE+QsivkidSDthgOOSOx6DDIk6gS78UAOBRBAswo4mmYmFB2w9
         N3JTMzfhouK6a2Up0qvL/WZqA9FfqXnqDAf5mXf02snbq7NMuLfZVgIAyEi+twWCXrJL
         orsJMaR7RI6puJ5OXJ74S7FJW+0+ijmvBACG4PfXxo5vsvQ5XHby8HYD0i1FScG8RBCC
         oq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H4MDp5PgB8jnunTOrYD+WPuYfJ5AZ033iUvzzeSKz7I=;
        fh=P+rBIv/q7hvhdNmZCOYa5iAoKJ73TtljEXJWr9HEJ98=;
        b=I7+peRpnvbrO2VAJBltqn44tKdol0pQUeGOlED4OAzqP4TAAMQ3fo0T9hyGEdHbQcj
         rOQLd+N2JVbJk0kDlPX4S5sMjl54OT5Bjznt/ZD9qYAsCCA4s+PWYjc+Uxh6O3w0OX7w
         FM/8vkGZh4yZu7QLue9MgFOLFpJw6wuX3I3TylJgNtuNJJ70rACDn0po/hL5x4waenAb
         /hlOVcmcOQ2U4lsbl/Y0KZg5ExHaQLdPotQXDU+ivksekPdi86Ps6l2yq6/3s+R/nU3S
         m1crxBl5B0DJnjTeT2btGlp55U89E8rqyO3/R1U8CuhtcUDPiOlRmd2+kQzCHiMxcYQ+
         CtZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1790170331; x=1790775131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H4MDp5PgB8jnunTOrYD+WPuYfJ5AZ033iUvzzeSKz7I=;
        b=SRVclZrXByFayujKHoeDlVyJyf0ZR5bJS4tDmTWLddN1I9oVIYnBktV0XXDjZWlXtQ
         0SutMaAM4Uzvuo1izxezZ6r7LnusHArRGs8gKy+BvKVpA741K0bOWAItOKPdzZ514Edj
         AWOQs00XBn84A8kfv316mV2QnzQ0hyhNnqQ/0CISiOyUmw4cnZFVxQnKrUxu0WmWrm5i
         uhd9WtQjhutE8p3nC8iG3+wPyd1f1f7vTXRxakm1tA033vNFukweWU9gjhx5fdk0NKpN
         p+af7rSA3ojRJMeaqZvBKyNLV+ejpkvu4XWFNKfFJRl5rQqqpC55nUYy2g4YpMd6JhBe
         McLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170331; x=1790775131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4MDp5PgB8jnunTOrYD+WPuYfJ5AZ033iUvzzeSKz7I=;
        b=p8tSRLC2TTcvkHcWsY4aCU0dJtmU4mMZmjno8Juq/kuXgCrKoTu1H9rG1gxmB8o9vG
         VLdu6/awpmTO2VhrRXAcauBegHlfIqJhMPqvRhcEDYqT/LOYJFzR45AFOqImL8sJVISf
         6RSKZKJ026QVnjEDZjQwlLH5I+sB/Zmg+j5kXf3GFvBC+u5hffZqa4Kcotc1RkrYNyWU
         9d3HaWKNVYX19pG+DfDqUlgCDRUZ/g+CNbWmGdSo4hqDnJTCFDWNcbs65z1zWmvbOGkj
         iS49Nhiz+a9Taiw0SuuDf2tADzf1y5fqwq9YtmDZJKe/lwK/TZdfMFptFw19EZc59G/K
         YCmg==
X-Forwarded-Encrypted: i=1; AKwUvBycw6okRTYMmb1jDMyi8CwmwdhefjFajFuvFnvZiS6FTR8ILMwzJUh6ushJjw2Anq+jwr+DU2pu42q57T4=@vger.kernel.org
X-Gm-Message-State: AFuF++mE1N2jHKWVJb2KMEhQGbcxGb4fkBID/zdCaF1HfUFCFW8Ce5Ve
	MvQVs9mmIqD/qc0OdEJrOR3j3ql8tj9cMNyPJLGGRUgRsqlW841jFNMFQJN/nh+KsB8l0vifIT0
	lxuWykBDSnryUwUiXIiKceCVPlf3iV6ZFN1mTyHAGF+f1sGyO88TM9uh8EQ==
X-Gm-Gg: AYBFou1mdbhBAnv/lMs5O2avXj3mAvnASAygUncsO5il8fevW+2NjzQFGrbXbzmHxoL
	3FU6Rg83rqvJRTiQtVdgQlEEk5Rj2y3iChM8ZHh789lx8rIFfelU4CYAboP2h+xsNm8852goYBY
	ItASA4m6QUuxKGAFHydI3gJyokdG9lACR+Ffthc6+aSiPrk1E+GETE15uVucrt6fJa8slmx90yf
	UvDJ/ewSSR78zSTbg/YUZQZct9MAn3GfxtCg5Q2McrD3Ei1CIEi3CmBPwl+5bHsErZGHQNxapeB
	tj11gsvQDdGJZ+o60YBqt/01jTFuBVC30Zv5iwpg9/vczQ+zFuyq3cUSk+jhj091/pBt55/rXyx
	2+MmhtMWJWiY=
X-Received: by 2002:a17:907:1c0f:b0:c29:39e2:4aca with SMTP id
 a640c23a62f3a-c2aadf99d35mr234469966b.1.1790170330903; Wed, 23 Sep 2026
 06:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-rtrs-fix-warning-rtrs-clt-rdma-cm-handler-v1-1-2076c0ee1455@proton.me>
In-Reply-To: <20260922-rtrs-fix-warning-rtrs-clt-rdma-cm-handler-v1-1-2076c0ee1455@proton.me>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Wed, 23 Sep 2026 15:31:58 +0200
X-Gm-Features: AclHuK-JI9gNDHI74Pa7OJ16UAjS44ttJQLfTEw80Hvw4-kf-qxNSlBP2Q8proE
Message-ID: <CAMGffEkQ8tZZcrLp2Sc7UyZoqAyBoYMdkPhGvHX7RGqrwSmJzg@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs-clt: Reject invalid queue_depth from the peer
To: quanyeyang@proton.me
Cc: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Danil Kipnis <danil.kipnis@cloud.ionos.com>, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Farhad Alemi <farhad.alemi@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 6:10=E2=80=AFAM Quanye Yang via B4 Relay
<devnull+quanyeyang.proton.me@kernel.org> wrote:
>
> From: Quanye Yang <quanyeyang@proton.me>
>
> queue_depth is taken from the server's CM private_data and later
> used as a session invariant.  A peer can send 0, which the client
> stores and then trips WARN_ON() in create_con_cq_qp() when the
> next connection is set up.
>
> Reject a zero queue_depth on ESTABLISHED, same as a bad
> magic or version, and fail the handshake with -ECONNRESET.
>
> Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> Link: https://lore.kernel.org/linux-rdma/CA+0ovCg_sG8gaZXXj9zmOrpxRt=3D8+=
-x9wvycVNUKwWmMbr6-Yg@mail.gmail.com
> Signed-off-by: Quanye Yang <quanyeyang@proton.me>
lgtm, thx!
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/=
ulp/rtrs/rtrs-clt.c
> index eac38b57b00d..7fbbb9a53607 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> @@ -1853,6 +1853,10 @@ static int rtrs_rdma_conn_established(struct rtrs_=
clt_con *con,
>         }
>         if (con->c.cid =3D=3D 0) {
>                 queue_depth =3D le16_to_cpu(msg->queue_depth);
> +               if (!queue_depth) {
> +                       rtrs_err(clt, "Invalid queue depth %u\n", queue_d=
epth);
> +                       return -ECONNRESET;
> +               }
>
>                 if (clt_path->queue_depth > 0 && queue_depth !=3D clt_pat=
h->queue_depth) {
>                         rtrs_err(clt, "Error: queue depth changed\n");
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260922-rtrs-fix-warning-rtrs-clt-rdma-cm-handler-2160ee358b4=
e
>
> Best regards,
> --
> Quanye Yang <quanyeyang@proton.me>
>
>
