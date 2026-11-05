Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920956;
	b=fUG2KDI5Sy0t9XOlk0+sZbx0yjuI5OBxi0kv8T4ZMduGuRhQH7TLv/y5CxZncskH1H9N
	 mJb1qExk4DjbDpEjQcmzFYhzZ9V9hPUC/wb79TAGlS29D7W/qRn1cn4DMwEUXcMGD3wlG
	 WOfOeVQXYWKihRn7JgcJUublU6DUZIu01+tLkULcqAGrj5qRR77FoIRt9evfDuuHF5skA
	 5NNu7dTIF5DypF8cA2UeywfA35pKZx0HwHr6SrQlxlhBGkicbcReGk4JyhWFsiRN3T5XI
	 Y4gfQ966RT2AX42uh35y5tIMEQBtxnBF/OZ2CJAz75OYwr3XPrUxhqFdjByfGDEg76w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-FB-Internal:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=F+KcKhR5CnH65kxRNvl8LH+QFZdieMym2Jst7zi2+xw=;
	b=NuNE/GAqh/Bfh155STNer6U98mszWLDaqAV4ZFZYqFeMSTd5X+QZ8i2z4ks9QQcRGav5
	 3bYQX656Ca6g45jcXG/T+cwJCHL6nRnblMxkIL6cWDAZ5V2St80uGJOjZemWKFwCpCTPm
	 T5ex8kMxT/rOgoPTtXsuTalUSTjLuxhOhM3SnLBNjnpx1PrImS/AB8ZIjkeBIhCrfccpN
	 yUAbpftsllnV5BAUorauUyiyOUjRVRL0pq2YEK2zmRZMGvemzcCZzJjyZGOB+SBmsMfpL
	 UtcAdUucG/WdVrXAhA8zCDJrPRW26KgaI58prPPOHq1gbTU1fqYknLIy1591knSxmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ORyJur++;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8798606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8798606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ORyJur++
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5N3Hbm1244789
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:22:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=F+KcKhR5CnH65kxRNvl8LH+QFZdieMym2Jst7
	zi2+xw=; b=ORyJur++WYpP5A8LFnqWIwPQpzCvgVbRDMbbdRfItLuC+pvEjEx2d
	1UFJ2BhiFf7YTmqkq+8oEwAtgYESHPE5VVK3z4aC7JTNYR/1kjwnOq485x7agFgf
	TXcKrb3rMQuzQCa0VgztXqUtcbXQjHiudQqa0tBF3UthgToh/mnTOZyjy7UACd5l
	gW65iQ2eMoTd8G6XQWOqdeLqCCkU0VVCj2JWdQvDKZuaO1BDdshzsiiygSJPDHJ+
	mmXMBgdUOOpjlL+R6H8zJJxwyhcv6pq6bNopJrAkhwXTXXtq8a7ywd9MiqbFRO/S
	sDxd5xfUevvYvK25BD3+RrktkH0SMEsTA==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrbcj27dq-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:22:35 -0800 (PST)
Received: from twshared14956.51.prn1.facebook.com (2620:10d:c0a8:1c::11) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 23:22:32 +0000
Received: by devvm9890.eag0.facebook.com (Postfix, from userid 139328)
	id A434B55781A3; Thu,  5 Nov 2026 15:22:19 -0800 (PST)
From: Jennifer Chan <jenniferchan@meta.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        Lukas Wunner
	<lukas@wunner.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] PCI: Add d3cold delay quirk for NVIDIA LR10 NVSwitch
In-Reply-To: <20261105215148.GA1566818@bhelgaas>
References: <20261105201010.2297078-1-jenniferchan@meta.com>
 <20261105215148.GA1566818@bhelgaas>
Date: Thu, 5 Nov 2026 15:21:33 -0800
Message-ID: <179392089371.3269676.8761425999098988375@meta.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-FB-Internal: Safe
X-Authority-Analysis: v=2.4 cv=PYtqFShd c=1 sm=1 tr=0 ts=6aed0fbb cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22 a=6_OcV_819t3UPtOCXZEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dosUoLcxe_VMeXzuGVzKrO9TrNZZn2Em
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5MiBTYWx0ZWRfXyqMB6gLT/KLi
 ANPVYeoWN06rHXWZlFO7regFxUA258mIgDdrp9blOhZRe5ST+/kjZGpn4zqXZ8W9n6Yj9JOhZn0
 adfMCDaqoeEZf0mQVTnHvSrOMTVmRhg=
X-Proofpoint-ORIG-GUID: dosUoLcxe_VMeXzuGVzKrO9TrNZZn2Em
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5MiBTYWx0ZWRfXzhhGG3nODO31
 UEHthbvml1qmZYkIekvRWI0bCXXt7s0DWffaegT/tKdKGohVpf9GmnYl3xMw5HqfDIhtiibLIIo
 pJGknx4mLSi1WC58ow/3NW8R47BWOTXqilH3XV0Z9hxd9cjRzWJzShi4MXzGNT63gipNNHUtPUd
 a7VJD17G8pjcb195DlM8LpUQULbTRLExzaFZACj+C7m2T5dHJZFWE83eYWBGbos99YAtM0nCwoJ
 WirUVK+1MWNFmKAVp6RsQdveqQ926xXwJF/w+FiEW90PXc7n5JqWO9c/wLXjkLiMFO54zX5XBQE
 Lbv3TvhWSNT3lbp05VCmf1hwZZBKG2x1d+lSSJgM+dXgckIFMZNaGWWj2LtRO99eGP520mpdcC5
 dmiYA8LTZolrLtYz7QgghoNgprDrtn8pmOucyOrvgC1xrsB9ZCDpvY4Jd0ijchwmTVtAM7FxPUi
 EhTBME+i3RTeWEMSfNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01

On Thu, Nov 05, 2026, Bjorn Helgaas wrote:
> Do you know where the -EIO is from?

My mistake in the changelog, sorry: it isn't -EIO.  The four switches
fail in nvidia-nvswitch chip init, which logs "Failed to initialize
device : -5".  That -5 is the driver's own status code
(NVL_INITIALIZATION_TOTAL_FAILURE), not an errno, and probe then returns
-ENODEV.  Before that the driver warns while reading its engine
discovery table from BAR0, which looks like MMIO not returning real data
yet.  My logs cut off the driver's error text, so I can't say which
access failed.

> Ugh, a second is a long time to wait.  Does the kernel you're testing
> include e8df1d194c39 ("PCI: Don't treat ~0 as ready in pci_dev_wait()
> with RRS SV"), by chance?  It only appeared in v7.3, so it's pretty
> new.

No, both kernels are v7.1-based without it.  The fifth switch fails
because PM_CTRL reads ~0 in pci_power_up(), so the device may well be
returning ~0 after pci_dev_wait() declares it ready.  I haven't yet
checked whether the Root Port has RRS SV enabled.  I'll check that and
test v7.1 with e8df1d194c39 backported and without this quirk, logging
what pci_dev_wait() reads.  If that fixes it, I'll drop this patch.

Thanks,
Jennifer
