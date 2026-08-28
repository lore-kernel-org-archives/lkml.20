Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C170C3C0A0E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894817; cv=pass; b=kToofa9EJV/2sKSyQtDcwK6DjFDwSaNljUX6v/fSqpv0eyCZIMltJ8pV09kbVEJBgm9hZAGzypzklDfURvgdPdw7KD+fFoUA7Lf++yI+gKCbKT4bJU6Y/bXnQBi2tGYnlyA74JZKW2N2w0ux7JO0y4sjkS7qVrjfEgpzV3GTEh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894817; c=relaxed/simple;
	bh=/acu4QQwLSk/J23zJpKhduESFdBM59ssC+egexoj+94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MuSEHO4qbW5nde022aQp6dWddcX/L14JNJ6w1W31KjI28zJwX2WOjIm5kxRAsSZjn+ZHynBZMC5UeYK1theRqYUubeHVzjWtAVQbz6wQvgrtfwKFc8JfRWU2CZJP+vhZo45pCXC85gl+Pm60efBvnsFWIhYYKD31tElHcdHQi/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rknmj/oH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fKd6lfQN; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rknmj/oH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKd6lfQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787894814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZxwtLd9NQj1SCiju7H7ZTUiJe6NYWWpG0fv1lpkTxw=;
	b=Rknmj/oHQJDZzR/qp1gU3ztK06wHsKkcgNqgWCalFiqWze9EF9wO4cpoh6Rggy8nRA7Swh
	eLfWstJF3QHqU1s3dnJbfQfaZxPgVjSYSpqKP6gd6aUaXNUFVivnuw8dSyaJa+9ivw1byh
	JXUylOHWcMt2TxtPZ3n9vvIfPOs+kJ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-vOrfmIf1PTSPYsOUKr4jsg-1; Fri, 28 Aug 2026 01:26:50 -0400
X-MC-Unique: vOrfmIf1PTSPYsOUKr4jsg-1
X-Mimecast-MFC-AGG-ID: vOrfmIf1PTSPYsOUKr4jsg_1787894809
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-482e2541c30so269417f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894809; cv=none;
        d=google.com; s=arc-20260327;
        b=EN1TwZbMYqkfrt/WX+7Ms95EMkyz9naT5x+ERb2VEJFwbu41fokd69Q2hHHIrjw3mV
         r/Sxcbn275WbZFFEWRC/7JRwesx7j8kS+5I/U9bvP+Sgg4FFCPs/WBcCMUgShY6H/eDX
         hqs9Z0MjQZUXG8RtwEYn9Of3GSYbjL2R2NbdOgHWLmBEFClWxJdPXCGolqSz7IO6Uw4W
         13QfsTnbnW9OQmoB6wy/szRyqc3Co8Yv2n2gtOeRrPySeyK8TXuX/dOO+ptSlpGUV69g
         dDCZvTGHz7GyrjVwl0pMEE1PmVFa0XF2OB+/yqiT0pwnVgxXDJ0JCv984Y1We8s3/ZB3
         O1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xZxwtLd9NQj1SCiju7H7ZTUiJe6NYWWpG0fv1lpkTxw=;
        fh=DeNc2poLtGY+r2O+a8LDMgTdMrGMZTUx3z/mC2vFxhQ=;
        b=GKAwbSneKgunRrpbwKtFks0BAbJmJV+nEQguEmNLDv2xqSY/mE+2WbXmj9iW2vxk6I
         Oqh943W1k9CE1GDn0gvmam8mFWkNY/hinDlX163DGibzVqTf1kwxXqYc1wEM9J+Gipgg
         hZduXfQqBYpkwgJsgMWA+cQnFbWA0nA/eXixNNEYnntNLWmLQ7ycjewEThuyhyZAe94z
         s/jyJQKAS6f+qKNsDp2eyLvuyeNlWiDR1YTEWhPHKQZ4/48O3SeyOG5ERTAqEoMaBqeA
         wK01G9bycgncGQB3TpWd1vhbWbRPMdVKZ/pqK4/LbYbQH0XIgDbqOv7UqiYxWrY/GoB3
         bNtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787894809; x=1788499609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZxwtLd9NQj1SCiju7H7ZTUiJe6NYWWpG0fv1lpkTxw=;
        b=fKd6lfQNwLfIsZemsw8yUDy2YmCh98QASn/IU2YztahP/qFbl+iI6lwvG8/L7Lfhkg
         OWDCfB4Qa7b0y6U4ueizT75GSiQcAJIzofU1M+utnRmRkGUNr9IOBwCWFNZuiA2gaTDV
         lvvUNvvIdtxGwOnRzNheDUc/2l8SB8Sn/c2mwKlTUZ6vqoKDmn2TfkeLTbm9dVESt3ST
         42SmrXYlGYFJpNYxtZrnFSjTx49HYcySMnmF4ACcV9ezR4rNNQUgy2SQRkZpolZ9qOMB
         kF75Qk01WdaSBpzaHGvwpjZBmF9iyWNumT9Ak/CdbOetmJd/bPyq2v0hFd7sFIfOkHDB
         evuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894809; x=1788499609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZxwtLd9NQj1SCiju7H7ZTUiJe6NYWWpG0fv1lpkTxw=;
        b=gxqnPXRqn1ppDJd8S0qp4ZXpRmlDBxHh/5QxGzerc2ERfY/TQ9Y75uf05fBaO7DhVS
         3hw++8wHVsKmqADPaqZt2KecfLqZvaWxa7uhXvc3YUTP3Hac60N0QiAPvXjxAJLO+gme
         WbgwaqqGdxwgjFV87YRIvZl1geS53QbtIHx1vEozapM1r/nRq9SF9+nQkX7bubUahzHO
         q4QYoih1RI4/XePGI6F1jfoEPr+93LKyv5mZ/PHumZ4EjcCqNm45HUARVn4jtJfQci08
         HAlm8l6gXxBOLwNIr+vhEahdD11ZQIL7/JDyCI+JrEe+2Phop+xTzt+mfO+/IcVkugzt
         2NQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5gzCmGUSVwajPOLTbrp+yLb057xL6bas0YVOb0TZfic6wNB6nDkIikH5YHJY4oIPUSUBUQK5fiyBMFwo=@vger.kernel.org
X-Gm-Message-State: AFuF++kCN68HhpPaAiLdnPWQP4j6iJ9SdwPhfTPwRQZD6xBwV4eAI/DK
	JB3VcBSl6dpYO9FhL7FRN8JFMa4JQqJYWcRTYB4jlXRq1cM36lYz5f0aekDQAAmRenCMs8N/iLG
	0k3kZKS31kjz4muSqHC/V87W5TApKgnAm81w1ovgUuv3DIdDom4ZWiVnsrYLyx91wts8crGM63Z
	fSz6sbjyJt/s3eBCIAqwX9WAg3U/ScJmcUE1pMGFVT
X-Gm-Gg: AR+sD13qHW9yvATw2x/zE03rqJuBM3AUzjV6559e8AA1mueQNOWhytkD8Yir5wqOb+Q
	lUQRNpZIuq6vcS+pQA0Q87sZ8jqKvlW+dMKr9XYF9ItoeWavCOKVPHbKOh8DHyQTqVa3G+Ms5zI
	Q17Z4PIDpGFiPFKVVDFj1dM0rN6LCuBtVTmmSS7JETbm2RyOPNwPb/D9GdGa+ra2OeDd2HwuXHZ
	RRwkJfqHIaEB4MxbJAsWo6D5RVfsI7GEfrSmgj2KGJVbynSIq5vYroRfsEC
X-Received: by 2002:a05:6000:4711:b0:481:5a46:dbef with SMTP id ffacd0b85a97d-482eab6f628mr17265088f8f.5.1787894809487;
        Thu, 27 Aug 2026 22:26:49 -0700 (PDT)
X-Received: by 2002:a05:6000:4711:b0:481:5a46:dbef with SMTP id
 ffacd0b85a97d-482eab6f628mr17265030f8f.5.1787894809125; Thu, 27 Aug 2026
 22:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826211844.884951-1-seanjc@google.com> <20260826211844.884951-2-seanjc@google.com>
 <CAO9r8zMnPwXVf6wx_gDMzv4j47xWa7idLD+vVm9DUiB=huiLaw@mail.gmail.com>
 <apA9eLuaMxCLdCmn@google.com> <CAO9r8zNm1QcVh29rTCzAFnYdUCS4y8ZSQOvrs2DD18XASuktoQ@mail.gmail.com>
 <apB1A5Ln_lGTI4oy@google.com> <018f411b-9c7e-4baf-9d55-a153eab64dc4@redhat.com>
 <CAO9r8zPDvXCdD1oyBmvaXoC+T+ABx-iZ3b9XeNpqUrKqPMcMAw@mail.gmail.com>
In-Reply-To: <CAO9r8zPDvXCdD1oyBmvaXoC+T+ABx-iZ3b9XeNpqUrKqPMcMAw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 28 Aug 2026 07:26:33 +0200
X-Gm-Features: AcwNN1WX2e1gqOkMj0AU1lUBauR_ced3DSgFbY8aqWVtRY-Kk8j9u8fsxBCJ86w
Message-ID: <CABgObfZxmmRJW168aBXiGjDN9oRYQWyVjcdakQKV=Df5icGgsA@mail.gmail.com>
Subject: Re: [PATCH 1/4] KVM: nSVM: Reject KVM_SET_NESTED_STATE if L1 has
 EFER.LMA=1 && EFER.LME=0
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:01=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Thu, Aug 27, 2026 at 2:42=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.co=
m> wrote:> >> If the goal here is to keep the checks here consistent with
> > >> nested_svm_check_permissions(), aside from the new EFER check, then
> > >> maybe we should also check CPL here?
> > Perhaps, but nested_svm_check_permissions() is not reached with CPL=3D0
> > because the #GP overrides the interception (table 15-7, instruction
> > intercepts).  The same should be true about EFLAGS.VM=3D1.
>
> It is reachable in the odd cases where KVM intercepts #GP.

Oh right, it does not use the emulator (which would also perform the check)=
.

> But either way, I think having a CPL check in KVM_SET_NESTED_STATE is
> probably the right thing to do.

Yes, that makes sense.

Paolo

