Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAA3BC68A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478212; cv=none; b=QocFkqmKs4+TWbpChnubJMOzp1SLmYG39DdEBVwCQ4JS65EFKd5tre0WyBLn+7Tf7oUN+iqUm+HPlIUY8KrbuOeBcdhW5/llcy7Bg59fIksl+yt6RylzRHBzeGt1k9F3HbmQR9xZLVMP1Y9QQIJnfxIQVlbht6zYul3YnTZqSKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478212; c=relaxed/simple;
	bh=TDbi+eQSPxQfInviqjdEtMTEnkh143SASpRMRYO3etw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOpCL8bixnlg9niVTERtxN+VurQFfioazDGVhsW6HlglTxuZxcAKENwMkAJWx1+gsAIbf2CdcyqBZCn+9WUqtONokJSM0Y+kIf90yapKjGwEZvQsIugEf+tD1dU2W81lNETSoRs4Wm07+6mDbYcu8M07vLOgMju6/AN19Z2ehZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sBIfyQ6m; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sBIfyQ6m"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso75e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789478176; x=1790082976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGOEMpPqgl5W4XQHaGU7nBryE/T/6438wA69yzqvb0w=;
        b=sBIfyQ6mQk0F6uavRUJJODWSsLepL7yhBB6gkaUChm7jAb9F542zYPO4SGCB0nn6bM
         FqAz7WFIvkODqDAKhl9yJXcBS2btudT87LWbnk7aBYmN4DUyovCil9qsquVs8bP4D+6H
         rVfIdLy419xcWLUUun+6M+iFKnA4JnrAjj92zJbtO2VeiRXOXGrcXxrNJSrOEerPTMMJ
         FyLogj4z2UVkW8a9Iovk+qBP6kdft44HtSSQJTRwl0F+26ue2DnsSbU+yUECOyA/o15A
         UUnGmPih8uE28HuPvw0uNd8er0SoUhytGaPQET7t3hehVrgF6ufDLyyva7nDsV8Gpjji
         paLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478176; x=1790082976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGOEMpPqgl5W4XQHaGU7nBryE/T/6438wA69yzqvb0w=;
        b=tHt6OvpV17adFw3UeSzx72hGZJtB8IvitgNVkMiwXAoZoMbxE9YFMr3S1JTmo8ENN1
         +pTrxLSDklKIc6+QzK5K9SnGp8aWKOAjKyMClA9fAsL6btBOF4xA+l0NW9h5CdhuxpZ6
         rocDBNleulRXPcARwoH6GvxyfKl54ZgwP7Nx98n0bq6HkBwe2zNaPdmc9wVApXENbPZ0
         BndVDtEMmXKlh7B2VnV/Zj1h1457R7ziqN8bDgcPEK/iVjcWCqQdPStvm/6tnOvA0neV
         vjTm2G22OiyI0MuTrVH6Q0xycneoaOLJ8ZARKLXMaNLVObnQLDQdwgJNzehI7ihsM5pG
         qmQg==
X-Gm-Message-State: AFuF++kln3uWbRQfgJsqRcIgO+3V49wNt3df7ZfFt+4BNk4amXrUVXC8
	tToezVxegb9mQFk682N8EU12RVjyXLNtP0bmS1lDOsmyz2oHaBa3qNktHXJsnQ6HPHgwUvvROL+
	2I5TF+g==
X-Gm-Gg: AYBFou0fDrL0D6kkUmAxmW5EaKYFuPUe74O37zPy11i13jbjcPvqnaJnh1IRkhwCp+6
	zuTKk/KfVfhKRJ2VhoXRsgmy26YE4tOXv53/NkZTagTbRKJCEg15Tck3j5N95WmzgdNDatQlz/C
	lLYTGT1gwE6RQRlinbuBXiSYrYswTCWEV/A6/uhI5ffdUFYFmLk5TzL28vtG75lnuHaRf3SoQGS
	YD3UtcKrQui4VOe1guQMDN0XBGEdEmnddRMonpKEgve/nRSgH8mwc+ECzBGonzUtNBWWUD3yF8v
	tq3OiKchMT3vB/kUoGmSpCU5rbuzMzcgmJK7Ef7fYuCDrQWiy1IoKhyjaChuIBRpsuPi/UYJl6R
	/hVg2q3sGZGgyiPKyXICSb0zBrbF2Sbb/wLsTfGi6gTegeT4U28vtLilVouuR2JtMclTavZblhV
	OeVv0AEcoj23dPb16dyzWKpsGO4bQbIpuOVnupHgRSyJ4qZQA4tYSyzHGVDfTKg3YjU3waiVUdv
	qWtrob3iqXcDQ5VWB8vdt4SORnS+fst1jFraZu0
X-Received: by 2002:a7b:cb4a:0:b0:499:fa56:f542 with SMTP id 5b1f17b1804b1-49e7dc07dc3mr695835e9.8.1789478175834;
        Tue, 15 Sep 2026 06:16:15 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e74esm34322499f8f.25.2026.09.15.06.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:16:14 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:16:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] Revert "interconnect: qcom: x1e80100: enable QoS
 configuration"
Message-ID: <aqlFGhBOF9UYK-bc@google.com>
References: <20260915123703.3228329-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915123703.3228329-1-maz@kernel.org>

On Tue, Sep 15, 2026 at 01:37:03PM +0100, Marc Zyngier wrote:
> This reverts commit 5a8b2cc36e796d595c9d97eab23c2be22805cc1c.
> 
> Since the introduction of this QoS change, X1 machines based on the
> Purwa SoC (such as the Lenovo Mini X) take a hard reset at boot time.
> 
> Other machines based on Hamoa (such as the X1E001DE Snapdragon Devkit)
> end-up with a similar hard reset while under load, most likely due to
> the PCIe ports being starved of traffic.
> 
> Revert the whole thing until someone figures out what magic parameters
> allow QoS to work in a sensible manner, as a usable machine is somehow
> preferable to one that crashes efficiently.
> 
> Link: https://lore.kernel.org/all/apgeBNSiP01YfNcs@google.com
> Link: https://lore.kernel.org/all/86ld9d4h4n.wl-maz@kernel.org
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mostafa Saleh <smostafa@google.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> ---
>  drivers/interconnect/qcom/x1e80100.c | 485 ---------------------------
>  1 file changed, 485 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/x1e80100.c b/drivers/interconnect/qcom/x1e80100.c
> index 8075e0ff20597..2ba2823c7860e 100644
> --- a/drivers/interconnect/qcom/x1e80100.c
> +++ b/drivers/interconnect/qcom/x1e80100.c
> @@ -173,13 +173,6 @@ static struct qcom_icc_node qhm_qspi = {
>  	.name = "qhm_qspi",
>  	.channels = 1,
>  	.buswidth = 4,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xb000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a1noc_snoc },
>  };
> @@ -188,13 +181,6 @@ static struct qcom_icc_node qhm_qup1 = {
>  	.name = "qhm_qup1",
>  	.channels = 1,
>  	.buswidth = 4,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xc000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a1noc_snoc },
>  };
> @@ -203,13 +189,6 @@ static struct qcom_icc_node xm_sdc4 = {
>  	.name = "xm_sdc4",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xd000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a1noc_snoc },
>  };
> @@ -218,13 +197,6 @@ static struct qcom_icc_node xm_ufs_mem = {
>  	.name = "xm_ufs_mem",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xe000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a1noc_snoc },
>  };
> @@ -233,13 +205,6 @@ static struct qcom_icc_node qhm_qup0 = {
>  	.name = "qhm_qup0",
>  	.channels = 1,
>  	.buswidth = 4,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x16000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a2noc_snoc },
>  };
> @@ -248,13 +213,6 @@ static struct qcom_icc_node qhm_qup2 = {
>  	.name = "qhm_qup2",
>  	.channels = 1,
>  	.buswidth = 4,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x11000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a2noc_snoc },
>  };
> @@ -263,13 +221,6 @@ static struct qcom_icc_node qxm_crypto = {
>  	.name = "qxm_crypto",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x12000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a2noc_snoc },
>  };
> @@ -286,13 +237,6 @@ static struct qcom_icc_node xm_qdss_etr_0 = {
>  	.name = "xm_qdss_etr_0",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x13000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a2noc_snoc },
>  };
> @@ -301,13 +245,6 @@ static struct qcom_icc_node xm_qdss_etr_1 = {
>  	.name = "xm_qdss_etr_1",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x14000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a2noc_snoc },
>  };
> @@ -316,13 +253,6 @@ static struct qcom_icc_node xm_sdc2 = {
>  	.name = "xm_sdc2",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x15000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_a2noc_snoc },
>  };
> @@ -407,13 +337,6 @@ static struct qcom_icc_node alm_gpu_tcu = {
>  	.name = "alm_gpu_tcu",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x271000 },
> -		.prio = 1,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 2,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
>  };
> @@ -422,13 +345,6 @@ static struct qcom_icc_node alm_pcie_tcu = {
>  	.name = "alm_pcie_tcu",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x27d000 },
> -		.prio = 3,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 2,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
>  };
> @@ -437,13 +353,6 @@ static struct qcom_icc_node alm_sys_tcu = {
>  	.name = "alm_sys_tcu",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x273000 },
> -		.prio = 6,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 2,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
>  };
> @@ -461,13 +370,6 @@ static struct qcom_icc_node qnm_gpu = {
>  	.name = "qnm_gpu",
>  	.channels = 4,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 4,
> -		.port_offsets = { 0x51000, 0x58000, 0xd1000, 0xd8000 },
> -		.prio = 0,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 2,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
>  };
> @@ -476,13 +378,6 @@ static struct qcom_icc_node qnm_lpass = {
>  	.name = "qnm_lpass",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x275000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 3,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
>  			&qns_pcie },
> @@ -492,13 +387,6 @@ static struct qcom_icc_node qnm_mnoc_hf = {
>  	.name = "qnm_mnoc_hf",
>  	.channels = 2,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 2,
> -		.port_offsets = { 0x53000, 0xd3000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 2,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
>  };
> @@ -507,13 +395,6 @@ static struct qcom_icc_node qnm_mnoc_sf = {
>  	.name = "qnm_mnoc_sf",
>  	.channels = 2,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 2,
> -		.port_offsets = { 0x55000, 0xd5000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 2,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
>  };
> @@ -522,13 +403,6 @@ static struct qcom_icc_node qnm_nsp_noc = {
>  	.name = "qnm_nsp_noc",
>  	.channels = 2,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 2,
> -		.port_offsets = { 0x57000, 0xd7000 },
> -		.prio = 0,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 3,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
>  			&qns_pcie },
> @@ -538,13 +412,6 @@ static struct qcom_icc_node qnm_pcie = {
>  	.name = "qnm_pcie",
>  	.channels = 1,
>  	.buswidth = 64,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x277000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 2,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
>  };
> @@ -553,13 +420,6 @@ static struct qcom_icc_node qnm_snoc_sf = {
>  	.name = "qnm_snoc_sf",
>  	.channels = 1,
>  	.buswidth = 64,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x27b000 },
> -		.prio = 2,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 3,
>  	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
>  			&qns_pcie },
> @@ -569,13 +429,6 @@ static struct qcom_icc_node xm_gic = {
>  	.name = "xm_gic",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x27f000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_llcc },
>  };
> @@ -616,13 +469,6 @@ static struct qcom_icc_node qnm_av1_enc = {
>  	.name = "qnm_av1_enc",
>  	.channels = 1,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x2f000 },
> -		.prio = 4,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_sf },
>  };
> @@ -631,13 +477,6 @@ static struct qcom_icc_node qnm_camnoc_hf = {
>  	.name = "qnm_camnoc_hf",
>  	.channels = 2,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 2,
> -		.port_offsets = { 0x28000, 0x29000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_hf },
>  };
> @@ -646,13 +485,6 @@ static struct qcom_icc_node qnm_camnoc_icp = {
>  	.name = "qnm_camnoc_icp",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x2a000 },
> -		.prio = 4,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_sf },
>  };
> @@ -661,13 +493,6 @@ static struct qcom_icc_node qnm_camnoc_sf = {
>  	.name = "qnm_camnoc_sf",
>  	.channels = 2,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 2,
> -		.port_offsets = { 0x2b000, 0x2c000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_sf },
>  };
> @@ -676,13 +501,6 @@ static struct qcom_icc_node qnm_eva = {
>  	.name = "qnm_eva",
>  	.channels = 1,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x33000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_sf },
>  };
> @@ -691,13 +509,6 @@ static struct qcom_icc_node qnm_mdp = {
>  	.name = "qnm_mdp",
>  	.channels = 2,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 2,
> -		.port_offsets = { 0x2d000, 0x2e000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_hf },
>  };
> @@ -706,13 +517,6 @@ static struct qcom_icc_node qnm_video = {
>  	.name = "qnm_video",
>  	.channels = 2,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 2,
> -		.port_offsets = { 0x30000, 0x31000 },
> -		.prio = 0,
> -		.urg_fwd = 1,
> -		.prio_fwd_disable = 0,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_sf },
>  };
> @@ -721,13 +525,6 @@ static struct qcom_icc_node qnm_video_cv_cpu = {
>  	.name = "qnm_video_cv_cpu",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x32000 },
> -		.prio = 4,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_sf },
>  };
> @@ -736,13 +533,6 @@ static struct qcom_icc_node qnm_video_v_cpu = {
>  	.name = "qnm_video_v_cpu",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x34000 },
> -		.prio = 4,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_mem_noc_sf },
>  };
> @@ -783,13 +573,6 @@ static struct qcom_icc_node xm_pcie_3 = {
>  	.name = "xm_pcie_3",
>  	.channels = 1,
>  	.buswidth = 64,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x7000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_pcie_north_gem_noc },
>  };
> @@ -798,13 +581,6 @@ static struct qcom_icc_node xm_pcie_4 = {
>  	.name = "xm_pcie_4",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x8000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_pcie_north_gem_noc },
>  };
> @@ -813,13 +589,6 @@ static struct qcom_icc_node xm_pcie_5 = {
>  	.name = "xm_pcie_5",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x9000 },
> -		.prio = 3,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_pcie_north_gem_noc },
>  };
> @@ -828,13 +597,6 @@ static struct qcom_icc_node xm_pcie_0 = {
>  	.name = "xm_pcie_0",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x9000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_pcie_south_gem_noc },
>  };
> @@ -843,13 +605,6 @@ static struct qcom_icc_node xm_pcie_1 = {
>  	.name = "xm_pcie_1",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xa000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_pcie_south_gem_noc },
>  };
> @@ -858,13 +613,6 @@ static struct qcom_icc_node xm_pcie_2 = {
>  	.name = "xm_pcie_2",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xb000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_pcie_south_gem_noc },
>  };
> @@ -873,13 +621,6 @@ static struct qcom_icc_node xm_pcie_6a = {
>  	.name = "xm_pcie_6a",
>  	.channels = 1,
>  	.buswidth = 32,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xc000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_pcie_south_gem_noc },
>  };
> @@ -888,13 +629,6 @@ static struct qcom_icc_node xm_pcie_6b = {
>  	.name = "xm_pcie_6b",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xd000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_pcie_south_gem_noc },
>  };
> @@ -919,13 +653,6 @@ static struct qcom_icc_node qnm_gic = {
>  	.name = "qnm_gic",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x1c000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_gemnoc_sf },
>  };
> @@ -958,13 +685,6 @@ static struct qcom_icc_node xm_usb2_0 = {
>  	.name = "xm_usb2_0",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x6000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_aggre_usb_north_snoc },
>  };
> @@ -973,13 +693,6 @@ static struct qcom_icc_node xm_usb3_mp = {
>  	.name = "xm_usb3_mp",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x7000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_aggre_usb_north_snoc },
>  };
> @@ -988,13 +701,6 @@ static struct qcom_icc_node xm_usb3_0 = {
>  	.name = "xm_usb3_0",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xa000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_aggre_usb_south_snoc },
>  };
> @@ -1003,13 +709,6 @@ static struct qcom_icc_node xm_usb3_1 = {
>  	.name = "xm_usb3_1",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xb000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_aggre_usb_south_snoc },
>  };
> @@ -1018,13 +717,6 @@ static struct qcom_icc_node xm_usb3_2 = {
>  	.name = "xm_usb3_2",
>  	.channels = 1,
>  	.buswidth = 8,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xc000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_aggre_usb_south_snoc },
>  };
> @@ -1033,13 +725,6 @@ static struct qcom_icc_node xm_usb4_0 = {
>  	.name = "xm_usb4_0",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xd000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_aggre_usb_south_snoc },
>  };
> @@ -1048,13 +733,6 @@ static struct qcom_icc_node xm_usb4_1 = {
>  	.name = "xm_usb4_1",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xe000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_aggre_usb_south_snoc },
>  };
> @@ -1063,13 +741,6 @@ static struct qcom_icc_node xm_usb4_2 = {
>  	.name = "xm_usb4_2",
>  	.channels = 1,
>  	.buswidth = 16,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0xf000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -		.prio_fwd_disable = 1,
> -	},
>  	.num_links = 1,
>  	.link_nodes = { &qns_aggre_usb_south_snoc },
>  };
> @@ -1795,21 +1466,11 @@ static struct qcom_icc_node * const aggre1_noc_nodes[] = {
>  	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
>  };
>  
> -static const struct regmap_config x1e80100_aggre1_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x14400,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_aggre1_noc = {
> -	.config = &x1e80100_aggre1_noc_regmap_config,
>  	.nodes = aggre1_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
>  	.bcms = aggre1_noc_bcms,
>  	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
> -	.qos_requires_clocks = true,
>  };
>  
>  static struct qcom_icc_bcm * const aggre2_noc_bcms[] = {
> @@ -1827,16 +1488,7 @@ static struct qcom_icc_node * const aggre2_noc_nodes[] = {
>  	[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
>  };
>  
> -static const struct regmap_config x1e80100_aggre2_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x1c400,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_aggre2_noc = {
> -	.config = &x1e80100_aggre2_noc_regmap_config,
>  	.nodes = aggre2_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
>  	.bcms = aggre2_noc_bcms,
> @@ -1921,16 +1573,7 @@ static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
>  	[SLAVE_TCU] = &xs_sys_tcu_cfg,
>  };
>  
> -static const struct regmap_config x1e80100_cnoc_cfg_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x6600,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_cnoc_cfg = {
> -	.config = &x1e80100_cnoc_cfg_regmap_config,
>  	.nodes = cnoc_cfg_nodes,
>  	.num_nodes = ARRAY_SIZE(cnoc_cfg_nodes),
>  	.bcms = cnoc_cfg_bcms,
> @@ -1960,16 +1603,7 @@ static struct qcom_icc_node * const cnoc_main_nodes[] = {
>  	[SLAVE_PCIE_6B] = &xs_pcie_6b,
>  };
>  
> -static const struct regmap_config x1e80100_cnoc_main_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x14400,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_cnoc_main = {
> -	.config = &x1e80100_cnoc_main_regmap_config,
>  	.nodes = cnoc_main_nodes,
>  	.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
>  	.bcms = cnoc_main_bcms,
> @@ -1999,16 +1633,7 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
>  	[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
>  };
>  
> -static const struct regmap_config x1e80100_gem_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x311200,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_gem_noc = {
> -	.config = &x1e80100_gem_noc_regmap_config,
>  	.nodes = gem_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
>  	.bcms = gem_noc_bcms,
> @@ -2023,16 +1648,7 @@ static struct qcom_icc_node * const lpass_ag_noc_nodes[] = {
>  	[SLAVE_LPASS_GEM_NOC] = &qns_lpass_ag_noc_gemnoc,
>  };
>  
> -static const struct regmap_config x1e80100_lpass_ag_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0xe080,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_lpass_ag_noc = {
> -	.config = &x1e80100_lpass_ag_noc_regmap_config,
>  	.nodes = lpass_ag_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(lpass_ag_noc_nodes),
>  	.bcms = lpass_ag_noc_bcms,
> @@ -2048,16 +1664,7 @@ static struct qcom_icc_node * const lpass_lpiaon_noc_nodes[] = {
>  	[SLAVE_LPIAON_NOC_LPASS_AG_NOC] = &qns_lpass_aggnoc,
>  };
>  
> -static const struct regmap_config x1e80100_lpass_lpiaon_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x19080,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_lpass_lpiaon_noc = {
> -	.config = &x1e80100_lpass_lpiaon_noc_regmap_config,
>  	.nodes = lpass_lpiaon_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(lpass_lpiaon_noc_nodes),
>  	.bcms = lpass_lpiaon_noc_bcms,
> @@ -2072,16 +1679,7 @@ static struct qcom_icc_node * const lpass_lpicx_noc_nodes[] = {
>  	[SLAVE_LPICX_NOC_LPIAON_NOC] = &qns_lpi_aon_noc,
>  };
>  
> -static const struct regmap_config x1e80100_lpass_lpicx_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x3a200,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_lpass_lpicx_noc = {
> -	.config = &x1e80100_lpass_lpicx_noc_regmap_config,
>  	.nodes = lpass_lpicx_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(lpass_lpicx_noc_nodes),
>  	.bcms = lpass_lpicx_noc_bcms,
> @@ -2126,16 +1724,7 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
>  	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
>  };
>  
> -static const struct regmap_config x1e80100_mmss_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x5b800,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_mmss_noc = {
> -	.config = &x1e80100_mmss_noc_regmap_config,
>  	.nodes = mmss_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
>  	.bcms = mmss_noc_bcms,
> @@ -2151,16 +1740,7 @@ static struct qcom_icc_node * const nsp_noc_nodes[] = {
>  	[SLAVE_CDSP_MEM_NOC] = &qns_nsp_gemnoc,
>  };
>  
> -static const struct regmap_config x1e80100_nsp_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0xe080,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_nsp_noc = {
> -	.config = &x1e80100_nsp_noc_regmap_config,
>  	.nodes = nsp_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(nsp_noc_nodes),
>  	.bcms = nsp_noc_bcms,
> @@ -2177,16 +1757,7 @@ static struct qcom_icc_node * const pcie_center_anoc_nodes[] = {
>  	[SLAVE_ANOC_PCIE_GEM_NOC] = &qns_pcie_mem_noc,
>  };
>  
> -static const struct regmap_config x1e80100_pcie_center_anoc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x7000,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_pcie_center_anoc = {
> -	.config = &x1e80100_pcie_center_anoc_regmap_config,
>  	.nodes = pcie_center_anoc_nodes,
>  	.num_nodes = ARRAY_SIZE(pcie_center_anoc_nodes),
>  	.bcms = pcie_center_anoc_bcms,
> @@ -2203,16 +1774,7 @@ static struct qcom_icc_node * const pcie_north_anoc_nodes[] = {
>  	[SLAVE_PCIE_NORTH] = &qns_pcie_north_gem_noc,
>  };
>  
> -static const struct regmap_config x1e80100_pcie_north_anoc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x9080,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_pcie_north_anoc = {
> -	.config = &x1e80100_pcie_north_anoc_regmap_config,
>  	.nodes = pcie_north_anoc_nodes,
>  	.num_nodes = ARRAY_SIZE(pcie_north_anoc_nodes),
>  	.bcms = pcie_north_anoc_bcms,
> @@ -2231,16 +1793,7 @@ static struct qcom_icc_node * const pcie_south_anoc_nodes[] = {
>  	[SLAVE_PCIE_SOUTH] = &qns_pcie_south_gem_noc,
>  };
>  
> -static const struct regmap_config x1e80100_pcie_south_anoc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0xd080,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_pcie_south_anoc = {
> -	.config = &x1e80100_pcie_south_anoc_regmap_config,
>  	.nodes = pcie_south_anoc_nodes,
>  	.num_nodes = ARRAY_SIZE(pcie_south_anoc_nodes),
>  	.bcms = pcie_south_anoc_bcms,
> @@ -2262,16 +1815,7 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
>  	[SLAVE_SNOC_GEM_NOC_SF] = &qns_gemnoc_sf,
>  };
>  
> -static const struct regmap_config x1e80100_system_noc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x1c080,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_system_noc = {
> -	.config = &x1e80100_system_noc_regmap_config,
>  	.nodes = system_noc_nodes,
>  	.num_nodes = ARRAY_SIZE(system_noc_nodes),
>  	.bcms = system_noc_bcms,
> @@ -2287,16 +1831,7 @@ static struct qcom_icc_node * const usb_center_anoc_nodes[] = {
>  	[SLAVE_USB_NOC_SNOC] = &qns_aggre_usb_snoc,
>  };
>  
> -static const struct regmap_config x1e80100_usb_center_anoc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x8800,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_usb_center_anoc = {
> -	.config = &x1e80100_usb_center_anoc_regmap_config,
>  	.nodes = usb_center_anoc_nodes,
>  	.num_nodes = ARRAY_SIZE(usb_center_anoc_nodes),
>  	.bcms = usb_center_anoc_bcms,
> @@ -2312,21 +1847,11 @@ static struct qcom_icc_node * const usb_north_anoc_nodes[] = {
>  	[SLAVE_AGGRE_USB_NORTH] = &qns_aggre_usb_north_snoc,
>  };
>  
> -static const struct regmap_config x1e80100_usb_north_anoc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x7080,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_usb_north_anoc = {
> -	.config = &x1e80100_usb_north_anoc_regmap_config,
>  	.nodes = usb_north_anoc_nodes,
>  	.num_nodes = ARRAY_SIZE(usb_north_anoc_nodes),
>  	.bcms = usb_north_anoc_bcms,
>  	.num_bcms = ARRAY_SIZE(usb_north_anoc_bcms),
> -	.qos_requires_clocks = true,
>  };
>  
>  static struct qcom_icc_bcm * const usb_south_anoc_bcms[] = {
> @@ -2342,21 +1867,11 @@ static struct qcom_icc_node * const usb_south_anoc_nodes[] = {
>  	[SLAVE_AGGRE_USB_SOUTH] = &qns_aggre_usb_south_snoc,
>  };
>  
> -static const struct regmap_config x1e80100_usb_south_anoc_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0xf080,
> -	.fast_io = true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_usb_south_anoc = {
> -	.config = &x1e80100_usb_south_anoc_regmap_config,
>  	.nodes = usb_south_anoc_nodes,
>  	.num_nodes = ARRAY_SIZE(usb_south_anoc_nodes),
>  	.bcms = usb_south_anoc_bcms,
>  	.num_bcms = ARRAY_SIZE(usb_south_anoc_bcms),
> -	.qos_requires_clocks = true,
>  };
>  
>  static const struct of_device_id qnoc_of_match[] = {
> -- 
> 2.47.3
> 
