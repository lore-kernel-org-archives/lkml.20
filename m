Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847453BB104
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242602; cv=none; b=dxpc8oAt4QLBu22TrizF+7fqJsiprqlKEDQ3LUB2nrsNxJuzoeYcy+/S1p7PzoiQNzW/tMJegRAPprDDzt1eVuWVwH1p2SN/zu+92hDKaX/IFrU63jH1pdLjojpKuad7IfIatb8m07SfCPg6Yj3Yl6Qw1pzDTwUvtNAxX93vDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242602; c=relaxed/simple;
	bh=5shDkimFmqwNAu1FDh1H4nnvd4hF43xqOIcNDmP2xn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBM1zMzaZXC67gjrDOHiHRA9rW1qagmQTXwPOfXJtQOQVMlO2ik06kACPTS6izI2bNyK8smCObht3Xke64ZAFK36OqFxd51PQOZYLKpEAsKDYNOc3nzGK3+y+yUATptI7boOcRmRm24PLC/7dx1m8yTH+3ZrjyXNxmd4/fQhZPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1dCP9w6; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1dCP9w6"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04edb5so3220293c88.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790242599; x=1790847399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P+Uqaf3F/kOj+FRl3+deg6igqCD9HSk1elxNctF4Vb0=;
        b=J1dCP9w6/4Hs7nHV8kaoUePW7nc1FJj/sNq/XaFek2OXlK6KTxfwfRDEIDD334Uogv
         1DJKOxL4dmToAxx1703nPofPGOxyIlcPleUDfAKVUSfCs2GXjPkBZ1rHJrzxeYW8CiQE
         gpwP9T4ggF/uPAwKm1l990KvMUtqFT6/ivQyWI+bOswfTktLOvT3KwLNbjTiYxSTr6bv
         YD/vAqFxUQhLj2tWBKQb1cE1nn0AYaDDdG+KED619rkzSKbOkmc4AaHrd5oq8Wjyisd0
         TuE/ZBTWU6IajGwWIZteBsprEYvA7TUdS7KeQlyMYJ3BWz3EF92FVdB6WXrx0j5S9Ev6
         QZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242599; x=1790847399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+Uqaf3F/kOj+FRl3+deg6igqCD9HSk1elxNctF4Vb0=;
        b=sVVw6JDWZgw9TB514XxoZVppol03u93X1+TE91/69hNiAfONrW5G9qsApzUq3pF2Va
         na24YZKogBnAMdHE4u6aZWd2oPVOy+jbAbRCBt26rZ3SIlnSjBlJ4CHT6bBOGjP198gH
         kGC5oEc6A2XHpyRnwVlcGr02adSJn15DiRwxKR20vKxNL7oDLWHuhf3XNP3aym4M9sB+
         wfmvbLIQa4jGw7sFKY33VZ/hmciRHPQBpL6WRNqclEz1Lzf/e+CN5jY6MaLLMdzVGHuB
         /gLE/7zjw3qrZBz5nCTg2n5bRcRvGZRmbfzRCg1j9iK1WzXkss1yH8/9xe4b6SGz3QsT
         gRJQ==
X-Gm-Message-State: AFuF++lXh4IuiALcxSc1H4c3vDP86pOCpBNXtE3KCfGhTmt3bloC2AP7
	551lZJZz29Xf2yP5otHsZd5+KHtWCgd/9puqx2ded7zJ/+4JMxzRByDy
X-Gm-Gg: AYBFou0QHCOu17jRax7kv8bDO3GgjXkfYC/kO59mJ4LZ5us0ncsOarga6C3imJ32xKS
	dmgGKAbZ7FOinBbxROXFHfM10hWBgZWlimThsu+Xefomk0/YFpXzaHEgcWVwVSkfVZYooACC8fp
	yzf8DTxIval62Sqphft9tqS0SWFkHWsd/Vq0jkPRqnp4UN/Vprjzu71Ng/K8rm5mMSw82GBdvDU
	Ej2tmbJ5+6s/l1gAw7FmrejO78FLAkxITTCTvNHln2l1mgyaW9e9KchxGGR/b5BiCiARWVnwQ/A
	tE9ehJ8dS20s+ycpGHF9sqfLV/7QRTicnel7Xsd+/p4UiqslBiYY6dfXToXbnMgsYp19TtahxeH
	AoTVd2Dehxv4lzJr7Ey9+f2jpZjiEhc5+Al2nm9u0CE6drzcr0eTaniKGzBdEtpHYCMhhBi2sVL
	lSCE3QMxe2sVpnHBvia1UaK6WfFOwy3Y7nQP/kR74tWoERbfW3x1csbbtsSaXgbgoz3Bev1vbEr
	D5q/mrHXX/wfsiX+9yA3O0p0bGksco+fIR7mRpY5XcL
X-Received: by 2002:a05:693c:66d6:20b0:331:89d6:80e7 with SMTP id 5a478bee46e88-34004c897a8mr1482623eec.13.1790242599390;
        Thu, 24 Sep 2026 02:36:39 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9bea11b8sm13745859eec.7.2026.09.24.02.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:36:39 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:06:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sourabhjain@linux.ibm.com, adityag@linux.ibm.com, adri.vero.dev@gmail.com, 
	anushree.mathur@linux.vnet.ibm.com, chleroy@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com
Subject: Re: [PATCH v4] ppc/fadump: collect dump when CPU_STATE_DATA is less
 than reserved
Message-ID: <arTuiz2iOQkPdHwT@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260828094942.2439404-1-shivangu@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828094942.2439404-1-shivangu@linux.ibm.com>

On Fri, Aug 28, 2026 at 03:19:42PM +0530, Shivang Upadhyay wrote:
> During Fadump in Qemu VM, when maxcpus value is set to more than current
> cpus, following failure is observed.
> 
>     [    0.045806] [      T1] rtas fadump: Dump taken by platform is
>         incomplete (0)
> 
> This is because the CPU_STATE_DATA is allocated for maxcpus, while the
> data is only filled for current cpus. As per current implementation
> of Fadump, dumped_bytes and source_len for a region have to match,
> Which is failing for qemu's case, Even tough the dumped bytes are
> reported correctly for only the current cpus. After this /proc/vmcore
> generatition also fails.
> 
> Allowing dumped_bytes to be lesser than or equal to allocated length, for
> CPU_STATE_DATA Fadump region.
> 
> Reported-by: Anushree Mathur <anushree.mathur@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/all/5e66daf4-3f55-4044-94a5-4f50bb040849@linux.ibm.com/T/#u
> Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
> ---
> 
> Changelog:
> v4:
>     removed extra blank line.
> 
> v3: https://lore.kernel.org/all/20260827075803.2240934-1-shivangu@linux.ibm.com/
>     removed extra variable.
> 
> v2: https://lore.kernel.org/all/20260826125626.2108771-1-shivangu@linux.ibm.com/
>     Only allowing lesser size for CPU_STATE_DATE Fadump region.
> 
> v1: https://lore.kernel.org/qemu-devel/20260429065127.366813-1-shivangu@linux.ibm.com/
> 
> ---
>  arch/powerpc/platforms/pseries/rtas-fadump.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
> index 3bb4ac2ab6cc..838e97c24308 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.c
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
> @@ -459,6 +459,8 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>  	/* Check if the dump data is valid. */
>  	for (int i = 0; i < be16_to_cpu(fdm_active->header.dump_num_sections); i++) {
>  		int type = be16_to_cpu(fdm_active->rgn[i].source_data_type);
> +		uint64_t bytes_dumped = be64_to_cpu(fdm_active->rgn[i].bytes_dumped);
> +		uint64_t source_len = be64_to_cpu(fdm_active->rgn[i].source_len);
>  		int rc = 0;
>  
>  		switch (type) {
> @@ -469,10 +471,20 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>  				pr_err("Dump taken by platform is not valid (%d)\n", i);
>  				rc = -EINVAL;
>  			}
> -			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len) {
> +
> +			/*
> +			 * Make sure that dump is collected for entire region.
> +			 * CPU_STATE_DATA region is allowed to dump less than allocated space.
> +			 */
> +			if (!(bytes_dumped == source_len ||
> +			(type == RTAS_FADUMP_CPU_STATE_DATA && bytes_dumped <= source_len))) {
> +
Extra line here.
>  				pr_err("Dump taken by platform is incomplete (%d)\n", i);
> +				pr_debug("type -> %d, bytes_dumped -> %llx, source_len -> %llx\n",
> +					 type, bytes_dumped, source_len);
>  				rc = -EINVAL;
>  			}
Can bytes_dumped be greater than source_len? 
If yes then the error is misinformed that it's incomplete instead it's corrupted.
If No then shouldn't the internal check bytes_dumped <= source_len should handle it?

Regards,
Mukesh
> +
>  			if (rc) {
>  				pr_warn("Region type: %u src addr: 0x%llx dest addr: 0x%llx\n",
>  					be16_to_cpu(fdm_active->rgn[i].source_data_type),
> @@ -482,7 +494,7 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>  			}
>  			break;
>  		case RTAS_FADUMP_PARAM_AREA:
> -			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len ||
> +			if (bytes_dumped != source_len ||
>  			    fdm_active->rgn[i].error_flags != 0) {
>  				pr_warn("Failed to process additional parameters! Proceeding anyway..\n");
>  				fadump_conf->param_area = 0;
> -- 
> 2.54.0
> 
