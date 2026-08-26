Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EED7419FCC
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751021; cv=pass; b=YRF57ePBa+KsGam7w8idpZShU0pOw0C4UguHVnhYNNabu8/y3+sv3HcwkCUjAHg6cq9hSBj++r54S+wJDuyURFxI0N7lgxHolS1DqaDSmIIUXvHoCQZofHM854kQyEOFK2M9mttft/PN5kMTv3TNAP49YrqIxdeDKwYA3nNhOiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751021; c=relaxed/simple;
	bh=4+QUItlyexEop5K9IQobQUIL/V1hyVSBQdXhjfeRaeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQPVQWd9953SXQno5UzxLK+1c+96jlQabvuKMi4xIXIrXODtPfj6YxezXxUciFOFmQT4TFG0lTbUmt0YIaff/GX7nQenAYs2LfMCJz8W+trrDq094RB0MvzmHXXjtgHoh6enMOzGOv54N4YrhCEuNPWKHP2XMMbWekmxlwDv5i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmCWZKlY; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmCWZKlY"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso722668a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787751019; cv=none;
        d=google.com; s=arc-20260327;
        b=MYoAsY3yelYNTnWg+RVZ2+krDCS5zjNF+dGXahDPcUMkZHT6x4YgQ6800f4MQleG5J
         Z2vQg6nPN6J5IZP9YBa/RG2FAisOtv3kEvg/KSLuFvYH41+N5BOddbLTvfzvwvcjbt9R
         vbngj+FHu0u/eQsRoq/BPHd8Lmyw3UEvStQcLTxBdULFe0Tum+A84SW9muNauz0ev833
         fjzoHtG2/wr5xQDIAMqtt/TUNV7b68vSRtwQhRhaKfAGu8KeI8Hxd3O7BcnxVdykzvaL
         zls5GcrGX5CpP8z39SHJW7LAJoEfjjV78bbrj2SE7PHGQLvF9k85G2AjMJql+CCBLMCB
         NZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tGBMKdRDFuO6C8bnLpIsM/DfKNnhCL7OaTYDIwnax48=;
        fh=kZnwrc1BK9LMUo5ftNZZQe34JuQDQ//O7+E4hg1rU9I=;
        b=bhBKSoYoKsWabZgaWN0yphzvoMl4PMrnZGcT+PZ4ch0L/+zUyf96H3RHC1+CE/pdmd
         zYFygaWc++cYSZ8A/Anxn5NcHK8xonVcU901vPNV7CYsie3mZNCU6wSwfk1pyLZzHcw/
         fzPB4I4h25PwJWsMjcGwBzh/rucnUJqzK8N4Bni+0FusJXoWGF7M+a32VFiRAPCmW32+
         cqbaLR3T8fW+7l4MmXVm835SsubDuO7PzRiyAZdWJc+eqn/x0FyOZ3YHoKaxvs8SQAuq
         YTpc/8JHq0akpBhqFFL/+nd96jvEA7Qg+hZSVqiMwKsrbv4Sz0pAtOqKpIwMVtt1rF4d
         Lfbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787751019; x=1788355819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGBMKdRDFuO6C8bnLpIsM/DfKNnhCL7OaTYDIwnax48=;
        b=OmCWZKlYw1c+XOFGoXmEYq9Na1AP7IYP+CmM5TrHwzPd7lLh3OCLBqnZRu2aXMillW
         jxnyVTcItuGF5OV8CHGffrhr44Mb3nt7rgkbXcXfI0hjGMjP1qHJReQD+S5gf2pjqiMG
         ykFb/jFDtpfSzyi39BnXYE/htM3FXPvsgPfKyZC0u0Sp2M6LtaUf99feZ1TQefAnTnqs
         6QiRLs39op0A1CuuDC+0TAnx1zmaCd2bkD1WSjH+Ja9bpWgwlw0EswQXU7/CvZsUdp6b
         l6rVR37V0+8tMke/7FI78BIJ1ytH1P8KrJxKMNkOs9mEeQQn5Ig44Zm2CZesQ8llJTAu
         iYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751019; x=1788355819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGBMKdRDFuO6C8bnLpIsM/DfKNnhCL7OaTYDIwnax48=;
        b=OErwkQfxL1M+H8BOWwLm1h0qnDonFau+GDR8j2J19+dLlEmQmoZ3yw0beUs90rUxX6
         EFeg79Ja+fz1IKIyr/6X4hYnkiaTKu3VyjTXM97rrEghjr/LCtkLCPh7XbjloTR9j6CZ
         d4k7pbqz1XdHGbswcyTfZJ4KCWtWxAGb9qaMLspYMKeBiKmMNbgnx0GwhCFWPkxMNVrE
         7wqjt8Z4oUzDfG/1Qh6WiX0j1avCQhoYSdI6z3CS8TwCGmWWwVeinflR/3y9cEghHa5L
         SKFmyNvT6H8843JG6rgEjdB/giqwscvR+GFnULs/FXAjyZGFL8sKYX6Q2959RlW/oTHM
         8UDw==
X-Forwarded-Encrypted: i=1; AHgh+Row9+yGZNXtv3r7Emtjs2jt1v+rU0QCRRtwiGnCw2fvXzazNdGPuaZQKq7DOzMiHNOs35XAqPxfpInLF5s=@vger.kernel.org
X-Gm-Message-State: AFuF++kHG09UIe9NYYsaUVveEDNSdFkW97/iVksFrBmZAZlANFUANI89
	Af/n1GW9JFJ/bhTvToMnk/m6v14yE+l8MBEX+HHw8BpLAb2dEr133m/C8VFAy2YEBWWVctdNmwv
	yCsQ+8OBWCxUFGX7Ua5M1RPyhdKvuxo8ZuaoUQofT
X-Gm-Gg: AR+sD12PipHPPtrGuhjfsh9CPkOKQU+v/haCGDCtnJUB6RbIR9YNLsr+4AT3eCCLnCy
	O+XQrat06nT5oni1VlDLuQqwJ8Gp46awn/Ryp8GAy53he7ibLXP6xN5jLCCnXK5w6IWL7vDeUFE
	xgQHYdV3vi65POzw5azLfab7leKWmCuXBA0gDim8DPxGL/qwzhrsyoXPa/Hoh0sVr6Pvww3Xahu
	ikES9taa8h0WXEa2KoercZTgVOvFGBqYCvizN0wZm3nftwAcRCJUT8AJzAgD9GrjvGfdgKHnNM3
	/Uca8LqIsHv8PxlummdecmrbLVyXEf355wRjpdgPPiIA80ku0LCVdgKFLcHw9Z9Qd988JExlAFr
	K3tVlkXzTCbmBw9SaUitYF8PKHnDaT+mGVbQwCWQ0n+vrCHHOpVTMNw/9koVV8Ss+6m0GjAHR3P
	q5JWhquHSlX72o
X-Received: by 2002:a05:6830:6690:b0:7e9:df1f:6a19 with SMTP id
 46e09a7af769-7f4c4bf0713mr7367085a34.7.1787751018570; Wed, 26 Aug 2026
 06:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a6a966c.86abc875.e5c3d.0053.GAE@google.com> <6a86a5b9.4d75e56a.c9a88.0036.GAE@google.com>
 <2026082038-providing-huntress-55e6@gregkh>
In-Reply-To: <2026082038-providing-huntress-55e6@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 26 Aug 2026 15:30:07 +0200
X-Gm-Features: AcwNN1VEiQcaoAs5WNLCReb8twNJ9S1NHvJs824bh052v3ANnZqGaZ2BMBC8xIA
Message-ID: <CANp29Y4L4-W9nx1DHrkEmn=9oDr=k_A5FLHcKLo6a74DL-X9fg@mail.gmail.com>
Subject: Re: [syzbot] [usb?] kernel BUG in register_netdevice
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+85ede281798faf736677@syzkaller.appspotmail.com>, balbi@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mcgrof@kernel.org, syzkaller-bugs@googlegroups.com, vvs@openvz.org, 
	Chuyang Wang <wangchuyang2003@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 9:08=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Aug 19, 2026 at 11:59:05PM -0700, syzbot wrote:
> > syzbot has bisected this issue to:
> >
> > commit 425b9c7f51c98443db71ad679893725483b21196
> > Author: Vasily Averin <vvs@openvz.org>
> > Date:   Mon May 2 12:15:51 2022 +0000
> >
> >     memcg: accounting for objects allocated for new netdevice
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1212ba25=
580000
> > start commit:   e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' =
of ..
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1112ba25=
580000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1612ba25580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D46f568dd8d7=
95f6
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D85ede281798fa=
f736677
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D156b25495=
80000
> >
> > Reported-by: syzbot+85ede281798faf736677@syzkaller.appspotmail.com
> > Fixes: 425b9c7f51c9 ("memcg: accounting for objects allocated for new n=
etdevice")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
> >
>
> I strongly doubt this bisection.
>
> Note, syzbot has gone on a tear lately with USB "issues", what happened
> to suddenly cause this?  Did some new functionality get added to it such
> that it is wanting to stress-test the bind/unbind racing with gadget
> device setup suddenly?  What changed to start all of these reports?

It's a consequence of using LLMs to generate seed programs:
https://lpc.events/event/20/contributions/2619/

We did not specifically aim at gadget drivers, etc.; they just
happened to be one of the areas where injecting extra seed programs
into syzbot led to a lot of new code coverage and thus many newly
observed kernel crashes.

--=20
Aleksandr


>
> thanks,
>
> greg k-h
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/2026082038-providing-huntress-55e6%40gregkh.
