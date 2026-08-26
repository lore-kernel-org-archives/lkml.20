Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF63424D59
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751203; cv=none; b=KULnZVuOEM9w9lz61fo+fgBynvRfc4tRe7I6a39lfqoFYmrSEUtiLg9M7FYumc6/Gy8iX9vSfmDSejSk78m8yK3WnSqEa4uK/10CFX9OAxRfG4E46cL8UxOarHWTNl9xeG72/URh5wFAvpMfnlNhn/hs6i5FISZAG0K2NIIVGpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751203; c=relaxed/simple;
	bh=skh1J20miHyQI+YX6SjrUI0pPMNxBurFeVoXPbNyAqw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMdFz/pXcX/hcrgg6XlFHm7KxlIqMqAwx7jsjeP61caW30eTMdxFY5c64tE4H8kW4nqMZYIruJCcLJlFJG7Um7OQw/ALlhVZQ0eMqvSDEFdqOgkdoOk+F/wR0rlWk0q28Xl6HuuvL2jWMAXsndJi1EZ4UlcXElvHX7S9MES1y30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3jprUtV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3jprUtV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47db714766aso1242175f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787751200; x=1788356000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDeYb04JA1wKUlB+4fT7hBu1dYeSHzQSzUnUA5UoiTk=;
        b=c3jprUtVQbhETdxCm6+ylXMzRdkNb5d8VOq2/82y9Gnsg3XZY9bBpfHfOBKK3nLgLV
         3jxszFUSj7uWNo9rdwFjyJr7pX2PII0A9DohLTxTf8b3KT0BCuWUnMqb5Yjn/2zcJEPN
         en/lU0QsLn7hSUze0FUqtrG7JwN68xGMbZNSQO/YupFlSTN+RWuj5dzrvqSW5DgBp0UA
         VZSZRHegLfpTO5rPb3EgXN4Fj9ISh+PjEosJp/rcWM1PbuKki1kOhdh+JXu9ub8TTmFS
         GXghIHP0hcos1PTLWyIGw63Kjxp0n8n3PWjkTnMADzJmmjILNp4eBa6Fex07ZpF0Cz3o
         Yl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751200; x=1788356000;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDeYb04JA1wKUlB+4fT7hBu1dYeSHzQSzUnUA5UoiTk=;
        b=ITZg+byoT317Tm1Bf1kOl23pW5fmwhugbt96FBVDxsD/kqFX7ygBJ1IAB91IbJkTww
         rCUYWTAsZ44waCoWC6IbrS5OGBo81pwnBcTM0VV9R1eQwvc5j8kMTCnJZQ9mwnKr2mz6
         js073tFTjaKutg5i40LSj77NLPFj0FUOMmBZpW1it8HsrsbdZuPnQVT6MLZW7MWm3833
         9S9ARMoDMzL/bY3ztlkA3uiQkIr91lYNkksn/CnFcSeA00s9gvHVzkiB+a6t9zDbiJLx
         1keEigItCiEO1BcFKox+jR7ohm0gZgpMw4QnNDwtvsLFMtPpHEhLD4IaFDwUu0jmQf9p
         xZ/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrOjrrJLudwz62+UhTxlIKqmGlV1wHlXvle76bmiXAM4EneB2fMrIJriredz8ZOjry9HutrKNGcPr/qQmU=@vger.kernel.org
X-Gm-Message-State: AFuF++m/rir6Q6Zq40R3CfVDd6FlVBk0dwCXXA32F3SVJGQEjlmrqLLB
	cptciArglHosxdmNIDFVfRVR6qrq7LBkFxtF3sn9JOf0DBV06oIkVGIH
X-Gm-Gg: AR+sD11G6FLXX6GDBKpogLlQvsW2Q4rNAFLm7efdVogkbTb4YAClsOrxS9/hdexXTBG
	oiQQo7JvrrFSc71IVNFYebyAiAo1dJpzQNGCGU5BKDAIKIQrEv1CjnM1cRLNl9MF0OooNqOPSf8
	oArdLrj3064fGf5smrxeglx0C9xmRs29Qq05m6Q/EDMCzrjpHopNO7RqEN3mIyb6hgp4WbnJRu5
	AMcL+cnA9jXNRyqYSLUlWPL6l5E0ZnHCEIXdtqlQiwi9r53lDvsQs3djpDT6JVeBt9bqMqQY7Mw
	KFPJP5S/KX9tTXN6rs7L0i0ynEvJzpOcummfCu28IG11j1KfS9TkxVgRM+3ELdsTCtCrUV2d+P8
	v1ohB49YMWz6yr9FGOQrqTcor/kOj4nU709YhvtFnmqVVWQiVnLLES5rxIndfw5qe5TttNWsIAK
	qvd3WOhfNmDQhlzmSE/lCgqQZBjRTe7AC5HAfz50j44kNvapFTvi8w/5AglbQsOKeJh9o=
X-Received: by 2002:a05:6000:29d2:b0:482:dfaa:dfa9 with SMTP id ffacd0b85a97d-482e26b3278mr4456632f8f.7.1787751199354;
        Wed, 26 Aug 2026 06:33:19 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2777848f8f.34.2026.08.26.06.33.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 06:33:18 -0700 (PDT)
Date: Wed, 26 Aug 2026 15:33:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20260826153311.6340efcd.michal.pecio@gmail.com>
In-Reply-To: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 11:19:31 +0200, Greg Kroah-Hartman wrote:
> The ability to add and remove devices from a driver through the sysfs
> "bind" and "unbind" files was created all those decades ago as a way
> that kernel developers can iterate faster, and provide a debugging way
> for users to attempt to add a new device to a driver without having to
> rebuild their kernel.
> 
> This api over the years has been abused and recently come under a major
> fuzzing "attack" through tools like syzbot which decided that it would
> attempt to just randomly bind any driver to any type of device, causing
> loads of unneeded errors and pointless kernel patches to be generated by
> unsuspecting new developers.

Hi Greg,

I think you confused 'bind' / 'unbind' with the likes of 'new_id' and
'driver_override'. Try binding xhci_hcd to NVMe, you won't get far.

FYI, besides being footguns, the latter are apparently used to assign
any random PCI device to some VM drivers for passthrough or whatnot.

The former hardly are footguns and have further common uses, such as
removing kernel drivers to make VM / USBFS work or "turn it off and on
again" when a driver doesn't implement recovery. I've seen a published
script which does this automatically when xhci goes belly up...


I am also not convinced that fuzzing 'unbind' alone is a bad thing.
How is that different from 'rmmod' or pulling out a USB-C plug, which
may have a bunch of USB *and* PCI devices behind it, mid-operation?

Regards,
Michal
