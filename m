Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76713DFC6D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461108; cv=none; b=uqdxbZIHSHftAWuAHSrGeQh6XkSIRgAzeU8log7Yg+POQ4Aj56+kY96cKHLLZ5rvGNIW/eAtz3bD4TO2UNt2ycH/0R2hVh4YxavKR2U+0gZE5Vo1Sd/OGv61rHfi9+PoHkBnNjalTLtO+pg9fIFSuGqeWoAUQlknEl2w+pts5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461108; c=relaxed/simple;
	bh=Wj1rYYk5eAXwBvucNre4TjfpPQdXYZM0DWC4mH7g9mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLBXaKVPdwZiSemWbuiIFH5jhPRNO8BvVAUZI01tlci8PqcVYBEjRkuC6wk9jCx3Bd4JG1wI1Kc19BV7+R1N5e+BLFcwRNHriQdUDY8U/Amf4gGN4Y6rlzJbs/sSiG7FtiKLbqeQDG5bDXFzAicaV1LhiaP6PIfhNCLkBwW3Veg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VZpjbEeT; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VZpjbEeT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so371488166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789461104; x=1790065904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=srZnYOZh38wMRO1+hbACREA44r35OdzHMy0XMVlEyHw=;
        b=VZpjbEeTgtK41A7t4oW26nQjbyOW2cKW7HVAp/AE1DoBxv2I/oKGZNbaQodQKgyztX
         /mrpwRY87ciQ+PJfyQe1dSvxNbsB72CUkdK+QtjuK70i+nbGkR9W/XYJiElg9lfca++2
         qFVFkZPTH/JRJXbyxOE05UEq/r32xAoP2WnIV0Oli8eF9Eqfbnh/5SbFEtNDxMp9+Xry
         wUPo2NIAaR5WaoaHjUpAwZp9V9yi+6b7VV5nBJICkruMWpBKe1kbngntQiCIgoGwAnpY
         X6bNASsAfWseYcATthNENpViqF1ZvkSvgWmosl33E4dHZ93N4ieXJeMGMfZ+z1sKbil8
         dOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461104; x=1790065904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srZnYOZh38wMRO1+hbACREA44r35OdzHMy0XMVlEyHw=;
        b=Yl2b8TEYSC3AyzhcLnCgEGGM5k6kdcROZfkH86buqg70bA9yav9FVHRX+JOYSyau6l
         irVhI8YCoa4g/Z2B+RL5BlFrSQ7EJpYESJKoiJ9lmO7dGo7I4ASyUpomhQSpyi9LOjih
         2ywFDTPTv6VZctBHn8jLSVsojzdgUGQupslKqmFjwBcJDBEAJ90+IpOE5Ila+JIwaCtB
         Kjy4Bkt3fsmp7AG123SQBZEYObBh6esmS+0LrAGFHmUPoJyIWcWXkJruQdXoaQv6GLki
         ZDoBVjam1Qvbdfqp6KKGaOb8xq4yVeKUEuqTuEXZ316iob9o+EIjErDwrnrOnWchDjiy
         dRRQ==
X-Forwarded-Encrypted: i=1; AKwUvBySTcVAVqtOiaspxrlVJZZBpsf2xmbqQU9SZsYqA0/HeF+QQLnAfVa81egu7DIO251ffNJz6KhhqXOqswk=@vger.kernel.org
X-Gm-Message-State: AFuF++n/hLK1GtmercrQXBDGg8+5dMQJ9swm79/98g8l+Dr4LwZihCe1
	Dqvn75LMMdU6Dg9Md3KN70PheSIsz74TGRVHJ5NF1A3l4qGSE78ZUqyeJ4kPOFFSLM0=
X-Gm-Gg: AYBFou2r8hmh1ZZfRrafmdORbwA3dmdnzSCLkgUvHShLykXlRHfsxUMkyl77zzzlTyb
	kT7buxkf3dESZ+2fuoKfmQjuduHycxZPtRQXkO7PlDNiHM9B1YMtFFiMd3AnTafhk389+T9awKH
	ehrXUPjlI1aCJjf0WvCEFdXwD3IX5pj8abYPDvP7EQUHxYjnC/4P8lZcEgkU7o7HIpu9ZKKUI7k
	d1/3wKxo9BYng8FmxpRB8QJjADfPXGHG4Ucw0tHZg+IUt2CyNPqyeptxYcEtT9Dfr+FU3nnQYYO
	CPwnUs9Ds6eq/tfa7sXMx/JPM4IlSTmnwR//CFZeHWNe+5TGjZWJ7bedz8Av55BnBoIhvJ/t7Ax
	chEKP4SG/XsBOp+UA3+DHLrXa/mFzlWCuKt3nTbofqjyjh17MwD0Sa99d/4OsX5thOncg5Ytd3D
	MriffuVZml6Z/ra5kHSxvb+U0BljeLbwwbvDANW4HIWNGgQZzQYnr4Gy4JxMK+
X-Received: by 2002:a17:907:3f1a:b0:c21:601:6501 with SMTP id a640c23a62f3a-c29b86059e6mr437931366b.20.1789461103956;
        Tue, 15 Sep 2026 01:31:43 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613c3ebsm529983366b.57.2026.09.15.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:31:43 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:31:42 +0200
From: Michal Hocko <mhocko@suse.com>
To: Kyle Meyer <kyle.meyer@hpe.com>
Cc: akpm@linux-foundation.org, corbet@lwn.net, david@redhat.com,
	linmiaohe@huawei.com, shuah@kernel.org, tony.luck@intel.com,
	jane.chu@oracle.com, jiaqiyan@google.com, Liam.Howlett@oracle.com,
	bp@alien8.de, hannes@cmpxchg.org, jack@suse.cz,
	joel.granados@kernel.org, laoar.shao@gmail.com,
	lorenzo.stoakes@oracle.com, mclapinski@google.com,
	nao.horiguchi@gmail.com, osalvador@suse.de,
	rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
	shawn.fan@intel.com, surenb@google.com, vbabka@suse.cz,
	linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aqkCbgHmMGxI_GLG@tiehlicka>
References: <aqiIEkrc6aDBOqRg@hpe.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqiIEkrc6aDBOqRg@hpe.com>

On Mon 14-09-26 18:49:38, Kyle Meyer wrote:
> Soft offlining a HugeTLB page dissolves it, permanently reducing the
> HugeTLB page pool. This can be problematic for workloads that depend on
> a fixed number of HugeTLB pages.
> 
> Currently, soft offline must be disabled to prevent HugeTLB pages from
> being soft offlined.
> 
> This patch allows soft offline to be disabled for HugeTLB pages while
> remaining enabled for non-HugeTLB pages.
> 
> Commit 56374430c5dfc ("mm/memory-failure: userspace controls
> soft-offlining pages") introduced the following sysctl interface to
> control soft offline:
> 
> /proc/sys/vm/enable_soft_offline
> 
> The interface does not distinguish between page types:
> 
>     0 - Soft offline is disabled
>     1 - Soft offline is enabled
> 
> Convert enable_soft_offline to a bitmask and support disabling soft
> offline for HugeTLB pages:
> 
> Bits:
> 
>     0 - Enable soft offline
>     1 - Disable soft offline for HugeTLB pages
> 
> Supported values:
> 
>     0 - Soft offline is disabled
>     1 - Soft offline is enabled
>     3 - Soft offline is enabled (disabled for HugeTLB pages)
> 
> Existing behavior is preserved.
> 
> Update documentation and HugeTLB soft offline selftests.

This is adding a lot of user interfaces to control something you can
disable by config option for an admin only functionality.
I fail to to see any actual justification for all of that. If an admin
can disolve a hugetlb page it has power to allocate a new one as well.
Not to menation that the whole soft offlining is mostly a testing
feature so adding a lot of fine grained configuration space seems
excessive to me.

> Suggested-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Kyle Meyer <kyle.meyer@hpe.com>
> ---
> 
> Tony's patch:
> * https://lore.kernel.org/all/20250904155720.22149-1-tony.luck@intel.com
> 
> v1:
> * https://lore.kernel.org/all/aMGkAI3zKlVsO0S2@hpe.com
> 
> v1 -> v2:
> * Make the interface extensible, as suggested by David.
> * Preserve existing behavior, as suggested by Jiaqi and David.
> * https://lore.kernel.org/all/aMiu_Uku6Y5ZbuhM@hpe.com
> 
> v2 -> v3:
> * Minor documentation updates.
> * Use page_folio(page) instead of pfn_folio(pfn) for HugeTLB page check.
> 
> ---
>  .../ABI/testing/sysfs-memory-page-offline     |  3 +++
>  Documentation/admin-guide/sysctl/vm.rst       | 27 +++++++++++++++----
>  mm/memory-failure.c                           | 17 +++++++++---
>  .../selftests/mm/hugetlb-soft-offline.c       | 19 ++++++++++---
>  4 files changed, 54 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-memory-page-offline b/Documentation/ABI/testing/sysfs-memory-page-offline
> index 00f4e35f916f..19aa539fb910 100644
> --- a/Documentation/ABI/testing/sysfs-memory-page-offline
> +++ b/Documentation/ABI/testing/sysfs-memory-page-offline
> @@ -20,6 +20,9 @@ Description:
>  		number, or a error when the offlining failed.  Reading
>  		the file is not allowed.
>  
> +		Soft-offline can be controlled via sysctl:
> +		Documentation/admin-guide/sysctl/vm.rst
> +
>  What:		/sys/devices/system/memory/hard_offline_page
>  Date:		Sep 2009
>  KernelVersion:	2.6.33
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 5b318d17aa4b..ee1941e44643 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -309,16 +309,33 @@ physical memory) vs performance / capacity implications in transparent and
>  HugeTLB cases.
>  
>  For all architectures, enable_soft_offline controls whether to soft offline
> -memory pages.  When set to 1, kernel attempts to soft offline the pages
> -whenever it thinks needed.  When set to 0, kernel returns EOPNOTSUPP to
> -the request to soft offline the pages.  Its default value is 1.
> +memory pages.
>  
> -It is worth mentioning that after setting enable_soft_offline to 0, the
> +enable_soft_offline is a bitmask:
> +
> +Bits::
> +
> +	0 - Enable soft offline
> +	1 - Disable soft offline for HugeTLB pages
> +
> +Supported values::
> +
> +	0 - Soft offline is disabled
> +	1 - Soft offline is enabled
> +	3 - Soft offline is enabled (disabled for HugeTLB pages)
> +
> +The default value is 1.
> +
> +If soft offline is disabled for the requested page type, EOPNOTSUPP is returned.
> +
> +It is worth mentioning that after disabling soft offline, the
>  following requests to soft offline pages will not be performed:
>  
> +- Request to soft offline pages from sysfs.
> +
>  - Request to soft offline pages from RAS Correctable Errors Collector.
>  
> -- On ARM, the request to soft offline pages from GHES driver.
> +- Request to soft offline pages from GHES driver.
>  
>  - On PARISC, the request to soft offline pages from Page Deallocation Table.
>  
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index a8b03e2920ba..6c4ce39f46df 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -69,11 +69,14 @@
>  #include "page_alloc.h"
>  #include "internal.h"
>  
> +#define SOFT_OFFLINE_ENABLED		BIT(0)
> +#define SOFT_OFFLINE_SKIP_HUGETLB	BIT(1)
> +
>  static int sysctl_memory_failure_early_kill __read_mostly;
>  
>  static int sysctl_memory_failure_recovery __read_mostly = 1;
>  
> -static int sysctl_enable_soft_offline __read_mostly = 1;
> +static int sysctl_enable_soft_offline __read_mostly = SOFT_OFFLINE_ENABLED;
>  
>  static int sysctl_panic_on_unrecoverable_mf __read_mostly;
>  
> @@ -157,7 +160,7 @@ static const struct ctl_table memory_failure_table[] = {
>  		.mode		= 0644,
>  		.proc_handler	= proc_dointvec_minmax,
>  		.extra1		= SYSCTL_ZERO,
> -		.extra2		= SYSCTL_ONE,
> +		.extra2		= SYSCTL_THREE,
>  	},
>  	{
>  		.procname	= "panic_on_unrecoverable_memory_failure",
> @@ -2982,12 +2985,20 @@ int soft_offline_page(unsigned long pfn, int flags)
>  		return -EIO;
>  	}
>  
> -	if (!sysctl_enable_soft_offline) {
> +	if (!(sysctl_enable_soft_offline & SOFT_OFFLINE_ENABLED)) {
>  		pr_info_once("disabled by /proc/sys/vm/enable_soft_offline\n");
>  		put_ref_page(pfn, flags);
>  		return -EOPNOTSUPP;
>  	}
>  
> +	if (sysctl_enable_soft_offline & SOFT_OFFLINE_SKIP_HUGETLB) {
> +		if (folio_test_hugetlb(page_folio(page))) {
> +			pr_info_once("disabled for HugeTLB pages by /proc/sys/vm/enable_soft_offline\n");
> +			put_ref_page(pfn, flags);
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
>  	mutex_lock(&mf_mutex);
>  
>  	if (PageHWPoison(page)) {
> diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> index bc202e4ed2bd..9837c315a81e 100644
> --- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
> +++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> @@ -5,6 +5,8 @@
>   *   offlining failed with EOPNOTSUPP.
>   * - if enable_soft_offline = 1, a hugepage should be dissolved and
>   *   nr_hugepages/free_hugepages should be reduced by 1.
> + * - if enable_soft_offline = 3, HugeTLB pages should stay intact and soft
> + *   offlining failed with EOPNOTSUPP.
>   *
>   * The test allocates 8 default hugepages
>   */
> @@ -31,6 +33,9 @@
>  
>  #define EPREFIX " !!! "
>  
> +#define SOFT_OFFLINE_ENABLED		(1 << 0)
> +#define SOFT_OFFLINE_SKIP_HUGETLB	(1 << 1)
> +
>  static int do_soft_offline(int fd, size_t len, int expect_errno)
>  {
>  	char *filemap = NULL;
> @@ -55,6 +60,7 @@ static int do_soft_offline(int fd, size_t len, int expect_errno)
>  	ksft_print_msg("Allocated %#lx bytes of hugetlb pages\n", len);
>  
>  	hwp_addr = filemap + len / 2;
> +	errno = 0;
>  	ret = madvise(hwp_addr, pagesize, MADV_SOFT_OFFLINE);
>  	ksft_print_msg("MADV_SOFT_OFFLINE %p ret=%d, errno=%d\n",
>  		       hwp_addr, ret, errno);
> @@ -82,7 +88,7 @@ static int set_enable_soft_offline(int value)
>  	char cmd[256] = {0};
>  	FILE *cmdfile = NULL;
>  
> -	if (value != 0 && value != 1)
> +	if (value < 0 || value > 3)
>  		return -EINVAL;
>  
>  	sprintf(cmd, "echo %d > /proc/sys/vm/enable_soft_offline", value);
> @@ -128,13 +134,17 @@ static int create_hugetlbfs_file(struct statfs *file_stat)
>  static void test_soft_offline_common(int enable_soft_offline)
>  {
>  	int fd;
> -	int expect_errno = enable_soft_offline ? 0 : EOPNOTSUPP;
> +	int expect_errno = 0;
>  	struct statfs file_stat;
>  	unsigned long hugepagesize_kb = 0;
>  	unsigned long nr_hugepages_before = 0;
>  	unsigned long nr_hugepages_after = 0;
>  	int ret;
>  
> +	if (!(enable_soft_offline & SOFT_OFFLINE_ENABLED) ||
> +	    (enable_soft_offline & SOFT_OFFLINE_SKIP_HUGETLB))
> +		expect_errno = EOPNOTSUPP;
> +
>  	ksft_print_msg("Test soft-offline when enabled_soft_offline=%d\n",
>  		       enable_soft_offline);
>  
> @@ -165,7 +175,7 @@ static void test_soft_offline_common(int enable_soft_offline)
>  	// No need for the hugetlbfs file from now on.
>  	close(fd);
>  
> -	if (enable_soft_offline) {
> +	if (expect_errno == 0) {
>  		if (nr_hugepages_before != nr_hugepages_after + 1) {
>  			ksft_test_result_fail("MADV_SOFT_OFFLINE should reduced 1 hugepage\n");
>  			return;
> @@ -190,8 +200,9 @@ int main(int argc, char **argv)
>  	if (!hugetlb_setup_default(8))
>  		ksft_exit_skip("not enough hugetlb pages\n");
>  
> -	ksft_set_plan(2);
> +	ksft_set_plan(3);
>  
> +	test_soft_offline_common(3);
>  	test_soft_offline_common(1);
>  	test_soft_offline_common(0);
>  
> -- 
> 2.51.0

-- 
Michal Hocko
SUSE Labs
