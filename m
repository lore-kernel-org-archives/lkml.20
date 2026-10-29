Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270131;
	b=aCXN+OocUBoWCoYGw65a7e0OJFj9Z/SIQTR9b3hQnUg5SgyessS1wTRLHSqNQxRz1bEj
	 ypZAZeBtz6s/ihRNmCt1pBsk+tHpYU9bpPQUovLyPZTHlYItHVOnt9xHAolDhTVdAVdiV
	 OMPaHUloIhZHYgFCfbjdsPeiWa0+JoKCWgysf/JVk7Tvga3m/HBLsIbI2bqa/MiBKnhTe
	 nynohDG/GZ4t06wxVVvDVpwdb28M2yaDijosatQ2ByboRG6G2L/5WAgYzmuwK1fEGgyIC
	 83y5p607rUStPRDdGPocrluejLcD0O+M1u4Xsc7bjau1kT6xVFv7bx8oGRlfaOeC6qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=G+dOdTKmIbVkiM3lsAF+c1rAUHzJmMdTQfVlB9f5eEM=;
	b=I6P/QJY2bayIZHQ7dh7f1e3JNHZtgtp/BQkeFJ46FX2nIL237cx061N4pRLtfVhJCigI
	 2jnO/kxAnua4hKUbfCULX/QaqGCY+/fwMpwx4kv2A17+nvQjVJ3jl4sz2FJDb7Erbjobb
	 u22SR7CxNxpiiBVbz9npRv3LOfDvbaoTK069qTLLtPEbz5DyfRfHVh0VS3Juq8hO/1ZE/
	 l+c1IYsNQOYMQoqKMKfJJYuDHWh4oaTB/UMhDYYf5iFrioAnY8DkqIHRJPJahMpTtiezT
	 3HtkCp5L/sSsAsoMWu9pxE0IsJP1jp0+IVOLs1KzsUc4oXFo5DnrnaaVfFvRGm2/2Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLHiFmRK;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94573606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94573606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLHiFmRK
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so318875f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270129; x=1793874929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+dOdTKmIbVkiM3lsAF+c1rAUHzJmMdTQfVlB9f5eEM=;
        b=FLHiFmRKhs6aQ57aD71jTvzjsCiFe140GiCvw03h8p9tCU/LxQPpTD/CznQGXt6IyC
         S840b28cvdOaRql4iIbJV7Yocz7zbiDBpaEKb3wksBcgmMzYXMkdWMh5Rml0dZAtNx5B
         NRYobEc1tCH6LlMQ63AxJ3FF0mCEHuNWq5GqMZEeSYhLCatYqLlMfqDixzKA2A0vDRac
         iuWbLnexUkVT0TXMIKrBr5rAeyGsGNSwyT7ADIHJ8AV5Mje1PkZ+zwj69jhgp6WwM/GA
         bp4FFfO19/jykqwD9ti9swP86Oj04mnPEccTXejLHgFP3l76gB4Z5f283u/xZiDpOsMl
         +kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270129; x=1793874929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+dOdTKmIbVkiM3lsAF+c1rAUHzJmMdTQfVlB9f5eEM=;
        b=rGe/wqxHcOlW2GQldDbjVKqYoHqAo1F1wm3WXMH+sqkcnsYxuI4LTvqpzfO06TR6CM
         ghBDa0mudJMFkK9vJD+u9g09Qa1WU4LxCtqRFeqJrMV8oEpuXKHZR+f/SbuL9ViR7z4R
         nbs23G2bUi8Rh5dtzQLKo3kyzHtSKNgBxDdPuO54rr19V11S4f5hWZhtuZqsCAD4qG/N
         An9dAeX7l9Zxv0jYiXQMye8Y3BGwUvCQ1tIkVHIReIcTw8hPbj0b6HAhyp5x7l+dIH7U
         UzF5xKW5j3mTsg26fJfKkTahk8swB2cTtzgX27r3i6breSeJUsULsFYO+0C1xH7QR5zC
         5yHg==
X-Forwarded-Encrypted: i=1; AKwUvBy0tyb8OQ4oiXo3PcKvfJz/PIzRa4wLINVNWyszjsDhSbRgSIed025oTJCRFHXb3OBcKlclOU00/b05Myk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4L2+u+hTRZSY7jTP1jScTp/kuhiJlm9l4pIn3sPOYHB7oTREA
	0Wlf9E7OsH5gjxHystO1jpj/9Ls16Y/H2r0sIgfocn4jao5utuwIZRnt
X-Gm-Gg: AYBFou37kiQe1ysA7ViU2Kg20ZYmwTYVfeR3SI6TrRuNtxdS0MuUFhjVGf3OkF5wKbo
	qlImpDWAHzyOITzFKNrHU/Tjqf5hnUkguf79REqOAszt6jSi6UzRUNc+hW8qZSu5tYanXCntGnl
	qf1IxWysxGtc94fv35oEBzCEnUdIFfQoeg5TGoO0HdIcP0BnPecYCoyQytWhS1lUbpiAEKzMO25
	EOEtpwDMebujbVciDNt16gHuExykzTSw0BI+2bbflOqZVQ3DIs7NwYOfnhJO7Lq+JdcMYwGpz71
	tj2ZiID4PeN+EAU1CMy8zd1PbBT79SzmgTctr0HfUOXKW8BSQ9p1K+71GccK0QpP8UF2IXF0U6I
	YaoqWJAQkzfAlNzC9tkyJZUSqJboopTXcW7hurWtKF2YjMx1O/U9ot/Mu25M5UfmYNzIECcErfy
	QXwzyIlMHQaPjo8YFoP/u/U1YdiIfLObqvfMI8tokcc/NErLykOUyILDsOkxZXyaC16Of2M4JMI
	A/fbkL0ZNzdp3ngGXiX0rajIHccgBNf+m7LfIIHnkl+1Owy5BGtQSYC8evA3D7/tp7c0OOSoLsN
	GS9uC9gf3Sravbdtu95H0/NtzV7bFIRCuQaWqO7bUx1u+w==
X-Received: by 2002:a05:6000:2893:b0:48e:5e63:27fb with SMTP id ffacd0b85a97d-48e649b1219mr5739523f8f.20.1793270128547;
        Thu, 29 Oct 2026 03:35:28 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm36580278f8f.48.2026.10.29.03.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:35:27 -0700 (PDT)
Message-ID: <3b80c557-ea63-4d32-8901-3f7939ff541c@gmail.com>
Date: Thu, 29 Oct 2026 11:35:26 +0100
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
Subject: Re: [PATCH v3 2/2] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
 <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-2-16ad772850ee@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-2-16ad772850ee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 7:24 AM, Qiliang Yuan wrote:
> run_vmtests.sh creates a loop-mounted XFS for "khugepaged all:file" and
> for the pagecache folio split cases of split_huge_page_test, since
> tmpfs does not give them large pagecache folios.
> 
> It only does so when xfs already shows up in /proc/filesystems. When
> xfs is built as a module that is not loaded yet, the check fails, no
> XFS is created, "khugepaged all:file" is reported as skipped and every
> pagecache folio split case of split_huge_page_test is skipped with "No
> large pagecache folio generated".
> 
> Load xfs with load_module() when it is not registered yet, so that it
> is unloaded again once the script is done. Match xfs as a whole word,
> as "selinuxfs" contains it too, as does "vxfs" on kernels before 7.3,
> and would otherwise skip the load and leave xfs to be loaded by
> mount(). "run_vmtests.sh -t thp" with xfs built as a module and not
> loaded:
> 
>                                         before    after
>   khugepaged all:file                  skipped      run
>   skipped split_huge_page_test cases        43        0
>   xfs loaded after the run                  no       no
>   xfs loaded after the run, with
>   selinuxfs or vxfs registered             yes       no
> 
> Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  tools/testing/selftests/mm/run_vmtests.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index e104a9c6fdefb..b422edc2e2664 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -412,7 +412,7 @@ CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
>  # Try to create XFS if not provided
>  if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
>      if test_selected "thp"; then
> -	if grep xfs /proc/filesystems &>/dev/null; then
> +	if grep -qw xfs /proc/filesystems || load_module xfs; then
>  	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
>  	    XFS_DIR=$(mktemp -d /tmp/xfs_dir_XXXXXX)
>  	    truncate -s 314572800 ${XFS_IMG}
> 


tested it on x86_64 in qemu with lockdep and DEBUG_VM, xfs as a module
and with SELinux on and off. LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
