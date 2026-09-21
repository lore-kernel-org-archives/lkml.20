Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451941F5D9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032304; cv=none; b=i4pDEa9za0WbBR3ErrBBEx187ZJ03h7rnSlKhIrbxJKeMWC9Y+3b+F1cnMpI+zbIP0Cf3M+1zvUFMbwqt7uezSNkkaoWcgVPJVuEm/d27k6gET0aSErtI6kIK+vwNKsjZCQSMBS+WQQIN5GkyhwxgSMquEKYIT5nzPJpm0S1HDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032304; c=relaxed/simple;
	bh=soZNgkpbLPQjxM50cgoLxqORfklMlgfQRakZyHGqkvI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eGtm1tCW1AOb7bVQtAyNfYmYo1bea+KhoVgp1Kzd64vi8r9UkY+RbwJcPr6IPuyeQGK566hTR1p7fMQQpoqj409XONA3MD2fqqSYEWlGBF6GlgldEs/q8TMGxqChmQ3yxTDNw99cmbuUnz+dDAjhhhKd0H6uQm8LuR7ezgahZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MzAsaCp1; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MzAsaCp1"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9336581a2so60865975ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032302; x=1790637102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qwbr5XeU55Bs52f3BsImPLKA3IMnfsIYgDqReY17WJo=;
        b=MzAsaCp1juK/39fJWfB/YGvlzok8bLwl2WsGhl6N3ARV9aXMKtO6kgb2stNk8T28gp
         PzrrjYF9r9SgL6/g3piZZIC/pEyduNLN6St4gSiigRs1vkZOBS/OyoqYo+cIq/JSlzhQ
         Rt/sOJbq8aHtMItiXIFKfiu/31RWZ4dukrDvEqvI7JiMCyOQ1m4NlrgvMCroQ/GYFFeY
         k29rquV9Ref8Qp+gFCKeYMXD7Ba8YLkQOeTxqMLv3PfCk9mOqASFMopuTe2578kuqW6Z
         LSiD7/CMtKzjNuub6/F6g2Z8qQtPtAuPN97QbCSjmyCN0XrDM2cWujZo8IutepWUIBus
         G6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032302; x=1790637102;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwbr5XeU55Bs52f3BsImPLKA3IMnfsIYgDqReY17WJo=;
        b=M9z58tI5X3J3HgPa1iOC7QsmAlvv9WL/bT7wDwb8ame9HM0RNysAPr0JymM/H6icrk
         UpE0rDH8xgKG2pf1QeHsmid+nEnp6h5J0qheOVxvX398EK4cRO5Ryo4y+6pdrSYOxpzc
         R/ljkjRsjKRvLZw9fLPhEzjDzWaEnCccx7OxYPj/msxIAB/vqTs1h+NscU+L6UKfr5w6
         +Iq0ScUwpcIm4Z7elZ+BsjyiRdwkBpCso1J1Ts9yBp6vI3ZTnJMEOXSDaFFLQ4jLyqim
         wO3eT9qzEFQH4jy6HxMsMEeydpvy8a+wnVEcZDu8gHWqB45yC6fgUfhT38KGgP7AmGlg
         aW9Q==
X-Gm-Message-State: AFuF++mhnbk78PC8/KXaqPyXDDY2rP8s/KWesW2suILjKBRV06tJRppE
	dX/GSagcfHsp1jdA5QCMNpwPOQDdMzlfWzRdgjnZEyP4uBTFHt/XttLLwLvZZjQk4KWAVNe6DlI
	loxFs5g==
X-Received: from plmo6.prod.google.com ([2002:a17:903:18c6:b0:2df:3468:8a7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d984:b0:2df:3b09:664
 with SMTP id d9443c01a7336-2df3b0909cbmr79433785ad.32.1790032302259; Mon, 21
 Sep 2026 16:11:42 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:11:41 -0700
In-Reply-To: <CABgObfZTbj7cSUdGEcA2xgGkSgFqZ2NnNrHJ7+uYAHP3_9idqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918094322.152817-1-pbonzini@redhat.com> <arG1Nh2yuMQyAdhV@google.com>
 <CABgObfatLAp3AsPktQVtVq0MgeJV1Bw+54i5LKye5KzjVPqbyQ@mail.gmail.com>
 <arG3L3TL5_xCBtc9@google.com> <CABgObfZTbj7cSUdGEcA2xgGkSgFqZ2NnNrHJ7+uYAHP3_9idqg@mail.gmail.com>
Message-ID: <arG5raFJQO0hA-Uz@google.com>
Subject: Re: [PATCH] KVM: x86/hyperv: do not overwrite hc->ingpa for slow
 SIGNAL_EVENT hypercall
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

+James for real this time.

On Tue, Sep 22, 2026, Paolo Bonzini wrote:
> On Tue, Sep 22, 2026 at 1:01=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > +James
> >
> > On Tue, Sep 22, 2026, Paolo Bonzini wrote:
> > > (BTW, I would like to talk about memory attributes and kvm-userfault
> > > next Wednesday... and whether those are two different things at all).
> >
> > By "next" Wednesday, do you mean the 23rd or the 30th?  I want to make =
sure James
> > is pulled into the discussion as he know a lot more than I do with resp=
ect to
> > Google's use cases for KVM Userfault.
>=20
> Either is fine, of course 23rd is better if there are no other topics pla=
nned.

James, how are you feeling about an early morning PUCK in the near future?
