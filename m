Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF2E3630BF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564500; cv=pass; b=s9l21Y25O9QMxQYhwB1+iImyT5ajAmbwavc7XEiOjZ4R0/5y0Z1Y/aYhwfayj4NQqTByqjup8dg0SnKrdzRJz0y08VFdJ8m9Z0DsBb9zr75uFUjLRQFtUbHxpViRAtdvIfgjYSNdCwkbsfdO96lMj7BAE8D1mZMl0AVvOhNCn28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564500; c=relaxed/simple;
	bh=ayPxym0az/dPYYVwbAryo+qLlPY3Bz4ZHUPUVaRwQrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEEA6dKri+GDo0duHK4i1idJ/ZyJWWam20m79pJAFgWq88JdoYS2wJZm5KdOgcVq5wAKgpnqjJHOeyo0cLbk2/NBCBDshejS0grRhZ0H+XlQHkhtbuqG47hYm9ZyFTwFSRS4R0paIWBRLGm2xZJFRWWeB2ZHqGTpkfNk2wmDbes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEvexrT0; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEvexrT0"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-53122c5bbb4so10102301cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789564498; cv=none;
        d=google.com; s=arc-20260327;
        b=XUnsfjoIZ6vW7J30m5/J05DGdPr38jp5rcAAJrYH/Al780cOa3Mza0noXINrGpyzrp
         aJdMRoJ9EYtw/KmtThaZwofkxKkWjGhF1KK2FVyCcQL7sqOpbC2HVmhoPskIw8GNPS47
         RH5dJmFyUoms8gFYTqKHSbyBVzoTQANsc5+ac2SPgz+E/ThZh/t5V4qK5s8tBwzLRwRj
         YXzxpzKW7pZqTNJDsYgNMUnZKYpHaVbBP7xK/aVGmV9kVsJa8WXnLvhLh3y5PJ/XxyiT
         /+k1y+AQ5UnvHRRtNBRLEOZUlMMaPTpBqNiaJEvemdSYlMZfACeplmdaBsK0z4zd0/Ig
         n5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayPxym0az/dPYYVwbAryo+qLlPY3Bz4ZHUPUVaRwQrk=;
        fh=PfzSYpEm/NsTbFmimCIEYoyBBEPlAkAH2KecrTXh4U0=;
        b=g+KkbosS9eYeSXz74o98iDJ6K7PLK+FFxEDY4Vi9wLE/lm6ixqKxWdhr7i/VjKNCB2
         FC3UcIDbaeaGj/EoWg6woGbF09TRBT7XJe3BsbMsLU05dw0H7u+YgHPwcx8vL+jIKuEc
         CRmSDkL7qD4MQUKkfsYHeHeCxxd8V2IUzM294e/3Q1P1fNK+pRywSIbj9AzkJ7uIvtgN
         CkPjWBf7KmzGJC7xzl6LSqVLxj4qhj16r28taSpJ61lmbcJEAggm2fjj2sS6SzEh2NMt
         Th0ztSxnyundaG6DjLIT6uVO1xrl85MBGGzIRUAxVvVp0IrQ21YpZlBO+BlOUeH2x5tt
         hGLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564498; x=1790169298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayPxym0az/dPYYVwbAryo+qLlPY3Bz4ZHUPUVaRwQrk=;
        b=JEvexrT0iWf8PBk47nWDIzana9YQffJnYDN7qes/1AQhVvmTNtFx2uhhdxCDskGUtK
         NDtTlbOR0SsJ5Ady0YtTh9HkrRwtTxzsUv5j7Zd2cJN3dOacuJ7LRo74rPalH89RzT0a
         HN+UZU7Ewmn9ebL7MEt4ejT112dbBr7Az/rcyXmzoDqScCT/oioZ7XrS9vICyLrBrVmm
         rCrpHmCL+k4/La2s2QWaYDmkaiFZG8QR+QREtUp1pR9hz8viXe+cBJmtcPCPR14uNoaG
         o1sH04uNX/qSfy+ouRwan1sUIxr31XAmAeEq9EfYVCH5bxGIoPwQg5R9v2RadqAMGBdA
         Xk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564498; x=1790169298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayPxym0az/dPYYVwbAryo+qLlPY3Bz4ZHUPUVaRwQrk=;
        b=I0+oXxwJ8vC5td9u6zYazl1s1zMLaemh/WA4/Dobu9GUSvk0OeJ0wyeugPIslMueWi
         ZQCFBh76tLan3jrz4bnE5DYOzjnV/atx+T8qMkSg+lKrWmQPPHRw7M6d0rpCsd/zwB6B
         4mXwPfwkhwn29C8e2sxizKdrIKOabzvS6/Yy6pNMVV0ypH+PmKC8fCGt6TgEPjTUNIfj
         FJZVEHaZVEip95f8zKEYZ4O/wz/0TKJzvB/V3njeA8Ri9XReqcdnYX2B80F9S43OzYh+
         igtzFUju5beFMjGFhIKmivmd1Rm9olGth2wrSnjH3irDcdRn1gnKOhs8AYL8HDy1bZR1
         sppA==
X-Forwarded-Encrypted: i=1; AKwUvBwoWTSAqNQ5kKaWWShQL0nHVl/fN82kslzeG7hpb5ZmGG5Y8tX0qD5nYQEJg5wLLsa3xMapjcAixCa/UWs=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ93bF7/cNLOS3w/JigBeBx1Y3Y7xghI0LAFltochlehWUeipx
	3x/lAEBwa87OEQclYrUh8dhyAryhSCUs9uSoAn4Lyfl2FOh3wpbJQDnxefrMDh9TEa2znNlEG85
	6cS+hzhsVco25pw3Z+I3KeE5FjIwmJ04=
X-Gm-Gg: AYBFou3OF7jCWqOS0FkvFPDW55CQrj/uEllAfBl1UeBvnL10kKVJTH+n9zLUgLZzNhY
	caargTjJe8UPg0RgbvjShwM3aRuD8jrTglhMbqXawPyzoSTDx2LSwCJXONSRZTvLJONuX1sc395
	ckSKhr9H5Gvn1FObQ6//1Uz6vt1B43a2NOQVhaYkTldxIMBlk4UZE+MZE2lG/gxkZscc5owppxz
	38K9c447OEZNkEfMFN3lr6oezXs1wwYaZv0uttKowSTInMaXd3CAOMItdsc01bI6iLLmsK/rIf7
	gJv3WloQji1RkNwZx4ld/9Nr6NWqskgRpoqCAWTidLcS/DeoawO26Ta5
X-Received: by 2002:ac8:7f04:0:b0:52d:cf85:aeea with SMTP id
 d75a77b69052e-5327eeb282emr41860711cf.24.1789564497846; Wed, 16 Sep 2026
 06:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916093928.52057-1-palaomer100@gmail.com> <87ecet5xos.fsf@yellow.woof>
 <aqp4GA1q6cLKivZo@ashevche-desk.local> <CAKhZXnr0GdUrEu9vyMAWRCWyQzPM7cWQ6LRDa8fX0hnMkTN0RQ@mail.gmail.com>
 <87bj9x5pii.fsf@yellow.woof>
In-Reply-To: <87bj9x5pii.fsf@yellow.woof>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Wed, 16 Sep 2026 16:14:38 +0300
X-Gm-Features: AcwNN1Vm49ztxlf0ieuaRYYQIq3zlaRFigYw8UrkluaAB1jpWTaPVqREkoTpZDM
Message-ID: <CAKhZXnqBko0LABgLa-A6G+ztt1Y4p6yXdcnGDp7HbC3psv9WUQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with usleep_range
To: Nam Cao <namcao@linutronix.de>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, 
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nam Cao writes:
> A crucial difference is that we can call udelay() in any context, but we
> cannot call usleep_range() in atomic context. Thus, a test run with
> CONFIG_DEBUG_ATOMIC_SLEEP enabled is recommended.
> I don't know if non-deterministic delay is an issue, the datasheet would
> need to be checked. But udelay() is not deterministic either, for
> example the CPU may need to handle an external interrupt while the task
> is calling udelay().

Hi Nam,

Thank you for clarifying the atomic context restrictions and pointing out
CONFIG_DEBUG_ATOMIC_SLEEP. That makes total sense, and I now see why udelay=
()
is mandatory here to prevent potential kernel panics in atomic paths.

I am dropping this patch series. Thanks again to everyone for the valuable
feedback!

Best regards,
Omer PALA

Nam Cao <namcao@linutronix.de>, 16 Eyl 2026 =C3=87ar, 15:50 tarihinde =C5=
=9Funu yazd=C4=B1:
>
> =C3=96mer PALA <palaomer100@gmail.com> writes:
> > Thank you for the feedback and review. I note the line-length
> > formatting (~72 characters per line)
> > for my future commit messages.Second, do you understand the difference =
on what
> > code is doing before and after your change?
> > I understand that udelay() provides deterministic, busy-wait timing req=
uired for
> > hardware register initialization, whereas usleep_range() introduces sch=
eduler
> > overhead and non-deterministic delays.
> > Out of technical curiosity regarding the driver IC: theoretically, if w=
e knew
> > the exact window between the hardware lock/stabilization
> > time (min) and the internal state-machine timeout (max) from the datash=
eet,
> > would a range like usleep_range(min, max) be acceptable,
> > or does scheduler wake-up latency make it too risky for
> > timing-critical init sequences without hardware validation?
> > I will drop this patch series.
>
> A crucial difference is that we can call udelay() in any context, but we
> cannot call usleep_range() in atomic context. Thus, a test run with
> CONFIG_DEBUG_ATOMIC_SLEEP enabled is recommended.
>
> I don't know if non-deterministic delay is an issue, the datasheet would
> need to be checked. But udelay() is not deterministic either, for
> example the CPU may need to handle an external interrupt while the task
> is calling udelay().
>
> Nam
