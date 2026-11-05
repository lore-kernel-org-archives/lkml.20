Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894167;
	b=lv2emHOZBqsM9I/P/H4bwkyJBRaVUK4gP7MITIgvgflcMYJduLnTTy+2ZRlSJ2orc639
	 pkpmlzOEZGitOQ+OLCfrxjriMI9i7GioU5a9Qn2HSpZky9VvlvPIl8YLq453GIpwQWn0t
	 qqPBY+GvO2gL+D1Y3YyxLW1YgJZmPZ8cQwxIQzkTngKwcDYwCsbb5+cQaH7ze0MLX7mJi
	 0qbzm3tdVRMiIk/SNzlwO9Jyz4ue28kkGv+rkQBlqeBmTpUgtaY2YOh2zRfBsaDuTj2qM
	 sqMELexvRezyO1LyDD344+yemX51udAX/9NFzKrqIr1rmPmny4tOIYsYSTyJNqHHFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lBmH8CcGArjCqi+nJLDXWaRiUN/VD7YdP9zGGrihg/s=;
	b=kprnj+LAZ1S2cbkSXCt8zwnM8ibuzHbpBRQxcgLQi3/fUcBX2raPqbE+jAPAoppOkaq1
	 2nrsvdXLNDTTSScTwTJrG2y+AKEro069RYq8n6jjAgF67fhdztUDpWr+S9XoW84bxIwe1
	 SowKMfedufeVwVMndOWqszQKLxsN3bNdtI3o3chPom1veAFZ3OWCdU9yqrDhS4kpUvsb3
	 /+RvZooLIYregpQDgq4z73+zfgcZzphGf9ZqVRR/YorVz6v+84+WkgDVOhca0/ATqaP/s
	 pA+8YZX4jUM0hoORlwiorO9pBDe/lnXMLucMnr+agoX5faF7OiwvG5LwLI6cTOHLo7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LsqSa5P7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE9606E565
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BE9606E565
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LsqSa5P7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49231763f81so220453f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793894165; x=1794498965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBmH8CcGArjCqi+nJLDXWaRiUN/VD7YdP9zGGrihg/s=;
        b=LsqSa5P79oauPX2TdT+IJtqPkilAQD5Yb2FriU8d5fzDZ1C6weZGYIWUT0gOJAZ+7E
         C+p49GCaxVEZAq0acCTdCLSFyeci5EG4pKXP4Lsz17RAyu+BACGY624rkzbQ8PbvSYFi
         a3EIKntM07NqUYuy111TzT10vedLzZd2rmFNgMrYm49Op1CwNoXnibt0B1NHZoZzlYdn
         YjxGWqvyzdAgfp1FqHV0p+6Q1BGaS9rLehAFkZd9CtzAEaI3dPuWzFi0XqIOog5EtAEy
         FEgVYt/djsKMsHVYI5ohrj60dGltAC6FC6yLG3A+qkKUV0/65jiVxUBU/eBcI2RiYDBQ
         IqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894165; x=1794498965;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBmH8CcGArjCqi+nJLDXWaRiUN/VD7YdP9zGGrihg/s=;
        b=Asdqr8B+e7lcOQZslvyoxAacsDkrEItGUISyI6+/4YujWpkZHjCVK7VWjrC1j2+Cso
         eMoDt4mq9O8OVseED0Xbr/16YIiaJKyJp5Dx8qnhUEBiAugRU4eGHxtrgxzBsM3bgleP
         M3tmqYFwQy0APSzWyumVBslOK18qHPaxL7TlsEzY1D5yNkJ46sZz9XAN47ko7jZy525P
         Vo1k9j7ohj4jrN/yT7utQsLBcXWp7WSb6aUD+mLBfEXBc43QN2k8v5dd6SAspL8SUInP
         DvdJR5grMUEyLah+w2CQsqA5aleKjw5eGRP+UsbJnVMsZNGRUaSQogvOAjP1nSIgzpTi
         DhSQ==
X-Forwarded-Encrypted: i=1; AKwUvByzOfDvoOM8YhMd5C9+YkmouCnjOFxJ2DZTiX+ejUatl0NU1ku6Vj77bzTeAEfnh/nzwEy7XuVY3EIzQLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HALh2DnKSa8nuGccRJ8lv85u05VamB0+yFF2D42WX6U4U/Zk8
	aEx3TjkI4MNFggCPUy1ZBmDEdMuPLhGMT4abI9B9eQR+EZtElRO+5Mw/eBO6GJwoKzY=
X-Gm-Gg: AYBFou22DfdsSw2C+7ZTofsGxM8/aLhO9B+ZLlDLg9WnS61+2ZYVqZJeLqXVToDrYIq
	3AEZW2KRwV8SLjVAoLITuyOd040zJOk5a+53FNPqbOe9i4223kAG55Zk+vS/KfpReTECSWiN+qJ
	cpF+4tt1g3FTCl8cPYwVlwmMB/Ecg9s450zn/znMFrWPu5e/S2lJ8RA1qIU5Ynr/KMYwoZ7Xk4F
	F3W/OgMYY9Jb61LGwQ07Qrc3wgWjDi9uw4OtxqXf48CNkYuLEiRH46PaNyJBr8bM9iC94/wR59C
	swp0RveJrMXsYu/eMjLNrQWwy8g77/Q4p34D6yRIn9fAMo/HoHFhSSvUouI/c7cFeS6RToAQqCB
	OBFavW/3RAmkcwgSYHbPKwsmnkWlPWJFl5K77+oNsPGFkbz0vfl6iAUynnB4kpOGAhZtY5AQpQm
	sVWpyykUQSBLCjIZCQmelTu6HR/TkQNDy913f7lWNjw0EsUej+xPBrXF2zwVI4zFFA+OW9ITW5y
	Tu7ZjvkxdBm7OIr+KRxYhjR97Hpq3lSxfavisF3/RbAUGDLQfH5kWotg898J02mM8rvQwLCCFLf
	nJpiF9GjPH8xDJXtcOcIi1GpDj9m2MZ0iA==
X-Received: by 2002:a05:6000:4b17:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-49275fe4f50mr52740f8f.16.1793894165277;
        Thu, 05 Nov 2026 07:56:05 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm10525910f8f.14.2026.11.05.07.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:56:04 -0800 (PST)
Message-ID: <7fb3e764-e71d-4cd1-b481-963ea518dfd3@linaro.org>
Date: Thu, 5 Nov 2026 15:56:03 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf test: Fix perf probe testsuite
From: James Clark <james.clark@linaro.org>
To: Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Jakub Brnak <jbrnak@redhat.com>, Michael Petlan <mpetlan@redhat.com>
References: <20261105071711.31086-1-namhyung@kernel.org>
 <ea9091fc-c129-4840-80f7-ab5edc8d56a7@linaro.org>
Content-Language: en-US
In-Reply-To: <ea9091fc-c129-4840-80f7-ab5edc8d56a7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/11/2026 15:08, James Clark wrote:
> 
> 
> On 05/11/2026 07:17, Namhyung Kim wrote:
>> The perf probe test suite fails on my machine.  It seems it's because
>> the kernel debug info is not available.  Actually NO_DEBUGINFO is to
>> check the condition and skip affected tests.
>>
>> But it didn't work well as the skip_if_no_debuginfo function misses a
>> new error string for v7.0+ kernels.  Internally it uses the
>> add_probe_vfs_getname() to check if perf probe handles debuginfo and
>> check the error string.  But it didn't add the new error string.
>>
>>    "Could not find probeable line"
>>
>> With that added, it now passes like below:
>>
>>    $ sudo perf test -vv 189
>>    Not taking turns using the perf mlock budget: nothing can exhaust it
>>    189: perftool-testsuite_probe:
>>    ---- start ----
>>    test child forked, pid 26135
>>    Probing warn_thunk_thunk
>>    -- [ PASS ] -- perf_probe :: test_adding_blacklisted :: adding 
>> blacklisted function warn_thunk_thunk
>>    -- [ PASS ] -- perf_probe :: test_adding_blacklisted :: listing 
>> blacklisted probe (should NOT be listed)
>>    ## [ PASS ] ## perf_probe :: test_adding_blacklisted SUMMARY
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe 
>> inode_permission ::
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe 
>> inode_permission :: -a
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe 
>> inode_permission :: --add
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing added 
>> probe :: perf list
>>    -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 1 1 Skipped due 
>> to missing debuginfo :: testcase skipped
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: using added probe
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: deleting added 
>> probe
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing removed 
>> probe (should NOT be listed)
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: dry run :: 
>> adding probe
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding 
>> probes :: first probe adding
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding 
>> probes :: second probe adding (without force)
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding 
>> probes :: second probe adding (with force)
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: using doubled probe
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: removing 
>> multiple probes
>>    Regexp not found: "probe:vfs_mknod"
>>    Regexp not found: "probe:vfs_create"
>>    Regexp not found: "probe:vfs_rmdir"
>>    Regexp not found: "probe:vfs_link"
>>    Regexp not found: "probe:vfs_write"
>>    -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 1 1 Skipped due 
>> to missing debuginfo :: testcase skipped
>>    Regexp not found: 
>> "somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64"
>>    Regexp not found: "in this function|at this address"
>>    -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 1 1 Skipped due 
>> to missing debuginfo :: testcase skipped
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with 
>> retval :: add
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with 
>> retval :: record
>>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: function 
>> argument probing :: script
>>    ## [ PASS ] ## perf_probe :: test_adding_kernel SUMMARY
>>    -- [ SKIP ] -- perf_probe :: test_basic :: help message :: testcase 
>> skipped
>>    -- [ PASS ] -- perf_probe :: test_basic :: usage message
>>    -- [ PASS ] -- perf_probe :: test_basic :: quiet switch
>>    ## [ PASS ] ## perf_probe :: test_basic SUMMARY
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: missing 
>> argument for -a
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: missing 
>> argument for -d
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: missing 
>> argument for -L
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: missing 
>> argument for -V
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: unnecessary 
>> argument for -F
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: unnecessary 
>> argument for -l
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -a xxx -d xxx
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -a xxx -L foo
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -a xxx -V foo
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -a xxx -l
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -a xxx -F
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -d xxx -L foo
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -d xxx -V foo
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -d xxx -l
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -d xxx -F
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -L foo -V bar
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -L foo -l
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -L foo -F
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -V foo -l
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -V foo -F
>>    -- [ PASS ] -- perf_probe :: test_invalid_options :: mutually 
>> exclusive options :: -l -F
>>    ## [ PASS ] ## perf_probe :: test_invalid_options SUMMARY
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: func
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: func:10
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: func:0-10
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: func:2+10
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: func@source.c
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: func@source.c:1
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: source.c:1
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: source.c:1+1
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: acceptable 
>> descriptions :: source.c:1-10
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: unacceptable 
>> descriptions :: func:foo
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: unacceptable 
>> descriptions :: func:1-foo
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: unacceptable 
>> descriptions :: func:1+foo
>>    -- [ PASS ] -- perf_probe :: test_line_semantics :: unacceptable 
>> descriptions :: func;lazy\*pattern
>>    ## [ PASS ] ## perf_probe :: test_line_semantics SUMMARY
>>    ---- end(0) ----
>>    189: perftool- 
>> testsuite_probe                                                          : Ok
>>
>> Fixes: 92b664dcefab ("perf test probe_vfs_getname: Skip if no suitable 
>> line detected")
>> Cc: Jakub Brnak <jbrnak@redhat.com>
>> Cc: Michael Petlan <mpetlan@redhat.com>
>> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
>> ---
>>   tools/perf/tests/shell/lib/probe_vfs_getname.sh | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/ 
>> perf/tests/shell/lib/probe_vfs_getname.sh
>> index 57a59ae7d4ae3d71..c091cd208beec056 100644
>> --- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
>> +++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
>> @@ -64,7 +64,7 @@ add_probe_vfs_getname() {
>>   }
>>   skip_if_no_debuginfo() {
>> -    add_probe_vfs_getname -v 2>&1 | grep -E -q "^(Failed to find the 
>> path for the kernel|Debuginfo-analysis is not supported)|(file has no 
>> debug information)" && return 2
>> +    add_probe_vfs_getname -v 2>&1 | grep -E -q "^(Failed to find the 
>> path for the kernel|Debuginfo-analysis is not supported)|(file has no 
>> debug information|Could not find probeable line)" && return 2
>>       return 1
>>   }
> 
> I was just about to send a fix for the same thing, but I had something 
> slightly different. I think adding "Could not find probeable line" 
> allows for false skips in the future even when debug symbols are 
> present, like when that function was re-worked other times. And that 
> seems to be what Sashiko mentions as well.
> 
> If you just try to do a dry run probe of getname_flags() which has 
> always existed, then its a pretty stable equivalent for whether debug 
> info exists or not:
> 
>    perf probe -n -v 'getname_flags $params' 2>&1 | grep -E -q "^(Failed 
> to find the path for the kernel|Debuginfo-analysis is not supported)| 
> (file has no debug information)" && return 2
> 

I included it here: 
https://lore.kernel.org/linux-perf-users/20261105-james-perf-test-fixes-v1-0-0b279bee5830@linaro.org/T/#t


