Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D1A533588
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888770; cv=pass; b=M2X7CoIe7BYa5SF2AFmEGJ4te9aCw1eikz4l6Sf1xcmvqyMKo+ZE9sUEuZ0OfX9hC/xlMgjrG7pBkegFljRwKx9RVzlTqQI/4FCquIme5vY/VJHBNY6vdKYbKFhLz8lxl+sUQxYXtfJ3BgxEnbtluCEqYoAo4dc/XqjjvZKJtMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888770; c=relaxed/simple;
	bh=xN21QYy0yGgz2sHT1nXnC/21nVEwjhkQB04Hg4E+rW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS1vU7pgRkPlQNV8/g8Hmv+5eixlw8nyt6qDEmTV5ldFfn0yYKOT05YGnCzKE9IzeUMTjuHDMo4yDTMPztYzHtdX/eIl663LxKVW2F9vw+xxtqZEyFZNjBEtMt842/uyeW3n4J9t/yZURdnlfZ0LMj4i8HHq83Za9SQnbaNucW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CAwV36pr; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CAwV36pr"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86efece610cso3472109b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790888767; cv=none;
        d=google.com; s=arc-20260327;
        b=RAsKB1UeTV+Cj7Vk38C0rp0N4cBZgXPm1qkLCkdIU6ltQwn5HdsHkzNYigWZbcstCA
         sBUJ9LKLFaiK0bp8+gXozbvTJ9sLR6/2xfp+iyIzse6EcYhFVbNA7Kt/X/ZtWlcm9kRK
         EJYOMeBWsEU/o2kMnvgKrWMfhylEA1OvetGOa/pjzbGD3XEdfnOzA3FWEjsi8dwZvljS
         yt//fZ0W5TJP1DEYyFITeYZSag7Ukjm1IfjDybhBVvcbE+J1WZswSXGnqKnmaph/HiCU
         fwCHpoINQYUs+ZQz0bf43swpRINBqw4rzJdU1CrjDa6bRjuSRTXWPkKfe42MUq4MKxY0
         1mfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        fh=gmtnmoAPMU/9Z15i2YXFAZ5wur2pItNHP0+5lKic+jU=;
        b=p9Sj6IcriEwZMcu0GEImJc1gzgSaJJxqWd2BUpsI9Ai3r43gMb9TVx3qJ7qrnKJGr/
         dLVLapktDYpaIX3iYKplSeA9weJaZNSvsxx2MGLjN0lnK3vvLm9AA53wBBfYhKhw7FeL
         5W+PeuHNVGZVrQuIA+IetjjyaoeYShKvTSqM4LR6OcNtMM1nZFhmY56QZEh7Q11oS+fm
         JxvSIdeGQmFBbRYfoNkIJms+n6iJmFr4x5xazEMDCm206Pl0qxOJZYbUPp8s9ecUA6Ft
         6/RtaIwR6CSo7bS45Ss4TIzil4MxJpw42bHgnXou+KgUSAPfBMSPFUaS7TZshMK2x2Q5
         J1Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790888767; x=1791493567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=CAwV36prXHOZw2NRE+aSACbPdDsBf2SHqbBYA6oNTHRxcIGcOyC/CJqkRH7LJRevOZ
         ClcJMU2t93f7XmqqwruK0c5ZXJiXQfI/+n+w9nHyb4EcEh0EZTu11pUBC9xzrVuOqKBT
         YsV75j7RrnJU55Z+JqH44vXWfdCbI4I+NCB8980IdTgu7vzPMxHvgU+uCw/+FxPpgY0h
         63X1M3w+g/hILuWVI8qWSFmlSwv2NKZwGdJ2DwWfYsxtFTA/lG+C3YADiA4myoIGj7HP
         Z1Ev8yhuTUNqN+BrgGDh8F6GLVD0gbmqkkcnf9FOFy5sLyuxAa1XjcNkIrhbHMfk8YG5
         z0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790888767; x=1791493567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=j0G5+f/0/3rQ2abZAc4KYrlTlfsfsmFE3ixdsjAf6XyIbddG/LvxndRQrXO8G2zc9n
         faxzz2G9tQQVhFDC6ajUD8Y4k8uO1jLjT+fYYDlyVPg8BOSY6OeJrDzLO4VFeMbrZLm2
         62NYUq4wOEZYHEG+/R9In24gqLoxUzXrSj3cUpkliVPMwE9c5rTjEscB94elkGEH3Qn6
         P1Ab3Kq4Alf2D3ZWBWiIv0j7PCyqQIs6VNficEdyKJRghOjTVtUpPhh76Y5mCKpjHW1u
         471UkezZo7RWjnZ1zuOiDBmHmedNP+ycVEKVbnEZz7rzv45x3MPQGA7k3YF4IICD/83z
         lStg==
X-Forwarded-Encrypted: i=1; AKwUvBy9und9IzTq8JaQ7Sbj+tXI+VN5WFWT94LUKs1WY+nlZAPX8AccdPufQIaxCYVGwgLA04npK/3eS2KJOko=@vger.kernel.org
X-Gm-Message-State: AFuF++nz7p1+uePg0IrOacK12AkGzZSSuFCuJ5eE5TFue/ajj0xizZBw
	A8MfUV4wtUlV5kGewIy0LYnuPUdqkRsMxExHmjxIItc1qNC2etWQPN0X919R/1m+fOjBH3g62dM
	g6aOrWRGJdckg4T2ZOnWAcbG8DyGZPaB22vjxds/c
X-Gm-Gg: AYBFou1h3PKevYrl3FpDZ7QlKloFO2S5MqFgh7K4ISZHLXaCGIryCS9fiuXAXD15Giv
	0g+C/qQ2LH4tveXV49e+1oHKZGC3WQhdhJBeCOnLYhFyIDtP72pTn3Iv50so6tJ9XVuLXY59STY
	paIkOEJhhMRdpjTRG0hNiSemrYZD0unlvNVL2eFOVOpir/HOA6fGcdcZ6Uau9en2S0z0bFOJiHJ
	ykuNOVzzXAc/9gHCPryOV9pKzjZ4lhzTkU+MJN1eXGiyoDQ6ds33J67Qq/O6AEcZFmI+lK2Q6Eo
	pyGoOz05ywZpp1L0/lUBkos+oyKSHCbzdKBjR9QrZ0GEwuozoLwPmhslg/bg63sTiSssw2PQI0k
	mZCufc4nP8QtZ
X-Received: by 2002:a05:6a00:1254:b0:881:5dcb:400e with SMTP id
 d2e1a72fcca58-88af6d24f34mr727169b3a.56.1790888767004; Thu, 01 Oct 2026
 14:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com>
In-Reply-To: <cover.1790088067.git.rrobaina@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 1 Oct 2026 17:05:54 -0400
X-Gm-Features: AclHuK923qNeclwyxHc-N96rTW9f--kU_8IWc_3FVDcJfFTXqnWMr4asd_Mjppw
Message-ID: <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
>
> The SYSCALL record currently logs only four of the six syscall
> arguments (a0-a3), silently discarding the remaining two. This
> leads to the need for auxiliary records when audit-relevant
> data lands in the 5th or 6th argument of a syscall.
>
> This series extends the SYSCALL record to log all six arguments,
> by adding arguments a4 and a5 inline within the existing record.

Thanks Ricardo, this looks great!

There are a few things in some of the individual patches which I reply
to in a minute, but there are a couple of "global" things that I
wanted to mention:

* As pointed out by Sashiko, when you were converting all of the
arches, it looks like you missed alpha.  I took a quick look and it
appears that it should be a pretty straightforward conversion like
most of the others.

* We need to get ACKs from all the various arch maintainers.  Aside
from the parisc changes all of your arch specific patches are trivial
(and cleaner than the existing code IMO) so I don't expect anyone to
complain, but getting ACKs will likely take some time.  Even the
parisc patches aren't that bad, and arguably they fix a problem for
seccomp so that should make asking for ACKs easier :)

Since I expect chasing down all the various maintainers for ACKs will
take a little while, and I'd like to start getting this patchset some
basic testing, I'm going to merge it into dev-staging now.  While the
dev-staging branch doesn't feed into linux-next (this isn't likely to
land in the next merge window) it is one of the branches that gets
tested automatically and included in my kernel-secnext RPM builds.
This also means you won't need to worry about keeping this patchset
up-to-date with rebasing, as I rebase dev-staging as needed (it
intentionally isn't a stable branch).  Going forward, if there are any
minor changes to this patchset, e.g. a few line change in one of two
patches, please just send a fixup patchset based against
audit/dev-staging and I'll squash it into the relevant patch in the
series.  However, in the unlikely event that a major rewrite is
needed, just send a new patchset ... but I'll be very surprised if
that happens here :)

--=20
paul-moore.com
