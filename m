Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591858;
	b=lduVrlXiQjQA7PYEy22q7oVMYJEQYbUNRUtiPiFrnKVCB3sAk2Iwrul9iWzQAxN+2P+G
	 WXEgFR0nCth2ksFOxXPPXfZ6/YFu20wGUM8G89NlwE8k1szlfkV68dOOujD/umE5Dna5d
	 HfUTomXTndhK3kFBhhCrTHzvYAJ/hq9UMoA28wHTPuY3fYTTxf10NO5+Om/p10A8FW63l
	 HbAAuiI1YSmyaL/ZjU0AXl9V/6OOTk9ciqhtTW8KWk/QLGbzoE0yg/rBfSmEYxvE8SG5f
	 VPvCyTPrFsWjTneuRGn1dCgSt+sUhQUEclZ+O5NX+B7vr3HNpCCgeAnTiKBvGXnBRSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SIB9b1uyCmmfDdvCfE7RWQ/VLis5GMfKngv4oEqkmjU=;
	b=IC30ITic+0tpYORAzBK7TBN1lXo/rMD9T8zDVlDNXZ4ZLCEx3TBTPuTdDz4JapZ9A6dj
	 fw4bygR/GoeNXadh9dw5NAQePMzrr3Xmp+hsLabEE/A65gQwyqOtPoLX9tvR57PHQbXCH
	 iCCCqnSObAgv6c1lzFdhJ16mWLUI1Pii4bQfHDicCJpng4RFrTZCFBmcQpkGmAbSolpet
	 xT4Qc/BaPsr2QORsw+qu4Tk0jmNU6s/IHK6SCZfbH5tm0Zwzoi/VchoXjpEDagFPOgnOk
	 X+tnF53l3GkJYobfd3UQQqXpKiENEDsLBzefv0fGHgZmLqU6tDMclCB/by2tbnU2PRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q2CzksVr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B788606BD07
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B788606BD07
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q2CzksVr
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso18349a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591856; cv=none;
        d=google.com; s=arc-20260327;
        b=ZavEJtuM/IRo9NfI0Q/706tkaDYhLy1zqrNcHLKqzFmVcvIC69jFcxUBEYr1QFs9a/
         dEq9UWULPtExStNYLXk/On43qw63BPWrojZP+iP2vB2NDCk71XbOR6ua+x2kfJ/PAPKK
         HNL8gC6KuT4Ei/NqVddYFRXXxq3bLvnxIj1afXQwlExBouPiUDuKxIYX8gTCC3qpTeuV
         PXBpT0tBV9qdOM0cY/kPedrB/SK/fMYqSh74+gxtGwU67khbpb0GPTTDnQzrHjGAMAzT
         qETLijqFpLt+IP/PBVJ240Yeejhatn+l3CQBCJhwcgSg1c4At00s3a0V0DKBEi5hn5q0
         LEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SIB9b1uyCmmfDdvCfE7RWQ/VLis5GMfKngv4oEqkmjU=;
        fh=DxbDGXU0lBA0rAsVfFG5rWiMhKdRxRXHMhaOAvMQf+o=;
        b=FmKOvynnhIvMoscOakl9QX3Qnw3cj3uG6IgYZWavmkX7fddFk5/HHrJt2YZCYXrT9o
         AW2goaLI+RLJ33ZN+1sQulLIe8D+D+dqHYUvUhSgFvyBDVr/9arYicjV4p8us//QxrS7
         6EXitQlEw2h0gR2X9DK3JZG4kDp9IbrtwgDB1xC0vD5tawToIgqmuoAqJoMj+OVl7A3Q
         SLB7a8IWAco0yol6LV2BrF+j2x2tq2Wr86xzNXhwhNo31nYSwPH7BNiIlwbPX+UGRUmj
         NE7i03rv4Le27ybrLha33S5x1QyB75Nh+KtjWSYu2nT4w+P9s6BCGSoBRd80jJb8b7Xb
         IcUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794591856; x=1795196656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIB9b1uyCmmfDdvCfE7RWQ/VLis5GMfKngv4oEqkmjU=;
        b=Q2CzksVryst1RGFu/7KmGgI6t+qEnVybucMThmJNiHCyzPRECh/XnYsZzFKlMrFtW5
         4Itfc1KqI5MiVE/x7uPcUIqeyYFFO1ay8JsyOsLfWPbOGjiGcHYUeBI/WSqzkdlR9iEL
         bvUD53FTPxf3a395jwQ0Y6W0lnVe8BfcV14xJu8ugM6/Lk1FYx9Iez4+UoiDrLeO6OfI
         STMfSIXOlg935C/asP+dEVcur8S9LIAm4/bk8wa6IErqT0HMyrGQWKtIpt+k7Dw2W5Ui
         cStaQ4MM2NjkqreZhSSR3Gw3dDg4+pdqLEdUZtZbyNVvz/nInFMvVLQT/R5hrzgN3Ygp
         mbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591856; x=1795196656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIB9b1uyCmmfDdvCfE7RWQ/VLis5GMfKngv4oEqkmjU=;
        b=z5c6SVQlG0AKhAhS0tWWM0nFWuYvAOCKaKQ++AYzc3zTbw33HLBBrNuvrdzq7ghJ2m
         9eqzw2g9RI7+TnX0wDee3Xvlr8kGPqviCPLNpXqC/OOxmJYJO20gA2CHfMjtdZNgA9Vw
         cMPwsRtwo68ERLSKvmTK5Nz/fA7Itm7uXEoP82KeBg7lZpEguj7ZX99qoE7/WsM75o2P
         Jdrskr1wE+vwcq2NLYfLQ3Sq3NHcSC9M1AjuIK1L54B3wqZEEV8nLlOVVn6FtCx0Egll
         yucwS3HhCCjHyuev86dEp1bFqywRIZDa3mNOoHVBubq2u3AiDUKIhPQAyjIYI+bRp5BL
         NPxQ==
X-Forwarded-Encrypted: i=1; AL+hErFxMMKrDdEr9Cg84qxuD7JhPAEEKdIPkoC70IxTvKIJeBWDl9OmPaQqlgwKxh5vnlBwxSXAVIK32jOwS2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ANhfPa53LI2D3xUHGYhJZKO4Iu7MxnHiW4AVMkEEUoE0Yx7Xr
	s0SJeiAHddjK5hVSWaVX62/edalxwhuhKpRfW0HkBMAR+YsTlNJ+PNjKh/aCkelDsluz9fL5X1w
	xGGKaUkLVGweR/0S/Myiib0By17eiAz5G3nRKXv/T
X-Gm-Gg: AYBFou0it2YrHUxwz14O8NLoOUc5SGJ9DnFfl0hp5s6PWGtGwC5fe9jH8a+t2VEmk7+
	OrjRxRRbezQXeUYQf1mo5hBAgyrGk9GqYKU55kQQTSJZptfnDDMpyvTkuSPPToPpCH5fJVFOWJt
	c48RY8QMCFzNTGkA+xIq3sjtXdtB8owc9bxZKNSugMAX1wDxw/n0fLUj2OzC58YIg47pU9wbCXJ
	DfUnY08AP2FLNoiJ82WIwGdP9zDKQsNAtVksJZpVyA/3MlW2desP95n1YTAbQ1FpcwDimSYX1QO
	xUpwIqHsMlFMtB/kY1Yjz5bCnHI+a7lIZ5kIjImfaRI4bbuDM7i94FG7QKv1AOnCKOwLXVBbN6d
	i5LzGV0VcW8zOf8tjDO0Zw2T7CBF+qirYCUZ6sF0DUfkaw+Ox0yYIdw1RsrbjRaLYX6j5snth
X-Received: by 2002:a05:6402:1650:b0:6b7:7598:67f9 with SMTP id
 4fb4d7f45d1cf-6b7c82ccaa0mr89134a12.8.1794591855386; Fri, 13 Nov 2026
 09:44:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113170405.473841-1-seanjc@google.com>
In-Reply-To: <20261113170405.473841-1-seanjc@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 13 Nov 2026 09:44:02 -0800
X-Gm-Features: AclHuK__kUivciCr_b01NNPoODBlYUhIIdmNR_P1wSgEUvlhvY_vvZCLot-6Q5w
Message-ID: <CALMp9eT5S4N8PEA=F_j3vp35=QwNjzbF1LVsQwAir6=e59tw=A@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Leave nested if loading CR3 fails at the end
 of KVM_SET_NESTED_STATE
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 9:34=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Force the vCPU out of L2 if loading CR3 load at the end of setting nested
> state fails, otherwise KVM will leave the vCPU in a half-baked state, e.g=
.
> with L1's page walker, and if nested NPT is disabled, L1's PGD as well.
>
> Fixes: e1779c2714c3 ("KVM: x86: nSVM: fix potential NULL derefernce on ne=
sted migration")
> Cc: stable@vger.kernel.org
> Reported-by: Stefan Teodorescu <fane@google.com>
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-210535@kernel.org
> Closes: https://lore.kernel.org/all/sashiko-outbox-205939@kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
