Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858626;
	b=APBb2CejOi0c83HTdQSPvlt9m/YiL3bD8c89s877DEfqmmKb3T/Ntu2C6J3FJXsnS6WS
	 15J5h2AsMVVtYl/iKMYN4NiHZsDRJV6CrCVtuhwGXqzheEZpWY5AAfKJo4fLydL+sPZYV
	 VNy7stjDioZhDIlFwEPdpeSIXSDh1pepsXLi8LVFBWeHS8NVY23Gb19jjka55YpGMBEhP
	 5StPh+WtD5+kh3zVm6+8woFs8FKBUKxQeII9b0RE6F9hpMNT5QnV3OUNB48H9rb5f+cye
	 xNiGSEc8z5Fha9M+Y/tHCfAxqCpbtzmlORF3vWCc8VV6xKlikT1pXGw70iPXjpc0/XA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DZQ8g8pBKXPUn7Qnj5OUU6UZ0jQwjkWgH4vQN0jAVko=;
	b=untKxC/iHbVDe4t7cl2pLN4MAVzeY0dtnDtM+8CZefYknR8Yo1WmpoCYAREre8I35w0D
	 fHK67EaDfpAjaVlL70nRVaE5NuN8srli+1b0zYRTU3BdfxkkOFz5u5zfEzGKwGOEDKRAA
	 PFOMCdlm+8wAP4q+Lrx88QIUgU7GBBI5cySJvvXo8Ff2uYVXe9JnaEZ/E8NL+mEjPvIkq
	 RJ7/3u4MrZpqtERhB2RnZoac9GqHo6ftk+QxnIvKe2hyAQFTjQNlRNKqPMVGp0NWcZL9V
	 pDe+IcEaySB/PxiGoLUvi77LIlFe4GWYgF5Luel7JTnlCq+e4Ur2jGaKaggLX4CpUug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=joelfernandes.org;
	spf=pass smtp.mailfrom=joelfernandes.org;
	dkim=pass header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=t9heb1Gl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C48606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C48606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=t9heb1Gl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so9274745e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794858624; cv=none;
        d=google.com; s=arc-20260327;
        b=NS2a/ducAHS9ERQwvBaPBnTrzyLW6+qKK8EyE1FhyRaglLO47mstEL8mr462aWwan7
         MER8niED8wu8TdxHtPaT1MdzoKSxtUlZFxfQz53t07FhBvsyg7t5dMt+UaWzhPeP+rXG
         W75woaHvFBEb6Vh8h4UhPLKAOaAQT01RPuGyHzl0TkJ6XywAxKZky7bNsUE2dsUxUfbZ
         hxp/o4cCyuY9PeQ6zKdc6VjkPGiM+fwxnzSjWZ6JlT9c1mAnG+Tya52PXSJWZBe7RkJ1
         H53j31Pq5IrU3kpcOiTuOkwkmUZe/c4V+rcppD45blLLAeYft0C73BfHyADrR2aA7j0/
         QMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DZQ8g8pBKXPUn7Qnj5OUU6UZ0jQwjkWgH4vQN0jAVko=;
        fh=XuTPb7mJZH+O1ibt5KhgnwvQ504zLbBJjtQOXPF4yWI=;
        b=ZQ9phqLcs20D/snjwy8H1KZItZeTzDuAlxAedOin2i4CVM9BGRtv5V1KnkFXuCL5Mt
         wSmSTA56RbPigZq2fs36C1Vq6zGIVImDolhM2tK5skkb2dX2R2Mk7fqjsUhNyEDyUXmi
         f0/9+EvvOr6wBv9m76ruJ1u+lM2klnakfh/HHorRFL6919sN0SSn1PNyMReW1F+Pwhmp
         PLGG+8V4rYxE9xr00kHKKuMFsvqshotd27mR68M6UvJY9wUM3lhnC8EaYPuzVZlRuxH5
         CFDEHmJN4vmsVPi3rUUzZYno2xfKJzJkaPq2kIOR9rIJK5nUey0kKe/a7lP4L6gec7qw
         CDFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1794858624; x=1795463424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DZQ8g8pBKXPUn7Qnj5OUU6UZ0jQwjkWgH4vQN0jAVko=;
        b=t9heb1Gl5CT4fOX1siaxtEGwi+nOTA/37tqWgMEuOzRFP8Su0zdNlZ7xT9+VVwuay5
         NbNIc630GgrBXv16jsoR0Qw6ufkgo9iqj2CawrwvQkY8Ews9brpgfeZM+VsA8u5DobT6
         dss8uzJ2coTEtQCrDZl+InEhO8vHQlW0nhoHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858624; x=1795463424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZQ8g8pBKXPUn7Qnj5OUU6UZ0jQwjkWgH4vQN0jAVko=;
        b=SYXDp5UENZFhm7NP9Cc06JbAZjqrsvrtWz+7Aptfpi3GrQzrWPlLbsAge8+1Lq3QLE
         /+ZdWQap3bxL1zP0O/uF62qtuXUCl1+OLT6wf/0QWUFcuHIdM+AJEM34ZpSbNIpsnZGt
         xv3BzAE3hFxFsQ4X5wDhXd4jdEZzM/So72CK2Yd8QQn6bnpPkwPYdUcrrfaU3QqMmQt6
         7U0GeJCZDodTZSGdbf9bZfHmTTR8ZoDnTEjrrICs8ZAFLtAeDu1W0L0xAVbqApH5ty5V
         j5p3rzVwd1eBMF2JcdsumYy/aogvwuETNVHYWCm8DrGooPQHRUNJaWteReFGpaCw4z5k
         SeLA==
X-Forwarded-Encrypted: i=1; AL+hErENymlpfh7KPWB5H62K/KCMmhjeO9eJe82280rT9KNrVTsg23v4koiUiVbL7ajuJs9et/Z9x/IH4zyztcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OjKz8tc0xtsJolktLtjlzPqEnWE5lhYvlg1C4LfWayd401p+J
	uY23aSOpSafMAWuar+1eJoKkhixrOORMYy0snpd3G1Q6PUSRsgD8Bk7r7WaVrwNxiVUnyaMVM/L
	1obWPPVAyViD/+Dn6n+ACtWNthj9gsudKsWIkhXBzhw==
X-Gm-Gg: AYBFou0DsaMP6n1PTnp/ytz/yNciYT4iGLa73Keo1I1ci1OjawVuYA2ocNHU5yqeJfA
	9sE0MSKNWAZcKHtviaqB+Q8ktPfNUPF0DM5OE8FM+JxCQmeaOVpNqx4nWX8VUpJjxGid3SX7bXg
	91+v8G0JjMpVftuiYOGD8DOjbf40FO7BLbcIcECseSri1O1xoWlYypR9/5kX2tRkpklyiGRh7jf
	jANTpdU7HAjykWF/F6Jok8jaKM0aNydb/+ZykF67dsVMaj7wg3I2XLcCyTfPi3fykCZgwUYthDr
	MN3ikWbn6kXvuuJnIrqZyH113e+3ptmCPeH5NFChxtAkjKb9BAoTnRHAHOOmoiVR8+uHDEKXOum
	3N4gSJu41ENXy0Un6vDgiqNWZEpacl+mdVR1mYlZ2kGIGyy17jjSwAtNwcQk=
X-Received: by 2002:a05:600c:6085:b0:4a2:967:dfb8 with SMTP id
 5b1f17b1804b1-4bb55a8d7abmr242122285e9.20.1794858623724; Mon, 16 Nov 2026
 11:50:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bf761cab-7423-464b-ba8e-bd39ad0eb089@paulmck-laptop>
 <20261116190040.GA946893@joelbox> <e173f3b7-de3b-4b3d-b0dc-c12a091c9723@paulmck-laptop>
In-Reply-To: <e173f3b7-de3b-4b3d-b0dc-c12a091c9723@paulmck-laptop>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 16 Nov 2026 14:50:10 -0500
X-Gm-Features: Aa3M54pUdJtYoXfs6_hi-uMPCuD52vPT7nhCDuNa_U_gOkj5n8f96Yty_s2ceZs
Message-ID: <CAEXW_YScx57GaYLgUYXVGFm6vq-_eayhJCv4SCKTqhOaspJEmw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Additional miscellaneous RCU updates for v7.5
To: paulmck@kernel.org
Cc: Joel Fernandes <jfern@kernel.org>, rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, rostedt@goodmis.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 2:48=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Mon, Nov 16, 2026 at 02:00:40PM -0500, Joel Fernandes wrote:
> > On 11/16, "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > > Hello!
> > >
> > > This series provides additional miscellaneous updates for v7.5:
> > >
> > > 1.  MAINTAINERS: Add Puranjay Mohan and RCU reviewer.
> > >
> > > 2.  Make torture.sh test NMIs for atomic SRCU on x86.
> > >
> > > 3.  Avoid duplicate identify_qemu_vcpus calls in torture.sh.
> > >
> > > 4.  Make torture.sh test NMIs for RCU on x86.
> > >
> > > 5.  Make kvm.sh ignore empty-string arguments.
> > >
> > > 6.  Use ${:+} to save a few lines in torture.sh's torture_one().
> >
> > Thanks, I will apply all except 2. and 4. as they depend on Mathieu's s=
eries
> > which is not going in for 7.4:
> > https://lore.kernel.org/all/20261112133731.127221-1-mathieu.desnoyers@e=
fficios.com/
> >
> > For the others, I have replaced patches which were already there (in 7.=
4 next
> > tree) with the new ones you sent, with updated tags.
>
> Thank you, and apologies for missing that dependency.  Distractions this
> morning.  ;-)

No problem, though you might have been secretly testing if I was awake. :-D

thanks,

Joel Fernandes
