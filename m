Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175205;
	b=Nfb4PQhG1cA99MlN3ypNTrAXhyis8swZ0ltJwk40+RYPCiNZsAnxm5v6pvD96f5MmTOd
	 WQQMOofgi5RIy7+ZGPEK83oKNXaE6UEjid1u4vEF/S4l5a4J7/2UPf1nYnI6pW7GsvTyn
	 fhn0Lh30Wzkcd8tihGnC7+yQ/cD1xUxRfvVTcILeEhCDKoKHRCbXHYi7aSVS8HYduFFN5
	 CsooXl7jfiUF3wWfLlL9hwdeq+LTjxJTjCjRtCcUqEwJCf/5Fbsjn4x9ZI/oX0JjP6Ft0
	 0u/HfE5VdBAPNgoT0vGPmsv4mFfVThf/Fqs9OIVdUB2skPXm6dKP7S0pLKhy9msTbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SAVWs/NDsyGnOu1pGDZ7YW8QusqcbylNwmGlYdt/fqM=;
	b=hppiTOno6J/Md3iDsagB+gSokoBLHhRo0OJDY0EO8pvmvsokpCfW7VNC71khGm1p0spU
	 RwQiJZzKF8csJYeK3DU3DIN1osB3S1FipZ0zem7KtsvKnst8lZ3q58mFXQ4NIdRaLsf/Y
	 Ot7sJ51G4yAVNhTMOKkPrdF6N85o6cgGBv6+AKhJ6quIU1FtWNbIgCz8bnVDWx91rpXzL
	 ev6OksoYo9mP5ugmr5k2EhMWnt3b5H8T1r8n05i9Ml4K7IKwLIbf4CUUM3pvHrZXHJsfu
	 +IdrIad3QyzF81sVTl46fq6OCSGSbX0stzUyzbbYpKtow6gEytntWRlaX6Hlc1yLM2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0t+4k8Ci;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8F606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B8F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0t+4k8Ci
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so6031585e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175204; x=1793780004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAVWs/NDsyGnOu1pGDZ7YW8QusqcbylNwmGlYdt/fqM=;
        b=0t+4k8CiMsN8rPI0idoPqjYbF2Kw2hKwDRaG8OWnlzy2CBSM2GeQpQjORaAeIcpXjW
         Q2uOzh8brR3pEODXEo4xeNT1kxapuM2/Z14e72hsuVCFqGn134q5HYzR1gTmMxaCYXIH
         1PBFnYvNRDYFaa7YFCKeymxx4rQ1EbZTL+72Si/9/Ge9i0vzuuK6tCFCvJweEmBc/ZKb
         qA/z8AK62WLP5A0Zub4jf5RdZHda76OGBJr7TPLlT6K6Lgo5j1CtNxGc3JTAO67cZ3xy
         cktotQaThqA8R3hXrHasIGrZy/+9JqmNglPyPDC8IoKyi7CaNVb5JuFJ8VzbltiUwwaG
         W4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175204; x=1793780004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAVWs/NDsyGnOu1pGDZ7YW8QusqcbylNwmGlYdt/fqM=;
        b=PzsshDR6jLkNA9EsUXz/d3wusFseI0XKvZXPo5VtizTBAX8Ir2IMgeWpi82QIcrOs3
         9N4M87vvd5pEHPEtKVjlubzffbCOcyaMYjZz/fDy2obXdUiiXL4XmY2C6AkUSKmjehWG
         kFtuEJyIXcw94IIqSxISrVkoVHbsjNZEniI5niKdCBARvjN0FFq9Zz12I7I/QfjoO6pG
         5AiabN3tF+rI50um/q8vCtAAvazv9V2twmxML5BBgJrUtt1dVo2v6kV21w2GwnzmS1cW
         Xi2kHfxvkYA5hvcMXiiMmoBbuxg3temPA2+DX+iVk3mrQTV+9EMDDraEXLC29RF/JhYQ
         uG3g==
X-Forwarded-Encrypted: i=1; AKwUvBwqf2HLtL2gY4pKn3AL1BF50ZCSHM43q5P/KVvr6gxs9IlMvM/tULPLtb0enqbsC1IrZarZacXgtjBsfPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG4PEXchlQibnN1VaYjdrHiq3ixoR3OHlKpl1+dkE1kIjhD2Sb
	HOFjqWlmpObdPuSaKLZNngVfSMmBYjrUwv2Dj0w8bpsJnQWTPiZqk/nA
X-Gm-Gg: AYBFou2nfR0nl9GXJUrpIe2aqQ53pYqeTELeG/8FcMJ1v0WtZYudrDGLbkKRZSbam2u
	Y8ozK4SJCYQVzZbDJD+YuA4HhgNrN9TmevWsLMBD56pBFR1PwpmC+vGSAiSkvnIIyLw4o4wy0Tg
	WcXPGUlYELvPb2Ak/ECNwph2usheLjHHH6A8VR8GPF966ZEYpGE6htd3dUatXpzePTe4mm40Caq
	EApFRjJ4DlmAt8XwSxHgbszd2g5Ps61fpXzJWBKRD2b8cPHrfqDrmzZghJuneBWiDQ4wjdazoWP
	4x/eVpsqnPif44ZQDkuzsPBo1MPhnoTpCzkHm7yUis/RnjFDSYgeEJ25YcpqSioDHyzDRJSQVAD
	ky3bdA0S9kUo5YBGxU9U3cMEUSco61MGzBvyEuaWrOW9EhMWU0k10rWDy9jO482K34QksMt7otm
	sK+oglM5AcYOikOI6DsoufmV8YyVDVdV6Vij0CKLgvVlijCefMir4jyZ+yfYhc6JR2PLTYlSRWV
	KXeWO6yFhFAgEVx6uSTmGgRpr9VzqZt8gBu4/6WXbg8KP+9uWAQZT2v4XNGF+33U3pKLLPfUxD8
	aDnWXunwrm4pOQjl2z6bytcY+nN+KYzpn9NEo+Xy1d/onQ==
X-Received: by 2002:a05:600c:c117:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a9672030cbmr23856025e9.22.1793175203701;
        Wed, 28 Oct 2026 01:13:23 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm30046085e9.12.2026.10.28.01.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:13:23 -0700 (PDT)
Message-ID: <6c73ec1a-4dc4-4c18-aaf4-e85ca73f64a4@gmail.com>
Date: Wed, 28 Oct 2026 09:13:22 +0100
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
Subject: Re: [PATCH v2 2/2] selftests/mm: load xfs before checking for it in
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
References: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
 <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-2-cbb36b014322@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-2-cbb36b014322@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/26 5:07 PM, Qiliang Yuan wrote:
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
> is unloaded again once the script is done. "run_vmtests.sh -t thp" with
> xfs built as a module and not loaded:
> 
>                                    before    after
>   skipped tests                         1        0
>   skipped split_huge_page_test cases   43        0
>   xfs loaded after the run             no       no
> 
> Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  tools/testing/selftests/mm/run_vmtests.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 56f5416681da7..ba77fae5df4f2 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -428,7 +428,7 @@ CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
>  # Try to create XFS if not provided
>  if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
>      if test_selected "thp"; then
> -	if grep xfs /proc/filesystems &>/dev/null; then
> +	if grep -q xfs /proc/filesystems || load_module xfs; then

doesn't this also match selinuxfs? with SELinux on, xfs is still loaded
after the run. would grep -qw be enough?

also, needs a rebase, 6593a15af108 ("selftests/mm: skip khugepaged file
tests if mkfs.xfs is unavailable") reworked these lines.

-- 
cheers,
jose a. p-a
