Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B399D3A3E72
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195635; cv=pass; b=I6qo3yrWZcyds/YbH8vXFWyqnthPdl9PaXBvK59Qj6FVSDQBNo7wPLd842AOscQZegWu87BxfrPwYEz1HEGbz6jIr7svV1aofgqdgDKKzwsXRWBmMpfPCAA7QC6JkVTBVyv2uc+NveGA9FQXiPtCfvHWmjX2Khhb2o3zxX2cj/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195635; c=relaxed/simple;
	bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0oo3hhQ3vp4iXCnQo9HJEV1Wj3t2MpeqlNWowya+L468eEZxpsaEC18CqeFMcCyxm1UTZhiKePQ7RF/6ZtW5Xa8oU5/uSk5CwV1UBLPDeg90iG9f4C9X32ilIf8UvFNeCesCDI1ymTG5V+dZUSyoph3hsjUxaWEgLfb2aL6VH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c25420fe973so98845266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195632; cv=none;
        d=google.com; s=arc-20260327;
        b=S+HG9i3E97f4HdloyyhAV/9wumd7KUt+QF6Ahn+4+NNz3kNDRM+fJShKIG9A2jq335
         9agmCZurv8t7+y9TD41J/uvPQBWqQfT5nc+soOjGi6CQK/U+q1IuubTOZYaSCi1BFPNi
         7bqBG22DkvhiVVYcPkAJ2XtG0+Of01CBHaCRvw5qyjqv4JxD6YaV/meyeFdidCpA90wI
         PEP/VEJ4VxUib1kcwSyYMdiDtLGsNQYz5m1fFJ9RQ09myRJ3vdb6/C4p2p5mrWMm4py4
         wxgzy7/Dh6T5MTtPb6nXLJg7V9KoqI2XdaxhSCGjD/fh3IPWee13iiwjnwkJBzKT5xUs
         diPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
        fh=uSA1p/0mH8mqqkUg/grsFTtCdeT8cedho9hm73fd/yA=;
        b=gQem534n1x0lGEC4kXEJKMYyRb/KKdodzWf9Qw7ZABJXYGdestMb3VKir9iGZ/esgh
         2FgUdzGhSNLUPtoWE559lIGmCEndSwg1HWLIkwOfxOlkOBTUZDWH04ynTDJQkw04PjHY
         5PdukNlCVRQ7jZFlDPUHGuztp9mrbrga7Go3o2G+ZNSEcxWP4T5sXIhPZaaz6mNr699d
         jVbw5E/tbKHuAxvaU3osTCu5VCnH9vRmZSkJAGRrQMTDVsNHHZdqZ/FtavRHEKRVOAPB
         c6r8BJ5Nd77QN5y80MJpONJGViNyOFvX/6jBU4IgoaTORvGqSKwCtpjWfGV1JFZf+KLZ
         plEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195632; x=1788800432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
        b=rdLdrnCJSwJvwHijmtdwqQ1Tg1UNqg0mSp65M59EdHwDnWMuZ4JrOYL3mWpziSH6HN
         5j5X+HArLD44YSc1s3jLHY+AkR5e59NoCAYElqWdW9GTY7hLDBe/59fy2XVeH2P1s1U+
         B+dqB6gczZN/GfWbJo9F/vBIO+BfmevX71OAq/SP92KSxEiu5z+958uMZhuGogOPpneY
         dWOqZouS+5MDg3JEOIulesMC8segGKsNlBFCR+l1shX+UZnSm3MlV/xXD4DqQMyONYD0
         4DDFw/0/T8toOH+J0PqmGeaYFmckJPT9v6WWJsdPEndLxFF274htXVFTFij/SaAMW5uw
         To+A==
X-Forwarded-Encrypted: i=1; AHgh+RrFw4SHpmUyFcBEqAIlGfbR5rJxHdeUyo1snSrYfzzn2lVif6kB3jJmYWg7NE+JNb42X8EDsXNaMvEqLCg=@vger.kernel.org
X-Gm-Message-State: AFuF++ms3UVXwwbYfr6d2/r8kDXdQbbu8FVpm4WKrSq3d1lw4Q602yja
	yEH8ZjKvAHMhqS5pqyc90C6nWb385WpHlE4J32qufhngrh0brmcjmYyD05hM2R8wmXHTiFWBkff
	LsEt83oVTCZJSoqvi4Ff1bu76jbZAi+rxQnxDczem
X-Gm-Gg: AR+sD12D6ofckk4qmSyKXEH6yVhkk0P1CL+M8K4dDHXiSG8+sUAsdOJgFKQ+AWDJVT9
	1CckscOV0GYd9UPc73xr4kAAA+XpCUFNti5HXLukRLiDs1MVY2AD89ctKLhaMXM8/pEKBZJeik1
	1e8hDRzaRj+ivY4TMpvwg/1dr8kkxxVzF/lw8IauzUa10kUhdEJeRfgAIGkSTElzKcwVvB50rAu
	ViHcBtA1JHUDC+nHosHXd0DmIATPc1GGhHw+KcJ6VGo+0zAh8tU576i576nJ3mRs5S0MvZX9kyX
	NGH3zlLxvSvz+l+1Eed+3eeVQuyXTgpvPEjTS/T1CrnX1VbsgsRq0ezSga949w2lnpzvdP3e7xC
	SGThrPoN51XWflM1qIzRVzMWXiPevbpTmFe6Nfd4XotgR
X-Received: by 2002:a17:907:3e04:b0:c1c:2173:d412 with SMTP id
 a640c23a62f3a-c2556fe9307mr1660123166b.1.1788195631588; Mon, 31 Aug 2026
 10:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
 <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
 <20260830165934.34e5b82f.michal.pecio@gmail.com> <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
 <20260831053825.11f1007d.michal.pecio@gmail.com>
In-Reply-To: <20260831053825.11f1007d.michal.pecio@gmail.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Mon, 31 Aug 2026 19:00:19 +0200
X-Gm-Features: AcwNN1XNg3dD7oaXf6xtHhi299wPsa-ycc5jfTUXGnyaxivHR6JJ0HBY77JeeB4
Message-ID: <CABUBpLdLUbC6nj_tKKq4FFmoVNGJ7MnAhE5=O_S4_fnP69jHJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:38=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Mon, 31 Aug 2026 02:58:55 +0200, Matt Eaton wrote:
> > I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix
> > the issue:
> >
> > commit e3d757dc9257
> > commit 042aad8d0db6
> > commit 7e0ef4332ed9
> >
> > There does not appear to be a need to apply this patchset now. Thanks!
>
> Great. Did you try disconnecting from external hubs? This code can't
> detect that, but maybe it's not a problem case. It wasn't on Renesas.
>
> Out of curiosity, was it limited to USB 3 devices or also USB 1/2?
> Disconnecting one device or a hub with devices behind it?
>
Tested both cases: directly and with a USB 2 hub (no external power).
Disconnecting the phone from the USB 2 hub, it didn't appear to issue
a stop endpoint command, so I don't think the condition was triggered.

Cheers,
Matt
