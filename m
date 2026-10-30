Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793332702;
	b=xhkt5hqiDWsoXfbxmqP8Qtobh8jFltLw5TZh1t2nioakhi51iO3gkWUsGpVX5Cri9b+R
	 pM60ssdACBPkwZp7bZv1hJmZGPMX1w0J8GTpGvAFZQms7gMytZ5xZzojrbx8FzZkMMYKl
	 exRrbRMdP6lpehspDib4eQ8tt+BUAkRONsR+6FanzCs7Uve69BNDGNhRWnxZ0HoGtShJR
	 +cicvoPxo6p3TphpoIr2+fSPP+B46nJEBpodUE8/o+12nbA2T/fXTQY3P9QoASh/wbiSS
	 gm4tNPqk27/+5U+4E+GpvyMCRCcVLaSBvaArV3KeqJLm3BOFK4dKnHnwJo7WhFhTbUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IZmNuI/wND30J0nkI7O6RvOq46XxnSgW4W30rCGXnNg=;
	b=y1zt9H/ApVI5zfbl9vqPmJggFwAy63A4z9c/HEKdHwXDtaazNavK78xa3SNGO9bKuzwq
	 Kym9qKnmP7VkTOwuFmJj7/k+zcwutNe4BE7FFPfvxxDHyGEqoOy0hLDXFwtFFXuxr4Iv6
	 kRLpzr/X46fVqUuy3DqzqZharhIfim/4gk0ynFawxXD6/T+oD3NKT5JjmJTmr2DIGX/zg
	 8WLTw01BJurEbCOko685Kp9tvlTJnFOtQ3eAEt9cMWFRozybnGXvpk+vSggTz4P/PBtN9
	 ksPZ6Itgf85tBHC62Z1tFBe9cYgqphp6fWwUfQGsIYTTz+qmD2dJNr5wkLDz9Jh1rwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUpdStRz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515AB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUpdStRz
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso291024e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793332700; cv=none;
        d=google.com; s=arc-20260327;
        b=FZsbAK0pXxjEVSlkIaWMqG+xOyX9PsWWBqV2P40CU32KPBQvHWm9NGQEP9cvUymNV6
         l+phAiKmAOEuBYBDnKngRgIEq0WdnSoV/Cp4bxxhkPDle0PriO2+j7t9PiMurI+oXqSJ
         LopmoG5b4Xqvnjld8DMIT+DmUTLkRIiwr53CdkW2pOadjru+U5Ry5C3mG1Hmpcth7fXa
         LvbSfRDQ7Dlg3Ce2+D91LlQzqAuNa9eSLynJz9P76O0iKSPhagNOLV4HMBh/5q2ESpIu
         4fky0nAWtMBoHGB5Q8zbVPCrfHsN1CtziRtVpcToIoXES8o796uJo+XEuhicplqnnRGj
         m3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZmNuI/wND30J0nkI7O6RvOq46XxnSgW4W30rCGXnNg=;
        fh=qVRwydawSf53sFVe1CacHjnoLo/khKOOXIxddDWP09o=;
        b=q84hMVqd6BI4nvOqvNk8CL3Cef+s52jg5kwVky3ivNHkk9VVbyenOUxHDOV/BNl4YU
         H/pNGZyVjemZ4imqUzhKc0HaFKbrQdl69sNa/Xoe9JV3pSJunxEPNI1Z4oJMwyvHUFDp
         vctHFkcCHZiQ5zbpssQuMVobBN/dGUVKFY8Om2nD4NQnU53zD7tDNVG3SQHiIkYXd0pQ
         FsTa+zAJ+CUWWy4JFgn7KrtLQC6p+UC13HLkMLyz0e5cw9UYSTFIxt08RITOgkZ5f62c
         8fMi8btOkhK0eRg3oRp9INrZ72Ghk8KwA1egOzqK1B3mrhP+b4h3xKL0e1tyViNU1Nyg
         SVXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332700; x=1793937500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZmNuI/wND30J0nkI7O6RvOq46XxnSgW4W30rCGXnNg=;
        b=sUpdStRzH778SDNGZYJe1CEBwNtIRtYO39O6dHFQd9TZwGmLMl9XMQQDhD5mRr3mnd
         LRCTb4d9WdJYvOH8b13wGWKoRGtT6WG3kUtGUuO2eEhio5XuhgyyAIcHSEZKDtZ/8ZiP
         SJwdec05E3w2G00BIGQv1yRWbguaYFEvCQQNyuTtdWIaH+Kjd1Z65NBeI1R+kzAK+ZAD
         cl/kfVFXdq1IopfR9d2GVNwH8Qa9mfI+YRqFYn/xHeHxEAG2yeFhZNkWRVRYO07GLRWW
         fDfxplSL5x2646zj2cU3XNygzYw2ZCJpXHfySsoF0q1bHbChZPOJIUUm2DIggEZvP+cR
         VNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332700; x=1793937500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZmNuI/wND30J0nkI7O6RvOq46XxnSgW4W30rCGXnNg=;
        b=GNva06xjj3GySuTIwxxuGo7GfnCuRWlMWwHWj/j+k8N7KoTSpXANJIzBloVtU1N/cE
         iP+m2XvfodrJs/JuR3x5iMvY5CPH8ytdAX9YE5dRvqO8ogt/c2J4+EZ2Uzxa2wYjMOmn
         22aDFuQIoCjdHKA44LIn0HAqIQoVAW526owLM8DVUN5fIARSMS4wg9iBnFFAXiFuObKC
         GAzqHGtqf6eur50+PfKD3rvA91BnrdBNAnc/MGoC4KcSwQUAMInB/Z/NIQg7bCsNIYSX
         itiAEKS8/xjgjxTd3iDt5TEgvtKsfL8AWOhmuy1QgKlsNdfqSRhfwWeARddB2ogG0OUh
         T+vw==
X-Forwarded-Encrypted: i=1; AKwUvBwnJF95s5ZbDeEQJ42+hsXWeD8Rtv29MehRXTtrqBVsg0u4XQMsKtWb2OGdUowFtH3XUw9Ogvjs7zkyZqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWNScKuMOs84rOsTS8dhvVolsQSLcHQOyKAcJLqDGKUvANqRRd
	mhegLBgY6fURr//eA1N2KoRV9V8qNHaleF00fdoUzrP6kexZCWTqdhwrJXdRuKYOu5bWFvTM8mr
	p6aQOtszr98dw2laYVYRgawmWlDl9VWQ=
X-Gm-Gg: AYBFou0JZBg3CNc4AbQkZtJArU+kloe5bZz0zc+bO3Jko5xAprNKUt/rUUtF4/7p0mF
	pp18oYZc+0tDMuODz59GbmjXxUqZoiFuSCrm3q8ppH7ky+v+/Cd5ImsQM1/3h2JO/wuYq9uxrcQ
	QF5UbZJ759BkImdpJ0Eo79zjdTiJ9/YEyeuSESIljv3JS+c319bwHx7gny3sOLsfJc86Ej+DH3L
	VVt9LyUMDSaR9hENiV7EgNa/VFrDPuofYtKzPcghsmMeAoAp4veSXA6xXn1F3ivm1EpWBYYN+N3
	pn68sWLr8tWia2p5n8Df8aKPxPhnRafWIxNbsZzYV+kZFPgSDCQQsEaZcvNkqUHtdrFfwIpG5jz
	vg7ls0g6aPKYszfn4MFuFCo2z9CMA87QZFLYSPkwyLNdRaoQSDbPW5YpENWF+FILz+r8910xhPt
	9MytpcNhaY5FpRXeymiwxThVO+nJc/TLOCne3+UYqXKNk7HIZbnnBq
X-Received: by 2002:a05:6512:1289:b0:5b6:95e:87ee with SMTP id
 2adb3069b0e04-5bfd9562acfmr282919e87.13.1793332699938; Thu, 29 Oct 2026
 20:58:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
 <20261028-alpha-profileme-v1-1-d44b52bf2500@gmail.com> <CA+=Fv5TsDjMcd8+ZPPAXWzw-ox5yhvYJqiCBUfj-6Jm0Lxf9aA@mail.gmail.com>
In-Reply-To: <CA+=Fv5TsDjMcd8+ZPPAXWzw-ox5yhvYJqiCBUfj-6Jm0Lxf9aA@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 29 Oct 2026 23:58:07 -0400
X-Gm-Features: AclHuK8V7EpB7wC06FUDBXo_x3T-573CFsU0sqVCv9AcRDNtqPDSxvn5PcuIGgc
Message-ID: <CAEdQ38G9id1CnZGzkgw8vHLKZM+bvJEDx7ze+6zpULGTwG=9JQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 1:38=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> The Alpha Architecture Reference Manual, Table E-18 (page E-24),
> describes bit 0 as:
>
>   "set =3D log all processes"
>   "clear =3D log only selected processes"
>
> That appears opposite to the changelog's description of zero as
> "count all processes". Is the manual incorrect for the PALcode
> implementation we use?

Yes, the manual has it backwards. I disassembled the wrperfmon handler
in the UNIX PALcode from the ES47 firmware (V7.3) and from the latest
ES40 firmware, and the code is the same in both. Function 3 clears
I_CTL[SPCE] and sets it again unless bit 0 of a1 is set:

    hw_mfpr  t3, I_CTL
    mov      1, t4            # SPCE is I_CTL bit 0
    andnot   t3, t4, t3
    cmovlbs  a1, zero, t4
    or       t3, t4, t3
    hw_mtpr  t3, I_CTL

The 21264 HRM calls SPCE "System Performance Counting Enable", so 0
counts all processes. The per-process enable is PCTX[PPCE], which
PALcode loads from the PME bit in the PCB. Linux never sets that bit,
so if 0 meant "selected processes only" we would never have counted
anything.

I'll add a paragraph about this to the commit message in v2.
