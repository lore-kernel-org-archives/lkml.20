Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE39B2E8DEF;
	Fri,  2 Oct 2026 04:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915295; cv=none; b=SPbskC7fH9D/2V8ytRK3Y9Jkx11gKGambwv+/8w92mQBQ/kz8Ivbzy8Ww0+J5brgu+SD1zB1IE/O/X995eV4/JnuISQ+CQiw/bujzanSBAHmyPbokgIUUmUoil0gja4QtV3te4lXlF0P7z6LeGNj2RmzYHnMfdVSodRJ0VbZhkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915295; c=relaxed/simple;
	bh=a4qrZ3X6BrJUGLnKmxbLrkWWyO0rfby/1oQ4/m5PD4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxF01wJVX6HNTFNz+lwNgVWAfnpl/FbDmxrgaTQsihSIeOA8RSyBZoDhgWg4E+tNe4xR9JjEqzR2L3qKKKyI3DgUQu895aYlSVygUfO7nzBfGOfvS3gEj4NgVkzQefrP7isoUNc53JCNccAMfROH0Xv0Whlrp61yi2JeeUGWRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UK5JgBiI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UK5JgBiI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=eiPSa5YFJ1phU1r39n7VBqvcMjKS3pHdOT6GwqZHAck=; b=UK5JgBiIH5CF0uXUUBDtetiyi7
	2FjjH1pqrwY6HX70Hs2mceUhL+GpWUrDyYU/WULS5H1k1nvpvHOcOHxoXcXA/q5rR29yyuaWssN4a
	BZeie7mlx3r4GcjhVd3DaAl3dQ2IfvteJVDnxoggbJyRSW969s9c0A0U1HV1gx5PszFoRkvx4IcwW
	WfC+xdIzo/PIS26r/CZBDb4biAPGH08Osbwpae1LIKcHyoRXqOkQC/UoYNzCQc20JvUuzq5zW3QND
	I1bLLmLHW5MC7xJ60hoh0Ow02I5jOG/GDPUQqf3LLGXq/rF064Cs1s3n8b0uz8h7ogsBs9pfgnDES
	WnYOe/nw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCUsV-0000000AbIn-2rN7;
	Fri, 02 Oct 2026 04:28:11 +0000
Message-ID: <a6baf8b0-1ce0-4ee7-a5ea-b50bd314c7c5@infradead.org>
Date: Thu, 1 Oct 2026 21:28:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc: strip DOMAIN_NS() wrapper in function
 prototypes
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com, bvanassche@acm.org, tudor.ambarus@linaro.org
References: <20261002041520.42061-1-emmaonana18@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261002041520.42061-1-emmaonana18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/26 9:15 PM, Omokefe Emmanuel Onanaroghene wrote:
> kernel-doc fails to parse functions whose names are wrapped in the
> DOMAIN_NS() namespace macro, e.g. in
> drivers/iommu/generic_pt/iommu_pt.h:217:
> 
>   ... expecting prototype for iova_to_phys(). Prototype was for
>   DOMAIN_NS() instead
> 
> function_xforms is the designated place for unwrapping function-name
> macros, but it has no entry for DOMAIN_NS(), so the macro name is kept
> as the prototype and the real name leaks into the parameter list.
> 
> Add a transform expanding DOMAIN_NS(op) to op, following the existing
> DEFINE_IDTENTRY_IRQ precedent.
> 
> Add a regression test for the wrapped iova_to_phys() declaration.
> 
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  tools/lib/python/kdoc/xforms_lists.py |  6 ++++++
>  tools/unittests/test_kdoc_parser.py   | 22 ++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index e3dda2fe8a53..5e8bd9117895 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -91,6 +91,12 @@ class CTransforms:
>          (CMatch("__diagnose_as"), ""),
>          (CMatch("DECL_BUCKET_PARAMS"), r"\1, \2"),
>          (CMatch("DEFINE_IDTENTRY_IRQ"), r"static void \1(struct pt_regs *regs, u32 vector)"),
> +        #
> +        # DOMAIN_NS() wraps a function name with a namespace prefix
> +        # (see drivers/iommu/generic_pt/iommu_pt.h). Unwrap it so the
> +        # real function name is parsed.
> +        #
> +        (CMatch("DOMAIN_NS"), r"\1"),
>          (CMatch("__cond_acquires"), ""),
>          (CMatch("__cond_releases"), ""),
>          (CMatch("__acquires"), ""),
> diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
> index c4a76ed13dbc..4b47a858824a 100755
> --- a/tools/unittests/test_kdoc_parser.py
> +++ b/tools/unittests/test_kdoc_parser.py
> @@ -418,6 +418,28 @@ class TestSelfValidate(GenerateKdocItem):
>          """
>          self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
>  
> +class TestDomainNs(GenerateKdocItem):
> +    def test_domain_ns_wrapped_function(self):
> +        source = """
> +            /**
> +             * iova_to_phys() - Return the output address for the given IOVA
> +             * @domain: Table to query
> +             * @iova: IO virtual address to query
> +             */
> +            phys_addr_t DOMAIN_NS(iova_to_phys)(struct iommu_domain *domain,
> +                                                dma_addr_t iova);
> +        """
> +
> +        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
> +        patcher = patch('builtins.open', new_callable=mock_open,
> +                        read_data=dedent(source))
> +        with patcher:
> +            _, entries = kernel_doc.parse_kdoc()
> +
> +        self.assertEqual(len(entries), 1)
> +        self.assertEqual(entries[0].name, "iova_to_phys")
> +        self.assertEqual(entries[0].warnings, [])
> +
>  #
>  # Class and logic to create dynamic tests from YAML
>  #

-- 
~Randy
