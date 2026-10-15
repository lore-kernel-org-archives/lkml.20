Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633F1A682C;
	Thu, 15 Oct 2026 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084019; cv=none; b=g7yxjCiPad6z4D8koVmciMHelqXMEnURdUqNZikEjmBz8S9oXEd8md0msByVM7CIsTeCWJ4F29WIJh0WIuo8jtFA5UZVLOXQ9CYam/P3q7EwmOYnVdJr609U1jdFQmYGfcQZOomxVJiAO96sGTNNqRZEqd0UtnzEc3ffoEDG2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084019; c=relaxed/simple;
	bh=iT2B5mF8h/diXDhOTTXMHv6YR9hN1Osy2q0hy279a9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JLaxZRLtPFrfDs3IfozHNJ5tm7DLf9Er5kuX+zv9sN/fNN+VoViKgBPr5Z4nl5xyA22+yUZR1nlHZEJt7DlJv4BlhilEuILusRrF93tfi89fEtuAjkh6lmsdnCaDbLZfpq5NmzQ1D9xnnZ5/X13ipVnV9Fm0LdAv/ekLKSjDhj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gy190T5n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gy190T5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E795C1F000C4;
	Thu, 15 Oct 2026 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792084004;
	bh=7LXdRQVlo+IatrPNbHoxpTkbcPjG0UJKxCqYwZdOL7A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Gy190T5n7j/eSNsWvMCBMXgvO43SgReR9YRJtON05MQRmA7z5KngeBn2QTdzCW5up
	 7FhTQbVkxI9hMVCYHkszjKH39uH+k7AdESi60gzWvZUQAgLlfztYt1ccUM37W5y57J
	 5HfZVhoslyJetRVNrB2zYbDbr/KNGv1Pd3HDQEIR5zVl/aNkWwhaeSQ1EIvWbI9Yd+
	 59BoHtMqjlfbMTP9YF3s2IAdegRe+8hLJigkUSo0qbUM1uPPzi9It5pJ9EocphO9UJ
	 4G84mfqYr1oVDUj4YwtJ1dR7mq+HALdBybfsKuW6bExYCtbHIMxdlgIW1gFgouPCLZ
	 Mvl6rlkzUg6Fw==
Date: Thu, 15 Oct 2026 19:06:39 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 rdunlap@infradead.org, mchehab@kernel.org, paulmck@kernel.org,
 linusw@kernel.org, Julia.Lawall@inria.fr, gary@garyguo.net,
 rmk+kernel@armlinux.org.uk, hemanth.selam@gmail.com
Subject: Re: [PATCH v3 1/2] docs: kdoc: handle TRACE_EVENT_FN() family in
 tracepoint parser
Message-ID: <20261015190639.7b722dd7@foz.lan>
In-Reply-To: <20261015164524.14066-2-emmaonana18@gmail.com>
References: <8733u7t8xq.fsf@trenco.lwn.net>
	<20261015164524.14066-1-emmaonana18@gmail.com>
	<20261015164524.14066-2-emmaonana18@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 17:44:47 +0100
Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> wrote:

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
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 18 +++++++++++++++++-
>  tools/unittests/test_kdoc_parser.py  | 28 ++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 80d4245acd17..a65bda3e81b9 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -1545,6 +1545,22 @@ class KernelDoc:
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
> @@ -1604,7 +1620,7 @@ class KernelDoc:
>                  self.entry.prototype = self.syscall_munge(ln,
>                                                            self.entry.prototype)
>              else:
> -                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
> +                r = KernRe(r'TRACE_EVENT|TRACE_EVENT_FN|TRACE_EVENT_FN_COND|TRACE_EVENT_CONDITION|TRACE_EVENT_SYSCALL|DEFINE_EVENT|DEFINE_SINGLE_EVENT')

The best would be instead to move all of them to xforms_lists,
together with SYSCALL_DEFINE.

Regards,
Mauro

>                  if r.search(self.entry.prototype):
>                      self.entry.prototype = self.tracepoint_munge(ln,
>                                                                   self.entry.prototype)
> diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
> index 4baa78ca02b3..04dafae412e4 100755
> --- a/tools/unittests/test_kdoc_parser.py
> +++ b/tools/unittests/test_kdoc_parser.py
> @@ -444,6 +444,34 @@ class TestContextLockStruct(GenerateKdocItem):
>          self.assertEqual(entries[0].name, "debugfs_cancellation")
>          self.assertEqual(entries[0].warnings, [])
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



Thanks,
Mauro
