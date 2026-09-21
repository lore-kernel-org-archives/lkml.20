Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD31372ECB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031350; cv=pass; b=Y44OQadWEfnOgWiQuxSqD2fiY27sIZiDLB/4lqoNehIcXUVhnGJdcUDt6/hys9/lJMb/nSW6UXSglfB1hSOLnYu8a1FA5t9NYZHUzPizeD02Z5rROSqMnvNwflq37qRRiX9afSPxBXRuknV2DpSSZ8ZW4U1tp4db1UEB8GsKc8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031350; c=relaxed/simple;
	bh=hyJLCVJxZDQDHfQeiCxaRFPeeiFOJ1V0CZ8eKBM6X+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eq7Sv+aSP6+Jbb/eOD9sEiSBlZjC2uH/YUEf2jGjleMLQ3ApoPa6LP+WllH8Rs90bFIhoHrlsp7VMlymUPawAqbq4onahvSTQY9LXpwJF9QY1y5jDYys3+hQ6ND3lfdZmnUT0HkPRX5pRFP2iUVk3ST7HguU6VjzHsIhqkIUhHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+9x8apm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OJeJkqv7; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+9x8apm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OJeJkqv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790031347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dX1swF85DcFrMT9o2ilhYKNWxIuRVz3Jd/fKWtp4O04=;
	b=M+9x8apmch+bIoBKCBbq9LPX8D/188cog2jiF1C+vuNfPPXUihph7w5w6ZlNVnKT8ykAdy
	mm8g+Yp9+DtLkS283BYNG5TE/6vksPD1yhxcb45R1lhjsRuco8xCjj9Dv7CpX1AfXv0N4m
	wjRFY1F+9W5Vc9weBUEdR1WX+qqSSNE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-dPxg8UXXPb--X2210oAp9A-1; Mon, 21 Sep 2026 18:55:45 -0400
X-MC-Unique: dPxg8UXXPb--X2210oAp9A-1
X-Mimecast-MFC-AGG-ID: dPxg8UXXPb--X2210oAp9A_1790031345
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4843e59c32dso2842372f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790031345; cv=none;
        d=google.com; s=arc-20260327;
        b=s7ywuAPls69JTFVYVaYBzqxbjUNDtFq4qlYWIMN3gK775G51wql1IM4jWzcTKfWQZ9
         hFdlZoWluo5w1dv7urBTisfzKNqNMltkguXfHEhej4kecAsVLhCSN7AiLfq2taLmxI3K
         W3TjpfX9/Ethn4TUpcZD6KmQhNlMnZdLbqsruhD2hs9/FKGSf/h1OiGgjLrgF0ZlAOsz
         1UHstM3EPfSCwB6lcZLJ26fkNe2dThpBq3ckGeBvtO6izNvSZyyzvU6LSZ9c2WQEKrfI
         vHlXzoxypibWfaVOolUgSQAYUcyzt7ccscRU+d8WXoUmd69dQBkBmKzIda/gly6f34JD
         inHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dX1swF85DcFrMT9o2ilhYKNWxIuRVz3Jd/fKWtp4O04=;
        fh=oglDtd8CDTBc9Nvt3XSRFkVDo7GMoKQ6CGmh2MyLSCE=;
        b=opWbWu7PxmY9S3z6DwwEXiauJizXAz3MhzqTo7Hj8gVhMbHXAah0VTtzdh8Yale7GL
         GKVCais4fV5ejk9bNV3HYPU3bnLdCa+4URPGBuZxhA5rC8ed291vPHdawitUpP4II/t7
         5dLoKwAuYQW8WIyoAXmxlt3p7JZnbWdcFFtE5HLhvw/a9FtkvG9y3NVDpdPfxIeDVffJ
         cQtaDmjKT5znx5TFLEqLQtjEn27UN18B15fZHUVadXjQ92UTc5eyqZYjGFTxm9HboHsx
         nZPQJFe5rbTxVKV0UMUQLRnS4vHXioCFl+VF18VF2PlHVNrtAHrl0aFoxu7YMJvc62Rh
         7L+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790031345; x=1790636145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dX1swF85DcFrMT9o2ilhYKNWxIuRVz3Jd/fKWtp4O04=;
        b=OJeJkqv7B7axYmEXWtiECQqeta71a/hgEZL6fY3puEiCAKcTtxsjavNmK66wOl56+w
         KGc7gjDzmcT0LflvobcCPHBwhzlRUq/cgyZeCckw87lCB/1rAEG0QQEf+KdIVl/RQK4o
         Aa8rpDCkIPOyqMn8oMVXV1etciKMHi9yznzmWgy+Fx+dWnHHR/WmVFJxPNX8E3z74Vwc
         E+L+ZuY6INGSgxvaXs0QJI9mQ9WVAlqNJSrxILxG2E6gJxe2MrQjX4Lr1Z6hmjPw/HQj
         0BgriAQ6Yb4cOIJZ0b6XYrIi5Keb2+kMuEj+Sne+5kKWasllk0XZ3Q2c1c739PGiJomW
         phcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790031345; x=1790636145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dX1swF85DcFrMT9o2ilhYKNWxIuRVz3Jd/fKWtp4O04=;
        b=P2yFoxmEQaHOv6iXT9NobMgDtJ2Rgn4aMESHMDys8DmMONjIgIK1y8c3ce61BXFuKU
         QddcGYK0iiOE0d9vqIckyd8LcQ49TJuv2Rs8mgK529wUpweZSAAlB1nK+D1o81YMzu6h
         Wm2eKnRyB3C5qsjgyZycSD8z1ExOphMd6LS9HFZCmL2/dorMkjP8dnX+8sbaO36QX/Iw
         jIWjI7ybxbMvHRWSeYWcmsj6LFU/Kut3x7eIEfP1oApzjc92GRMpF8/yR0tG9hvpZryd
         97Y64ytGzvHDcuQ1k9aokjPEfzipxd6gyUqIj19P5xmoeWwD8qDeDAVWxBPl+D1PJfzg
         XuXQ==
X-Gm-Message-State: AFuF++mvBzKDxoNC5/S2Id5knSqYg0aicqB3b5hUSYAObRh13gAQkiT6
	6RqmS/zhTyl8rrFI0ks5YV/TCjQ1OADeny6oLSzGCTL0lTUZE576kT+5bH3BUUf2ETRmdiuiBfs
	p9vNdreVvY3T8yOFw4TBgXnaFMHw/JDWVNFbU0wRS6T9unkavkgB9iTgHn6qo1kOb+w5IyirIyM
	x1QZlc35uxMq6khfyu+GFlRbe78mBrWBPuTlKSOpdt
X-Gm-Gg: AYBFou2iZrpK+cXRaRfzkAOYTvIJRINgRXFieBAuiwFmuO5Yho9zMz/qm5+6KBRe3hY
	Byy+DRxlwJwEZTAtjLPt0ElzX5czlMsyu+XTOO/Mth+jnLoE1w1vFtZie/jSrSN4/Ttyo1/tnKr
	QpM9v7u5m2xmb4BnPtFu6Okhslau2l5lK5au78AX4SQT+lwuklbFGw43aqdyhvO+UoWTfjc4VAJ
	FcVxpkFDAsCHWHvw+5rBLmwYVchpvGvniAdvBsbdodeCDEvsvTAzNAs8rsJJA==
X-Received: by 2002:a05:6000:4308:b0:487:c4c:b7fc with SMTP id ffacd0b85a97d-4871e211314mr20146999f8f.4.1790031344712;
        Mon, 21 Sep 2026 15:55:44 -0700 (PDT)
X-Received: by 2002:a05:6000:4308:b0:487:c4c:b7fc with SMTP id
 ffacd0b85a97d-4871e211314mr20146980f8f.4.1790031344377; Mon, 21 Sep 2026
 15:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918094322.152817-1-pbonzini@redhat.com> <arG1Nh2yuMQyAdhV@google.com>
In-Reply-To: <arG1Nh2yuMQyAdhV@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 22 Sep 2026 00:55:29 +0200
X-Gm-Features: AcwNN1VWqZQpaC_UL0aFGn2RScAhYhRmCJ5aAiPwS9zJLHLF3gP_gxg2pCi6hao
Message-ID: <CABgObfatLAp3AsPktQVtVq0MgeJV1Bw+54i5LKye5KzjVPqbyQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86/hyperv: do not overwrite hc->ingpa for slow
 SIGNAL_EVENT hypercall
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:52=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> > diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> > index 9f5adcd26cba..e3a8e8236230 100644
> > --- a/arch/x86/kvm/hyperv.c
> > +++ b/arch/x86/kvm/hyperv.c
> > @@ -2501,6 +2501,7 @@ static int kvm_hvcall_signal_event(struct kvm_vcp=
u *vcpu, struct kvm_hv_hcall *h
> >  {
> >       struct kvm_hv *hv =3D to_kvm_hv(vcpu->kvm);
> >       struct eventfd_ctx *eventfd;
> > +     u64 conn_id;
> >       int ret;
>
> This doesn't apply to any branch I can find, and there is some unnecessar=
y variable
> shadowing going on here as well.
>
> The actual change looks good, but the diff is wonky.

You're right, I probably generated this from the wrong branch (or
machine). The right patch is at
https://lore.kernel.org/kvm/20260918135030.171564-2-pbonzini@redhat.com/.

(BTW, I would like to talk about memory attributes and kvm-userfault
next Wednesday... and whether those are two different things at all).

Paolo


> >       ret =3D kvm_hv_hypercall_check_params(vcpu, hc);
> > @@ -2511,14 +2512,16 @@ static int kvm_hvcall_signal_event(struct kvm_v=
cpu *vcpu, struct kvm_hv_hcall *h
> >               int ret;
> >               gpa_t gpa =3D hc->ingpa;
> >
> > -             if ((gpa & (__alignof__(hc->ingpa) - 1)) ||
> > -                 offset_in_page(gpa) + sizeof(hc->ingpa) > PAGE_SIZE)
> > +             if ((gpa & (__alignof__(conn_id) - 1)) ||
> > +                 offset_in_page(gpa) + sizeof(conn_id) > PAGE_SIZE)
> >                       return HV_STATUS_INVALID_ALIGNMENT;
> >
> >               ret =3D kvm_vcpu_read_guest(vcpu, gpa,
> > -                                       &hc->ingpa, sizeof(hc->ingpa));
> > +                                       &conn_id, sizeof(conn_id));
> >               if (ret < 0)
> >                       return HV_STATUS_INVALID_ALIGNMENT;
> > +     } else {
> > +             conn_id =3D hc->ingpa;
> >       }
> >
> >       /*
> > @@ -2526,15 +2529,15 @@ static int kvm_hvcall_signal_event(struct kvm_v=
cpu *vcpu, struct kvm_hv_hcall *h
> >        * have no use for it, and in all known usecases it is zero, so j=
ust
> >        * report lookup failure if it isn't.
> >        */
> > -     if (hc->ingpa & 0xffff00000000ULL)
> > +     if (conn_id & 0xffff00000000ULL)
> >               return HV_STATUS_INVALID_PORT_ID;
> >       /* remaining bits are reserved-zero */
> > -     if (hc->ingpa & ~KVM_HYPERV_CONN_ID_MASK)
> > +     if (conn_id & ~KVM_HYPERV_CONN_ID_MASK)
> >               return HV_STATUS_INVALID_HYPERCALL_INPUT;
> >
> >       /* the eventfd is protected by vcpu->kvm->srcu, but conn_to_evt i=
sn't */
> >       rcu_read_lock();
> > -     eventfd =3D idr_find(&hv->conn_to_evt, hc->ingpa);
> > +     eventfd =3D idr_find(&hv->conn_to_evt, conn_id);
> >       rcu_read_unlock();
> >       if (!eventfd)
> >               return HV_STATUS_INVALID_PORT_ID;
> > --
> > 2.52.0
> >
>

