Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE853392819
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976473; cv=none; b=qW3JAM19Wokc3uCFl9KCkjOxFYrC3GYmm0eelJvYRdA2aXYHZaKWRwX7RHKgTnLOq/D7C84GsXhrNW/+n46hsI4+Sf51YVEa1y6ua95y4v3jtZ6g3UShG/MGNvHpomCdGH5be6Dh6+kxUK5PJICSecj7R4nZFc31eSneMAQjED8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976473; c=relaxed/simple;
	bh=p0zIvrq3rWWMpsFUIdxK1JTUvUraW8LebMqJXUniMZw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FebSNsUBDe8cIzpyUeSePSKiZeZboWXG26zb+fV413jsjiBTDiTmSng7T9LWYMzS81Dn8rXjNXi/encpW+UDuG5kSdlbfNEjmZHh0B6+/5pxOKN9F+pIqTeb9+TZ6jyGXUP3i3rpYXPN8+alqIrpaq/YtBCxWeIJhoTUSN5OoG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfSmyUPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNypzAJB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfSmyUPW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNypzAJB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7ZMH3133790
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 17:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gm+9IjBE9cdQ/0pMBuXgvhCeHwdA9Cjik6T73NaZKR8=; b=cfSmyUPWCvHVtyLu
	rz3IstZAvuTT/9o3NMA2V7wpZlhnhTyDMkensAM702lydzjPUNY/5MnMyBn+m+lU
	4do4aN1R7NvndsOueLhOgi7L9Jqun10CqXzzuVfslinBDtV+HM19c+g/CM5jHlNi
	oz4ZgsYrj3fkko46TF43drgpkXBXLE3MQCE/9H3Ared3JU+EgiveZOx6fOcSEzCt
	tE9Zd1gwdEV7s48UWJ3h34zi4OjNH9HsSn0Dmdd5cf8t9lsPyyDFtfsu/dcTTtsJ
	LfUuBFznsJ86c39+lHrRtGVMtUqpU8E7FgBoIALMcsi4QRbjVbL/Gk73ElfjxzZo
	hv410Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru22ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:54:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso8704542a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976467; x=1789581267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gm+9IjBE9cdQ/0pMBuXgvhCeHwdA9Cjik6T73NaZKR8=;
        b=KNypzAJBeyGfLJjikKk1fRrAZ68sUjCbRlc7lS/gSNkShx3IprP1A0yeNsRG5MdfKT
         pvn6bZWyl3J6rjEbiTUovN2dNfL+6bOsAaJmqwlz+R4ObWWJFFGZPfVoF1LOevZz4fFO
         X9+Pp4Wd+6mByrQJNaFjTdsJpD2ZTIx6WJTEslRFMGyMfZhuDYXbBuc4wm3NBfdrjm9R
         uKmJ+8WYAATk7PPSig8sgvPfgE/BOALIx81QefMwrTmkjRvZvv7rSPFxWySrucy9BIxX
         WBmWtx2G8IT/A0howA1JIObxupaa6iVK6mNL7r01WO45GsAi1nDUk0/MrdnbOoqWdV2i
         yN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976467; x=1789581267;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gm+9IjBE9cdQ/0pMBuXgvhCeHwdA9Cjik6T73NaZKR8=;
        b=UO1e+mi2OoEIa8Ps1QBIwX7Uv0KhiBsD/oLEOe6LooX0gqCQ0AsubuKVxpNNtlYKa9
         1J+jtHv0uPEv32uMdck7TBqHIAo5jQ61R1ljuYjnPUfLCidyZv4dXRdOH4P5+cnwXFSa
         XkxL5nOchmgzkuuntrTprsNSdng+B+rWcIQeMioLxDAyyYANAz71Jbb5EdNT+WoS0FBx
         6VsrY72qVux0L3zOMuIN73jAag3S4H4x9KSxdgkHs5K85vi78fXu23R6e4y+dDunQzGa
         Jcpa+TVgg2EQ33bX/SePCsdDMvR9GYKZPmxbzML+rrIkbJJiWkqAOenEV/h6GEPQ8E93
         GBUg==
X-Forwarded-Encrypted: i=1; AKwUvBwvqR9MV5dRQdfxlnKoejYITSJSTAYPgEEvQmJKkuCgzGP/3hBxNWJKTeusdQ5m+ZEt83fAiQwiv3fgeW0=@vger.kernel.org
X-Gm-Message-State: AFuF++mM5M0b1uD1U3gZOOD3mUiQxncn7qBvm24u+Yvv3a6vypi1Vr59
	Jk2eGGE3e0dRpPedtXaGTeQ101Uguj3tf3+Cay2wTExTT+53wNd44XfOiZLU7yoPlJy3jJ8iZ3H
	zF549TN4u4MX/U8ebUtsuUSHGnS52IfIeE2o2QM+U365FOttSg1qnLIy0giP6BaGabuM=
X-Gm-Gg: AYBFou0bJHxcFksn93QuKss6jU0poa1XQk1MP5/4xkRmXI9wBT2H0MulsF2Odd8KtwQ
	hhjSfvikRsgQNggONrM27s6A0HVCsmQV9ide8IHCVTAoEm63iTcfGXRa3Rp/UIDWPj4Z9mJRiTZ
	rO/hgsBQHxgmtfsda/y+8nitd/CN45cxcUS9gcmZ8eslwWN7U8eVujm6JHpCcoGwZ3T8+j6r8gO
	9IRfNLzeTV834sesqPQa+KqSze2A6kbCbTj6iDny/GzBszNFG+0ORHlLzQmjGrcfXIVtDicXNO7
	L9T+RVAi+qNIsADusJDxioT6oxGjI1ruOpKeWwryVF/VHtUWxvao83hDUY3YqIQ81De03cEYtS+
	3RlB8wBCMNkdqYXK2sPhY3eqs7Is=
X-Received: by 2002:a05:6a20:2d2c:b0:3d3:adad:f173 with SMTP id adf61e73a8af0-3dabb270ed0mr12635091637.21.1788976467476;
        Wed, 09 Sep 2026 10:54:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d2c:b0:3d3:adad:f173 with SMTP id adf61e73a8af0-3dabb270ed0mr12635021637.21.1788976466966;
        Wed, 09 Sep 2026 10:54:26 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm72009935eec.15.2026.09.09.10.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:54:26 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:54:20 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
        <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
        <kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
        <baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <skaestle@nvidia.com>,
        <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>, <bbiber@nvidia.com>,
        <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/13] iommu/arm-smmu-v3: Submit CMDQ_OP_PRI_RESP for
 IOPF event
Message-ID: <20260909105420.00000abe@oss.qualcomm.com>
In-Reply-To: <apttObDR6jf0rvt+@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
	<9280aea7ae7197eca3f223ef5b998aa25afb29d6.1788222485.git.nicolinc@nvidia.com>
	<178846311317.1308030.4335813024474016483.b4-review@b4>
	<apttObDR6jf0rvt+@nvidia.com>
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
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa19d54 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ikd4Dj_1AAAA:8 a=9koHXFDKl-DiS4GoSb4A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: pgdiPuOXOaLWCFoVGJKpoDx3KLe3bMX4
X-Proofpoint-ORIG-GUID: pgdiPuOXOaLWCFoVGJKpoDx3KLe3bMX4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5OSBTYWx0ZWRfX+HglUROfMMwq
 JvvfA0/bSfB+f/CQyv6XKo/YkStNdKbT3Xm1zzKGiHl12Al9PMblp+dt+3cGGYEcYa4cxTQJEFt
 Bi8IJbmNCQjTGhPNDrHSQ6mnwQ/RgYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5OSBTYWx0ZWRfX7ZWxC2S/uk9k
 TQyMcZPNVPs9rKedJFkebyfYBGxPlwL5uiTurzVZYRMo2i/MS4/DEyd1LgBgJvUup8yZNL8MPXR
 iVyae68HtHPE0dV0iY/ITYFDk7/6x0ZlUizWc4MT4w7CCMghAXIQzn3HFeNABZd5K4obho2lmFI
 nlgV+WZg9J8bKFgaIUBMwrSplhSWHqhdCnKOR3euSBwAGB2dEaD2WhX4BoA4tgbLG3AtxNYuWqd
 csNqS21aofX/Rghs2EZJeRVSyDTVnc5SSEsB5510j1Aq0OteB7M1L8zSdRQDcIZ0Jt3qdqFUbIg
 3W2AQs73RrvhaY8SeBka0KOsOEX9FtYs2d1TDchgRRxwtNjsUwdZirNOSIXFOP6RyCUE2AmdTdi
 f+k74I7uayk+Eb/nnIrmCzUoYVtaI66ym8VPryybz3V+bSzxpjGrCp1rf722bOUoa5bKIUj7cUF
 bJ68giAOuLRt+pwp3gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090199

On Fri, 4 Sep 2026 18:15:37 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:
> > > To handle IOMMU_FAULT_PAGE_REQ from the PRI queue, arm_smmu_page_response()
> > > must issue a CMDQ_OP_PRI_RESP back to the SMMU.
> > > 
> > > A stall event in the EVTQ and a PRI request in the PRIQ both surface to the
> > > IOPF infrastructure with fault.type == IOMMU_FAULT_PAGE_REQ. SMMUv3 forbids
> > > the Stall model on PCIe streams (PCIe must use Terminate), and PRI is only  
> > 
> > There are those systems that annoy some because they smell like PCIe
> > (present PCIe software interfaces) but aren't and use stall mode. However, it
> > is nonsense to use PRI with stall mode. So, instead I'd just argue that for
> > stall the fault handling is done synchronously from a device point of
> > view so a PRI request makes no sense rather htan associating this with
> > PCIe as such.  
> 
> I changed the paragraph to:
> 
> A stall event in the EVTQ and a PRI request in the PRIQ both surface to the
> IOPF infrastructure with fault.type == IOMMU_FAULT_PAGE_REQ. Yet, both two
> models are alternatives: a stalling master resolves a fault synchronously,
> holding the transaction until a CMDQ_OP_RESUME, so it has no reason to also
> issue a page request. A later change refuses PRI on a stall_enabled master,
> so the two will never co-occur. arm_smmu_page_response() can therefore key
> on the master state: CMDQ_OP_RESUME for stall_enabled, CMDQ_OP_PRI_RESP for
> pri_enabled, mapping IOMMU_PAGE_RESP_* to the PRI response codes.
> 
Nice.


