Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F51247D470
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436451; cv=pass; b=MwLrW/epXeTL/zsB+w19SJtEmrywd1f5RU8lCX+UoDdmy50HxM1TnXorEu39td8pkJzst6GBcHupKVHg3/0fWUytMv3iTKsHhl9V9mqLRdI5+CBoHzH59+Po2pYZcOEQU6Jx7wNvdww/OwhPTN/2fOM7Gzgq5RaoZ0VZxxbTgyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436451; c=relaxed/simple;
	bh=cmrmJFgNXl9cwByq4wccjkamqLrAgOAlhe3K+qkWDxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzcDixXeMqWsCjrYjYjsT8r6YDXIIb09+nLMnWCYkX0IGduCmlSjb3t0+l0vhrj43W/+OnvpjdFuyuijFD4MT63cTM2T3sG8GMHWyXY7/Saat2pqyMUVSIyyoz6LkIXHfdNjG3dR+OCWkQQ32HDoh3Su735QH4aV8/90N2QL5aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOZQS0+y; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOZQS0+y"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2529633a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788436444; cv=none;
        d=google.com; s=arc-20260327;
        b=a0xE4eI+YTyru3mYxJYPbpudZNe5uRGT6GIepIWkNKQrmKRtFaHUT7NhYrQ8YFy0AB
         QZP0u4KoQcfqPdnlXoLQAm4SWscS8Q8UyD6v4TxI8oxE+XGykc7beoG/2hyag4MlMHQO
         Nhh6hiINrWfB6myjCU4o4mZk7dTcvWYX+Qu0DzJh2DqBANcFdJiTJRlYdjWEQf/G5IFQ
         17GoBf47Mz8pf7Ahdm79uKDua7aw9g88aqwCCDe6VKiCqk1JSN21K7ZHObAxORVdwvb1
         vvq2Nh1v4XP9B80Z2eoct0M5y7+69IRWZi62ZjU1FW9e1Ae/DCcw3QS7+medkfGSCshS
         1SAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cmrmJFgNXl9cwByq4wccjkamqLrAgOAlhe3K+qkWDxo=;
        fh=f/Hn1QybQX8q4fDuSc+/60yqZNrNgszwkicJ2PkzUAE=;
        b=ZidgOYVyS5TiG2JYU9iCM/DJbmJd19IMTR86C7OaDYO/SiSmoi5zMT+VYxIej72CE2
         ETz7+W8zn1R0CuddtcG+CmyHVivRV3eY6IATra1pBBwxWUc2ZotaXoUKVURQtZDAXy+N
         lXAFdwyjZzznawCbJVJLMqCtqoTvrb+FjM+karWfqtI8LEKSgvMUXK1g3FpV9F6qusLu
         5bjMh/wu65Vm0Y3I60zLnoSv1/ruz7uLa/GI6RUo2v9vbJDvIpI8e6un0aX+1/JUnHsh
         xaMMQGOwwgKIKRQo8uXAi1COsihyMoTFfsh+QpblFHOiiZjvQcGPEFdxhoJRtpR43Tot
         M1og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436444; x=1789041244; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmrmJFgNXl9cwByq4wccjkamqLrAgOAlhe3K+qkWDxo=;
        b=oOZQS0+yEEfqtdVqvAymA2Od9R+g4vrT7ueq/oiO3JMQMeeGJ40Pz4OGTuAGPLyCHj
         ymIcM6kIKVrV5Uszp3m5JS0XeFTpwf4uASQqxaR3izCkjrQgpRCxr+dAQo4XeNIyjtZp
         oZlWCy8YwSzynD3HY8Vm3vSvH/u/LkavcPV90Dn9RR0u3Jv2jhQzbJVSYQjmY0fTABMX
         BFs2a8UEfAK1X9rW0E9/Buq/BVagjM6aazbhmfoSCIo/TawQ4Hn8d5c77O8FOHt+YCo9
         WzdEdlpt7P4556g7/1Txa4K68HGt3k/4n254vJYROLSdlXFaUJSy77ZH1PnVpyN1igvC
         AEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436444; x=1789041244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cmrmJFgNXl9cwByq4wccjkamqLrAgOAlhe3K+qkWDxo=;
        b=OxXLxmVp3wOgita2PEoxRtgCU+svzgMIJg/uaKSVZV0+7ezwpJRCB2UFLSHXT858NR
         We42AuCJCrfXb+hcxv8p36+s0Yf33NePpKDtu+skjUz9h2NSYlbU75bb7uMR+NJv176p
         QsWvukPbhQH/QbaQHcsLqM3C8fceT5WZG9Es/Dg0gWlTJaOL9mA7+akSTPS+gJO1sRge
         8hsENLNChQ6W/dsIEfS7g5BHhsK7SmdIRzsFoQA/D9ssFBkejBf5WqeOlMtY9eOLnJSN
         xEr/PTaH85d0FhruYzAWt9A8vHTUt+iLi4o/WNdnTulxdx7aNVw/arbJ8SImxLGYaTMM
         G4wg==
X-Forwarded-Encrypted: i=1; AKwUvBzr9z28WKHiY3U6cs4lS6IkU4dio8S9+PaKBTX93yNebYJJY0+oTFjwMuP0UKc/PRFF/hKisleIHYh6QDE=@vger.kernel.org
X-Gm-Message-State: AFuF++ksA3Clvu/oasQI76SWRdOel7x8ojEEnrew5EsG6OGABTVN+3bM
	WdiAkQedTiacmOjoQ1adNlvVdxMGdgkUiASKha2OTMv94gKQZ6j4SvOkOBiGFdBBz+lB6wn53w2
	bF3jkpHCFNdVVpNcuwTGnf51qrN9Bmis=
X-Gm-Gg: AYBFou0HZtH5ACjlZUrwKve22fQRIG1MjWVG7Wmd4/4Be7IcNqNBhjd0Og1RJ69+U0A
	wSNHry8QnkGYyOct0/UYDC8MijCEsLgQIRmYsY3Fg83CU/v+wTA7eHJQjAEO/ZEuwcpZMwfpAi2
	5efVCA3FK2Fp5EkOwKoQ8bpxq3qjMH8k8rtaqq121IFVnP5utb41JkSAIEoEsdy4vaMzJX19v6k
	Sah5oIVOLaCp8RPhZMF7yY0CAlyIfupU8RF6HAN63R9BTcFVrvCyco1BQ7rxMLacBFjOU5YQmBD
	0POBrCM1airV3lvk52lpy9oD38krWs0VHBFgH3ATsSN7PN2X8Hzm1iTKzvyBclQiYPXzLuvO6+J
	J
X-Received: by 2002:a17:90b:3d89:b0:398:deed:6e1d with SMTP id
 98e67ed59e1d1-39aedf89bc9mr18610572a91.5.1788436443559; Thu, 03 Sep 2026
 04:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFqZXNvOGbzy8-ZnJtKi94jfu2H173Tz7VYpK8KuseMQS-9tNA@mail.gmail.com>
In-Reply-To: <CAFqZXNvOGbzy8-ZnJtKi94jfu2H173Tz7VYpK8KuseMQS-9tNA@mail.gmail.com>
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Thu, 3 Sep 2026 13:53:51 +0200
X-Gm-Features: AcwNN1UoWZTfWh3agR_jdxc3Q2M3uh3UgHIHKTZhxeYlUtsA2KRhKMGejWfjeZo
Message-ID: <CAAUqJDu1R0KjX+-zj9in7sCN+2XPcqE9Uc34GNPZ+209VFou0g@mail.gmail.com>
Subject: Re: Heads up: Moving to a different email address for my Linux
 kernel/SELinux contributions
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: SElinux list <selinux@vger.kernel.org>, 
	Linux Security Module list <linux-security-module@vger.kernel.org>, 
	Linux kernel mailing list <linux-kernel@vger.kernel.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 13:29, Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> Due to certain upcoming changes to my employer's work laptop usage
> policy, I'm being forced to more strictly separate my work-internal
> vs. upstream/personal environments/identities and in relation to that
> I'd like to transition to using my personal email
> (omosnacek@gmail.com) for my future kernel/SELinux (or other upstream
> community) contributions.
>
> My work email address remains tied to me for the foreseeable future
> and nothing really changes in terms of its abuse potential or
> whatever, so nothing bad will happen if someone accidentally sends
> anything upstream-related to this address (or continues an existing
> thread), I'd just prefer to use the personal one as the default from
> now on.
>
> I'll soon send patches to update .mailmap and MAINTAINERS in the
> kernel tree and SECURITY.md in the SELinux userspace repo accordingly.
> My future git commits (e.g. on SELinux GitHub repos) will also start
> to show my personal email address in the metadata + Signed-off-by.
>
> Hopefully I didn't miss any important detail and the transition will be smooth.
>
> --
> Ondrej Mosnacek
> Senior Software Engineer, Linux Security - SELinux kernel
> Red Hat, Inc.

Acknowledging this from the new address as well.
