Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E253D433E61
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154919; cv=none; b=sEQcZtwWY8HAazitSpS885M6ps/STXSaIDZq1vi/UtpG0lXmzSoKJMwlfL9DksDymWulhH0aEy/RKTwyBTE/Fl+5AKs69pYTouRlUNBVCdGqN6UXm6c68qQOUlqWKXWQ0p2nDhO/ZTbrcpGex2jVMAv9xVrO6kyD2VRMLXfN/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154919; c=relaxed/simple;
	bh=6D/QwhHbhAw48PLOUD1e/RlhNasr0vbYm/dASxiUKII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMCph3wysFHf2FZp5M0nTZB1y1tL64G2wEBo/7sb0Y0XN8R7yOPd67tA/bf6gH8pzMFq59HvjuTH+jsO9ZxjmX/8hLddBr99BIXrem5fj2Uq6KD88wy7k70XIZeEq+TdLcTusf+YTts8q2SqDi9BXdVqY7Gv9W5simuBbPInA50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlkRxNGo; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlkRxNGo"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so1148214a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790154916; x=1790759716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWPNdBRci+ilO56uoSaBVlNcIj5sRExNLvAX8TWjSSA=;
        b=BlkRxNGocPuvqXvgYW7acyFfDofjkraqMVpNErOzSs2TfPF8qig9oDgqx9aB94vQjP
         tdzZCIcHLGz1GGSzAPoj4MveHwe7REKAJ9YAn47eek+GbWwjNkF6q4oIkj/vGYpe9Kuz
         98xxjcsw0JyHWAZhWzipkTggBCy/BsdaSfewmYPwlYodyku6l9FpNWdk/YyYcoXvGYTQ
         PfuMq8R0AtqLpfm3WSb/F7fCUvA+YHjV9mNXRsNdbBcJnlTePfRCALY468vpd+Cv85w8
         xlj41NCld/QeV9EaPFsdquhL77Z1Y9TKDj7o63+EmgolHWvAHwR7qyf2WDEYOAyk+GO1
         KVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154916; x=1790759716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWPNdBRci+ilO56uoSaBVlNcIj5sRExNLvAX8TWjSSA=;
        b=AF4MshAITV610nQ+NB5dg8GNHt98trx9GhIYjaZH8rOhY+uTNexns7GLtibG670/Ch
         ZU0rND3LxmbNXDZHjOH9sU3ikBcjItujhfkQdEOqhstbakboB8EMzqapYkCyY5lbDZ1E
         TLi5uaByMMMMEC8+JwaYPVPKIkn0cOqzGdA0HwU1zNnep1Pg9mFqlrSUR6KWS8/fBKsO
         gEUTfFl9uXwMev78lUsh2F4A3H7tfkIWhwZJgIb7ZQ44HHkOaf/RCNGPfzLcFZvreM/7
         s7jvbZb5gQ04fw1CRBd3imH83mJGYjxhsZyyBNGlrL2TQmFNAnG3+xut15JMBk5FVQ5a
         nEWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+FBVBWzTOo/DC/W5nk6ozN9GlkjB8mwT+O3CIvmLMhJCATgMr7KsRgQtA1CeROxbkdfNrr+VcFleN13w=@vger.kernel.org
X-Gm-Message-State: AFuF++lV7KhhsOFl74dLf7YWLj/uZ2xf+g+6Vnt8F/kbkFbiNe+v5p9K
	5dd9y42pQpBw8IY0+7F2v8zkY5Y2LJjrAF4DJ0hLRCGNEw2k69WZF+IH029z6Jk/UAs=
X-Gm-Gg: AYBFou3BqDtn021+bcyptXS+UuRkPTqi2IEuNrlF+KrkMJHWXnB0iF7JriBMTan1rF0
	hasDFsUsNzRQlPtDTBctv7Tn2cdQafOmy/Zknd5Fnbni9dIEOBj116MSNeBZkslgyHN5bnVt6LA
	u5onvSCd3pZB/NzsC3g7z46xquGZ3y+BEtzYyDWyjIAoX2MZYJcygESHH9CKkQYvBq2pO6BZDbB
	min5lC51WnuZS8jJlzdx/TVdBbEaT8bN0pvsXBcI1VWSP/ENLifPqS10cLTIFR9iADXEulggAGr
	uSg8Lu2/1wM+dZEHVyATDEe3vaLu2XZEjmvbf2ZJJUUl+jPq3lHTgWBWVHriDSqx/drHZalaRbo
	uBOIjwx0RHG5NUCVoSklJm8jPQDTNRO9gzvIJBiSlSMXJroAUX2kCXMyGelv+alsAiXLYoDIyEf
	HvBjiVXxepAMLl5/7QDafwAPsspex8InLVcwEqnDDvgYiZfb9TnNZcbmVe/PpeKtA9+xVQy3D1u
	Yk=
X-Received: by 2002:a05:6402:4516:b0:6aa:734a:a082 with SMTP id 4fb4d7f45d1cf-6aab3b98705mr1736439a12.25.1790154916043;
        Wed, 23 Sep 2026 02:15:16 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37478c9sm1181333a12.0.2026.09.23.02.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:15:15 -0700 (PDT)
Message-ID: <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
Date: Wed, 23 Sep 2026 10:15:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Puranjay Mohan <puranjay12@gmail.com>
Cc: bpf@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/09/2026 21:40, Andrii Nakryiko wrote:
> On Tue, Sep 1, 2026 at 6:45 AM Puranjay Mohan <puranjay12@gmail.com> wrote:
>>
>> Hi James,
>>
>> Can you review this version of the patchset? It is implementing what
>> we discussed in the thread on the last version.
>>
> 
> James, do you mind reviewing the patches again, seems like Puranjay
> went with the implementation you suggested, would be nice to review
> and ack, if it looks good to you.
> 
> Mark, Will, you guys seems to be designated as maintainers for
> drivers/perf/arm_brbe.c, can you please take a look and give your
> feedback as well? This is important and useful feature for newer arm64
> CPUs, it would be great to get access to this functionality that we
> had on x86-64 side for a long while now. Please help get this upstream
> or, if it's not in the right shape, guide Puranjay towards a better
> implementation. Thank you!
> 

LGTM, and the Sashiko review is good too. It does conflict with the 
FEAT_NMI patches on the list, and you'd have to disable NMIs but as it 
stands right now it's ok.

Reviewed-by: James Clark <james.clark@linaro.org>



