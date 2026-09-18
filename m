Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F23EEAD2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789759720; cv=pass; b=UznSOWvB3fhsJw3ctKPFviM/yEUGENH/FaWaHufL4YFPjGqphm7cx4D+VrXeNT5WsTX9Hq5/oJNRGfTPJJJg02y7kbQ7CnQQLKifryoHcHTj4DJpqqDm3NZdDS8O7CuZugvbnDrBhRHjYZ+mbMmACCKz/oJQLxFKkPIDGXysl9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789759720; c=relaxed/simple;
	bh=Pr9EeiZTbqiSt+KIaAIIUq+kKBnWHyvE8rHU/apYAjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gF9BS0AzgKWwOdnzphi4asdlnClyjXjJN/o5xRtcX/1yniyo6PID0/9HfI7yQYcnTI32G7RDzqR7ocLUJ0VLipff3dTc00njf49M4p89FNZGwxBw8dbaay5Ptbs8Y6OgwqFL8oMcYkRRDjp7OJN9H1GSrAXkuYKmZEbw/jd/cAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wglF7trB; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wglF7trB"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so1464a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789759715; cv=none;
        d=google.com; s=arc-20260327;
        b=BY6JaSQQILrckm3G0OqKVFN2g9+VuudbHGj4m3+wL0vjyxGGReE5l7PEMMii8I9kaM
         oshgnwBXbIq7+HJ8zUDGoEHz+DBL6vE3O4BFE74qG1Ts/MZoP94xNv2KqeSGlXk2CLEp
         IFroc4SWsBN/7vC7E497bpYEqfFm3MqNuroFr6JuXeW6FNpNJCDzYfKxpYaWnQVZ4XwK
         C3CMhA9dEEuWlYPrIe+ZLghaUaJRXJrM3xrrB47J7Cc2dMQ2FaGHUkGzUQHvnZY2Jukj
         yd1pNIv6jXvTQgILg/liAtj/1GuyjVgv5bI9l9geTgjngBJBSSP7S2zjgFzrTj6SZUwQ
         WIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EbHldw+OkWfGVFKKWtG3hDAcOnTKU4jITXx8lACI1lI=;
        fh=Y4DHNlLFMHxPzBOwnblzsD4+SC3h/H33kAyBtiu4W4Q=;
        b=rdJHvIhd5lo8zo6rr+J6MmKDnWEzCiIXYYB7E/qciE4ZqXq927cRmsCVwHBxuKxB4V
         pcU+jW22WMyjR6H+9FBePz4Q8VFiCdIT7duavRTzissZnpq+X7xxBIGofzhcs9ZhuWso
         aksUI6Q60wg9k0e25Ify4+pNlDFST/b0be17F5VgR1u08fwOLyWwmNtGJ6Oz6KF1QYLM
         wDoj4riCpdQ/D856dXikkCHzkZykNcJeADuLiSLGFG6mafjcVJ3/eClYEvZgq3ekOzAt
         9Bp6VjeGqaLvxHp9MvRBPJo6v9ERTDj01X6pKwkusRt47hMFOeE4MTaiGJQV+7tku96J
         W+xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789759715; x=1790364515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbHldw+OkWfGVFKKWtG3hDAcOnTKU4jITXx8lACI1lI=;
        b=wglF7trBk9fD3R+2h31qOtvE+5N9W26pGyXZas/kZ6tV5n7qDHlHfOkHaOeW/SpYPu
         VO2X2QmgAISHV+SiR4Kw+X/lDt2ttJ2cQTBEtQRk4E2E9nQ2RnuEBn3tTb9XzpgXVQQy
         pGvVKbIGLyA+2YkbnqL22fehYg6tkNyITbZAVD7Mi6Ae5xHHidz2zHmkL69qTojWwLTn
         CRyJ6AoqmzD2y6FUCVvJzMZAmxbf1OSIRu0dctl4YX5hdSX22gL20Fi1sTSVO8oAgIFY
         Veozg7+zId8NBjZ28FOzLGmS4LoY6nPtVrrQDBRum7aK+805lghjgXp4y8yBlw/6Fh+h
         xU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789759715; x=1790364515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbHldw+OkWfGVFKKWtG3hDAcOnTKU4jITXx8lACI1lI=;
        b=el1niLelL04HxcOVpKQsM6KIT46Mt7ALiIczLiEsTNr7l1OWsVOi+U/zbEuVpQe8nu
         2xUxiyWD3IzX//x1Is09o12y2bBbt9OQlN4tnjZNDC/iii77ynjANA19tVwAADs1xkUR
         jynQiMTFtDuphxEECuKYBqbDtaieFAm7dDM2OZTx2iESw0E7eXloU7rLjoeHj+J8LcAE
         +mLehZ7lycGp0uL0DJtrq2TPYvqFqPOGdWscimc8gqqtPbAv4QtaxMYXbmX4sUkWsqTA
         t6FMYS1cwcyHRWg2sIhrxtM8z4e7k18QEXAs+wl+pfdmHGdZtDgaNbWw6+mndbJR/OWV
         aMSw==
X-Forwarded-Encrypted: i=1; AKwUvBzPZGloLnxP+AVN5BymJN06BIjFoiJhivOtT+lSDmLej/O0s1/qJx0RPwrF5Ae4z4tjawEnwf6sX77YUZs=@vger.kernel.org
X-Gm-Message-State: AFuF++kyrgxwvWmO1bDtJUqdwF2Ttx3ZWx31iYYu8T//xh9wcN4BUFdI
	+jt/6PvXGEyusBqv5ZNgkU8FDJce1NycAvJ197WZItS1hXY+eoi/sBmhB3IoBr8Q4HaH7x61BMT
	OQM7rwRjeZsB4CCif+yqiTyj27lLUqA3LcDRLy5kLPwNx+FMaZyG+xY7ki813jQ==
X-Gm-Gg: AYBFou1E8VCbYkixmQN1RpzQ6aFOfCJcG25Yw5KqfWIoX82LTLOUOwCacOl0Hg7Yg7Y
	cW2+5txZ8TqSQC3Zt22IKTABGHtIDRDO9HN9XV6ppYqbBwAx+WASiHc+Z+NvoFSg8LMdDW+yj3v
	6wcN7BPgo7oaH7p+IwinaEgJRQ3t8GWFC9ZpFR8AvwhXqr4BUzGoLwXy2BLvYzCjSBQ4zzAv1zU
	lHEF/erj8h/ulgRqrmxBqQlRqzQvM35UaSalLHQpTZx88Y3vBRIaCineM3f8dbW7F85zY/LHUDS
	3Ap+x0zJw4EH98k5yT/nFe25KMzKBa2CMnBp5CM2oIhWfirYXvklj7Tq32i8ZfWjH6UDI5hPZ8N
	QjQb5wd2EqQ==
X-Received: by 2002:a05:6402:223c:b0:6aa:1391:a4af with SMTP id
 4fb4d7f45d1cf-6aa684aa9afmr9099a12.3.1789759714549; Fri, 18 Sep 2026 12:28:34
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917230323.3701743-1-mclapinski@google.com> <aq1KWUXAqQ34ybRP@wunner.de>
In-Reply-To: <aq1KWUXAqQ34ybRP@wunner.de>
From: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Date: Fri, 18 Sep 2026 12:28:21 -0700
X-Gm-Features: AcwNN1XywJRMXvA7_I4z7yu2NHUmIFXps2ss-EHz_Q-ojRYqZb8DkY_9R4A6HQE
Message-ID: <CAAi7L5cjsUrLbcJtBg1DXo7frjdBY0m5x5tUeR8+btU70HP7tA@mail.gmail.com>
Subject: Re: [PATCH] PCI/DOE: Poll briefly for a response before sleeping
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 7:27=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> On Fri, Sep 18, 2026 at 01:03:23AM +0200, Michal Clapinski wrote:
> > doe_statemachine_work() waits for a response by sleeping
> > PCI_DOE_POLL_INTERVAL (PCI_DOE_TIMEOUT / 128) between status reads,
> > which is 7 ms at HZ=3D1000 and 4 ms at HZ=3D250. Exchanges are served f=
rom
> > the device's local mailbox logic and typically complete within tens of
> > microseconds, so nearly all of that sleep is wasted. Every DOE-capable
> > endpoint pays it once per supported feature during enumeration.
> >
> > Poll with usleep_range(20, 50) for the first ~2 ms before falling back
> > to the jiffies-based wait. On an Intel Emerald Rapids system, time spen=
t
> > in pci_device_add() for a DOE-capable endpoint drops from 41.8 ms to
> > 14.0 ms.
>
> Polling is just a poor man's replacement for interrupts.  DOE supports
> interrupt-driven transfers but we're not taking advantage of it so far.
>
> Perhaps you could look into adding that?  It would seem more worthwhile
> than optimizing polling.

Thanks for the quick response.

This code runs during PCI device enumeration, before a driver is bound, so
the core doesn't really have an interrupt to work with: MSI/MSI-X vectors
belong to the driver, and enabling them in the core would collide with its
later pci_alloc_irq_vectors(); INTx isn't routed yet either, since dev->irq
only becomes valid via acpi_pci_irq_enable() at pci_enable_device() time.
