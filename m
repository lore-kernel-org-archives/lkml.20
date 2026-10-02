Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B7209F43;
	Fri,  2 Oct 2026 04:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914878; cv=none; b=WdF2wZi6kn3bvZ4KSeP6oES4iA23OF1ANJeSRUCXGStqTazzXxuu8V9p16yb997lyDL7cratZqYQgiR0ChqsKZ2cuL4u6qKjEaOZ8ozOCj2SngmKnWXkWlAWslcWWB7ycHwBVWZLNwziByBh5fdzd26ikbGDyJz1This98v6ML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914878; c=relaxed/simple;
	bh=s36aGYLwVPRzt9q3FvEEf73F7iPGkvcQTJ8S4NItdlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXdRGW6OeRE5Ew/AN4cT6KeYobkkzDbeRjHcG3SM14FScxWpvYcGnfy1xV48vTE9Ji31LWCG2ADVYb/ZYod3P0Pe7EuXyWW9Rp3pu8zFLZ5Oz5ga/4lseBNWFFxQtjGbdRpFXzfbeOM223GWUhvvl6dWI7Fe9uoLNUbyCqLC2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=icEhvyqF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="icEhvyqF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=srfGqZgPHyltZa3bjDPjK1Sw+sf0PcsbCBc0GnyJ4S8=; b=icEhvyqFXqlrl+W4Yi9XlD9lmj
	qPS2OMzmY0eWzt2J7BG81DZiFdUjcx/COQpDlHKw6sC/JALp3J9+arPM0LUwO1X9emq03tIGVlLBA
	v0MS7eh9v0pIXVSsJZ0XF9xcDYNcxwgSBhO4+QIewP/hVmdWRkz7muzHu+qMcEh4SYMLKA9IHQM45
	aXL6veRIUlUgIUc0q3pYY9J+0NFanGVJhwBiJLX8TWAcOvWQBvo0OGxe2q/6sL1T4DEGlN9y0wuF9
	3n+tYKjv+2+yD6gqLeKcnvmkJURix/FBdckIxrV6l/V5RBdmqbxTRyiLtjgp7OFlAehy4cn7v3hsz
	MHz0AL2A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCUle-0000000Aajm-3JRr;
	Fri, 02 Oct 2026 04:21:06 +0000
Message-ID: <55b1e7f4-81a1-406c-8c58-8d2b255f9a58@infradead.org>
Date: Thu, 1 Oct 2026 21:21:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint
 parser
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com
References: <20261002023456.19470-1-emmaonana18@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261002023456.19470-1-emmaonana18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/26 7:34 PM, Omokefe Emmanuel Onanaroghene wrote:
> kernel-doc fails to parse tracepoint declarations that use
> TRACE_EVENT_FN(), e.g. gpu_power_status:
> 
>   drivers/gpu/drm/panthor/panthor_trace.h:28 ... Unrecognized
>   tracepoint format ...
>   ... expecting prototype for gpu_power_status(). Prototype was for
>   TRACE_EVENT_FN() instead
> 
> tracepoint_munge() only matches TRACE_EVENT(), so the macro name is
> kept as the prototype and the TP_PROTO() arguments leak into the
> parameter list as garbage.
> 
> Match TRACE_EVENT_FN(), TRACE_EVENT_FN_COND(),
> TRACE_EVENT_CONDITION() and TRACE_EVENT_SYSCALL() the same way as
> TRACE_EVENT() and list them explicitly at the call site in
> process_proto_function().
> 
> Add a regression test for the gpu_power_status declaration.
> 
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 18 +++++++++++++++++-
>  tools/unittests/test_kdoc_parser.py  | 28 ++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index d9ad1ddc87dd..28c325665c17 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -1542,6 +1542,22 @@ class KernelDoc:
>          if r.search(proto):
>              tracepointname = r.group(1)
>  
> +        r = KernRe(r'TRACE_EVENT_FN\((.*?),')
> +        if r.search(proto):
> +            tracepointname = r.group(1)
> +
> +        r = KernRe(r'TRACE_EVENT_FN_COND\((.*?),')
> +        if r.search(proto):
> +            tracepointname = r.group(1)
> +
> +        r = KernRe(r'TRACE_EVENT_CONDITION\((.*?),')
> +        if r.search(proto):
> +            tracepointname = r.group(1)
> +
> +        r = KernRe(r'TRACE_EVENT_SYSCALL\((.*?),')
> +        if r.search(proto):
> +            tracepointname = r.group(1)
> +
>          r = KernRe(r'DEFINE_SINGLE_EVENT\((.*?),')
>          if r.search(proto):
>              tracepointname = r.group(1)
> @@ -1601,7 +1617,7 @@ class KernelDoc:
>                  self.entry.prototype = self.syscall_munge(ln,
>                                                            self.entry.prototype)
>              else:
> -                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
> +                r = KernRe(r'TRACE_EVENT|TRACE_EVENT_FN|TRACE_EVENT_FN_COND|TRACE_EVENT_CONDITION|TRACE_EVENT_SYSCALL|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
>                  if r.search(self.entry.prototype):
>                      self.entry.prototype = self.tracepoint_munge(ln,
>                                                                   self.entry.prototype)
> diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
> index c4a76ed13dbc..398e11a8737e 100755
> --- a/tools/unittests/test_kdoc_parser.py
> +++ b/tools/unittests/test_kdoc_parser.py
> @@ -418,6 +418,34 @@ class TestSelfValidate(GenerateKdocItem):
>          """
>          self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
>  
> +class TestTraceEventFn(GenerateKdocItem):
> +    def test_trace_event_fn_declaration(self):
> +        source = """
> +            /**
> +             * gpu_power_status - called when hardware turns on or off
> +             * @dev: pointer to device
> +             * @shader_bitmap: bitmap
> +             */
> +            TRACE_EVENT_FN(gpu_power_status,
> +                TP_PROTO(const struct device *dev, u64 shader_bitmap),
> +                TP_ARGS(dev, shader_bitmap),
> +                TP_STRUCT__entry(__field(u64, shader_bitmap)),
> +                TP_fast_assign(__entry->shader_bitmap = shader_bitmap;),
> +                TP_printk("%s", __get_str(dev_name)),
> +                my_register, my_unregister
> +            );
> +        """
> +
> +        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
> +        patcher = patch('builtins.open', new_callable=mock_open,
> +                        read_data=dedent(source))
> +        with patcher:
> +            _, entries = kernel_doc.parse_kdoc()
> +
> +        self.assertEqual(len(entries), 1)
> +        self.assertEqual(entries[0].name, "trace_gpu_power_status")
> +        self.assertEqual(entries[0].warnings, [])
> +
>  #
>  # Class and logic to create dynamic tests from YAML
>  #

-- 
~Randy
