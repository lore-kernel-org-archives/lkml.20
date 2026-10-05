Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B091337F732
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200562; cv=none; b=KwyW5JwmNjyPrq/lRkJcVLAh9AtpBZyzGH7a9s09dyv56c6rXGJnf1k+Xa81VEm++DOF71LWiZQB2YUwbsyy+zyGwEdylWlXU9R6PQQvE8UePgSBHfBq8iH/KHFkGw5UcyxSdWEveKvXcL6v9ZzNdVi/SQPn5FbxjFlviNbfAX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200562; c=relaxed/simple;
	bh=RJHZveZ9RM6slECcVWdAq+Dfc0/PIILWrjCkq3aWuws=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=eAN8E8H/POZOVwftUYvHm3ognC70K/xf8Q6d92VqO5pSgFg461DW5SeN8CxS8Zc/rkUncH4BS7touPQVLWTZJWBINYNxllQ0uVk+gC2XVQIyJqriNRQNtqQqRkG2viu8fDm+XYTXprHs6Yf5On6L9fxGVQ+BK8g16YwlekCtxuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBJaZSrk; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBJaZSrk"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5350c1b9e0dso23860001cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791200559; x=1791805359; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QCcpISpI1wOop8ISeCzO4aGfuyNbBFp2wC4CQXpEbyw=;
        b=TBJaZSrkIkbqa5VNP0jba6olH6Vv5+9MxvzSrIXj2T+l7mzp5P+T6vgaZYSBVamw9Y
         b6koXT5CNX29UkQbmyia0w1M+zRRzZkV07Z/XKIIOqKz8FTn/i5ETXuzxguPX73cBUlC
         3rbLRcZnBfpD2YbV/fyZbCSW4iE1S/GDuZR/F0hv8IMDHl69eTN0evOd0aQMVqowkRI+
         mSz3FhnBK8LA1NnU1u9V9HcfLTkLT4HS193RBmXmViaSsEKfu+7mUDTDrlxjpvzMo28h
         pSqNQ7aUHuOuA8Lzgq7EVSrIJ8yCurFdDRrOjwiwInCCgOl2OxeCwJE8MevtX+l3VIhk
         +xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200559; x=1791805359;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCcpISpI1wOop8ISeCzO4aGfuyNbBFp2wC4CQXpEbyw=;
        b=yXSeZSj8y/LUQ5Vl8D6sre3ugu6puMf25mO8ayGUL42S6ATY5cHbn0i86CdUMMBsth
         wTBMIkYnbwcdIMiX2WtO37QdXG3tNnrniQvX6nUoj5IsHdljP7YMuL/joMPVBBgLWNJP
         WMcn3BUg9p4RpLLyvyOO4QTATw2QUGsdcjuKGoFjXLnVC094c4eg6j7tp1ttAcOqjj+6
         yAxilxT1GkdYCcz3DDNMuLTy7y/8NHmaO/TjyfYYIQGG+LkEpA/j71NYRE4SuxURJUtc
         /dVxsqkKsGhIjxI1XR6dwZqHhe8kdoTDNCUcMlaWY0g+r7hXqRs11FSOvdsix+7u+nnj
         77qQ==
X-Forwarded-Encrypted: i=1; AKwUvByvY0HfeqD+5LK5OFwtgvQ8gjoH97r0c7A2UBemBPMjZTtF/Y3FP1tNOY5IsKsYG/CUeid2Itj1KkJ7OB0=@vger.kernel.org
X-Gm-Message-State: AFuF++nk5pfgZg7sdXQZ+d1f/+MXXcxe0Mz/yEODi2TUOdGDkrwxI/4R
	L4jsxLzLfKnaTkgtp++K9560e6TCWKNG9rp0g1OXgBt7IvZfqe+Pf00n
X-Gm-Gg: AYBFou0Q8FVj9PYbj+IGCcPbubhmiGvJthKZjJ6aH9LKs9WMZBJSy/+vHFJQSGWx/z1
	sh+TEWTy4h7vVzZc5ozwwAOqF6SPdsJ/rPWmyey29nsnz/JZeBvWhxglLPy4beatrkVO3ZqOoHe
	cmJkdnPWAsQD2F9qPpcmg2vrKpDWznwQ5zdb2svV1uoOxYarZHJkDwQ9HqsyJ5As1MMfKfmaU1x
	UFzAHVjhUW0xXUCDqr/bpSk2xgYaTkA64v2G5j3BaNiXLPlAkksK7yzfDSKolbJ+PdOz5hlrEmT
	Zx2kGzrF2xBYHaOvMxmm6DpfjTEKyGkEehG5nqzKpByYqmgGLxMW3jh8YbdCY+LaTRALhreaUfo
	de5Emijk/bs8YjCQ7DpV2WdGPlrk4tsSTgGL0DYcg8eJjAgZOsWZA0l9kBTYHRzVxgEa/QN8t/h
	kyRf66uo5FoWAKbt2VVEoVJbpYESoJk7EYwsx7KI8Hrbbb46Ubh26u+vxVpIqW3IshsmqElKzhW
	tk=
X-Received: by 2002:a05:622a:1303:b0:533:91bb:b81e with SMTP id d75a77b69052e-53511e9d562mr120295651cf.31.1791200559638;
        Mon, 05 Oct 2026 04:42:39 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d122a4sm93408281cf.23.2026.10.05.04.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 04:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 07:42:38 -0400
Message-Id: <DLWVLSLYA73P.W5X67Q4ROUK@gmail.com>
Subject: Re: [PATCH net-next 4/4] eth: mpnic: add a NAPI depletion check
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Harshitha Ramamurthy" <hramamurthy@google.com>, "Daniel Zahka"
 <daniel.zahka@gmail.com>
Cc: "Alexander Duyck" <alexanderduyck@fb.com>, "Jakub Kicinski"
 <kuba@kernel.org>, <kernel-team@meta.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261001-linux-mpnic-v1-0-6422ee74233a@gmail.com>
 <20261001-linux-mpnic-v1-4-6422ee74233a@gmail.com>
 <CAEAWyHdJQsKgHmZSAA3M12jpKhgb_pq7QmBRW59CU-Q_JT8cwg@mail.gmail.com>
In-Reply-To: <CAEAWyHdJQsKgHmZSAA3M12jpKhgb_pq7QmBRW59CU-Q_JT8cwg@mail.gmail.com>

On Fri Oct 2, 2026 at 8:53 PM EDT, Harshitha Ramamurthy wrote:
> On Thu, Oct 1, 2026 at 9:41=E2=80=AFAM Daniel Zahka <daniel.zahka@gmail.c=
om> wrote:
[...]
> +void mpnic_napi_depletion_check(struct mpnic_net *mpn)
>> +{
>> +       int i, j, t;
>> +
>> +       for (i =3D 0; i < mpn->num_napi; i++) {
>> +               struct mpnic_napi_vector *nv =3D mpn->napi[i];
>> +
>> +               for (t =3D nv->txt_count, j =3D 0; j < nv->rxt_count; j+=
+, t++) {
>> +                       /* Check if BDs posted covers a max sized frame
>> +                        *  + 1 BD held by RDE as a spare
>> +                        *  + 1 BD of extra safety margin
>> +                        */
>
> Curious how the "+ 1 BD of extra safety margin" was decided. I
> understand the "+ 1 BD held by RDE as a spare" is because of HW
> behaviour but wondering about the extra buffer descriptor - if it came
> from testing or guarding against something specific.
>

The extra +1 isn't strictly necessary. The real lower bound is
MPNIC_RX_HPQ_DROP_THRS + 1, which was derived from the design of the
device and our napi poll implementation. I added an extra BD count
because the actual bound doesn't matter as long as its conservative.
Perhaps that's a bit superstitious.

>> +                       if (mpnic_desc_used(&nv->qt[t].sub0) <
>> +                           MPNIC_RX_HPQ_DROP_THRS + 2 ||
>> +                           mpnic_desc_used(&nv->qt[t].sub1) <
>> +                           MPNIC_RX_PPQ_DROP_THRS + 2) {
>> +                               mpnic_nv_irq_trigger(nv);
>> +                               break;
>> +                       }
>> +               }
>> +       }
>> +
>> +       mpnic_wrfl(mpn->mpd);
>> +}
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h b/drivers/net/=
ethernet/meta/mpnic/mpnic_txrx.h
>> index 9397010557eb..767d87a36c35 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
>> @@ -148,6 +148,7 @@ int mpnic_set_netif_queues(struct mpnic_net *mpn);
>>  void mpnic_reset_netif_queues(struct mpnic_net *mpn);
>>  void mpnic_napi_enable(struct mpnic_net *mpn);
>>  void mpnic_napi_disable(struct mpnic_net *mpn);
>> +void mpnic_napi_depletion_check(struct mpnic_net *mpn);
>>  void mpnic_enable(struct mpnic_net *mpn);
>>  void mpnic_disable(struct mpnic_net *mpn);
>>  void mpnic_wait_all_queues_idle(struct mpnic_dev *mpd);
>>
>> --
>> 2.52.0
>>
>>

