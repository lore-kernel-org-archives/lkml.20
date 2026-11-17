Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931923;
	b=w99zFupWjkhXFEKwRoLAZb+S7b+GMl6xQ9vrFZMqs1lFakg1h6FNIldMiLqjvOK01sps
	 J1urbE2iJCrltQmfjvAFPF+R3qhgMMZ8q6C/LhYh8H/RzYyo47Zy2s8KS9uNYhNXIinfr
	 +Y0C7Mkqp8w8w8O9BPDojfGWYc7Htwx0u++H83IzLMxHJ9cGBPfSYe+L/aU9lIZqPYq7/
	 gbcPVWNLzlh9pPu5mRpCtUqPq6JLjnewzXUyPVlT2qOJaLBcwcxyq4hHwC58VU8df7V2n
	 Fi7NSnOLS6WYMEyaDUooWFvnY4hvWpkNgF81rdVlWjt3iKV75cZgm4Xlfi8S1n4AW7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=AR9qjPZmViz4RKGjDQMrMtWcGuUXna8ndXGW/ywC0RU=;
	b=GuQN2n665t5Yrcn0uy+iwn6yu4Q9Q5u9RIkAcc60pQJQedFhufAV7sesmFPu/Ppm3jTa
	 RcN3fFJYKcySx4kMGRCnG01CQsmGkcsy3ldkhSfNQAfFQ+aGm/z/OiIp7jJ705D4AvWLN
	 +FDg8Ku/8P9vCgbTQr7SvTrIvsj0cCxq+GbxPDfqv7nuzK2fiszbv/mQWKgpGxy6K9EEj
	 96l4q7gfFcSyWrcuvIQx49VNXIQsGU9RAibEkB+SgKVv1nzF3EhGnpoHD3ljxPDempE0q
	 qIkArXQxP3QEZShi8xbjcg2WnESCWN/AFFUPwnH1Ion1QLYo9WlvEkEJCfI+8ADr3ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dUuEXbVf;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3269606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3269606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dUuEXbVf
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso245695e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794931921; x=1795536721; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AR9qjPZmViz4RKGjDQMrMtWcGuUXna8ndXGW/ywC0RU=;
        b=dUuEXbVfcjADo9hFHUN1OJ9JszaiJ83so+r/p9FZnUM+reMaWQetMBO5sONyBfzqjw
         YZ7NRIzt0+r5GAYGXgVjbddHhcPdNLGYwJID6Onj8RwskCQdsFNTkRjnesG4fWnoYN2/
         xbeStgTmGFt6xM4ZBeGMRJfvpWH1YwDWgabfFHAVuyGbCrIMJqOobT1urzBNWRha2BgI
         na4pE5oG7pwqGyFogUvWvFpub145dYVdOckeTJcVtOUmd7PBJRkD+a0PDYHK3tHdRuks
         9vRbYbNWBhMXxCw1UO1/jPGtI7zTEZbLsJ87OPbrJbLGVVcSR8cuZjuzK9UFyUyEpe+5
         Gysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931921; x=1795536721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AR9qjPZmViz4RKGjDQMrMtWcGuUXna8ndXGW/ywC0RU=;
        b=TVzhpOaQ9v1mQx0BF486rJ3W7SHuE788qE/cjtcO9VEul/07/BTwfLaVVn/+Tdgb9X
         QsOiTx+hxMs8AlEdcKNAmh3OwQ9tGMA7L0j4xjceqqH4vg+qgPOFqbSM2pQ+8ttMf+rY
         Hf52DxZNk3QbzziCTEpoW1kPffTgF45W/GkCynTw0d+xgrkX5eS8gyhSY1YhP3a+R3px
         FF6e4LXCsMM8FisTdPsgvpqckp4I7OmbMFvtpGdDYNAeZ51DEn+IaUQRftr9Bv1QXAG3
         gMdneyZzury83NzjqR1l+vP9cP5K5gmMfp40u/h2zfIAE2rIBO7IsBwdAMbNNghuwTG5
         h7Jg==
X-Forwarded-Encrypted: i=1; AL+hErE7Vf8SYyZ+bfe8yzs63sjO5z+2lcOJDvwkTjTW9pgNcRlhMJ43tQV8iVzt7+gqn6t8Zy1PeI4leK5rK9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z++1LsY44v8nImIWTDFzqkRShxeFhp5JNduyIzfR+BFl9gaL0oi
	rPXZEobQIbb+PNalFtBsUtS+KWYcM7IGMFYF0vep1WHBZN75yomTaH45JI5xsBceTg==
X-Gm-Gg: AYBFou1gGUbfakUns+17X8VXcyz2j2Lqgue00ol6LN7in7JGimthdjUNa7tdEgUDKzz
	D/5keFfrczk1VVmrq3DvGAMjK1mfTvnPNmlwHjmwSzbOhqn8KtlnVMG+26aF+pLuV4KfbycYec/
	zpWu3/PYP+JuLwgYkgjKmzSdoUB+GeL5C3zeeTZtucIjzUor3UaNy+x8wDTuWFHnk8tjRxsD1Un
	fEYodtbySzEajVz5UZ0j4thhRk2J5cMTtDtpUmSkpttAbUNDMHX7TTdmV+SpNsCqBlXTUYCldhi
	KrTTk7QoYcN/PPs6YZlITQF/PN5ZOlgHE/KEQn7FqaeUd5IOWyej7W/YS7dTbKwHXjODDDxlgRi
	JUppzuwAjtK8TG9t8/mtkLz71idoojPSuN/+gGHe6BTlKI52eUG17x2xHmaQyiryE9dkpW8kZDS
	2uNCCDyDjfeRbJRY8PvRkxwocJi193VP2Lc8QT0JIdrEk5Z0/R43/+IE0LRdLKnqVcV/pQ4Z16g
	A5xZ1yNM/z0CLxpTdOBzNfyJ+e2buuXJjoVIq/TvcshAIBcHaLCHWk5q7vcrtO394CipOUX2d0q
	/igbCQUCoM705dm3CLTREW+JAzVnc1hVEMZkWJMFz5owTOellkPedvniUh3HAA==
X-Received: by 2002:a05:600c:154a:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb73d5b0admr124737365e9.22.1794931920368;
        Tue, 17 Nov 2026 08:12:00 -0800 (PST)
Received: from google.com ([2a00:79e0:288a:8:12e4:4602:d8d8:3043])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783853b5sm78035005e9.2.2026.11.17.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:11:59 -0800 (PST)
Date: Tue, 17 Nov 2026 17:11:54 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Ada Smith <adasmithgt@gmail.com>, Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 5/6] selftests/landlock: Test capability checks
 outside the capable hook
Message-ID: <avx8yncGLuzDFVEa@google.com>
References: <20261117101157.2520463-1-mic@digikod.net>
 <20261117101157.2520463-6-mic@digikod.net>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117101157.2520463-6-mic@digikod.net>

On Tue, Nov 17, 2026 at 11:11:55AM +0100, Mickaël Salaün wrote:
> Test the capability checks that commoncap makes from LSM hooks other
> than capable and that the previous commits make Landlock restrict:
> mapping below vm.mmap_min_addr (CAP_SYS_RAWIO) and adding inheritable
> capabilities outside of the permitted set (CAP_SETPCAP).
> 
> Each test first checks that the operation fails without the capability,
> so that it exercises the capability check, and then checks it with the
> capability effective in four variants: unsandboxed, in a domain that
> denies the capability, in a domain that allows it, and in a domain that
> does not handle capabilities.  The mmap_addr tests map the last page
> below vm.mmap_min_addr, and skip if the architecture rejects it before
> the mmap_addr hook (e.g. 32-bit ARM).
> 
> Audit tests check that these denials are logged, that the admin reserve
> check is not, and that allowed uses log nothing.  The admin reserve
> check has no functional test: it only has an effect with
> vm.overcommit_memory=2, a system-wide setting that a test cannot change
> without racing with other processes.
> 
> Add CAP_SETPCAP and CAP_SYS_RAWIO to the capabilities that the tests may
> raise, and drop the stale count from the comment of this list.
> 
> Without the mmap_addr and capset fixes, their denied variants and the
> denial audit test fail.
> 
> Cc: Günther Noack <gnoack@google.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Serge Hallyn <serge@hallyn.com>
> Acked-by: Serge Hallyn (AMD) <sergeh@kernel.org>
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
> 
> Changes since v1:
> https://patch.msgid.link/20261110202436.2408244-6-mic@digikod.net
> - Replace the admin reserve test, which changed system-wide overcommit
>   settings and was racy (e.g. with swap, as reported by Sashiko), with a
>   comment.
> - Map the last page below vm.mmap_min_addr instead of page 0, and skip
>   when the architecture rejects it, e.g. on 32-bit ARM (reported by
>   Sashiko).
> - Mention CAP_SETPCAP in the commit message (reported by Sashiko).
> - Add Serge Hallyn's Acked-by.
> ---
>  tools/testing/selftests/landlock/cap_test.c | 336 ++++++++++++++++++++
>  tools/testing/selftests/landlock/common.h   |   4 +-
>  2 files changed, 339 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/landlock/cap_test.c b/tools/testing/selftests/landlock/cap_test.c
> index 3d7fd02e21ed..39ef57a49dc9 100644
> --- a/tools/testing/selftests/landlock/cap_test.c
> +++ b/tools/testing/selftests/landlock/cap_test.c
> @@ -12,7 +12,9 @@
>  #include <linux/landlock.h>
>  #include <sched.h>
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <string.h>
> +#include <sys/mman.h>
>  #include <sys/mount.h>
>  #include <sys/wait.h>
>  #include <sys/xattr.h>
> @@ -738,6 +740,251 @@ TEST(cap_target_userns_independent)
>  	EXPECT_EQ(0, close(target_userns_fd));
>  }
>  
> +/*
> + * Capability checks that commoncap makes from hooks other than the capable
> + * hook.  Each test first checks that the operation needs the capability, then
> + * checks it with the capability effective.  Variants cover an unsandboxed
> + * baseline, a domain that denies the capability, a domain that allows it, and a
> + * domain that does not handle capabilities.
> + */
> +/* clang-format off */
> +FIXTURE(cap_other_hooks) {};
> +/* clang-format on */
> +
> +FIXTURE_VARIANT(cap_other_hooks)
> +{
> +	const bool is_sandboxed;
> +	const bool handle_caps;
> +	const bool is_allowed;
> +};
> +
> +/* clang-format off */
> +FIXTURE_VARIANT_ADD(cap_other_hooks, unsandboxed) {
> +	.is_sandboxed = false,
> +	.handle_caps = false,
> +	.is_allowed = true,
> +};
> +/* clang-format on */
> +
> +/* clang-format off */
> +FIXTURE_VARIANT_ADD(cap_other_hooks, denied) {
> +	.is_sandboxed = true,
> +	.handle_caps = true,
> +	.is_allowed = false,
> +};
> +/* clang-format on */
> +
> +/* clang-format off */
> +FIXTURE_VARIANT_ADD(cap_other_hooks, allowed) {
> +	.is_sandboxed = true,
> +	.handle_caps = true,
> +	.is_allowed = true,
> +};
> +/* clang-format on */
> +
> +/* clang-format off */
> +FIXTURE_VARIANT_ADD(cap_other_hooks, unhandled) {
> +	.is_sandboxed = true,
> +	.handle_caps = false,
> +	.is_allowed = true,
> +};
> +/* clang-format on */
> +
> +FIXTURE_SETUP(cap_other_hooks)
> +{
> +	disable_caps(_metadata);
> +}
> +
> +FIXTURE_TEARDOWN(cap_other_hooks)
> +{
> +}
> +
> +/*
> + * Creates a ruleset that handles capabilities and allows @cap if @is_allowed,
> + * or, if !@handle_caps, a ruleset that only handles a filesystem access right.
> + * Returns the ruleset FD, or -1 with errno set.
> + */
> +static int create_variant_ruleset(const bool handle_caps, const bool is_allowed,
> +				  const int cap)

Nit: Maybe rename "is_allowed" to "allow_caps", so that it's a bit
clearer that this only makes sense in the case where caps are also
handled.  Or maybe just guard it on "cap" being non-zero, and rename
that appropriately?

> +{
> +	const struct landlock_ruleset_attr fs_attr = {
> +		.handled_access_fs = LANDLOCK_ACCESS_FS_READ_FILE,
> +	};
> +	int ruleset_fd, err;
> +
> +	if (!handle_caps)
> +		return landlock_create_ruleset(&fs_attr, sizeof(fs_attr), 0);
> +
> +	ruleset_fd = create_cap_ruleset();
> +	if (ruleset_fd < 0 || !is_allowed)
> +		return ruleset_fd;
> +
> +	if (add_cap_rule(ruleset_fd, cap)) {
> +		err = errno;
> +		close(ruleset_fd);
> +		errno = err;
> +		return -1;
> +	}
> +	return ruleset_fd;
> +}
> +
> +static void
> +enforce_cap_variant(struct __test_metadata *const _metadata,
> +		    const FIXTURE_VARIANT(cap_other_hooks) *const variant,
> +		    const int cap)
> +{
> +	int ruleset_fd;
> +
> +	if (!variant->is_sandboxed)
> +		return;
> +
> +	ruleset_fd = create_variant_ruleset(variant->handle_caps,
> +					    variant->is_allowed, cap);
> +	ASSERT_LE(0, ruleset_fd);
> +	enforce_ruleset(_metadata, ruleset_fd);
> +	EXPECT_EQ(0, close(ruleset_fd));
> +}
> +
> +static unsigned long read_sysctl(struct __test_metadata *const _metadata,
> +				 const char *const path)
> +{
> +	char buf[32];
> +	ssize_t len;
> +	int fd;
> +
> +	fd = open(path, O_RDONLY | O_CLOEXEC);
> +	ASSERT_LE(0, fd)
> +	{
> +		TH_LOG("Failed to open %s: %s", path, strerror(errno));
> +	}
> +	len = read(fd, buf, sizeof(buf) - 1);
> +	ASSERT_LT(0, len);
> +	EXPECT_EQ(0, close(fd));
> +
> +	buf[len] = '\0';
> +	return strtoul(buf, NULL, 10);
> +}
> +
> +/*
> + * Returns the last page below the vm.mmap_min_addr sysctl, or MAP_FAILED if
> + * there is none or if the architecture rejects it before the mmap_addr hook
> + * (e.g. below FIRST_USER_ADDRESS on 32-bit ARM).  The caller must not have
> + * CAP_SYS_RAWIO in its effective set.
> + */
> +static void *get_low_page(struct __test_metadata *const _metadata)
> +{
> +	const size_t page_size = sysconf(_SC_PAGESIZE);
> +	unsigned long min_addr;
> +	void *addr, *ret;
> +
> +	min_addr = read_sysctl(_metadata, "/proc/sys/vm/mmap_min_addr");
> +	if (!min_addr)
> +		return MAP_FAILED;
> +
> +	addr = (void *)((min_addr - 1) & ~(page_size - 1));
> +	ret = mmap(addr, page_size, PROT_READ,
> +		   MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +	ASSERT_EQ(MAP_FAILED, ret);
> +	if (errno == EINVAL)
> +		return MAP_FAILED;
> +
> +	ASSERT_EQ(EPERM, errno);
> +	return addr;
> +}
> +
> +/*
> + * cap_mmap_addr() requires CAP_SYS_RAWIO to map below the vm.mmap_min_addr
> + * sysctl (dac_mmap_min_addr).
> + */
> +TEST_F(cap_other_hooks, mmap_min_addr)
> +{
> +	const size_t page_size = sysconf(_SC_PAGESIZE);
> +	void *low_page, *addr;
> +
> +	low_page = get_low_page(_metadata);
> +	if (low_page == MAP_FAILED)
> +		SKIP(return, "Cannot map below vm.mmap_min_addr");
> +
> +	enforce_cap_variant(_metadata, variant, CAP_SYS_RAWIO);
> +
> +	addr = mmap(low_page, page_size, PROT_READ,
> +		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +	EXPECT_EQ(MAP_FAILED, addr);
> +	EXPECT_EQ(EPERM, errno);
> +
> +	set_cap(_metadata, CAP_SYS_RAWIO);
> +	addr = mmap(low_page, page_size, PROT_READ,
> +		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +	if (variant->is_allowed) {
> +		EXPECT_EQ(low_page, addr)
> +		{
> +			TH_LOG("Failed to map below vm.mmap_min_addr: %s",
> +			       strerror(errno));
> +		}
> +		if (addr != MAP_FAILED)
> +			EXPECT_EQ(0, munmap(addr, page_size));

If you used ASSERT(low_page, addr) above, you would not need to check
for MAP_FAILED here.

I get the feeling that you are using EXPECT because you want to do the
munmap call?  Is that strictly necessary?  I believe that the tests
are running in a fork, so if they mess up their memory mapping, it
wouldn't be problematic?  (We already have many other cleanups that
don't get done properly if an ASSERT fails, e.g. FD closing)


> +	} else {
> +		EXPECT_EQ(MAP_FAILED, addr);
> +		EXPECT_EQ(EPERM, errno);

Same here.

errno is undefined unless the mmap failed, so the line checking for
MAP_FAILED should use ASSERT_EQ IMHO.

Compare my selftest cleanup commit for that at:
https://lore.kernel.org/all/20261104-selftests-refactor-v2-24-c52f23f7ce33@gmail.com/

> +		if (addr != MAP_FAILED)
> +			munmap(addr, page_size);
> +	}
> +	clear_cap(_metadata, CAP_SYS_RAWIO);
> +}
> +
> +static int add_inheritable_cap(const cap_value_t cap)
> +{
> +	cap_t cap_p;
> +	int ret, err;
> +
> +	cap_p = cap_get_proc();
> +	if (!cap_p)
> +		return -1;
> +
> +	ret = cap_set_flag(cap_p, CAP_INHERITABLE, 1, &cap, CAP_SET);
> +	if (!ret)
> +		ret = cap_set_proc(cap_p);
> +	err = errno;
> +	cap_free(cap_p);
> +	errno = err;
> +	return ret;
> +}
> +
> +/*
> + * cap_capset() requires CAP_SETPCAP to add an inheritable capability that is
> + * not in the permitted set.  CAP_NET_RAW is in the bounding set, but
> + * disable_caps() does not put it in the permitted set.
> + */
> +TEST_F(cap_other_hooks, capset_inheritable)
> +{
> +	enforce_cap_variant(_metadata, variant, CAP_SETPCAP);
> +
> +	EXPECT_EQ(-1, add_inheritable_cap(CAP_NET_RAW));
> +	EXPECT_EQ(EPERM, errno);

Ditto about errno checking and ASSERT.

> +
> +	set_cap(_metadata, CAP_SETPCAP);
> +	if (variant->is_allowed) {
> +		EXPECT_EQ(0, add_inheritable_cap(CAP_NET_RAW))
> +		{
> +			TH_LOG("Failed to raise CAP_NET_RAW: %s",
> +			       strerror(errno));
> +		}
> +	} else {
> +		EXPECT_EQ(-1, add_inheritable_cap(CAP_NET_RAW));
> +		EXPECT_EQ(EPERM, errno);

Also here (errno checking and ASSERT).  I'll refrain from commenting
on these further below to not spam you, but there are more instances
of it below.


> +	}
> +	clear_cap(_metadata, CAP_SETPCAP);
> +}
> +
> +/*
> + * cap_vm_enough_memory() lets CAP_SYS_ADMIN use the vm.admin_reserve_kbytes
> + * reserve, but only with vm.overcommit_memory=2.  The Landlock check of this
> + * reserve has no functional test: it would have to change these system-wide
> + * settings and set a tight commit limit, which could make allocations of other
> + * processes fail and would race with them.  cap_audit.other_hooks checks that
> + * this check is not logged.
> + */
> +
>  /* Audit tests */
>  
>  static int matches_log_cap(int audit_fd, int cap_number)
> @@ -828,6 +1075,95 @@ TEST_F(cap_audit, denied)
>  	EXPECT_EQ(0, records.domain);
>  }
>  
> +/*
> + * Denials in the capset and mmap_addr paths are audited like capable hook
> + * denials.  The vm_enough_memory hook only withholds the admin reserve, with
> + * CAP_OPT_NOAUDIT, so an accounted mapping made with CAP_SYS_ADMIN effective
> + * leaves no record.
> + */
> +TEST_F(cap_audit, other_hooks)
> +{
> +	const size_t page_size = sysconf(_SC_PAGESIZE);
> +	struct audit_records records = {};
> +	void *low_page, *addr;
> +	int ruleset_fd;
> +	__u64 domain_id;
> +
> +	low_page = get_low_page(_metadata);
> +	ruleset_fd = create_cap_ruleset();
> +	ASSERT_LE(0, ruleset_fd);
> +	/* Allow CAP_AUDIT_CONTROL for child-side audit cleanup. */
> +	ASSERT_EQ(0, add_cap_rule(ruleset_fd, CAP_AUDIT_CONTROL));
> +	enforce_ruleset(_metadata, ruleset_fd);
> +	EXPECT_EQ(0, close(ruleset_fd));
> +
> +	set_cap(_metadata, CAP_SETPCAP);
> +	EXPECT_EQ(-1, add_inheritable_cap(CAP_NET_RAW));
> +	EXPECT_EQ(EPERM, errno);
> +	clear_cap(_metadata, CAP_SETPCAP);
> +	EXPECT_EQ(0, matches_log_cap(self->audit_fd, CAP_SETPCAP));
> +	EXPECT_EQ(0, matches_log_domain_allocated(self->audit_fd, getpid(),
> +						  &domain_id));
> +
> +	if (low_page != MAP_FAILED) {
> +		set_cap(_metadata, CAP_SYS_RAWIO);
> +		addr = mmap(low_page, page_size, PROT_READ,
> +			    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +		EXPECT_EQ(MAP_FAILED, addr);
> +		EXPECT_EQ(EPERM, errno);
> +		clear_cap(_metadata, CAP_SYS_RAWIO);
> +		EXPECT_EQ(0, matches_log_cap(self->audit_fd, CAP_SYS_RAWIO));
> +	}
> +
> +	set_cap(_metadata, CAP_SYS_ADMIN);
> +	addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
> +		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	EXPECT_NE(MAP_FAILED, addr);
> +	clear_cap(_metadata, CAP_SYS_ADMIN);
> +	if (addr != MAP_FAILED)
> +		EXPECT_EQ(0, munmap(addr, page_size));
> +
> +	EXPECT_EQ(0, audit_count_records(self->audit_fd, &records));
> +	EXPECT_EQ(0, records.access);
> +	EXPECT_EQ(0, records.domain);

Similar problem: "records" is undefined if audit_count_records fails,
so audit_count_records should use ASSERT.  See
https://lore.kernel.org/all/20261104-selftests-refactor-v2-12-c52f23f7ce33@gmail.com/
which fixes this across all existing tests.


> +}
> +
> +/* Allowed capability uses in the capset and mmap_addr paths. */
> +TEST_F(cap_audit, other_hooks_allowed)
> +{
> +	const size_t page_size = sysconf(_SC_PAGESIZE);
> +	struct audit_records records = {};
> +	void *low_page, *addr;
> +	int ruleset_fd;
> +
> +	low_page = get_low_page(_metadata);
> +	ruleset_fd = create_cap_ruleset();
> +	ASSERT_LE(0, ruleset_fd);
> +	ASSERT_EQ(0, add_cap_rule(ruleset_fd, CAP_SETPCAP));
> +	ASSERT_EQ(0, add_cap_rule(ruleset_fd, CAP_SYS_RAWIO));
> +	/* Allow CAP_AUDIT_CONTROL for child-side audit cleanup. */
> +	ASSERT_EQ(0, add_cap_rule(ruleset_fd, CAP_AUDIT_CONTROL));
> +	enforce_ruleset(_metadata, ruleset_fd);
> +	EXPECT_EQ(0, close(ruleset_fd));
> +
> +	set_cap(_metadata, CAP_SETPCAP);
> +	EXPECT_EQ(0, add_inheritable_cap(CAP_NET_RAW));
> +	clear_cap(_metadata, CAP_SETPCAP);
> +
> +	if (low_page != MAP_FAILED) {
> +		set_cap(_metadata, CAP_SYS_RAWIO);
> +		addr = mmap(low_page, page_size, PROT_READ,
> +			    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +		EXPECT_EQ(low_page, addr);
> +		clear_cap(_metadata, CAP_SYS_RAWIO);
> +		if (addr != MAP_FAILED)
> +			EXPECT_EQ(0, munmap(addr, page_size));
> +	}
> +
> +	EXPECT_EQ(0, audit_count_records(self->audit_fd, &records));
> +	EXPECT_EQ(0, records.access);

Here as well.

> +}
> +
>  TEST_F(cap_audit, allowed)
>  {
>  	struct audit_records records = {};
> diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
> index e29406900c04..a6fdfb422fad 100644
> --- a/tools/testing/selftests/landlock/common.h
> +++ b/tools/testing/selftests/landlock/common.h
> @@ -36,7 +36,7 @@ static const char bin_wait_pipe_sandbox[] = "./wait-pipe-sandbox";
>  static void _init_caps(struct __test_metadata *const _metadata, bool drop_all)
>  {
>  	cap_t cap_p;
> -	/* Only these three capabilities are useful for the tests. */
> +	/* Only these capabilities are useful for the tests. */
>  	const cap_value_t caps[] = {
>  		/* clang-format off */
>  		CAP_AUDIT_CONTROL,
> @@ -44,9 +44,11 @@ static void _init_caps(struct __test_metadata *const _metadata, bool drop_all)
>  		CAP_MKNOD,
>  		CAP_NET_ADMIN,
>  		CAP_NET_BIND_SERVICE,
> +		CAP_SETPCAP,
>  		CAP_SETUID,
>  		CAP_SYS_ADMIN,
>  		CAP_SYS_CHROOT,
> +		CAP_SYS_RAWIO,
>  		/* clang-format on */
>  	};
>  	const unsigned int noroot = SECBIT_NOROOT | SECBIT_NOROOT_LOCKED;
> -- 
> 2.56.0
> 
