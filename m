Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E980348C6B;
	Fri, 16 Oct 2026 21:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185115; cv=none; b=Qg8KtTTHbIscm69sbJrPpk1Wg6fR6ARJYdmn0bcFet1+v5aY94KByv3eW7qCznN0NIRgYtho46ja1o7GClXKR/Vk+2Po3yNGao9qSuQhK9y7B7YevUSWHHZ57MWJ5UG9gVJ3GNpDk5LJgWc3vG3SPMOt8wud6vNvwS4dsBcvjzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185115; c=relaxed/simple;
	bh=v5IRc2wXkJvb9zEx9NMmKT+hK8jhjvsVg6/IJYj+gEA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zu3ehefq6L5t3pE7IUA6vQiJz2H5rJaJLhPGVDOh9zsoo3FyeHGmjBqS+Uym+zzhZE+cmfmKqxHdNnzEYSZtDI9cq+QH8fOCKKrL5Hfpilv9ccr+F0a0jRJ8foaJFy3OVTE/32IqUv3RNxwbbY+f91ACFH1hLGm1hPum6fp/evA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ibfn3GXR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ibfn3GXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B291F000C4;
	Fri, 16 Oct 2026 21:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792185113;
	bh=2tEGSeF5PI35Lt2CQPZaEHitbLYXEGdQbg6YAh37VEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ibfn3GXRGAzXdkltyjMBNq2ArWdRdSJRJkwjOFbDhecAKm9B4NfzLIgCAF7tvTvLD
	 lKLsFFfdurC5miZLFn72wsAHygR8YBvo4bhLD/WxeXL0BMsj7nZtqchLbt7WmoXy/j
	 L2ttbSHVVi9BQhL46o7+hYVQOiFkueoM1kigYhfAxcHaFq/kofNsht9Pci7P1+L1EF
	 Kt/xthVwWi2solX8hXftLUdleM5XSCRIHsyLUf7qMemM4LQxmUPYHGprIIJsIJlNLW
	 l8hqYUcg7OUV9/NVb8biL/yXAZwWSw4sSPBDlNQSgm7ZQxaPVrgIaPd8ULBYiPADhe
	 AM1ZgFHyTzPfg==
Date: Fri, 16 Oct 2026 23:11:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 rdunlap@infradead.org, mchehab@kernel.org, paulmck@kernel.org,
 linusw@kernel.org, Julia.Lawall@inria.fr, gary@garyguo.net,
 rmk+kernel@armlinux.org.uk, hemanth.selam@gmail.com
Subject: Re: [PATCH] docs: kdoc: handle TRACE_EVENT_FN() family in
 tracepoint parser
Message-ID: <20261016231148.7b5a88ef@foz.lan>
In-Reply-To: <20261016204335.46241-1-emmaonana18@gmail.com>
References: <20261015190639.7b722dd7@foz.lan>
	<20261016204335.46241-1-emmaonana18@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 21:43:35 +0100
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
> TRACE_EVENT()
> 
> Add a regression test for the gpu_power_status declaration.
> 
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
> Move tracepoint handling to xforms_lists, together with SYSCALL_DEFINE
> as requested by Mauro.
> 
> Question for Mauro: is adding syscall_munge() and
> tracepoint_munge() in apply() what you meant, or
> did you want a pure CMatch? 

I meant a pure CMatch. One of the hardest things to maintain at
kernel-doc are those complex regex logic spread all over it. The
goal for CMatch and the C tokenizer is to avoid adding more - and 
instead - to reduce the existing ones over time.

In the specific case of commas, the tokenizer, ideally double commas
should be generating a singe STRING token and single commas a single
CHAR.

> A pure CMatch looks
> like it would need a tokenizer fix for nested
> commas, so I'd prefer to keep it this way unless
> you want the pure CMatch rework.

If the nested commas logic there is broken, indeed it needs a fix, on a 
separate patch.

> 
>  tools/lib/python/kdoc/kdoc_parser.py  | 110 ++++++--------------------
>  tools/lib/python/kdoc/xforms_lists.py | 109 +++++++++++++++++++++++++
>  tools/unittests/test_kdoc_parser.py   |  28 +++++++
>  3 files changed, 159 insertions(+), 88 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 80d4245acd17..a274e06b9f23 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -1059,8 +1059,27 @@ class KernelDoc:
>              #
>              # Apply the initial transformations.
>              #
> +            # This also handles SYSCALL_DEFINE*() and TRACE_EVENT*()/
> +            # DEFINE_EVENT*() via CTransforms (see xforms_lists.py).
> +            #
>              prototype = self.xforms.apply("func", prototype)
>  
> +            #
> +            # Tracepoints are documented with their short name, e.g.
> +            # gpu_power_status for trace_gpu_power_status().
> +            # Accept the short name and store the full trace_ name.
> +            #
> +            r = KernRe(r'\btrace_(\w+)')
> +            if r.search(prototype):
> +                if self.entry.identifier == r.group(1):
> +                    self.entry.identifier = f"trace_{self.entry.identifier}"
> +
> +
> +            r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
> +            if r.search(prototype):
> +                self.emit_msg(ln,
> +                              f"Unrecognized tracepoint format:\n{prototype}\n")
> +
>          # Yes, this truly is vile.  We are looking for:
>          # 1. Return type (may be nothing if we're looking at a macro)
>          # 2. Function name
> @@ -1493,82 +1512,6 @@ class KernelDoc:
>              self.entry.add_text(doc_content.group(1))
>          # else ... ??
>  
> -    def syscall_munge(self, ln, proto):         # pylint: disable=W0613
> -        """
> -        Handle syscall definitions.
> -        """
> -
> -        is_void = False
> -
> -        # Strip newlines/CR's
> -        proto = re.sub(r'[\r\n]+', ' ', proto)
> -
> -        # Check if it's a SYSCALL_DEFINE0
> -        if 'SYSCALL_DEFINE0' in proto:
> -            is_void = True
> -
> -        # Replace SYSCALL_DEFINE with correct return type & function name
> -        proto = KernRe(r'SYSCALL_DEFINE.*\(').sub('long sys_', proto)
> -
> -        r = KernRe(r'long\s+(sys_.*?),')
> -        if r.search(proto):
> -            proto = KernRe(',').sub('(', proto, count=1)
> -        elif is_void:
> -            proto = KernRe(r'\)').sub('(void)', proto, count=1)
> -
> -        # Now delete all of the odd-numbered commas in the proto
> -        # so that argument types & names don't have a comma between them
> -        count = 0
> -        length = len(proto)
> -
> -        if is_void:
> -            length = 0  # skip the loop if is_void
> -
> -        for ix in range(length):
> -            if proto[ix] == ',':
> -                count += 1
> -                if count % 2 == 1:
> -                    proto = proto[:ix] + ' ' + proto[ix + 1:]
> -
> -        return proto
> -
> -    def tracepoint_munge(self, ln, proto):
> -        """
> -        Handle tracepoint definitions.
> -        """
> -
> -        tracepointname = None
> -        tracepointargs = None
> -
> -        # Match tracepoint name based on different patterns
> -        r = KernRe(r'TRACE_EVENT\((.*?),')
> -        if r.search(proto):
> -            tracepointname = r.group(1)
> -
> -        r = KernRe(r'DEFINE_SINGLE_EVENT\((.*?),')
> -        if r.search(proto):
> -            tracepointname = r.group(1)
> -
> -        r = KernRe(r'DEFINE_EVENT\((.*?),(.*?),')
> -        if r.search(proto):
> -            tracepointname = r.group(2)
> -
> -        if tracepointname:
> -            tracepointname = tracepointname.lstrip()
> -
> -        r = KernRe(r'TP_PROTO\((.*?)\)')
> -        if r.search(proto):
> -            tracepointargs = r.group(1)
> -
> -        if not tracepointname or not tracepointargs:
> -            self.emit_msg(ln,
> -                          f"Unrecognized tracepoint format:\n{proto}\n")
> -        else:
> -            proto = f"static inline void trace_{tracepointname}({tracepointargs})"
> -            self.entry.identifier = f"trace_{self.entry.identifier}"
> -
> -        return proto
> -
>      def process_proto_function(self, ln, line, source):
>          """Ancillary routine to process a function prototype."""
>  
> @@ -1598,18 +1541,9 @@ class KernelDoc:
>              r = KernRe(r'^(\S+\s+)\(\s*\*(\S+)\)')
>              self.entry.prototype = r.sub(r'\1\2', self.entry.prototype)
>              #
> -            # Handle special declaration syntaxes
> -            #
> -            if 'SYSCALL_DEFINE' in self.entry.prototype:
> -                self.entry.prototype = self.syscall_munge(ln,
> -                                                          self.entry.prototype)
> -            else:
> -                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
> -                if r.search(self.entry.prototype):
> -                    self.entry.prototype = self.tracepoint_munge(ln,
> -                                                                 self.entry.prototype)
> -            #
> -            # ... and we're done
> +            # ... and we're done. SYSCALL_DEFINE*() and TRACE_EVENT*()/
> +            # DEFINE_EVENT*() are handled via xforms_lists.CTransforms
> +            # inside dump_function().
>              #
>              self.dump_function(ln, self.entry.prototype, source)
>              self.reset_state(ln)
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index 15f6f21c7a9e..aa82dc927ef1 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -17,6 +17,98 @@ class CTransforms:
>      into something we can parse and generate kdoc for.
>      """
>  
> +    @staticmethod
> +    def syscall_munge(proto):
> +        """
> +        Handle syscall definitions.
> +
> +        Turns SYSCALL_DEFINE*() into a plain C prototype, e.g.::
> +
> +            SYSCALL_DEFINE3(setpriority, int, which, int, who, int, niceval)
> +            -> long sys_setpriority(int which, int who, int niceval)
> +        """
> +
> +        is_void = False
> +
> +        # Strip newlines/CR's
> +        proto = re.sub(r'[\r\n]+', ' ', proto)
> +
> +        # Check if it's a SYSCALL_DEFINE0
> +        if 'SYSCALL_DEFINE0' in proto:
> +            is_void = True
> +
> +        # Replace SYSCALL_DEFINE with correct return type & function name
> +        proto = KernRe(r'SYSCALL_DEFINE.*\(').sub('long sys_', proto)
> +
> +        r = KernRe(r'long\s+(sys_.*?),')
> +        if r.search(proto):
> +            proto = KernRe(',').sub('(', proto, count=1)
> +        elif is_void:
> +            proto = KernRe(r'\)').sub('(void)', proto, count=1)
> +
> +        # Now delete all of the odd-numbered commas in the proto
> +        # so that argument types & names don't have a comma between them
> +        count = 0
> +        length = len(proto)
> +
> +        if is_void:
> +            length = 0  # skip the loop if is_void
> +
> +        for ix in range(length):
> +            if proto[ix] == ',':
> +                count += 1
> +                if count % 2 == 1:
> +                    proto = proto[:ix] + ' ' + proto[ix + 1:]
> +
> +        return proto
> +
> +    @staticmethod
> +    def tracepoint_munge(proto):
> +        """
> +        Handle tracepoint definitions.
> +
> +        Turns TRACE_EVENT*()/DEFINE_EVENT*() into a plain C prototype,
> +        e.g.::
> +
> +            TRACE_EVENT_FN(gpu_power_status, TP_PROTO(...), ...)
> +            -> static inline void trace_gpu_power_status(...)
> +
> +        Returns the original string if the tracepoint format is not
> +        recognized, letting the caller emit a warning.
> +        """
> +
> +        tracepointname = None
> +        tracepointargs = None
> +
> +        # Match tracepoint name based on different patterns.
> +        # NOTE: DEFINE_EVENT*() takes a template name first, so the
> +        # event name is the second argument.
> +        for pattern, group in [
> +            (r'TRACE_EVENT\((.*?),', 1),
> +            (r'TRACE_EVENT_FN\((.*?),', 1),
> +            (r'TRACE_EVENT_FN_COND\((.*?),', 1),
> +            (r'TRACE_EVENT_CONDITION\((.*?),', 1),
> +            (r'TRACE_EVENT_SYSCALL\((.*?),', 1),
> +            (r'DEFINE_SINGLE_EVENT\((.*?),', 1),
> +            (r'DEFINE_EVENT\((.*?),(.*?),', 2),
> +        ]:
> +            r = KernRe(pattern)
> +            if r.search(proto):
> +                tracepointname = r.group(group)
> +
> +        if tracepointname:
> +            tracepointname = tracepointname.lstrip()
> +
> +        r = KernRe(r'TP_PROTO\((.*?)\)')
> +        if r.search(proto):
> +            tracepointargs = r.group(1)
> +
> +        if not tracepointname or not tracepointargs:
> +            return proto
> +
> +        return f"static inline void trace_{tracepointname}({tracepointargs})"
> +
> +
>      #
>      # NOTE:
>      #      Due to performance reasons, place CMatch rules before KernRe,
> @@ -147,6 +239,23 @@ class CTransforms:
>          if xforms_type not in self.xforms:
>              return source
>  
> +        #
> +        # Handle special declaration syntaxes first, so that the
> +        # declarative transforms below see plain C prototypes.
> +        #
> +        if xforms_type == "func":
> +            source_str = str(source)
> +            if 'SYSCALL_DEFINE' in source_str:
> +                source_str = self.syscall_munge(source_str)
> +                source = source_str
> +            else:
> +                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
> +                if r.search(source_str):
> +                    munged = self.tracepoint_munge(source_str)
> +                    # tracepoint_munge() returns the input unchanged
> +                    # when the format is not recognized.
> +                    source = munged
> +
>          if isinstance(source, str):
>              source = CTokenizer(source)
>  
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
