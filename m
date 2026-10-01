Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D63DE434
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790880367; cv=pass; b=IjbYXenrej1LSdYL+LjCEgbI8kEs1YGctyGqpvNJHyWzZlt01sYd/bGByLIeCWDm2MQdYQGIm1zlw6tspd+54pqK2JMDQosEnUJ5IdzzDnDVTI6d3ZD/ugGKGJ5avvSmPal2dM+rTKaGXdUvpWZci/ksNoSfQ1I67iiRrFSPMsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790880367; c=relaxed/simple;
	bh=KhZvNHR8S9wRTF9gNlwTsLNH8HmuAJIKnxHt9nq8CeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvncKRXUqidMNm6pQ2ZG+oPUG6CtUTEh6tRMxpRmZyQHP2vGpI4QQOypkZX7vWwd90CsdB5ihBclJ9V3OAxelcjf6xQGXWrmN0PmvFTAdC213y5Vr0tzHk4I5qoAQUf09YOQ0uXSe0lXwkj1GBqe91dvcVQ9zsql/YdjVCHpDj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PvKXSFIn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pJ+jsnIY; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PvKXSFIn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pJ+jsnIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790880359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eQS+1BIfTiW5d02m6eavAojtJlZVnOI1LyUgaSLiRac=;
	b=PvKXSFInHYV7347PyofpoN8ikAGFT/hYqqwFy/7JxF7jR1vAnKP8RHCidA9A/SKwY32PFT
	3v0FN0vxb+tCpbsiL8CsVXSzygbOOkHn8sTTWSwEw95jIRp3RQ5C+ikO8vfUpXoH5Ultwq
	57jOJFfn9XET8pTzQYg9/PXFLkPy9c4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-LUYal-v-PwOMjCqCX6hsyQ-1; Thu, 01 Oct 2026 14:45:58 -0400
X-MC-Unique: LUYal-v-PwOMjCqCX6hsyQ-1
X-Mimecast-MFC-AGG-ID: LUYal-v-PwOMjCqCX6hsyQ_1790880357
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a004b70f99so28486395e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790880357; cv=none;
        d=google.com; s=arc-20260327;
        b=rmhJ8BDl0by0pgPJOFom/n9WonYy36ZaXY0oXuuxPLMLvnTkIMgfZGvAYMQ0KG7c5B
         VTOSXzaIegsVBbTiS69WFzftsOG67Odq2R3dgDeUesGkh9vBrUuUQeg/z94MF7ilSa7L
         iKWPfgU7kQXUZeuxrHHfmZpCwUH1vMDbT53ytyqqmb/KWvi/IxcRfuDygVYjMyLmfzfy
         +t8hcTbJP85Yuygu7IJLZWkei/EWQWG140aG86FsP29BHm66QxOXKFpW7af9g24X8JMa
         iNhCidrI8Tn1h5plO2tgJaGmLGzUK+rKY+CsdOw+rqr7VZhpYtWV9z88M0IrfqVU4yju
         fGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eQS+1BIfTiW5d02m6eavAojtJlZVnOI1LyUgaSLiRac=;
        fh=dzQyeHVti9Io0jc8JiJeApOhEsWD5ixeNaxY7D4MK8E=;
        b=CZOLlMWIWD2oGv10ILbGdddpLI0h0iGqmqUM4arwmmlbXOsFXM3Bckj7ch8NYma89n
         +tK+ayXrEvW/eX4xZJvehJur/10mUjfs09ENzW+tOhIQPqW/cvek02kNrSyOpntV1bSp
         F49kz6zm3Jo3ur39RJo8CPrtkawy0tHS5pMmt3tzf8fONiAlrIY81t67ngY84lXM5NbN
         Z7lPPTyj9nw8gobYrg9iscPCl5ncDRtayRZrjx49LzEPp8M6HnK2s5BBe4dOUVmeJpy9
         r4kTpyk30O9v0xbOdZRiwNj7cb05uwICwhXWTarWrp1EyxSFjhhm1ZlKP0ZlwjalzYPO
         qznw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790880357; x=1791485157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQS+1BIfTiW5d02m6eavAojtJlZVnOI1LyUgaSLiRac=;
        b=pJ+jsnIY+TZ6aqmpRvyx/aHB79qi7QkM9z/X5dYH7Sn3iMjt26ei+RVh0ycIvlAlAe
         eyctHuHAbabQ7EBlx7HJ+YcCkFyZ4QNaXvDYf2sBTX3F1yy78+zTrzarvVF1OBKJn0Wa
         W6vem1jlV6kXAup8bkPodM12jaHgoYCEvSKdPQHgaoNHg6UBNv4/DF+JJHwTHyqReQp5
         zmFaHJPDvUKFf0jrSWq9FYORhsqds2K4s+FEFrCJhJnOwdD+LQY8ERRAbZeAfyt41GMa
         GD84muKIvtvhnbrRCnAZEC9DNCZnYWiLL/HDdcObYNn2xc0FIjM39s02jb3VRZNy6mZx
         Hdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790880357; x=1791485157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQS+1BIfTiW5d02m6eavAojtJlZVnOI1LyUgaSLiRac=;
        b=jnTMN8z/4l3/y+op2pP4H6BAKo1q7AMy+Hzw0lxWuPuQdWKajhTn6myqmln3mpusCF
         LInG7l4R6ovRwDVk5Z+76bslB/xPLewFJR5/rM5EPSwt6OPbpO2dBcXpaxIZf6CyOC2+
         hDZCTf6cnq17giQibV9AQdSsjd5Qcl14ltef6nqoawDTqpyJStXUIbg++VaPinVeyNOC
         bMyRCnCnhqib5q5dM1ZfLrnK8aaFipr9f8godr4jBnNu6+r8KJz9MCCeZS0kLcMaIj/H
         99QZAIo1o5zEyI13uB0Zr6PU8o/XSMA8loyoPOZCgDmEsLBje302RXbmk4VZRECF+POV
         fumQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsi1ZAB4SxiEnAiq2VFveLKFsp2oZjDVMOQWs0NLNuxWzgzq8KQsqsjvszIoZu+dqltkYFLU3m7q/BpqI=@vger.kernel.org
X-Gm-Message-State: AFuF++kDE515daNYuVnvNv6qvsbEWWqynQEQMOkL1BLulID3V1vSiUUs
	3Lk5YWtnXcvNqDy8TdKFtJO9DxAL4fEMyOkeaKCOML9eLi+9YDgWUWLrOyvB4uTPBd1nYmJPNZe
	yxRpTywtw2an3jSzQ9NYGZnAriWlVo/z4L98cF/0QlU2eLw2O0ROgkcFUUSmjaJbIKmqM4NmO4w
	+9yA+vWqxpTE0z1GnMF2UifgCZxW28bQm9lPFofGZa
X-Gm-Gg: AYBFou1Xh3WNVRBc/xHRiry9XQatCLpqjlWG877UBghY480DmIWBGQzsfrjBsxYtAMF
	QbpMC5hCQGlznd16JYWPz22FUc2IwIIWDEy6qw/rbQIdKISIQVkf3qdzWl2831XWPgGd5RGzo7r
	DR7cwGqI8HZ2YQ7FmARlgaFSv85CCn9RGZfOIEBk9rRQQFMb4iHI2AdCbH
X-Received: by 2002:a05:600d:640e:20b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-4a0276afcf0mr6697315e9.28.1790880356960;
        Thu, 01 Oct 2026 11:45:56 -0700 (PDT)
X-Received: by 2002:a05:600d:640e:20b0:49f:ce78:356b with SMTP id
 5b1f17b1804b1-4a0276afcf0mr6697035e9.28.1790880356511; Thu, 01 Oct 2026
 11:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917064657.3260776-1-yiyang13@huawei.com>
In-Reply-To: <20260917064657.3260776-1-yiyang13@huawei.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Oct 2026 14:45:45 -0400
X-Gm-Features: AclHuK_7D6uTkoayAykfK_vPNPEK1XpKKIMWior1hkRrRZG49z-vx0HY0e22dFA
Message-ID: <CAK-6q+h4GX5tR2Nmk81E+kVnHAmRN-GoEzdZo88hsw742jbw2A@mail.gmail.com>
Subject: Re: [PATCH] fs/dlm: fix NULL pointer dereference in __queue_work()
To: Yi Yang <yiyang13@huawei.com>
Cc: teigland@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 17, 2026 at 3:21=E2=80=AFAM Yi Yang <yiyang13@huawei.com> wrote=
:
>
> The rawmsg debugfs file lives as long as its configfs comm entry and
> is independent of the lockspace lifetime, but sending requires the
> lowcomms io_workqueue, which only exists between the creation of the
> first lockspace and the release of the last one (or a lowcomms start
> failure); work_stop() then destroys the workqueues and resets their
> pointers to NULL. Writing rawmsg while lowcomms is not running
> therefore ends up in queue_work() with a NULL io_workqueue:
>
>   BUG: KASAN: null-ptr-deref in __queue_work+0x27/0xf0
>   Read of size 4 at addr 0000000000000100 by task syz.4.3355/21899
>
> Regular sends racing with the last lockspace release have the same
> problem, as work_stop() never waits for senders that hold
> connections_srcu from dlm_lowcomms_new_msg() until their queue_work()
> call.
>

if there is a dlm_lowcomms_new_msg() running when there are no
lockspaces being around this alone is already a problem if this is
really the case.

> Track the workqueues with a workqueues_up flag that senders check
> inside their connections_srcu read-side critical section, and make
> work_stop() clear the flag and call synchronize_srcu() before
> destroying the workqueues. This gates all send entry points
> (including the socket error retransmission path), while the socket
> callback work queueing helpers check the flag as a defence in depth;
> the flag is published with release and read with acquire semantics.
> The rawmsg write now fails with -ENOTCONN.
>

It makes sense that rawmsg fails when lowcomms isn't running.

- Alex

