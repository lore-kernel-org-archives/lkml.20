Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191522;
	b=KLh8gBciSU4sHc6u9HSGgxf2hu8QMNYyQX0gHFsueyLExq6BXJplUYuJmT7TB56yis8p
	 UJLsb2TGgSxN9jcrd0/btpIPxjLV3CuPrxAQ5oDioMDbZql0Z4oC8KJ5KX6Zk5k8LSV4l
	 CuloyjRwo97r93CVx7FoUoY1P8p2r6YYbih+zw2l5HB352AdkFQHooHIQ7QJA7asyoGIM
	 6BUkcwVcBTUuH9GnMzmhPIhBtu21QCDC7Gxgiwsizx2RUfcQx59VTw+QpBsvLr6NA5N1Z
	 4RXG6hguhvMw6Lfq9PUePwgZe2WqP+xcoaBlBWl1V+NyKbMg0CC0FnFoTRCglMY6a9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LbDv0XxXL4jun3vJs/THg0exYJ8fRU8LTDwe8xfPh6M=;
	b=PhrJwnKELbbI7LC4aS64Mc6/E3Z6wiSczs50/7iGMlNBS2m5j82cbJEHGCcv3X5MUfWn
	 t9KyTPzRzjEPr9j08xmhvZZzKBUk+JrvLt3zdyz5wnCmW4Y2MyokFMKr/xUHXjWDq4ycO
	 Bt7sou4dIImS0D4nk1smZYDxroToA4QPECc0lZea7wUK6es9cMM8Ciz+DxrDdflLR+9kw
	 TrHDHkmpEwOQ747lkwPfwNF1808xg+TpP6KaH0P1FBM1/68KcpmYLaujaGy+0QCjOwhyz
	 XSHZhk1xN9FNzE46sQCmPxflNDjlB739iqG+t+kn/aSfc+QK6bDzSCrfxVTdhD39hwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nzQQJxq/";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A914606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A914606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzQQJxq/
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1931ff67a29so1120195c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794191521; x=1794796321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbDv0XxXL4jun3vJs/THg0exYJ8fRU8LTDwe8xfPh6M=;
        b=nzQQJxq/C0uKAfp84jXxrrOh+bv84vYhXkrPaJ8L5jDllQ0CwLZencpq4Q924JedQV
         0/RZtzbamb2PyjzqocfKn0rrh618LCrvRkZ3BnYhvKGViGqq2AHx2TCiALMXt9MIverf
         8BSsY9CX3xgzXIooaDkDvgZ1suxapxWsz5TQ15gDWUOMUvC7BXg8siNRvN8LSX9mOswD
         wyZ0+/5AY0Pwzl7s2D7uJQuYViLItQyaSUkNeluNf9m6dKhJ5dQVvnQyPQhZY8SRbnRB
         OQ/hMO66TY7f0Fva9nBuT0ZnHhEhWJN7O50+qeJPoVDYI0FcxQ3w5xIClfG67E4pADIE
         51kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191521; x=1794796321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbDv0XxXL4jun3vJs/THg0exYJ8fRU8LTDwe8xfPh6M=;
        b=gqxGcSsVaW7l3+I72T1kCCG6TQJ6/3ZyCNN2jPSb80VpcEyDnDsIcyY3Y8NbAPSDty
         UKEeX/DA/DlUAhCe7lG77GtfDOctr0c95/yw9G1sVpqye+GfoboBC6dspXZTd+/dPX3D
         ZTcJ9DIxRgTdJv9m5rm1grutND0y28fWeO5NnEQAk8u2mIwhxlipZu76Ct7AZhDTTmzD
         ivgtRKgHPlvjEfWnyuKv6AU1rmZA9IHw4Jn0OKU9d3DFnpcqsJz/GVMIeX8i670eXJoU
         A7BYODA/rg387F2whNK/q4G7n6IWua0Jg+9eIymEEWQSBbmcglHxLp1/L0bYN6ZehA08
         K1HA==
X-Forwarded-Encrypted: i=1; AL+hErHQ+mzs1AqNXlCf76X01bQAazkgtjX325Nvx7lT9YZ304jURbYsVoULMNJwoTBUQAcG8kfV7bXYzhfJEyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IqVK0HzpCYdLfYJ6ur2E5kcf2711P+TkowlYCrVzYj3bITPBE
	YIFxo3AalXxXWQOnVQig/RyTKv6VL+zPLMetkDc33Pq+PmViTBugQJtq
X-Gm-Gg: AYBFou3uVsMWnnVenQ57htIn7BB0E/mXgj14q5eXf+6Qn2DtovkalL634BEzLnSUB07
	6HZrjVKUCK3aDMrhlofqHVOF5uLce0sOi5jkMZAfKBvWNQh3jK8HQo2nSmravYe2NEhjPBkmrRv
	cGnGVIMB2Lk7b1mjeHBy6TJrd5AAj3AJxiYP+GiaaGGD/TmUcgO3XyGVRIYO4kbTOSpQ+/cnUXj
	nrSSf21mxaRtHBqMqZxiPv/u8bY+Q+HV5N1GhttN/P+ZM3JPTdAtdAO4qZ8sPhVUVznQvo70o8q
	3iMlPk5p58j8hU4gCDbJCmtMVpGfMEqN+Kk7oc+3eVSPteWc3gQWWNRNODtvHtSYPzG8oDmq573
	N7bA0GzFdEHSrpL9p2LDdABa/g9tXv0AzH6VeVTrPkJt1n8+8Q6IjPdiNV0Tr4kfBLpDcoiqu3u
	0Ov7QptVpfHoDqFdtHDrw6t+sM7h1Ejuwe7VukW8sSB4eBuJ4DhjbfXiCkCdiuNnPV7Hc/y362c
	QS4e8xwoEMLdP6YmZyI6+c6TMRD7Y5C7Ffv3wyP35Vfklq8Pn2D3C20X3xxVREx2NaucOARvKQe
	VAkcUK/IokXkl+gi0g==
X-Received: by 2002:a05:701a:c907:b0:190:8f72:445e with SMTP id a92af1059eb24-1b39fecbe1fmr4519636c88.11.1794191520825;
        Sun, 08 Nov 2026 18:32:00 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372632d7d62sm13689947eec.3.2026.11.08.18.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:32:00 -0800 (PST)
Date: Mon, 9 Nov 2026 11:31:57 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
Subject: Re: [PATCH v5 11/31] ntfs: handle source record removal failure
 during attribute moves
Message-ID: <avEwnT6CAgeCj2oo@hyunchul-PC02>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
 <20261102073532.98873-12-wangxuewen_ky@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102073532.98873-12-wangxuewen_ky@163.com>

On Mon, Nov 02, 2026 at 03:35:12PM +0800, Xuewen Wang wrote:
> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> ntfs_attr_record_move_to() ignores failure to remove the source attribute
> after copying it. It can update the attribute-list reference and report
> success with both copies present.
> 
> Check removal before changing the list entry. On failure, attempt to
> remove the destination copy, mark its record dirty and unmap it, leaving
> the list pointing to the source. Report destination cleanup failure
> separately.
> 
> Shrinking a record to zero needs no extra space, so failure indicates
> inconsistent record accounting. Return and report EFSCORRUPTED even if
> cleanup also fails.
> 
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")

This patch has the Fixes tag, but it calls
ntfs_report_file_metadata_error(), which is introduced in patch 3.
If this patch is backported to a stable tree with patch 3, it could fail
to build.

> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
>  fs/ntfs/attrib.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 5af8ac41af17..f1c99e0d8dca 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -3578,7 +3578,17 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
>  	nctx->attr->instance = nctx->mrec->next_attr_instance;
>  	nctx->mrec->next_attr_instance =
>  		cpu_to_le16((le16_to_cpu(nctx->mrec->next_attr_instance) + 1) & 0xffff);
> -	ntfs_attr_record_resize(ctx->mrec, a, 0);
> +	err = ntfs_attr_record_resize(ctx->mrec, a, 0);
> +	if (err) {
> +		err = -EFSCORRUPTED;
> +		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
> +		if (ntfs_attr_record_resize(ni_mrec, nctx->attr, 0))
> +			ntfs_report_file_metadata_error(VFS_I(ni),
> +							-EFSCORRUPTED);
> +		mark_mft_record_dirty(ni);
> +		unmap_mft_record(ni);
> +		goto put_err_out;
> +	}
>  	mark_mft_record_dirty(ctx->ntfs_ino);
>  	mark_mft_record_dirty(ni);
>  
> 
> 

-- 
Thanks,
Hyunchul
