Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080171FF7C5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791176257; cv=pass; b=UKmsXRwhItzlNtzz5wkT0FMnvRZnuvWZZSlRb2ILYzFDuRM2uNCUCK0zf10VzNoN35ywvMoeKwVPx3N7nzoUS/6GAwfRbao0CfBexgdvXRlqKuQX/yTkMj1d3c+IZxPZ4bjXczWCUsW0iNoaQSeq2Hrk/z4H2HNl5svxrYPGnjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791176257; c=relaxed/simple;
	bh=DtOfma5MPjlTA7AJUO+fjtKRY4VF59cg25jlM6rQ7Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7Hu2Uxc7OB+gWgFoD7PsubSzWmnoJRHLIZ+wJ2pXZpWNhzn2dT4kX79dAF5SddkhUj6AATlEoPv+FFKA80ziih/DnYlRVEWw+t1RH6kmwptJbAhlWiwmMleE6tVBXyKA0zU8izcS1hJTCcbxRbaUedISyR9vB0AJfzkaY/rnNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=ErXR7xkT; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="ErXR7xkT"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a26ce219so137907a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791176253; cv=none;
        d=google.com; s=arc-20260327;
        b=Wtb7Ugnq27bitAoZ4N8lR8STVMEQN5agS9XyCwLjyLJ4oTA4OMWa0ep7EIS1mw2xHN
         Un2cUPWI0QiIAxZlsecvOJby9bnLx5PT4QsKDQwY3fRYnUmXVWehyfnNWnVK2HimLcRq
         px7rav3uChLkTEVOd3wSvZZyIuLL73mFZGwmEIWthK13yi2xRjx7ARVYrKZB5AmBhXTu
         iAh9Bzd1+F3KdPDoYsWRynS7AllI+2K6uPrj/aQtue18Y0M1gkNKjaD6z3AJcqbESI+k
         LGRAwuPUBMMxDSkUENa/G2i1Myy/vChZg0Ws01EUq5SWcJ5f1ZmYfjUUgb5XyMHnLWdw
         WcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ldf5q0KJzU01llaoPctyqNRPOtaXKGmPGYAJmWxRprM=;
        fh=3vPt6L+oaAc3m59JqrjewyWlI8ND0EBLmSLYGi4+8SI=;
        b=I6VW4Pe+qtkusbANDBQtgbeEhIPa1z7zU6tdutsSMkDSrkD0w/gWpXL3pPVybAqrdr
         N9E5QIfDBbottwekuuUF9x1G4R7DVnMpqI1E8DKbtQaBv+nzCrizQACjYHm9wq2hiucB
         aXKhLI1tZkAElVM0bs+DeVr6bENS2shvGM1tB0qm8yL5nMHdEwUMDNkk6n2C6E4lFOUk
         bNihzuY13KCUiJM8pebshf3lzuD2/V+UENcb4djsNktT3B/C2MGLPzASHUzNkY0wn94b
         mQNl/jKawgsWBXjNmfTE5B5TLiu8ENyAOBcoTWF0Id1bvjzv9hs9HF1mCsQntFRNzdv8
         1UzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1791176253; x=1791781053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ldf5q0KJzU01llaoPctyqNRPOtaXKGmPGYAJmWxRprM=;
        b=ErXR7xkTtHU9Oce+731OYcl3dITzj9lTiPGkJqAStGNoHqZN5hR/3YYC81EPCPxlvB
         49Mjq9dxUH1HdzrekHAi2DUPPa/+lGiBidoYZzUGKCwaO2Y3jmp4tf98DOxAIth8AjEq
         tUBVFZ/srKNZ63Bvidr+s5G/3z9hpkycEYYITMtO/8SA4BFtYcJossxxQjIpVOPkVa9v
         iZeYQLDXW+OpUTy3BH57Ko+lUdJaIqRuIvxENB6p2JywinZRgZyhHc8cZrS23NHnOT0P
         LIKiFcVk5fGrpJtj46yYPwA99NbuQDebMTWEBVzOA5tz2XoJb4MAhrsekCRVYeoOH4Zt
         v6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791176253; x=1791781053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ldf5q0KJzU01llaoPctyqNRPOtaXKGmPGYAJmWxRprM=;
        b=x1xAmGuxyC9CenEvStZaHdd6f4JqcfRyFELvxWroPr6Mmr4Ch9LGGMopxlbqoz27Mh
         KRdNHtKP9vubu0QWupCtmLzC97b35/hYB75JVhtAVTE3Qoq1Lg47CIGv2rgfPyQm5bYt
         SCKEt8pWTKGqRCpN5e/rA9lFLm+bjgVv4gsPErlMNoIl6hSStax3T3h/3DPws5NEn4+F
         lZRXCYyp89PZSrSMshVsg6RxWucJSisqVPuBfRvzqKjSjbZm5fViBUqlCj3Keoonki+d
         PWETFeoGMeYjPHUI9+bDQayA0uDLIQn/sKjJMIiva+44d+kz+/FCxN2cgHlqUgeWvfER
         4ysg==
X-Forwarded-Encrypted: i=1; AKwUvBxne43w8yYT58yoCp8OcUhBNIAAbYZ9sif8g/ZBvvHzEuAOx0p/s7rTJj+QfnyiESc6ePzlTiMUD0UnJCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lapxr46RHF6UoZanCtxQF46a4CPs67eXmW7fLWcm4pliVO6tz8
	Nklwy3U2L1nqa3Eszm3tSvdkhNT2RsCUZKnw2/IT2/c0uKSyhJcL2c9/5nSnVEHgHE850We8tHZ
	HkbQnIO/ss1PUNdrp5s4GWpUxfYaow/Ix4M37NOOTFw==
X-Gm-Gg: AYBFou1DoWskFO/AYzu7YfY8k2WXVjdn8i/2XCXdE+LUX78EurbyQqHTSWz0Puaax3Y
	A5atEZFqsoxRfzMt4ieOsgl5ATHL5J8cXDF9fCBVyAxUpLGbh+PKQeTDvEPG22i6ILjUBH1EaL7
	tbOVdcYXi+R2kT4/y/SQRKbzbEI+V3vqdde+JNRzaRoS7VsatvcjDWlHKfPWL4Uo/e1dpETHJGF
	9wPkeSD/uQOzC19e6zIMB+dnBx8OmVKX15YHD9szndZNt4dF+EbBHks3m/AKM+PCN3+FWS5vbuR
	rtVFyLxvMVdbz0cYHUOrnARim6jvC1zn44sZdFBxs7ckS4yruxx9ieg=
X-Received: by 2002:a17:907:7296:b0:c12:6db4:4bf4 with SMTP id
 a640c23a62f3a-c2e4a7292f1mr783960966b.0.1791176253197; Sun, 04 Oct 2026
 21:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-rtrs-fix-ib-drain-rq-v1-1-11b1637958ba@proton.me>
 <20260928191837.GC563127@unreal> <CAMGffEn2HGaj_20v0eQCTvk_akKM1RL-WQbUSXx0VND47PEhJw@mail.gmail.com>
In-Reply-To: <CAMGffEn2HGaj_20v0eQCTvk_akKM1RL-WQbUSXx0VND47PEhJw@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Mon, 5 Oct 2026 06:57:21 +0200
X-Gm-Features: AclHuK9k5cTpzxbEHriXq1AXf5k_lZt1PaMuCp4V222ovefk7uK6kijw2FR7XTI
Message-ID: <CAMGffEkM0-jrWzX8Joa4w6uXAg-xhQf8OQyMX0v8uJc_3q73OA@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs-clt: Fix recv repost to satisfy ib_drain_rq
To: Leon Romanovsky <leon@kernel.org>, quanyeyang@proton.me
Cc: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Farhad Alemi <farhad.alemi@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:20=E2=80=AFAM Jinpu Wang <jinpu.wang@cloud.ionos.=
com> wrote:
>
> On Mon, Sep 28, 2026 at 9:18=E2=80=AFPM Leon Romanovsky <leon@kernel.org>=
 wrote:
> >
> > On Mon, Sep 21, 2026 at 07:04:47AM -0700, Quanye Yang via B4 Relay wrot=
e:
> > > From: Quanye Yang <quanyeyang@proton.me>
> > >
> > > On disconnect the client error recovery path calls ib_drain_qp(), whi=
ch
> > > requires one free RQ slot and that no recv WQEs are posted while the
> > > queue is being drained.
> > >
> > > The legacy recv completion path deferred reposting invalidate receive=
s
> > > and instead posted two empty recv WQEs when handling RDMA-with-IMM
> > > responses marked with invalidation.  If an invalidate receive never
> > > arrived, each such response increased RQ occupancy by one until
> > > ib_post_recv() started returning -ENOMEM and __ib_drain_rq() failed w=
ith:
> > >
> > >   failed to drain recv queue: -12
> > >
> > > Repost one empty recv WQE for every receive completion, including leg=
acy
> > > SEND_WITH_INV invalidates, and only while the path is still connected
> > > so CQ polling cannot race with ib_drain_qp().  Size IO connection RQs=
 to
> > > 2 * queue_depth + 1 to match the posted recv count and leave the drai=
n
> > > slot.
> >
> > Could you clarify what =E2=80=9Clegacy=E2=80=9D means in this commit me=
ssage?
> > Haris, Jack, does this patch look good to you?
> >
> I will check in the coming days. A bit unsure about the removal of
> rtrs_post_recv_empty_x2,
> want to check into history if there is any side effect.
> > Thanks
>
> Thanks.
> >
> > >
> > > Tested with a synthetic RTRS client flooding unpaired
> > > RTRS_IO_RSP_W_INV_IMM messages; error recovery no longer triggers
> > > __ib_drain_rq() warnings.
> > >
> > > Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> > > Signed-off-by: Quanye Yang <quanyeyang@proton.me>
> > > Tested-by: Quanye Yang <quanyeyang@proton.me>
> > > Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> > > Link: https://lore.kernel.org/linux-rdma/CA+0ovCihE2_pxLimjmmR8NMz4g-=
ie8dvvq1jmAj-Om33y3Vzfg@mail.gmail.com
The change looks fine, please refine the commit message as Leon asked.
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> > > ---
> > >  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 45 ++++++++++++------------=
----------
> > >  1 file changed, 15 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infinib=
and/ulp/rtrs/rtrs-clt.c
> > > index eac38b57b00d..ee6d5c3de16c 100644
> > > --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > > +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > > @@ -577,25 +577,21 @@ static struct ib_cqe io_comp_cqe =3D {
> > >       .done =3D rtrs_clt_rdma_done
> > >  };
> > >
> > > -/*
> > > - * Post x2 empty WRs: first is for this RDMA with IMM,
> > > - * second is for RECV with INV, which happened earlier.
> > > - */
> > > -static int rtrs_post_recv_empty_x2(struct rtrs_con *con, struct ib_c=
qe *cqe)
> > > +static int rtrs_clt_repost_recv(struct rtrs_clt_con *con)
> > >  {
> > > -     struct ib_recv_wr wr_arr[2], *wr;
> > > -     int i;
> > > +     struct rtrs_clt_path *clt_path =3D to_clt_path(con->c.path);
> > > +     int err;
> > >
> > > -     memset(wr_arr, 0, sizeof(wr_arr));
> > > -     for (i =3D 0; i < ARRAY_SIZE(wr_arr); i++) {
> > > -             wr =3D &wr_arr[i];
> > > -             wr->wr_cqe  =3D cqe;
> > > -             if (i)
> > > -                     /* Chain backwards */
> > > -                     wr->next =3D &wr_arr[i - 1];
> > > -     }
> > > +     if (READ_ONCE(clt_path->state) !=3D RTRS_CLT_CONNECTED)
> > > +             return 0;
> > >
> > > -     return ib_post_recv(con->qp, wr, NULL);
> > > +     err =3D rtrs_post_recv_empty(&con->c, &io_comp_cqe);
> > > +     if (err) {
> > > +             rtrs_err(con->c.path, "rtrs_post_recv_empty(): %pe\n",
> > > +                      ERR_PTR(err));
> > > +             rtrs_rdma_error_recovery(con);
> > > +     }
> > > +     return err;
> > >  }
> > >
> > >  static void rtrs_clt_rdma_done(struct ib_cq *cq, struct ib_wc *wc)
> > > @@ -650,19 +646,7 @@ static void rtrs_clt_rdma_done(struct ib_cq *cq,=
 struct ib_wc *wc)
> > >                       rtrs_wrn(con->c.path, "Unknown IMM type %u\n",
> > >                                 imm_type);
> > >               }
> > > -             if (w_inval)
> > > -                     /*
> > > -                      * Post x2 empty WRs: first is for this RDMA wi=
th IMM,
> > > -                      * second is for RECV with INV, which happened =
earlier.
> > > -                      */
> > > -                     err =3D rtrs_post_recv_empty_x2(&con->c, &io_co=
mp_cqe);
> > > -             else
> > > -                     err =3D rtrs_post_recv_empty(&con->c, &io_comp_=
cqe);
> > > -             if (err) {
> > > -                     rtrs_err(con->c.path, "rtrs_post_recv_empty(): =
%pe\n",
> > > -                              ERR_PTR(err));
> > > -                     rtrs_rdma_error_recovery(con);
> > > -             }
> > > +             rtrs_clt_repost_recv(con);
> > >               break;
> > >       case IB_WC_RECV:
> > >               /*
> > > @@ -678,6 +662,7 @@ static void rtrs_clt_rdma_done(struct ib_cq *cq, =
struct ib_wc *wc)
> > >
> > >                       return  rtrs_clt_rkey_rsp_done(con, wc);
> > >               }
> > > +             rtrs_clt_repost_recv(con);
> > >               break;
> > >       case IB_WC_RDMA_WRITE:
> > >               /*
> > > @@ -1693,7 +1678,7 @@ static int create_con_cq_qp(struct rtrs_clt_con=
 *con)
> > >               clt_path->s.dev_ref++;
> > >               /* QD * (REQ + RSP + FR REGS or INVS) + drain */
> > >               max_send_wr =3D min(wr_limit, clt_path->queue_depth * 4=
 + 1);
> > > -             max_recv_wr =3D min(wr_limit, clt_path->queue_depth * 3=
 + 1);
> > > +             max_recv_wr =3D min(wr_limit, clt_path->queue_depth * 2=
 + 1);
> > >               max_send_sge =3D 2;
> > >       }
> > >       atomic_set(&con->c.sq_wr_avail, max_send_wr);
> > >
> > > ---
> > > base-commit: 93f51579e7df248780214094418f205253383cc5
> > > change-id: 20260921-rtrs-fix-ib-drain-rq-61dc85d0d759
> > >
> > > Best regards,
> > > --
> > > Quanye Yang <quanyeyang@proton.me>
> > >
> > >
