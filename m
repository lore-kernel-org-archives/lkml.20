Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792629814;
	b=MNaDa/b3iRZsGj3aSCCTDmx26q58RHtJB6wFidG5jg7OTErsRO91NwfPto61DbPZt5AS
	 ArOlFUFv+d3ZpcPduCVbllDRctDoCZgeX/18AyuglOyioTQWyAKsnwUSSzlZutFH2Uvb3
	 pvCWbAXCZoPXt0bC6gMXgoUjpF7rLWbPNoXXWpPe6eetQJAN4k1Vsrvmu2h7yIb0lDgJW
	 +w/360qWSXC2zFUwPJZnZ6BEQ4jyQtnKzHtk38uQ5VZXfS78P5B3/YSu4hat1McPIlvyh
	 TvOZlD69XPdPt3lzirhC0xYsQljKU7I8gba7VVBsXsabXeGFiyWnZBO5va3Vq91hX7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792629814;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lxBvtP4MIQ19INXjrL3ad8TITBr5ihwqjZNxu7zUZYM=;
	b=bHSNAp9ri2mfL0wNt3kPCTNjvfwBhKjBFCix3FIpM6umLo29FeSE/+/AGDL1DOXs3Gx0
	 qNPleao39IHg66h5pjL/dHAAhlZxm3/C8TlWd2+gDP8CqNg/yPqWWDMLnoz5qy7iJrGMI
	 h114h4fxlY8pobSNHKzvqK0rQhJIwh+7WvXswMbTsNlXjQxkJYFvbCJ2kqGL28E04VAb0
	 z75155Y5C5oQOPPnjB8QQ1HZan1azwWtCPYHIfXa0UMmmoL2Gke9B2fwvUkHSVXcJDWN8
	 asFiRK5crcgo3KgwZULigKSjxFC+FQhFzjO1z6FlDS0GbPPPkMHTnm4FBhk93FQEAUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIOdqmi2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0154606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIOdqmi2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1821F000C1;
	Thu, 22 Oct 2026 00:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792629813;
	bh=lxBvtP4MIQ19INXjrL3ad8TITBr5ihwqjZNxu7zUZYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eIOdqmi2nMs4fuoITIfr3vvtGDMSzUIaxwKooLj9dC2Vbe7SiTMvPcefcm/jb5P25
	 0ejcUKP7lciSVXMopgLIhaqNrhBaFqfddxsqo37Iqw5rrOjSt5KNdacmKfu5c6Dt8B
	 6pIlbBVy7sXsTs7XYiGYjmtqx6Cqop5+rHp59AL/OToKCnqADTUVwq0qJn6+lphA0I
	 l25yKMO30HcsOlrF4iJ+6kLk9AcZ3HN+4Ea+3PtHyE+KDJ/LEHp/is0vQi2rQ+X4Y7
	 SsDEfvP4KlUxmrGaYc14d1rhwREBYtnYWGm3yXN9vGYfT8BdtDInwnRsGNxZ1jhNq8
	 m6H4Pd4L7SA4Q==
Date: Thu, 22 Oct 2026 09:43:29 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, Sang-Heon Jeon
 <ekffu200098@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org
Subject: Re: Bootconfig updates for v7.4
Message-Id: <20261022094329.3f945e236aa91ff0f5e71e2e@kernel.org>
In-Reply-To: <undine-1792628050192621158-acf139ac8ccbe10b@undined.local>
References: <undine-1792628050192621158-acf139ac8ccbe10b@undined.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Sorry, please ignore this. I missed [GIT PULL] tag. So I resent with it.

On Thu, 22 Oct 2026 09:14:10 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> Hi Linus,
> 
> Bootconfig updates for v7.4:
> 
> - bootconfig: Parser robustness and validation improvements
>  . Skip printing early params to cmdline from bootconfig: Suppress
>    early_param keys from /proc/cmdline and warn the user, since bootconfig
>    does not invoke early_param handlers and silently ignoring them is
>    misleading.
>  . Reject unexpected data after null character: Detect and reject non-null
>    data following an intermediate null character in the bootconfig buffer,
>    preventing silently ignored configuration after an early termination.
> 
> - bootconfig: Code cleanups
>  . Merge _xbc_exit() into xbc_exit(): Since memblock_free() now handles
>    late freeing and NULL addresses, the separate _xbc_exit() helper and
>    its early argument are unnecessary. Inline it into xbc_exit().
>  . Remove redundant assignment in xbc_parse_array(): The node->child = 0
>    assignment after the loop duplicates what xbc_init_node() already did.
>  . Skip internal tree sanity checks in kernel: Move the node index bounds
>    loop from xbc_verify_tree() into a userspace-only xbc_sanity_check_tree()
>    to reduce boot-time overhead, since out-of-bounds indices cannot be
>    produced by malformed input.
>  . Move BOOTCONFIG_FOOTER_SIZE to include/linux/bootconfig.h: Share the
>    footer size constant between kernel and user-space tools, replacing the
>    hardcoded (BOOTCONFIG_MAGIC_LEN + 8) expression in init/main.c.
> 
> - tools/bootconfig: Tooling improvements
>  . Remove unused PAGE_SIZE macro from the bootconfig tool.
>  . Consolidate xbc_init() to error message wrapper: Use
>    init_xbc_with_error() for all bootconfig initialization paths in the
>    tool for simpler and more consistent error handling.
> 
> 
> Please pull the latest bootconfig-v7.4 tree, which can be found at:
> 
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
> bootconfig-v7.4
> 
> Tag SHA1: 8c84ad1d280719b36079cdd280da8214c3a8013d
> Head SHA1: 677f83795fdfc25ddc51b665a9111f5ff199f7ca
> 
> 
> Masami Hiramatsu (Google) (5):
>       bootconfig: Skip printing early params to cmdline from bootconfig
>       bootconfig: Reject unexpected data after null character
>       tools/bootconfig: Consolidate xbc_init() to error message wrapper
>       bootconfig: Skip internal tree sanity checks in kernel
>       bootconfig: Move BOOTCONFIG_FOOTER_SIZE to include/linux/bootconfig.h
> 
> Sang-Heon Jeon (3):
>       bootconfig: merge _xbc_exit() into xbc_exit()
>       bootconfig: remove redundant assignment in xbc_parse_array()
>       tools/bootconfig: remove unused PAGE_SIZE macro
> 
> ----
>  include/linux/bootconfig.h          |  21 ++++---
>  init/main.c                         |  75 ++++++++++++++++++++++---
>  lib/bootconfig.c                    |  84 +++++++++++++++++-----------
>  tools/bootconfig/main.c             | 108 +++++++++++++++---------------------
>  tools/bootconfig/test-bootconfig.sh |  12 ++++
>  5 files changed, 192 insertions(+), 108 deletions(-)
> ---------------------------
> diff --git a/include/linux/bootconfig.h b/include/linux/bootconfig.h
> index deda507500da..260a6f46042e 100644
> --- a/include/linux/bootconfig.h
> +++ b/include/linux/bootconfig.h
> @@ -27,6 +27,10 @@ bool __init cmdline_has_extra_options(void);
>  #define BOOTCONFIG_ALIGN	(1 << BOOTCONFIG_ALIGN_SHIFT)
>  #define BOOTCONFIG_ALIGN_MASK	(BOOTCONFIG_ALIGN - 1)
>  
> +/* Bootconfig footer is [size][csum][BOOTCONFIG_MAGIC]. */
> +#define BOOTCONFIG_FOOTER_SIZE	\
> +	(sizeof(uint32_t) * 2 + BOOTCONFIG_MAGIC_LEN)
> +
>  /**
>   * xbc_calc_checksum() - Calculate checksum of bootconfig
>   * @data: Bootconfig data.
> @@ -266,7 +270,15 @@ int __init xbc_node_compose_key_after(struct xbc_node *root,
>  			struct xbc_node *node, char *buf, size_t size);
>  
>  /* Render key/value pairs under @root as a flat cmdline string */
> -int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root);
> +typedef bool (*xbc_cmdline_filter_fn)(struct xbc_node *node, const char *key, void *data);
> +
> +int __init xbc_snprint_cmdline_filter(char *buf, size_t size, struct xbc_node *root,
> +				      xbc_cmdline_filter_fn filter, void *data);
> +
> +static inline int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root)
> +{
> +	return xbc_snprint_cmdline_filter(buf, size, root, NULL, NULL);
> +}
>  
>  /**
>   * xbc_node_compose_key() - Compose full key string of the XBC node
> @@ -291,12 +303,7 @@ int __init xbc_init(const char *buf, size_t size, const char **emsg, int *epos);
>  int __init xbc_get_info(int *node_size, size_t *data_size);
>  
>  /* XBC cleanup data structures */
> -void __init _xbc_exit(bool early);
> -
> -static __always_inline void xbc_exit(void)
> -{
> -	_xbc_exit(false);
> -}
> +void __init xbc_exit(void);
>  
>  /* XBC embedded bootconfig data in kernel */
>  #ifdef CONFIG_BOOT_CONFIG_EMBED
> diff --git a/init/main.c b/init/main.c
> index 16749bb7a219..861e07f6c05c 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -278,7 +278,7 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
>  	int i;
>  
>  	if (!initrd_end || initrd_end < initrd_start ||
> -	    initrd_end - initrd_start < BOOTCONFIG_MAGIC_LEN + 8)
> +	    initrd_end - initrd_start < BOOTCONFIG_FOOTER_SIZE)
>  		return NULL;
>  
>  	data = (char *)initrd_end - BOOTCONFIG_MAGIC_LEN;
> @@ -336,9 +336,64 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
>  
>  #ifdef CONFIG_BOOT_CONFIG
>  
> +/* Check if a parameter name matches an obs_kernel_param entry */
> +static bool __init match_obs_param(const char *param, const char *pattern)
> +{
> +	size_t n = strlen(pattern);
> +
> +	if (n > 0 && pattern[n - 1] == '=')
> +		return parameqn(param, pattern, n - 1) && param[n - 1] == '\0';
> +
> +	return parameq(param, pattern);
> +}
> +
> +/* Return true if the given param is only defined by early_param(). */
> +static bool __init is_early_only_param(const char *param)
> +{
> +	const struct obs_kernel_param *p;
> +	const struct kernel_param *kp;
> +	bool has_early = false;
> +
> +	/* If handled by a regular module_param, it is not early-only */
> +	for (kp = __start___param; kp < __stop___param; kp++) {
> +		if (parameq(param, kp->name))
> +			return false;
> +	}
> +
> +	/* Check __setup / early_param table */
> +	for (p = __setup_start; p < __setup_end; p++) {
> +		if (match_obs_param(param, p->str)) {
> +			if (!p->early)
> +				return false;
> +			has_early = true;
> +		}
> +	}
> +	return has_early;
> +}
> +
> +struct xbc_filter_data {
> +	bool warn;
> +};
> +
> +static bool __init xbc_kernel_param_filter(struct xbc_node *node,
> +					   const char *key, void *data)
> +{
> +	struct xbc_filter_data *fdata = data;
> +
> +	if (is_early_only_param(key)) {
> +		if (fdata && fdata->warn)
> +			pr_warn("bootconfig: early_param 'kernel.%s' cannot be applied from bootconfig, skipping\n",
> +				key);
> +		return false;
> +	}
> +	return true;
> +}
> +
>  /* Make an extra command line under given key word */
> -static char * __init xbc_make_cmdline(const char *key)
> +static char * __init xbc_make_cmdline(const char *key, bool is_kernel)
>  {
> +	struct xbc_filter_data fdata = { .warn = true };
> +	xbc_cmdline_filter_fn filter = is_kernel ? xbc_kernel_param_filter : NULL;
>  	struct xbc_node *root;
>  	char *new_cmdline;
>  	int ret, len = 0;
> @@ -347,8 +402,12 @@ static char * __init xbc_make_cmdline(const char *key)
>  	if (!root)
>  		return NULL;
>  
> -	/* Count required buffer size */
> -	len = xbc_snprint_cmdline(NULL, 0, root);
> +	/*
> +	 * Pass 1: Count required buffer size. Emit warnings for skipped early
> +	 * params in this pass so they are logged even if all parameters under
> +	 * @key are skipped and len becomes 0.
> +	 */
> +	len = xbc_snprint_cmdline_filter(NULL, 0, root, filter, &fdata);
>  	if (len <= 0)
>  		return NULL;
>  
> @@ -358,7 +417,9 @@ static char * __init xbc_make_cmdline(const char *key)
>  		return NULL;
>  	}
>  
> -	ret = xbc_snprint_cmdline(new_cmdline, len + 1, root);
> +	/* Pass 2: Render into buffer with warnings suppressed */
> +	fdata.warn = false;
> +	ret = xbc_snprint_cmdline_filter(new_cmdline, len + 1, root, filter, &fdata);
>  	if (ret < 0 || ret > len) {
>  		pr_err("Failed to print extra kernel cmdline.\n");
>  		memblock_free(new_cmdline, len + 1);
> @@ -432,9 +493,9 @@ static void __init setup_boot_config(void)
>  		 * before this series.
>  		 */
>  		if (!from_embedded || !xbc_embedded_cmdline_applied())
> -			extra_command_line = xbc_make_cmdline("kernel");
> +			extra_command_line = xbc_make_cmdline("kernel", true);
>  		/* Also, "init." keys are init arguments */
> -		extra_init_args = xbc_make_cmdline("init");
> +		extra_init_args = xbc_make_cmdline("init", false);
>  	}
>  	return;
>  }
> diff --git a/lib/bootconfig.c b/lib/bootconfig.c
> index 89c88e359179..819685d6c68d 100644
> --- a/lib/bootconfig.c
> +++ b/lib/bootconfig.c
> @@ -187,12 +187,9 @@ static inline void * __init xbc_alloc_mem(size_t size)
>  	return memblock_alloc(size, SMP_CACHE_BYTES);
>  }
>  
> -static inline void __init xbc_free_mem(void *addr, size_t size, bool early)
> +static inline void __init xbc_free_mem(void *addr, size_t size)
>  {
> -	if (early)
> -		memblock_free(addr, size);
> -	else if (addr)
> -		memblock_free(addr, size);
> +	memblock_free(addr, size);
>  }
>  
>  #else /* !__KERNEL__ */
> @@ -202,7 +199,7 @@ static inline void *xbc_alloc_mem(size_t size)
>  	return calloc(1, size);
>  }
>  
> -static inline void xbc_free_mem(void *addr, size_t size, bool early)
> +static inline void xbc_free_mem(void *addr, size_t size)
>  {
>  	free(addr);
>  }
> @@ -539,18 +536,21 @@ static char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
>  #define rest(dst, end) ((end) > (dst) ? (end) - (dst) : 0)
>  
>  /**
> - * xbc_snprint_cmdline() - Render bootconfig keys under @root as a cmdline string
> + * xbc_snprint_cmdline_filter() - Render bootconfig keys as cmdline string
>   * @buf: Destination buffer (may be NULL when @size is 0 to query the length)
>   * @size: Size of @buf in bytes
>   * @root: Subtree root whose key=value pairs should be rendered
> + * @filter: Filter callback (returns true to include, false to skip; may be NULL)
> + * @data: Private context passed to @filter
>   *
>   * Walk all key/value pairs under @root and emit them as a space-separated
>   * cmdline string into @buf. Values containing whitespace are quoted with
> - * double quotes. Returns the number of bytes that would be written if @buf
> - * were large enough (matching snprintf semantics), or a negative errno on
> - * failure.
> + * double quotes. Keys for which @filter returns false are omitted.
> + * Returns the number of bytes that would be written if @buf were large enough
> + * (matching snprintf semantics), or a negative errno on failure.
>   */
> -int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root)
> +int __init xbc_snprint_cmdline_filter(char *buf, size_t size, struct xbc_node *root,
> +				      xbc_cmdline_filter_fn filter, void *data)
>  {
>  	struct xbc_node *knode, *vnode;
>  	const char *val, *q;
> @@ -582,6 +582,9 @@ int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *root)
>  		if (ret < 0)
>  			return ret;
>  
> +		if (filter && !filter(knode, xbc_namebuf, data))
> +			continue;
> +
>  		vnode = xbc_node_get_child(knode);
>  		if (!vnode) {
>  			ret = snprintf(buf ? buf + len : NULL, rest(len, size),
> @@ -836,7 +839,6 @@ static int __init xbc_parse_array(char **__v)
>  			return -ENOMEM;
>  		*__v = next;
>  	} while (c == ',');
> -	node->child = 0;
>  
>  	return c;
>  }
> @@ -1003,9 +1005,30 @@ static int __init xbc_close_brace(char **k, char *n)
>  	return __xbc_close_brace(n - 1);
>  }
>  
> +#ifndef __KERNEL__
> +/* Sanity check for regression: node indices must be within bounds */
> +static int __init xbc_sanity_check_tree(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < xbc_node_num; i++) {
> +		if (xbc_nodes[i].next >= xbc_node_num) {
> +			return xbc_parse_error("No closing brace",
> +				xbc_node_get_data(xbc_nodes + i));
> +		}
> +		if (xbc_nodes[i].child >= xbc_node_num) {
> +			return xbc_parse_error("Broken child node",
> +				xbc_node_get_data(xbc_nodes + i));
> +		}
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>  static int __init xbc_verify_tree(void)
>  {
> -	int i, depth;
> +	int depth;
>  	size_t len, wlen;
>  	struct xbc_node *n, *m;
>  
> @@ -1022,17 +1045,6 @@ static int __init xbc_verify_tree(void)
>  		return -ENOENT;
>  	}
>  
> -	for (i = 0; i < xbc_node_num; i++) {
> -		if (xbc_nodes[i].next >= xbc_node_num) {
> -			return xbc_parse_error("No closing brace",
> -				xbc_node_get_data(xbc_nodes + i));
> -		}
> -		if (xbc_nodes[i].child >= xbc_node_num) {
> -			return xbc_parse_error("Broken child node",
> -				xbc_node_get_data(xbc_nodes + i));
> -		}
> -	}
> -
>  	/* Key tree limitation check */
>  	n = &xbc_nodes[0];
>  	depth = 1;
> @@ -1119,24 +1131,30 @@ static int __init xbc_parse_tree(void)
>  		}
>  	} while (!ret);
>  
> +	if (!ret) {
> +		while (p < xbc_data + xbc_data_size - 1 && *p == '\0')
> +			p++;
> +		if (p < xbc_data + xbc_data_size - 1)
> +			ret = xbc_parse_error("Unexpected data after null character", p);
> +	}
> +
>  	return ret;
>  }
>  
>  /**
> - * _xbc_exit() - Clean up all parsed bootconfig
> - * @early: Set true if this is called before budy system is initialized.
> + * xbc_exit() - Clean up all parsed bootconfig
>   *
>   * This clears all data structures of parsed bootconfig on memory.
>   * If you need to reuse xbc_init() with new boot config, you can
>   * use this.
>   */
> -void __init _xbc_exit(bool early)
> +void __init xbc_exit(void)
>  {
> -	xbc_free_mem(xbc_data, xbc_data_size, early);
> +	xbc_free_mem(xbc_data, xbc_data_size);
>  	xbc_data = NULL;
>  	xbc_data_size = 0;
>  	xbc_node_num = 0;
> -	xbc_free_mem(xbc_nodes, sizeof(struct xbc_node) * XBC_NODE_MAX, early);
> +	xbc_free_mem(xbc_nodes, sizeof(struct xbc_node) * XBC_NODE_MAX);
>  	xbc_nodes = NULL;
>  	brace_index = 0;
>  }
> @@ -1189,20 +1207,24 @@ int __init xbc_init(const char *data, size_t size, const char **emsg, int *epos)
>  	if (!xbc_nodes) {
>  		if (emsg)
>  			*emsg = "Failed to allocate bootconfig nodes";
> -		_xbc_exit(true);
> +		xbc_exit();
>  		return -ENOMEM;
>  	}
>  
>  	ret = xbc_parse_tree();
>  	if (!ret)
>  		ret = xbc_verify_tree();
> +#ifndef __KERNEL__
> +	if (!ret)
> +		ret = xbc_sanity_check_tree();
> +#endif
>  
>  	if (ret < 0) {
>  		if (epos)
>  			*epos = xbc_err_pos;
>  		if (emsg)
>  			*emsg = xbc_err_msg;
> -		_xbc_exit(true);
> +		xbc_exit();
>  	} else {
>  		ret = xbc_node_num;
>  	}
> diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
> index 17d971d47f87..56d76bdeaa09 100644
> --- a/tools/bootconfig/main.c
> +++ b/tools/bootconfig/main.c
> @@ -17,9 +17,38 @@
>  
>  #define pr_err(fmt, ...) fprintf(stderr, fmt, ##__VA_ARGS__)
>  
> -/* Bootconfig footer is [size][csum][BOOTCONFIG_MAGIC]. */
> -#define BOOTCONFIG_FOOTER_SIZE	\
> -	(sizeof(uint32_t) * 2 + BOOTCONFIG_MAGIC_LEN)
> +static void show_xbc_error(const char *data, const char *msg, int pos)
> +{
> +	int lin = 1, col, i;
> +
> +	if (pos < 0) {
> +		pr_err("Error: %s.\n", msg);
> +		return;
> +	}
> +
> +	/* Note that pos starts from 0 but lin and col should start from 1. */
> +	col = pos + 1;
> +	for (i = 0; i < pos; i++) {
> +		if (data[i] == '\n') {
> +			lin++;
> +			col = pos - i;
> +		}
> +	}
> +	pr_err("Parse Error: %s at %d:%d\n", msg, lin, col);
> +
> +}
> +
> +static int init_xbc_with_error(char *buf, int len)
> +{
> +	const char *msg;
> +	int ret, pos;
> +
> +	ret = xbc_init(buf, len, &msg, &pos);
> +	if (ret < 0)
> +		show_xbc_error(buf, msg, pos);
> +
> +	return ret;
> +}
>  
>  static int xbc_show_value(struct xbc_node *node, bool semicolon)
>  {
> @@ -134,8 +163,6 @@ static void xbc_show_list(void)
>  	}
>  }
>  
> -#define PAGE_SIZE	4096
> -
>  static int load_xbc_fd(int fd, char **buf, int size)
>  {
>  	int ret;
> @@ -197,7 +224,6 @@ static int load_xbc_from_initrd(int fd, char **buf)
>  	int ret;
>  	uint32_t size = 0, csum = 0, rcsum;
>  	char magic[BOOTCONFIG_MAGIC_LEN];
> -	const char *msg;
>  
>  	ret = fstat(fd, &stat);
>  	if (ret < 0)
> @@ -249,52 +275,9 @@ static int load_xbc_from_initrd(int fd, char **buf)
>  		return -EINVAL;
>  	}
>  
> -	ret = xbc_init(*buf, size, &msg, NULL);
> -	/* Wrong data */
> -	if (ret < 0) {
> -		pr_err("parse error: %s.\n", msg);
> -		return ret;
> -	}
> -
> -	return size;
> -}
> -
> -static void show_xbc_error(const char *data, const char *msg, int pos)
> -{
> -	int lin = 1, col, i;
> -
> -	if (pos < 0) {
> -		pr_err("Error: %s.\n", msg);
> -		return;
> -	}
> -
> -	/* Note that pos starts from 0 but lin and col should start from 1. */
> -	col = pos + 1;
> -	for (i = 0; i < pos; i++) {
> -		if (data[i] == '\n') {
> -			lin++;
> -			col = pos - i;
> -		}
> -	}
> -	pr_err("Parse Error: %s at %d:%d\n", msg, lin, col);
> +	ret = init_xbc_with_error(*buf, size);
>  
> -}
> -
> -static int init_xbc_with_error(char *buf, int len)
> -{
> -	char *copy = strdup(buf);
> -	const char *msg;
> -	int ret, pos;
> -
> -	if (!copy)
> -		return -ENOMEM;
> -
> -	ret = xbc_init(buf, len, &msg, &pos);
> -	if (ret < 0)
> -		show_xbc_error(copy, msg, pos);
> -	free(copy);
> -
> -	return ret;
> +	return ret < 0 ? ret : size;
>  }
>  
>  static int show_xbc_kernel_cmdline(void)
> @@ -423,9 +406,8 @@ static int apply_xbc(const char *path, const char *xbc_path)
>  	char *buf, *data;
>  	size_t total_size;
>  	struct stat stat;
> -	const char *msg;
>  	uint32_t size, csum;
> -	int pos, pad;
> +	int pad;
>  	int ret, fd;
>  
>  	ret = load_xbc_file(xbc_path, &buf);
> @@ -433,9 +415,18 @@ static int apply_xbc(const char *path, const char *xbc_path)
>  		pr_err("Failed to load %s : %d\n", xbc_path, ret);
>  		return ret;
>  	}
> -	size = strlen(buf) + 1;
> +	size = ret;
> +	if (size == 0 || buf[size - 1] != '\0')
> +		size++;
>  	csum = xbc_calc_checksum(buf, size);
>  
> +	/* Verify the data format */
> +	ret = init_xbc_with_error(buf, size);
> +	if (ret < 0) {
> +		free(buf);
> +		return ret;
> +	}
> +
>  	/* Backup the bootconfig data */
>  	data = calloc(size + BOOTCONFIG_ALIGN + BOOTCONFIG_FOOTER_SIZE, 1);
>  	if (!data) {
> @@ -444,15 +435,6 @@ static int apply_xbc(const char *path, const char *xbc_path)
>  	}
>  	memcpy(data, buf, size);
>  
> -	/* Check the data format */
> -	ret = xbc_init(buf, size, &msg, &pos);
> -	if (ret < 0) {
> -		show_xbc_error(data, msg, pos);
> -		free(data);
> -		free(buf);
> -
> -		return ret;
> -	}
>  	printf("Apply %s to %s\n", xbc_path, path);
>  	xbc_get_info(&ret, NULL);
>  	printf("\tNumber of nodes: %d\n", ret);
> diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-bootconfig.sh
> index fc69f815ce4a..530ce7e28d63 100755
> --- a/tools/bootconfig/test-bootconfig.sh
> +++ b/tools/bootconfig/test-bootconfig.sh
> @@ -180,6 +180,18 @@ EOF
>  $BOOTCONF -a $TEMPCONF $INITRD 2> $OUTFILE
>  xpass grep -q "1:1" $OUTFILE
>  
> +echo "Intermediate null character test"
> +printf "key = value\n\0extra = data\n" > $TEMPCONF
> +xfail $BOOTCONF -a $TEMPCONF $INITRD
> +$BOOTCONF -a $TEMPCONF $INITRD 2> $OUTFILE
> +xpass grep -q "Unexpected" $OUTFILE
> +
> +echo "Trailing null character test"
> +printf "key = value\n\0" > $TEMPCONF
> +xpass $BOOTCONF -a $TEMPCONF $INITRD
> +$BOOTCONF $INITRD > $OUTFILE
> +xpass grep -q "value" $OUTFILE
> +
>  echo "=== expected failure cases ==="
>  for i in samples/bad-* ; do
>    xfail $BOOTCONF -a $i $INITRD
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
