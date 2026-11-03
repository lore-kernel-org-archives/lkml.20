Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739745;
	b=cuHHnXlgZ+6x8flUd/M/XaDlHwOrBy12eCbgZBv4PRu5qqmsUyWZW7vEYD9KuhcOUiKH
	 4Sq7KjANI8RLqTVk5h8bMhGQ+sdCyYYK6XkIsQktRMgCa5jGrLT6Kzp9/Ay9vPuHo4P/6
	 DFt17oc+jgxYca7OYlBMo3BpaQQ3GzwTLIj0mCGx8DcEXmqaqI7fP171JC23RM1KhKwUL
	 x9qJUVvs5Ssg00zcrBxEpGPegxCsZq8JbrkEJMOFFdvgH+a8sRDzj+ubsgiTWWxuD2VLq
	 b2RAv1WXuodqDjhyXurp6l/+NDASFdkC0T1p8Fd5tH0H6btqWX9/F64q1chMI6mDdYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7L/kjnfMz9A0ktTU8C0Qq6Ox8RbkPb5fZACdQWXlPe0=;
	b=tY/OgMXIIsmoHZaVhiIjbFhD67U0V8FvUUmeXEVuLj+PDdzJ889F/PBVL3YTSOAzEw2s
	 wZ2hcXOEbOJ2hcPH7zZcYJ+9jZ+8YvXSAHmqOBjkbPPQWJqngJPozgvo/p7jp0tp+SCei
	 WMebL8nkTLEp7QVe/aJzQCeW0MNhLQW4r/loSLokWYg3rk+KV4S8Fkr/oooMyJdTeol48
	 QbJweR0uvF9Mfeity5hF2Bic2G7i3xVJchVfqLfR/gpiH8S3g2vFZ784oZoMbr8RL/1J0
	 Fc3rlwMVVnh3Uxq84l/X3pjla/gteFbpYpMwaSpdwYS/8nJgLyc7Pu7YMm/7mYBCpYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JPiOdnnW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UulFl8sP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83766606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83766606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JPiOdnnW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UulFl8sP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IpioV3153406
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 21:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7L/kjnfMz9A0ktTU8C0Qq6Ox8RbkPb5fZACdQWXlPe0=; b=JPiOdnnWfA+/xFyI
	p2nW9Dn4LDsEyt3BDwjrQ74Imw4QivpB7aKbeapzNwoDLT1rxw4hZSWvcpO4G/qF
	L7sHNxtHvRHpdjWixSxng+oz9IAB8A0nVsZo9Di62/gBEeuyBSsQHC2l3Kp/1qAy
	V7CmWUbAz4Z+7QL22LsTq5xQdlc7Bnmxujh9oGJJWlWc4pkhfddiJ1VoygyHNpuF
	E3GRBPcnnVY0z4E3889Mng3st8diHFzMIdGY156fyWcMZXT19U7pPWMiylP150p/
	lZ8IMzEXN7qujPBVHaZ8vHfqubNZC7GvahSpiXxoF1f32u1990e7pRm+6X6OL/yP
	miP+WA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y0f15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:02:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so9898493eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793739744; x=1794344544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7L/kjnfMz9A0ktTU8C0Qq6Ox8RbkPb5fZACdQWXlPe0=;
        b=UulFl8sPdK9zN/hp0PaOhh+OOznGX2woJsFn99fQ/0uu8tworRqHNH+uNvpLm/idyE
         1m0ObdazIlqsFIwAyyZDqE/nOBtLJa+DeFws89xJifRAiU0EdbuQ8PPYKRwWvoo/cTN7
         4gyty5zjAx/flI6ZcDLADkDlpf/G9RMmjpCekHclL0Y9wVWOHikLA9DlAoke90K3d738
         ZD6pR/MH0M9AN0DWdKC2zRTHQCleH8AO+gwfVyCP3xmkc23aNks8wAjzUImvXBSmc1re
         qkis2nGKkuAWL+2YdbAEX1U9tsekt36ar5sd4DWKAsXzHMSopRjmH3qkjpNNQy9A/Qg6
         IWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739744; x=1794344544;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7L/kjnfMz9A0ktTU8C0Qq6Ox8RbkPb5fZACdQWXlPe0=;
        b=YnpT0eegM8ouxwp9g6h2KTJsCPfdGHWJoJvL9L8dOuS11/42UdnZQhaUPvGqGpKhbk
         nDbV9msPXYPFaOFoiDTIOSxeI2sSFW2mSkhUZ4PS1eF/YEpYIRGUlUbLyd+VPMkj/rV2
         0rbxWnGd93elP7vjGOQQ8093wTdwoBUmcJ3gy+OA6i1Tfs9vaIfBYn071/BzGRY0UBDN
         3ryTgsmjQ11cpNYJINIbGVFZmDqmCfF0YVvNr8eJHI8Y/fSsnMkzcUt0bQi4NuqBuGeT
         J2J3ZROQl2SCsGseQJd1hpn48bhWYU+0I1Ec98RMgXmcqIhmCnDz7EuN1Uoyy4isXFWq
         7RtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs+y713cTP2gedmmv6gBS76AS1ae/yP425ezbVWjn22kbSlMIcQnBfBM3GT96437qotewYsEtQdDYuX+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bY6I/5wMRCdQ+uzux46NVoarUcyl4UoztIbHG89C9lMdd1KC8
	sWhUSwwPnwzvIUaAQDgQYLMgn4fJkQwPr8IpR3UhfOYxLNOWiaRe/UbawO8pGC8cXq+vk0eXxB3
	iJYcqeMjYgovG4gvmzZ0N1m2K7IlJaRfy2kY+vhkK/l47M9GUIL+IzwvvmWIba2ztVoI=
X-Gm-Gg: AYBFou2uv4Qv8kPZHy3wecHXPH2Dybfkd3Esdvls64ukXOtL4y8qvB5MbV+v05anLrR
	b2jSyKnoqebVTo5LnKhrZj81FioTuLQAQLRoQoBDpiSOa3rvuNBDYriFgJZomWUGM9BP0YDwx8X
	58iLxQ9yEBn2zBw1xV0tVp7Z9hqMaMf7QMINBZnmRrzopTCafi3U8v9dYi/jdse9wQlhQrA43OA
	5KZAIKG2j6nYqnpB8elvjlIRsn2grQ1dmUEDQoZc5lHnRl4BifpaG5kUKwwTzpMYkWVR9F82raZ
	v0luG32fszZ/hGP3alIANk4qfKZQRwlUM2p9KZ3kNR2G4SQW950IFNo0B8suRq+OwQkdx0ng1/a
	ABpHM+Jh5dtMiDgfj89s/1pwdKz079Ks5mwJ0HOVdt57kIwtutt7QrHFM7XBlRW5tzYs5BPgFUx
	uX/VSTJJAwe7cTKfpNqc1ghmGC+g==
X-Received: by 2002:a05:701b:2094:20b0:187:efba:9ba2 with SMTP id a92af1059eb24-1ac5e8e1decmr22023728c88.44.1793739743611;
        Tue, 03 Nov 2026 13:02:23 -0800 (PST)
X-Received: by 2002:a05:701b:2094:20b0:187:efba:9ba2 with SMTP id a92af1059eb24-1ac5e8e1decmr22023667c88.44.1793739742820;
        Tue, 03 Nov 2026 13:02:22 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2de58sm1260017c88.12.2026.11.03.13.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:02:22 -0800 (PST)
Date: Tue, 3 Nov 2026 13:02:14 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, <joro@8bytes.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Will Deacon <will@kernel.org>,
        Robin Murphy
 <robin.murphy@arm.com>, <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Joerg Roedel <joerg.roedel@amd.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dave Jiang
 <dave.jiang@intel.com>, Dan Williams <djbw@kernel.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v1 2/5] PCI/CXL: Probe the underlying bus reset in
 cxl_reset_bus_function()
Message-ID: <20261103130214.00000b82@oss.qualcomm.com>
In-Reply-To: <auorjXgbVPXZNHZL@nvidia.com>
References: <cover.1793729707.git.nicolinc@nvidia.com>
	<6c09d2f78d4bb9db7f49fa14a6550f5176721121.1793729707.git.nicolinc@nvidia.com>
	<auorjXgbVPXZNHZL@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HS8uY8Btcr6EJXUuYinPzzZiE2Nxt9H2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MyBTYWx0ZWRfX4FKthXOs1bsP
 jXUeak7XafVPxdZnZrwtsyCiaEkuVYqJqOtjKxYsQdB+G6pMMe+QBKqLcN7ulWJJ2jhgVKw1SdB
 UZRLF4GpLVZM3I1aeoVcs1DXEG0aoC6E1mMQHPfVLAg4CTGJSI1KAOoI2xO1amrQXUcskRsgczV
 GFJU7Vy07vfupAW7Ql8wvZbagJB11UBYxeJwjXmPzikNyNwex15NeRYvAZ0vDD8mnp+ZF67dhPn
 K6ACbJLvGbyk06RWe4pqI3SOgSxZ6hDrq0OvasYm14VtHBAkqK3ZaeH4VzyK9RrwwcSn4okcDnc
 iCjf0JfoCnOmV1/aBUVa3pCClbUFLmiIUlNVJO2wYKQFYn0IgEOWtenEZmBxFVbLRDvG8/G/e3V
 vZsYqGkj9IhtmsDxsWQCs5KZCgIs06IfdSPKYIpUghlMxAKB7k9ETu9TLKM3PnoNLJRdVcST/w6
 TdwHRM2Gfs18rlJSjfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MyBTYWx0ZWRfX88aV+lEKwSzI
 9/hBMx339fMJ2Dqnq3oeO1ZxG/ocZcWy0tPj0paRjeub9A+zxgN/BRzvoneuBn7mDTZ1ilLSImF
 vZwLOS82xPB7SgGkGLsBw3qsWHE9/9E=
X-Proofpoint-ORIG-GUID: HS8uY8Btcr6EJXUuYinPzzZiE2Nxt9H2
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aea4be0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=Zdewuh5ThNVhPH2xqRoA:9
 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030083

On Tue, 3 Nov 2026 10:44:29 -0800
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Tue, Nov 03, 2026 at 10:33:43AM -0800, Nicolin Chen wrote:
> > cxl_reset_bus_function() reports "supported" to a probe after checking only
> > that the upstream bridge carries a CXL port DVSEC. The underlying bus reset
> > can still be unavailable, e.g. on a bus shared with other devices, so both
> > the reset_methods[] array and the reset_method sysfs node end up listing a
> > "cxl_bus" that is guaranteed to fail with -ENOTTY when it is attempted.
> > 
> > Probe the underlying pci_dev_reset_slot_function() and then, if it is not
> > applicable, pci_parent_bus_reset(). These are the same two checks that the
> > actual reset runs, so a shared-bus CXL device no longer advertises a method
> > that can never succeed.
> > 
> > Probing via pci_reset_bus_function() would not work: its cxl_sbr_masked()
> > check rejects every CXL port with a masked SBR, while the do-reset path in
> > this function unmasks the SBR before resetting. Such a port would wrongly
> > probe as unsupported.
> > 
> > Move the port control register read above the probe branch as well, so that
> > probe runs the same checks. That read asserts no reset, and a failure means
> > the device cannot be reset this way, which is a probe-time answer.
> > 
> > Also pass an explicit PCI_RESET_DO_RESET at the do-reset call site, since
> > probe is always false at that point.
> > 
> > Fixes: 53c49b6e6dd2e ("PCI/CXL: Add 'cxl_bus' reset method for devices below CXL Ports")
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>  
> 
> Ah, I missed Jonathan's review tag during the split:
> https://lore.kernel.org/linux-iommu/20260926001311.7c4be583@jic23-hlaptop/
> 
> Jonathan, would you mind giving another review tag here? It's the
> exact same patch that you reviewed. Sorry for the inconvenience.
> 
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> Nicolin

