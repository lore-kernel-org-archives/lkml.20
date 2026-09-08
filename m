Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCA34216C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862371; cv=none; b=Wfn05ETj2TRmss6JmZqNAV4oHYKbVIGt/TvP7K/JSYwTf53hYB5M3MCV6VsY+Nzk0udMpg5L6AzIONGu0Fd4iNhuapS38XyNeimS3bJjI3DAlhLzW/bXLqvgekmQswPR+0GIRgKDCrrt2c/haqcTOfjCv6oS4qvgO2zeStu37S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862371; c=relaxed/simple;
	bh=L5wrXfBipBywywm0456CWR88hbdBnTem6i9VKKzZbCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmRdYqa3zpcqqC8feRBoIgRsRQDCMcYhe9IrxP4Io87Ss+x9OIveMmkJf7rZs1YKIxASIZAtg0AEVkU9IAPOp1u9kOlksMmv8mELgn0swFIvFJEOtUEHTNtd5o2NR0SRLdrltkRhPqZK4fdUUtd0rQmoALaoJjhytfcXaNqr35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bobrowski.net; spf=pass smtp.mailfrom=bobrowski.net; dkim=pass (2048-bit key) header.d=bobrowski.net header.i=@bobrowski.net header.b=EhoumeQN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bobrowski.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bobrowski.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bobrowski.net header.i=@bobrowski.net header.b="EhoumeQN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso5670514a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bobrowski.net; s=google; t=1788862369; x=1789467169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GhA9ASZ5myh78peIx89yYob/fVYshdxCIaZiQ5E+/oU=;
        b=EhoumeQNM9iAJDSMeVJkE/BcO2sTN1IzlmeaIhrZLfQx2NqwD8XNV7PWFjFg44pc3T
         B33+JzVkfz9R3TuFgydm5ZifYn9Jd17vvVquToxz8YSgDIf+/TlAceanpQnXdBAi80+0
         V12JvE9RdSgL2e7hRNnMHcPDpMYN/0FwGadynWX/i+WmBhG+7XEMzsgHXlmpK7hVv7lD
         1etMUlVyR6lAqpHaFEqrwVa7tPQ9nfygN5TwUHKZaKYZQKuoJon+lcKvb5WcZVbfFnks
         9LWsjmkqN2BtMxhIst8T66CjigLvB1/6pDIKpUzydm061QNwNxvyTekwysIekcWiHgP+
         1eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862369; x=1789467169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhA9ASZ5myh78peIx89yYob/fVYshdxCIaZiQ5E+/oU=;
        b=DfTfX4RmnhpJlRsAh5Tw1YC59LcvHo6fcaNfRHkebh+tx84xg7v/LibsSQBdTuHl3N
         hQ4GwoSh4ABSc/epvjhJD7Z/ZWHWuz4VHNYf+456aPaHDfLmU5pUaIFuXp0Xz0r5nM+4
         IBTV0upySzjdQk0NcXZNGUB6DvjvedOQVzAzc3GK5Pv87B1DC9X5NFKmQzvtMEjI/dNf
         DjuAanInPZ4eeOgPjZwIxETT0WlOmcKSIrvWj7mw+iF+aTOQd8qi4odZqlPbW3bUs7H6
         NnUBN7YCqzYZ6RpOJVFvoHbnxqezd/1PgRVu1qQcS+BrnPsEZnphRp9fOPvSXayU5oVo
         Oghw==
X-Forwarded-Encrypted: i=1; AKwUvBz7WtNkS7ivMHsqxQWrf+LI31mcb2lFgXehu6HiMr7ZIvnKzu+w3bbqQFLeAhORgxKeNXfgmHwTjgmuClo=@vger.kernel.org
X-Gm-Message-State: AFuF++n0Nbmr4UuQ6DzOcqbwT7jezHiep8onCoxlKAnjWLE96629eK90
	c+sGLCSwHKJ9VBw0xhM0fGSFhuLb0hSwVt3dlsjiYIYX7f2GAzVwSJ5MGdokEJxVDnL8
X-Gm-Gg: AYBFou0bgpENpvh2WaHZmuKc7l/puOzx1dX3t9lu7C9UcBDXSxb/0pf//EXmIJW0izV
	/6RLFWyCtwGdoSIVRyr3pEQJoxmS64bCX0RL/+kBtwT7I665Jd5ie/h/2DOp663LZHWI1qKfRGd
	/SHRdLOB/DhOqaRO33tTFsOyp/NID/cWwAnYVO7J2xURtgE1oRWXzc2ocXh8tPS6JS2qJKLmOed
	BmMYB+PDiilmGW5Rmzy6PnmnJp3e4uGf2xZgQg/hYSGnFtt2xzz5ifs6mTCJ2iwAQ3nGxO1jgo9
	H26oAceRwMatGkNDpgaQ8xPYS/W+jn0tV/pKdqcypSd4InZuxsAygsQmV+U0qrxeLn6JIkgR09Q
	QVnua/2Bp+hWgdHy3tOeMedmVYSVTgZ+tcMUGlw4Bjjj8SnU9mV5eiPB189ky0ouKwTHPazBxDZ
	wiw9uZeU0iBxEkA7+LWNzdjZrtlaXB3507Hd6YBo42J3wx1SWTKINE6HFs5s5tw0EaQyE8pGItm
	9swR+KONPAw35F4fNlXHkXcERpDF7DDeeASvvZo
X-Received: by 2002:a17:90b:1e51:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39b26260f7dmr38959127a91.22.1788862368635;
        Tue, 08 Sep 2026 03:12:48 -0700 (PDT)
Received: from lima-development (163-53-146-23.ip4.superloop.au. [163.53.146.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm35093697eec.19.2026.09.08.03.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:12:48 -0700 (PDT)
Date: Tue, 8 Sep 2026 20:12:33 +1000
From: Matt Bobrowski <matt@bobrowski.net>
To: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Cc: bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org,
	akpm@linux-foundation.org, andrii@kernel.org, ast@kernel.org,
	brauner@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com,
	kpsingh@kernel.org, ljs@kernel.org, memxor@gmail.com,
	song@kernel.org, sun.jian.kdev@gmail.com, utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH bpf-next v5 6/7] bpf: Mark linux_binprm->mm as
 trusted-or-null
Message-ID: <ap_fkWbaG5u7UH7y@lima-development>
References: <20260907165220.52431-1-tasos.papagiannnis@gmail.com>
 <20260907165220.52431-7-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907165220.52431-7-tasos.papagiannnis@gmail.com>

On Mon, Sep 07, 2026 at 07:52:19PM +0300, Anastasios Papagiannis wrote:
> Mark linux_binprm->mm as a trusted-or-null nested pointer so BPF programs
> can pass it to kfuncs after a NULL check.
> 
> The field is either NULL or points to a live mm_struct whenever BPF can
> access a linux_binprm. On successful exec, exec_mmap() installs the new
> address space before begin_new_exec() clears bprm->mm. The bprm_mm_init()
> error path clears the field before mmdrop(), and free_bprm() clears it
> before mmput(), as ensured by an earlier patch in this series.
> 
> Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
> Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>

Feel free to add RVB tags:

Reviewed-By: Matt Bobrowski <matt@bobrowski.net>

> ---
>  kernel/bpf/verifier.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index b5186e664aea..6799d9e080fc 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -6004,6 +6004,10 @@ BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct dentry) {
>  	struct inode *d_inode;
>  };
>  
> +BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct linux_binprm) {
> +	struct mm_struct *mm;
> +};
> +
>  BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct socket) {
>  	struct sock *sk;
>  };
> @@ -6058,6 +6062,7 @@ static bool type_is_trusted_or_null(struct bpf_verifier_env *env,
>  {
>  	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct socket));
>  	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct dentry));
> +	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct linux_binprm));
>  	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct vm_area_struct));
>  
>  	return btf_nested_type_is_trusted(&env->log, reg, field_name, btf_id,
> -- 
> 2.55.0
> 
