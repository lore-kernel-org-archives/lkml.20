Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808948;
	b=bp0dsNsKR16pT7hRGx8NLrCRE/QWMKnpsp52RWyaG91dubHZm598xdijp7B3BDcMV7Ue
	 dDdP7Wdnxg6nvt5Za6l+1G8AoUuVsN+3gIxAIpZv544aKEpTapXvre/9d7uqeaxrTzGMU
	 fq1gi7yoDfo41RUlC06iS9pLqjIkwPspPcn5TxQgswk5bhesVHkwgRJJIW1fn9KZ1niWB
	 YOapDEkVPP1u3FMfF2Mcc+hArg4aij7PH2Q2jIHA28rmh7oF0sjGpfTVyLwri2R3nIJJj
	 HWrP076nYjaNTsJ4NXhU6zkTCeFbUIiBQA/omPw4y0FEITAQYZYuYYP7s89ReYyHRyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
	b=Ul21MsuqkgrdhuH3Bpz7bKVIXOjgFzF9xRQKbzL2FSdPDiHlE/vWG5vL8UVuy0JeiQBb
	 MP1AGMqB3dZs88tE9gS93YAm7xifzbRxoIRwKeqEOMV+wCsvTs80EV3DUAa/koO0dpUAl
	 Z3PcfUwQOmIG+7MMU1gUY3Iyswi6jXpFZ23KVox2umnWFP8IAbwHVM+bYYAO4LgyLP2nL
	 FZG/90aShHNZ2TqDZMtgkQk20F9GpvfeRr0+C+EpQzAz4R+KwikkzOb/qShtextLDk+wQ
	 vndW9HqtqftRcDfai9iMGiFWPSJDCoE8moAobv+XVYg4yHyDwkzIZ3qygOlDQupz2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OzvPmeDW;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65B606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD65B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OzvPmeDW
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9906034086cso231180241.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793808947; x=1794413747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
        b=OzvPmeDW5bBy+zfv1z1W+Hmr2oI47pvOy3dB2/UBfqW2eCXCyi9tDXfI1TlMvDh/rl
         Nm2x9kE47US+HAkFxSooytHhU9bNEBF7Anl4SHKfnGI5RJhiNbRUq+CLiQtBws3hzBfb
         UPAjgPGjSaLt0PZlNevCOa9kBEtMkl30A3wq5rHlIE4Vyrnsiin2y3A2Q9JDein/WeUT
         nZpeL3Lp5JvX5cX+oy8ByhLUpP8fEbIvuV0jmpmf1JIiPRaeYWMr24XjK8gw5gsR4vrz
         iNZXpFU3ev7+1CybZzNzBhEdzleQ6Ti8vJ1TsXIgjQc0UjvVAbaP5rN4oFy5egP6V9RO
         8/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808947; x=1794413747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
        b=aL9u36JuS1YVs4P7s0aScPjcsUeqrIHBm/nZO67wE7iXxoSy4GwJPGGcjjf77r2pmv
         SL782k/o/R/wNPwaVZDooUguJTs4jI9x07gEODA/bjBv6U/fxRB+fDYZbj3RjJ6fOoQr
         4FLCzjFNwlbnycgCcWBdsOgwaC9wnWWKZhFFHaKlZvWuKfy3puEKbhPvgwRmNzy0ULsZ
         fXk6u9lbNLdt8Da5WieXxfVdIQtQ1qvrHPs75bHiYwt2ItHYvO0h1tsJy0VDy9Bw8b2C
         ghYmrXMcFpNhYHn5yMJjgaemagGaGkm0K972KiZT8UM2+9DTLFBASBHEqksClreGExdr
         Kp1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8iuXgFBflzhLa1PNfH6B+U5FMx6s4phTKNYC536NyXWjQ7oXCowhxVxfvjvZPpLp0tFkSr+m4uddjYlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dWOzGbwef6KfjDxRwlRFKfZKhkk3ZAUYLzjz/6BQJYRVDAnSg
	VBDMfdsZOw9i/X9+B3E4wcNLHKcoDocjpiqJRHd7IKbOeki0NDZnxJu4+Myh3GsSk6U=
X-Gm-Gg: AYBFou0fH9H4lja2dRqfgHXshrC8BMvVSAAVGvwYZVf14/baFbjeKNY2IBErMkvkwQq
	staE6BmHhXAPVFckmEPPWX60wrJR7nXwMpociQijJCbJkZZ4J4NgZO50PTjwAQT1ciiMZd6R6et
	H06WtKIXjCR+gZbE7S0kd42QHMXSJKr30q+WiVUpBmAPem3kfBb6Zgvou5o3KHEQI0YPPMv8QAv
	0qm0s4l6FkzXKktBigq3IA6eVKLD9G0t6nxMQyk9eSl7rchLAubhqDp+fC1TalKg9J+G1XpBGBS
	huVuYZZ8+Sr+FUvQst8esZ4N2B77f1WKn4KAEIIrI46yg1TwYAptvCL8Qtm4h9luwQ7osy9MVNO
	Vuc+CZfBUvjjIZVRdaVGkZsqvHh1KRWh8NIT5hi8Kx7Q64qy9Qj1URweTPTdKIK8VUnQBH6Yorf
	qfByO+k/uc88iobXhwdSp2SADOobJ5qI/kxlTnGkQeI9bzHQI4GSWv525655Lji3/Kb252XhdMS
	9vOYFlUJEFnEXM/3h4WQJDYed8pEgzUTWRB11l7P6tHmilhyp56VEO/400sG0jkON9ljYgRd8xf
	yJsijIzscAvAIpLDFx0zzWEky5tTk8/UnQypYA8slQzue1eAip6qlsHAGOU54u/Js39K1lyX/sX
	0ACaLFUYfT7WJyiFELRW7acYqDZk2
X-Received: by 2002:a05:6102:8092:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d0725cfd86mr6050535137.13.1793808946717;
        Wed, 04 Nov 2026 08:15:46 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d8afbfe6sm2262989241.3.2026.11.04.08.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:15:46 -0800 (PST)
Date: Wed, 4 Nov 2026 11:15:45 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 03/10] liveupdate: Allow file handlers to mark
 retrieve failures as retryable
Message-ID: <autW_3fjUS_hEhZf@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-4-dmatlack@google.com>
 <2vxzv76ck7n9.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzv76ck7n9.fsf@kernel.org>

On 11-04 15:12, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > From: Pasha Tatashin <pasha.tatashin@soleen.com>
> >
> > When luo_retrieve_file() invokes a handler's .retrieve() callback and it
> > returns an error, LUO currently records the error in
> > luo_file->retrieve_status and blocks any subsequent retrieve attempts.
> > This is necessary when the handler has already partially consumed or
> > freed the preserved KHO state.
> >
> > However, with user arguments passed to .retrieve(), a handler may fail
> > early while validating caller-supplied parameters (such as a missing
> > argument, an invalid or read-only target file descriptor, or a non-empty
> > target file) before touching any preserved KHO state. In such cases,
> > userspace should be able to fix the argument and retry
> > LIVEUPDATE_SESSION_RETRIEVE_FD, and if the file is never retrieved,
> > .finish() must still run to release the preserved KHO state.
> >
> > Add a retryable output flag to struct liveupdate_file_op_args. When a
> > handler sets args->retryable = true on error, luo_retrieve_file() leaves
> > luo_file->retrieve_status at 0 so the retrieve operation can be retried
> > and .finish() will still clean up the unconsumed preserved state if the
> > session is finished without retrieving the file.
> 
> Should we give some sort of signal to userspace whether the error is
> retriable or not? How would it know it can or should try again?

The goal of args->retryable is internal kernel state tracking.

From userspace's perspective, LUO ioctls behave like any other syscall 
where errno is the signal: userspace decides whether and how to retry 
based on the error code (e.g. retrying on -EAGAIN, or picking a 
different mount on -EROFS/-EACCES, or adjusting flags/arguments on 
-EINVAL).
