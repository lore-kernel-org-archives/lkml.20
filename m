Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D214FD781
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167489; cv=none; b=LJpr6zgyggOpiamJ90n19ngftGCBI/RkQmhvHDJWzBIX0KeRpwU5IMLeDqY6YZBfwP2z8VECB7sMdBP4ZlkaZVtrmwiYWrKU8qeOpWkGPEHuU0kguL1UapBFVcavuiE53fNDyKCfklSaRbgc+/++RVlBhzWwtRr45Gn9quLMgI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167489; c=relaxed/simple;
	bh=nZWtbApWt3kV026dkoDNspJsmQaxaHBVELtY6w2UgGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5CalBqeE+huHu9GzdpxiSM06igs/fPfiE00wmy2TSOoQOsmh3Jfw/BEFXk7WXT5t4WC8PdrH5fZ3WlCkL7AQJG4HDdZYsPmWYe9tjuETV8nKN7N5l9St0UEnVIJDFxAENxKjkak+YEn3sflahQ/GHKOG2a8/1hGWug3AnzZitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M3CpNeiv; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M3CpNeiv"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-82478760557so2453053a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792167479; x=1792772279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aqB/Mmx2mmYZsJMDrgp07ogosIeUVeJwoNnZHzHvsY=;
        b=M3CpNeivZfD2Yrd3gUdREx/HDMNqlNOpX4xlFZRopPaDnqpqK9FF4rNZG9bBbxuPtx
         rVUaIiM31BfaYxDtDVTibXZ2LufgGbCGDw0tKWMYG18+sYEZTrZDwXQW6qN8wvLackjD
         3eA1+y1A60rnAfmqUeg3bK8FhHqvKWEQDU5u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167479; x=1792772279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aqB/Mmx2mmYZsJMDrgp07ogosIeUVeJwoNnZHzHvsY=;
        b=viD/Xy3BY3jKEubExTnUy67NM8A2MYcBY/9SqmctOX9fDPjiFiZIq+R8XZT3nYjUyP
         zXJCXxtZ08jF8AwTYClDlusNOxn2N0Z9CLsfRHsUeCtmDaDtOuQRyVJbUteUv8i23XSH
         F2MRlgHK7mWZUQHL9pZKQBTHXtxYl78bUx/tVwrrJQDHZNfpeS7bECJmB7M2lFo85Pp/
         1zYZ1gjRl/r/2REBvt1Tk3kyhZ2GcZKXaNQVVPpHaSvyOtkKFDk2x8tMslRpIe89+1Vq
         jkT3OcDY9GmyRL7GMU9u+Lu4CQ0uaFfjs7xdiAYvGQmHd5QGaKAgvad43r9BxmFsh79d
         +WYg==
X-Forwarded-Encrypted: i=1; AKwUvBxYauFuDvS8IkmXb4VBXfZ7TFFeZVpzB+WWr51X+Gw4wAal5EKm3pFkJeAD2uxNNhOC4SVCBnYyk5XU29U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJij0RVgA7D6X1JlEhHPZ/OtZEyAYQpa9PdQm8AKltEUVwgeCfc
	nErO0adrmCX69Xcr0Bbwq1gR4k+dD8okXUTsjp/Ys5ExUFA9vNwheF/z6TvG3SlWUKg=
X-Gm-Gg: AYBFou13LgAfPGXGM7FCR++PLiG7RWBJ99KmActHnuDfmrZ7f5D43tr8ZhE7opjwIQI
	V4Qsupv/7Tn10fcCFIWZs0AtD4BSDddBDtZOlxv7xbyEFp+EEowv/vNITR1uIQyzwA9sOAsoaiW
	bu1AgX4s0WRMIyQUBkO2j/MmWOnR0KaIqKxrUacth8KhvqHDc2naxgB3E2BJsAmvrMpAE/9lX07
	t19WhjOl+Kamb/eZMGiHVNRbxhYYhZ/6XWEEEX9iBHNGTUVlHs/4ACaRlYUtSK7KKmeu5pI1GMx
	jxY4LJIfoPwbXagk4Zh+AYoo7WaWYYn76XZEq9E55BWAH19kVLuI//BLNhxzhyTVE0hnIq8X2wo
	U7lC1CFsPgRZassLHeAB+tqcvLFnJ8UaYEeyTZq2uKmfo6RxH5t5Fsa827t0Z3lLGSHH46hQwci
	T0RKJ2pN2ZsaR3zU8xtb4L55OREmEFdAfTSb5mfwDenafLpzmLsha3Zu2oZ/LQazWPROI0C9KvH
	OuVzWQBx4ZQR6EyA+E=
X-Received: by 2002:a05:6830:828f:b0:81d:c548:292f with SMTP id 46e09a7af769-830959380b5mr21128096a34.12.1792167479094;
        Fri, 16 Oct 2026 09:17:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6f0a55csm2327426a34.25.2026.10.16.09.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:17:58 -0700 (PDT)
Message-ID: <93d5f73d-0126-4727-9014-836e195a3eac@linuxfoundation.org>
Date: Fri, 16 Oct 2026 10:17:54 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/7] tools: build kernel selftests in tools_build
To: Sasha Levin <sashal@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, linux-perf-users@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261016143143.3613501-1-sashal@kernel.org>
 <20261016143143.3613501-6-sashal@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261016143143.3613501-6-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 08:31, Sasha Levin wrote:
> Add a "Kernel selftests" sub-menu with one entry per selftests directory
> that builds with only a C library and does not write into the source
> tree. Each is built as "make kselftest-all" builds it, with KHDR_INCLUDES
> pointing at the UAPI headers installed in the object tree, but by its own
> make, so the selected ones build in parallel. Selftests whose Makefile
> does not use KHDR_INCLUDES still build against the C library's copy of
> the UAPI headers.
> 
> As with "make kselftest-all", a selftest that fails to build does not
> fail the build unless FORCE_TARGETS is set. kselftest_deps.sh then lists
> the libraries the selftest needs that the compiler cannot link with.
> 
> The selftests do not track header dependencies, so a selftest is built
> again from scratch when its own directory, a header or makefile any
> selftest may share, or the kernel sources and headers it includes (the
> vDSO test includes the architecture's vDSO code) are newer than its last
> build.
> 
> Selftests that need libraries beyond the C library, a vmlinux with BTF,
> or a sanitizer runtime are left out for now.
> 
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thank you.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
