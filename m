Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831313;
	b=V3w0sNqxP4N77muURI+brk6q+ggArXi4ZDJoOMKx9dJQDbt5HH00OISbi35PqRM9YBKP
	 ppdVWkkLq6hLvUIFaTf0ma8gbfxFmkyF3U33oKvfLISyAgsgDKF6xeyo896w3037YwzaM
	 8AQzi2y0o24HzseN6ERDx5A4gHQdx5o98eofG+hz8hepGJSoO6kOUY/aR1hyD1d+vNI4F
	 gpzlDEK+5CWi8i0s4lYJFX/UK4mc0REoyumqfHq58BLfB5UcqEVsm1qjI5lA1xwoEK4fV
	 w133BK4wlQkv2rcU+ZCs/Jus4q1jkbFX8ao+vsehYlXEZmwLTHHhjhO/cmYK0Cw5osA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
	b=acGZqbqX+0Ur/aqr/caTmFR8TXoS1DR+MznVyNTRpf/EAb4QPYWGT+aZnogZPYb/qB+b
	 mAySUEOwey8Hg8EWHcjNvmmpPKoQd7cRmHDG8ry3vfbzFWQjpZRSJzt3hKpEae2DHr2xA
	 7Vu9xwvU4RpGXaFTATmoCS3Cyl+Odmm4+4+rx1jCBQV7Hpzzayu0wy/JsmzJk0WKg+ZFj
	 Wo80OqQ9PJoF8muVbsMfdfXjJaTSjr88hvNMR1gehF9aljgf8IXTTrsyUBzpIfyMqJ1Bk
	 xNtWfkBLMIhwEjqY/SWaGNqL2swErXwmGELGl9xVKG/fz3njnTdjm5jak/DPPizAk2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q4r8YYWn;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899A606B3AE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6899A606B3AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q4r8YYWn
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso223721a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831313; x=1794436113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
        b=Q4r8YYWnN8sCaY/ODs1yIT8lq7b5mwAQjudMxrtoqP6vQcq4r+8STrumanbHpf3ain
         o6PYhcUcEJyR5K9TdjhA0RThU3nkwkKvSPhI1I3sb6m6/bn99QLYDdHOBBgYhIzt/G7S
         6PEogm7tkiRTcGX6whDNCNlWIqQ4g3wtpZphRlTdhJX0CmT03/EwQAjRVEgRM5xivqIG
         WPBCZ4DNx4AnZh8vOqJJzXqtusiL9soWcNfDPSbZvbAwqQZiMkXKBmENLW4xUr7syquV
         2ViGz3ZyZhv+D/9/+6ir2dfvTYhKdqq0CkpekiE/gW0Sj8Lf+WfBG1fxNZHI43AK0A5G
         EDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831313; x=1794436113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
        b=oWY3jpgky0hfXt1Be7EHpP4u0sJ1ZsMOSLFXRuI6/t3+gZ710cHrakOhNNqOqfQuDp
         rmpycCcFzx8n6mUO6eyn/jSSqUC8UB4C6NZTQ9DQWB5AZDXWsEOVVUwlzgABxQy+C3A4
         42erhwXBlwxzLjA4fIvEIpGAug7+uB3jmdes8ZBu/grmq1MkCir9TY2oqVh2+ViFmi6O
         OTEo5JW/e00SRwyfDZcDAvE1pOhzLUNH0iJQHdnEI+LtYQtJWeW5dZ8HqtjreKqNmGNj
         bJFSN8fhhNl5ANct/c3HWzzmjrHQ20Sg9jmkZELyEGNRarbqcQrJ6et0WBK+GCj5PCzs
         phoQ==
X-Forwarded-Encrypted: i=1; AKwUvBziBbjWsL+KUaGMLSkx6SK5ZRNlyX3Nuz91y12IrY4R2M6PDlNbGvsrGEUxhgf2hLh2y4Mx0NdlBmC4w/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dk0Azkk1HdeL0MxL7iwHGXMC+ZL1HsCWu+i/AHZyeVyyxMgyB
	++YJ3gjoQmaTIsA3SrDVTpBwahk6onlJpMGgHDCWiR5M9AX9u2gvL6oAjaNkd/CvPQ==
X-Gm-Gg: AYBFou0ERkaFEqnmTC32XgZ2V0Omz5tB7CTIlWhdPO49aZhef39tO8HQpvE5P7xG7rS
	BZUDjKGkeXO4yC1JZUHKpe/hdfujyiMzPOQPz3tQ4NE/Fiq5t3WdzugQshoAqF+qwd8AuwNgmhn
	3O/R/b/cozEsYRVxmzjvcfwOOe+du9z5ktqcUQFWUZ558F1mQGuZSA+/uSZmacQISX8e4UvlIJw
	ZxO8g9/lf/SU2TBWfhSaJ73vLozZ+EtVN4i8RaLUsXnTGTeTDayh2zjyNlcUtSpMm6ZH85MZoy9
	2KjPv/ib7iVmEc78ann5WI44P8QylVkg5iRmkz+XxCOvCT4DHjArElhx0B2j/SMH2fzHbN2EVfB
	3l18c7mKvlik2fs5iUj3Ic5H8vouFsCxyIwlwCQirDt8lbuXzDoRImn4S7vK93j9fjAdN2JWRQh
	KjbJYtOA5rHEvwHxzPTJWGDfUSWkGwVxSyAFwQqrM9WKqoAeGoEbkf96xYEElXC8cktMHpLT5Tn
	2QNxBRkr9FhCil8aTEmW0caCNnbg+ki8RmKWTwD3q4iU/N0eLyjWUJWAxdC9VWsYbrPRUjM2Gt6
	sOPzI5mc4kVtgSDViXKu8NbYDlvAjV9gxpVcqJWWc0XI+kdL9rgy6sfaDtli+MY2
X-Received: by 2002:a17:90b:4c04:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3ae897b519bmr13057533a91.50.1793831312185;
        Wed, 04 Nov 2026 14:28:32 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cf4b6sm710454a91.14.2026.11.04.14.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:28:31 -0800 (PST)
Date: Wed, 4 Nov 2026 22:28:27 +0000
From: David Matlack <dmatlack@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 06/10] mm/shmem_luo: Don't make early retrieve
 failures permanent
Message-ID: <auuxi10mmCQrq-y2@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-7-dmatlack@google.com>
 <2vxzik2ck5dp.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzik2ck5dp.fsf@kernel.org>

On 2026-11-04 04:01 PM, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Mark failures in shmem_luo_retrieve() before it starts restoring the
> > folios as retryable, and return the error without freeing the serialized
> > state. If no retrieve succeeds, finish() frees the preserved folios,
> > like it does for a file that was never retrieved.
> >
> > Nothing has consumed the preserved state before the folios are
> > restored, so the retrieve can be tried again.
> >
> > This also fixes leaking the preserved folios when one of these early
> > steps fails, e.g. because the file has seals that this kernel doesn't
> > support. The retrieve freed the serialized state but not the folios, and
> > finish() then skipped the file because its retrieve had failed. There is
> > no Fixes tag, since the fix relies on args->retryable, which was only
> > added earlier in this series.
> 
> If the seals don't match, the retrieve is not retryable. It will always
> fail.
> 
> I think the only retriable part is memfd_alloc_file(), although even
> that is quite unlikely to fail. But I think that also fits pretty well
> with the most important type of error you want to retry on, which is bad
> arguments. In later patches, you check the argument on
> shmem_luo_create_tmpfs_file() or shmem_luo_create_memfd(), so perhaps
> set retriable in those functions?

When retryable is set, LUO leaves the file unretrieved and finish()
frees the preserved folios. If the seal failure did not set retryable,
finish() would skip the file and the folios would leak.

In v4 I can move the seal checks into shmem_luo_create_memfd() and
shmem_luo_create_tmpfs_file(), since the valid seals differ between the
two, and reword the commit message so it doesn't suggest that a bad seal
can be fixed by retrying.
