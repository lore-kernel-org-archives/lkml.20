Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606782;
	b=GqLu4IwiZC3rCQYWOFh+WD5oG5Wk/ZDFkt7lAn1KCiwzwaO2zR44tKmDkznoLH18yWAi
	 VZFvCubSiiwMh9HGrEkhDa3u9gY6EeSSrXwsCpUWP2RBc2ILsAyw7gRI46t+y8xR9F16F
	 CfMGFdUetjnNfEYlEB3SQnO/Soh0Huhxpd6PbEkSANsq1/WqdSxrxGq0ABFwSgWUxj4PZ
	 qtS0s7kBdTZE9iaZsrvA942wjAvGqQzy/5szrvEfe5VM3eZGRXXmhS61MQlf/PW3rG1wl
	 Agz4eCWhaezZgGpGctAG01/MrbV1Elga15SVsvvK84Al9VlkrkjzlJG7dGXI8ISCSkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606782;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=3W3TAv5mlLGmt+S/IiDcQ60iLuZSAozGBLKJ471FeoA=;
	b=GhZNJ+Z0zuNkjcPzFVbU+3qHQ3VJpKJ0lQVrQfyVbiRURuAt0lE1r5gSHx/Hr3Fz3fCM
	 mdG++UsbZc7Oc5SY759VvzCiq5aDAS+27U7Iv2FPSyXkbBiiuvSN3zUSTqH3AtRMkEvQi
	 XubJ57LRTBSW1tjObRkxk1Gz1X51xuPdUBoHve+4c8R+ZYj0+CNdVDBA7zW4d93Di3raC
	 5kUhH6XsgMdUAx3gsbdDFFPHBZC2rg7UVijk4xqBEg8OAaOUJlzpHwfITnS/g3HBupOyt
	 uz0pCzPaLVySeYYf8xaquLQr/iPmP5BapSoSvHVeUUakP2oxMLxr5dMJvINgo847uRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CvYQXUTo;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26A606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C26A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CvYQXUTo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792606781; x=1824142781;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=r36fElnR3mjX7Kg14lnPrCVioK4/QtOt1f3e2xOjAbM=;
  b=CvYQXUToJXtgxQFO+f8LuhZT5KvV3sULRCQ3rrc0cMb6ZAANKXGp5YIs
   /8U72D4ky45MBCRjnWmfmAI1p+yFCWtcCV25Z1TYaxgGwhxyzqn4fmOCM
   tP6HY4yjav/cXmahTZVp/+PQxCEyG52dZmXtgsdiFLeuBNFvGaRIe6whN
   IaNJuvzfMPRW63tb5hNvFYmfB7Y0Dw/9fvxfLWI3vnCEutzyHRGDqngSQ
   0IEHgofNJPLWNItTd5L97didZAsRIExhq98iQyL9BHTAQB97rqUuVYQQr
   Jvkp+GT+fHT9L+C/HHf0DS+zADeC5lKekO8UcrkQUh03Dce0ZiCpv/m7T
   Q==;
X-CSE-ConnectionGUID: VuX06dPxSEamP8YuHvHxCQ==
X-CSE-MsgGUID: coCLLQP8Qdm6pBR7KlA4sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1437823"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1437823"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 11:19:41 -0700
X-CSE-ConnectionGUID: CoaMFqkTT+eGwAP2LAykcg==
X-CSE-MsgGUID: mhtzZ5w9RA2iET5yesq9iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3225578"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 11:19:39 -0700
Message-ID: <94773ec2c845d88b291df265935342eb1a3c9f7e.camel@linux.intel.com>
Subject: Re: [PATCH v2] sched/topology: Balance cluster static-key updates
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Hui Su <sh_def@163.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra	
 <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	 <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt	
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman	
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak	 <kprateek.nayak@amd.com>, Barry Song <baohua@kernel.org>, Chen Yu	
 <yu.c.chen@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-kernel@vger.kernel.org
Date: Wed, 21 Oct 2026 11:19:39 -0700
In-Reply-To: <20261021043834.1140951-1-sh_def@163.com>
References: <20261021043834.1140951-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-10-21 at 13:38 +0900, Hui Su wrote:
> build_sched_domains() increments sched_cluster_active once per newly
> built partition that contains an SD_CLUSTER domain.
> detach_destroy_domains() instead tested the global static key before
> decrementing it, so destroying a cluster-less partition could drop a
> reference owned by another partition and disable cluster-aware
> scheduling while SD_CLUSTER domains remained installed.
>=20
> Check the installed domains before detaching them, only while the key is
> enabled, and decrement only when the removed partition contains an
> SD_CLUSTER domain.
>=20
> With two cluster-bearing partitions installed, removing a singleton
> partition left the baseline count at 1 where 2 partitions still
> carried SD_CLUSTER; the fixed kernel correctly reports 2.  On an
> asymmetric cluster topology where the parent partition gains no
> cluster domain, the baseline count drops to 0 while a cluster
> partition remains installed; the fixed kernel keeps it at 1.

Good catch, the inc/dec are indeed unbalanced.

>=20
> Fixes: 8881e1639f1f ("sched/fair: Scan cluster before scanning LLC in wak=
e-up path")
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>=20
> Changes in v2:
> - Guard the SD_CLUSTER domain scan with sched_cluster_active to avoid an
>   unnecessary loop on systems without cluster domains. (K Prateek Nayak)
>=20
> v1: https://lore.kernel.org/r/20261021034314.864713-1-sh_def@163.com
>=20
>  kernel/sched/topology.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 3dab0253976fb..21e3ab1af4c85 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -3314,13 +3314,25 @@ int __init sched_init_domains(const struct cpumas=
k *cpu_map)
>  static void detach_destroy_domains(const struct cpumask *cpu_map)
>  {
>  	unsigned int cpu =3D cpumask_any(cpu_map);
> +	bool has_cluster =3D false;
>  	int i;
> =20
>  	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
>  		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
> =20
> -	if (static_branch_unlikely(&sched_cluster_active))
> -		static_branch_dec_cpuslocked(&sched_cluster_active);
> +	if (static_branch_unlikely(&sched_cluster_active)) {
> +		rcu_read_lock();
> +		for_each_cpu(i, cpu_map) {
> +			if (lowest_flag_domain(i, SD_CLUSTER)) {
> +				has_cluster =3D true;
> +				break;
> +			}
> +		}
> +		rcu_read_unlock();
> +
> +		if (has_cluster)
> +			static_branch_dec_cpuslocked(&sched_cluster_active);
> +	}
> =20

We should be able to combine with rcu_read_lock/unlock() and cpu_map walk
for cpu_attach_domain(NULL, &def_root_domain, i) below.
So we do the rcu and cpu_map walk operation once in this function
instead of doing it twice.  Something like this?

        unsigned int cpu =3D cpumask_any(cpu_map);
        bool has_cluster =3D false;         =20
        int i;

        if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
                static_branch_dec_cpuslocked(&sched_asym_cpucapacity);

        rcu_read_lock();                  =20
        for_each_cpu(i, cpu_map) {        =20
                if (static_branch_unlikely(&sched_cluster_active) &&
                    lowest_flag_domain(i, SD_CLUSTER))
                        has_cluster =3D true;

                cpu_attach_domain(NULL, &def_root_domain, i);
        }
        rcu_read_unlock();

        if (has_cluster)
                static_branch_dec_cpuslocked(&sched_cluster_active);

Moving the dec after the detach loop should be safe. It only say
that a cluster domain exists, and cluster code that will still test
for actual SD_CLUSTER domain flag on the relevant domain.

I will also suggest that this fix be backported to the stable kernels
(cc stable@vger.kernel.org).

Thanks.

Tim

>  	rcu_read_lock();
>  	for_each_cpu(i, cpu_map)
