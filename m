Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6CA3AAF49
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565749; cv=pass; b=l7u1VWuSgS0bxEzX3LmIuUKJUu0hBE6CfhDapL47Yn5GjQ5a2SJXyDCz6n9SUwL5qbx9Nwi2HI4a7+PiJAwmZY4yijZ4qIvFksY+KaXjrBserrtmo9Qz5+ojNaFX8kgMTwbYX+WmOuH8ZQkV/4RxCUiWEVNrRiv2oWMLv6Ntyrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565749; c=relaxed/simple;
	bh=Jm8vdCNfd/Ay2He2k9+eSmGx7u4UaUwDvdHSixnhBK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmzY/7mjvZ40i4C+D/Ws2dsNoe56Va2MwmmnudRZaGU6B1O5t0h8qfRup+Ix8Hf3Wc02Jk+1OiPRmDDQj/wiTtTNVe5Z8be1iweOAP+L2oBIaCh2Gi0BwFfxrQ36qOi4AKClU7ozHP3dK67wBrkLrAv3FzhccXVNqLl02LTVie4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/e9l7yX; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/e9l7yX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so11992875ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788565747; cv=none;
        d=google.com; s=arc-20260327;
        b=KzqgD537BKE7+kVWWoIJY7PNjoer6SyhCTDqX2KQHtdYAs5z1ApOCixazp8IHiv+mJ
         vRDNzAo/J7PdwHf98NkHQ6g+Wnfw1Sx4Yr1CqN9yDzSQR1n2KyEtG/3tPVQQQtc+IWLn
         8dV/YCd2lkvT1DYSjhc6et+lZm8S53tjVX2EnyPYTP+1uh9bk+TszxeVCxMC2Y1VspPi
         MIESUb70T6/LsSGoRBawf5T0+/YPs06iPI1v82oc0/gPk4n4Ya3dEbX8cCIGYhAKE3BC
         ejjFj/JC25hfqKpf1JcSzhmWBGofJnkM2MaxMKLoUeWxWG0ygzsBoX0TQMwsbwBzCv5S
         uXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jm8vdCNfd/Ay2He2k9+eSmGx7u4UaUwDvdHSixnhBK8=;
        fh=N3YpLDitt9VDz8VcZJ5ElHwts1dGmZCmBPBffE7L3HY=;
        b=hmFqyfI3wRE5n5u50gGyAQBzQ36ZbijqMvbQPSFnejntMS5v78+toyedFYZqka61UM
         GfGQFCAG+xNbulK2SP0ro8U65MIp2Cdg4i271p/S6lsE719qrfqNqEeFnUXUld2bRXIs
         JiDMy/K3du5HnPEU9sth0fJ6DLZP/qGUu5Mzyctj2FuXWcddKjdMSy1BY7cgPyJosfBa
         Rs4aiQ1mWnCu9wkmvlfF2XwNGb61MXErWF+2c8K/ppblWsaXLA8jB9HKW1ScZGVLN6HO
         KeVt2ANPJ/ml8XxVuZlwzfn1iCVf0T3tDJYoYMMQLwi9FCWmlx1Pw9Y7nlphabJUNBA1
         6KBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788565747; x=1789170547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jm8vdCNfd/Ay2He2k9+eSmGx7u4UaUwDvdHSixnhBK8=;
        b=l/e9l7yXREPCh4IL2BsYxGzRzv6HIN/7sDDrbSNI7F6L/6bMS1NVrZbSUIpQax6lKC
         6rqrckZuoo3iuktLyaE9VaUfNR/fQnLIIt7dasYIY689SklChjv5Gfwxbqp5IX2DdKm/
         Qj7hWsyu6L4r4CGfcDqWy/DlWLaFVe/v/xnLSuR/XGGGKlnUVznTnNdcwdHn6H/WmktP
         HWbHq/qSraoC8ESCLdd/gTU2qJo09nJoubgYyGnL+sxTfs0LzVuhS6hkrqtBugQgsDcy
         iM7rNOZ4eEDo29sn0uDfd7GR9FdNz/BIml5ESYp9LB+NQg18PSwMHa8kUvh/o6x49LE3
         ZCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565747; x=1789170547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jm8vdCNfd/Ay2He2k9+eSmGx7u4UaUwDvdHSixnhBK8=;
        b=bgUsma0eYwk81hUQGPzwKjSNsIM+IBDtK7bQ5dHGRvVUbqwo+hN9hkWtjkKUqWRyyu
         bY/1VtW2T4rAxQIqWJMU+IZiSL/iGQUpX0h6MK38/yMhURh61JFgtheYRiNJC+boKIme
         tpoV6hTl75dVyMqGDLAliFOUm1KKMXGeWJ9y0U5aF1N9Gm6B9cxwq0csBF3CorMgTseT
         bMYW3kRV3eVOW8zqgkRiu8tZEUAvtn6eFhvpgSpDUT+9rRvmNSIzM29C0jEQqor9qTag
         pUCgM3uVoJ4xg3jQCsxQwqISWmUP8z2BcuuvSdnetgFCE9Cn2NhaV7IVnK+dJ2X3Ht3g
         ajNw==
X-Forwarded-Encrypted: i=1; AKwUvBwMi6J0e6Q60PQyVUF6o8n28fYAeOaLRVLA0T9UVy71qHBvGco2p2Zh9hUuczaHwhiS6LcTaMuDExh2sJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++ks5zsvSmUkUkVSmW8GblArjZOrZhpn1JrN4dsoC3nVDcObEDQA
	H9dNFQOzaihaJcDCR4rNQIz4CpIakBdFFWPK0w4z020VM52ffQlPtJZ9PVnfU3cXH4pJKFtHyNv
	OiI7wZtT4YwxeZ76ULPBIPcn9nO67uzo=
X-Gm-Gg: AYBFou1jr2Ew+Jj2bINqu06speldyluMwHh64pmGwtM8cFhWmVt/Bo4zhMWCSgdNNad
	1fg77Gsj8yLusx9Bwx1PUkNeRwjPl24ioeKe/mOAexfC7NfOGSbl30ZmgmjC5Cbc1nrqqEvt1Ok
	4cYimWjIdgg/exDarMl8zP+TlWCaYReqYm/c182aVZpDCMww1o8t3/ccvuSLrje9NyGJXPQghR2
	Xu4UiNGHXwQB43XQ25FW7EcxjhD/TH+tGEYLYSqQXdMsMoykDEyTABGfe4GqaP5mT0+YfMDQ+BJ
	kfrD5uv7d6r8eBFJmT+9HK5aJDFFBk/H5snoLdMUXSxOaYcwB4CqtyybLoSCZpSoO7OwpBxnMeg
	pt4y4N9SljPIlUMS9/JgIeX2xCtSp
X-Received: by 2002:a17:902:f64b:b0:2da:eccf:751d with SMTP id
 d9443c01a7336-2db126b5ed0mr134284105ad.22.1788565746899; Fri, 04 Sep 2026
 16:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831090524.106845-1-gmonaco@redhat.com> <87se3sakgi.fsf@yellow.woof>
 <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com>
 <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com> <eb3dd8158942d663ec8ad4c529eacd666c5f96d9.camel@redhat.com>
 <20260903090211.50d15220@gandalf.local.home> <CAADnVQK8e1Qp9rf1zThZxb3vr4Gc_bpo0nqpEO2LdnEwHdKokA@mail.gmail.com>
 <20260904074317.01b2c0e1@robin> <DL6O0KLPXLTA.2HJJUXQUVCP5@gmail.com>
 <20260904123108.1fa1d815@gandalf.local.home> <20260904132421.111c0279@gandalf.local.home>
 <DL6XBKITK7ZT.3RXK9YGGUYZZE@gmail.com> <20260904194620.0c7a8363@gandalf.local.home>
In-Reply-To: <20260904194620.0c7a8363@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 4 Sep 2026 16:48:55 -0700
X-Gm-Features: AcwNN1UvoLinoXtZcq6itqX2kSBVjcDjcnqMchnOOVOg6FzMAYIbCDpQFn9LNIs
Message-ID: <CAADnVQJH1SYR_GN6gewF3w_z_Sex9HFE1T1oXkQe6+v18bDTWA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Nam Cao <namcao@linutronix.de>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Wen Yang <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
	Viktor Malik <vmalik@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:45=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Fri, 04 Sep 2026 16:34:00 -0700
> "Alexei Starovoitov" <alexei.starovoitov@gmail.com> wrote:
>
> > bpf in 2022 was surely less capable then it is today.
> > It took us 2 years of bpf core development to statisfy sched-ext demand=
s
> > and we're still adding new features for sched-ext needs.
> > If you're trully willing to remove 90% of kernel/trace/rv/ and refactor
> > it into tiny shim where all of the core pieces are bpf driven we can
> > certainly work together (like we did with sched-ext) and add whatever
> > is missing on bpf side. Then all existing monitors will become bpf prog=
rams.
> > But adding bpf as another 'monitor', sorry but hard NO.
> > If hardcoded monitors was a mistake then admit it and fix it by deletin=
g it,
> > if it's not a mistake then keep adding hardcoded monitors.
>
> Regardless of whether or not BPF can replace "hardcoded monitors" today, =
it
> wasn't a mistake back then if BPF wasn't able to do it when they were fir=
st
> being added. sched_ext wanted to use BPF for scheduling as module plugins
> were nack'd by the scheduler maintainers for a long time. BPF programs to
> handle scheduling was the work-around to that, and basically the only way
> forward. And it still required special hooks into the scheduler.
>
> The rv monitors only needed to use tracepoints for hooks. A module was th=
e
> easiest way to get there, as BPF at the time wasn't an option.
>
> If you want to use hostile language like "admit you made a mistake" then =
it
> makes it harder to collaborate.

If you're offended by the word "mistake" then ok. There is no path forward.
Keep adding hardcoded stuff.
