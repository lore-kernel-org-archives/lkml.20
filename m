Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631264BD79F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076238; cv=none; b=AkMJ7cgHDkj3vQy+DfKlwIZVlQiG/HRYbDIVaQ395qrQOv6crXPwrqDUH9eCJjF1NqbrKDAyl+r1I9vcgjy89nhmHGUPOQAtCJjwMHurH27KEj4UuYBwKQoS2o1kcVvwx9lzg7wxGEqVbKgThd+I1aIqLVmhuV3giyFS+C3N83Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076238; c=relaxed/simple;
	bh=8E8Fes01P0FnMokny4ycUlekwWtVOnV9rLiH+P2xHXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVs5brH5OJ9dRWmwjL2FZmKKkKbiHiUs9QoFQD5s5KuzjykGvhH/2NBaWPvEJPqKO9+3jI7FPIf6op45XAq0oChH+D2ijzUi3FnsgcOtZEUAKQPSuhNXRtBm34reh8kTXN+SWL020E3i+GZ52ZjsWZl0nS6FKxK+RXaGhP21tsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L0PhSIgy; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L0PhSIgy"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53582498790so18730441cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792076235; x=1792681035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdMD7NIIHUonWBQ7tMxlfEgdY/tQZaBr/YCC0/JY/pM=;
        b=L0PhSIgyhUMvFrwKCyH2b0USzjLmsFGOAspSRRwJLlwtPxkKQT2vYhzoZ+wIXgi04X
         9yeMkT3oLuInVlmhd47omGONVKiiaYnXEHtp1+Xy9zGjfInH6azKByKCQndVegZHANGp
         1x5Lx+LIwlMjwHQM/yVuBK7fIhX1BkN0+ZZ8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076235; x=1792681035;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdMD7NIIHUonWBQ7tMxlfEgdY/tQZaBr/YCC0/JY/pM=;
        b=lXCs4IPRlqZ/YjxTSWvT/uo2IDXTuuTfzPEsQ2IOuUMeof9ZuKoSf4Nj0hirHBwqEu
         zka3jRNhDQ0v+UzqfMtMB7i06WzURrm0bc/XOCcb0qoxBp8IlAkcmdDEL2MwJRlzNl9G
         QFIW/tOIZ+5rL3RQ0oW4PFOy5PPKs/uJEGpBefF2YUI4D1CL+5D+b5hEHgEpeBzFgJuo
         p6jX9Ha9sffYkoHxffKDnuqHf1Ez7YOFC4REvVj2YtW78G1YP44sSiQt6P6u2tBrxN/5
         Kw/1d+4qFPglCKeziJO9eCnZTBmmqiFXHLIlqqPEfUv1l4hT15B2iDm9GsdeTCb7OyLM
         g3pg==
X-Forwarded-Encrypted: i=1; AKwUvBwWYI0ASe2nFRwZb44qzm7l6sma7wKnbkcoYPprKvWisIzqXeg8/D+Sdda3uhT51kWYrYMKO+EjrbRBNk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYnf/0F3xiOYOqKkqdmvYz2Huf67u/AdXqccLJ2dWQR0n2Q4j5
	lBcKXgGgB5SbE5QmiLpzqVIMCley14f2dXrSy8BKCbKnwoExDy4Ha5VhNw2u7uYk01k=
X-Gm-Gg: AYBFou0SS3TlMfB4AC7+pCCPkLefjFfh4WlPgB8sGJ7b/YTg1ov1IleW/78oWRIRKtX
	HcIkEjJ9P8VLbk7u1WL0/9y4aapsyhaQYsootK2QbRSEIvmHSbztPhug1ITH1aaWYYkWeIhenWT
	v2E+Bf9K6GypMOAGEC5OcvBdeZ1iGWUWa224q039Ao4VHi3idtAXFXg8y6EiNJaMETJi1c+iK9D
	4TEMqg0N2Aac8IpfQvXvY78mAhOeCIqTkyaePPbu4g391UDpVMEHHsYOwcnXk2WzxQ6fLtBJpvd
	0EN32gNK9vROvy43IbeJ/Igtq5Zk8eRclaw2dgA/Up3QKWdfrxLiTpIwCeIEYBjqru4JSbOiPNq
	dFFXu+xq5NPpKUJzR72q4qaalmNgFfdBs2OwiQ/Kt4V9r1O6LS3qzIetkoDsxXrp4A8Q7TXRByt
	rIXmz5frSRN6N4MkkQ0skjUr7Zt3Ef8DuWP3USjjrccl+89xH9d0ukpCVAukKNRQB1hSW3cc/U1
	NlKP0Kz
X-Received: by 2002:ac8:5f92:0:b0:535:92a6:22e7 with SMTP id d75a77b69052e-5359fb4794cmr295144001cf.42.1792076235184;
        Thu, 15 Oct 2026 07:57:15 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53612830ec3sm27558151cf.27.2026.10.15.07.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:57:14 -0700 (PDT)
Message-ID: <8aad13a4-1097-40d1-a0ed-c44ef84838b4@linuxfoundation.org>
Date: Thu, 15 Oct 2026 08:57:10 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Nick Desaulniers <ndesaulniers@google.com>,
 Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Guillaume Tucker <guillaume.tucker@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
 <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com>
 <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
 <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 10:42, Nick Desaulniers wrote:
> On Tue, Oct 13, 2026 at 3:01 PM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Tue, Oct 13, 2026 at 02:07:28PM -0700, Nick Desaulniers wrote:
>>> On Tue, Oct 13, 2026 at 12:40 PM Mark Brown <broonie@kernel.org> wrote:
>>
>>>> +       clang_target[riscv]=riscv64-linux-gnu
>>>> +       clang_target[s390]=s390x-linux-gnu
>>>> +       clang_target[x86]=x86_64-linux-gnu
>>
>>> ^ should this be either i386-linux-gnu or i686-linux-gnu, or does
>>> `-m32` get set somewhere?
>>
>> Hrm, that'll just be a cut'n'paste from lib.mk which does not so far as
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/lib.mk
> 
>> I can see set -m32 - it sets i386-linux-gnu for _i386.  Does that need a
>> fix too, or am I missing something with how it works?
> 
> Ah, no looking at
> commit 624c60f326c6 ("selftests: fix LLVM build for i386 and x86_64")
> 
> it looks like selftests have i386, x86, and x86_64 where x86 is x86_64
> IIUC.  I see you also have a distinct i386 target.  My bad.
> 
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>

Thank you. Applied kselftest next for 7.4-rc1

thanks,
-- Shuah

