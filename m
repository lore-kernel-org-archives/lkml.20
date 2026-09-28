Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357584195A1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601081; cv=pass; b=vE5FjE3Vl5VgCsJnI/KrUIm3wuViwHamCOnlQeZuFmGAZMHjGnIvpd0mOR2BUd+OsxQXm1ub3y9ckwA3RDHW4iZn0yBs1YXTgbK+z0rSra8c91ozq5vku422b1mH+FDN0IhgSCV6HWG3ZRqmhIWTLV7MTEd1xr3R8zLX/fvs03U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601081; c=relaxed/simple;
	bh=o4r5F2fgvwBkN4M4LzHhDPy/9BpkJ+Qa5ATUM2N8jqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvQdJlFZ0Negy1omKBIQze9xxGfrqUmojSGvygEtPKlyqUDSqq1nh5hz4LBQ2GoVTD1JG4edTWOsFvbN8q3+/D/8lGrK8gAvcw08DWoDT2sLJb2SckVIp/T3ZdYKuXrA1uIvF33OsEbPoRdCLUJ4dOGSQm7uzs8KodPxZdeJHcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX8GLzED; arc=pass smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX8GLzED"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6abc27842b6so2472766a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601078; cv=none;
        d=google.com; s=arc-20260327;
        b=q59L/B2VnZ7lQNFKYAho1VcN8NV/nyufNmBR8eMMvwyL3QQu9k8JvaYERHRMq9iM8t
         wCxkwd+db3XPaJjl+vLZRJT7Zan4U5hWcjkXjDP26CwV8U0sgBj0WwgLsABJgGTKdEFl
         uCpOod2KmFasQVG5EECejfwcBwabYIKU0sSphDGp2Z+L8gSG98VJ4CetZuaMCYysWd2A
         NTf4Tr0Q0or8XWiP1TVl61ukz/w70ONam7edOEccdRb1aln3UPl42N3yDcOwRUgbnw/i
         fbwUeqqwMe8TaACWZ9G30g6ag65Efgm+Lz92otoUMQMtI2VLsocKSu8M+XkBLGOFRou2
         AxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQueGXrz4y0mf/YW0CKD4m4LFRs8gTKhhd/6y7bqJSs=;
        fh=CSHsDiZfDLd2nwZ4QZZJSechJ35W5cVv4aAEcnZNjFA=;
        b=kxlZoBddAZgIQFsa1jeoGThQjMwLvje1b0TqE4+YwQVMklNOZl8qmEOoQdeJTNOvqG
         vjYoDqP7X6lWQnwKhp60C/JqRyb8ivi44jTn90FtnRDpb/vv3qJcnmV2GH8frzAIABDn
         l3QZpk5vBixx/1XtcEDgCjh/hQnKkzPrKq2ptk87jsnEn4t84L36bXdccUp1BTlDYBqe
         yZyJvrfjaJ0mNKgjeqRVcjtbiiQvQRsABcoq6/4iwxcrbV643JMFCMpQWaAlCNK2abyi
         kWuMnxbacq6He/qd4jXowE5cUEXg1wllDOAKasc+tY33JJ4fA3I0GwM3lHxYEYD63GVc
         1lCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601078; x=1791205878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQueGXrz4y0mf/YW0CKD4m4LFRs8gTKhhd/6y7bqJSs=;
        b=kX8GLzEDtUZc8XKDp5fA5RcpnsJa+daZxGbuvKDGqD9c9vKHZWSKbDSr2NpZBwQIcW
         qSThZZmZYf+a6LRcJtmC6KDfoX4o+Jt0hZKQICy2TU2FRFyNRh399KjdnEbYdNk0ghjn
         h+AnHU4Al/qSUlP3YRiLGP9kbCElQw13Sb9lSi0gXtPJSaPXSh/ARN/7my0XTuudtw7V
         lf7v7I8LrXbaRkjBDVhAGFPLIzCE0RuNapBtHlISJXslLweFPg20fAWdPo61eXKS1lsy
         lmrpzeYLf27P/dKlNN/xGjuc+WuQSbLWoW0jW6rjuCZ4IM7C/XqLzjy2NTkRig/380U7
         D0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601078; x=1791205878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQueGXrz4y0mf/YW0CKD4m4LFRs8gTKhhd/6y7bqJSs=;
        b=ns+QA8V1+LA16AMyHhNBdxoKrscAOoO4q2BggxhysnSM6ZqpXmmu15avAC3f7S0sI0
         fGCIZhjMY0Grak0OkcBMp/J+/S4ZhBoGrkD688QK9jk+jANpVWsZ4Up9Uv02wld15CiN
         78/VnC2EUyiu+wqbdKdMetBrLkCRX/t85TBVBKETDvmX83KwV92xYnXS2HZ76DO/huyy
         Z/fi4gZNL9LcuTgDd07Qu/yvvIrkrvPYM0EpLdZZhPAAbZO5mZfdRM7i4NidU8qOGT5A
         1jwXj2lQtHftYC6Qu791GK4JMe36pvkL3UlSzGJrSqt2Zj0o+qlpqY9dwkNr8vaNe/Cn
         7KOg==
X-Forwarded-Encrypted: i=1; AKwUvBxFitAtOUV5RWsleaPXjgLq2/poVLhB8iEFKPHAgkINeQ/D82uRh5UUBNXvKQ5vZukxqw32i5Z1ziaUEpc=@vger.kernel.org
X-Gm-Message-State: AFuF++m2HVbK+OS4dR8fxKRQZgh8agythZyRO410DwKHIB4Pv1mbInwv
	F6JLcQkGySD7JJk8rcwsCTtPriVrD4q1pGHs8Ham+jWPT0ELgPbmNIRpKGrXPMD/VPbH+wbLF+G
	80zYiW+YRLyi+cbzCrAHnt17CheZkxNE=
X-Gm-Gg: AYBFou0z56rCHmANSb3duK1YtTxzsAtk4l6pP64cfVlKnunQEEmvk9D7sN+5fSWjHyG
	7TtQ5jO1ExS6KbqLdyKBrqXMLWf6CwSAoJzfhdwxhnMvQLbI8XWe/ru9DDFYB12g7chMnzf9r21
	mWERomGeDjTbf5vzeT+7pDTQaBzLT820wFvM2Izjn/CMmCkHGJ/UGSpdWHcolRcib961Q9YuZs6
	MDQTbasHEiH+f5dvcjTCN2PsfeX1TcOZ1t6h5/vOXWuww8NcrpoFIHLzQ0aZeWSMoh36foZLrfN
	OS0qz/9RYLrGEI2jkLuf/WOmMhUcdOWXWZEl3Vu/y+NYBho+EZNjPYOZk9ohHogU8QFkyPbRV9r
	QD66fGq1xP4X+JlYsWWNOsvleMVTTcCr/unCZKP5x9AoVG3iPF5XLWpDJltNi8ZCj/9N0V/XixQ
	FxRhXnGNXY3jsnCr1Ql6NgOD43dDT+HzkyCFGXLuzz
X-Received: by 2002:a17:907:930d:b0:c2d:e067:275d with SMTP id
 a640c23a62f3a-c2de0674acamr162299266b.2.1790601078194; Mon, 28 Sep 2026
 06:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com> <50a29ae4-bae1-44be-9dbe-79a1147accf0@kernel.org>
In-Reply-To: <50a29ae4-bae1-44be-9dbe-79a1147accf0@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 16:10:41 +0300
X-Gm-Features: AclHuK9datk0SIrirqG4Wm6GEpBsJI2Z425EMVFQsLXPnhF6M-rCXvPDBPrj8CI
Message-ID: <CAHp75VeHupSXCBUyoUdPXY-GvBcupQ9kczhr-M3=WLkEzDKyvw@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:35=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
> On 28-Sep-26 13:34, Andy Shevchenko wrote:
> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> >> <mika.westerberg@linux.intel.com> said:
> >>> On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> >>>> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> >>>>> On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> >>>>>> On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrot=
e:

...

> >>>>>>>  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >>>>>>>  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >>>>>>
> >>>>>> These are interesting drivers, not sure where to put them
> >>>>>
> >>>>> IMHO they should be there too. We are maintaining them both.
> >>>>
> >>>> Do you send PRs to Bart or you just rely on him to take the patches?
> >>>
> >>> I don't expect these two drives to get too much attention, and they c=
ould
> >>> be contained nicely inside intel folder and that would help Bart to
> >>> identify that these are Intel drivers. So your bandwidth would not su=
ffer
> >>> even if these two are added there. Your call.
> >>
> >> I'd like to avoid a situation where we have Andy's Intel drivers under
> >> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd p=
refer
> >> to move all of intel GPIO drivers into drivers/gpio/intel/ and have An=
dy
> >> gather changes to them if he agrees.
> >
> > Okay, we have two parts missing:
> > - Nova Lake driver (I would need Adam or Mika to step in as at least a
> > designated reviewer for that)
> > - USB IO (I think we need to agree which tree it will go through, my
> > bet that media tree is the best), for that we need Hans' consent
>
> Routing the USBIO / LCJA GPIO drivers to the media-tree, with
> Sakari likely doing the merging for both works for me.

Sure, Sakari, would it work for you?

> Now that I'm working for Qualcomm I don't have much time anymore
> for working on IPU6 / IPU7 related drivers.

--=20
With Best Regards,
Andy Shevchenko
