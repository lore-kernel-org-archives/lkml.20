Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68491322C6D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109416; cv=pass; b=OYL3l8cbdyi3K6dT5x4p3ANS6gP+tznTJQkS5j6v+TO91d62M4lfu2s1058WRexBmwX7/iFnG6kBoP6rwH/TeJ/vUncNlBkiS4OalYnsRMU22fqz1W44hDt0xZwuOOkxfcwfWadRRmnAp4uFMwVbWmahNFxybvvYrNSHn1gQXQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109416; c=relaxed/simple;
	bh=LigzqXSS8DEfP3cmtfyLjdc0kKiyg4jtx9CgA6a2THg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/EfzsfpEAUja9Kkn2+Hm7Z84lqk+WVzaO/ZgJv2PmQf09qSa+uA3r1bjJ7MhaKHy2gicD4W9/+WQd7mkMySRLoZ/uQ4B9FmsFzfj1jMivdDcZnAWwR5l0lhbXhbBtLDASvOzRweC8CESWqLwhV/s8bL00vyBdOFlf/rhCzhzSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HimfdTHF; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HimfdTHF"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe5so37106866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109399; cv=none;
        d=google.com; s=arc-20260327;
        b=AkYb5Ey9bKMGRntcyfkfRacPMym4dVsYsTPcEYapXCpwE4lESNTHnhoJRpMqBuvkqE
         CjOcaGtWBT9nnpoNVyJb0+C32JQnVC6c0swal98uEG0TkIT45k6woEY6HKw34h5RAXPF
         JXHEfrlnnDpaa/yde3iHHhbvxBI82Nmsqa9aTSXKHFXMtecGm2BDWtwzyaG4FGw6rbpf
         MJ2sxSGKAvpxzzUtGeVJEDZpFSjztPARrJfqU8NU9vyPJSFyiQgk6cn26MuEYWUdUUck
         GZ6f1wLRsT4YkQT8wxmlsdDffHQQWrusKKfFTuxJghW8NvG4+sz9qJYiY0d/OLaToq/W
         clHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=62pZ9axW+4CPUrl4s+XApJ/lHsj3XXGYs6lv21lj9Ok=;
        fh=F1etYhviRqw2xJnw712pUeOQpnr+LACBU8UphXGpQoM=;
        b=HAbL43lFam4o+tgk0Yby0m+gqABxvW6UOmJ8Wnn5vfEYmcSbGQEa4xfeYGZUgRG+yQ
         VxAj/g6WKQPl9Fbw0k+mtaBF3CdaQuvh9MiE9YTDoRHX6cyvFnPtgvCFEVe08Ao8HABN
         KlI1jE/3wcuvzm1BAZRq5AYDcySAXjN6y1Pr4TSfIo9ooZWSfuAUYXtY6d20BwuNX51O
         bPPd6WPicwwvrP+CCLVJKLN6AnfofwMGfUX4g9ocvTUackYiMsgwgFvJf7xh49TpGIMG
         y3sPsOYKXqg8+VxX8fnSLI0nKw85Z8TE5g/DW5S3wzZ6rnwtBoiNTtV+hSGR3K1EENEe
         dUEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790109399; x=1790714199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62pZ9axW+4CPUrl4s+XApJ/lHsj3XXGYs6lv21lj9Ok=;
        b=HimfdTHFHhoLVbMtuj8wsQycCBtA9G6stT2IIfuOWJ6BD48Otdp2Kp4EjiofC3FUN7
         3PfwrZalqDE7cqdtdl0KJdpBx3GZRW+kFEYETESJrxgdAHzRkhrFJDgdrILJsv9OyHnx
         tPxcRg+9JLHGn0E7f1BokR2nNsTmlvg6EJN733Ie6MGb/9pXXjE45YBnOdTyFoNJWIMs
         cUt0VjbJ3A7XMD3mMQwhhVKRqb1rOMAjVQNA5NywOafxDONMVBjSRa9IuUfBd3Zm3g6j
         KJnlPYadJ15BjA4vYtRyPiZpBZlKy6xWeO1yM9EU4H2srbm8ZGXQk5+uJtu6yok7vfbh
         S8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109399; x=1790714199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62pZ9axW+4CPUrl4s+XApJ/lHsj3XXGYs6lv21lj9Ok=;
        b=I86CwpGChdUDgFA/XewTbeF8WjuAfj2G9SlsCOk2yy7AWlxFjgGtnQmMiSWCKD/SoZ
         TtFdUHLlNrCpHLHmPe4F/LBVoii6X8tiX6ceRD8XmqOzvKFttzJ07d2dLfkFKFH72SU4
         /ojalckWqCdXis/rg+BTiKIqAPYLYJKs3NCkP4a42mAm9pz1alNzcA8jWjFdeODd7uPo
         Q48ywq5j6UQisuLrlJggzpiA3nfbe+ukoXYGDbZq6DtPJoqfRHtnIeclKkKPKx8Kj69x
         fAO+SXyya2DsmQeywLEhmTUtni1E2+d4XQ1vYL+/F0xEXyOuS4GUcJu9J8GjJGz/Gmdi
         NawA==
X-Forwarded-Encrypted: i=1; AKwUvBzkRK8ck/k2vrAjm/EjKEJArJCwG7UFBehtyuChAHIXJjNHZ2jKbygG3NPCN9/4v9YssmkzATBygO9DPNE=@vger.kernel.org
X-Gm-Message-State: AFuF++mx/wWf4XI2WyV69PeK6824JufWuZWCaeN16M8fcPcXinfFDdvT
	h2XjjaGXbkHlaH0EVLVI3ivrM2jmQWJlA+9BUoVx3rrS3MBBF+SC/EFSOt3n2zlOywicVKcAjUv
	F4zAP2GCq714Vv0Ch8aY66Cit676Uhs9j/SuueTU5
X-Gm-Gg: AYBFou2HvjFInFeMHTzTqdeTO0uEyoXFDlHTncT2IVpGacevC+Mrs240obRY+rZcaR2
	uk6z6Gg8gHjO96mNYIapBrU9JAPx28YCXyDeOWEZyZkR0l6gXx+GWqtLtVYZ3d6pgJqbqz7ImFz
	cr5jNPiWnYkA+U6492TwSrLuV5tLM7D0w3MlopWOFS7HVsj4J7lhp6/P3GnWgk9Kk9V1/S0NPiJ
	gQkj7CNfNY2FGoT4+mq9KTomVzif6x3eyQp55r3CQIUfYkN3Im3+6FFdj7x95zYR4Htdk+YwIHC
	Boj2ZZ90RgNi3Jb6/475IYfsg4Kq8MlvgnwFR1XNxK6j9IcHNo8IVi7us9CaWVenk7QFVpIHPGR
	ngdIThkE0xxTEojBmltDOOzezLef/lGia6e/Uo8HIKKnVn3laqGWDjNcJPp8ZBgmkK9ja6cHj+z
	zCLu75xpC5ZozsltO8jEx4gi8=
X-Received: by 2002:a17:907:1c94:b0:c26:1691:b368 with SMTP id
 a640c23a62f3a-c2aae0e943cmr30868666b.33.1790109398702; Tue, 22 Sep 2026
 13:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918094322.152817-1-pbonzini@redhat.com> <arG1Nh2yuMQyAdhV@google.com>
 <CABgObfatLAp3AsPktQVtVq0MgeJV1Bw+54i5LKye5KzjVPqbyQ@mail.gmail.com>
 <arG3L3TL5_xCBtc9@google.com> <CABgObfZTbj7cSUdGEcA2xgGkSgFqZ2NnNrHJ7+uYAHP3_9idqg@mail.gmail.com>
 <arG5raFJQO0hA-Uz@google.com> <CADrL8HWS3SLqGfj0CrHhODscUq3fPdKd6Mg1M_53BFdFh4eLvw@mail.gmail.com>
 <59a45f81-8cb2-4794-a529-eab72a45b93a@redhat.com>
In-Reply-To: <59a45f81-8cb2-4794-a529-eab72a45b93a@redhat.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 22 Sep 2026 13:36:01 -0700
X-Gm-Features: AcwNN1XIUgz1BOv1EkxUY7hWgtF3ygs5uynW3bZLjeRdG1EKl46E4yC46HmqtcI
Message-ID: <CADrL8HWtafbiHA8ZL=DhMqT+GSBeajXew9QzBkVyPUyUJwiTZA@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86/hyperv: do not overwrite hc->ingpa for slow
 SIGNAL_EVENT hypercall
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:33=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On 9/22/26 01:23, James Houghton wrote:
> >> James, how are you feeling about an early morning PUCK in the near fut=
ure?
> > No problems here; the 23rd is fine. The only day I can't do in the
> > near-ish future is Oct 14. Thanks!
>
> Great.  To sum up what I would like to understand, this is it:
>
> 1) the overlap between memory protection attributes and kvm-userfault.
> It seems to me that they are almost the same, but I may be wrong.
>
> In particular, they are almost the same in that they are both
> stop-and-retry interfaces, unlike userfaultfd which hides the
> stop-and-retry behind a page fault and a stopped thread.

Hi Paolo,

They are very similar, yes. But I am unsure what the new memory
attribute work is motivated by (maybe I missed it? I don't see it in
the cover letters I checked).

KVM Userfault was motivated by post-copy live migration (for VMs with
guest_memfd memslots and as an optimization for userfaultfd-based
post-copy with conventional VMs). KVM Userfault's interface reflects
this; it uses a userspace-modifiable bitmap to track state, which has
predictable memory overhead and is fast to modify. If memory
attributes are meant to be used for post-copy as well, we'll want a
bitmap-based interface for userspace and for tracking in KVM.

Other than the interface, KVM Userfault was intentionally limited to
only EPT/NPT faults because it is always "safe" for those to return to
userspace with -EFAULT and the bad address. This means that
implementing post-copy completely requires *also* using userfaultfd
(or something else) for the other guest memory access cases. Memory
protection attributes include many of the other important
(guest-initiated) cases, so post-copy could maybe be implemented
without userfaultfd. Great!

I was assuming that these new checks would be (1) difficult to
maintain and (2) potentially cause issues with instruction emulation
(or any case where unwinding and replaying is challenging).

> 2) what strategy you have implemented, or you have in mind, to handle
> stop-and-retry for code that does many consecutive memory accesses.  The
> main one is nested vmentry/vmexit.  I have here some mostly untested
> code that splits them into prepare/commit/cancel phases, but I haven't
> dared posting it.

Ah exactly... :) This is why userfaultfd remained in the picture for a
complete post-copy implementation with KVM Userfault. From my
perspective, the only way around using userfaultfd is to add support
for nested vmentry/vmexit going back out to userspace and coming back
in, like the phases you have.

"KVM Demand Paging" in Google's downstream kernel has essentially the
same checks that you have in the memory attribute series. It uses a
netlink socket for the long flows (and waits for userspace to mark the
page as ready). Perhaps there's an argument that this would be better
than making the long flows support exiting to userspace? But I doubt
it.

> (Secondarily, we have a TDX-sized dependency between planes, memory
> attributes, VBS, and kvm-userfault.  That is probably something worth
> discussing too, sooner or later).

Yes I want to hear more, I'm not sure of all the context here. :)

Thanks!

James
