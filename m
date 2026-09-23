Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA240DFC8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150939; cv=pass; b=af41vfWLrYxpTrnqWlnr3+0UtI99VEYNp6Dn5v8KVKQgtTSh7VOyHgF1rxwGRvAnGReWMgHlljrvmelc/QlPpLEwLrW/rsC8Y1ECGUjn85gPPrqO4OXM7vaLhZSrqe/khtaJnEciMKPin5jTP2martfEtXeMpV3xUn5roZBAZ6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150939; c=relaxed/simple;
	bh=HO+eJ+xYnJ3aapBaasYQmTQ20IXQrrv44FRinMc3r5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqE/gUxHe0016ir9fYpOnywuwTj1WAoIFEfNIHs+fnQbEQjwY/cgwhaawdYM0bfrqV2U/FuK2Gss1U/d2RReCWNRtCXkxCUFAwc4qXTuF9vmU5CfOhBgpynWGJI9n/YwP8tvqhXQr5yjZsZV/GgtRqMqC2k+1BVzrrRVMJfVBCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VeTQV+CF; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VeTQV+CF"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52faa58bff5so136401cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790150936; cv=none;
        d=google.com; s=arc-20260327;
        b=bwdwDtigww1i+Hjoij329gnTiJ63/80Rz+w7qpQREaXimlkyWqrdfD3CVpZFq8Zh3j
         8UEcF6ZFEUjcUeQ0+QnO2J+1oKjKSv9nJxhxZfPxLM5K26EBWzVmvrv6djoqWk+zYzgf
         LIm1zakOhjJWZoV2vx/D34sY1b5cMDadMy5VF536NcZH1FCzoLzbiryKOfI383mKbuh/
         xh01eDd56b8leVKHvZ5v891aCpRcVW7YHJw++113lMM4rTfOQ8TDzdHgQgrJlONssTio
         Pjwn/4BsMVjLVAnU/9+aUsuGNwdmaW5LskINxOtdZdgVo1zw6dSkdK7TuxN5d8NY/ORw
         1EQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WI1eM2ZtTpVfUjFiAayfQ/0JAeRrdkd3ShivwFg80pU=;
        fh=NjdV/hozPJIG2mECgfABZuGSxMFQCIW/fsLHwAVAa+M=;
        b=ZE1bbCuh0qrZUFtmHBPdIuIznNhpzBwlYBb1USH6KJwd0QBmvrD6H3IMHTRo+QVTmP
         F9A8hr5TO46Ia/DLfNq8qLsBAeZlTiA8LfrQnfT32IPi/cFwtL1qby+WoUvXSuSVUwyr
         YRBluV90KoyFQg+DlOsBnYv1i20Pj9dzrewUjpSLGcepXXr7MGO8uDIlVWxbL4MkD3mv
         5tUbyLwZBsXPCNpJSXu2UgUvhwLD5TzW4v6e5khPMv3agRc0cHbLghYgiDCp1PSC5mPZ
         DWQxFQbIFzn1Ein6R8ipALmTKHaRO0a1CSDLa2AIG6szmDQmHxc+lCFzKHY55/W12fmr
         GV3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790150936; x=1790755736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WI1eM2ZtTpVfUjFiAayfQ/0JAeRrdkd3ShivwFg80pU=;
        b=VeTQV+CFQyaddKGIaQ7juKXyF/bEj/XorySEp+XUpvaCsSvg3JTXIbowJAIgeYwiTd
         yZJGpNWW7YZgLuQ+vjzU8+NKx/bvVoAOkkGL0d1vOOfaurxd76ZpVn3KOcQQMiW4EHGf
         faCsqFKOV188mCScomRmFjxa11pWZUHmTL8hbRc69TdZpsrJph7bDxHrUlZh5hd5i+lr
         7FK8IJ43lQTX8xHKpL30pfEy8NpWp2Sxb79rjfU2wvbfi+qLlREEmOJCQtZqs+ChdhXT
         KNV0BSi3RePrb7B0eQhCaNDvzirudtg7HweeVOgIRSfm98iM6Bp0A4pAEOPBD9QYsTHQ
         M7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150936; x=1790755736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WI1eM2ZtTpVfUjFiAayfQ/0JAeRrdkd3ShivwFg80pU=;
        b=BRFkew3KbW3kfU8vmN0VRwsotlJZsR8J5lDrLKTprKVnfNkq2MgxtzCM92+86byO0J
         J/Ldn83Kv7ko7JKk8k6HtNBfQFAzoAcEICFgGo3MWzzBK5+qpCpBRh49jp6w1cyt9Brs
         NhKGj2ykmCgf69DYwx5v8GzqB9L8CGpqCl6BenfylQvaE1e5DUlXBtcCHImvjqybXPAY
         W6a7TpridN1R1Tw3ARvDf7lWL2nZhSaitdMMUPzHlcU6xKcaeS+gugs3o8mKwLctlRjO
         513NqpjXkYj/Y0d0AD7Tzj7aPN2MGxn1kddIgzdTifvUWEM8OTuS16wbFFitH6Likijc
         IQTw==
X-Forwarded-Encrypted: i=1; AKwUvBw2KU0hK+I2MsTo9aHijksxIYz8vNxmNn1y+kgTOoMlIuzF0FFe/gWZXXGqEkfAuVIVMPT8NsTICuf5ctI=@vger.kernel.org
X-Gm-Message-State: AFuF++lavbQ/UW4fqBWZ4gq2qXuV6MymZEBC1Na0GfJkd+SigPQNJOP0
	ND8a6oc1wxpiGGwRG0a0heAwETYk6sJeGsIosFbfy6nogvQWkifwIao82DOcbrZ6a27G3BWV3VN
	30k1wGE4Q1d+TTjHu3OSn0gOBJUxgs6DiWbLCYijIw2g8VkNuH17ADiXE
X-Gm-Gg: AYBFou2v4afnnS+2x7u5afB17KZzr7NMdYGQa3f1olmvCdA4TD1RGle3eZBsJ/kT6b4
	tWA5r/dcXRpRxsj2k67ntmHXwzGD65tPrTHvesr1hS/TA6HmRLK9NHMna2NpjCC/dPv72QuAo2l
	WeY4oRtgrXsCCCfcDomM23/TIKB0YN9p+fOWfhkd45yYGfwuhU+E+xpvgLJm0k4a48nx0vkTm7o
	s4wi51/Hip9huRtVQnMRKb6xSqG93dlD0E4/0RE3QvTdNELEpmZXZCISA8VAhoY6nLYKgaJ6Pcf
	7oZXzPOIXywgebcFVR0hiZXXuo+q1SZVenEeHbcEedLQUSe06/bsV0QQoF3vwe/JRKbPAqAL74c
	eCJp4kBKtCA==
X-Received: by 2002:a05:622a:e08d:20b0:532:eff9:ca08 with SMTP id
 d75a77b69052e-532eff9cd9bmr5404151cf.12.1790150935912; Wed, 23 Sep 2026
 01:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <89e19e6e-7ee7-4bb0-abd6-60971b7fd601@gmail.com>
 <2026052726-vagrancy-lilac-bf72@gregkh> <f44f2c8e-accd-4ea8-8184-7da610340a9f@gmail.com>
In-Reply-To: <f44f2c8e-accd-4ea8-8184-7da610340a9f@gmail.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 23 Sep 2026 16:08:29 +0800
X-Gm-Features: AclHuK_ZrrediHZyNhUWFIDzwVB9TSB6qhwI5PWg5pLUBEU_Y0vbwhKsVjyUbuA
Message-ID: <CAKzKK0ogStj1un5Vqdzw7+Hq=UyZiav9q++r2-NkMLFiYOHbWg@mail.gmail.com>
Subject: Re: [REGRESSION] usb: gadget: u_ether NULL deref in eth_stop after gether_detach_gadget
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sashal@kernel.org, 
	Merlijn Wajer <merlijn@wizzup.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ivaylo,

Sorry for the late reply - I was on parental leave since May and just
returned this week.

On Wed, May 27, 2026 at 4:37=E2=80=AFPM Ivaylo Dimitrov
<ivo.g.dimitrov.75@gmail.com> wrote:
>
>
>
> On 27.05.26 =D0=B3. 11:03 =D1=87., Greg Kroah-Hartman wrote:
> > On Tue, May 26, 2026 at 08:56:15AM +0300, Ivaylo Dimitrov wrote:
> >> on linux 6.18.31 I am seeing a NULL pointer dereference during RNDIS g=
adget
> >> teardown.
> >
> > Does this also happen on the latest 7.1-rc release?
> >
>
> I didn't test this on current -rc (this is a mobile phone and not
> particularly easy to run latest Linux on), however this looks more like
> an object lifetime contract issue than something specific to 6.18.y.
>
> Also, the suspected patch was backported to 6.18.y together with
> e002e92e88e12457373ed096b18716d97e7bbb20 ("usb: gadget: u_ether: Fix
> NULL pointer deref in eth_get_drvinfo"), which fixes a similar issue, so
> I strongly suspect the issue exists in current -rc as well.

Thank you for the detailed report and bisection. The crash happens
because gether_detach_gadget() clears dev->gadget during unbind while
the DBG()/VDBG()/ERROR()/INFO() macros in u_ether.c still dereference
&dev->gadget->dev when eth_stop() runs during function instance
teardown.

>
> >> I suspect the reason is commit:
> >>
> >>    usb: gadget: f_ncm: Fix net_device lifecycle with device_move
> >
> > Do you have a proposed fix for this issue?
> >
>
> Not really, as checking whether dev->gadget is NULL before calling DBG()
> looks more like a workaround than a proper fix to me. I also don't know
> the subsystem well enough to judge whether switching to netdev_dbg()
> instead of DBG() would be appropriate here, or whether that would defeat
> the purpose of the existing debug messages (or cause confusion by mixing
> gadget and netdev based logging).
>
> I could use some maintainer advice on what they think the proper fix
> should look like, and then I'll try to put together a fix.

I have just sent a fix series to convert u_ether.c to netdev_*()
logging helpers (which safely handle unparented net_devices) and to
serialize dev->gadget accesses with dev->lock:
https://lore.kernel.org/r/20260923-u-ether-gadget-npe-v1-0-ff466c55ecc0@goo=
gle.com
If you have a chance to test the series, a Tested-by would be much apprecia=
ted.

Regards,
Kuen-Han
