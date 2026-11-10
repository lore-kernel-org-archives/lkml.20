Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321492;
	b=32uzK3YQ7IQDqEq6hGxjAnDn1nVkQepUmC6maUXzxLfeXdwytdeoDim+5LAPmhQpdf48
	 AbdfTJ9a5Fzlpn+g4l/Ftug9kPYq8EI+AIbxygiFmLhHTZkjPgeasguguwQpze91AYkEd
	 0GKss0AA3g9EPp7rXzJiBi9rX3n1W7pIrqHNYr4O794qv3q4bQkl15sLRd9f9Uq6X7FrE
	 SZ57nKE8CHE4Kuvdol5TsRdVCTTbfWVcwMEd02RHVCN7sRzVmZW0tAPORq+sSG9hwDeZq
	 y6+Is6ip58xwd7+LWNCRTsjyUPkvz4A1MO91T+ueL+ZTEkbZwKJ3ov56vs0/IcvGGQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ig5ZI+kd6iU35YUUwhpb1qxrXXHnmsZuId8llNh8eYg=;
	b=4Dyc/6zSJuNbBv6oXe3ZVpnPLla7IZSkjghj/b7hxWfQFOJUK4J6PsFlozGziad3XaKJ
	 H0dGkmYwcjP7RVWDfdCnj3aQA+eaHmNKDRU+k6yll7l3bkDKWP2jlKqQl2RcpSbBYLGO8
	 GKqS6p3MYaL8oj5IVvOi/Psl89HbbtQz7F7fADO5/kkMRHQS41O/ldM4Jb8n62D89mHND
	 Ok/G97+6zTP1cTLSouHwaYpaOXU3/V3tiBVczVdJ3/j6TcGastnDMMxPyK6IThxDl48NH
	 k/lQu7xlBnRsoLEI1BbFiOQiMpu9k85+2XyKO6XU0UhLmP9RQNUQVKVY0SkjyH3SRxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nwl8C3gE;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C26E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nwl8C3gE
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABEddb2178313;
	Tue, 10 Nov 2026 14:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ig5ZI+
	kd6iU35YUUwhpb1qxrXXHnmsZuId8llNh8eYg=; b=Nwl8C3gEeSey0jJ+bLLbOg
	0IMzjJbvM25agPL5GyqTqpDgi9UDTJDFBaS8sl1lX5o366Qg1AFiezPV/ATtS8QR
	PKAyYwRWkv0XtHlTgvvCAR0e0/vHBH9aVPF8baQuLiCPfgokuC26/UKVYxu+qYyp
	MxkbKiZGyDaaR0TsYJfm/hBcVuWlATa0PQpRwaIOvG3wrkPL723q5JFOc8OJiYZp
	XSewjPD76a7f5GBkonb0qI9kGP3pDxtF5euSgLkIhaEQ44Gp60w5XkqJMyuWY9Ig
	oQRuf7G82BJ2cduNExV3H7wVkV/57MgIXK9Byr+ELVBT35IxxzGr0tW0YYgRW/aA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsuq6wbst-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 14:37:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAC74QA1731039;
	Tue, 10 Nov 2026 14:37:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hv309gf14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 14:37:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AAEbovp52167108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2026 14:37:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 030CB2004F;
	Tue, 10 Nov 2026 14:37:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E2C020040;
	Tue, 10 Nov 2026 14:37:47 +0000 (GMT)
Received: from [9.39.16.14] (unknown [9.39.16.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Nov 2026 14:37:47 +0000 (GMT)
Message-ID: <e6b47bd5-425d-4c8e-8c68-5a36d47bd977@linux.ibm.com>
Date: Tue, 10 Nov 2026 20:07:46 +0530
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
Subject: Re: [PATCH] powerpc/smp: Handle missing ibm,thread-groups in
 parse_thread_groups()
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <kees@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linux-kernel@vger.kernel.org, chleroy@kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
References: <39282c731de90f47678952e471236ef22e9d4b15.1794317777.git.ritesh.list@gmail.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <39282c731de90f47678952e471236ef22e9d4b15.1794317777.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX3wPolIrCKx3z
 eC2Is1llpoH8e7sHaXmTs8rRi6wggOnJG06b/y22Nqbl52ZrXe+U6G7W7le3/m9W7E5t7BEl/8b
 jzzam+vENMI9F1O01w37XNphHtC2ZBU=
X-Authority-Analysis: v=2.4 cv=HbCB3SE8 c=1 sm=1 tr=0 ts=6af32c43 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=iURFBnzjbH8NQLE5tzsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wG7wu85JICT-yZNSefg2kHbwI79dMQJT
X-Proofpoint-GUID: 6LmSpO9jS-jUVEUuw8-Lx1LK0yyy9v_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfXwFWcJGYgnnWk
 jzFuk0HNwal1lHhsduDMiDPjKxesny+xa3M87XOSPlRt4r4d+0xFoq/HPk/tiSKmWnJv3YQFfTk
 ukppsiI9BcdvfxRwZlO5vsIIp4zr1ozldRkpDhyHTk3Bbo01hnaVXznhi7QlRR5FnK6MPn+N8U2
 CMN0T0ZTdnhB7SxdNSJ3hZ5YvVwn3yNSKm5jVaFksr0rtrRKM9Y+6/ChiCQBWYfF2d4ygOBCCW9
 LRNz/6jYwI1lYZ3a4OjGOF6/lQUAh2VqkES5rO4RTLurXpVJTPD5qnSuWQ9aQLCXlu4/zd2J+ou
 sYY98z9ZIkjlOIE4KM9NU5G/WI5dVgGTVdx+nR1KRd9kkS6NsUHMpWHTdeGeAbfJIwDI9QATrQ7
 umsNTWzwDi+CioyHrlaZlm5mR2lV6zW0xIkgpt2Hg39e5QGRwcE0H0lE9DwKqt0nUuNF13UXq8n
 VuNMhul21JXkxCh3u0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100056

Hi Ritesh,

+cc nathan, Kees,

On 11/10/26 7:13 PM, Ritesh Harjani (IBM) wrote:
> Power systems can have ibm,thread-groups properly absent like in one of
> the PowerNV Power9 boxes where there was a warning splat reported on
> 7.4-rc2:
> 
>    WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x174/0x1a0, CPU#124: swapper/124/1
>    ...
>    Call Trace:
>     __kmalloc_noprof+0x490/0x690
>     _kzalloc_noprof.constprop.0+0x1c/0x7c
>     init_thread_group_cache_map+0xd0/0x2d4
>     smp_prepare_cpus+0x2bc/0x484
>     kernel_init_freeable+0x168/0x3c4
>     kernel_init+0x34/0x1ac
> 
> This happens because today we don't check for whether the properly is
> present or not and directly pass the return value of
> of_property_count_u32_elems(), to the allocator.
> 
> This went unnoticed because earlier kcalloc() caught the overflow due to
> check_mul_overflow() check and returned NULL.
> But since commit 0af298e62e5c ("treewide: refresh kmalloc_obj()
> conversions") switched this call to kzalloc_objs(), size_mul() saturates
> the size to SIZE_MAX instead and we now get a warning at boot.
> 
> Bail out early if the property is missing or empty. Follow the return
> value as documented in kernel doc of parse_thread_groups() function.
> 
> Fixes: 790a1662d3a2 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
> Reported-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/kernel/smp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 7a25eaa59e62..9a0f63e43821 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -824,6 +824,10 @@ static int parse_thread_groups(struct device_node *dn,
>   	int i = 0;
> 
>   	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
> +	if (count < 0)
> +		return count;
> +	if (!count)
> +		return -ENODATA;

This zero count check is not necessary.

Code doesn;t dereference thread_group_array if the count is 0.

...
         while (i < count && property_idx < MAX_THREAD_GROUP_PROPERTIES) {
...
out_free:
         kfree(thread_group_array);
         return ret;

Which should naturally pass to kfree which is expected to handle ZERO_SIZE_PTR.

No?

>   	thread_group_array = kzalloc_objs(u32, count);
>   	if (!thread_group_array)
>   		return -ENOMEM;
> --
> 2.39.5
> 

Nathan reported the same issue on QEMU.The same symptoms.

https://lore.kernel.org/all/20261109-powerpc-smp-handle-count-err-v1-1-e777fde7f71a@kernel.org/
