Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1A956510E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177526; cv=none; b=cJt/Nwsvd4fl/nXXgg2w+nUt4TlaxRsa2gXoRgFTo3gL1yIpfGiYpKOF5V8mRsluoiTvyzjREckjc9tC+P7WSBC3Wiuc2BO2BeBeIr/p2wZazhnWBM53AMcGhxAwZbR/lK5TH1sHCQYao+9vbHum4mIrdmzsNWQPp/15R00Z/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177526; c=relaxed/simple;
	bh=s03aIwng+onu3oDOKgOOuo1eiloxafJcjx/tPyNlwtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6w4jy5ACcpcBbMRUsMZH8AcFNpSNPoPHf3+lSLuaze759qDBXv5FTnpmvOAYHBdY6JiLTlnYUM0ZuxfSIOo1iBfLLwCi5pDgw5wMjebrY8F/1CPSTIX3JATRtm+8EjsJCBd+OZgN+9JWvf9CdsBIsPzBMCO+pEMWl2VzOFOIOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=FBTlZ0Jn; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="FBTlZ0Jn"
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NEWC3B1026955;
	Wed, 23 Sep 2026 15:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=9DvkkM+rEk/yRIWiW1LKXVYDxU
	l1gUuqrsbK5lwOeOU=; b=FBTlZ0JnrDwQSZFOFTKxEAPH/X5JIXjO/P2iwnKboc
	5Zz+ySZ1TGT5jYbEqXxU492hNFawX0hiDcFQjC0WVDP9n/5boiODNUBKsC0Vzbvk
	yOD7tOvEtq6WbnGj/yxDevrdNSMQVPyg+bIO7YPd7b0nAhQh+i6QVtwFBjBkPPR2
	sU8nutJG1ti/4LJU91HY1lRRi01ugreCUl4nblUDJrl2+wm+Y0rWvF9e6L3vs6g7
	zqzBtZ7Y3X2FCqsW5uC0nnl8oeywlFTJrF5J4iI8pePKY+9mC7KIhcyWeWIBSav3
	EOlrfqp7ApL4RCp7PaG1ZTFWZwyz3bXDs+2Zvind44Mw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4gvfcvj9bv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 15:31:21 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id BE85E147B8;
	Wed, 23 Sep 2026 15:31:20 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 8419D800EFB;
	Wed, 23 Sep 2026 15:31:18 +0000 (UTC)
Date: Wed, 23 Sep 2026 10:30:55 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Steve Wahl <steve.wahl@hpe.com>, Justin Ernst <justin.ernst@hpe.com>,
        Kyle Meyer <kyle.meyer@hpe.com>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: Dead arch/x86 UV code?
Message-ID: <arPwr2hqcQos-TFY@swahl-home.5wahls.com>
References: <d49f2e1a-1f19-49e8-a2a0-98b839274b69@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d49f2e1a-1f19-49e8-a2a0-98b839274b69@intel.com>
X-Authority-Analysis: v=2.4 cv=TfYDJhQh c=1 sm=1 tr=0 ts=6ab3f0c9 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=ay80y3fxfMS_JZZz1qJy:22 a=QIa9-b6dbVQTm6vAbSQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MSBTYWx0ZWRfX0ZO1WjcEUejg
 8fpzKeC4m1gsQF87vrL4lKsgLGqWqlxOGqJ4DJ3m6GlTmx5psjlE3PdzAKW1vUqgUyOXU19s+rm
 j1f2MEZqkaz3wtekQWv/G9yu9EmYqNM=
X-Proofpoint-ORIG-GUID: GDaUOK2r4SuDOHBXg2fDcEVJBFdojaCR
X-Proofpoint-GUID: GDaUOK2r4SuDOHBXg2fDcEVJBFdojaCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MSBTYWx0ZWRfX032wbHDZfQgJ
 O1JVmnAEmszlol+0/T8DH6vkuPf6slF3zwiNohyaoTGVw/mRIXHAvQjGA6nNtg16AF/1bst6n3J
 brcbLC68nAewJef2DFJ8sO6ko25tZ9sEaaoBzFzFJKf8d61y8DZ37S+pMjKN5unmSaEg6EmAvQQ
 uc5LPVFHF7DuOMmumPAUfM1Ggf/dvuxJVuyDFaDVaJNNq48eHb+5aDI4DIjAW/18B0NRae9nd/u
 vseRYRtrPnQbVPxKwZhT7tpzwnOxJ50qKxKgdD91ySHcYuOx5oADdxbT/aXVOZNXeerE9DtOPCN
 Yx7NK6cC/Tw3Gc925cV0YkN74raDanOgMoRboc19edNWukaq7YY+jx+ch9pohpLdaAdwTMuKO2A
 HiBCjNYed6JNp2g6P8pMTUfIXgZ++un+8GQTBIRUyiBUDz/8n2bMEtUgQ4l6B0QcBXVQNtyXy7E
 9+kdzlAvWDw6JHuaI8A==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230061

On Wed, Sep 23, 2026 at 06:29:56AM -0700, Dave Hansen wrote:
> Hi Folks,
> 
> I threw a silly LLM at arch/x86 trying to find unused code. One of the
> things that stood out was UV:

Thanks, Dave, we (HPE folk you listed) will look at these.  It may
take a few days to get to them, so I wanted to send a short note so
you'd know you weren't being ignored!

--> Steve
-- 
Steve Wahl, Hewlett Packard Enterprise
