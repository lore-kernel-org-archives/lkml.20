Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792671540;
	b=L7iUz9+Mb/UeuQBkdnMjSqnbpJpq2SLHSoNixHgDVwcRdJTkMcVMxmMsvXKhEp0YG8sA
	 sC/K7r/RExfAXtoSihNmSUE+t67ddZC0x3QOpY4lTOI69K3P1EqSlKLHutlO/EwFZfiXJ
	 LbZbYy9Ax8pK6BE14cySc+Oh2WVxWbZRhfgdVEt7vU5u34nAVgL5lpebNKccU6JQgXKUr
	 XDCxO0OxG5xSzrVrnUicRo2EAQPcZC4fpqW0Bl4UStSZNtnG84lkpPYPG+iMZEiKEHsdb
	 /KSVWSjtW8cGEznvkqR9blRRG1duCnuKz3AZuNEew+d71QS/pJhmVS2FRgtwL+ZnViQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O7MzFnbIsObJkz1l1H1RrtjwBzWrndW2u4bvc7jCYf8=;
	b=e/NKSW4t1SP/W+EeFr99Jxt99MF55Uv9V+Up97aJqIc01qgczPO1y07XwV/yM6LLMt3q
	 qj1M95eIoG7/bLlz5PRIAYdv+ocihFUzFIqYxVMzVQTLVZ1/DstTMEoXiJUeF66F86lET
	 tiuwQ28F7L36mHgJvmef7sqqLDhrw3Bpq48eLThKBv8kl0BpIlGe9P8Dgm6Ui1tKJDrso
	 OCaLyJ+CnM8X7cZD2XHEIBD8vM9JRzh2I67ZYRLjjQK7MFvPBniMBgfr+9Oc6vVLaQDeI
	 e4PJZTJVgrNKlFaeYj5mkIdym+ihyyWPTolSNTExvzNXwxxwf9MjUEUin7WzfqWYCEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20251104.gappssmtp.com header.i=@armoriq-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=YLUPMQVJ;
	arc=fail smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70E606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C70E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=armoriq-io.20251104.gappssmtp.com header.i=@armoriq-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=YLUPMQVJ
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-843a4ca671eso948980a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792671539; cv=none;
        d=google.com; s=arc-20260327;
        b=IkrxuNynidf3BVNfPAnRW2SM0P72MtvkpKI+bCHZ6Z/qRxWA607XyS9uL3Y6AKPsY2
         1rEPa9KUdKX+KGS6lPjVhmbeN/PliXbi2LWP1Qo2eKj35E7lkB3w1I9mj2ry4zTYkoOw
         IeQihsVGJti7hDC0lGRoTUC0OAZKiwwGszrfEWYIWIJszIdvGC/VUEaub9DuCN1Ng5Co
         Hn6GGJ9BaO75ZvnEfTvZP8L6a5SPyraL1SEr1A+io/SoOqqC5VWdOdKhWJkv0bXSwbjO
         4SwOWyJ6eGDLbeZC0NnZzhIuRC38vD5v9Q0M/K9Dh/fisJsqs3BDcJzbK1Qo8oYdZqhr
         iG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7MzFnbIsObJkz1l1H1RrtjwBzWrndW2u4bvc7jCYf8=;
        fh=rdOeX9NU1txPbQCyKMTQo8cXPGhFFUC2N9CfA/sG9o8=;
        b=WoZE1gM7Z9SE/y8HTGj6cNTO4o6yQKTTrDfb3s69lRG8i6viA+ZsgEtEQLwg8VeofV
         pFxrBkrarVZMUbwB9geVqm9HquqtBhA9TJ/HFqLI0gyMmseYt+y9VM2ehQUegPJrssA6
         Gbh7YRQC/GFD95UeYLlXfpSXyu/ubJMvA1adA7cXb9nVN93pDOYuOpXAl3RD2gPDof/V
         OcuRiLrQaffx17x88uVs3pMWh0uQ+C8V9i50rc0n2ELEq3ko+2ZDMp3kqVK46ICydwOF
         KUxcJn93e/69WrHqOUIg28LlMzoYBIOwbHDzf5ULzTmAMjJkVz2LH2/4PdKPrPI3hrdo
         uZfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20251104.gappssmtp.com; s=20251104; t=1792671539; x=1793276339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7MzFnbIsObJkz1l1H1RrtjwBzWrndW2u4bvc7jCYf8=;
        b=YLUPMQVJF8HRVC8z0/+XrEs6ev066K/XYVa52+Bkail+lf49nY6jJTtmqI88eqqqsS
         JyqLtxXkZBgpqap7OKLLgfKTDdkw7sXaj2F0wki4fj815GI8j0FU3WPvBZrpoPt010jG
         a2eKGzf31l4WZyISy7N2Q9j+tM9WRaZCyHibHUXQ7x2AV10lfY5j4oXlH6Lm0KDXNPTg
         u4ey+rSbQxYeOt+0Z8HBA+BXKpNpfApwmejs/QWWkARyoKd/k0ifAy3jIR5OPv85JDDu
         3sVPwOid7UjGYaFQBECFXSA4rQLg1L8OKtRadkaLUwkT+FuuEXmEPh3CQJ3uW1kN25Et
         daYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671539; x=1793276339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7MzFnbIsObJkz1l1H1RrtjwBzWrndW2u4bvc7jCYf8=;
        b=Qpmah8e5qabtuNMIYc8pjCua7VLx33pXoKP86S5Jr/F+XoDRt4GOpjy4KBpzftWi4U
         dinBNh1+4sd4lw3Vpn41pkuVr2T9ELuL6KdTk9RXTpfq5YxTqhyrM9tpIGTcN8U0/iyw
         tC1TCsTQyDTbns0y2111tVCig21fjgl8NpH7V/bmkcp+7/85pmr9thTfBw7j9IstTDCF
         tYcNRfk7DvTQy/d3Tuh8VzinrQ7+5y5i8nnlCckvSs69Ch0kdgevYR5HeVoxxc+6kYch
         /Vw0LeuE1vZvu8FLTFvfVMwm05mOXi9Mg0ah8/5gsjJJczeMEZWRpgbVHsuIxwDwbURE
         YBMw==
X-Forwarded-Encrypted: i=1; AKwUvByrazfOdiHFDTqebA/7EA8JUL2DSFrueJzpiOjeXUkjMzXcP6xSjnwQK2HXRZ7p09FEsRU8AL2GRVSl95w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBrNuTp+94WmMQ2Cev/8TRY2YUTShUuyUqYyPaXFHgzpq+BCyK
	tKe6/jnl6ZeV229txHCZ7njwY37wi1ckdFUnmLWWKlhdKbEGC1HKd+oj+90JPcTsdNUNc52hjbv
	p3RzykaBcwsrfYK6qMJhwO+PyHWvb2qpc/ugujpnwVUs=
X-Gm-Gg: AYBFou34ctwh7VUL4MPcdZ72oL/BXyUWcFh2XWasiRP5FWFV+m9F+RsjQGJ3Wa9cHns
	+/7ukInMgq5xRkOcAg+GzoSeHt3G73/C/FG0ZbpLsQJQZgcw1LUd3WVzNPNbYsLZVXQlEPIJY5n
	7rgyeFpl51GPEAVsszq6RO2yw3sUiFnR+Pfr3B3M4+8AFZn2Mhvfy9TNVFLCzcmCeL+EKYYIDEi
	/O3i85V1bvrlbatmqW5LKBY18WDYQXoOwA/+9xSS4pxcobh/fPHuyS/aeqzs2RO8ZQJX2eQnQue
	eZGLvz3Q2Nejox6vsXP6IgowTHHWZ1Vr3h1jwL24up7e52A7RnMa+NtVnB4lw45/fsoSpmVMQn2
	LAyIOm0YuXTm8ofHJ5Rzf3ds6AgYMH87bAv/onitRA3cbIqRP7U5/DOz7GzMZep9GnEpqN52M9b
	FrjlxYAIfqn9vwlznEXyu/9ZP/B11toZQHJHr7eN7EwaOg9s+0uXW+7Pc=
X-Received: by 2002:a05:6830:6f85:b0:81c:ebf4:9ff8 with SMTP id
 46e09a7af769-84d09218548mr4176798a34.30.1792671538755; Thu, 22 Oct 2026
 05:18:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021165748.19304-1-ketan@armoriq.io> <db4e46a6-1788-44a3-a3ab-4fded03591d7@infradead.org>
In-Reply-To: <db4e46a6-1788-44a3-a3ab-4fded03591d7@infradead.org>
From: Harihara Sudhan <harisudhan@armoriq.io>
Date: Thu, 22 Oct 2026 17:48:48 +0530
X-Gm-Features: AclHuK9VMJQ9vVvn-lB4Iuv5LF_25cVG0XxJiOkPXcZoQJDfSKiJzf7VWJduKT4
Message-ID: <CAGhg=-NJjXPqeAFMnYVRnbZWQwoGiPqhyhxH_c7zhL-=Jc+qzw@mail.gmail.com>
Subject: Re: [RFC PATCH] docs: security: Describe the Kernel Assurance Plane design
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Ketan Bhardwaj <ketan@armoriq.io>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
	linux-security-module@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:11=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> I wondered what this index entry was for and then running
> 'make htmldocs' complained:
>
> Documentation/admin-guide/LSM/index.rst:48: WARNING: toctree contains ref=
erence to nonexisting document 'admin-guide/LSM/kap' [toc.not_readable]

Thanks Randy. That entry should not be there: the document lives only
under Documentation/security and there is no admin-guide page for KAP.
We'll drop the admin-guide/LSM/index.rst hunk in v2.

Thanks,
Hari
