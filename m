Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945414;
	b=GjEh+2BfPEl33Upft3d7uOJLT/ZhNIHMHT5tlKs0IB8/H4ReISi5mNXwxHi9JRCy2tni
	 lhDCWmzbCGUlXwwHcOg05IuPf2mcS/31Z2ia1Zo7USqmugdcu6ea+dTCueaJ5hElroLyS
	 eINsyg3H/Ub9H+KpV2BAQa68qgrWh/4J5dyvTxgByLImWUXGCW0MsRvZrDb4xUaq2HYqI
	 IwcE9E8WaA7u7nBJkldwgtumNQjvBsPTaU1utireALjIyx+HvS9N8oPlDqOcxvBNGJBHE
	 itAGr89/HxJjZ1BcZk7UlVbsa5zjq3eWMBzh0cj7n+5a+iyoJWqR98TCY1JKxukHgHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cfhgcYw1GTNf9tJ9xwcwssyojAgfAPoozcw6noYsI7s=;
	b=PgeNyXCEJoz3pStEb66HSw7u3b2rfiKhfjcApPlnAzJxQrswGQsn3f7ARM6hDhiyY5Fw
	 ArJXUlajolGRTIZ7svm2SqKrOTmu/Bnon7v+NLFDmcXwr43prmmVhWtAVLQ0qByQH9fAP
	 bXobuqUJtFziZ51Zi94ZwPymRl4qRg3O8EU71p+z97ftMOwpZufxjf4duKCrTKi3shEWd
	 Zqbi1m5EebJMV84WxhSuvzKrzZL1yYUfiS9TRV55+jk8Ovlu0BiwTjc7bEAp5MykJGKQE
	 RD3RlVi7vKNzR4ssoSGFVvpG5QsbNzMbG7+jrJ0COCFcxU4+4+gGm0W/KuZVSM4ZTSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o5ZHE9Ny;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB548606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB548606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o5ZHE9Ny
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A64E9621235017;
	Fri, 6 Nov 2026 06:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cfhgcY
	w1GTNf9tJ9xwcwssyojAgfAPoozcw6noYsI7s=; b=o5ZHE9Nyg2lPahbCsMFLzs
	65sdTNcy7HXBMAlYHsn+Tf5ivwljbSXTVK81Kv1816TFYKePfZTwP7KaxTTcucdn
	4P20fH8HQdjJyYx8v1qvgRyqsfegUvpWjmo1Ts9Olq2ITGLoxGuQv3PRIYWrj/Hc
	YElpPbGDYPQ5NLKhr1aWouA2XxcAHNRPqoanlSDKSOd5u78cwNomJjmPTtiBSnR7
	OkJoq654bflfSTqf3Y0FRB4RAvgnCElTns8FE9VIBp0fx9CYzVKzXiZzHojuwTir
	2CdQMDokmSWE5xPmtA1Vg6WJKNhPtmu6CxYKValbqgJ31NeCA4yF6hMBjVR+H2DA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3rc2046-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 06:09:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A644uDs1566268;
	Fri, 6 Nov 2026 06:09:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hs7h10rtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 06:09:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A669lt729360428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 06:09:47 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1C052004E;
	Fri,  6 Nov 2026 06:09:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD3F820040;
	Fri,  6 Nov 2026 06:09:42 +0000 (GMT)
Received: from [9.124.209.241] (unknown [9.124.209.241])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 06:09:42 +0000 (GMT)
Message-ID: <fb22e9be-3d8d-4849-b191-d004f9b6c457@linux.ibm.com>
Date: Fri, 6 Nov 2026 11:39:50 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PREEMPT] Kernel panic - not syncing: stack-protector: Kernel
 stack is corrupted
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com,
        amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Damien Stewart <hypexed@yahoo.com.au>
References: <c485c31c-1330-4be2-bb95-447cefa82c1e@linux.ibm.com>
 <4FED0F6E-890F-4482-99F3-39D7520C48FE@xenosoft.de>
 <00f8e9aa-c3ec-1911-d81f-291d3c6ae8f0@xenosoft.de>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <00f8e9aa-c3ec-1911-d81f-291d3c6ae8f0@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX1YknkfaTX37M
 gUEgSc7Hdt16JovIGrFIXU7fiEa7c0LVQx7KLkk57SynDeFosRDV7FJ0d6FAI+NNpbkpkT88Gbg
 efMfiKvV4OeHKi/8P2tur8NDzirtUUQ=
X-Proofpoint-GUID: Oy-v3UDixcJFmcIrz49jVoclXB6sHuLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX3gFoqwKQRAAf
 pcq8OjK94IZkcETfvJPGpGyxhKE9cdmaDiIeKyM/hUn1gidA9x2Tv3OFfLPlOvYwyhdwRK8MFXN
 ZPiaQaWlRUeopmNW5roFel6AJ0n43N12CEuc7qQiVQMhcqOnjJGlD+Q6vK2ZCEBIU4pIi4xyXrA
 FaVGdJnTmHaswLR6V4GkdBHWP2OsbtBRFjhdFoCZMXRZLXpYLYt+5iCv2XzBGy9SE4VmxTIHfdG
 mSI4PAACSc1KJEZynnNa4G2NdCt1vjHzligyGJkwBENJlg08PfC40+9dfjFFWgw1l5VbyAAfA8P
 vwLWmeX3aIUYUXcUXFftvbtvCjYENtfswfdAmuvuE+fwkS2r8f2YztIKlN+kxoK5Mvl0mRVLM1I
 s+Pqa59/+mrf+fQXzvXjty/z14596jqX14mUFmf7W7fSHvsH0JfJ4/leuCOhMa8W/mq5x4M2Ol6
 +m+qA7GmNXmlMrJM8RA==
X-Proofpoint-ORIG-GUID: _Id58J2xOn-cElLCNLkZ_0KEUGxdx26D
X-Authority-Analysis: v=2.4 cv=CY+dd7rl c=1 sm=1 tr=0 ts=6aed6f30 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=8pif782wAAAA:8 a=5H1sMmDSAAAA:20 a=V7J07waerlr5GFXvOdAA:9
 a=QEXdDO2ut3YA:10 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

Hi Christian.

On 11/6/26 10:37 AM, Christian Zigotzky wrote:
> Hi all,
> 
> Ever since we enabled PREEMPT on our Nemo boards [1], we have been experiencing occasional problems with the kernel stack.
> 
> Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: srcu_gp_start_if_needed+0x534/0x538
> Rebooting in 180 seconds..
>

We had one known issue which michal had brought up.
Do you have tracing enabled or running a bpf/bcc program?

This is the fix already in upstream. Do you have this patch?
https://lore.kernel.org/all/20260921072151.35531-1-sshegde@linux.ibm.com/#t
  
> We are using the following patches: [2] [3]
> 
> We have disabled PREEMPT with a patch [4] again, and since then our Nemo boards have been running perfectly once more.
> 
> As the problem with the kernel stack only occurs sporadically, bisection is impossible.
> 
> I hope you can fix the kernel stack issue.
> 
> Thanks,
> Christian
> 
> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
> 
> [2] https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/preempt_v1.patch
> 
> [3] https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/kvm_powerpc.patch
> 
> [4] https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/Kconfig.preempt.patch
> 
> [5] Kernel config: https://raw.githubusercontent.com/chzigotzky/kernels/31c064092e3aab0875c47d44838443c9515b2970/configs/x1000_defconfig
>
