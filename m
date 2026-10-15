Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410A43B42CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102254; cv=pass; b=q+/+8ygL+9nn6tOdJOtoogQ5poSEZU9jhgNQXOHe2ws77HSHYMa0WDurmGg0gicHdUjU4Xm7BwdM5aIFcHkPLSh4YvX+sJgitRGQM+b+jg9Xyp8+taIrzvXbvBh8FEGpSSoj8FN+t6R+UfdOK9EBL9bZJcb+SxW7BdNFI6MA0Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102254; c=relaxed/simple;
	bh=HrOPWKV9uRiqcVmFgZretdSmBgeyb74MAmTnswv+yAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vwz8nBl6jeXp2vra1EPFfiwslmQpesxxvXaxMaVbNh0VsqPiHGNubELMd0F48a265ZOzKbvaO47Q98OXz4z86CwNG7INftfbtlF3SuUmLaluRXeVH8DbKAatINDLTncSS3pis2MCV3cwpJAw+xgU1fKFzpAOnR41HdwOnOxdLC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yx5dJdWg; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yx5dJdWg"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5337c7b9937so98411cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792102252; cv=none;
        d=google.com; s=arc-20260327;
        b=IOKt6mkYgAu5f97i3S9O7ru5umC2kDGFKRFuNf9lVdwd/K8NOL9DTGZU3YBgcUIsNs
         EzoE/2rpKr0U3s1ZX2WUijuZCuRLGzCC4oUB8CqW9HPX4VSNVddX+SlTH9z3p7HqvY8U
         TL2yBic5XcFhcLuvRvG4XuwKomhidr5iPe9mGMKeF/11QaaLFgoFlJHWoLBg6l4DcMZO
         G+IGiTndDMXe52uzuxuNjIeBtsjzBUyJaNzBCoDVa6J0DOxt2ZVKzicynsm1ONUlJcJL
         mYB/PMGuZolmZdiNqyrTtPbTm42JsE6B9bhXBt8vrv3Zg3BMGml4hR1P+GKqaOAH0Qq8
         HZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HrOPWKV9uRiqcVmFgZretdSmBgeyb74MAmTnswv+yAs=;
        fh=uF5A5OQS3Kx185gX3u7lrH9px1T3SqSLfr2+wkeeC84=;
        b=iuoHX2FIatKgD4z2gzX8pG+HJNdF0EsD10gcZykEG+qEKm8YBrzk6//dcENlNlnSld
         DDXI6qtQpwQiQes6saCA+snS0HnKhYFOl4ebXz37AI/5nb4CNFLNp8Xwyc8beUl+vd8z
         Dr/2Gx/n7De/W8wR0+gsm3WfuXw3Rloabrze8Hndg84nnuNNASbh5hgJbU+0RqEyCshP
         L9l6ZJQpppcR2DnrPAkL8dJ65Z6jA4XMf65/Kc5A4IdL+HIFLOOKigPFnCnumX9cqQPe
         wdKPPp7+XbFUr19aZ0qP50nmjBF+QbkdfrcZA5Rah+CPohz7/8CpA/KEyGMD2Qa1NiND
         9KTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792102252; x=1792707052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HrOPWKV9uRiqcVmFgZretdSmBgeyb74MAmTnswv+yAs=;
        b=Yx5dJdWg6GGbAiaUF1wuXAqfwP1RIS7hZUEF44jPJDjtSDMMO1KUX7jOqlvWlGZ727
         dbuyRXAizRzeepUh+w8T7jf1YX8is6THGCTcgR6K2ZN9nLawUghDx3pcGp9L1IhEwcjx
         m4P3YmDCOpA8ziaqQNooG7ifyRyAnSeP9FY+v6pK4/pD/bWGPt198S/5bxHG1gnMMstE
         psy1p8hCOK1/6jpSKM0znszmlw4+LbhVp6Nc3NXwklLgbPlhL+d687QujHBjbvM24BJ6
         pm3qbkqPgxRtNcnF26Wjshs5jY9WfZGMH+5z/KBbdowo7mKujKRD8ULxdOhcbUhxaeCD
         iHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102252; x=1792707052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrOPWKV9uRiqcVmFgZretdSmBgeyb74MAmTnswv+yAs=;
        b=YaTvgrXHciIqIYLRC4IjVn+p2B2ihdFi7enXvDmZ8zoqF7pfpoSjGjp1ThhyQv/7JL
         KU7QYeQQw/9oaTnPgnAyzIcA66rRyfUPiTXpHz7YDbBXRmmkLqCTvpbeYOLb/IKJyM4D
         WoYWuRFt7SPXVQomz4KkINFP3amgvKRKqdpP/DnT37deqACarNX0lcCCBJ1igv/4Y0sw
         4xgI+VI682N11uhnJbeJs6IbUhmza7i3UukcMEUBt2/eX0SSaIvEgs/8t0i/7+m/juko
         2ubOPkor9Ry8CPzcv8y+qI1256InluVxh56hAyVdo2YCv7e9cXJSa4mXdoSTpBwzLo3x
         kS8w==
X-Forwarded-Encrypted: i=1; AKwUvBz5tD9HJMEExklWSh2jLwfB2yoUi84gwOBwkxoaR82jc/HhqnsR9AfA3oCBNEUIh6Opyuux93GFkVzYiFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpu94nQ3M9JQK6z9ZtJzBg/sE1pFxfo3A2HEmrbZg9twAF40Vj
	011RHHl+tP/9MumZUUr1XQwJMo4x1eAHoc0yaW2GIjNo1uj/RGWfmiILGxvC9/Gb15R9cUm8ELK
	ErIWkxpXF59gA152MyqPNulFsuUc9H1WM1x8nIg6QwlVib7JP0Cu8hE8x
X-Gm-Gg: AYBFou0KciLbVe/8HFK0JhfgunvHkxc1Hgy/FxUwhu6NgnLZqT4WbhfpgPyidNk5iIn
	FbXMDZZZQgolXZ8wMmIJdVps1eUtzGOhyEV2dz+ESfrpWH3gN8kwWRUJ0+MOBaZI3xPyC8CV5Hd
	YvogEKz+5dHNPe0eLnqnwzq8Nvyp9/lr+Uh0Rm1Vqb9PeP91jMjDOEK990xfwwM840LX9Tnann6
	M+jURVoqqvdpXMTyH62VIFflqNYerioyBxW2wv5IR2uhUtlqahRNi38yJBAHOuvW+N5mkMn6G4b
	KkBRsAfusm7JAPMI3tCq+y4T4noJOhLtFtFVKE/XTEUKK/gVdOyUt8o=
X-Received: by 2002:ac8:5a0f:0:b0:532:9220:a9ae with SMTP id
 d75a77b69052e-53629ac8fcbmr4055361cf.6.1792102251473; Thu, 15 Oct 2026
 15:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-19-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-19-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 15:10:35 -0700
X-Gm-Features: AclHuK-0h5rHSnqyAiLfJHcCVzzx_T8eixjFxdrxOULNj_D687GEFjRgA8p0a3Q
Message-ID: <CALMp9eSeDzKxf===96Wv7enq9-tO0EZhJoXTYvcCgZxuBS1pRA@mail.gmail.com>
Subject: Re: [PATCH v3 18/27] KVM: nSVM: Split nested_svm_transition_tlb_flush()
 into entry/exit fns
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> The handling for the entry and exit TLB flushes will diverge
> significantly in the following changes. Instead of adding an 'is_vmenter'
> argument like nested_vmx_transition_tlb_flush(), just split the function
> into two variants for 'entry' and 'exit'.
>
> No functional change intended.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
