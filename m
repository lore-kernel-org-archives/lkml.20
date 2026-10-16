Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC7E3CA4AB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179177; cv=pass; b=HrhdrEi0rgeNiBXW5J5l0wPkRKeucaPG2COCIcSChDNoXoysDfgiLqqqZdHG5XveV1kbxGK7gUHRZmeIlvE0Yxg3tPVBVStMQx3+sXwFiE2c6qaTkJ7wL0wrcK2ed9c4ybnmTlqiDpQBwBDtdClSAJMtSwnExE7I75Tahqrw4fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179177; c=relaxed/simple;
	bh=MEjqqJ8STGAiw1ShutZb1MiaJfQSi8GqlcBV0l3Jhd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9qrQIl4lXsPs4sCWiaS3Rm15XmF1fAZ20F+EaPQkG593fKBF5/nHgbqy2RsTzIciOAij8eXwRuEYS4P9mO6CrshgSVysUNDZ5+t6ipnIyzBeDfLnkwGCOhVnTntdFzW8MBbhqtKbLkZ4hEsylLXN0CElNtJ0a6ciq1ccxQKr6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LQl5OsG9; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LQl5OsG9"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5337fa12431so591cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792179173; cv=none;
        d=google.com; s=arc-20260327;
        b=popeNk669eCMvlkuntiTutLnEeDdKkpkX/5/jdRxHXFQ5pyXVmTBi+xS4nS9NSSQbZ
         pNeRAqHGNN5+QCkiRSJEddk6qDlsp3z6Ie4pUZHTIVn5qIZEg5CkFMVlWjSZYHCbyCp0
         A9ZDlThJy3RUrRsZ5WcI7F11DfIv6g77acyCqjpPNmcGSXhLbtrvtBzpPxhK5UkfE2XV
         gzpa8+DEZAauUQ5SlucijicrhdRxsaI/Dwl/HP/OzlNwlGd04EzGyHkMPaQ06AZ06jOz
         13c4c0hdBV6BwIxRjNLOrYtClQJq55ehRLgdaAAr+XrWdqDy1cpgJ5CV4w8mHwi3Kgdd
         UIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MEjqqJ8STGAiw1ShutZb1MiaJfQSi8GqlcBV0l3Jhd8=;
        fh=6PW2RNny9qlSyYB29uAXWKompPa7j17zrZCEvBMWzg0=;
        b=aUwSUHsvsBhO0hOeJWbJy/sW7IKVh1IIt/NUKHiFslYUf3TUoMDKT0d6NWkG0lwOrI
         NMbCoD4coeB0YqsZTLZSc6Wh8VyzIzkDlJ9tw6IHQJxzWqA7fAp/1VFIGVv39o4E0ll6
         r7dSihNEzPNk0uUygrlIAkHGg+VwSMpqun8+Ok78anJzx0n1SqlbuhreoAbQw3RXK604
         DhvCgaV4BAzbcKJezJLUujo2icpKQyvfdNA8CoewOiwryzJ2m1gOzBKSTsLnBT1U1LF5
         nqIJFHVc/a5DAwlA7Bb6H9zh1gg5KA9Oiwt2hssgtwFFelAc/9S5Fo5XVhm/A9FFka0o
         +QFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792179173; x=1792783973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MEjqqJ8STGAiw1ShutZb1MiaJfQSi8GqlcBV0l3Jhd8=;
        b=LQl5OsG9PWIneV6xpRYFa1mAyNeLlWP0rTkUHj3//0xaDk8hz80SqYhbN5GjkVRqG6
         q4nhdJf4fHfhYmCCUIgcruTovBcWT0z0RQuzCWOQGlM3ko5GHfs5xqM9Cz6YbKOA/wY0
         EEDC3ilWd7X61FjmItfijY7g6K7/wJjZmZK0UTSK4qJucRt+hDSkpais/hLq0XSBm/8j
         W5m2d452aabY87kbMwygBbA/dUvx72BgiJbsviOS+BGNb6kCM+cVADUda9ecxznKyLtu
         j7EiNSltjk9SxxwvZP81IqnzrpXA0BIkwW/u3e1VAsKUMIBEwDYU2+ySE5vlu4c/Fwp+
         Ah0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179173; x=1792783973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEjqqJ8STGAiw1ShutZb1MiaJfQSi8GqlcBV0l3Jhd8=;
        b=wF0gUPMrOzmZi3yjBereAXQ5nZxBGuf4WPy6k5RrsQY01EYFTH5j5Lfl8Skz8/2wNd
         hAGnDC7T1ulcN1Z/wQQNQbRyG9H13x2oUmXN1ZQsJjqz1YGo9FjS80x5WK4ql4SL+WqC
         4U4vnkK5TvRdjEqpxTpVcPrV1A90rlVZHE1VEnhFtQHv4lktS2ZufN9D/vmqfVhB0w9h
         Bkn+CaPFwVnZh/R+yYfMHf48WSZdnp3QpbTbr7WEm2fAnEayZWbGifQpnMT4Bg+vDxK7
         8xmfWDVgZScpsLpL2jP1lh8Q6xkewOq3lhoJgc+1IJ2WFYyk3B4O1zR4GzSRAFlSjarr
         2e8A==
X-Forwarded-Encrypted: i=1; AKwUvBz/PpyWqnxD6jaLQuRX/EtElovynuwY9bCNMyIgye1yWtEsN7TDBDzMMrHOYuEkDAkWGkMDNYXdV1mbK2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkculrU2FGxk0keUk4ZuwVe843V+f5oTMYR/sZfqkiGZzl/2gu
	GCQ0kI48l2jfakG2bLgFM6TxxxhslEb7bzzhUjkvwG1hfBUxPtIaFzDxD/Mj645cRF4lex6T3Zv
	RAeFN+SpavZyePEuGfEWlxRdAADYKxPBTFF1RIu8U
X-Gm-Gg: AYBFou00O5nKu0CI2tk6rDC2qSRPmBtpbZx1NXs0c7fewGCrbjNe8GWFC4gRZFQLJEj
	1Xx0YnAQV7VIHKwTVSwPuakliy0ciFcdXikGGreDZ3gVAKFH7VXg25asAmMseC3qZFxUwWxQrHU
	1gyq9tbONUz1OZlRvYzK0vgHwLqyfC23Qp43QXriV2VBM5pXq6OT0ns+VXq+fJK+wFNj4CNo8X1
	nwSiHmCU/DXk8tC7q/w7x/WYJw8I8XnFSk9DI31udfPlSVlgU6r1J8WHini1Rhw5liLLb/gII5t
	CKzOY7o/qjYRkIdxe6b0vxe4vmB3APOdcio9g40DL65cD/AjhKFR8d0=
X-Received: by 2002:a05:622a:488d:b0:531:475:4ce6 with SMTP id
 d75a77b69052e-536463584e4mr2454001cf.9.1792179172628; Fri, 16 Oct 2026
 12:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-2-yosry@kernel.org>
 <CALMp9eSoidVrzHqTrq09LB1SCwsf5DuwAcys_q7o0TyrKM1Ciw@mail.gmail.com> <CAO9r8zNcG=5SQK5QBC8QT2QR7K5AJtAOp16atDc5DYc0shD1Tg@mail.gmail.com>
In-Reply-To: <CAO9r8zNcG=5SQK5QBC8QT2QR7K5AJtAOp16atDc5DYc0shD1Tg@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 16 Oct 2026 12:32:37 -0700
X-Gm-Features: AclHuK-ZQp-6TfXpSbf_CVQg-2-T-7CMHpUhbyrETIPAQMotQvMXWEMbF3I55Hw
Message-ID: <CALMp9eQCbU5onzrjnprFuP+AF01hpn27ioBs7Vtq1bOaWiFwvA@mail.gmail.com>
Subject: Re: [PATCH v3 01/27] KVM: nSVM: Flush the TLB after forcefully
 leaving nested
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 8:19=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Oct 14, 2026 at 8:02=E2=80=AFAM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > KVM flushes the TLB on nested VM-Enter and nested VM-Exit, but not wh=
en
> > > forcefully leaving nested. In this case, L2 TLB entries can leak into
> > > L1. Flush the TLB after forcefully exiting L2, similar to nested
> > > VM-Exits.
> > >
> > > Note that vmx_leave_nested() handles this correctly, as it reuses
> > > nested_vmx_vmexit(), which handles the necessary TLB flushes on an L2=
 ->
> > > L1 transition.
> >
> > Fixes: ???
>
> I figured it was too old to be meaningful (i.e. we'll backport to all
> active stable kernels anyway).
>
> But I think it should be:
>
> Fixes: c513f484c558 ("KVM: nSVM: leave guest mode when clearing EFER.SVME=
")

I concur.
