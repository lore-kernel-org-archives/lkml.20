Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6FA4F55BB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420433; cv=pass; b=ZeVcdf0tk1VnzbIJxFuqghK9drRWDscMdPo3VnSjgu+xI6cd6cyCWaNjf1c3OOnO4/JtX4/Yp8sHRSFWtnOHtATXLAwya2Sbfu2JPuqM7vNJXjIy7Qkq+mQxXibZ9+DyZ5wgKSegulrkJQ+crqEPfv3KCSBdMRD4C69oKDuY1jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420433; c=relaxed/simple;
	bh=NvMYER91I0ByJlC1PXbZsAccJ7mHl0SXPzTmOrRuRiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOPuZ2uIu6mPsCs3WsrwNUSBf4gdZUxUtnnxzRDUw7XYYDjQaAS2qQvAS1+MJyaxt1sJDKVk4GWfkNGku+MZx8sabddxEjvPc7kEG+6ioenM20hd8S98O7Sav9wGrQaPodueFvq+LUNT5BUPU0faVUy+TQd6zQz6UMnIhoN3cHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sj5fggap; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sj5fggap"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c43fbcb4393so148880366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792420430; cv=none;
        d=google.com; s=arc-20260327;
        b=pnB51gVo2EA38IlDYFGvbzowk/rYPDNOjwA87KwkDrKPbFnr1ZtqJ8EOYkChfghyVB
         z0rz4nchDWk03lG8ApJ0H2/ZmufSfXc34CH158C94EiqjhNcCrzZ1tvzFTwzx2seOpmV
         cMY/gBPV8yOEHqHs6L+dhBAvzqp73cbXdwJWMAE5Icb8XObj93rY2f7k9zuQ9EPNxFLZ
         KyPSWWxqv0yUBLUkqi/2T0FLTEhQemnbw6p06yobrgdzTb+l2kOOBM7hrClZZPqDTkMK
         53qblrpL8ee/o89jFaVyAdQhiDwt171GJbn7htHe8BDiISg09SNDEJihnqhyc2PJNPhO
         Pfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dd7763LZWG48vYgb2048I0cZQ6AvUime8DR/exqEMsY=;
        fh=XX7JdMZgmmxJbBOKJ78bv9IvdBsf2qLQDCp1xTLtwhQ=;
        b=rr0RBUvF3wlm1i+tvQlge33dFpe0FaTlgnWM12jro0mPzPf8FI4gNAeqHtVNFvaLEu
         I+0Q+GuLbbRalL1oL11q8ABKjQSBCUabzrhyJXY9MIHjtoyZ4UyfguTC9wx13TYdbbTl
         atgsH+R1VPvB8bbgtAPIxLcOmecm4FcVP3hendVn5DflCMWWwZMj8j+WKeDLCZ89dWCb
         m1mF13UU1Ov42D16QV6GsjDgTwXtzLmeC/MD/am7sNBSGqmOZSRPj6TEiPS9pBumguuY
         qgS0HxzJq8w691RDu0948pXAIpM1+rFLBDVlbbMMCNGVblBuSdw0qtlSZP9D/xnH7xRI
         K4sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792420430; x=1793025230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dd7763LZWG48vYgb2048I0cZQ6AvUime8DR/exqEMsY=;
        b=Sj5fggapQS9TNHc2zKgz8HmWl5WcVSh9SnmukGnnYKmGjEVQlSpijJvwLGKrEk0iOP
         x2Mgalidcbj3TWWhAZkN2tsqhQvy4mC73HSyun6RnwOvZ4lF4deSswK92Ho/xLjL7lLd
         Ad9O3EB2s30xrD3iEtwmxd39IL2vuHKiRKWYRaGB3YCbpry5bSVGwVgOgD3M9II7hmtc
         ZV+Y5EkqKB/SJyx379yyjn+T3aNv7cBO4iHXHT/oxuorJEcd0I0ng1kjpR84umYONZ9v
         4L4cvrtNls4CQoiDSQRhd70UyBqas+JxyGj/2D8lpL+nkZsshPpL2ycZprj2SGjEewlV
         0A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420430; x=1793025230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dd7763LZWG48vYgb2048I0cZQ6AvUime8DR/exqEMsY=;
        b=RrbreolojP3YmbOjOoHcYmddu1LTKq2qNTRAZv0KFv4fEI1KpvghoKzMhJNNG06Pz1
         XsMb+HQitWn0x4hJKgG2sW4cQMwmDIDNPYUOq8IR0ZWlgbyhm10McWeUlqJmF0t01Lc4
         UlsB6CECTkgcXkX5R1EZZImaR0hwaB6viXypsH6fifjoh/SFRSUzLq6KZaSg7xI3GjQB
         dIS6BH7fH8SzIp9QAQfkQEjl1dbQhbV0PNWNoiA3OqA4B41a2vRmsfL1UCVvvu2FTqNl
         d9ur4hC6jIQt2mD77caSV5zZhDU7Eeehw7FXHMkHbeq4aE3ULZtEhpsSTZuuNqQ1NprC
         q+Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxmtVAulFEgB6blQXSxAXekR1q40bqYhgBgcOq6o98Xl5VLEKJERGIxmk+Sy3dfvTIxXjbMFuqKKk7DB54=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Tfzl+xRnRa5zeLsjj9T2A8CYmqWhLPDc+PMJffJy3TLm7r00
	50rFNbjj+KN0Q/ZRU+vjg3yoFjlwS7ovufm+lJJcaX4siGI/Nb8PzxnxILTOfqXW/0JyC1ahfZq
	ur3ivvrZZ7LaOzciPVO5E06kiJxyjT9Q=
X-Gm-Gg: AYBFou0Q6Yf/D6cNJX3Ch192TC03Ugn3L6ogSBZo/F3mPywa5chsR7FEm2+PYGql6xR
	7tUjkDlvSrcZrXnikrDfIy3GuBiYRsA3gJfq9L96CMBASx7z9siLEmbnSfwHqFC+zfDCwtsY+6l
	3NuqRfXQqJGPrqYRPwQzQ42WzbgJFWq/GROFETl4JSPO8G1/mRZx0XWwO8YkmKhW6IWov+dadN6
	S4dMJnU22MwgFs68Dt3JdnMdgv+LdOBmKYMgnsrUMqUcindDaALybQbYzmIciG5W2Q7eYqccfOt
	Aw9cTmw38QeSPe5J+UDypKkMIjFeka5oWjEMXlDsOlO9etUqTzZr0WJZaJtnUZ/QG3kLGd6SQVq
	tXxp5priIBQ==
X-Received: by 2002:a17:907:3e15:b0:c41:4c20:5a80 with SMTP id
 a640c23a62f3a-c41a0bd5bc4mr588936366b.44.1792420429899; Mon, 19 Oct 2026
 07:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-key-management-objects-candidate-0002-v3-2baa8cad2bb554364e10@gmail.com>
 <20261017035156.GA29318@sol> <CAFRLqsWcV=0MKituMQqALy_2rS3kOPPFpMHxn7yRxoyxOHp6hg@mail.gmail.com>
 <atOiKzlHKH47SMNt@kernel.org> <atOi7jWhglgRZ0C4@kernel.org>
In-Reply-To: <atOi7jWhglgRZ0C4@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 19 Oct 2026 22:33:36 +0800
X-Gm-Features: AclHuK9OlBsEmWtkP_XTvi9GQcsF_fx5BP_zryLibZN9CiuCkz2in8tqjXVdgK4
Message-ID: <CAFRLqsWxNHz0xngwMaCbnkifRs=e3NTeGmvvTEmCRSLn4YeQhQ@mail.gmail.com>
Subject: Re: [PATCH v2] keys: Avoid the owner account dereference in named
 keyring lookup
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, dhowells@redhat.com, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, sergeh@kernel.org, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8818=E6=
=97=A5=E5=91=A8=E6=97=A5 00:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Oct 17, 2026 at 07:28:31PM +0300, Jarkko Sakkinen wrote:
> > On Sat, Oct 17, 2026 at 03:47:32PM +0800, Cen Zhang wrote:
> > > Hi Eric,
> > >
> > > Eric Biggers <ebiggers@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=881=
7=E6=97=A5=E5=91=A8=E5=85=AD 11:51=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > Don't key_serial_next() and find_ge_key() (used when reading from
> > > > /proc/keys) have the same bug?
> > > >
> > > > - Eric
> > >
> > > Thansk a lot for the reivew. You're right =E2=80=94 key_serial_next()=
 and
> > > find_ge_key() have
> > > the same issue.
> > >
> > > I'll send a follow-up patch to fix those as well.
> > >
> > > Thanks for the catch again.
> > >
> > > Best regards,
> > > Cen Zhang
> >
> > Yeah, please do.
> >
> > You put so much effort to scenario and you are nailing the bug
> > that way, and I do appreciate that, so here's what you should do
> > with the commit messages:
> >
> > 1. Do the first half like you always do. That's great. And I've
> >    also said that.
> > 2. Think just a moment. If you get anxiety from that something
> >    that should be mentioned e.g., something that you did not get
> >    immediately yourself at first, write remarks those down. I'm
> >    100% sure you know when it might be good tip on something
> >    non-obvious.
> > 3. Send that. If we feel it is lacking some info needed, let's
> >    iterate that. It's not a big deal.
> >
> > I'm just underlining this because so little would have to be
> > improved to make this right :-)
>
> And also: I would not complain about anything if I did not want
> you to send patches because it does not make sense to waste time
> like that. So take it this from that angle. And they bring value
> thanks to well described scenarios.
>
> Br, Jarkko

Thanks for taking the time to explain this, and for the encouragement.
This helps me a lot.
I'll keep the scenario descriptions and pay more attention to
explaining the non-obvious parts.
I really appreciate your patience and guidance.

Best regards,
Cen Zhang
