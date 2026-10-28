Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219829;
	b=dhmS+C2AxU3jqXTsSiDtlLdkknx0y0qAEKdeNaFb1ZZL9b4MY1MNBsOV17o4G8ykiuVh
	 SVefhHvg3rxjdvECy7G1fo6l7JNx/cSG+0wVR4wJW1x8VLkE+CdcsRsT++kMO3D9xZhxV
	 8vufYQr9lTQgSSIp6Kqd4uHe/L1dKiNksvQ/DqAfXv2Srbzpq6N7Y0HzU1/4Vxz9jfl9E
	 pKHnsQvYQMTYSgng49iv869Fi54ytvLQmVbIb2Bk2HJoGhU8b98dLrgOVfO9tpvdyhRff
	 0Q7Xi0m3FtOS7AAf5THD52StfdlAx57XhwC0VL8psGqwcjXvCScjj1ElEN1wY7OsRMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GOkZMWndE8pvmQEZjLf6QfLtdr6Oc875cvI2O5RWo1A=;
	b=cJ/LQ/0wwht+UHvgDVO03uQWfv/B88qAEId/Jo9VIIdAxkp1GJnD0lUm/aS6bF7ISxIO
	 M1kLgAYI8yGfL3hW1bsbtpMi7V29x0A/J25wbLvO3v9AWjGtaVRo8ZLunFJuGwp45i+4f
	 LVVn+VjkJNGQ95K+TGZRIjcdwUBHEuc+XUuhk+r++G2k3lQNro0XoC7GBE7a1sF1widYA
	 tZenJKBnR5FwuEDOp16+JpLccuCeqG9nOUwGtAaNC64pmKPj+8vxomveNfoywzHEGoacD
	 45i7uyCyX9GhfHXoZwT422vp7mJRhC0hH3wMZFlpuWJmNbYtxCOAUTW6LM310BW+NyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TAe25ahd;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160A606A336
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7160A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TAe25ahd
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so1195751e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793219828; x=1793824628; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GOkZMWndE8pvmQEZjLf6QfLtdr6Oc875cvI2O5RWo1A=;
        b=TAe25ahduDUoJ2Df6GDNj6g1K0GNDwadJWeM9d71dY/Kg5P//CUMBBiOUzh/f8q+w0
         jUSNhyns6i9PCiLzpb/4IXdowNQQUHmS1qSsD3ecdiF3VVlGvSeV/z0FOBXURzQ5QXiy
         m+Z5HXCcuE7UFKf7f7v3yMdyY+oYc2VMbqihp72ccXvnl2b8bR+lVLt4GqxD/dqqOzoc
         0478O12Gs0Dcvk00suElhRNVZUabVIC6ugsV3JAcOgBHb4hADNbxbh0B/TdQ4NPOVG7q
         OjVFcT0YHK9S87uEjGAsbkclhOKFuxhegC5AW8Xeqj+Mp6VEQzS/0MMLFcw7O2I/Qkl2
         6TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219828; x=1793824628;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOkZMWndE8pvmQEZjLf6QfLtdr6Oc875cvI2O5RWo1A=;
        b=iiqQ5fJUTJlIy6MvcJCi0ZmW/NvaBwPhXtM3RF9Z+0Vi/dDnWPG8RWB6pcho9p7Yx9
         yQE3tz3gNZciOJ14wv7kgygOVvzK01ZHKi2VWA3PhyMNzmhjPNaWkOUAKLkxi9UL7AT6
         j2+pjBfcE7bbpAn4+TLgPPnK2de6UecGMwNrB0igKT1BEfo/0B1YS54eQTypgFphZqvY
         Oek1aGIxP+N3FyranMvWE0m/ehY4/f3kpOTfNuE4XpjgDvvdHau07XYQqlJynqvf3EoT
         FF8tI/mYomwoeGjVOD42xQdjLVjGVN+N9p75NhmJXOcxCUV0crsuhsQwiWFjLmoX82zr
         gSvA==
X-Forwarded-Encrypted: i=1; AKwUvBzJxCjnGwZvH4AFK7pVgKpzpuaUOwLJ6WHyT/F6kUw//v60l6tJezlTFmjxX+ypYT4T4mcu8c6o5jKQA4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4hr6KTmxWBVRSCtHNHljHXUsfC3H+jRpF8nuYRksyENXOHnrb
	+axAuXx5ycNRmKvpBsoE6W87E/CQxax4zOPo/9sY+dfgIxTiWudCDRzt41IqIeS1buw=
X-Gm-Gg: AYBFou0ut0Y1MU7OXnaPdqlImkfObeo9rgEJwEOF625f9U/I5Jg9wKM30+cY1aDObn0
	pbAmgiHRVzMZvhJYDhpY0a+H0Yub7yZFWZ7CVXspXbMn6UKDQfceVHG0T7EJiUep9Rdua2SjTyV
	hScoqjtxycPbsDGleMRvNIiwBYDYsKGz2tVd1McOwe6Rg+IfnzOeX9w5mNGmiPOzFgM92YYLWbN
	gW2m5OqEK5dpR9VfTwBHdiUuwSK/QiXgXtSPCZZSsvFSmanEHQc79bZ4aQSh/41j5NZoNUAfhrk
	Tt8qjcC3g2N0DU0RvhmFVE4r5WHw0twnmuGsf83NNZ2/5RviR1Xu/om3sUXdrc90EpD1NPcILnN
	h6FNFB250HU7qZNcg+jzFKbTlkmCNgM7cYUUC+sVJl5ObACQyW2N79fQ8mn5JdeGpwl4ndVX3uk
	h5pw7m6t0nCbi9hk0O4sQimSSTKXya+XOuocibyIhDIGZEfK2fS77oWTSXxF9vrEnHuHhN3dmcu
	N5hud4RcbV2RwWTLgn6Kn5ge+hb5vm5MMBaBs8XXS1N/V3M151OZCAxxFF4VrolRTCpwoZBKWMO
	O7loL1LWxhmYs4488zbebCpAo0RBDzNEbIBCPPd6st1y6gXTg06aJQwISeb3R9RztTWEyg1Bso1
	xgOd8rFiZgRh56KSKq9gRblvFPi7ueBAoFqMKp/Ia8gxC
X-Received: by 2002:a05:6122:e146:b0:5ea:aedd:6087 with SMTP id 71dfb90a1353d-5ec4cc275f7mr2103697e0c.4.1793219828216;
        Wed, 28 Oct 2026 13:37:08 -0700 (PDT)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f931911sm3001789e0c.10.2026.10.28.13.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:37:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 06/10] mm/shmem_luo: Don't make early retrieve
 failures permanent
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261022225035.377445-7-dmatlack@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-7-dmatlack@google.com>
Date: Wed, 28 Oct 2026 16:36:59 -0400
Message-Id: <179321981903.1894369.10174219200491856665.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=tG1lwbJH2imddc9/EkdAvCrAH3EsxAEhBkg3bvhE7pU=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq4lzu/Ke5JngGl45TFenDqO7sG2rxu1esqb+GP
 W9djlMo20SJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauJc7gAKCRC7dyhM23N6
 3iaED/9+Ua/XelfQOiEDcPhs+IpN2Oer+RtBy5oWFs3Ld85ncxpkokj4M4S+zrCda7T6eqJ99qt
 WLFndguG8lw6lCfX6vMRTCE9OvLMPJBZgk++IOWd8vMSMo6sJuHC2aIVh3oiJGQbplm8A1pHtUd
 vK6/sqWNP+mqdoADa7IlEmu7uydtPZQ6gVUtj2oUDU/YZzfGVeoNe5EpResTvkYk6Vdp1neLYfh
 lGFsCCrjbH7TCtTThMrEBPQ4JJlJ1/OFqdkCwFpq+cdyUtErBGUGLeK2rxFf07U8U/ydQn4SZUM
 WENbDKA0F1DjRR8/sx7kedrfcj9vWP2vd3hFY+cEsyTLawSybRQS3QTUa+gEJtOXZPjHosBrYLV
 SgvOrjrbhjAv0oaxXMYRWWKgn64IPRbOdPvQ4F/QszjMPjkReBEjjmQFtsspuKgQddk58EUwpqT
 4ngiCEIpWUObRZBvgLFJYKOfdLl0q15dVVsk2n07fF0Neb1UD5cKlw/weF8lT3q6GuTXbsMyJum
 A4XQ+dpSI5XTmQAxL/tylp3fhJLTkVqQo9jG9GkfeVltDyl5rgMWOELBqk40kb4LfCQGwzLL4Hl
 lFLQ2ewQ3dOcxeCNM8ZEEzGZDPFihhVjKt13uUjJSoCIYziR5ctZUkisBrVjd+w69E7fYLFUC0e
 eLmLu3ergMn5ALQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> If shmem_luo_retrieve() fails before it starts restoring the folios,
> mark the failure as retryable and return the error without freeing the
> serialized state. Nothing has consumed the preserved state at that
> point, so the retrieve can be tried again. If no retrieve succeeds,
> finish() frees the preserved folios, like it does for a file that was
> never retrieved.
> 
> This fixes leaking the preserved folios when one of these early steps
> fails, e.g. because the file has seals that this kernel doesn't support.
> The retrieve freed the serialized state but not the folios, and finish()
> then skipped the file because its retrieve had failed.

You should also note that args->retryable was introduced in this 
series, so there is no fixup required for this since this was 
previously not possible.

> Assisted-by: LLM
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261022225035.377445-7-dmatlack@google.com
>
> diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
> index b8d86055912d..bcac1bbb3db3 100644
> --- a/mm/shmem_luo.c
> +++ b/mm/shmem_luo.c
> @@ -390,9 +390,9 @@ static void shmem_luo_finish(struct liveupdate_file_op_args *args)
>  	struct shmem_luo_ser *ser;
>  
>  	/*
> -	 * If retrieve was successful, nothing to do. If it failed, retrieve()
> -	 * already cleaned up everything it could. So nothing to do there
> -	 * either. Only need to clean up when retrieve was not called.
> +	 * If retrieve was successful, nothing to do. If it failed permanently,
> +	 * retrieve() already cleaned up everything it could. So nothing to do
> +	 * there either. Only need to clean up when the file was not retrieved.
>  	 */
>  	if (args->retrieve_status)
>  		return;
> @@ -526,11 +526,16 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  	if (!ser)
>  		return -EINVAL;
>  
> +	/*
> +	 * Nothing has consumed the preserved state until the folios are
> +	 * restored below, so failures before that can be retried. If no
> +	 * retrieve succeeds, finish() frees the preserved state.
> +	 */
> +	args->retryable = true;
> +
>  	/* Make sure the file only has seals supported by this version. */
> -	if (ser->seals & ~SHMEM_LUO_ALL_SEALS) {
> -		err = -EOPNOTSUPP;
> -		goto free_ser;
> -	}
> +	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
> +		return -EOPNOTSUPP;
>  
>  	/*
>  	 * The seals are preserved. Allow sealing here so they can be added
> @@ -539,8 +544,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
>  	if (IS_ERR(file)) {
>  		pr_err("failed to setup file: %pe\n", file);
> -		err = PTR_ERR(file);
> -		goto free_ser;
> +		return PTR_ERR(file);
>  	}
>  
>  	err = memfd_add_seals(file, ser->seals);
> @@ -552,17 +556,20 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
>  	i_size_write(file_inode(file), ser->size);
>  
> +	/* The preserved state is consumed from here on. */
> +	args->retryable = false;
> +
>  	if (ser->nr_folios) {
>  		folios_ser = kho_restore_vmalloc(&ser->folios);
>  		if (!folios_ser) {
>  			err = -EINVAL;
> -			goto put_file;
> +			goto free_ser;
>  		}
>  
>  		err = shmem_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
>  		vfree(folios_ser);
>  		if (err)
> -			goto put_file;
> +			goto free_ser;
>  	}
>  
>  	args->file = file;
> @@ -570,10 +577,10 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  
>  	return 0;
>  
> -put_file:
> -	fput(file);
>  free_ser:
>  	kho_restore_free(ser);
> +put_file:
> +	fput(file);
>  	return err;
>  }
>  

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
