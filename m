Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309009;
	b=CjHxLt1QU9FuSmXkA9b9cjoB5f1R5jjtnq02+NCsCuGm4BsXwVjqeOX+TueJ4nwwLI5U
	 K3u/WmNKOs0HjoVEX2VB1tFiozl0hv3t6eVTo/om5okALtn9KVZ/Kqas654xWuhvAfk/h
	 oEfB4FyKoF01KElJVPSnMXb9tBjCLNMNY3/x2zlrLitcAC0gd29ssDcpKIROhknQr9zRA
	 hEnAOdepaPUPYwlMKM9lrm9i9bR7nKYM4DhSyFWTw8pWOIXP/Fh7WPxHuYVkyxVVpZRHB
	 fgOYtd9mtTQdvq8yoEnl+sNix/aH0fl+YANTPYg/bFxv2oTKPFqiQ1Xtu9YXpawCwOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vZ6sfD1Cq4yn5SkeI0KItQ3A6Fhy07jsp0RUWk2vsno=;
	b=BqB0XcugN/YIhZm7dwxMlgIL7Zk1StUEADRRKxW1KtluKfpPaHeV8x8j3vVisO8F0K2s
	 pKzrwrqR7vQPlg4ueA/OWh/gwnonw/3SakQ6zCfLzPTBAN0RcMTFt0vcnRAZbWkyykYyR
	 W93dHAoc8aNWSv0nEBnXKpXsqCPoCZXseDwNU/+pa16Av2ui0H0xO2bDyk/XsEuJNWs+L
	 d2ZlQ5B+IEhH6wsFK+viy8xRqtbndwxBAPY8srb0M3fd+JSNnEapqdVmS+LkyGZlH8Amb
	 Fk275Sa3+1FvoZhq4NZ3wWZX8qvzJYx56eLNtkzTWLa4/DaNmw8F0YdBOHaIKTaK3aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUpItgfd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9C8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUpItgfd
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-714d57774d8so15281eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309008; cv=none;
        d=google.com; s=arc-20260327;
        b=Ve01+FYno40wJot95pHkgVN+dmLe0F6JGG+5omtJJkYU3T9l1C8HdgU4vHEFkkjmP+
         cIRmwOtIYVfuzPMHwSZxYO4+K3MpmfaZ3+n/tiQZAywCRTg/B+siwA4sk+wuwK5A6hah
         UaIz8QpcDE03Ej1m3D7FcIugUQ4liXyIUVW2LCJbIvE4BYF6oev/Zgdtb9lnyH79zMfu
         hW1SJpj+T4wFEimUIGntmhf4jTCa/83WL0+bTwoH513XFmKQX7GOZWEAY57quiKEk3Jy
         cmcpEGS+H0eTx5cwZKxsC8JJYiSwfnWpMSp5QcU2hNHU9EteXPqStTaLM8z1aqO066OR
         SARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZ6sfD1Cq4yn5SkeI0KItQ3A6Fhy07jsp0RUWk2vsno=;
        fh=fheF5CLhTiSz/ZHqJD5wFc+W2LzM/luzfLL+Ahl+RuE=;
        b=LqUxBodqYgZmtJo/5kie/r94RRqtHYNtSgu7K3ZlKupyCJ02xjJkP7Fbx9GrcSHvo2
         Sj7ZDjWHMCejQ8r73/RZpWkN/pbVF1bmg7GcoZRYwj+upVJEy8CAc7LHLiot1HQyu/2U
         QhrXxIPdkYbT1Xo1hisQJFQDOANjLvmPylkFTHu+ydOA9t2BQkl7P1JXzAXhtyT40xIv
         SahUhnek+PSsmZspEfQsgd/Q/r7qj5GcfhODrWXzBQSCqdHoG0SZS3ElspZPUoPKyD4G
         kieAR6+hm7szck2sS4OdSHEV//WR4qbT4tX4gX3Kn5NoTwzTVzkkaHnIbebZ8amrErXH
         PnqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793309008; x=1793913808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZ6sfD1Cq4yn5SkeI0KItQ3A6Fhy07jsp0RUWk2vsno=;
        b=gUpItgfdkLL5cunEs15SdHYlNF/SX0yUwlUrFqZRBN0nclSxu2fka2abPtUQVuWgA2
         Rs+mD5bNbUfLGzlaJ3UfN3P6rLMbUh8+99f9KqEpw7VbOW/yqI1+dmtjV3vq1aaN67Cw
         eYCzA00VecWb9QXkKh7M7z1C6+9zLH51gFq1vr3P+zYeUH+6COYyG5YXZF1CVDzJ5Z51
         q+1QR9z51TSo/VNvja3Ljw28NF92svvRnuMniBTyAo49WkOD57KifaWXA9sbKUVccKp7
         gHPY2mtasiymhm1vQ46nbhGoq6uDctMGaOpZMAUX7TFKJzuM+H/9flwEylFBAYffGLNg
         JmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309008; x=1793913808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZ6sfD1Cq4yn5SkeI0KItQ3A6Fhy07jsp0RUWk2vsno=;
        b=WXtWs+J7wqPFsSwHgFOiYkH6WkTXNa8OefkdMTMQul2EIaYplWzD1iRq1aKJzmbM8z
         yF/Xtu01/JPFjdtBW46K/sKQ9ylfASLL4rn2tec86OY3XBNlDFqtyZ0o8QhtnE5QILSF
         f/wDHI9UGyyD1cTziwyDSYMcP76ONUvykLS4BpiSc3uq0rL7YCNeRoeELIkj02zfhab5
         6dvVck7lUs21h51uYrKI+dN6dD6XwBt+7k6z2L6im77nVt4C1UecpqjA11v2fhyU3cjq
         696xZBKKssQwruwEeScr08bc2P7R9rLTi6DdQ7AxO3oQd758S8gtP9jfLA7IDe7f3A+i
         nv3w==
X-Forwarded-Encrypted: i=1; AKwUvBy1B4DSo9ttyMFFKty2P2DSvW5e7e4r6OzhAUJXx342r0L4REU2avEBfe13QdjOGS6FHwLX5mcULTC0pTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVyIp08ugg9L0bHUcJ2/pANCmrbFk8b+xQK06Q62OSdRHkiFhk
	mjta+DAQRiBvmPxbOYE6OQkb4guTuNo1XWZ1Mb1aYqjP1CpKaUed8KH2ctN3zMrZKrUgL+4u4uf
	Rw620yADbXOmzXnLn6dNhOjWLXNMAjv4=
X-Gm-Gg: AYBFou0usDxcEH/0L+6szpx7wXfblQ3xHqsOoZ+0J+AQAkHPL9Gy1J9oz4pRKYqRGKl
	1H6reXoiOs5AX/Z0gNJ4aq0eOgiBdi5/pWjFgkawEKp8W110bDJPuBs/bhgf1zugmeQWL9oA4Zm
	wNWyNH+/e6CCGkTnRSTnM7BLlP+asLTsV8cCXjN1pFES1oYBXLOQfocbuzJSREcULb7KDYKD6+l
	LASoxyQ4ONqqlKLJXySCjkt8zgrrpQBjbQF04RgDpDwd9jy2yOGyJ+Er2ZibBZIMODrM2i54gIW
	GEswKlJQ/eEZsyh/ouW54BDMHSWXRMv60MgPRpNp+SBQmhuqs95rxEDI+M5gpYyuPijupRG//wY
	w8MCBa9l2qqzQCNure6MbO0YAFUq+25XdiGI=
X-Received: by 2002:a05:6820:c2c6:20b0:70d:7738:4089 with SMTP id
 006d021491bc7-714f1fdca82mr350861eaf.12.1793309008049; Thu, 29 Oct 2026
 14:23:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027143725.3763827-1-zakbrightonknight@gmail.com>
 <001101dd6631$6167dbd0$24379370$@telus.net> <CAJZ5v0gVkYuZAh7H8KFakN+vHkJTjzvmZsLrUVP0MXkaKLVoCA@mail.gmail.com>
 <004401dd665c$97eda060$c7c8e120$@telus.net> <CAJZ5v0gvruWF7VhVuLrn4AgV9_n6Ayektrh+jB=eLY79ufw4UA@mail.gmail.com>
 <006601dd672b$a7d67f90$f7837eb0$@telus.net> <CAJZ5v0jAG7wxxsuynPL3fyo8Kr3sLCC75fpm91JADuDpm10QZA@mail.gmail.com>
In-Reply-To: <CAJZ5v0jAG7wxxsuynPL3fyo8Kr3sLCC75fpm91JADuDpm10QZA@mail.gmail.com>
From: Zak Brighton Knight <zakbrightonknight@gmail.com>
Date: Thu, 29 Oct 2026 21:23:16 +0000
X-Gm-Features: AclHuK9V9JWbjsDCzchj_juYJIkpV7hzVU9wWWFiHxj1haJdv49v8jpThBhi4aE
Message-ID: <CAJsH6h8JOZUCjvNA-SDM0ziG1NoUCwh860k8qjVAs_v60W64Og@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: intel_pstate: Restore P-state request on resume
 without HWP
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Doug Smythies <dsmythies@telus.net>, linux-pm@vger.kernel.org, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was about to test the patch when I saw your message. Happy to test
any future patches!

On Thu, 29 Oct 2026 at 20:52, Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Wed, Oct 28, 2026 at 11:28=E2=80=AFPM Doug Smythies <dsmythies@telus.n=
et> wrote:
> >
> > On 2026.10.28 08:54 Rafael wrote:
> > > On Tue, Oct 27, 2026 at 10:46=E2=80=AFPM Doug Smythies <dsmythies@tel=
us.net> wrote:
> > >> On 2026.10.27 Rafael wrote:
> > >>> On Tue, Oct 27, 2026 at 5:36=E2=80=AFPM Doug Smythies <dsmythies@te=
lus.net> wrote:>
> > >>>> On 2026.10.27 07:37 Zak Brighton Knight wrote:
> > >>
> > >> ...
> > >>
> > >>>> I confirm your findings and tested your proposed patch. It all wor=
ked fine.
> > >>>> I had not seen Rafaels's reply about a possible race condition unt=
il now.
> > >>>>
> > >>>> Test computer: i5-10600K, 6 cores, 12 CPUs, HWP disabled.
> > >>>
> > >>> Passive or active mode?
> > >>
> > >> Apologies for the incomplete report.
> > >
> > > No worries.
> > >
> > >> Passive mode has the issue. Active mode was fine without the need fo=
r the patch.
> > >
> > > Thanks for the update.
> > >
> > > Please check the patch I've just posted if poss.
> >
> > Because I had already done so before this email, I tested Zak's V2 patc=
h, and it worked fine.
> >
> > I tested your (Rafael's) patch and it worked fine.
> >
> > Tested-by: Doug Smythies <dsmythies@telus.net>
>
> Thanks!
>
> > I have not reviewed the code and will not have time to for a few days.
>
> That patch had problems found by AI and it cannot be done exactly the
> way I wanted to do it because at least the userspace governor depends
> on preserving policy->cur across suspend-resume.  However, there is a
> way to force driver callback invocation in __cpufreq_driver_targer()
> even if policy->cur is equal to the new target frequency which can be
> done during resume.
>
> I'll split the patch and submit a proper series when the AI is happy with=
 it.
