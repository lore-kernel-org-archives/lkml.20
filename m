Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793733707;
	b=S7PvY6w6hY4QSFmJ+97ChZgwqUeoYTnBQJ3O1Lrx/gB1T8P8A5CTuPinsbkGqhIkuud/
	 P3rjUJodUDth+UY13quDyVelQrZIwredfL8zMlu+2XesOTkIvS6AqnZtvGjY2uifzh+YM
	 FGWyTqn0UPP7KevvvyO21+h7TdUSUagjtUfjX4dvUB97/w3wFqF6fNbDCxqBpmxkUcwSy
	 U7Bqow+2rfhGDGE85dcSnze30zeWbcmOQtlpGBmJNgaCTag+2wzmMRTVShFcj77TvaWiS
	 3oLuqcdqhtm9GG26bRYJS1QbPNtBYcmIIUc6pe0M88FQlbDtxKXcTkAw62ZtZ6WtVyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2A1+00jvrnNf7fqGHqc8ys6TlCrlf1oE14AvYJeLS/c=;
	b=sVHX0HNWMepYA11+JTtnnl0pVPQc5gauuDkr94xSYium8k2uO2t2FXgQu4EqZbd4ynuW
	 wiad9PO8v7cNOuPUq0roRhyIBKdCXmSiH0wqMqRFQNN75xHd7PIZ1zlMJQ2wyNy2u0EwW
	 k+ovl/lbQzkcjMWBE7BLYHIe+NH1ttDmS1jta2ScJqcVr9XxtaYBu78wgCpz6vnzySUPH
	 E9OJ/VhvW/rjgmykmdAHCPMucjU60wV68sNejvc/GrQqr8DIlB8WKw5QsLdrbr1jvbERa
	 IiFzV8eXbC+w3/lHYASwzAU4OGAsHHbDwQdKVqGSXmXIRrz2NKliX2cWjvBfHIH48BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qB9t5sYl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E16606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E16606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qB9t5sYl
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-51f2e9e6987so723575b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793733705; cv=none;
        d=google.com; s=arc-20260327;
        b=ZFmZUen9uSXLbr2CF0Gf3K1E4/Zgkj+s96RCxWkVHciioQcXGIa5H/p+eV++Z4S8UP
         RpGKUCC2o9vkH9z90iC8mAajkgYYTYGDnjqCUsg9K4QZOx2OjBnszhUa84Rnn9qDy0o/
         mBqzV5uOCHeO2KiRUbvUXMd6ii+I67PxuE4CntWurLQT9GQqh0fQJ8Nlz4gzc/hvCBZ2
         Ybs0KfJdFMN1BwxwOLBf6m5k+wS2rebn7fXgo9cLXfIyqMYOSFdaismMmNqF+a4ddHwn
         dMmMT6Z8Q+qT4NLKbVR5BtVTze4LeVpg+OehmuW5r+Jwqjz8MnNTptWQYB3S/r3oUsEt
         Vmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2A1+00jvrnNf7fqGHqc8ys6TlCrlf1oE14AvYJeLS/c=;
        fh=b1oPmTomGIRjapHnEdQ+AQ1bthLTCTo/xC8pIi6Em1Q=;
        b=lukeYWeXKqFa1C5pK7WBI7JE1RtZV4Ix++pbtZUdSfTm9Usesy2OEWqZIH8rdXu7zO
         gqAVnLRtaVHJHT3pWmjiiWrkqv65/8aruYk4EjlGkTyLaiYnYJx9RriZLD2r5354NCVK
         RUZnImSqFtof2KDX+yvniFoC0wsoT42RPJlpKzwtDe4V0qL73itj0zazuoyS6gkHCusl
         IcenQK3Ajkogq5Cb2YanJSa983+F2ebhEaFaZ23hLQcq48ldlsbJsj1+ZHV9MBaTuGZO
         l/UA5yu7avPErq1PvWQJa+tN2ywPY/u3x+VQ/aXuVUQoBWUpx4DJWWcZjzPUXSKhcXUf
         xKqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733705; x=1794338505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2A1+00jvrnNf7fqGHqc8ys6TlCrlf1oE14AvYJeLS/c=;
        b=qB9t5sYluMmH6Wki4hL0KNanBi2gr9BmXo77ddBPrrktT8+yHKMT64ZdrzI21XrTAR
         2Lu/WbCtH1vJEqHvguXSSa4wFgKvNkc8d93JfqGHeEt09Ug87RiIE+m2GKuy0MV4UTh5
         jxBlhpae/qv34nn9tXb92u+C6CpULg5CzgfsV5bVzdEqGg/VH1CYW01KEBWSuZ7xyVII
         xkHgfPhrRqtRDW2OrJgOitANn0szXh+jYT13NVK9VEIlq0X+iQvyGi0sRGcdVTHLPE2i
         Ss7n4kz42G/CDLZK1td6gOJULRGwxZPe6gDeFVTUqXFL+H4j9TLU8NVqSPELAj2BAG05
         w1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733705; x=1794338505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2A1+00jvrnNf7fqGHqc8ys6TlCrlf1oE14AvYJeLS/c=;
        b=pdCyapnskZ5kSOO1TSgzYtfypT5ryBTi2v0FUlhNjs/LpwPArS20EG7V1gs6dAZKrS
         tr1/e3SObgT9nfwslly4P2+juT4VBUspzYy2Wcb15KQ2BSkrBy1gsqXsvQp4EKphitJw
         jzIOXGiq3PmL9bpydgk7aOvEjwoh6AVqsB94plUly/Of6ym33JzhRgzeIKCwH6mQf6a8
         c0UqYShyL7bxasAw1w0JKidn+4y3rwHSakg+njhsSDPkMyGcTIvghI4Evwb1eJXp0msL
         Hd2x59ByrjG9VZ0axrBUakMRj9f/Xst1rymAtno6R3/C5GaJSlA34mUXFGAkf9luArEH
         Tosw==
X-Forwarded-Encrypted: i=1; AKwUvBzi9xm/+cGINXIqeYEIoduIWGkD1/Hue4eaQkECcdea7+6TjtDHBkI3XppPOdqH+JwF3xyJ3OM5ME3gEfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EdRTRNInPW8VNf1Ut54w3IrxQ+Ya4W03o0fipYrjgIpqd3frF
	HLOCrwmkB9MxL68cZL8xVLiXsGihTL7UvknPtQhfb6UiVFpxFhksVNlcTofYrDFU+ubkSo9O53P
	oPaF0OWI0xzUHcjzyar1D1dpljn4Y1OQ=
X-Gm-Gg: AYBFou1K9Djj5UdaJAZT7uYfwKc7ZtTcy44RAwozwY/a9HF74DghODDSIK3MQ8GeqDI
	FNtd9vO3HsflR+bDMXmxCmiwFMt/2py1In8aAJdrGJMBu12IrNDxKWHIGZowors9mThU2GjV8Qs
	+cvxyx9yGKX6H1zSmX/GExEWfZY4QZ4NgLjig3bxKqJGnZK3TXaavWZbE/EiLx2Ih/oJjGWYjhG
	zwjo0KSl1DoZvQRkECi6WLI1WJJ+f+ulImV2J7UmWPNGPUISvqc25bGooFF2LCh9GtvE+CmJ4u1
	RuicUpNzAzfPmuX4gFh93nnkbkkkNN1rhHlcePcRpJ6u/ih8w9RRpTirMyUA8jt3hi//RzqCi/O
	qrSCAlSpr5cii9jBkGNOT4z4AolZSOkBDAirB
X-Received: by 2002:a05:6808:4f13:b0:53a:1c29:cb37 with SMTP id
 5614622812f47-563efbabc76mr8210157b6e.38.1793733705389; Tue, 03 Nov 2026
 11:21:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
In-Reply-To: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
From: K <coshi036@gmail.com>
Date: Tue, 3 Nov 2026 14:21:31 -0500
X-Gm-Features: AclHuK82vppXzIrwdOK2yIIRwoykiWBsd13OjY3_tJWGGEeLsCKM7ty2jD_EoBQ
Message-ID: <CACd_6n03YaDPrJgD6EB=bHoN+sQ=aCH0XvPfpdkm_68WpPMqJw@mail.gmail.com>
Subject: Re: [PATCH] nvme: reject completions for requests that are not in flight
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, kernel-dev@igalia.com, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, pls let me take a look, it looks like all AI generated. May I
know what kind of test you run or LLM run?

Regards,
Chao

On Tue, Nov 3, 2026 at 2:17=E2=80=AFPM Mauricio Faria de Oliveira
<mfo@igalia.com> wrote:
>
> From: Chao Shi <coshi036@gmail.com>
>
> There are a few kernel crash reports from the Steam Deck where incorrect
> completions received by the nvme driver have a command id/tag associated
> with a freed request (rq->mq_hctx =3D NULL), dereferencing a NULL pointer=
.
>
>   nvme_handle_cqe()
>   -> nvme_try_complete_req(req, ...)
>      -> blk_mq_complete_request_remote(req)
>         -> if ((rq->mq_hctx->nr_ctx =3D=3D 1 &&   /* Oops! */
>
> Although the usual suspect is the nvme device firmware, one report shows
> incorrect completions also received by the ath11k wireless driver at the
> same time, which suggests the underlying issue might be something else.
>
>   [ 2585.223155] ath11k_pci 0000:03:00.0: tx completion for unknown msdu_=
id 0
>   [ 2585.223163] ath11k_pci 0000:03:00.0: tx completion for unknown msdu_=
id 0
>   ...
>   [ 2585.228077] nvme nvme0: request 0xec genctr mismatch (got 0x2 expect=
ed 0xa)
>   [ 2585.228079] nvme nvme0: invalid id 8428 completed on queue 3
>   [ 2585.228205] nvme nvme0: request 0xe2 genctr mismatch (got 0xe expect=
ed 0x2)
>   [ 2585.228208] nvme nvme0: invalid id 57570 completed on queue 3
>   ...
>   [ 2585.228726] BUG: kernel NULL pointer dereference, address: 000000000=
00000fe
>   ...
>   [ 2585.228752] RIP: 0010:blk_mq_complete_request_remote+0x1c/0x160
>   ...
>   [ 2585.228787] Call Trace:
>   [ 2585.228790]  <IRQ>
>   [ 2585.228828]  nvme_poll_cq+0x14b/0x300
>   [ 2585.228838]  nvme_irq+0x41/0x80
>   [ 2585.228845]  __handle_irq_event_percpu+0x4a/0x180
>   [ 2585.228850]  handle_irq_event+0x38/0x90
>   [ 2585.228853]  handle_edge_irq+0x8b/0x230
>   [ 2585.228858]  __common_interrupt+0x3e/0x90
>   [ 2585.228862]  common_interrupt+0x80/0xa0
>   [ 2585.228866]  </IRQ>
>   [ 2585.228868]  <TASK>
>   ...
>
> However, even when the nvme device firmware is at fault and need an updat=
e,
> it is interesting for the kernel not to crash, so that it is even possibl=
e
> to run the firmware update where the issue happens frequently or early on=
,
> and while waiting for the update to be made available by the device vendo=
r.
>
> The fix is to check that a request is actually in-flight before completin=
g
> it. This has been previously reported and proposed by Chao Shi, found wit=
h
> fuzzing, but without further feedback since July. I happened to learn of =
it
> only after root-cause analysis and reaching a similar conclusion, checkin=
g
> for prior work/feedback, thus keeping them as Author/Signed-off-by, addin=
g
> myself as Co-developed-by for the commit message and root cause analysis.
>
> In Chao Shi's patch, there's been feedback/question of whether this shoul=
d
> be done in blk-mq, as this is not specific to nvme. I'd say no, at first:
> - Some blk-mq calls for completion have no return value (e.g., completion
>   on other CPUs), which suggests maybe an API change and updates to many
>   callers, all for an edge case.
> - An alternative available currently might be blk_mq_ops.complete(), but
>   that is handled in the driver anyway, with risk of hitting an error in
>   blk-mq (like this) as the code changes, and seems semantically wrong,
>   i.e., completing a request that should not have been completed.
> - Keeping in mind a small fix for stable, for now, should this be merged.
> - But happy to take suggestions if blk-mq is indeed the way to go.
>
> This has been tested with a synthetic reproducer produced by an LLM.
>
> Originally-by: Chao Shi <coshi036@gmail.com>
> Signed-off-by: Chao Shi <coshi036@gmail.com>
> Link: https://lore.kernel.org/linux-nvme/20260522153034.2168862-1-coshi03=
6@gmail.com/
> Link: https://lore.kernel.org/linux-nvme/20260715005105.1115958-1-coshi03=
6@gmail.com/
> Co-developed-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  drivers/nvme/host/nvme.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index 2d8f681079e85601a92624d196e77f1ba3ace34a..3ba0666da7be6a3de2e5f0fd5=
0155af115b4e1f6 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -708,6 +708,11 @@ static inline struct request *nvme_find_rq(struct bl=
k_mq_tags *tags,
>                         tag, genctr, nvme_genctr_mask(nvme_req(rq)->genct=
r));
>                 return NULL;
>         }
> +       if (unlikely(blk_mq_rq_state(rq) !=3D MQ_RQ_IN_FLIGHT)) {
> +               dev_err(nvme_req(rq)->ctrl->device,
> +                       "completion for request %#x not in flight\n", tag=
);
> +               return NULL;
> +       }
>         return rq;
>  }
>
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261102-nvme-double-cmpl-uaf-blk-mq-e3d28f74cdaf
>
> Best regards,
> --
> Mauricio Faria de Oliveira <mfo@igalia.com>
>
