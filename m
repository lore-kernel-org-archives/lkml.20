Received: from mail-ed2-f42.google.com (mail-ed2-f42.google.com [74.125.228.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A91276050
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054142; cv=pass; b=AU9zekk/ykQfEYtz2t5GKbVXgsAo+DuANJ39SRx1PFFluv8w3+s9YzazG2QMMNZjJa84MPNAiz84YROZMKLBdUXDYhFqhFtPcoSBmmhx5XsihpINli1JthH10veILOzB5k5M2AiUrqmUOcFy9RUKKkv9qV4jjJF/NMkfdRB0Q/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054142; c=relaxed/simple;
	bh=MHkYdeuq/GQ6cy9KhsMnCwJnFdIAwA10VuPadJacYhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSF+Oe1nlAn50yL5sz3JbUUeFSzJmRbxdUZHuZnzs1c3g6fZ+1hE91hTxDFS52XH2ab5n/UVKwEBsSbsg0VGd/NQ8LLAafgdbWprwSUfBCJ4tVE+84CIinD9tvSLk/cW3fx0YZW7+wt02c5JgU9ve52EP0MRXEk4iG50Z2AIIe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=HJNsURa3; arc=pass smtp.client-ip=74.125.228.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="HJNsURa3"
Received: by mail-ed2-f42.google.com with SMTP id 4fb4d7f45d1cf-6a5d8ff627eso80434a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790054138; cv=none;
        d=google.com; s=arc-20260327;
        b=LB186wFSwUyf/DGL8lYroTKiBbDALeUzuIQHetI2r2MYUJLSuGoP9KQiYV5/6WHxUA
         jcKGQiDkNHruzbGYvLD2Z/TqVxVmLmh/hlpuwHB9dlAPDtBQ+0Ble1AbN4xnMtRmd6Y4
         yxW53WOrgO90w+hN+LC15u0YA/6Bbfagm4Ha5NmtBrCivwBu5p6qYoA6z1JyIw9+Lu4p
         9QDKxA4CdeYZbW3Jhght7rLyil2qPMIGUEO7DM1qnHIEJQMCTjMxPow/ca+FOFoldavX
         9A8AlUlo0CLfDqQT5FYYQtIxd3HIES32QOLgPbyQ9Vbmm+JBGKgmjdlu1D9uMqKqz80O
         4oMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WgZFnKxz3ST32YIA6Z0zQdHgzABZKQB2kumQfi8K+Zc=;
        fh=snrh+A3Z/XJmGGQw8JssAPgTvZQfGedY9spP9M3DgVo=;
        b=XkOOmqlmbDabbp+6kc9SS9vqFuLyp5wWADgS89o1u0iN1SKkRypaaBvYKD/YRxggIN
         yF3Ebxvz/ulUyV3OEBpa2dL9yPy4ChP5NtCU6UteAYQoAqX/lZeRfUl3zNcf5zG3cf0f
         QAqeWiitU83zLrp03uCHBK008VuUxo9ABrFlHQ9D2OJ/UKxE1uesTfXP3mVBck2cIv52
         KUhkyfrBgdX4nljBrFhX+Ph1FIZSIaodgj0VTy/2EEXlwmITZipae4ZCG8he4D1qwpkq
         nrLDNoKk5mNRxJ0sZPHG1UWMMPawXuAC0yzBLlqJVfG4rp+tphXzuGE5LJr++n01qXt6
         xPwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1790054138; x=1790658938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WgZFnKxz3ST32YIA6Z0zQdHgzABZKQB2kumQfi8K+Zc=;
        b=HJNsURa3/SqygroKlnoref9VfzDdeHNVgDoM04f9UNlTMmAX+Wd2mOl4YCdXVK1XQr
         LXOC6sNN21qPs4uUGtWlbL659Wrtu2Ec75aXsHpFXsKQ7Hm4E0b3sLbP5Onw2I6Zu6/w
         6g2urWbIfMPPc5U7d00rgTDddjbMI/Zw+fEgigvo9vrtFKooRmwm7dlD5/9Mfogq1/sN
         p6mXsyysi3utiV+p6TvuBGI9w7o+eHdLHt/+CHQ4UVvYj4KVmszRFtrUyKMKC3BreYeW
         KVkzB/AX8uNYKmNU8urMKtFHf0QTZoFUnnaDmYoISZYBb38fxqStutrPBKV+Uecl7x45
         3Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790054138; x=1790658938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgZFnKxz3ST32YIA6Z0zQdHgzABZKQB2kumQfi8K+Zc=;
        b=e40fIqKkVp87Fo3Vgz2LiqbvvzMe1PnCmW1Kf4Gg0Wf1gw0qG2znTmthGpAaCP42hU
         d3UVbBYhZQS212hCUTK46kysauyDMy/LAuWw1L2iGuL6eznxs0LH5bIwHJdLoSnzuWuI
         Fs/n0D70j4dSpqzZaAOBLH9bpINc1OTYYsG4XoU84XUcu9axPzRETWDUYdFhw+Rd7KyB
         xLkamcCOdpVhzKtgPzG1sL4ajl8PWcLrAF0wV85+C9PS+yb8tWyCQZajdRVYZmWgDnEV
         my8cQz9QEW1xWDKHVGvEASbOrFyIoPRTi59s10GPKA6U42QQhLF0axWyA2OH/fw9uX4/
         uJJA==
X-Forwarded-Encrypted: i=1; AKwUvByZGBAbgOp9OZGYLuvpPf3oWX70h2vmTB5WKlyXoxFjc1V38xjsn4qACqX14eHAh70wfAPtg08Bfv4f2Vw=@vger.kernel.org
X-Gm-Message-State: AFuF++kqhwTwmh6GRkrJc8LkpOHvqIrbOTmuCT1fS6aQ2mEpfIN4VHOY
	CVEkQfW54ohVQltXq/yz3IEM1H3GnNGYwdF8FUJY+zcr925gp7qrVQtAv3arPe/MPWDLqo3Pc+J
	1PQHr6RTmgOm/Fm8nPFrkQJT3MpeT7yNE0LqTfdiksg==
X-Gm-Gg: AYBFou3zH5oCLAe9Drx61CAaO9KCa35DGKG1On0uwIra96GPrRCh+qQ1jbT+NQY+HF1
	7aGgVPjTQCFX4q7pbzVb/bTiiLVDljkADhO6F07RpuvQHK82FQYcAxr6X8qvgh0jXmASq9KW4Cy
	cizXXfZ9TlPOI45nCl12beyknjIixuy1bpqXNn/q6aFko7A+xrkBXVewqcIiXlJyYfuZDLbSeCV
	nP+XcjDRceDx/YVyz9I4HkMmfcj9Au72oJ4IY/IP7S9ZnWR6LIvHAwCOUNBUmseH55njMljnWWm
	TCEGQdGFFvKL/IJN47Qq4sLVIkc337ZJsVMVsAGp5JZ30ctZpmqpoCg=
X-Received: by 2002:a17:907:7b88:b0:c16:604a:b2bd with SMTP id
 a640c23a62f3a-c2a1a9180aemr1226088066b.3.1790054137823; Mon, 21 Sep 2026
 22:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-rtrs-fix-rtrs-clt-info-rsp-done-v1-1-c64281ed97c0@proton.me>
In-Reply-To: <20260921-rtrs-fix-rtrs-clt-info-rsp-done-v1-1-c64281ed97c0@proton.me>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Tue, 22 Sep 2026 07:15:26 +0200
X-Gm-Features: AcwNN1UyR_asqLal6G0VDs_es5TmRoJuJKO4azcJK124CAiyAS2-MdQZQ0pBpKc
Message-ID: <CAMGffEmNYih7sQ7SFx670T+rgzmmE2QrtrkzNsdpuwgZEdPDZA@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs-clt: Don't WARN on unexpected info-response opcode
To: quanyeyang@proton.me
Cc: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Danil Kipnis <danil.kipnis@cloud.ionos.com>, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Farhad Alemi <farhad.alemi@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:25=E2=80=AFAM Quanye Yang via B4 Relay
<devnull+quanyeyang.proton.me@kernel.org> wrote:
>
> From: Quanye Yang <quanyeyang@proton.me>
>
> The info-response receive is posted for a SEND.  The completion
> opcode comes from the peer, so RDMA WRITE with Immediate is a
> legal WC on that WQE even though it violates the RTRS handshake.
>
> WARN_ON(wc->opcode !=3D IB_WC_RECV) treats that peer-controlled
> field as an internal invariant and panics with panic_on_warn.
> Treat a non-SEND completion as a handshake failure: log it and
> keep the existing CONNECTING_ERR cleanup.
>
> Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> Link: https://lore.kernel.org/linux-rdma/CA+0ovCge-K+hcGHXZ4R3Ww5+cg159ux=
HBeVbKeUSLBRSMT8OWA@mail.gmail.com
> Signed-off-by: Quanye Yang <quanyeyang@proton.me>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/=
ulp/rtrs/rtrs-clt.c
> index eac38b57b00d..3c23c27725a5 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> @@ -2514,7 +2514,12 @@ static void rtrs_clt_info_rsp_done(struct ib_cq *c=
q, struct ib_wc *wc)
>                           ib_wc_status_msg(wc->status));
>                 goto out;
>         }
> -       WARN_ON(wc->opcode !=3D IB_WC_RECV);
> +       if (wc->opcode !=3D IB_WC_RECV) {
> +               rtrs_err(clt_path->clt,
> +                        "Path info response has unexpected opcode %d\n",
> +                        wc->opcode);
> +               goto out;
> +       }
>
>         if (wc->byte_len < sizeof(*msg)) {
>                 rtrs_err(clt_path->clt, "Path info response is malformed:=
 size %d\n",
>
> ---
lgtm,
Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-rtrs-fix-rtrs-clt-info-rsp-done-3e5d47cfdc44
>
> Best regards,
> --
> Quanye Yang <quanyeyang@proton.me>
>
>
