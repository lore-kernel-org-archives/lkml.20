Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842C440A28
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496121; cv=none; b=T53clui/ydJHbQKb8Ci+sXgLQa1sbkZBB8FZClc0+FS+yVSB1qZhBACyL199brhUkoRJRZURiHwhi73/ik0mMEXl7R2b1yzJ4bZ1uQgC/D8v5WVk4BmSS7zvpn9ZOVjyV/Kp68C8FyijcpFCQTzmINJj/sVrvVxOs2EBNTdY8Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496121; c=relaxed/simple;
	bh=Br0uOS1hjjoLwdqItpas3WKnH/cbZHDOQUl892KMCdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7HfTGvsFbOpXaHnk5R+xV7G0BybhNrjjk8uduCPhLmeCyCKK3YgxZt5nQhmy/e053PkR7P/GRj1lVD/fMQFe2WkPEjE9oYS6qFEpFMJP17l0op8Z79ZM7l2bI5OdDB/KsnjOfSpFBkci3cJzEX0PDjUDPYTSuPKwJwztWlvI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sf4VVuCq; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sf4VVuCq"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FI1ZCX3831659;
	Tue, 15 Sep 2026 18:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=uvA5/TO5P6M2Idzun76aKSR7Ui7dxa
	oPG4sX66ahxek=; b=sf4VVuCqDoK7FQEDSt+IONGJTetoikI08XcuAKQnYNg9VD
	VdXJtrpzh3O3dL6A28beHZJh6ww+E3tWA5QmrJj7rE+VU3ZL8ygm5MmckWBEBqc6
	xIoWWkVAL0P406zI344YrDpl2KP4vmnctwgtfROWbyASxHM/Rt/s7LTuCOMfcBMZ
	rmuwVhltwBwB0BL81k4UibtIOnjI0Z7cLLhr4JDmVf9dXqoYirejxioPmBwhEFLE
	HS4Z2DmzolDsPRLE+xc/hcdLZwfu2IjwhsAcIhNIVNpB3PGe22OgjHW5ykd8uSxN
	EPtQprJVoavsw9IkXEr7yaiCyOaTJ5DOg/7zjNvQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxdq8mda-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 18:14:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68FHphnL113848;
	Tue, 15 Sep 2026 18:14:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gpyxsaps1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 18:14:54 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68FIEo9n42402140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Sep 2026 18:14:50 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1FEB2004B;
	Tue, 15 Sep 2026 18:14:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5B4920049;
	Tue, 15 Sep 2026 18:14:48 +0000 (GMT)
Received: from fedora (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 15 Sep 2026 18:14:48 +0000 (GMT)
Date: Tue, 15 Sep 2026 23:52:34 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Geoff Levand <geoff@infradead.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/ps3: Simplify control flow in
 ps3_{virq,irq_plug}_setup()
Message-ID: <20260915235154.256e29f4-4d-amachhiw@linux.ibm.com>
Mail-Followup-To: Thorsten Blum <blum@kernel.org>, 
	Geoff Levand <geoff@infradead.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260914215900.84712-2-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914215900.84712-2-blum@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI2MyBTYWx0ZWRfX5Ix5HMNypj3Q
 yd/pQXofY8+OYzdfD9kcMniI1L9Ia+PTUE/CsQVAcVxXVS+8dmqkgjTM4rxWiZaPnhfKTQCBXZF
 EBlijAgHCT3MeJnRlV4XExcqQgH28Avm5OXU/0xd4X4ocwxctA1YijFvJbEgqQcRVZfycAdZpNH
 cOwzmWDu+ZyHzjCN6RjmUmVp0I0NNSJm3QHxvW8usHt9UVNEmKN3qrYPM66AXFudKCmquISYUKW
 pxCJ5BFXnIITnFHXNiYdidf/QCZe0CCMYx7vqwAu6UstJ9/FWzk3BFXLNb3We82d9ltTMu96zc3
 6HwJ5ti7jClSvHrc9KDY/9Q9fQENXqbEFKqKdEb4n7UPgul6gQUqx8Vp8on1qDiHat4DBGtjXDH
 JDsOpZGJiuO3uGjG1uq6Mocfe9+eJozv7s9SKhsV+tocmioeTub5wvRyqJGisefKrXQ5CKH4q+Z
 7wtmUTtPdx9NgaTNGDA==
X-Proofpoint-GUID: tH6YjG9xqc7pUooKYDQJj6BrSpKMbia6
X-Authority-Analysis: v=2.4 cv=DobDa2/+ c=1 sm=1 tr=0 ts=6aa98b20 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=d86c0OqMtwPQ0Kf90R0A:9 a=CjuIK1q_8ugA:10 a=L9aGTTkzY1kA:10
X-Proofpoint-ORIG-GUID: kxIfSZc-r_7RBTAsKrbHm9ZJ9N5hVPl-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI2MyBTYWx0ZWRfX89glYB6yDMXP
 xgpiRnEzudIwcOh3euq12bGMlr5uxVpk4gSt0eLa7oT5S8d1uo0F/nkbS5Xn3Nn9x5JfLgtF20w
 rf45L5vWvpTYeEkkreC6eZOk0XcGqJo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150263

On 2026/09/14 11:59 PM, Thorsten Blum wrote:
> In ps3_virq_setup() and ps3_irq_plug_setup(), remove the goto statements
> and handle errors directly.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Reviewed-by: Amit Machhiwal <amachhiw@linux.ibm.com>

Thanks,
Amit
