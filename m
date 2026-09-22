Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC1548573
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082671; cv=none; b=Le8OsgdY5++jAJ+vuKeb9Zh2sIG3u+2DF0ZDlcOahkO/NB4LOHKIRqMgJ7TqK/0BCBcL1WB2MslBjFberTNCxV+gc1M62Fvwc9U7cnesi/hHOzpPgAhB3Jn5mMyJ6hZL0gDr/1S3idh2bZdRfREzUiXGRyenQdUQ3JXh8/8Zi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082671; c=relaxed/simple;
	bh=W8zNYj6dw/AtbnlT4lLlzyYzsVQM0HPA9qCrfZzEi2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trmjwSubbaJJMwF0/I29HY1xmaFWxzszfuGIRcQ96zGBjzddUH/GtDAo1W3GS1VYId55hFGSIIW68N3l3EasCVeojjNRWX4G8e5ji/QVyrQn3AosmK0C37hLYGUUjLKApRex8n5sJuEOFCBcYnOZxw9rGdZBr2eppBSCeV9TS7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NY7DyYpd; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NY7DyYpd"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a9edfc851so70187866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790082668; x=1790687468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41cWkJ/5UQL6xSUxgMCACGWpjEl5WhxoWOYGlmYevvk=;
        b=NY7DyYpdHfLgqwQ93xBhkNL5yU550b7q2xDIqwjhneTx0LMLotMQ2nYv5s8FUoJIaI
         IexWqg3G8niIVzzFH1t9NS0ZVrWWbEApk1++QqV36Ck0ZzZI9KPpr8VkCLrYmUqhStvH
         U82jWAsT9SO6UUvhpisg+jK/rMnkFhCPSqImGBNBJo//HD411jzLEmYVcf0TckPdktGS
         54WP7+C+guelVBx4i5BX9j+H+mUNPOYPgdgsAbrl13Hau/2G57YthazSzwiqnDB08VED
         UqRpwvGVoqf8/OBlr4vcKxV4mjTVrxyYes13nff2QHSMc5BzKzf1HuQNp8s1L6LrHUXt
         gmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082668; x=1790687468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41cWkJ/5UQL6xSUxgMCACGWpjEl5WhxoWOYGlmYevvk=;
        b=Hzrp0Zl0sgH2SMSVbVhHccbfRHXfqpmzfdngprnYZRF53mf3DfDz7q1+TRstLiCgUE
         AlbayQTP3naGJiIR//oPRZhWcyc9gUZe0mJHh9baLmSIBhmYL6MMA4kB8zqbOJxaPZo4
         bHAOzKfovvMHlehrxVBmmYtQzQIkAmApkVuhMgvHNrxac/ghhyGfHBWH1vTwD9K8Pagz
         Ui2BP7SSqpvZvdOA7WqKHNCscaaFJBpbs8MLt2kGjqw7/ZKz09c37dllTnevog+KFqdB
         ogEthsaFZb1sWas5KVG6ssl3yXf5K5OF/PuFsI2ti5qIeZqzNtOv2RhsiylfGlQXg6pP
         3jPg==
X-Forwarded-Encrypted: i=1; AKwUvBzpmatK8q3d5OVpSrSetopt4rsT5cyKJmonq5BHOB4f6E8GWQWdgWBk04k//GI1ztVYFuVtr+wdV6cJrIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nRYEth8d3w4Zv475d5gAurPeg3mk2yF9HJjnPqs0mQFH95sw43
	UKsWT8dICSh9sW3HOGVD85hwYLuNg8mbKLTqNyEuiGUjIhFqLYtTjHN+ZFpf+VyR58M=
X-Gm-Gg: AYBFou3/bNLbtd2lOu9b2a1kTJXGqXyUGZrysWDp92HiKl9ICSmXpeNn/8vCPdVp9vd
	NFmqU4I0hLUW3rp9qadq40lMaDrCY6sh+kgazkRxL3wTVPphHMsqsLoYL6GtYXzNeSS6kCaYOT+
	2lvGIs6rMSUKo9L8BAZyEeM6Mbe78hMhjZY+jrnf3D5JbiTxymVoUy4jcUiwlrrXQk+foEo/pH9
	F+QEVndU+dgIbTvpsgsDoWv2IPvbs7iM1gRe4F/DkuMywCPHKodQx8iGl4WL+Ahu6ij7h8qTNGb
	ReC/0W7yp7ZTE+9Gx1QYFkZnjWdvjsoVUpXUrcGk1FNXPKrQZZWzPQ4JGTLc8y/jsyv2mzkOhUD
	WtCt5u65+RCr2o3J+RwqHnzDQGwGPcnLmGc/BYI+nb3HNzBc3SklnsuTNUt4YSlx5eQ4QgIdkCV
	FtWRJeVm93Q2DoWD8hn5xewjb+s8lHhpGKrnuJ2GSigojXNPArbDZuF9zbf0IC7eRaGXS6PleFK
	+SS
X-Received: by 2002:a17:907:3cc4:b0:c26:19de:9ad1 with SMTP id a640c23a62f3a-c2a15e53c92mr1279822966b.41.1790082667855;
        Tue, 22 Sep 2026 06:11:07 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aa9b14925sm7213066b.19.2026.09.22.06.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:11:07 -0700 (PDT)
Message-ID: <8e3ed898-5134-40df-84b0-b7cdaa777731@linaro.org>
Date: Tue, 22 Sep 2026 14:11:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/49] perf python: Add Intel PT call_return and itrace
 capability
To: Ian Rogers <irogers@google.com>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, leo.yan@linux.dev,
 linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 tmricht@linux.ibm.com, acme@kernel.org, alice.mei.rogers@gmail.com,
 linux-perf-users@vger.kernel.org, namhyung@kernel.org
References: <cover.1789966896.git.irogers@google.com>
 <b1d417e1f28afa565fa01b4997e3c31140e4772d.1789966896.git.irogers@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <b1d417e1f28afa565fa01b4997e3c31140e4772d.1789966896.git.irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/09/2026 06:06, Ian Rogers wrote:
> Add support for Intel PT call_return events and itrace options to the
> perf Python extension so standalone Python scripts can decode and
> inspect low-level instruction traces.
> 
> Specifically:
> - Add a call_return callback parameter and itrace option string to
>    perf.session, treating explicit None (Py_None) callbacks as omitted.
> - Expose the perf.call_return object with db_id, parent_id, insn_count,
>    cyc_count, comm, pid, tid, call_time, return_time, branch_count,
>    call_ref, return_ref, flags, and call_path (resolved as a
>    perf.callchain ordered from outermost caller to callee).
> - Export perf.CALL_RETURN_NO_CALL, perf.CALL_RETURN_NO_RETURN, and
>    perf.CALL_RETURN_NON_CALL flag constants.
> - Expose session.e_machine and session.is_64_bit properties, preferring
>    recorded thread ELF machines (perf_session__e_machine) over perf_env
>    so pipe-mode traces do not prematurely cache host bitness.
> - Support optional vmlinux, kallsyms, and symfs symbol configuration
>    parameters (and PERF_SYMBOL_VMLINUX, PERF_SYMBOL_KALLSYMS,
>    PERF_SYMBOL_SYMFS environment fallbacks) in perf.session, resetting
>      symbol_conf pointers and freeing vm_tm_corr_args, cpu_bitmap, and
>    ptime_range in
>    pyrf_session__delete().
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/python/perf.pyi |  35 +++
>   tools/perf/util/python.c   | 624 +++++++++++++++++++++++++++++++++++--
>   2 files changed, 632 insertions(+), 27 deletions(-)
> 
[...]
> @@ -4161,23 +4585,40 @@ static PyObject *pyrf_session__new(PyTypeObject *type, PyObject *args, PyObject
>   {
>   	struct pyrf_data *pdata;
>   	PyObject *sample = NULL, *stat = NULL, *context_switch = NULL;
> -	static char * const kwlist[] = { "data", "sample", "stat", "context_switch", NULL };
> +	PyObject *call_return = NULL;
> +	char *itrace_str = NULL;
> +	char *vmlinux_str = NULL, *kallsyms_str = NULL, *symfs_str = NULL;
> +	static char * const kwlist[] = { "data", "sample", "stat", "context_switch",

Hi Ian,

This needs to be "static char *kwlist[]" to support older Python versions:

   Changed in version 3.13: The keywords parameter has now type char
   *const* in C and const char *const* in C++, instead of char**

> +			      "call_return", "itrace", "vmlinux", "kallsyms",
> +			      "symfs", NULL };
>   	struct pyrf_session *psession;
>   	struct perf_session *session;
