Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFA7192D8A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171975; cv=pass; b=cJzleAN5sXsNhabB8/I12XdqJRVWIwHOIWFGsEcPLnjxFmXc91Pen4v30yP0FTT0twE1ZPMC2+G6MAYaMwLPwZk/Etzdv4gfUvJ2rF9voquc9sK6Yp7cBRRQTSrnr1ZJPqGVvUQp7ri4PHVkv/yxZP9oZ71ozBAkfGaRGYwKx20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171975; c=relaxed/simple;
	bh=rpf73EZEStOwsDS1lr4nwRoZur9RYU/pyz/FypXYRsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ua8znxVeL3qNs3EM/yOEefT06hqXMIT1+8OKUY5Rbc3eOXmqJRA1ZIauxp00lxONeb2NYbdC11Jc4wxhJ7mURuY1tMdEqchQfaPXAMVaSdmtu68O8exYHlce/PmqDrBI6Zce0ChzQTiWbIT0TtWBX96HJZju7Gasf9NFPauNnug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Phc/WVYo; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Phc/WVYo"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d4ddd1d91so4270337b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789171972; cv=none;
        d=google.com; s=arc-20260327;
        b=OukmYdgXZgMZ5X6FoFNer0S8mCGoI7KXBdZ1vsfWcaR+oXAyPPSlEMqyEpV7l/3Nk6
         PdZWN3Y8J+viyzi1eb7Bz/YvN+sRNqyBQNBd4BlvyG8YFt8UkguArDAZzWboBvciQhNr
         WjsiRYSxST1ZQEYxerxYXRt0NEpVmsJwOwSiCoT1bOxGylC+LWFcykRL43ovptHxzVyY
         x2ENnWH3r7zhIsJanoxEgpXf7VPJL/CRltyofmYsK0AUyEI4ucw4NHeXlWtoIaduY+PE
         ypEtU1XlwFO7cGVP03WaQ9raRBKj4HKzRM4IG4hnxnLA3Hjz4sAcmcDhIUbLAvkWW6o5
         QDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xQ76fY6ulaYNYKwPfApE+ipglZPuPZv8sU5oC2IS+ko=;
        fh=hx1pXHa2CgxIsSWfotiAWzDzlMN2aSE/xpY6vYedY7k=;
        b=rlcVxbPwKckI2RrHhEPbwCJRqoLOlmbDXJf+eVusvbbGPckXsAYWSy7iVRuyGctCxk
         SvNC6hr5NmhCoYeaAYB4+sopUjYtWSI1bl85z5e1/YCMm5MBZvj94H4AWEXhdo000HIV
         PXn1kyLcQzU/hlSxgx5fPnd0v5XQYbHxSckyjjgs99hfMo4+6qi/xv5ExebHIK7V0Z1j
         joMkVwdSL+8VoL/b0hc+0MM4/otLCfjYPHllqOSvKliGc6xrXyz8T9QJFEaWhaHmZaBi
         9OquREqTwAJbYMuX+ngjlVHyFInAl2vOhO3CqprgvX9+fewdKZf3iC4Y+BZJ/jY65Qjm
         uo3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789171972; x=1789776772; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQ76fY6ulaYNYKwPfApE+ipglZPuPZv8sU5oC2IS+ko=;
        b=Phc/WVYo8EphJoGKkkh2tehrwqo33p9lQhzuB9TcskQi9/bw9tcO9vCwiTT8nZicUT
         t7Z5djJasaQ+WF8wLTjOZJpaeNgudCQornt8QJwaf0VrHlOY0eqOQ2qCro7QzcyOWxMS
         YAwwKvWpSXhncclQR2ZZUJSd6FIJEU0lnfOa3m3AZfL2slWbyclKolLSVBArwyJEN1F0
         yBA8WDUTeb79undSOcPWQFZpQ6ZtRtMzxJ9bMPZVSoU1ffLcT6HpJbVoIWS1jY7GPWq9
         XPSgsTVAvGgxffLJQ0XoBjmC7HIeoiJ0Oq38SVTg2nf5PewpARe7Ye8R8fi3Gc/qkFJn
         WBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171972; x=1789776772;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQ76fY6ulaYNYKwPfApE+ipglZPuPZv8sU5oC2IS+ko=;
        b=f2Xl03K/W4Y85pWsWuWyHKACV+gJBWPSquecayVFp0BaBTmk425P5Gs3PdWvfLQ+LZ
         7meSTu5ElbbYrD5VLiV1/ET+1/ZXTT9KUynacQc3Jce+BDDkPobE5K5MYk9HK5ZKFIXd
         nt1F+SKejXACAyKJU3NUJXf49XMlu6q3RC+rCPZoahtKCO27K0bC6KUYz6+/Ciipavd1
         2B5M5mnbJgDUwDk/Wpnv/GG1x7G0fLflVvWHvWi4lWFmNigAb/1IL0FCZuHvXv2l3VU1
         8ZzwYfjNqb2N7NBTeVlP57zR7AO+nlDSOjB72VMDtPYVd/oVyLylfzUMKpAnWQN7ttPR
         8Nvw==
X-Forwarded-Encrypted: i=1; AKwUvBytw6Sy6jYfGFowGDsJQAQ5u9xdaxwoxqWS/u+i700ebLDInGnnzfXFRm8HFUowPHMhbp4/mUR5blRtqvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mHImqLM2lKlTatKXVk45h2RHyju6TpmqBcmuj++I++O/SrStp4
	29O/6XpeBbvzwxUdMNyotVgR1v6HxWPWyhTbhoyCm+ClWlw4aibwsK+ptBFNwfEA9IWHUZasiu6
	XDYUeTPVLi3QnMZ8rCta/j+OqHSx6OqAs77WPdD0C
X-Gm-Gg: AYBFou09a8z5N5rzpD2kq+cWxBB1meJtH8cFTsFBbh5Jg702Xl8WxdjXopcb6ABCEuG
	i4Ta3YV4PjWGEplsU5ZcqtMG6Q9Yd8JHTrIB08av8Xvowe1p0o873apJUM3M5nWIpkL1UWhzPoB
	OyXWJnfZq4qBxDdRzWo1OFQ/usdDNnroHgGr46RD/o3eIgX167O6IZNXdt9Yi1B2XHCM6RARZG9
	ksIuo+RpwrFuTselsvWEHM7B+H1uF3502kfE26orDq0PGjGj1rAduClHOUOECmjFwrEuycziWSc
	8/l3Wp3RR9ddO50gkk5UsL/gPCHFe08jxpcuzvDHTX6VxmqKTOZTRwHVsBVNQzHUXdtj3W9jrFN
	Qs2nWDplTVQ==
X-Received: by 2002:a05:690c:314:b0:886:30f8:ef85 with SMTP id
 00721157ae682-88630f8f5d1mr18380937b3.16.1789171971605; Fri, 11 Sep 2026
 17:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
In-Reply-To: <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 11 Sep 2026 17:12:40 -0700
X-Gm-Features: AcwNN1XGf5UCGIDj0-3n6mkuZTqdVzaLGdiWSNdFIbb-PgTGwHhfgg9zPWx-lbE
Message-ID: <CAHreonH0b=spgb2LuUbVvWHarJWf3MOyL8qS5k_1X6gb_mjVkg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	tgopinath@linux.microsoft.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hey Meagan,

Thanks for sharing your patch series.

 The reason we have the bus notifier system here is
 1. Dynamic module loading is handled automatically: if i3cdev is built-in and
    a specialized driver module loads later, the bus notifier receives
    BUS_NOTIFY_BIND_DRIVER and immediately calls i3cdev_detach().
 2. No cross-subsystem changes needed. The bus notifier avoids touching other
    subsystems entirely.
 3. Boot-time recovery flows: For OCP Secure Firmware Recovery
    devices come up unbound and need /dev/bus/i3c/<device> available
    immediately without requiring udev rules or sysfs writes first.

Let me know what you think about that and if there's something I may be missing.

It looks like we're both going in the same direction for UAPI integration too.

If you're open to collaborating, I think we can combine and converge on a single
i3cdev driver - adopting all necessary fixes and ensuring the UAPI and features
cover both of our use cases so we have one unified series (and any
other use cases
or desires we may want out of an i3cdev driver).

I'd like to know what everyone thinks about taking that approach also
if there are any
other use cases we may be missing here, regardless of which patch set we choose.

I guess just to get things moving, if we go one way and choose to go
forward with
the bus notifier approach, Meagan would you be okay with me incorporating your
Patch 2/3 for actual_len for the i3c controller drivers? Of course
with your authorship.


Thanks,
Sam
