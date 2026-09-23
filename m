Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD334F497
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142405; cv=none; b=bSAjWMtqYCNqai810du0bL5zvV9UR090yQOUPff8NNRC9zI4B1gBPP7CXahmLZlOc9Y8sTFwy6fKaynXaJIO11GvQZ2EELQDbnjYFPgVznfZdP3lAiHn1QU5ocdGFnEjnAhwLT2DXbnVmGnEJirniq29qFAVVBfDJEJwNZpKfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142405; c=relaxed/simple;
	bh=RFcuOwEqjf9SaP/OTSaZv2iojCmoDJVvJIjDiQ7k58Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDV8zxuoACaeGOEU8cR0jnbNwjx2oDfxFlUhIMSewdXCXNNcoZe17aTpqG0bvkGcM5K43XhCSF2QZXbkW+lMED+UHQ6unqjlbOkrnGDB4LOlxo6C9ODyXlzp0pAiX++2KIx+kjXSFdp4NdmiqdkXujBZsZ8Hg6VNwfE8ZlE/I/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=UEfECF5T; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="UEfECF5T"
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id 9AXvx1tU3FNWB9FoXxUac3; Wed, 23 Sep 2026 05:46:41 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id 9FoWxebh8upTF9FoXxRTGx; Wed, 23 Sep 2026 05:46:41 +0000
X-Authority-Analysis: v=2.4 cv=H9jbw/Yi c=1 sm=1 tr=0 ts=6ab367c1
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=7T7KSl7uo7wA:10 a=1XWaLZrsAAAA:8
 a=VwQbUJbxAAAA:8 a=GayhebFrRX0EwB9RMoAA:9 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=OTwx4w9402ve7XEVGULW94SFMv5Tl4N0r/phY59l/8k=; b=UEfECF5TgEW3
	KGIj5aT/C29st5hACjcHuxVLxBSR5tOuRMT/rmWCDjiSiI+BzQMiTkM0qDAMxbHWK0jWLqRxQEoAr
	ro+Og+0qw7/KJY6TDfCr4pB3RfKZ8OPRmY157FqncfrM24JAx8Vq1qu9OrVkMYXgVi9TNeOphlT6a
	4XmHPaMDFoirjhxsqZ4uTut9sorVP017tpwM+iI1+6BS5oO2mfQIrBgWaYEYcjTbj0xYX4QGH9Zpd
	5J3/hzOu3YEydLLXFA7/I/gyV41+wvDJxLQiZwGHasg9hWiT3sD7NJRft+6+8i0pYdAUSndXnjvkA
	87RFK8+svAIE2Wy1cUW05w==;
Received: from flh4-125-195-69-90.tky.mesh.ad.jp ([125.195.69.90]:43316 helo=[10.203.100.34])
	by gator4166.hostgator.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100)
	(envelope-from <gustavo@embeddedor.com>)
	id 1x9FoW-0000000204S-0DM9;
	Wed, 23 Sep 2026 00:46:40 -0500
Message-ID: <3e9d09ef-5766-4f19-aa8c-641e15572950@embeddedor.com>
Date: Wed, 23 Sep 2026 14:46:35 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with
 __counted_by_ptr
To: Bill Wendling <morbo@google.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
 codemender-patching+linux@google.com
References: <20260922223538.2287676-1-morbo@google.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260922223538.2287676-1-morbo@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 125.195.69.90
X-Source-L: No
X-Exim-ID: 1x9FoW-0000000204S-0DM9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: flh4-125-195-69-90.tky.mesh.ad.jp ([10.203.100.34]) [125.195.69.90]:43316
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 54
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFfXDxmMb9skvhnR7CatqsVuniKES+lqHkJ9n2jnloHamiQTPzxud3XThfTO7N6DHRH6bnM6R3H8kY4bdR96ZCpyDOG1RsrASflHqV5E2QJNeWbKVw3N
 UojdS4xDuOR1ya/q7n48proyRPehSMonXJL1uaFa7IKTs6Wxd8aKW2BNuKaFnHYzYt30y3BoyllA4Oljw4cZOSP4C1Qg/lkAxeeCldIiqTOEfYwUnSeyNVkS



On 9/23/26 07:35, Bill Wendling wrote:
> The GCC and Clang compilers provide the __counted_by_ptr attribute,
> which is used by KASAN and compiler bounds-checking to detect
> out-of-bounds accesses to pointer fields.
> 
> In "struct fsl_mc_io", the "portal_virt_addr" pointer points to the MC
> command portal virtual address. The size of this allocated portal in
> bytes is tracked by the "portal_size" field within the same structure.
> 
> Annotate the "portal_virt_addr" pointer field with
> "__counted_by_ptr(portal_size)" to enable compiler bounds-checking and
> harden against potential out-of-bounds accesses.
> 
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-Gustavo

> ---
>   include/linux/fsl/mc.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> index c25f0f7e6dd4..0b2c0eb9b605 100644
> --- a/include/linux/fsl/mc.h
> +++ b/include/linux/fsl/mc.h
> @@ -336,7 +336,7 @@ struct fsl_mc_io {
>   	u16 flags;
>   	u32 portal_size;
>   	phys_addr_t portal_phys_addr;
> -	void __iomem *portal_virt_addr;
> +	void __iomem *portal_virt_addr __counted_by_ptr(portal_size);
>   	struct fsl_mc_device *dpmcp_dev;
>   	union {
>   		/*

