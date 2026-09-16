Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486DA4DD3AE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578532; cv=none; b=iZSSR7CJqc37Kd1B6eNIBU8HCB7uFOJefuZH5PqHqcSoJDiT4JdlLHOHlZDPA2JZYV2u5UW4VEf4cOcQEbabcVsu9NlukxOto79b0ee0gYaSJQyU0tdeFmQWqkH6tKbxCQZfqnC2ENRErUG1sKLUzJs+l9SDNc3Q1vFq4zcCMdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578532; c=relaxed/simple;
	bh=KQwTtWF9e7NnliGZSfK0AfwbAMFtivtvmguqsIAkOVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dliGgaAkrBwc8QMsDn+08fjeejnay/F4Pt7gwpvWKpBhzbeTAbQ5ta5Iu882vbwEenGly4B5mmrYbZhfOwYwj5IqHz9QfetpNYcYVP+pEbYAazX3PaUVhSRiKhc1TrVrt8j5et8Pl8TcyAc95Bv0k/T3Ed8JoSyz6pl/9eaUDI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atdrWoYt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atdrWoYt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3986635e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789578522; x=1790183322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N28J0VzbFodwXxNV+R6CAv+u3dHEZ4luEdBN+JrJawg=;
        b=atdrWoYtE3CLXaCxzbLIfhuMSk0dQw2pDiXavixMP2Gm5xuY7WUgCLxa04FuF2Xe0y
         vIWPEoq5J9RGHFImdtnOeprXBuhDu1M2b2pJdshoeMxskmD/iz9iWcvxORpCulFon/B0
         SykjdLm5EUvKQtKdAI50oEHdUSIFwgyfVVWhf3MtgOz3yMwi/TKa3MrGofN9gxjSlN3J
         BT3yrmEbjqAgvPamFgPTQwnOHq6C9RtMopOhPnSvF7hBjTIJN6shvjpqzUDIaehdHzE4
         2GWeWLazP77hflvX94vhgj48MLfVpUtYPLIX6NOibVaFvPQXVrdBzHM3n0TMknttsPuc
         jYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578522; x=1790183322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N28J0VzbFodwXxNV+R6CAv+u3dHEZ4luEdBN+JrJawg=;
        b=dTyJoScInAcqhayrhLN/Ms5m4EeyRPtSESBpF4lfXFl34KUSnhc7OromSEBNRdz0R1
         wltqRR+Z/KLJx1N9dGnVqGTLCHmHjp1Jgn8QWhEUCx1pZhBUrQ3XJe/ghDBiuevwyYAW
         IHtuHz88eD9UmskhtGKyylAlyTG2kP9N5IAQ6JLTuziI11DXXCDT8aMFwL0dKffQeTYB
         VFtBw7f3qEYFhjq2TL5FcFf7eup516s5KAFAlqKXkgLXD+o+OFeN/2/GKo2nsQ0sWqVU
         SY1vjkk60HVzAbgnlXyEKBugq5C2kaYUgTkNzkCsXBcVZhyfGgU0+bPkQGFStmh55B2q
         vzrA==
X-Forwarded-Encrypted: i=1; AKwUvByBentDgc4pZkZuqa/yamRKur3y7PYLHKdmzGDaKSRG69dpWNzr0im8BqfPYCffvG32Rq7a2hGAleziYK4=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqjWa8vA9/XkzmWp71oZWxBX5jnjw4X9jBt67ou80tofOUFFT
	Hps6+51NYKsdlA/AAux8VMbDrEkXLtvYJwSZJCYHYeMWL43D8PxyKuFO
X-Gm-Gg: AYBFou3ATfm2SI0Eqwu2wWSZAJpu70clvHQCjt7TRYfcqDS8Y4aCO0j/TtaGB+hxhJi
	mI0P5q4fqPWYootvyGna6gsUnkl6N2dJBggoGMQgHr5I/AcrDTIvzA6YviXBENFtiPGJAlMFsXq
	Oi9F5WdREdKy8Q1on3NIaBISftiQnImXr1pICbL+yqIPsJf7HUGPA4Rdehcr8ZDcAXPFfWLm9I8
	zOyi4oQ8bx/XoOXrdsNczSkvYZj5FgSWb9YRJg+ASKBCg4GJi8gJruGgCA4F8U5QdyfqlrDIfJw
	ZdkgYRGdRef3weZygR1BCeEguDgpbWPvTKi1bB3s6OG8dkTn6yvUmnUAfy59U95ffmpUirZ62X8
	NvTpS6xHDXXL+69/UfdOuWAqyPMB4PsN9IBOCdDBrEAGd1JQGGkNMksolkmfaH4hcsuPFkim2/z
	iw97wf0V8DfBXN2LovUDEPgcpiJ3zSnXux8xoRYJIP/OXbrbcbG5BoBzEYvufh/JxQF4v0TnVks
	mXzmbzaUnNVS/3W4+8xog3mo2Wz0GXe8pXpgsBlDfTkaBs=
X-Received: by 2002:a05:600c:1992:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fbd1af43dmr5334825e9.3.1789578521921;
        Wed, 16 Sep 2026 10:08:41 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:4a5e:f479:a4b6:a0f2? ([2620:10d:c092:500::7:90fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23f4e6sm5453365e9.8.2026.09.16.10.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 10:08:41 -0700 (PDT)
Message-ID: <f05088d8-749f-450b-96d6-a1df93edc02d@gmail.com>
Date: Wed, 16 Sep 2026 18:08:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2] libbpf: Fix program log buffer size
 validation
To: Luis Vieira <luisflavieira@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-libbpf-log-buf-fix-v2-1-2feca3fa4842@gmail.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260915-libbpf-log-buf-fix-v2-1-2feca3fa4842@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/15/26 7:13 PM, Luis Vieira wrote:
> bpf_program__set_log_buf() checks the existing prog->log_size instead
> of the incoming log_size argument when enforcing the UINT_MAX limit.
> As a result, an oversized value can be accepted.
> 
> The setter also accepts a non-NULL log_buf with a zero log_size, while
> bpf_prog_load() rejects mismatched log buffer and size values.
> 
> Validate the log buffer and size pair consistently with bpf_prog_load(),
> and check the supplied log_size against UINT_MAX.
> 
> Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
> ---
> Changes in v2:
> - Target bpf-next instead of bpf and drop the Fixes tag.
> - Drop the regression selftest.
> - Validate log_buf and log_size consistently with bpf_prog_load().
> - Link to v1: https://patch.msgid.link/20260914-libbpf-log-buf-fix-v1-1-f592caffcc71@gmail.com
> 
> To: Andrii Nakryiko <andrii@kernel.org>
> To: Eduard Zingerman <eddyz87@gmail.com>
> To: Ihor Solodrai <ihor.solodrai@linux.dev>
> To: Alexei Starovoitov <ast@kernel.org>
> To: Daniel Borkmann <daniel@iogearbox.net>
> To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> To: Martin KaFai Lau <martin.lau@linux.dev>
> To: Song Liu <song@kernel.org>
> To: Yonghong Song <yonghong.song@linux.dev>
> To: Jiri Olsa <jolsa@kernel.org>
> To: Emil Tsalapatis <emil@etsalapatis.com>
> Cc: bpf@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Acked-by: Mykyta Yatsenko <yatsenko@meta.com>

>  tools/lib/bpf/libbpf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 613afae26519..f7a0517d8fa8 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -9966,9 +9966,9 @@ const char *bpf_program__log_buf(const struct bpf_program *prog, size_t *log_siz
>  
>  int bpf_program__set_log_buf(struct bpf_program *prog, char *log_buf, size_t log_size)
>  {
> -	if (log_size && !log_buf)
> +	if (!!log_buf != !!log_size)
>  		return libbpf_err(-EINVAL);
> -	if (prog->log_size > UINT_MAX)
> +	if (log_size > UINT_MAX)
>  		return libbpf_err(-EINVAL);
>  	if (prog->obj->state >= OBJ_LOADED)
>  		return libbpf_err(-EBUSY);
> 
> ---
> base-commit: 5ef40d69b38a93bc9951dadb1a15c85c597e1a40
> change-id: 20260913-libbpf-log-buf-fix-49f5038caa5d
> 
> Best regards,
> --  
> Luis Vieira <luisflavieira@gmail.com>
> 

