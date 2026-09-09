Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C73390C89
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976924; cv=none; b=t/Y6LYBCW7CYvoR6BtcNgAtOCQktGhNaCZGXLPmUVqpTzTj70JhB6RKrShxWFIZnv6Nl6LBhPZghb5ZBvpwi9GwfpgcIweugXRepkxme333RWu9doiZXRp3/VKIbfs7pv7KcNa/k5rS4dV5yWMkvId+ibx2mHMy46kIUFhbcYpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976924; c=relaxed/simple;
	bh=y44p1I+qOxi8m4RJ0mcbujnCiDnKIlcRV/qr0KkL48Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ns9stp6k8PeINUNvhWbh3bBleSOfmNApRHRI1A9itKEtSxZxPpYMCBtSBib4Au4enrG0bIBBeDXb4TtysgZZ6qW7aROBce5TKypPl44a5STXvOaDfEAqhpc2KClh14YEB+psexCP3+dWmdMuVx0Ew8qubk28gsshNLhk16nAup4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzWzBtGf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvM9aKkF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzWzBtGf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvM9aKkF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7OX73716092
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSQi8KUPwQ7sewz9dZNSnIXQ06Hyg6lfMvkQJkpmQA0=; b=pzWzBtGf3uq63Kne
	EMslco6jUfhmRL0h1enVEuIQ+qX3dy4P6lulU1cMPrdfemPvte0EqEwNq+h3b8gF
	/tD/3r2bDdsf9RSxeTUbX9fviPxsr6un4RwlJmJCRM25QBym760LZOQRD9kQXE6j
	14wG2YFkf/DHYLF+QAaY6hEdM3PnvYXb4YEHndt1u8Fkg9IMa/3LTThJ2DBO/VnD
	7LtcidhuptVb2MWvaGtpgUt0l2zusLHvvkQiZu1HcARkwIzHkURyYSp2fKnlY09T
	f0DFrUYD5hvimJECNOO7knIJpQi4yCKt+olDX9iK0zwhC+uNhsZ5V/XU6Xxxnpyw
	p0QoOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7921qxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:02:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so1882562a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976921; x=1789581721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fSQi8KUPwQ7sewz9dZNSnIXQ06Hyg6lfMvkQJkpmQA0=;
        b=CvM9aKkFkkhzRcIWNiF2zXK1dlIuKdE8guZMYu61m6+g/hvppGWQWcutQtpHJdpIBc
         LGsIuSlwrP0gtUcxFacuT4uXOnj2Z5HwBT/KsF0M7qLnsBbIMPNk7LwxRrS8OgAXxRqF
         7kpUV1cRsZvgINGm69EEJ4ZAhYhTr8qKcmvy/RzVglqE1Iu9NxdbyGR1x2oUiNK8Qxyi
         74KO8bh6K+i7vDUU9N6Rl22n16In5cS2x7+b6OLolJX6I0bvTYwZm3z5OOotP0iI8a2F
         ij+StyTqt+kcg0LgwjodBqI7FzlY3cTRXdSxjP2fbJCIp69MM5C81NkvfdwWtL5qUzIr
         OHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976921; x=1789581721;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSQi8KUPwQ7sewz9dZNSnIXQ06Hyg6lfMvkQJkpmQA0=;
        b=fKyFDZJvgkNvzCIpvHVrY3vruZLftNibi7Fa1wxX2REwMJ6u/9b9mAVTdj9QGZPmpf
         lMzovMJEX5x4KT8wGnKB2xhHJyflnb68D15Z//L9MjT1xMLmxX+9fAJ6HXDhNBLEU0Eg
         lhdgg5Ibm3w+coIF7kBmMCMadB/z8HxKP+BjzkyLBGS+sRagpwLYY7o6I6XnTgO/m65B
         ITdPUfyI3e7R+QkBIVCzpnpZavrjReM6H2TJmwbXVRHvK/uCo9zdtLr6b/B6mNMUsMRO
         li6Al5F0wpMo7dwmXnxNWoMRwglnSJcwhK5WHZW+BAQVEn3HSIwIQQDP2v8z0sMhYXZv
         q80A==
X-Forwarded-Encrypted: i=1; AKwUvBxDDcFDMs+MpaS4v4q3IZVUJHxf903HSICJWjU38C52tQptq25ynoxt6X2/+Ox6jkLaP3UMRLCVQYIAJ9o=@vger.kernel.org
X-Gm-Message-State: AFuF++lCf9vlXDN1Y5R9RpMSOSUlW5/K+3wA/LAfsIjzmpm6i+xCcNHc
	zHCWIVv2Hfu2yTXal2k6CdpnvSOO+WlfY8z2G2wbrqMhjSNyHdeU3Q/KtXWH2KX2MiR5s95zD2H
	Yv8jRx8FH86rnviOdjr/ELZ0fg1rK6Z0LG+snWndhIRLYC+VSRW08gK0f9a0MYvrSVho=
X-Gm-Gg: AYBFou3otPZV7Wz9An8mQPRQIQkL5fe/O/1yUnWKL7CofCCtbmymxVYPm/C9ycFqHxf
	onbzYVM3ZkCZJiOYn7oYYuVPI+T+dotgcDAUo0t+tUtI5OLeVjgH8O3aMxNEo6TuumQGSTEBoCm
	meelLuQTSzgqzkPR5WVkZJq61pU5rpZqk63bDqg1o5hSGv3h0DsuqczozI8h4xGlmm+k5H4e/xp
	bUNx8eDFBrLZ3MowLsLGiW1FXDhPJKmwmCX4Rx7ghd4pNtjV21MumyuDFyCYu6AR35xX/MNzmYQ
	B5bm7+cWBnPq/X2wUt1AKW3KhzJd173PO9AdESSt5kuzDpy97+FsgPWzgtLpC2BxN0MhtbtCh68
	AUMp1a/OVYMT+xXv+zZ/veSxiyqk=
X-Received: by 2002:a17:90b:1d8c:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39d70baf4acmr2943094a91.18.1788976920438;
        Wed, 09 Sep 2026 11:02:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8c:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39d70baf4acmr2942987a91.18.1788976919623;
        Wed, 09 Sep 2026 11:01:59 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm42727256c88.14.2026.09.09.11.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:01:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:01:50 -0700
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
Subject: Re: [PATCH v3 09/13] iommu/arm-smmu-v3: Support PRI Page Request in
 arm_smmu_handle_ppr()
Message-ID: <20260909110150.00007bac@oss.qualcomm.com>
In-Reply-To: <apujyBWK+COCa3Ts@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
	<0fe5f381aae307045e4cab97f8000c575f34a9ee.1788222486.git.nicolinc@nvidia.com>
	<178846311318.1308030.15663048615954357081.b4-review@b4>
	<apujyBWK+COCa3Ts@nvidia.com>
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
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa19f19 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=LiRWeZnokV1jdayv_KMA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMSBTYWx0ZWRfXwdm6LWsErnXO
 mICbVrkeT6nr4zz8JbQh075wmHKAA7T0mlAPEjM9Xr1PGFZP8boh08ULqTWB6mhMEbCIUq5MKWW
 cDhUvBq38Hle9NoXF8rmke4Kpp/3g6qIHMq6wCn8zMilbXxRmOCYSdrWfX3PCMBHIWg0q85XKHZ
 6pkqm70AFOkIXU0Dhd8LRKkKQLYptNavATfKMrmAJabV13Fh+gnoPYujJIdkaIRQRhLouaxhQkF
 JCveMZkfao7VghGHgEjaZGB31HXhdC6jfkMhnH4pqVvB0HvZtzVKpsVoqx2LueVQmqXyOQThcmm
 O7MFoXjCPrZTg+D7F0qe17TD5v4UgB7C/Bv1RaDRY+wYTBv/Wq2pan9H35dZAxTCnH/NvJe9k/E
 xxhReSlXSutI9p1h+7ioFG63Dp6SZn859vjmHDGlce/16FsQNIIiIvCk+MIEaiBARa6t8NXOnHx
 uzXflO8h1HAR0ZdSQWw==
X-Proofpoint-ORIG-GUID: 9napEZotEwQ1dnHxdt9_4minfKBvRZ_H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMSBTYWx0ZWRfX3kObd3eivh4d
 VFaTDE7Q9vKUST4oPir4r2obucjvlXztr2EQgkViA21kSoh/43oB1dAn6z/mCqmK67Z+EWA71j7
 Je6CzB9CXnSPYu9rRgnOmMbKXjIVVls=
X-Proofpoint-GUID: 9napEZotEwQ1dnHxdt9_4minfKBvRZ_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090201

On Fri, 4 Sep 2026 22:08:24 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:
> > > For an unrecognised StreamID or a master without master->pri_enabled, fall
> > > through to the existing "unexpected PRI request" log + LAST-page DENY path
> > > to release the credit per the PCIe PRI spec. Merge its two info prints in  
> > 
> > Either don't bother mentioning pcie spec explicitly or expand that
> > to a useful reference - so section number, section title.  
> 
> Dropped:
> 
> For an unrecognised StreamID or a master without master->pri_enabled, fall
> through to the existing "unexpected PRI request" log + LAST-page DENY path.
> Merge its two info prints in the path into one single ratelimited line, as
> a malfunctioning device can spam unrecognised requests that will flood the
> kernel log.
> 
> > > On PRIQ overflow, partial requests stored via report_partial_fault() whose
> > > LAST-page entry was lost stay in iopf_param->partial. Drop them by calling
> > > iopf_queue_discard_partial(), matching intel-iommu's handling. Do it after
> > > the queue is fully drained, since the visible entries all precede the loss
> > > point: a group whose LAST-page entry is still in the queue gets assembled
> > > before the discard, rather than losing its stored partials to it. Nor can
> > > a new arrival race against the discard, since an active overflow inhibits
> > > new entries from being written to the PRI queue (IHI0070 8.1), up until a
> > > final CONS write acknowledges it.  
> > 
> > Kind of a general comment.  I'm guessing AI assisted heavily in these.
> > Whilst I haven't found much that definitely doesn't belong in a patch
> > description, they do end up rather more verbose than ideal.  Maybe
> > poke it to be more terse in English language choices at least?  
> 
> Well, some of the paragraphs in the commit messages turned out to be
> indeed verbose, compared to my original writings. One of the reasons
> was to justify against Sashiko that often nitpicks on a corner case,
> (which surprisingly works well).

*groan*  I understand that works and I guess this is the life we live in
now, but I wish it didn't give me more to read! :)

> 
> I broke it into parts; hope this might ease a bit:
> 
> On PRIQ overflow, partial requests stored via report_partial_fault() whose
> LAST-page entry was lost stay in iopf_param->partial. Drop them by calling
> iopf_queue_discard_partial(), matching intel-iommu's handling.
> 
> Do it only after the queue is fully drained, since the visible entries all
> precede the loss point: a group whose LAST-page entry is still in the queue
> gets assembled before the discard, rather than losing its stored partials
> to it.
> 
> Nothing can arrive in between, as an active overflow inhibits new entries
> from being written to the PRI queue until a final CONS write acknowledges
> it (IHI0070 8.1).
> 
This is fine.
Thanks

J
> Thanks
> Nicolin

