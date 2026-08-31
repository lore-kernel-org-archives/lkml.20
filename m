Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB1A53ED0B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189988; cv=pass; b=o8kEeKM7z+ZY41zX4v58gDuvJbWWu1Eq1Pf9M21I4leLyvPI6U3fzXrsmQFQnjSACokjR2bIpdGHcuuyYOrKxxoQeRlo59Xu9SkmXEaSp2tcL6QfNgbU4rJ8Nsknlz8qWVZZM98WZiEF//8VKZm0ngjFOKFVsgtVGo4DV0/AeeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189988; c=relaxed/simple;
	bh=PSPMRmWPcYte4abw7ulwi8Gm7cYsldtwsvZeCimevjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKJNlaVmkALbVvpUcuKs8o95jqHjKv+13wLTS66oP3VbzbjOddRouCBKBqU4k3dTacJ/DE/LnWemPtnsEY3ROYt8uN6MhuSpdKuaFgFlOaDzCACi/S34B8h6ggP329jafxRwYhBA2mfzlu0WcQz63kK9TM/MGohJRqjwst3a5SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h+TE+GVZ; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h+TE+GVZ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52fac937235so360141cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788189984; cv=none;
        d=google.com; s=arc-20260327;
        b=ZtYsYKEMhD/skWFFptk70r58huKw5m3vRal9lU4pscCmSRLjWxhEX2TcqXSVa+JU5j
         NkrF7xdcxex9QkdVRF9O0zyC347b+/cDsR2l5o+7cTViyD1746JM/6PKZE7deVFCgAnP
         q4xu9jq1LTpfzz8DXvU3lP4aSXjM8HaxmpBZ9XoLcXgOwJW8GTmmYReUMokSejpqZhRh
         1qNHQ3dtKx52cztdocUSaq7d8BS5Pw3D0ceRVjy1JUo+x7E3yb7br7W+WlLc3w0NsD0X
         QBvQ/c/+x1J+bvhgH2NuJXJvgQjY4mpbFVSI7KZyGHgTCJNcLaU2sXPmrMIiwPolyqQN
         eleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKx4z/gVUVYo3h0sY7zCFMtg9vG2hgH7eEzaxSp487c=;
        fh=t3upZq/Wz9hDa5qPbqz3RJb5L6sAptD7vQe3dsvBIPc=;
        b=g0moQHAOk0gyHhLvoZiHSy/NlZgjHMGAnZrpKDvrz6U6TkoiC0iVL1OsZdKRK6Y9EI
         jSIs4d0YuiwJPkYYwIgpkHawerlC1io4j2C3GaGmpRZflbJQaO4uQq9RqzfXLzB5YIEu
         H+zfc+XNjEluYi94nG1hFdEotiL2CIqMcmbArJnpN8hEzk2NYNKagxWJAthcXX+gYAJS
         7E+K/f7mEKEP7YdzOAhTDpummYCNLAbZJbs3SEFCX0OoEbabsuHx8++y0iGo+nH81tWq
         eCqny9boWQaN3TDMj3NoOjNOCc3Q/jvCZPhbRxwOXJvSPfh+qGmXHFpElnALTTxsZG13
         o52A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788189984; x=1788794784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKx4z/gVUVYo3h0sY7zCFMtg9vG2hgH7eEzaxSp487c=;
        b=h+TE+GVZdJ3h9caROdNsfMLza7qu7ybcRXIYjqlDqz2x52dzSuOdw6UGiU1l43bjCx
         3mrYmbHH+KUYoL+d9b9nq1Pdb7duVys3uC/O3YqxXjGlXeJ6bQwEFnepDLKhlPNpO6Rm
         EKsK9gwHOuv1LhroBpxO/0YLzjG08f7Bvwj90BZOomTxnq46Cp9/FAEC5H7gDLk9CbnZ
         n5VfVv7VFqQtZRjUGlawic9LwtrHvKmmb53cQ1fdM9ldcj5YSxmQ8Hav6tHsI2mUniWw
         g6y6dTVUIyvohN8KWc2P8VywQp0qJVY5Ubv2yHN8oLvRE5Ovip3DmkyI6+YHqEmhqWqq
         BS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189984; x=1788794784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKx4z/gVUVYo3h0sY7zCFMtg9vG2hgH7eEzaxSp487c=;
        b=nna9WRIehlUeb1ZiQTJh9dzYVsPQvjTb7Tp7Cki0HDWzXBL/VZWC/Co7IcCNXUYAIz
         5IVb+x/WI9uvvACBdqadAjbK53ZhkEU/4F+Or4KpqKXvl9i1AgTNuFZ4kT4raGODJyDy
         AdCg2kGP6satxmmEeX+1A9KcjXFEgid4B0S723rOallFlF3e2aJt4v6rRskMv/GeORkH
         T3GDwqxwNyPVRl2JXu+8CTJa9AnVxq7ObwvJuBHAeWVvLsYJdjsABjbmLS/vH5WOMwxl
         xDNNsYuRhGDDO7KAIlLvr/vaTHpMOwRAsglBt29Yh+7ldW+jCWlvwusmoZpiFSNypFmu
         uM5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr+YVDSOaWVklPGY+yzG1bzrNlA5ck4G9qpzG25RJtbgp5OnYp5Wc8Gk6x8/9ln1arZmc36zoZZr5MIvOE=@vger.kernel.org
X-Gm-Message-State: AFuF++lVO4sj2XU3SuE0nJxYj6rGzeaLAd8B6v4E4ZYN/0XidYtzM9+Y
	1iqx7fZ5/cz7Dn+1Zpl9pmqvqEFPd2CR7uqtUH1wcj7fa+WXtx5EDV1YNGtLz2YjsEtPgyCrVZr
	esxmGir9hJhcrh17kWc7/npmX2kJwm9469H8JfXj0
X-Gm-Gg: AR+sD12S1BGF9KEepWzf4gh7amXczzTd8vjKJtUheV0dEZ6MO3bUTl2uSfWZtkC0Sc8
	z0WhmfvmNPRBs++kB40WdKnDLqEAdM+XLncTe3xutz0fdYjYZ0GKhfbRx3mibio43q+j0LljEUe
	H7TKuCJj/b9JRD9M6VJLBuOl6cHJ0bHrf7vV0kWJlh/FNpxxiZVIxp8pc1hvPaIbxQDh2sHReYV
	XYAovTQxrIvatA/5319ebKCGGE21rK84gs2ogHZzOIgZXVeqn9yBv+qpfzukqYmo8Lh0Xjlqg4y
	sRBFNejmcJ8oEVcyx4ZrSfj9DawvzVcQ2GA81NbOEGI=
X-Received: by 2002:a05:622a:598e:b0:52d:7a3c:8396 with SMTP id
 d75a77b69052e-52ff6f30c8emr34733291cf.2.1788189983103; Mon, 31 Aug 2026
 08:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org> <20260831-docs-memalloc-guide-v1-1-547718c274c1@kernel.org>
In-Reply-To: <20260831-docs-memalloc-guide-v1-1-547718c274c1@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 31 Aug 2026 08:26:11 -0700
X-Gm-Features: AcwNN1WFRSN--wzS21rSGRH8C_o1FPRMTwmuGQ5Gza9KkI5iwhlrj79hsn8yfPE
Message-ID: <CAJuCfpGMOW89vVaAX_69MiMy+4VV0o-H+OBqkLRVUVHToM241g@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/core-api: memory-allocation: add
 k[mz]alloc_obj() and clarify kmalloc
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vlastimil Babka <vbabka@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 8:13=E2=80=AFAM Mike Rapoport (Microsoft)
<rppt@kernel.org> wrote:
>
> Since v7.0 the most used memory allocation function is kzalloc_obj().
>
> Update hte memory-allocation guide to describe k[mz]alloc_obj() family

s/hte/the

> and make kzalloc_obj() the first answer to "How should I allocate
> memory?" question.
>
> While on it, clarify description of kmalloc() size limitations.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  Documentation/core-api/memory-allocation.rst | 30 +++++++++++++++++++++-=
------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation=
/core-api/memory-allocation.rst
> index 0f19dd5243239..8ecfa4d35f4f5 100644
> --- a/Documentation/core-api/memory-allocation.rst
> +++ b/Documentation/core-api/memory-allocation.rst
> @@ -19,6 +19,12 @@ Diversity of the allocation APIs combined with the num=
erous GFP flags
>  makes the question "How should I allocate memory?" not that easy to
>  answer, although very likely you should use
>
> +::
> +
> +  kzalloc_obj(<VAR_OR_TYPE>);
> +
> +or
> +
>  ::
>
>    kzalloc(<size>, GFP_KERNEL);
> @@ -139,10 +145,13 @@ allocate memory for an array, there are kmalloc_arr=
ay() and kcalloc()
>  helpers. The helpers struct_size(), array_size() and array3_size() can
>  be used to safely calculate object sizes without overflowing.
>
> -The maximal size of a chunk that can be allocated with `kmalloc` is
> -limited. The actual limit depends on the hardware and the kernel
> -configuration, but it is a good practice to use `kmalloc` for objects
> -smaller than page size.
> +Since 7.0 there are type aware kmalloc-family helpers that let you safel=
y and
> +conveniently allocate a single object or arrays of objects with kzalloc_=
obj()
> +and kmalloc_obj() and their array versions kzalloc_objs() and
> +kmalloc_objs(). These helpers only need the type of the object that shou=
ld be
> +allocated and the count of elements in the array for the array versions.
> +
> +As of v7.2, vast majority of the memory allocations use kzalloc_obj().
>
>  The address of a chunk allocated with `kmalloc` is aligned to at least
>  ARCH_KMALLOC_MINALIGN bytes. For sizes which are a power of two, the
> @@ -154,9 +163,16 @@ Chunks allocated with kmalloc() can be resized with =
krealloc(). Similarly
>  to kmalloc_array(): a helper for resizing arrays is provided in the form=
 of
>  krealloc_array().
>
> -For large allocations you can use vmalloc() and vzalloc(), or directly
> -request pages from the page allocator. The memory allocated by `vmalloc`
> -and related functions is not physically contiguous.
> +`kmalloc` always allocates physically contiguous memory and the maximal =
size of
> +a chunk that can be allocated with `kmalloc` is limited by `MAX_ORDER`, =
the
> +same limit also applies to the page allocator.
> +
> +Internally, slab allocator differentiates allocations of different order=
s and
> +delegates larger allocations to the page allocator, but for the users of
> +`kmalloc` family it is entirely transparent.
> +
> +For large allocations that do not require physically contiguous memory y=
ou can
> +use vmalloc() and vzalloc() family.
>
>  If you are not sure whether the allocation size is too large for
>  `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will
>
> --
> 2.53.0
>
