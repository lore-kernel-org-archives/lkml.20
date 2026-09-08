Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6FB501F53
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860929; cv=pass; b=NyeHJJEI9LKSdz+NzFk6Y73evegAPYASyUuduVrBFe8R5v9QvosKop6lvE0ohb3Tiih1jJrdbuDNJLiQR7Aon6LyVjbYz0HRPNdZbScpo/Jfe6+SYaMHn3t0PekT2IKEzTTa38KoNfFC6qSP9ymxwhQ2TDnfsQi6nlPp8SA3EV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860929; c=relaxed/simple;
	bh=D13dRvOgzGTyqJxunhYQvU1OBiDJ2Uw7fUQeQLjCH7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1fdUjSNILJ5oHzkniKAAt0FL7i88w5MDzZynU4IkPNeKmrF38FiUxusLUlbLU87kNUF+dmNlgOPvXQC8FiWLb0vYAt+wib7wRUC5ozzwrToVCyJbxF4WNh+OXTwFrRrjTIyRXoQOYj5v+TT/lsh/6L7oZmdkKehVhsnxp3qDMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpLplSi7; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpLplSi7"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90cd4631090so56640546d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788860926; cv=none;
        d=google.com; s=arc-20260327;
        b=J+bMgkOauPlIonhFuXJHVHIR0W53mJaoq7n1L59kIKozUG0G1YRdd6PJxf+IZKeO1l
         rDOTi67A975s+Tde+PjeIIWrH1lwFCB9XcRvbv/Boz5eMPpOaldP1fDaRyEWSRDwXPmp
         E3hgqfEOmzTZdB876V06P6+8mY+RFH/gWJ8tMW0T0W1SsKs66LaFW6sSYjQMjZi9u5Pv
         xFa3HNx86LZfyzGBXiVZ3t5kA7GbTfPYaGXmsY5tWxYayJ+8OeE2sbCZgvC32JpVnVd2
         Z/JpbC1FkngaFo4egC/uubEe9KA+EFlYUO1Gf0U9iLwIS6iNZx3JLDXU85V1qYAAK2Nf
         NM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D13dRvOgzGTyqJxunhYQvU1OBiDJ2Uw7fUQeQLjCH7k=;
        fh=DIV+ZIrmCTeZ4KMKghuhaLofqYvVmQ/+D0ws4td2+sA=;
        b=R8/0+5A0dB4sp9kN8mRIzOsrWN7O1nyY+I+RWqHH+mxZ8rA7LzdbO25bLs6Kx5wtfq
         Wx3ljfsUPl9StkpDw63AvuKzU8+Diu1WkZjz9y3IUvVHEBj1aSk6eOkRTrLN+hYcmwSu
         qLsAFd2kVzW2cEHYHrysJ9MDF5pKlyl3SENVp5V8UM32T2XSk9eT4/5ejwFu38iZnFun
         N+MiKTc3Z7YBAKN8Xn/9MQHK/AVJPW/gVRG+9z4W4V6VazqEtNwQJtpOQoxBoDasnjCV
         OFiwCwToMQZZQJla0QcCRdN9u72pudiYfO9C2oL7KeIiJZvBXaSEJ+KxDlhF/2hYMPoT
         6/fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860926; x=1789465726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D13dRvOgzGTyqJxunhYQvU1OBiDJ2Uw7fUQeQLjCH7k=;
        b=BpLplSi77QkTiT37RiJeXC6/rZltD5Q0pfpKU9Q3UrJVzMnk0yLg5NJ5tqBSe1eYBW
         tSXcylyi5vaE3sWaY9/czgAwUP9EwSAvrFIqUkctZ7UFedU8GY/xZprpwkxFSn2MnO9/
         R/4oi8L1T6KCQ28+kcgsWR9C/HJx1Ra5cXcUE9Qi/AyBd9F6x3leBZ3c2ELBKgDwDMeY
         lZrtU/8Di4LxSmiT0XW0UtT9ofF6SWjWtGvQcI0UfN5zVDxNzbz+Jsa9J52aS8hwAeJ0
         LnTpSri2ERQSFBCL9X2scm6ghLkvgKZngrm443c+c7YyUzfjn7y6cTqg75FORiRpjS97
         vcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860926; x=1789465726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D13dRvOgzGTyqJxunhYQvU1OBiDJ2Uw7fUQeQLjCH7k=;
        b=Abx1WO8/6gJjh8RT0I3WvGCaJPrDJgPPoEHa4kchgTPLaJadbke8uoyvF2z+7T0xSI
         PsV2tUrMq624m1Gn1d31ve7O7PefM+d9oZs2NUv/HfgnVTdmNHeMXlaOorU/Tm0M9+y+
         WtswmngvkGfD0BOsPZckv0JD2Y/l1rqULcjQC3ILVlZcalDSqoJ/AAp8RFepQtFOG8DT
         jf5njGtDANTG4hDay09qnKgw6+EJbPEPmB/TShQEpPFyFV3/0kEjeeLsuEPZH5T9hceO
         WQ+YeX0RA/7QrZ/eokmYLqegqQj/KJ1tpvOVokuZo0lPIqLlMPddFsX38np6rz80JEda
         nXxw==
X-Forwarded-Encrypted: i=1; AKwUvByGAUO7W136xBjsON4TYPbX5O5yP+7265RGLdItkbTqaO9cB11TsKuIGdkPsu1WGotcFm9JbfWfxtGGofU=@vger.kernel.org
X-Gm-Message-State: AFuF++kIia9e+JIL82+9SEH7izj03Bi+E1xsVcI1EtQYV7D69AW2PfiU
	PJAl0R9CQ5CsboC8yBnpb4UvahhM5+QyHPmvUSERB2Vwr0s8KiG40o5CeAiv7ypv6XRt0b5IXh5
	mQd+2GkjAA6EMckUTIOZYMdT4bikTBVQ=
X-Gm-Gg: AYBFou3vJxTriRHijWijipMjb3gPT2vC/k2VrftAwxdmE+MkIQmSoZxuPgK0Ab8a0as
	78qP7wDA7x2J3fQAIxrj1XMcf7DY3Bq4yAf4S/1ryvzEIEewMQxdCS+COgcSXX1SE6uOv8wCGN9
	eLlHEDZMMAue+zFTUCZ0vvRCbBAtUEv/GGrrlUzz3WQkAbeyiecn2ihavxFG4l62t9bA6u9EKfc
	lBBDgvOTbikrE5f/EsvLNfP56jiTH1lM+cbgRtRM4+0TUzGKUBK/Y/hjUOOYD78T1CO6Kz7pS9/
	eTnLy3rxMzvOVmMs63qfLRTZMlBC+6dUG0I9O2MvYckgRna1UWc1qNriyvBWmEXuzc520sKRFqz
	m6drY+NaSq86hjdbKEIiT0H3FDDO8sH96sCjRcHR7ERJf
X-Received: by 2002:a05:6214:8004:b0:90e:9dc0:a5d8 with SMTP id
 6a1803df08f44-9103458a926mr261431466d6.7.1788860926360; Tue, 08 Sep 2026
 02:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFiazsFb8TZUKp8oEx=4jkEHm9oLHn8M=c2ksBC1SbeF-zmM7g@mail.gmail.com>
 <874ig17axo.fsf@jogness.linutronix.de>
In-Reply-To: <874ig17axo.fsf@jogness.linutronix.de>
From: Alexandre Boissiere <edu.alexandre.boissiere@gmail.com>
Date: Tue, 8 Sep 2026 11:48:33 +0200
X-Gm-Features: AcwNN1V1scJ2xt-HSsd8LC8E0wTsQd2t3vAetBrYwmcGS-Tv4pngCb70tlgoqXM
Message-ID: <CAFiazsGrGzoh+5XSRhYARjgLO-4Mp2t1s4NUwkwLUdtqHipUJQ@mail.gmail.com>
Subject: Re: Question about desc_push_tail in Linux printk ringbuffer
To: John Ogness <john.ogness@linutronix.de>
Cc: pmladek@suse.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello John,

Thank you very much for the links.

The scenario in Petr's follow-up clarified it well and I understand now.

Best regards,

Alexandre


Am Mo., 7. Sept. 2026 um 09:55 Uhr schrieb John Ogness
<john.ogness@linutronix.de>:
>
> Hi Alexandre,
>
> On 2026-09-05, Alexandre Boissi=C3=A8re <edu.alexandre.boissiere@gmail.co=
m> wrote:
> > I have recently been trying to understand how the Linux printk ring
> > buffer works.
> >
> > However, despite it being heavily commented, I cannot understand the
> > logic behind the condition in the desc_miss case at the beginning of
> > the desc_push_tail method (lines 716-719 in commit b6cf8b3, lines
> > 801-804 in the latest commit bf56987c).
>
> We originally did not have this special case. Petr discovered the
> need. You can read our dialogue when we realized we needed this.
>
> https://lore.kernel.org/lkml/20190709090609.shx7j2mst7wlkbqm@pathway.suse=
.cz
>
> It is the comments related to "two-wraps-old".
>
> > From what the comment says, it is meant to guard against another
> > writer currently reserving the descriptor. My understanding is that
> > this can only happen if there are concurrent calls to desc_reserve.
> >
> > I have been trying to figure out a scenario that would make this
> > condition evaluate to true, but to no avail.
> >
> > The difficulty I am facing is that desc_push_tail is called with the
> > value of the current tail (or the new head one wrap backwards), so for
> > this condition to hold, the ID of the desired descriptor would need to
> > be two wraps behind the new head?
> >
> > However, given the way the ringbuffer works, and if there is another
> > writer, it should either contain the value of the tail if the other
> > writer has done the head CAS in desc_reserve but hasn't reached the
> > state_var CAS before the return statement; or the value of the tail
> > one wrap forward (which is equal to the new head) if the other writer
> > has finished both CAS.
> >
> > None of these two cases yield a descriptor ID that is two wraps behind
> > the new head, hence my inquiry about this topic.
> >
> > Is there a scenario that would make this condition evaluate to true
> > that I am missing?
>
> In Petr's follow-up message he goes through a scenario:
>
> https://lore.kernel.org/lkml/20190709115814.5nykd6yroae7wmxw@pathway.suse=
.cz
>
> Please follow-up with a question if it is still not clear.
>
> John
