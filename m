Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D34AAC59
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050875; cv=none; b=XZ38+pdrih3p3Z7Q/Cq04bIjaU9Acll3r+vst5B2mi7gbkYd5uknGRP5HpO1HLIl01A5zveol8nJjitKM3oe+YGuGoEDtyC5Risk/cqQCns3DpFkK01Q8uQSgY74JbVEbcbIGf8pO2CSWlGFlOL17fGWKQH7BlQjhi8s616xQSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050875; c=relaxed/simple;
	bh=hVteIZnn/KZGhwyV6npF3HFMEF8PGQ8W2HWu0o+zPKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmsA8KaUkqqLnpamYZ5G8OGdzIeaeXOWZ4uKN0sc0rWPOeRIeGmTBPI6AvwX1rLCtL19VAKDG9pT/oNLesh1JNfJzApJMErU8ecB071QQg99EhE2tWtY46jVK7EVBA4aMPvI5wPBJiJ6x2mPAmCfXgOUuo+bfF5BwSvjPMF1OW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUOJCsjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Px6kr8sV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUOJCsjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Px6kr8sV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6U5mY500287
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=; b=BUOJCsjsIAqYjHJI
	AF3wypISTszN5hD+N7W+fcozerWK14lPAXXETxlWb11U5SEVyHO/pcaU2dDcBtfb
	L//nsOQN1X4j1tSgtPbLKcSMbS1eg1p6CmFKJ9BgZ8SgrbHrqEGovvgNS0GszWZW
	K/jrfOmXFu0hg6JvTfXD64s5h9xg7X6BNtG346VVjeHhYMIrUJEsoP0JwsITp6xi
	9tha3OXTg8lKiWDA/TM4hikFaMe2MZKqZ/F4uPgLGVnMRmgtG/JoPRpCQ1uIY+IS
	hIKCshKsh179sXkZwBMGuPNbFnNziTtXIEWzd+R+CkWS9PncY10GOsjoq/BMKATA
	bkP3BA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf3w0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:54:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e818ca61bfso17800565ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050872; x=1792655672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=;
        b=Px6kr8sV6z102UhliOUl1fkIIc3wG4qP3hgJ6F1jlXuAmTidRVyHCDFNdgVX7jXp3R
         zpwXHLHpI7dueHMxIS89d2DM0BunsrrVgN+6oGFydby0wcUGxy0k+JlVnZWEZsub46KA
         FufB/pzHmNKnQ+MUTgSU9598rS8yY+Q54IRvw2U91U4mku0Oy7SEBABjkisYndGsxOGt
         GcJ/Qfm1zI+QszJng9ndGhSPcslj15u6vS8VL3pJRgwa7po4eiixcuvI5+ip7+bMoSW7
         dYN9epv7O4n6nh2qXUSeViEsSwL50Wn40EkFRHGrDKvVFEZtC9xJYclMmBT1sW2JnNK8
         PGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050872; x=1792655672;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=;
        b=idd4bOzoU9zDols9WIwRYTQLdi9pf2Lm33ZKIeZCXbVYZVA0IwhzDtmwo34oth7ZYM
         +8gFUirKQ5bCDdHmIh6urMSBA5dfizhYdDfLfiSrtU0HL4YzieSM6/07fD773dWxetzT
         wXrBPYwzAoTsMk2pcpbTjbQDfLAm+Uu8V8clZ67zwSMMnXDm2x3V8iY8joD4MQxEmlxu
         /4qYlpQwcb80jLiOAkxodrOwHIoqkvEI74Fe7DaIUF2tFBdDbEW6lAV6wZemXQM2dnf8
         91egY5TvCyv8hBsENz2gAYbXcuMTqITHsQ+1YtChQJ2fySe3m2yEp5QvKC6zLpGpeGmw
         2UDg==
X-Forwarded-Encrypted: i=1; AKwUvBwmWXQQxs7XE651+lpQo/7GbqnznjXwnr7YVvhLSCZzelQqkaNxE3OmPSDTcQCEgyRVz9x76Xc123LInqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT65Y//OE5FwKjsa3dzDYNS9hyeeKKhRYLyBHf//89fvorUurR
	8aFz7EXFCNaTAphd12U89PQFFWCGxvxoL26vRL2Hw2mXe/DWyraSGmXchscySzyzcHcVFQ7Byvv
	xMrFpJWIw6/u9xMMNP7uhEiCoas4HeLjRzcxi+91x9Z5rz+yCE6oKQpfLiUhGejkOapk=
X-Gm-Gg: AYBFou3xZzrqy7f/tjdVqOrhZVJzHJIUTfDFMeSG2hFYVLKgKBc85X4B4twPUCjKOw6
	nStdzJ7z52yFpMnjwLbkca+CuK9Z/CwaVNMTd4X4+i1MPNg+5Z+ZENgS9kHNN79p9hShWKL76nv
	gjKgzOimzXOw1hs6WQTMRIXt9I20gPhYnTxn4kBdjJw0HrILWfsoqZjyp2+HqFFphGPFTaS2vy+
	lFbb05PWzot4gLlzrHdggQxV6nVGCFjQ7L0/UN+czk286xZghSihj/oW0aYC5cHVS1UT2FvkxbX
	xDIjWBOYsyqNYQ5d2+frAl9L4Lpf4U7DAr6RXOCN37S3ZzCsceSBjojj0W8lO7O+Kz7Hv2uTqBn
	g/LyNoKsB6G9dKIWyS5O/LMLBCo0ypu63U+HAgEFGiewHmaSQfQhETxI7zkdu7IbEPXi+j1rd
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr57665945ad.55.1792050871826;
        Thu, 15 Oct 2026 00:54:31 -0700 (PDT)
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr57665605ad.55.1792050871349;
        Thu, 15 Oct 2026 00:54:31 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm76306455ad.54.2026.10.15.00.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:54:30 -0700 (PDT)
Message-ID: <56832d7b-e7a1-49c6-8995-4b17a442e4e6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:54:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
To: Jason Gunthorpe <jgg@ziepe.ca>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, alex@shazbot.org,
        bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
        mani@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
        kevin.tian@intel.com, linux-pci@vger.kernel.org, kvm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261011074514.515894-1-jtornosm@redhat.com>
 <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
 <20261012144835.GG14213@ziepe.ca>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261012144835.GG14213@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX5uiMdwUxlp9x
 rrn0RubUd+QIOmIwVF4t7lnSdFT8wfSYWKAKALr41Tr9KN3uJ9VLAB4ov6SsvewX4GE4PdCzKD7
 6IwK36blk3uausuwMQwp3UzQpkyRQpGj560uYPXSgGm5u+hoEJTF/ffT4F8glUW5W+6gwgRe/eg
 n6UCN1lmAStzUqTFv1r5imJ8f2kPzFCRAIypZUYkDh2TmHvdcLTFM11ELvKsQGYTxXu1Z/fyorD
 sLbUF0XC5BtVVYv9OG+8jOierWMjV647znrGkmhr36w1+qQaQQ/b/m9fEy1cz/e+f5ExImU6ysT
 YbuPDuGkVtAnIARqzpDD7uExXihQGoVYTja174AidA62HHbKo1O3Ya/JKtk64fnv1JPckd9H2hZ
 BuFFN5mtcrNOqrB9ygAjOQwdGXLPVuo4kvcTgrCFQFRUZzzR1kcQFWDFxf7yYJclST+LyjBINPt
 ADsVpn0q1F5T80aSCTQ==
X-Proofpoint-GUID: KY-9Tf58EYFOFOwCIEh68U6G1F7dSWPt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX3/W9PbBdTtox
 VW8Hy/m4h7dW224dtnA4fBZT7TGjpshFScz6n24ADmnscuP6cRY1yFgFFblng1aW7rd217iHcD4
 OcLDHTXpiOz0LFj4q6ohtxHXILvABLs=
X-Proofpoint-ORIG-GUID: KY-9Tf58EYFOFOwCIEh68U6G1F7dSWPt
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad086b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=n56IT1IzDtYYEsRGsiEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150031



On 10/12/2026 10:48 PM, Jason Gunthorpe wrote:
> On Sun, Oct 11, 2026 at 11:22:26AM -0700, Jeff Johnson wrote:
> 
>> Thank you for providing this level of detail in your cover letter. I've raised
>> this issue with the engineering team in the past, but I've once again raised
>> the issue with your in-depth analysis.
> 
> The main issue here is the driver can't use a normal MSI-X in the
> normal MSI-X table.

to be accurate, it is MSI :)

> 
> "private" MSI registers don't work for virtualization.
> 
> Jason

