Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813955D87C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092187; cv=none; b=BXV2yDl6qygoryU5SrHZ0nkSRfjySc4/HlprA6UZEq79R+tpvGtzou8A7tq2+WvM0G7r+Ie8wuSzl/zZoCIvzzQkOfFWyjgSj3EjkjeSgDQEnm77cben7EO6ynIUkV0lmyiSAzypBc2NXiosT8BT0gZSK9+rxN1Rd6TYE9Hbbg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092187; c=relaxed/simple;
	bh=OdG9rW5898KDaBRDabW8SJyvwLGoLiCjrkhpx2bMMJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g79eSOopwLJiVAvzN5keUYLbkOe14Gj1qTXXJxjgJ/wddi+iy0QpX/Npy1LNivX7L1qF6BeTtyKoJuVMl+81h7x0iuA3J+BbiFm07gg1aHLBRtjPA+XOEMf3J8unVNIo8zPaeh5XlfxdKR6JxKekzWf7FbCsFrT5pGlwliP9gOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EP4IFrV3; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EP4IFrV3"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6f74f6b46abso2587027eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792092183; x=1792696983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUALdL9mzi/lPiIZ88I6AcamdL4Eb3iixPrb9XTRKdg=;
        b=EP4IFrV3k/5jpj33W29WCY7FoOaa7qZC/zs/PBazMUcmDkzBIxgPcsKdOAdzEp5lEC
         54wG51udU6C9RKbF1eimWrx9M3qlRz3TeBJS0PBOshKjGhksFkwvaSA4uPsfCYAKrob3
         rxCIWWxxGWZTrypOZEbljB1iJ3dzfQ6Pvo+Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092183; x=1792696983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUALdL9mzi/lPiIZ88I6AcamdL4Eb3iixPrb9XTRKdg=;
        b=mQ3RgHYemtu4Q3uuhdYO1Tam268ze1yD8uGrVk5ezh8mNSFWMtIDLDLYWrtaGUhtkP
         osuBN+P7RwthlhwDSiOWUfTV5iLrbSA+UswOfS6bctaxYzKTBl0kbw0K7oWkFTxY0ESA
         D6ihjQ7JXBk9uwzJjHWIm8Dmla/xFKq3BtVMbeYJs9B66UIxN8i28qPsd0I3iiMFOuDm
         e61Ys3TnQ1bc+dpjfbV5G6q5AQcrd7R0X3ihc/VA69nnBhFFCreDbfGVYUq8LVQLN2YS
         GtwBpZS9WH+oIhaNHksVkfiGp4xvvUCN1a+Y3ZbRhFW3zlHaZmRwz2k2c+0L+veBFkVa
         FPog==
X-Forwarded-Encrypted: i=1; AKwUvBxu4rpbhUwFmv9gy35J2uItnRJAMHtP6HY91eTECE7oI9hPzY8GSC45Vt+1MPi6sGCnZ12sIcqD6q3h0ps=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL7ScfVWoOLx1Shq/yt5Pg2h/4tp03Ke8flTvJwxrETW1m4ARX
	Ni3foA5ZH4QYbk8A3j4oDirDyYvRkaCCqnzb75avpCemUsi+rlGZdPrzb9nseX2LXvQ=
X-Gm-Gg: AYBFou0QrmdaECFlVb7MEGorxL8R2BQkTMYTSPXa+pZC6lbrEmyF+X/iypzfcyZT8Fg
	TEesOacBGttjyKpc5pBgDWNcHUhk3PYYBL+aX64UBunleYNdcUS9TX4053oOLH6INUqbX+rwFSA
	9jPC3Pd6iYZgxhYKPwPRrZSMlhFnInN+GZIV58Qe4t5slQgmb3BROygZU9TH3hcJGecTutujtkg
	txDzWcICvZmRpimOL8CIFIjrGjUBPCO71LXbz3YvzNEh7WiymcxtrWF6kypqwoKYPTbK5az/L2O
	mFOVPPP8ji3JDdij4vr+C2W5hok8vrqFn8cq8lVUa+g0eOIZUNrcdERT766cLUIS4n+6hVbdDjW
	8uXTtZZ2bS2EFpnXVp1NpH9nEyqdSm3F1G3j7tqy9cR/AFyaeFfr6gx94s1m3L1hjxP/8eAqRO8
	GCgDX7v+Oqr2NDEgx2WcCPf3/EAiPpLIhujhOmlO4RzDd+aUCGjGLeYiEcEi+OHKUT8S8ntXfti
	1qFgOT9lQ==
X-Received: by 2002:a05:6820:1ca4:b0:6fa:db5d:be1 with SMTP id 006d021491bc7-6fadb5d1246mr6780700eaf.11.1792092183278;
        Thu, 15 Oct 2026 12:23:03 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f284d1sm18623a34.2.2026.10.15.12.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:23:02 -0700 (PDT)
Message-ID: <5bcc0ed9-b48d-483c-8bfa-ec31f111320e@linuxfoundation.org>
Date: Thu, 15 Oct 2026 13:22:55 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] selftests: optionally record per-suite build and
 install results
To: Sasha Levin <sashal@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <rbm@suse.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-3-sashal@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261014200115.1363363-3-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 14:01, Sasha Levin wrote:
> By default the selftests build and installation succeed as long as one
> target succeeds, so that a single broken suite does not cost CI systems
> the coverage of all others; commit cad6f32665cb ("selftests: Deescalate
> error reporting") restored that policy after it had been tightened.
> The exit status of make therefore cannot tell which suites failed, and
> inspecting the installation is not reliable either: a suite whose
> compilation failed can still install its scripts.
> 
> Add an opt-in report. When KSFT_BUILD_REPORT names an absolute file,
> the all and install rules append one tab-separated record per target
> with the phase, the target name and the exit status of its recursive
> make. Generating the runlist is recorded as part of the install phase.
> The records are written without changing which targets are built or
> installed or the exit status of make, also with FORCE_TARGETS. Nothing
> is recorded by make -n, -t or -q, including when the selftests are
> built through the kernel's kselftest targets, which clear MAKEFLAGS.
> 
> The recording helper lives in a small fragment so that suites built
> from subdirectories can add records for them, and the variable is
> exported to sub-makes. A relative path is rejected, since every
> recursive make runs in a different directory. Keep the exit status of
> the runlist generation loop as before, and create an empty runlist for
> installations in which no target emits tests.
> 
> Document the format, version 1, and how to read it.
> 
> Link: https://lore.kernel.org/r/20260416-selftests-deescalate-error-reporting-v1-1-38e7c0536227@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   Documentation/dev-tools/kselftest.rst   | 38 +++++++++++++++++++++++++
>   tools/testing/selftests/Makefile        | 31 ++++++++++++++------
>   tools/testing/selftests/build_report.mk | 26 +++++++++++++++++
>   3 files changed, 87 insertions(+), 8 deletions(-)
>   create mode 100644 tools/testing/selftests/build_report.mk
> 

I picked this up for the next merge window. Patch is in kselftest next.

thanks,
-- Shuah
