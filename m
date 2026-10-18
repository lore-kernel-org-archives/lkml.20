Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5CA3B42FE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321144; cv=pass; b=aOS85OkDJVZWztoR33H40c6/4FJEcqz7Ar7zcRbKu1gQKeHFIk9PYyq2LDbUB4TCv1qxq53t8IMjgKhzLbIWPHEWN0oq1suUh0JnhYe6QaIe1HM9x441MbkJeobl8ka4Dw8ubNrwsUh6nmxc6D8FgfvflHtbjdbr0/l6AYUG9IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321144; c=relaxed/simple;
	bh=kH379+03vqq9VgNoMgF4X+CQYZbnfJhixopqpO0bJ7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKYk+WichQF/EynVdb659dx8GSRCbTlyVxGTvz2N69EKpns+UbK+WeL7NmG4bI4WD3MXgY0ECnIUQUSKosOtQf///tLmTIxRwxyR9tB+/g0nJKY9aJ5pRllO8QGy9RMAZ5xvHwohN8SollkT8+tdwI8tOdL13OSGpMztIJU20qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2NI4BJJ; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2NI4BJJ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0f59a5fdeso6441077b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792321142; cv=none;
        d=google.com; s=arc-20260327;
        b=Pj4pyzh0L3zqkgg6q6nrFr4UWQa7tIaEOj2GGveoVrNWyHLHd1wFhVNzJVqsYtV6ie
         yvkVM1IAMVDnCJ9N3Lu9Bv9AuuX2XxpXEK7Uafzhz93ByS84zZIggoO1NUIHUjxducv8
         vUcL04fIDlNS3G5wc4XUe/kBnHRosZkVNj0WQ/b8mgkYimHVvUcRX8EWdcBn2wKXX2AZ
         lO9XyCW2aZ9PUohiEk6TEe/7bBlNdwM9qN+OlD580Z1qvHXwihN6hQCP6TRS8mWZ1a8d
         QDlC5CeUYbljMPj3YtEOS8bIZs6m+W2N1QLoLBQAsVp/T+wQI6UERxZSXjWHM9XMRNji
         m1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kH379+03vqq9VgNoMgF4X+CQYZbnfJhixopqpO0bJ7A=;
        fh=Y9jjU3tz1ULUqhqh+rqZc+CBSIiA+LOFrFGxgH7KraE=;
        b=kPLqKzoPYH8HhXrvMTRIrO8mE3hHsmWVDDylOyGD1rDsuSS1sLRpsNSaAKbPSFrwf0
         DCYg+V3W5MvQUQkKqUrSX1mJS/25pR3pQ6avu+0YBED1HVKxkWn8XnVVDUaGNVmvppLq
         p0BOfhwVE9kLRVz6jnvvLD2NwN0BqkDaP1ahjubfarvnTvD8qKoF8buEJxIhMDTeByhr
         DLVQKnN2ZGos3y6HQV+K49tFUlSUS65MLsYcxy1WyuUc5uYv3I4DLVvxBX9KoGmWcW9l
         LWUAbKMLgRJZRAZgKqE77AcHR0v97WlGlmuQzNcMXq/uba9G2xYOepvaE9MURLvowkbx
         S4pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321142; x=1792925942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kH379+03vqq9VgNoMgF4X+CQYZbnfJhixopqpO0bJ7A=;
        b=U2NI4BJJ51mU25KLT8gG5+jEUCYuddntwUkcp6t94Fpw53GvTasaS57I7hf4uzxzZz
         ELskm3q31qAnl7SldlfYQm+kxw/+g92vtygoYJWVDzeVV+Te8PfsCw/Y2/YOprdq67tp
         BPr4DvNs0KVdJMwr8DA561AN6KKCtH+B75gj/uae6OviFEDb0M2M7nJoitogdy9ANtzd
         7HoUtnNKhBvY/JLV2+/3obHdkL7SedimdSa8fPPxkzpqt58WGjLN/f8jmrzXcxpJMZ+M
         PN/BQEFmb0wj914MisJhg1iBQW9HdLrq/dBEkC8RiiKERyEGTotbMnb7TC95b1K0Pv5i
         bSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321142; x=1792925942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kH379+03vqq9VgNoMgF4X+CQYZbnfJhixopqpO0bJ7A=;
        b=lSNm4swCkDFKJ9SWptwtAsptRuldQ+dQXrXfJiHXjkw/zkZH0pYd8cDDYCQAJQB/L3
         sFWFxZ34MITHi7ow/et0iMaYxTwSfyLvVsnv0R1Simqcvtavh7Dk+AChWxpQ1LYnVA2u
         +BET0k+d9s5S85X7/JIm5ASLJiscPCodPTf/uMY8l9PFfgySRhd8aVdSaXlHuIijDLbX
         DjoiBSCoPBL2Bwn2GSkvE71OiGn6FiJ5PELqz4fBZWUc2MhB9UWcEJVXXua0VpMf2Ect
         silODgQeoY+llTBumsmh8GznWGL3K4qZeZ3RHDRpmwRbYJlwnXEdgueivwDmxb5mmVQE
         us3A==
X-Forwarded-Encrypted: i=1; AKwUvBwDH/JOsSOrCPRNkdIQIMvLmJUs14Ud+t6wiQs32BrNled7B0VluqLslMleMIqvEtnm6GKSSMdWndoxkns=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm80N7nhUTKwJBzIuNfn1BzzE8xeP+SnvzJuLkSufwZOn4P19M
	vQ0oRbTXB81kDthdGMaEOvdYmtlpYMFWpbMFEqADlN2SnNUNaTI+JB1Uz0+eljX8jBiU3EDpfo6
	7q2AoE93jY/moP54mQo5rpVyj2dM5himYArCM
X-Gm-Gg: AYBFou0Qlyf7VRyVcjP6QqDLPtwyNPeIoQpxLr2XxBFGazSZK541m1Hdh+zj4mhIldx
	i5fw83dvkXaBXnWMOT8KJ+cxgrwQe+uZAzxvT4cQorEsmficH1UeVNlOWmOK8WhE/XNaiXonY1h
	1bH6zFWBCD+hZ8stxeQtq37/t4vYWeIxDwAxNpQ0rzhK6uVSM/aYhX3zTG3PPy+fjiNVJO/2l+P
	gAliOPVyvIrnnfv605cmx6bEq3+NgV5a2PLaMngndcpEar1mldAO0T5HzqmPi5Ze78ZNIJ3HxIk
	EMI7A3ImvE77L+S8/6maW6Fc62MQD3UIQ0mkCe3IdwExnHh/kiiy5qZrRVzQWCAGOAEIqOClogq
	LBmJoP8/P8wSztqwuFFeyZa+OI8zXCzxnWyjH1QBzHhH3
X-Received: by 2002:a05:690c:f82:b0:8b0:f074:75c3 with SMTP id
 00721157ae682-8b0f219a62dmr15543377b3.11.1792321142377; Sun, 18 Oct 2026
 03:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com> <2026092925-licorice-strode-7905@gregkh>
 <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
In-Reply-To: <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:28:49 +0530
X-Gm-Features: AclHuK_HMv1PVjOPtvzFyVILO65tZfoFuR0e_ptveMjtk5RooNmqwPancL-Uq38
Message-ID: <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:48=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> On Tue, Sep 29, 2026 at 6:53=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> > > u_audio_get_playback_srate() unconditionally locks and reads
> > > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > > without a playback direction, this results in acquiring a
> > > never spin_lock_init()'d lock when a GET_CUR sample rate
> > > request targets playback, triggering a lockdep "trying to
> > > register non-static key" warning.
> > >
> > > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > > before touching prm->lock.
> > >
> > > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srat=
e getter")
> > > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> > > Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d45eb
> > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > ---
> >
> > How was this tested?
>
> I have not been able to test this since there is no
> repro present in syzbot.
>
> I verified the fix by static analysis of the call path in the report
> (afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and confirmed
> in g_audio_setup() that uac->p_prm.lock is only passed through
> spin_lock_init() inside the "if (p_chmask)" block, so it is left
> uninitialized whenever p_chmask is 0. Leading to lock splat issue.
>
> This patch is compile test only
>
> > Did you forget a Assisted-by: tag?
>
> Sure I will add assisted by tag
>
> thanks
>
> Deepanshu

Hi Greg,

Please let me know the status of this patch.

Thanks

Deepanshu
