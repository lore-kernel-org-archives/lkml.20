Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.76.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274606;
	b=ixG6/B0ptAebgG4F/CPFaFJmRMJnC7InxbwEroW+JOqRRbv6csazeZtoARAnzcDS51Jj
	 7tPbPqAdaxZfj8K5oH9Xo0kyPgI7CfRrnSG61/Qh3GUIpnw427N/+a3FeQdWPBronplHk
	 nmz7StQUo85uncKDStD2kZSW+D3I91cQWyWwKcvyxE4ADy1CmedVrGaqWH5tI9W9PBF2r
	 5D2x6z3/CoQ2rPRl42StYKLfuEygxhMnUb57aPOQsVaEIr9mh0LGu+g+ICF0SWSgCA6UB
	 5Feb8Kb8ShWcsB0whSuLAuBN6ggS+ccx5CRaBlUBdmifiyCeEVbVbkafPUuzwoKi8CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274606;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=esP+aCur7aC+bn4DQQmlc7Eja+p6VJStM4oaiFkIJ5c=;
	b=dadOkeKCMTdSc7Do6wQUSk0tpj2wuy12cXCbObEXb152aYkTT+VkJKRjjJfYJkWmVgG0
	 F+qDZ1lx0i30n5mEhqtgiSU/4U+RojDZavh/KSzzExeOwiS3BzCCTDDfgTFx9mLoLT7aU
	 SQ4bRWz3ZFPaGTWUulNzDcSibvqwrzETNpk91UerZ4w0pP4owdQbHvOQql6BdAJHPK6st
	 LMXiMobg6gCbMNJE6ui/yljZbd/L7rR5TV/iDcVApW8eOmADLnJlwg3YMw7E+fyD6HTTV
	 ca7IQnwRKuu9usitURfSMbcf0hnTosjtPqtrda9mSbCdP/iwZl2c4HpVobz8VgYpMcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=I6zvAdga;
	arc=none smtp.remote-ip=57.103.76.159
Received: from outbound.st.icloud.com (st-2006g-snip4-8.eps.apple.com [57.103.76.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D424A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D424A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=I6zvAdga
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-0 (Postfix) with ESMTPS id 4FDD41800357;
	Thu, 29 Oct 2026 11:50:00 +0000 (UTC)
X-ICL-RepId: 01a1877e-db31-77b0-a225-c02142165f2a
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQ1LHVwEWRxBDUkdXwJLVxQEGlUKQgRyGVoUXBhTRVEfVFhVCQoCURxWDVdDVARfUEsbDlwFS1oVVRcOAkIfUB9MFldDRB8cGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKAlEcVg1XQ1QEX1BUEVdQCwpHPUBMehlZBgFbdA56JHYrXhlUGR4JUg1TBVUMDU1DEkIVBBFQAVgeVg==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793274604; x=1824810604; bh=esP+aCur7aC+bn4DQQmlc7Eja+p6VJStM4oaiFkIJ5c=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=I6zvAdgaLoLh8BRu1uwbsiRPuV+1G8DDBt/wmXGiWtIOqbmDYh4dzpCTxCarRFtGn4mz8eWIgW5fQ4Sbqz64mhPOfRruE/oyKjTxOlDdLt+Leao0+cu8Df3EmkiQ6JbPvnBnG7Oq/1xU6od8rqT80ifFEP+wBVUXo2ReLPDwRSvGTR7Uef8K4Mig9P3br+hP331DLJ0jfMlHHAPXxWoUdlrausU3p4wXna5KI7BqUITqlDMhhj0jqfoDujkaWWsxarBUjH4JN+YRfqDNaLYuiG7mTaetOzVv+pz2fYu7VPKFRKg3Xn3tml8t2OaomKKrtugxC89iYrMRje1QDsi7ag==
mail-alias-created-date: 1772519804199
Received: from lima-default (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-0 (Postfix) with ESMTPSA id CB4991800174;
	Thu, 29 Oct 2026 11:49:56 +0000 (UTC)
Date: Thu, 29 Oct 2026 19:49:52 +0800
From: Bingfang Guo <bfguo@icloud.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: akpm@linux-foundation.org, shakeel.butt@linux.dev, hannes@cmpxchg.org,
	muchun.song@linux.dev, harry@kernel.org, qi.zheng@linux.dev,
	tz2294@columbia.edu, bingfangguo@tencent.com, kasong@tencent.com,
	linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: Re: [Internet][PATCH] memcg: fix integer overflow in
 calculate_high_delay() bypassing memory.high throttle
Message-ID: <auMy4Itnm3+MvIIA@lima-default>
References: <20261029073857.974-1-zhangjiao2@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029073857.974-1-zhangjiao2@cmss.chinamobile.com>
X-Proofpoint-GUID: nsSToudS2x-zNeNTOYl6PSmYcQPos_TL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NiBTYWx0ZWRfXwAF+S/oY4m3y
 XhehXXi+hG/q87J30eYApi2M5idVglMC1m7aOK4z0O4RpTekQ7KRHE5JhxtvRukoJ5A1P+g6x02
 3J+TvIn7eH/HGaLDfPeMC9EO4zoEE3oVEkiDhDWkYGEoWFuzL9cDcojiK0lYPMVyuX5hYMlswB5
 LXVSLAEOkeY7Iqczf7e8BRRe7Zf7Y4uS5ML1r27x0Lk/iDX8BEX79Cs/3tzoTwMejb3tkER0wZw
 0+cc+PWpq3clbx5EjhwNSW4M19wn00GdkgA5EI3Tl7FNawKy7xtnq5Rfx96l5Q5TrqMdXYyJzJn
 Gf28K4Eu1KVEMjKPkJMV+Dh4Sme2UwUkKZQy5lAiCdITPjtyu/ph6KitTbarac=
X-Authority-Info-Out: v=2.4 cv=brZBxUai c=1 sm=1 tr=0 ts=6ae332ea
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=vu5NlEYW-o8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=R5C9hjxsAAAA:8 a=HrZKfREGD0E1xrT_G6IA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: nsSToudS2x-zNeNTOYl6PSmYcQPos_TL
X-JNJ: AAAAAAABeVx/Ku6PFK7c6Wv+s1bcdeBA6HBzUeX4f54LCUZHy4Ebo8EVbGblFf2sKwu5me
 H5wAN9Jk5ZjlMdGi75MH+fSkSUz0OVTcKCWKb/Z2apUtBEJec98TnWiJnHwKFPS4wrGrpX
 FksnkKwmj0LYaleFSrZcEym0n+Iq+Fzgjc2QTBZHr18Jbaw33o3mj28Obs5blEO+iI31VM
 N5H4GnyyZf3izsz0sDpwGPKf1B/R1cktFXnoXopR1eWUjP6zUMo6rJY4OVs8AArCjbFQRP
 pFeBiTQ20Ggf8osdSP0NrB2Q5EFY3R82h4gwHu9kbiw3hUEdzdx0zY6dnjt4pXQ/KnSknq
 J6Nred5BuClF2jwwPmhiReFgk40Y43VnSZgDq7hTeT/2w7fKYxHjEHDEWNT+ttY9UdNg7g
 JlhKWvAZMsynCXLkmlViPrUme73XF+ZQE8dXIlHM/pTytgxk4PgsUJo24Cgml04vVEzgpq
 StvD1cX19e/k0jyZ7ZlHMZojGCkjtOIaOH6uOYqz9GZ+3QF8ofqdkJXY6PzJ+vEFZBgBcT
 7j8su57s6wPEc78lxpJQRaqiiHuJ1PDTT+nhOEkUxWv7Ir3FCKgctRY/BbJErJ/rZxbcxf
 VPAayCdm796nfYGTR/PEQCZw9RDtu9dE0rGbD8dMyl70k5BGaKczXcQAwKpxEBe1qzaeS8
 ePB9WBhGyB/5xhbt8ufAPqQ2Qo3zrAlQaIkQwQEF5U+cEj5ziNPF130A44gqnX63Dcxewz
 LIRdT+L7SmZ1ScbT/VvRQKXYr5gEuFx+g/wSBgE+YfvT8rk4LkcwGTIcl5u2TjKIVNCx/N
 E1s3nVNo0BkrFmxD6t2rOPyDgCSg5NCJ2D6VC4xhJ5EIBLLC4XDlHqyAJ0Hp4JTFhhbXcr
 Iqoke+OHL6b1PQ8lN033DkjAzyvsg39qkhvjI0atJ+vqVoUiCPXWR5PBmp1GkLolnosy0i
 JfNwUSl2XMqkuneElPkc904zR4/BQSBV/5iATUGe3yLXKAKHEB2bEJD5E3v2XZpWF/8EhK
 gPtVZlgPh1jxfjMjFxbIuN1sn6IbWS4pyCUQ6h/xh1J5asEr1ahG5ltG846IcXTsrSd6Z+
 bNEvJgAWVc2tsJ70Zqk9EMqKB5C5UyuGgPj7gsvugMlt1/Nxcx3e5ZL6ZD71FnZ/GITyii
 ZnbenDb0JtfVotWjAWwNHbRtazBI58ju/LI1vJeSA1WHCVvMeetMuQRN3aj4EJ3fWRpMyE
 vuxu7zE8Wgrc5+8dwvvEBYfCtSufvoFp/OBvvPJyh9MjAMxOiy9p8uH8wgtr8MuvTo9i6t
 wVIRdweYkaPz1Hm7HANebqlMX1go5nocIH00BmBxD+bBzSwAALAxRwzy4fm3LYf/hWlJsL
 vi/089E4jeAHYoryzlitmzSwf21VrYqtpyXeRCpbLXcsL4VUT/cPF1E=

On Thu, Oct 29, 2026 at 03:38:56PM +0800, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> calculate_high_delay() computes the throttling penalty as:
> 
>   penalty_jiffies = max_overage * max_overage * HZ;
> 
> where max_overage is a u64 derived from the usage/high ratio shifted
> left by MEMCG_DELAY_PRECISION_SHIFT (20).  When a cgroup exceeds its
> memory.high by a large factor (>= ~4096x), max_overage reaches 2^32
> and the squared multiplication overflows u64, wrapping to a small or
> zero value.  A zero penalty passes the 'penalty_jiffies <= HZ / 100'
> early-exit in __mem_cgroup_handle_over_high(), so the cgroup is never
> throttled despite being massively over limit.
> 
> This is exploitable for denial of service: set memory.high to a small
> value (e.g. 1 MB) and allocate several gigabytes; the overflow causes
> the throttling sleep to be skipped entirely.

Hi!

> 
> Additionally, on 32-bit kernels the 'unsigned long penalty_jiffies'
> intermediate truncates the u64 product before the right-shifts, which
> can also zero the result.
> 
> Fix both issues by:
> 
>   1. Capping max_overage at (1 << 20) before squaring.  Any overage
>      this large already produces a penalty far above
>      MEMCG_MAX_HIGH_DELAY_JIFFIES, which the caller clamps anyway, so
>      the cap is lossless.
> 
>   2. Using a u64 intermediate for penalty_jiffies so the right-shifts
>      operate on the full 64-bit value on all architectures.
> 
> The post-fix worst-case intermediate is (1<<20)^2 * HZ = 2^40 * HZ,
> which is ~2^50 for HZ=1000 and well within u64 range.
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
>  mm/memcontrol.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 84f4a8fd4d16..c0ab3940025c 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2576,7 +2576,7 @@ static u64 swap_find_max_overage(struct mem_cgroup *memcg)
>  static unsigned long calculate_high_delay(unsigned int nr_pages,
>  					  u64 max_overage)
>  {
> -	unsigned long penalty_jiffies;
> +	u64 penalty_jiffies;

The return value is:

    return penalty_jiffies * nr_pages / MEMCG_CHARGE_BATCH;

And the type is still unsigned long, which can still truncate the return value
when nr_pages is quite large on 32-bit systems theoretically. So maybe you can
clamp it again:

    return min(..., MEMCG_MAX_HIGH_DELAY_JIFFIES);

Other than that, the patch looks good to me.

>  
>  	if (!max_overage)
>  		return 0;
> @@ -2588,7 +2588,16 @@ static unsigned long calculate_high_delay(unsigned int nr_pages,
>  	 * memcg in question makes it clear that it has no intention of stopping
>  	 * its crazy behaviour, so we exponentially increase the delay based on
>  	 * overage amount.
> +	 *
> +	 * Cap max_overage before squaring to prevent integer overflow that
> +	 * could otherwise wrap the penalty to zero and bypass throttling.
> +	 * Use a u64 intermediate so the right-shifts are not truncated on
> +	 * 32-bit kernels.  Any overage large enough to hit the cap already
> +	 * produces a penalty well above MEMCG_MAX_HIGH_DELAY_JIFFIES, which
> +	 * the caller enforces regardless, so capping is lossless.
>  	 */
> +	max_overage = min_t(u64, max_overage, 1ULL << 20);
> +
>  	penalty_jiffies = max_overage * max_overage * HZ;
>  	penalty_jiffies >>= MEMCG_DELAY_PRECISION_SHIFT;
>  	penalty_jiffies >>= MEMCG_DELAY_SCALING_SHIFT;
> -- 
> 2.50.1.windows.1
> 
> 
> 
> 

--
Regards,
Bingfang

