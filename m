Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738110;
	b=NccGgFczyKIXXyAfP4VODSur5ABo/z1LqbYY+khPi+bT7roVESmpveVpF4WpQtFYTYsO
	 qKuUTKa/jRVgf9d1YXJL/+6RSExYfEEpYXRR/bCPsFz/bAanmVdXojlu1N0llo/8hm5wt
	 +iFjcpTE8qnwbwemP+b+Gq/MQ/MdM0/GxSS1Lpyr0V70EZ6K4KvsUggVOFdoc/zSN6AjA
	 SzYESUmOvy13h81ClWbAp9lHSba3kAUK8KvNZY5y0XALuXD5hSWp2dr0uLAdy+0xKI2ZA
	 l2uJ1Fv131LFzTZrV1DO6p4uJiFBlqZ9r+6VsybL1UbLs3Vm4ZESsm84ggqRVmwlfiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+aadLIA3GPIeeFSZgpfHdaGRi1nlOlSeRKXWPRo2sBI=;
	b=zLrEATk6upIwPCsqbv0z9u6s0M0v9rw+cqCS72ihkZxzsr1bUx4P5Ci4jNpOOJeWBE0G
	 pTHE4V457ADouqjyUsYchYNDPvJ4k0fhWzTBFArluboC8zNwGZFzTx5Op06oB/Fbx8gWP
	 EJ4qi0UTC5IDMqciAAhs+ezCIb3ZzdlF7cPgz6e4hDfy2EP4/aTDySbBVS3IAUk1zOCG3
	 fz0xQCAHAAjkwXiZYgeyxCu4t3IknuWbIZmIrSuv8OKKrPKGTMb7uOJJMgo4gdBsHzn4+
	 pccQCTv1Qmnawda/zWRr7XRB1y3IcPVHiaQCRgR0X/ZmTKFJQhLVlrFBLll7jPpWneQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PwFGDYyp;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E29606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E29606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PwFGDYyp
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7ccb2ffe333so2795203137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793738109; x=1794342909; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+aadLIA3GPIeeFSZgpfHdaGRi1nlOlSeRKXWPRo2sBI=;
        b=PwFGDYypTCj+Bijf5W8hJPUtwmL05ERK8ctWF6lqRVIr4DnGRFRiparen697cEDqn0
         iXRt590euDQQLv2RUjW0OWe3f0qrizcAk5MFwkIenUop03URqKCrFHp7O0eZqRR32QOt
         Qg3eTsW0c6R5VMOGu/FSrLUzjlcJaw079jejb6MggV+EgEzEaDTVaHzhJ3lT6+57BE6F
         peb0U8CWZQCTX9jxktt0gV9YrLDpCu3Pxi3ckzMDEy0Fq4VaPL6SSCwWy0bHgBjyXYa4
         qSlMI+H1eLrnquSSIuf+2A2DGxF1HUAN+gRuQ+AHnHJ90a2mLOkrRn8elPX2y0CETTHE
         RYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738109; x=1794342909;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aadLIA3GPIeeFSZgpfHdaGRi1nlOlSeRKXWPRo2sBI=;
        b=MdIQKaCe7eF1ykkSxwSWhL0y4wSvyBhJEGllZ6p9VdMDY4cB2s6O67jZB4Q31ZNMec
         Wxn9Z73E4B9PAcsQI70h6TQSM5mGHbDstm+W8ae3bVQP4WvrsdK34YqfjakseVAYgdQc
         igMDSU6JLqT92Kp/uwqS6PUm2vdWtXcyIV9nIZysAbcOrGDTviy4rzy/a0friSnxiL4b
         zT7GLned+6WA+oSXUrRLj8e2ibBvh7tGcf/9ObTk7Ne0ROOzFDbLBEbLpSkkcrsbkBSD
         wCz9ipDFhGxFreyvnK6hCrZrETGWB1DwjQiEjVh+J8U9fGq9hhYIVXTXuLZrw9V2IykH
         dS5A==
X-Forwarded-Encrypted: i=1; AKwUvBzQ7XTD9jCbIapMBG+4hkDzKLBudnS5AKFih3ZQDLeLRPHVpUvRPd36o7mozcVylBfKjVUaSbmAq3Ju+yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vyTODVT64eUwx44Yb0rlKnxDnL8R5PYBRzwFqglvld41hRFmI
	XDdFEcB0ONQsxwxr0g4Y1vLZCu6U3BiYWn4q8nFn3phBqPjFHVyP9TauPfFxcefLOta6pdwsNRi
	g5PpN
X-Gm-Gg: AYBFou1I3S8mseVeGhrgD61bncj9+h7R0hWnDBbl4x7oNMwAaey46PGTJyARE8ESRR0
	KzYpkZBN7BNeeCgO3KJ2peDTrtFcm1SxZPt931QvFIA4mfk5yYUgax715ctSuEz5aVAlBBEart3
	TiIxTQEHvXfWGC4cwZuKB9l2+xOBXcB+luX9YnOz+MVj7Mp6gg/rx+2xJUTcFB8MxnVj39ssIHE
	ersiH2owgmvkY0NXrftVtKBSx1UpwtN/b/6/BniyaCzUFWO0iAn4x5vGcHbaxiXneb7H5eTpzeY
	9VXrGCxaRxdRfZNUjg3Gz9xXrmzbv07z1rYTb4xVyZAgdA+ooAlHW2nyEZ3yzFHSpdYiOq2VjqC
	THhWTm2iSbgD9yJCIdrFTIAfaXR4S0nFlHD1saVigIdi+A3Ugw6hN2c+Wjythi++8sGjk5ykfkM
	+mLCtqBDxcQ8DUR6ZT2n28qxEUcLY0SrYMM1JPQbbkzsSgILYq2GlmKlmhnu1xJRdmocjHnYidm
	9aXjy3wr5VGMuSPjWkSb9VHNQ+eKvlTugTEJU+x+ozbITeRYUhjYSGKr14fYVeJZEWTV6aF//yQ
	PjMoxseXVGePyz6TXiBT+WQAdQOo8qi60jEe482C5TlYzCc9+24vZTTVHQbhTcKUwZqS0Z/Mby/
	HfFnryjFs9sdj/yEFI1dDQoeNsBqO4HHLcZWm7yKofEK/Fq0=
X-Received: by 2002:a05:6102:fa0:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d072c45613mr6088445137.21.1793738109309;
        Tue, 03 Nov 2026 12:35:09 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d212bsm155984241.6.2026.11.03.12.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:35:08 -0800 (PST)
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
Subject: Re: [PATCH 2/2] mm/memfd_luo: keep memfd frozen until finish
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Samiullah Khawaja <skhawaja@google.com>, kexec@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261103181916.2462825-3-pratyush@kernel.org>
References: <20261103181916.2462825-1-pratyush@kernel.org>
 <20261103181916.2462825-3-pratyush@kernel.org>
Date: Tue, 03 Nov 2026 15:35:04 -0500
Message-Id: <179373810485.663454.3013535045194073890.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4103;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=Q9ypSzsjws//mPEdnfoKVj2XLrGaTXlODYwHP6URKeI=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6kV7gzwYxzNrt8ME5QZOVfBKCFWD7TcrD+6Y8
 XNUBOCAUIGJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaupFewAKCRC7dyhM23N6
 3oOmD/45tsbGyvIfML7jhFB8SNoj9u0KhnedpAIpQwPtIW7BQkCU/VWLhvj6VtL0up9s07eAQb3
 X0G2UQD0u0r+KV3PffnvpmK3T7y+i2Q4vnJYb8UEeMuQBN4itfu+yFwFCxasz4skubWeoBcapZB
 JVHeuQL9rCZC+I8HL0SICEZCArUMYqWQ4gs5YLMwgb0+SI8TNTqIKuhgp+EL6mapJC2G7mp1l/d
 i80dMJBv4h0R+5nxX9TIKWZkDopl4CeHS6rNovT7htVgNiktIOAo/LvBiJ/Guag9NLwF+bdUk0K
 sKTTiGKm5Jcg5fkNhHrfwNdp+XAIb5Qx3OIGXfDy+4tH+as2CXTDIbR+cyXF7xVv0HCmxQL9hEE
 TEUdFej1A/CubkfpkVWuXldkQk1MngOiRcJ7saqYSjsNmJoN1FCYjLJHWMKCBlWbMeAlvgIbcf6
 P6lwko+CGQi1QvrDhK3v5TgKCkkdUJUsclABW64ciR/95j5dexoupov6Fmt4+kG+ZucpANvb5L+
 oZCOAUXQ2sqSRJHRv6qPK6ODHQ0GZIMoHBRqRA7Sq72ngSVaFqlTeAiNxfXN3q6LrT6pVnlaU9W
 v0+6Nd4cqgxNCJhp6rMst1eW+1nD+B71CoraCgtW4DCy79RDJIS6HmAdQjJTCRCJUKatPy0GwcM
 khpcHll+P8oHIEg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> After a memfd is retrieved, it immediately goes back into "normal"
> operation. The file comes back unfrozen, and its pages can migrate, it
> can be truncated, and so on. If the memfd is depended on by something,
> like iommufd, that can open a window for folios to move around before
> the consumer can re-establish its references.
> 
> Finish is the conceptual point when a retrieved file can start to behave
> as "normal". So take an extra reference on the folios and freeze the
> memfd on retrieve until finish.
> 
> Suggested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> Link: https://patch.msgid.link/20261103181916.2462825-3-pratyush@kernel.org
>
> diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
> index 6b68220275eb..5abb9c0956af 100644
> --- a/mm/memfd_luo.c
> +++ b/mm/memfd_luo.c
> @@ -55,6 +55,14 @@
>   *   Only seals known to this LUO version (see ``MEMFD_LUO_ALL_SEALS``) may
>   *   be present; preservation fails with ``-EOPNOTSUPP`` otherwise.
>   *
> + * Restrictions
> + * ============
> + *
> + * While a memfd is preserved, and after it is retrieved until the session is
> + * finished, its size can't be changed and holes can't be punched in it.
> + * Operations that would do so (``ftruncate()``, ``fallocate()``, writes past
> + * the end of the file) fail.
> + *
>   * Non-Preserved Properties
>   * ========================
>   *
> @@ -383,33 +391,56 @@ static void memfd_luo_discard_folios(const struct memfd_luo_folio_ser *folios_se
>  	}
>  }
>  
> +/* Drop the references retrieve() holds on the folios added to the file. */
> +static void
> +memfd_luo_put_retrieved_folios(const struct memfd_luo_folio_ser *folios_ser,
> +			       u64 nr_folios)
> +{
> +	for (u64 i = 0; i < nr_folios; i++) {
> +		const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
> +
> +		if (pfolio->pfn)
> +			folio_put(pfn_folio(pfolio->pfn));
> +	}
> +}
> +
>  static void memfd_luo_finish(struct liveupdate_file_op_args *args)
>  {
>  	struct memfd_luo_folio_ser *folios_ser;
>  	struct memfd_luo_ser *ser;
>  
> -	/*
> -	 * If retrieve was successful, nothing to do. If it failed, retrieve()
> -	 * already cleaned up everything it could. So nothing to do there
> -	 * either. Only need to clean up when retrieve was not called.
> -	 */
> -	if (args->retrieve_status)
> +	/* If retrieve failed, it already cleaned up everything it could. */
> +	if (args->retrieve_status < 0)
>  		return;
>  
>  	ser = phys_to_virt(args->serialized_data);
>  	if (!ser)
>  		return;
>  
> -	if (ser->nr_folios) {
> -		folios_ser = kho_restore_vmalloc(&ser->folios);
> -		if (!folios_ser)
> -			goto out;
> +	if (args->retrieve_status > 0) {
> +		/*
> +		 * Retrieve was successful, release the folios and unfreeze the
> +		 * file so it can be used normally.
> +		 */
> +		struct inode *inode = file_inode(args->file);
> +
> +		folios_ser = args->private_data;
> +
> +		inode_lock(inode);
> +		memfd_luo_put_retrieved_folios(folios_ser, ser->nr_folios);
> +		shmem_freeze(inode, false);
> +		inode_unlock(inode);
>  
> -		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
>  		vfree(folios_ser);
> +	} else if (args->retrieve_status == 0 && ser->nr_folios) {
> +		/* Retrieve was not called, discard the preserved folios. */
> +		folios_ser = kho_restore_vmalloc(&ser->folios);
> +		if (folios_ser) {
> +			memfd_luo_discard_folios(folios_ser, ser->nr_folios);
> +			vfree(folios_ser);
> +		}

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 

Side note (pre-existing, not an issue with this patch):

Initially, I wondered whether we should disallow auto-finishing an 
unretrieved memfd, in case a preserved device still had this memory 
mapped for DMA. However, if we reach this point, can_finish() has 
already passed for every other FD in this session, which means any 
possibly dependent FDs (e.g. iommufd/vfio) have already determined that 
this FD was not needed to be retrieved for their states.

-- 
Pasha

