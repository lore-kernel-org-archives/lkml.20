Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4903E95A0;
	Thu, 15 Oct 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051857; cv=none; b=mnopvMYfMSn6SGXeHHr9ncw4wlMO6cV8Eoi8XtRF1tnj39w8RYQ646g011SLkHsh5ROfu+9R0AXr1nCFTUW9qXRiNZz9N74jGla7p5YNc2rH05Ysa5NjXG210ubaVEZGxHfvkBH2X+5CutZEldx2cUyj2+hUIOO1OSn6/BcTfzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051857; c=relaxed/simple;
	bh=wq/T/Hu7vZB5pZ8bXwvH9Ap36DLqoACjJ+Ix8zA6ZdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/eXV1aIc00wXE8spTr04JKW4i4D07YSefWBK/hqaoKRTiq8vHcm6FCKVrXFUXaQ5gJvx6L72re4xTw2p8Wg55LUfRFV+KUk9YjF0K2W01JR72+XPJoUX3ZrKRGjhi/uGMYomF/U98NJB/gseuprFMq/8zu8ITSYsNqi+qPBYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNSSuVBE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNSSuVBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331691F000C4;
	Thu, 15 Oct 2026 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792051855;
	bh=k8El4r9kmcBjSvocgSz2oUF4ZFCHqS1+xsg30+hV1TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cNSSuVBEww63PNgXf33nf+5D5YQxFDye0o+j6LIJdhUnAuqlirHwoGQ7f/K84Y1/A
	 ZeE6l8cwI64APgJM+lP4vbQ8S/2ZHkij868t9zzh/Zi+DpAtyK5TFpCWsemIduHZrU
	 MvFaXRsVvEd3tVuV6XE0k5cENmP854YlZkDfG6jKslOrYZO9QUlXq+XTNnJtl1FzVk
	 QLlifpmmnZy4kPBNaceIrajkJ8tTXvuOR2CkyOtydoN2jZGR1sgEX2CdV5m+n3JP1K
	 iwL58epLDIhrsXYeL0kl1VPRJ8MpXvuKk3MMxZTMjt688eXT99lfdPTMiwUXK6Kdbn
	 9BiWQTGHYhOIA==
Date: Thu, 15 Oct 2026 11:10:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: tudor.ambarus@linaro.org, mchehab+huawei@kernel.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux@weissschuh.net, linux-kernel@vger.kernel.org, corbet@lwn.net,
	aleksandr.loktionov@intel.com, kexec@lists.infradead.org,
	pratyush@kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH v1] docs: xforms_lists: Handle DECLARE_KHOSER_PTR()
 struct members
Message-ID: <atCKiDTSST8TKKNQ@kernel.org>
References: <20261015020313.946940-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015020313.946940-1-pasha.tatashin@soleen.com>

On Wed, Oct 14, 2026 at 10:03:13PM -0400, Pasha Tatashin wrote:
> KHO ABI structures declare their preservation pointers with
> DECLARE_KHOSER_PTR(name, type), which expands to a union of the pointer
> and its physical address. kernel-doc does not know the macro and does
> not see the member: it warns that an unnamed member is not described
> and that the description of the member is excess.
> 
> Translate DECLARE_KHOSER_PTR(name, type) into "type name", as is done
> for DECLARE_KFIFO_PTR().
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/lib/python/kdoc/xforms_lists.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index e3dda2fe8a537..e81d8a7702cbb 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -45,6 +45,7 @@ class CTransforms:
>          (CMatch("DECLARE_HASHTABLE"), r"unsigned long \1[1 << ((\2) - 1)]"),
>          (CMatch("DECLARE_KFIFO"), r"\2 *\1"),
>          (CMatch("DECLARE_KFIFO_PTR"), r"\2 *\1"),
> +        (CMatch("DECLARE_KHOSER_PTR"), r"\2 \1"),
>          (CMatch("(?:__)?DECLARE_FLEX_ARRAY"), r"\1 \2[]"),
>          (CMatch("DEFINE_DMA_UNMAP_ADDR"), r"dma_addr_t \1"),
>          (CMatch("DEFINE_DMA_UNMAP_LEN"), r"__u32 \1"),
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> prerequisite-patch-id: 557b4f406b7530b8be07d3e3aa6015ad89ceaa6d
> prerequisite-patch-id: c0430a4f0096e4be93a6200aa4e8a1d392238ca5
> prerequisite-patch-id: 524c71eab38a9175f9920f38717c8ed3b157299f
> prerequisite-patch-id: 61cfc274edef2fb23a1b867c9e0d063578387c45
> prerequisite-patch-id: ac022b05628f8e495a224216352aa037a022aae4
> prerequisite-patch-id: 50668baf257da9873190d08f21538ddc453261a8
> -- 
> 2.56.0.385.gd3acb90ef8-goog
> 

-- 
Sincerely yours,
Mike.
