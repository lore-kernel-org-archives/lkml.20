Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC104568532
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960659; cv=none; b=FcaYVMd6vD5uKg4qFrhQ871TTfCWr6JdpX7GQzKl7P+eA69YbxYw90oqyYzwjgz+Qx3dMhaUFypFqXBQB+bGBQpitIHoaNNn6f8gBglKMPverv43B48Fpj97IQT/nScBvj/S+81DNzH9SIWeCOjBO2Lbtr8pEPd8Y5lRT247hiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960659; c=relaxed/simple;
	bh=thIkh/FqJgrHGNwWazQNf90HmoaawerIOEixm53nYfs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RO0MEz6Q6NznbobyeTgJ4sxLG0zF7lmUdKSBJDdv9Ua4ElGEmU3rCW5ZyKqKg6mVUNcobL1MeMjMJasFfvg6ej//m46KrsPe9gj8aJX0VCsBlBYXiERqtDhOVwuVoLToEfQ5N134e6n4ontuIsOmn+kHB1glO9a8fMlWlseGQ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTZhgNts; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTZhgNts"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2940d16190so42589266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960656; x=1789565456; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxNdm96bKIoWq/16pYhKcq8ECSivtcVW8xJ/F+AWQTI=;
        b=VTZhgNtsL8s0+Vvy5GXgbWfvJPUoXpCKsqObJD3Z2r3rkr9EnmfFWFwF3J75mjPt3s
         1Y/LKVexIp16givW1ffEJ1iwKnH9n9utY8kKxUTWCGTEeL1NVSbclKkrKy2ZTht0zMG6
         cASiIslwy7y+yRChsqXZoKGpz0brucbUgZxfnHTN9paJi9mWngBOrGuAx+ANk8sjSEk+
         3gtDsvlf24fxGP2IbW1Ey7UYkdYsbfduFxSWkLWTPxCn7E96ePX1K38ff1JZUmyhLf0v
         o3xFvQHHyPHBzYNceFz69KaQOJbmDJQ3TwCDMkUTV1B/iZc27ypdfMtvwsJLSQNX2tR5
         9eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960656; x=1789565456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dxNdm96bKIoWq/16pYhKcq8ECSivtcVW8xJ/F+AWQTI=;
        b=A84u5CN+XzZXvudbDye25rzzWcPcqRJ3eCdHRi3B+kMggy92aNoPtwsjG4VYmOE9d8
         2MCrcIKVYUdd8KRFTL5mrqj1JRIYIDfZT397Y5Kyt+6SsrGjOAu5+LfTqFnk6HhJ22tJ
         E01oC+FXLG1SzTNSSVT73tUy0dFtLfaXhIM2T+6xRIUYJ1QEdo+auqPbZaXyhZUP/wTO
         MbRPSApHbPc7zan7zbDAlYTWl9YHrfD6xXhdS1GUZCkenGTVagGwG/8imzzxwD9Oclsm
         oUj3Zk4JRoXU3v/7cByViFQgAluVaUB1LYPKpgeiSdOSizaikFrLpO6BGTgpJhC2bv8Z
         sXdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvRt56mvMTGMKDs+urC7D/K1jGPEVT5Mdsu5McNNKK4z5yKr4sZlV1V+Vn4kD6/xGPtdkEbLfyInzMJr4=@vger.kernel.org
X-Gm-Message-State: AFuF++nBMsPoesXwdnEz5z87cQk+eInKfZKRreEcoTJNwEwVpSkExiRi
	35rq/0rBo4zXfG2b8+eTOT0x1Rg+xDWNxM73e6+rdA3YKozWvAvfXM7I
X-Gm-Gg: AYBFou0S3LG+I9ScUDh9i3Npw5ctVFjATQwiN1d+9cIV0t/2EN5yvBzj9ywNUy5xVjg
	lhVYhJYQ/z5Py6OMhIPKZOaoUqA/qd9JqhY2R9wBNFBV2OIfuHSHvHnWOa+7ox9DQO7xvNUiI63
	1wsz33fUYgSXmryJXo7NyJWXTezY1F99W79T+UDMfMAeSQFEGnmd8UDKIQdcuOh7FUz3ovrOnGS
	llv95JPR0T6YmungR5lV5/bFOCAuxVFPGTALuWtmCSByYq8hMW+8Snpsabkftud2sX6PCLBfsVZ
	/zJPWRDXorGu0wrBk8RXRKZf3IsM9YKjV9sry7UK9GQlXolW4pnvanN6+XpItjUSIc6dkPqJIJj
	H1YKGNKAOpECDuonLxqjl7hQqygdKKGJgxfYbV8nLSvVduhsKnBek0T7+WyXK6HPV4OYVxuAslg
	IlIsdhYjPrdDCCDK8i1xs3YCr08yaDTY3sXucOQHFWx3hNImi+9g/R0+yp0cLqBeZZJg==
X-Received: by 2002:a17:907:1c18:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c260ca241admr1431773366b.21.1788960655994;
        Wed, 09 Sep 2026 06:30:55 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm568148766b.33.2026.09.09.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:30:55 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:29:14 +0800
To: sashiko-reviews@lists.linux.dev
Cc: Baoquan He <baoquan.he@linux.dev>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Young <ruirui.yang@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, open list <linux-kernel@vger.kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org
Subject: Re: [PATCH v5 3/9] crash_dump: Disallow writing to dm-crypt configfs
 during kexec_file_load syscall
Message-ID: <aqFe50U0bp4dguMT@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-4-coiby.xu@gmail.com>
 <20260909004722.649E21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909004722.649E21F00A3A@smtp.kernel.org>

On Wed, Sep 09, 2026 at 12:47:21AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
>New issues:
>- [High] Severe locking imbalance in `crash_load_dm_crypt_keys()` leads to a leaked mutex on the error path and unlocking an unacquired mutex on the success path.

Thanks for catching this issue! I'll address it in new version.

>
>Pre-existing issues:
>- [High] Premature and unconditional reset of `is_dm_key_reused` to false breaks ARM64/LoongArch kexec load retries and defeats intended cleanup logic.
>--
>
>commit a9405cf8948ba39213612c61a1f3b10b23f437e4
>Author: Coiby Xu <coiby.xu@gmail.com>
>
>crash_dump: Disallow writing to dm-crypt configfs during kexec_file_load syscall
>
>This commit prevents concurrent writes to the configfs group during the
>kexec_file_load syscall by utilizing config_keys_subsys.su_mutex. It aims to
>avoid buffer overflows, stale keys, or memory leaks caused by changes to
>dm-crypt keys during iteration.
>
>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>> index 3a416933979f8..580534d43b66e 100644
>> --- a/kernel/crash_dump_dm_crypt.c
>> +++ b/kernel/crash_dump_dm_crypt.c
>
>[ ... ]
>
>> @@ -478,6 +490,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
>>  		kbuf.bufsz, kbuf.memsz);
>>
>> +unlock:
>> +	mutex_unlock(&config_keys_subsys.su_mutex);
>> +
>
>[Severity: High]
>Looking at crash_load_dm_crypt_keys(), if kexec_add_buffer() fails earlier
>in the function, it jumps to the out label, bypassing this unlock label.
>Does this leak the config_keys_subsys.su_mutex if the lock was acquired?
>
>Also, on the success path, mutex_unlock() is executed unconditionally. If
>is_dm_key_reused was true at the top of the function, the mutex was never
>acquired. Can this cause a kernel panic or corruption by unlocking an
>unacquired mutex?
>
>>  out:
>> -	return r;
>> +	is_dm_key_reused = false;
>> +	return r;
>>  }
>
>[Severity: High]
>This is a pre-existing issue, but since the error and success paths
>unconditionally reset is_dm_key_reused to false here, does this break
>architectures like ARM64 that might retry segment loading?
>
>If load_other_segments() retries the load sequence, the second pass
>through crash_load_dm_crypt_keys() will see is_dm_key_reused as false,
>find zero keys, and silently load nothing into the kdump kernel.
>
>Additionally, crash_dm_crypt_cleanup() checks !is_dm_key_reused to determine
>whether it should free keys_header. Since the flag is unconditionally cleared
>here first, does this defeat the intended cleanup protection logic?
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260909003657.1570544-1-coiby.xu@gmail.com?part=3

-- 
Best regards,
Coiby
