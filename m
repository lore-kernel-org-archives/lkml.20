Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90382448B84
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772551; cv=none; b=uH1CRd/YKt6WSuXzO3EmIhjwHtBElNYMz+OTkYSGRV6NmPN1/CHRp9p52nZv0i7hm2Vm/weNeGUgWHcrR1VYHvrghrWntTQf++nyWsYA67WqTAkxU/FI2P85CUGPjE6Kt0fQr1sQyveamm+UnAPV+dRgtfB5mNtxMArL4py6s6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772551; c=relaxed/simple;
	bh=cotydOU2axbEAFuLHXGRT6+++/RL9NtHBZWqpZiF0S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VXiAYwIs8T0kDw3hkLmUmUAR1/M18Yrf4mAvevGGbM/WTPyvWseOaTxWOrvzdbGKqpo+MiggUQm/eF8O8lCWUb88F0ae2pjsPMnqQuvsj+VMKEoEdis7IkLnP9iNgdrpfKv5Jne3VbfcOudeYGfYsuQR9GX3uIWdug9wj55o3Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpD+JyIe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpD+JyIe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d94c868ea5so33508045ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772550; x=1789377350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVqwmOb1crWhYfKndwh2XaY160aqcbjm7eUeqdfFhfA=;
        b=bpD+JyIej6dLDHyhQa69xv7USWeifnij2XlK7lLfJXGKQ3UFBxr8+f9t7bpaE+4/dk
         DWMa5ePUnJhJelBwyA24VXiF8xgHxNaMmfT0Nx1i4uOconvAjmFzRQeWbhiKQyPbcjVA
         0+FQDs4mA050D4x4jCS3ZxHz9R3k6gmsT7gsOthL62/D6BovT5hbDDoCKCows/Ge82Xt
         5SpNKrdEh2XbHZl9cJjVLoKmwl4mxv0KupLYPJm4l0SqSqeHynrWnU4+4FZYHgco1ex0
         k/suJApnJv8ZWwWQP2JC0oRZgU8rs8dPw+tCtT2AqeyErs6Y1Llt6rFrSfr6RhP7NUKV
         w15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772550; x=1789377350;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVqwmOb1crWhYfKndwh2XaY160aqcbjm7eUeqdfFhfA=;
        b=RCUaQ9KkajtfkP/8lV6TxHfk23ThW+jTI0TWNwGGiW2fwM8v9HV8Ry5c42SqoxUyNU
         c7SfRXWjphAVd30eyioApfifVscP6Q5pAij8Txg3HNSCxWLouUU2c/Q9gcQV0C2+1Ktb
         Z951FT2ja+7HoVkkHLx5C/a72IQ1u+qOYgttQmtMHzunp10Va+bl92sjXtjSwFOosz/B
         AxaaOU2M0bk/CyUd9RG7mxeT+WXOext1m9FQ+x0Oj2DgFqqshl8BcX584Kdow8Gtzfoq
         ++2RgXmGRvDDyu1SXIn6KUu+zJ65pz59WGSaowP81lYT+KgiF3ylEzXtOl28CR406aVE
         rqTg==
X-Forwarded-Encrypted: i=1; AKwUvBzfL+7Fk1zQ+6GgAO3YxYY1E6N4M0bv2gwshCMQIqnWF9Xx2kHdW9k+0Oe3ZhGEQM3GaxG1jv6n+kLI9Ow=@vger.kernel.org
X-Gm-Message-State: AFuF++m/ttKM2CBPXqbHhyT2XwrlVK2XxJDEQO6XhnBBFp1t6h1QCChN
	ycXswrxN1qX2kKQg8BDitKLJpc6HYezpmX0jv35dJwJEgBQwkGsWY/qw
X-Gm-Gg: AYBFou1aRn7yqYDI+5cq0bFKt9sop0NhYnyW5V2a1k8RufpscRM/qsrygUGLqSxco0T
	P0LHimGGT0MOvzLE8i09LJ1LRb5hcOK9Bcbaxlt5iiV4kfoPv3p7UKsrSeUqjum4fx3T7oKXM0K
	cRdzd3cnpsYDlIuxN3FoYzwCwohPdwPIRNRZJj7v/eJwLkrbh0rK3HZXwimnEf8AYNIaU2VAthY
	AGe3UOUe6pBNv3SxWfpVa6SKDwYp7dO/ObN8/tGurIUHJ5TPEBXex0P1/nDniD2Wzqp5GCo6vZi
	HkvYoXIc+mLMiBRfcvSeh6o6z0/XwkxECV4wg8FO5CHUr07SaPx3zvMkvffqGRWR/EgBvC2kCgI
	9+dBr2xAwqwqfBmyzTAdr/CiRDu8Y786MY0BFPothjl7END04DCzjIkk84xy02jxjAVkL1xd8eA
	QLJEuUujYj/VdE240P3vMP+auUfnIHpY1JBbpM4A1CA+eTPzayEik2wBHkM1xzeHjWY126Xr4L/
	lqDfzcuhwdZfonYtZoqs8XE
X-Received: by 2002:a17:902:6ac3:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2db127cde0fmr248183705ad.12.1788772549877;
        Mon, 07 Sep 2026 02:15:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm40959657eec.16.2026.09.07.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:15:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Josh Juran <jjuran@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH] m68k: coldfire: fix typo "reseting" in comment
Date: Mon,  7 Sep 2026 14:45:44 +0530
Message-ID: <20260907091544.36558-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <C901AA86-8D21-4E1E-A2E5-A6D99CDBD705@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com> <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com> <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de> <C901AA86-8D21-4E1E-A2E5-A6D99CDBD705@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Sun, Sep 06, 2026 at 02:46:04AM -0400, Josh Juran wrote:
> What about the human reviewing its output?  Or am I misunderstanding
> the meaning of "Signed-off-by"?

You are not misunderstanding it.  My Signed-off-by certifies the DCO,
but sending the patch also means I am answerable for what is in it, and
on this one I did not look hard enough.

The patch came out of a mechanical sweep: checkpatch.pl flags words
listed in scripts/spelling.txt, "reseting" is in that list and
"ColdFure" is not, so nothing pointed at it.  That explains why the
tool stopped there.  It does not explain why I did not, because the two
words are on the same line and reading the comment was my job.

You caught it, and the v2 fixes both words; Greg has since applied it.

The wider lesson I am taking from this is that a large series does not
get to be reviewed in bulk.  Each patch has to be read on its own, in
context, before it goes out, and that is what I will be doing for the
rest of this work.

Thanks for pushing on it rather than letting it through.

Hemanth
