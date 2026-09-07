Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BEE4CC278
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786025; cv=pass; b=XwQNJrQnyV10BB+q8fnPg0ZKsi/ewPWavREkeLW2LNzIjRRWTme/jE1Fcsta+ZfJZWIMoeZxmOB4tmNI24rYOC0YCEsqN3UDcMqnh3+yfzU/ij2TMUs/iB48/1dyBMQ8ivpvXQoSmbXuuOahxTbuM6J4S2WKetOCQA0gqK9Kmy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786025; c=relaxed/simple;
	bh=b6+A2ISdRBcbpKO6oizpmyMUlOrzrgdkpNrksSx2FOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LFk1wARqPKRZxat6Qff74+t6y/crr0HwH98lIzdz5DPJyzHdtqdpVP6BC5g7L3jLr4nbdsrcB2hZDSZj5XFvOHBHq33lQ07ada7iVYzKoimJlYOxv1vOot0OY6q+K8fak+fCKB+4rDqtIkTkVpW+N5ubSZUQYWnrJxSBgmciK4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IE8cQ3Wh; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IE8cQ3Wh"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9103228ef53so40743536d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788786005; cv=none;
        d=google.com; s=arc-20260327;
        b=KRwNGjaYj/hXXjG5gQeL++DawWnTM1AWIXW+DgWECipR4a5SepsMjFeAx/X7VEHw/S
         0MIdmXViM5qqPX+vX3Uu5CxnAldG+rYlwkctIjS37EWuh8FtRFqwmILdlUDp+BFuYW0A
         5Udy11M4sf0ZWY+dePu14h7bPCXXmY42J5I0pyC1iS9WTCYDniugoGpDu9JK65e7j63G
         As/Ko6/x9vFuoUiJtS80bwtqf8oe2a5G2FNaXcq7M8XkzSgM7QtcMXjJP+jLvBHO8tEu
         OlQmDAmzK5FOa3ctCAAzJShrV5F0/RlZlvooFq7YBZ9Mbm98nKXqE8TNCyLQRTa2ddhv
         gkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q4unjDaUxoO7q3buXkbHxzmHr9BkKAP8ixwUMhw/vWE=;
        fh=AmRCRMp0Zk1JSCHgnL00tMvLiJV+MWGVoPZKQd0Hkkw=;
        b=KP94z8fOAcDyeHV0WgmVLc2HPJTIDElDqYhrkGcIPnagZoqwcUUI6bdodnlf0l6ETd
         GSOR/UTvgD2zNMDLkUQl62lCDXofxuCVcnUxBytvjwdZ7DbZVfqSnAlSoQfVimrmDhfK
         +B9lrPFZ9/31C79k/Tqg/dKkzFNbhog/MPQDFsTRNDK8Dq0MnMSlr9aXb4KzJ234wXo4
         KuFMYvEBHD8XcsoXCMDgokbq/kbpMlMijXvpyxjpye+LqbaJN5OU/jlH9vh0ESkn3Haj
         IjBKzZxgK6NRva2LN6BsyLPfbzqsyMM6/kEjYJWFWoA/lSS+lxBre/hDdS1PChiYAtc2
         2BqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786005; x=1789390805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4unjDaUxoO7q3buXkbHxzmHr9BkKAP8ixwUMhw/vWE=;
        b=IE8cQ3Wh6I4jvG9mRwAuxLSUEk6wpj5Nr2taGN0ClAke+QFYnRWPnGFcTVVp6CD94z
         F9QQnGkOB2KwXYjZzBcMAj6QoY1vpW30R6X5k34D0yw8TeGmg1ft0VQpIxMkjyRgFjct
         yAj/iPXGWl0xC/K1GVm1pMnbaOd7J4TcGnt1HDmNvbT81xmYbimb3zhoNNYn2T+5fzdJ
         s0hyujyF4H12hYVOrsFLYwc415VShi5HO7UzrI5dJlzQIrFri2QylL3IKzPYEMe9yZyO
         JXKQOOKGxAIZwTL529fw+4JzX9DDFEiL5FoJk+OaNHvcU8YDGSnYCswaayuRh4Z8jOih
         5GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786005; x=1789390805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4unjDaUxoO7q3buXkbHxzmHr9BkKAP8ixwUMhw/vWE=;
        b=jbknReD9FodkRHto6aCXXrI8DrNoKfemac+8EpkNxyidTmetSB1ER30TZt1YeZ1oB4
         rfr2aP+DTU/lttOtlkryxpgLyaKGAWACHJRnnVk5XdA5D1XFQyvl0X6rnVvh4ocQGSVZ
         blRmiw4TEk8Zph/8KLvURsFJmHy8s1ftEhaw4S9VFw3EW30Q/8gdr5ftYyF9+Zz+U9ix
         m1MAeq8/du8BBYQTBH95OxX+ymykQMSMIw3S8s8mwsCyG5J3ywsRPMPL5D3hbqvPqGcl
         ORcQRKgNRCtHus/SbpatgwG8bvYRHBsKBKPY5wkzCcYxfF58bpLHt4W73yvFI0KNpRsu
         5VYA==
X-Forwarded-Encrypted: i=1; AKwUvByfriF2GKXU1Jlg/kYslYAIIHwSSakp0Jv8J4vd+JPwosmUaSEASEWbM2gw6n2PN2UpjiWSCUGNeSSiVUY=@vger.kernel.org
X-Gm-Message-State: AFuF++n+r4hEkMF4FQvn/6KWDVicZpOr+szheIGDAXAE2q/W9bh3ZXkU
	FZrfIjlNgF4SFdJ4SYlugnMzSUtLd3oaQ7Y+hW2BGx3oI7OAlVphzWt2bSNNbe4qtocgTHnCh7+
	gPtcSsIvvFHyzR4A4dmFcmvGayoyuUOvpo+eUeKI=
X-Gm-Gg: AYBFou02VoD2BGkZBvokAqrBLJGi4RBvrpgShJ5rmjqF/x8F6ZXbfgo1uDWWXTx6QVh
	VF7kVKT9jI4wKGhBhYRGWTxZY/ArIZYXgOVm+ixdRUxvK7UBqvSmlhJt0WL517l9k+1JUkjVgoq
	ZEehybZP1+7pVuYKGFYu3yyiBao2aMJECtxORcZBdbQJwPDKDarft1fQq+oL7cKceQglq6Cwm61
	c7DGq7znYr6zQ8o2sLPwa66ZRQ42defrSUkE6Dp+ycVdzYJ/VJ22hXqLpYEVayWFmOCLLbyBI9a
	/NcVPLyi7MKCuTVwqNkwRn4Tr98kGZaiKErih+6W+H0Y7yDHxUr5fxbs1/K4weLbsXZ1gpId1D+
	S8GJdtjtLN0G+7c8YtrlmQZ7ue6U5+7CfRvMyQerdrRfBWxDx6HHAVV/t80w=
X-Received: by 2002:a05:6214:3c8c:b0:910:345b:4b2b with SMTP id
 6a1803df08f44-9103f0ef808mr315339946d6.35.1788786004992; Mon, 07 Sep 2026
 06:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com> <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
In-Reply-To: <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Mon, 7 Sep 2026 22:00:00 +0900
X-Gm-Features: AcwNN1WW1PJiM_eLvotCXs3cbjaonNS3NMC0jqRc7VUxmhkj_F2d7QQJjGBD2FU
Message-ID: <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

> Is it okay to add your Tested-by: tag?

Yes, please add:

Tested-by: Minseo Kim <neck3922@gmail.com>

Thank you for the time and care you have put into this fix. I have learned
a great deal while working through this issue with you.

Best regards,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 5=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 5:10, Al=
an Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Sep 04, 2026 at 11:00:23PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the updated patch.
> >
> > > If you trim your patch down to the parts that only target the AIO rac=
es,
> > > do you get anything significantly different from my version?
> >
> > I compared your current patch with my AIO-only version and found no
> > significant difference in the AIO cancellation state machine or IRQ-sta=
te
> > handling.
> >
> > Both versions snapshot epdata and ep alongside req before
> > usb_ep_dequeue(). In the directed cross-CPU test, a control based on yo=
ur
> > current patch but without the local snapshots of epdata and ep reproduc=
ed
> > the earlier ep_unlink_worker() UAF; I did not reproduce it with your
> > current patch.
> >
> > The only substantive implementation difference I found in the AIO-only
> > comparison was the criterion used alongside the req->actual check to
> > decide whether to queue copy work. My version used
> > iov_iter_count(&priv->to), whereas your current patch uses the explicit
> > is_read flag. I agree that is_read makes this decision more explicit an=
d
> > avoids requiring the reader to infer it from how priv->to is initialize=
d.
> >
> > With your current patch, native PREAD and one- and two-segment PREADV
> > copied their payloads correctly. PWRITE, PWRITEV, and zero-length PREAD
> > and PWRITE completed without invoking ep_user_copy_worker().
> >
> > I also reran the original null-ptr-deref and UAF reproducers, the exact
> > pre-queue cancellation matrix, and the reproducers for the earlier
> > candidate-patch regressions. I separately tested deferred giveback,
> > forced dequeue failure, and the earlier NULL-endpoint case. All of thes=
e
> > tests produced the expected results, and none of the corresponding
> > earlier failure signatures recurred.
> >
> > One small point in the ep_aio_cancel() comment: as I understand it, the
> > completion function pointer in struct kiocb is named ki_complete, which
> > is also the name I used in my previous message. I wondered whether
> > iocb->kio_complete() was intended to be iocb->ki_complete().
>
> Yes, that was simply a typo.  Thanks for spotting it.
>
> > Thank you again for updating the patch.
>
> You're welcome.  And now it's time to submit this patch.  Is it okay
> to add your Tested-by: tag?
>
> Alan Stern
