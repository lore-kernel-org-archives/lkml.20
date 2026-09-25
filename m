Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355594968E0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374764; cv=none; b=s2KXNxt/joCtrdplxFB3trSGROEqQmk5VNfvWzxOs6CIxLLnTHwiMLid7HJJmlNXeC/HEl+QqSFNQDzW3cFwrJ0UL03R4Bcq0Hrg3c6RBwM5vd3clDBVmNeZQqgE4lOzA1zZ+jeTm2VzvfB0Nv/V/OokWFZ7hdNKJj8caZhRqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374764; c=relaxed/simple;
	bh=152hnQ82QfJ0LW+Dm6mPNkhaiXoMmZUG70QpGAGRnCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gp1x/V2KfY1QLOyEQtkZaqwa9fmbTJdftIIni/4kC5CdppUQSseEvT+yPPh+/l0z3qpG6QS38SPdsZmgme5mPlwjz0FwU7MWPXcZP0/JDtGdVaeZ8LgF5aR9AHqeSusAc+Dy9dIdatNLVOIbhTxPyOI/XMUyyNdMWgfDgTkovR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xf4uHEk4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xf4uHEk4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso14473045e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790374761; x=1790979561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZ13srzmxe7uWv22g+0yXS08pgsXrImaRy4OqvYDzm0=;
        b=Xf4uHEk4NuRUeWii1BKdAA2xpt/Auoam8PYnvyllKTcG6OipsHyIZG2v60/IN+pLlo
         PorljFt2s1kvWCH/KaW/HSlgClT1rP/8QCuNBwZn52QGqYZ4Lmqd8zM3xT80x1Iypl+R
         iJkF/oMxE+4SGlF2twZn8Inm3p6HeJr3uL8y+bctYp3ZscOJMfUoT6Mzq+XoCT0RUim8
         9FSjAgKHdErgVqi/FjOs1zY1AdFxXwaLN06VJuy8f025CapQ9BwZuLH8HanK51yEldvB
         Ut2TWs/NOKdsEoQXcTxUw8q9vdUjRRfi1gcD/BPPiX9AZTRXrXe83IFfZdRidv8Y+Hn6
         jObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790374761; x=1790979561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wZ13srzmxe7uWv22g+0yXS08pgsXrImaRy4OqvYDzm0=;
        b=ddek37c70Pxi4TF+waQmKdazsP88vYQv/tj5oic7U/uy0vUkJcAhJscqua0fvnEERk
         lyGbWorLn+tpXPj/t2ET4D4gaEes63C3GO4BQm7zbX9WY6pg5QSM82o9iSZ1slZgpenb
         5XqTjimixYkVqZtdgeFbcx8BQDb1x8mFlBftuKcQIpIrSfXDc8CBr1S+vGY0hNGKbHbU
         G5VJxY1ldCZiRIUPhREswu3MG+AsZ4ioOevahZZaOA+nQaC1yJl7ITPv+fSE7vH7mkGJ
         n8gZEOe5GjITz/hiqTz3weWqJpFkfEc/ckaa7fWz+IY2xo99jP0qK1Zt90Hd84r5HiLy
         /PBw==
X-Forwarded-Encrypted: i=1; AKwUvByWwdWHedrxK6SKX2KXjMMPir2oi+xNkF5vrvOy8lIvPrKQjZVzMpmdm2QUPSefnSQ4xR01od+eHXIRHG4=@vger.kernel.org
X-Gm-Message-State: AFuF++kezHRjfH4/I1vA9MASCZOyQ1kamVKEnXidWQyvaTjg4txdhUb8
	InqJ7k9pl3fmNEn/yo60/DxYZHsDhvQVAShj97jdZA8KB4J1FBTsmoYC
X-Gm-Gg: AYBFou003mNpEeZ3YoQEbKGIf5SYRGmtX1njicTCt6yi+wQCmLeZxti4BQHPqAfyf7/
	UmO6sbG4prVwrWipp6UIQZqiVmsbnYj0PxkpSXObQHoPRIpOhrncaDu19mR0IVUCIahSCYg/Z/y
	iD0DqPuqT6THMEjPdTMj69inTfeQQFR1FDo/lqm/yBbXxUJW/LHV+k6oHnL52DjUMy7kuKEEdai
	0UK8UkmgUfXhy0xityTrdwA+cP34jTZvlBMZTF12fUVmyMzzjZ3VY6CGpOfELsIymGO8GGxg2Fi
	zSDpqNPvHvd4jy8+869c8blNFHHlR+k1bZkt2tyV7D+jdiEZwU6+lwO7UAdWLnLOWUfenN4fDTD
	yQa7qGUCudk26svLXaLGM3TC9m+rY0chQ2CwUOPTDliQIaNShOgGk6rbV6btM5qt2/BEnhiuXhc
	MC/A0bnztMpPM/dRgTXAzvcXepHneQNBFpeyxyUHqXB5MrRwbfbGPrb2W3MlFGUhQ4fLzHFUFyM
	HI9J/bGdU4mVUoMfcK9HpQh0+DRofy8cZKvbgJoZ3YkHmT4tszS59M5UxQGrb86Ve9Ywp5kie/g
	ZU0=
X-Received: by 2002:a05:600c:6287:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fe7babaadmr113896275e9.20.1790374760917;
        Fri, 25 Sep 2026 15:19:20 -0700 (PDT)
Received: from ?IPV6:2a02:2149:8bb5:f00:90c3:8a8a:2e7b:7fa0? ([2a02:2149:8bb5:f00:90c3:8a8a:2e7b:7fa0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm10464218f8f.15.2026.09.25.15.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 15:19:20 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9f0af6b6-bf78-4f4f-96c1-7e08d574b905@gmail.com>
Date: Fri, 25 Sep 2026 23:19:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] kconfig: tests: Reset KCONFIG_WARN_CHANGED_INPUT by
 default
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-1-286e5c985244@fritz.com>
 <a1efc002-c34b-43a4-be02-ff4746d13241@gmail.com> <arTSvcwLenaZwKm7@levanger>
 <179036642082.3653489.376583884931759728.b4-reply@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179036642082.3653489.376583884931759728.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/26 21:00, Nathan Chancellor wrote:
> On 2026-09-24 09:35 +0200, Nicolas Schier wrote:
>> On Sat, Sep 19, 2026 at 06:29:39PM +0100, Julian Braha wrote:
>>> On 9/17/26 14:38, Nicolas Schier wrote:
>>>> Reset KCONFIG_WARN_CHANGED_INPUT by default for all kconfig tests but
>>>> those which set it explicitly.
>>>>
>>>> This fixes the 'warn_changed_input' test on systems with
>>>> KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.
>>>>
>>>> Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
>>>> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
>>>> ---
>>>>  scripts/kconfig/tests/conftest.py | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
>>>> index 66f95e4ed58c..e92f0cf1421a 100644
>>>> --- a/scripts/kconfig/tests/conftest.py
>>>> +++ b/scripts/kconfig/tests/conftest.py
>>>> @@ -34,6 +34,9 @@ class Conf:
>>>>          """
>>>>          # the directory of the test being run
>>>>          self._test_dir = os.path.dirname(str(request.fspath))
>>>> +        self.default_env = {
>>>> +            "KCONFIG_WARN_CHANGED_INPUT": "",
>>>> +        }
>>>>
>>>>      # runners
>>>>      def _run_conf(self, mode, dot_config=None, out_file='.config',
>>>> @@ -57,6 +60,11 @@ class Conf:
>>>>          # Override 'srctree' environment to make the test as the top directory
>>>>          extra_env['srctree'] = self._test_dir
>>>>
>>>> +        # Set default environment variables, if not set by caller
>>>> +        for var in self.default_env:
>>>> +            if not var in extra_env:
>>>> +                extra_env[var] = self.default_env[var]
>>> Maybe it makes more sense to have the tests ignore users' env vars if
>>> they would cause tests to fail? For example, this recent patch
>>> explicitly unsets the KCONFIG_WERROR flag:
>>> https://lore.kernel.org/linux-kbuild/4d1eee3a-
>>> a5f9-467e-880e-4f2815851b09@gmail.com/T/
>>> #m25be9ad4d5e62956c5f98759398f91a555afb4df
>> Good point, but I am not sure, if we really should ignore all of the
>> user's environment.  Maybe it's better for now, to just reset all
>> environment variables that start with KCONFIG_ and KBUILD_ ?
> Given these are Kconfig tests, we could probaby just ignore KCONFIG_, I
> don't see any instances of KBUILD_ within scripts/kconfig outside of the
> Makefile. We could do both anyways and just adapt based on reports
> though, I don't really have a strong opinion on that though.

Yeah I agree with this, since I would expect only KCONFIG_* to have an
effect on the Kconfig tests.

And after digging into this, it seems KBUILD_EXTRA_WARN does set
KCONFIG_WERROR=1, but as long as we're clearing KCONFIG_WERROR, it won't
matter.

Kconfig also has the 'CONFIG_' flag, which (if set) would break
several tests, but the makefile is already clearing it for the
testconfig target anyway.

- Julian Braha


