Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDB468C13
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514531; cv=none; b=GELVnw29TIe29nW4JrPQJsN5p0ZXiJML88WugmxC2Sap0dOzkUuPwx0EProT/Ke5FMoTD0sTp9rIzYo4OwZ6PM8NFPALgw1RW77rXDz4Ei70N3zo+yoXQ5xhMo6HDbWqFWy2Em/99E2C22x8FDKK+EVNkUWD5CqKL7+Va8zh5nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514531; c=relaxed/simple;
	bh=dTEsVObgRqUWdZPvIxWySL+6nkWC6Ia7ISiB0iANJgE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unRo2QzhTCFJj2SySUvEaxzgzNsWJkATkmbRPbxTWHLhX12iG4OT4EgefNiIBTVVRWbfZ/x0CLphU7CBcAS5Zm75wjV6C103RUWOk0dLcPc26YCVhD/EwvBptLvIPuIunqLBJXH+AU8CI9ob0OfmWl8nEelnVJJMEgTOSzt4iJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1C0ls2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGxsXIMB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1C0ls2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGxsXIMB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZ7kM980276
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXdEkFs+2jBbAlp34VMYxKpRmZ4A7s9s9pc8ZFfcFQM=; b=c1C0ls2rJ6H7oNea
	dYoIXwjesL5h2aMoSihGD7oBDL3G+/FU4H0OjwUDFfMUkKJQK2HpJbexUb+QHrk6
	ZsmDdI6h8XLVUcYR0PDLCFFdh57RprE+LnqaxMjjUQm/QRfGBv1bLHVxasx/XYjY
	UobEYpxjy3G8HmwDazQnArrvtm26NFDYlmm9G27XtZ0DnioZcqaBus4sMWoM6TbU
	h8QyR5TOWAwWpi3/UH5DgSMgejaozBCzOXj54Y9hPFFUAfKAc7UPvMARkXcXZ+ca
	Poj4zo7G64BcOP6MnJQzZ3+rsQ1wBLfTTT6UtgGuxi7b8kXOEsRneyvLoHJkL+Mz
	6VgWxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtuvf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:22:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so4980489a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789514528; x=1790119328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oXdEkFs+2jBbAlp34VMYxKpRmZ4A7s9s9pc8ZFfcFQM=;
        b=NGxsXIMB1Dhj86MwuqCMlD4VIO7LQj17L4xIEIE9CjM1PGJ3pjhsaHf5cuTwk0Lxac
         koP6Tnesul0lx/Po+0csx2WWPzJbDxbn8IGZzz/yISZ2DkwF3fG2kc6vgNtXWMDgE8ns
         /GbqBP89cCAzjyQ+VclGK2TFiMX15GHe3EW0ZgmB5EHYpQffXwMa2bzewT6wSfpwb8Dv
         75on+hPF/EGQHqWYgHyIF1Swe8Un+e3/tRzOX52LFWzV+YnTQ2XFKGOsIvbQGhxrJsNc
         rtfFXO9Hg1QkPh3ilKzgxRAdzwePNHPWxHMuV5bPi6AtVkTOfvkEc1moXgapfP1mHR4z
         Znhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514528; x=1790119328;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXdEkFs+2jBbAlp34VMYxKpRmZ4A7s9s9pc8ZFfcFQM=;
        b=ZymTk29wITUL0hV4den9VEQ7KgQWBQaGdsDGICEEwsnYcEJ9b7F2R1zKcJfbe4dEzI
         90Apt+hq3vZjHL69lA7AFNoh/GuzgaN/Cued5Q2Fit0UTYSCRf/RWeFfKUQVgV7TrX3K
         e/70K28F2V2XL4TxuNUToxOVeFReJr8oqPHJzSalRQ97EVTVE3pAOoIdqEhNIS//1/Vs
         fXxYWAmU8vBlK8jXoh9tOZb1iEEy2JcJ7XFbvQExEjuUmh6rRMbQufg3Ssnz7ZQaUUSW
         pbk879NtR7gPjdVmP04sTqmGJQYc5fVVfvEKYabWIS0ANTjsLhdSASqzGzuX1SGjAZAx
         EC7w==
X-Forwarded-Encrypted: i=1; AKwUvBzlfNGuF48/QVOmvoXZ86f26LWzD7teD4Jb8cefUHASKgZlTo1p7PQIUC0OGOsfDUR5DQ+6DktdUqaQlrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mn6Pj+58OTPTC+226x9Vd6c1atfRFa8boG9PRHzWLuxgWalDiB
	aQ04xGY0eEQ3RS87QVkpNQoTU1ZTX2o0o3TtmKgQRzW9MtBNmeMfKAAEltmdrvRXN5WO7AX+JMg
	E/fuCs6+6oKnPCQe4zmq/dNG7BjDKk+KdvkhNa9bnbTUnbh4LZ6pkAoVIjg+KbDt3JZQ=
X-Gm-Gg: AYBFou3nZsO10dtir8uXjOlAAXWLqn32x4f4ABjME6Q4eiK8cuHPLKcSPmrykBvdRe/
	Lny9jMZDmLzM/yXB4/psOt7BAL1eHbXL7rImloib1zeqmFOXE+ALxmdoMivzAbF1koHuncy5hYO
	15H3kB01jbaBC9FQPv2OtG0RaRPVeKSH23MFQRivoWfGpWTQFPdXEjxzjsL8w8jLXWheJ156QmM
	2EpFao5naHQomQ3N2ALxFI8rauKZMrdK76lrYSwGx63oTAvzDv6ZC7QwgC73vD6wEhKT9coJ0Bd
	dmqgy6kudlKGbewU4TaQA4MIdtvuRcniyvjtE4ZQyRASoVr9q6G729s1s/4XDuvP5Rz+RuRuEIV
	3xuQ8o8Hb1Y8lGn9KlmtzEn4bqCA=
X-Received: by 2002:a05:6a21:9090:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3dd5f5d8672mr1167653637.17.1789514528275;
        Tue, 15 Sep 2026 16:22:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:9090:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3dd5f5d8672mr1167615637.17.1789514527903;
        Tue, 15 Sep 2026 16:22:07 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm2203060eec.27.2026.09.15.16.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:22:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:22:04 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
        <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
        <kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
        <baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>,
        "Eric
 Auger" <eric.auger@redhat.com>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <skaestle@nvidia.com>, <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>,
        <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/15] iommu/arm-smmu-v3: Support PRI Page Request in
 arm_smmu_handle_ppr()
Message-ID: <20260915162204.000054b9@oss.qualcomm.com>
In-Reply-To: <dd1ee0afb947b5f7c229c21b7fcff5d18f9bc326.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
	<dd1ee0afb947b5f7c229c21b7fcff5d18f9bc326.1789446520.git.nicolinc@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mcv6CKXPe7SO-g9FttUG5uGGA5JnY7g8
X-Proofpoint-GUID: Mcv6CKXPe7SO-g9FttUG5uGGA5JnY7g8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfXz4fOWvRh2VXi
 DBwqxAR9A3J9QhNDoFMu9AZPHFEh1mPWga/46i6EetouvC/7QK5UVdDVZLjEbQqyu+ZXNECb5gM
 I8Zx44hnnqYOxAUFW5ktEIIeDwdykBs=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa9d321 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=h35TsNJSbmzmzvWWgmEA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfXwTjTKiVg/im/
 N9A1cHyWSc48idyyiutf+4Inrz3iq1Ga+f+CSCL+crxWGFxr/MxQBMGfuJyGyxGbfgCPNk5l1Sb
 5YVjWLppzYxYMghVNRDEWdgLeH9aoWrgt342NT7pXiEIzlEwGOiHCuCVjEOevvr0qzRfoxnHOBy
 N1p8FtNRAOeT17dmLDQG1aq5oNBDjCLpw5W90T0pHYcbmipNQn7aXptS0Y8/xZHhkw4uXczGlYd
 NEgmPKMbDc+bMrlvWL6HtMlU1KgHzEqK9gR+8JJgmecsYL5AGdh9MnC4fV+PCP3GCryRmvFHgUV
 /fclyluqEMfo03W9qiobNDmGriYjt5SmOrXiRb2AvKuXE5uEh+xl4bSmkQhKVmPBZk9Uy1pPnpI
 KxQ+rGtf7GpM3WNe4XNhVvFRyXlsaWUVMHkLHDaO+C8xRWY2M3vYcetCppeKWcI8hvf95cF8/N2
 H05WcG+KEn8/cB7vEjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150341

On Tue, 15 Sep 2026 09:38:22 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> For a PRI-enabled master, convert every PRIQ entry into an iopf_fault and
> report it through iommu_report_device_fault().
> 
> For an unknown StreamID or a master without PRI enabled, keep the existing
> LAST-page DENY path. Merge its two messages into one ratelimited line so a
> faulty device cannot flood the kernel log.
> 
> Discard any PASID Stop Marker (LRW = 0b100) prior to the fault report and
> the DENY fallback both, because a Stop Marker does not expect a response.
> The IOPF infrastructure requires the driver to discard it, as per the doc
> at iommu_report_device_fault(). This also matches the intel-iommu code.
> 
> When SSV is clear, the same LRW encoding is a PRI Page Request that expects
> a response, so let it fall through.
> 
> Note that master->pri_enabled will only be set by a later change, once all
> the PRI paths are ready.
> 
> Co-developed-by: Barak Biber <bbiber@nvidia.com>
> Signed-off-by: Barak Biber <bbiber@nvidia.com>
> Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
