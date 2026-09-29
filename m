Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F6D234964
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654033; cv=pass; b=VRhITUNdS/6JTwSbeLsK9ROWFvhDnpP7y2esn8agHdswCtuq9XfHDED3gDUlJ1cM1+iZw1kxSEUPbm+LjN1nCHgb8vLaowWyfWfngrXmDXkCvr/hglYir/vo1rvrdgiPk8K45GAMAybrvgkwabrYEdTh/q7E6X/IosxWwR8WTFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654033; c=relaxed/simple;
	bh=oDPU1YPGO7/v11Pjp8y6wBhZmRZ7wJ3J/ADnhDXmgp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAggzKRz3m8yZQriqhuAFCqYrUTl4csp6pUfqfu9Ce1BrjPoztVFYeErICg89wAePR4T8wVjkYvGCF0ckpWZTGnEtYXzQtiJv7n1aFYTz3J3BfpZYuMWN9w8e+br9YFuCuKdfmptiFoJkV6ESY5Q6dPSRfL5YdxsyTli2eFk510=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=ha/HYjI7; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="ha/HYjI7"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dfa4b47deso361766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790654028; cv=none;
        d=google.com; s=arc-20260327;
        b=qA7zG522xpVzNK9Xq+jnhZESiMmNWM4BaZni51tCAFsaSpIuwEyohnxqgQIqzKfiQI
         d89SNhtJJKzrw8Ox1h2gRi254vqGL6gkwEcUvsQqk6VwHDOEnkV0gYbtffp/YQ4qJEJy
         AazRylzyNMshbola+R80JhWm8ALhvFATn7ES7eLMDJ73Nxz4LUmSnY/chA2xOkX2qRjy
         g4BhoOB9VlQlpM/9Wko+dlhNUES19mZsovTm7hRrQDpzhvyKppBn6X/9KIG3xya4GVEc
         6GfysjmoLsQ3Euhxy1yJQJ/WVyIMB5SDoBeVQ9sMyK944TCQHnDby6CGPyETkEHZrjB1
         N6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sWUVfweHp7S7+yh/aJ3eFYtiBr5kHFUHVTYD9vlOULE=;
        fh=DeAkz8L8bzKckuCPj23mm+L3/j3gNjIJVYpkfmUCoEM=;
        b=LXGOVZQprwwug+PoqGL4ECJ6Z1D4TP9ksQ6kHyG51cts9AQZKUWDUhGLq3ADJ8uUNo
         es1YF/fzQwE+3B7RC7D7e89soq0T1J0olDFRdE3HtES7pRN/KWAsAHGPKOZ67TeXwfM9
         vfd4DaOKOroHWV7S8IvOiNzigwafz73PZ9ngE+idvcCMmTXlRfjuaUwfUm63vnJrz4RE
         nha4sTY9bgtO9qCtBUiPAAGf890IOEcSOBLX8bvDFuFV7HJefnjqzI/rlocv1v8XYKSV
         IWYCQ+J6rRinvqa6UtFC66dbFtOePSenMFumSdatI/pRMGxtts9xWJw2zgLvFyy5pX9Q
         MdLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1790654028; x=1791258828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sWUVfweHp7S7+yh/aJ3eFYtiBr5kHFUHVTYD9vlOULE=;
        b=ha/HYjI7M9cYdlJ0wA+WrN+2uiHc4yTFz6yZS57ZSxLotwKhsWfYQxOURUSKcURsD3
         BjuDtSd65dySNVTQfXov2PawDSa+dl943mYzFp8HxyMmfWP2Tg3S5k3Hy1S0LRiPoTuQ
         NlyYXwXBNErzSPm+gfndWkZVM4dld7vNWoeY+4pPIjKKEbyR0lRDLI1oyRsuCa44F3BP
         92bwCEnarEN4CCaX18xRMp8I1FV5ihvVrZsnUK620iwFsN3Dha2Da7B50daC5FHSs9gT
         O2t+ouVtZoxb2QFwfeq+57JVxNRjMcKBVYP2yZ+KptYC5HpemSBR1XZ7h/QrJ9KXbcoW
         lbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654028; x=1791258828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWUVfweHp7S7+yh/aJ3eFYtiBr5kHFUHVTYD9vlOULE=;
        b=mAAuZgPANvRwsX45CGtUQE3G24/k80pBIWou+fHBCea6RHqlUzDS8IHrNHQH5rRtA5
         9Pun260MdoAyLi+i6BS8uyIvJb4WCGJlquIkGbEhyoi49o7IOHqZUew0gAEXyRhviGMN
         JtThO+KLCFAs4oedOEUQoldsRlzy5P13BUkbRTXyOyygGN99hmTT8KzVGxsjprHXQDpv
         exB11kzDe2cEwt1jN0GKImcXagKCt3jXB7HW/v7MC6v+IHZMbjyEZyoCqOiaG5Eg2Eqc
         IurLoezwDF67OabyCMVKL1Gdm1syYu3BRCwcyIh3QGYKEsfX/IhPUB6telryUBoAyBB2
         0YJg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ4IaqynbwJPsP+U8jzvAVeRg2tTTyQUpFcgMFUay0tnxhRoEY2kk/4HLmZFvrj+HUSZEYCeh/4AYnHys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlqqImLn5BzsC/3UQa++WYJtixpqj9jI7fkmKXe4HceYK0mR5m
	uhRcu+m4nMUsLWxvlA9IKQ2ZRI0RG8kB1W3MwruwiR/crwjYIYEKaAighjL9glSlnRfs5r0/lSu
	Os26sl/MtNEhy154MTZ3+spUNZRi69RKFB0CDDzLtpg==
X-Gm-Gg: AYBFou2XfieqMjLXvacjjIL7+Kdm4t2CAF6HFArfa1UfPWNQAzM8NHe1qOOuBnbFAYF
	rA42im14vRjzmOW7v2gDSFQQdAicctmFWxLtpxSvVCETyH9OTSPxHSQGtj1J/RsFE/tkNkZhGBh
	MYqN/UFg9nV6XmjD2rkWbRYyO6Bra2gL/TNu8JIvkqWQ6MdOO3FwsAJ3ZPD6sUEFl8xwQ15/sRX
	lH/qytAwDYP29IblMHtgjvKKGSBjdoje+tkE694/a9BcyCh5hvvbxBvfz9aUiNarZIZqllin1+q
	bYk9PxuRxoQMvBtmh64Mpabxt1hcjs6cHpqVTPHZqKHwZgVVYWaRjwHTTCHQqpSlw2LqnMJRAtm
	rM0P+IoOD03c=
X-Received: by 2002:a17:907:9409:b0:c29:4634:5c8f with SMTP id
 a640c23a62f3a-c2ada647ed7mr1055260066b.0.1790654028636; Mon, 28 Sep 2026
 20:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-rtrs-warning-inrtrs-clt-rdma-done-v1-1-0827a9a77c0b@proton.me>
In-Reply-To: <20260923-rtrs-warning-inrtrs-clt-rdma-done-v1-1-0827a9a77c0b@proton.me>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Tue, 29 Sep 2026 05:53:37 +0200
X-Gm-Features: AclHuK-5Ax-5HRhJj79aeHp660dbmq9BrXi-hDQnBQk_mf_Pyc_xT0DQAfYRBLk
Message-ID: <CAMGffEkMp61Q4EOp+WEVH42mZSd5BMWVbe+dm-Gnr3CUN09E=Q@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs-clt: Validate peer-supplied IO completion msg_id
To: quanyeyang@proton.me
Cc: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Danil Kipnis <danil.kipnis@cloud.ionos.com>, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Farhad Alemi <farhad.alemi@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:52=E2=80=AFPM Quanye Yang via B4 Relay
<devnull+quanyeyang.proton.me@kernel.org> wrote:
>
> From: Quanye Yang <quanyeyang@proton.me>
>
> process_io_rsp() indexes clt_path->reqs[] with the 19-bit msg_id
> taken from a WRITE_WITH_IMM immediate. That value is chosen by the
> peer. The only check was WARN_ON(msg_id >=3D queue_depth), which still
> lets a completion run after free_path_reqs() has set reqs to NULL,
> or against a slot whose FRWR is already gone. Either path
> dereferences req->mr and can GPF; KASAN reports a null-ptr-deref at
> offsetof(struct rtrs_clt_io_req, mr).
>
> Treat a missing reqs array, an out-of-range msg_id, or a req
> without an MR as a protocol error and recover the connection.
>
> Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> Link: https://lore.kernel.org/r/CA+0ovCiJZz6O8LzsS9Dq1-JE1OE1L_OTA6Mr-Wra=
tpUE6jczHw@mail.gmail.com
> Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> Signed-off-by: Quanye Yang <quanyeyang@proton.me>
lgtm, thx!
Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/=
ulp/rtrs/rtrs-clt.c
> index eac38b57b00d..f8d3c6f37e3e 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> @@ -489,18 +489,22 @@ static int rtrs_post_send_rdma(struct rtrs_clt_con =
*con,
>                                             imm, flags, wr, NULL);
>  }
>
> -static void process_io_rsp(struct rtrs_clt_path *clt_path, u32 msg_id,
> +static bool process_io_rsp(struct rtrs_clt_path *clt_path, u32 msg_id,
>                            s16 errno, bool w_inval)
>  {
>         struct rtrs_clt_io_req *req;
>
> -       if (WARN_ON(msg_id >=3D clt_path->queue_depth))
> -               return;
> +       if (!clt_path->reqs || msg_id >=3D clt_path->queue_depth)
> +               return false;
>
>         req =3D &clt_path->reqs[msg_id];
> +       if (!req->mr)
> +               return false;
> +
>         /* Drop need_inv if server responded with send with invalidation =
*/
>         req->mr->need_inval &=3D !w_inval;
>         complete_rdma_req(req, errno, true, false);
> +       return true;
>  }
>
>  static void rtrs_clt_recv_done(struct rtrs_clt_con *con, struct ib_wc *w=
c)
> @@ -562,7 +566,8 @@ static void rtrs_clt_rkey_rsp_done(struct rtrs_clt_co=
n *con, struct ib_wc *wc)
>                 if (WARN_ON(buf_id !=3D msg_id))
>                         goto out;
>                 clt_path->rbufs[buf_id].rkey =3D le32_to_cpu(msg->rkey);
> -               process_io_rsp(clt_path, msg_id, err, w_inval);
> +               if (!process_io_rsp(clt_path, msg_id, err, w_inval))
> +                       goto out;
>         }
>         ib_dma_sync_single_for_device(clt_path->s.dev->ib_dev, iu->dma_ad=
dr,
>                                       iu->size, DMA_FROM_DEVICE);
> @@ -634,7 +639,13 @@ static void rtrs_clt_rdma_done(struct ib_cq *cq, str=
uct ib_wc *wc)
>                         w_inval =3D (imm_type =3D=3D RTRS_IO_RSP_W_INV_IM=
M);
>                         rtrs_from_io_rsp_imm(imm_payload, &msg_id, &err);
>
> -                       process_io_rsp(clt_path, msg_id, err, w_inval);
> +                       if (!process_io_rsp(clt_path, msg_id, err, w_inva=
l)) {
> +                               rtrs_err(clt_path->clt,
> +                                        "Invalid IO rsp: msg_id %u queue=
_depth %zu\n",
> +                                        msg_id, clt_path->queue_depth);
> +                               rtrs_rdma_error_recovery(con);
> +                               return;
> +                       }
>                 } else if (imm_type =3D=3D RTRS_HB_MSG_IMM) {
>                         WARN_ON(con->c.cid);
>                         rtrs_send_hb_ack(&clt_path->s);
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260923-rtrs-warning-inrtrs-clt-rdma-done-3a72d73550b1
>
> Best regards,
> --
> Quanye Yang <quanyeyang@proton.me>
>
>
