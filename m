Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB9B377AAE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072364; cv=pass; b=PMZ+9VwagGhBlMvWq/sSXkMUAb6rqcJWOZYCoZsXDopJTgFtyWp5/D8c0iNH7WKrlPmbjqyy+2leMbVhGbENFcmrkSOKdRaiPm0FV+ykxeQUh7tPS9KaiT+7+ooTJArgAPe+zEkKXNlnhTcxpeSSaNv8SgnhDKjuIKyGfiHtGes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072364; c=relaxed/simple;
	bh=TEweY9mF+kTWSc0jlLx0DqWiq1FtRWhs58OCpKywUiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bA16Az14a832lVGNOGXREndc8D2+ZlE+7APGV9bBo9XJTByrNviejmiKkNbBhah6IFSRlcgJwKoL3fTSbsXq/jiotm3x8XSyINSZP8RLpQisggF+5MvM5fptzDwPsA5ISAQboakFxilrOVr5XYWqvwA1CHrhhaZ7+NSh8P1qJwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=dLgdnKuQ; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="dLgdnKuQ"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9103228ef53so1372556d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789072361; cv=none;
        d=google.com; s=arc-20260327;
        b=ZNV5Fg22yQM4glPp2b/dWbYDcit00fr4FLXhJHBhxTHjnfnsU79dnyFrADUNZPl8wS
         3jnBcGw5hkmMwKuPLNLcLBNLX5EcvurQEYH+0y48FSh82TGt+SHW0uxLxCDllp8LkBnc
         bome0v7euJQdVPKWJnOBy9rdNqlkTp7ljcPdnmkkqyOXHjpCfxM8s6h0X+LgMIoHRuRS
         KtOxHvuhnOzcp6A3Q8nq7Wi1HwV0Icfk3sw6v0qeSCpTrIwqbK4nMcklf4vIuYYIcGku
         MtbOwlzedzy31IWf1a4zUIJWvFHVAuZKBn8jXx0j+fYveEnaUV08ev6gdgOu0lPtUFQ5
         O8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMs786uqXSKku72JuRf3CgcJHichpdADmzIa67sOeNo=;
        fh=IayHrPysSzmtZ58rIm5EeG8PLd+M9aAk2IrG9gj3q+8=;
        b=ifdhHCcYCze0TWuKS4RWkuLIaEE3Cek2WXbV8VVEk6jzfWsA25zhEDkHY8bFICLu+m
         PNlXUw6wRTgZ+85nZjx0Q/O1FAYvMNb3v6a2la5cjCyE+olcddy8Amy49lW4lpPmItUD
         8dxFhvdE6kzcGcTaOxe8M5Pc3gJbWOx7PtuTlHu0OeTgdOZCtzluqJVOFUvIy2pVMix4
         Ax/yVK2PKW6QqU3R6X7aT9eBF4ggIRTQlgc4r1XKf2D9g4489ZSx7m6k2UL1i5jgp1jI
         vq3w6+yORm5xWsUG3cTLdmxAOcs82agStuBWrzAF04P08TN3qFdW/xMhlzff/JjNNAO9
         +niw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789072361; x=1789677161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMs786uqXSKku72JuRf3CgcJHichpdADmzIa67sOeNo=;
        b=dLgdnKuQPArVr8AEo+EJQUyAX+YYfrqxWFZyxe1DcgfpyUnoNIA4yVpt91JxtWR3S0
         WNdqomMwJ9pN+m77ZFL/GBoWrmEGyGUqTvSPDc3g1L9zpsbcu3Eg4sWCeFlqxXmzgUaL
         /757gq81w0ZRMXlOmZr/4zEot031N7w4muno27NaBx9NOOy8aty/aGsIrRVFxfbOAM5q
         U4IImfFCPxQov1ABeRXF+ksa6IdVEOG8u0fCROuhoUCW6oC8ARlvTCO0nQC4n5CugwmU
         hBcwI9y7CgYz2b2VKzZaEuk/7Gwhc4VvinkXRSkg4EM8raQf5ZScdV0Hknshldgnys8e
         PUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072361; x=1789677161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMs786uqXSKku72JuRf3CgcJHichpdADmzIa67sOeNo=;
        b=eWtUNDlU1f1QEvTkSAUwMg+8fe19sBGBb8ES+AaqO5razQY+WgEOkWezEP2sxo7eGp
         MQF6g5n4zIhegn0kVvTAj9gFH8UK94sH6mJUya2Z2MwvNNlDD9NSPxjsbA/aBTkOyHrS
         4gvsRn9x45KEM0cNokxlh8WyP1Ak2kle+uJ28V+5QkLPZVJYi3o/iYHyG5lNQpjrHUp9
         9hU1QQ6L5CJgdUPpZMI+RAAe7BwsckRr0KCQkMDAx8L1gN4q/21S0Yq3gWMTchG2JDq3
         AFwBgUWPZAYzM+EV4bwLPT5E/e27uGc8DpFv8u6rTLHgdRKx54bhN8ShhzmKk7v+HS7u
         sssA==
X-Forwarded-Encrypted: i=1; AKwUvBzHIDj+zTCMRnURDFUJ3/PNVuWSV/oc4l/1bAg2UvWju//i6IEjMtMns0EFa49I1zE6OrwRo0cAPE64SnY=@vger.kernel.org
X-Gm-Message-State: AFuF++nTkoXisODXpk5f16HEGmE37HVjovlML/9NBHLoa8Gef6WXrKpg
	dwI5iD+tAxjwHKVqZAmzW7XUEtv1+GmvZ0CY5aGKud21iswXsAfwfFAqWRiEBzvB1aILX0tBiis
	ZyXXkDr4FEKV9/X+awCHgosWbGz6XDW8d9ldTpeImQRfaQqraLneVg+o=
X-Gm-Gg: AYBFou3GgHAoZqiT1pJstIizPmctyfAjcWJRqvvLx77UUPSH5+1WKs54mCkNkIFUAL8
	qkOnJLg5aPrgMMSg5rf3SEX59KpJLW0K0qkhR+M2FSCehulJoIvFxwa4E84JD1hYJP6jbCOmn+f
	R5HE/U8uztqcrfJDDEyvLr4cMMORZ7Abp5xhMyIM/loY8sMRDSG/o+u9o7+3BU3jrm3UDI/LG6O
	1dEvv8aX+Kk68LjVhVNao4WCipynVyE0cRx0Zg/0bnM3Nfrem/e3/EEPqZZXG/hb/DF9X6yRQO5
	Hpbpx/Ymb+8ImdPvBOZnWfibpFCtxJbP7z2uTbd8HvR6c/KJdM08O4k=
X-Received: by 2002:a05:622a:1cc6:b0:530:b2e4:91c4 with SMTP id
 d75a77b69052e-530c87cde3bmr17847751cf.61.1789072361124; Thu, 10 Sep 2026
 13:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com> <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
 <CAMof9cWdXR_040SDs2N=3ETvdmxvjx+OokfkSDr7DzVbLbuenQ@mail.gmail.com> <39448561-8877-4e20-98e6-fd85acc3d569@grimberg.me>
In-Reply-To: <39448561-8877-4e20-98e6-fd85acc3d569@grimberg.me>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Thu, 10 Sep 2026 13:32:05 -0700
X-Gm-Features: AcwNN1VVO80cI_G7IjWKmJQTZEGiEoTj8YfHr2StmC_4xE_l1DVdfhFj4qx9Qq4
Message-ID: <CAMof9cUv3EbdppfCSK++QO_-AgmqqpqO8AyajwUTjxt-mBQX0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and startup
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 3:30=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> wro=
te:
>
> >>>                qid, queue->io_cpu);
> >>> @@ -1846,7 +1856,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctr=
l *nctrl, int qid,
> >>>                queue->cmnd_capsule_len =3D sizeof(struct nvme_command=
) +
> >>>                                                NVME_TCP_ADMIN_CCSZ;
> >>>
> >>> -     ret =3D sock_create_kern(current->nsproxy->net_ns,
> >>> +     ret =3D sock_create_kern(&init_net,
> >> I don't think we can just change this...
> > Passing init_net explicitly does change behavior on the synchronous con=
nect
> > path. However, with queue allocation now moved into an async worker,
> > current->nsproxy->net_ns resolves to init_net in that context anyway, s=
o
> > the initial connect path already loses the caller's netns regardless of
> > which argument is passed.
> >
> > If the goal is to actually preserve the caller's netns through the full
> > ctrl lifecycle - initial connect, reconnect, and error recovery; it can
> > be pinned at ctrl creation like:
> >
> >      nvme_tcp_alloc_ctrl():
> >              to_tcp_ctrl(ctrl)->net =3D get_net(current->nsproxy->net_n=
s);
> >
> >      nvme_tcp_free_ctrl():
> >              put_net(to_tcp_ctrl(ctrl)->net);
> >
> >      nvme_tcp_alloc_queue():
> >              sock_create_kern(to_tcp_ctrl(ctrl)->net, ...);
> >
> > This captures the caller's netns while still in userspace context, then
> > carries it through all async paths =E2=80=94 so reconnect and error rec=
overy
> > also honor the original netns rather than falling back to the kworker's
> > init_net.
> >
> > Is this approach preferred?
>
> Yes I think so

Alright, sent the patch with the implementation in v3
