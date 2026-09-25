Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96B9414A1F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321721; cv=none; b=fn220uLtJRycP3mFaMjEZZIYiIrhYvIIKKVSmFMo6VEdq/BFxMQ6RI1yGdZh80nzDzfeytk9G8KhBekZMfo9BzY6rSlzLu3vBmtrxQUx16Q4c+9HNlQU6PpkHmN5k6bypWBLF/nnnYUTOXGd+6rOZjoWhZBh33oIes/IBhTBQeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321721; c=relaxed/simple;
	bh=Fz8r6u/KOmjkV6ITgP6Avse5b2KOTeg4gkwbsiDt5SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtQlRMqV77eE8x0DSmzSUcAEcPu5OARdgF4lhj31MNxaU0UbSGwgrOgINJjoZrFkZvRg/S7k0tntILdvh3WcHJ4mzGqpN91ZO+NdA60qNy2fj+ZCCuY16ujbnoqexEPluvmtKU2ZGSKkdbfrYJWhtKfl64BMKQeTGp2Atw6swvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CY2W+Ld0; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CY2W+Ld0"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4aBAn074478;
	Fri, 25 Sep 2026 07:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hX8RnN
	8fVOyfRwNU0/7XrXvhA+z3n1poiz0sK6NyJKA=; b=CY2W+Ld0IiiZWpDCZPCyTF
	jIEvaxCHixbyb6mPDZIynKV9cmUc6fxxkh9OKJ6nBnF8AwnxGaFzms3AvJ56q9vR
	IgNnAkAtDgsfAyILux15FRzKdfW8cjy/hjq9VUHbvT03rQsO4hl41luBkPu21GId
	pZJO6FQRmji7OGqDcgk0ZIYeNdwpEQQ1p6SLClsQQag+7Kau98mDDcVmKbpHFfa8
	f09an3dBVTG+l2u5OAeOavMcE+aOMhUMpfcQfDktundE30GDqg0TOR8aYfgicxC2
	nuQz3JOzUtfOPw7bMyIM0NseTmuv03LoFhLDbhKVNFP/TmvBSN0V2M1owyZfgPiw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskg2ww6e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 07:34:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4lSYK3296975;
	Fri, 25 Sep 2026 07:34:59 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gvb6qshyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 07:34:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68P7Yt0u12255530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2026 07:34:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F53E20043;
	Fri, 25 Sep 2026 07:34:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D519620040;
	Fri, 25 Sep 2026 07:34:52 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Sep 2026 07:34:52 +0000 (GMT)
Message-ID: <eff3cd57-7b84-4718-85ef-e1fa1c6ad4e3@linux.ibm.com>
Date: Fri, 25 Sep 2026 13:04:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/kexec_file: Simplify add_usable_mem()
To: Thorsten Blum <blum@kernel.org>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Aditya Gupta
 <adityag@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260916153149.127278-3-blum@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260916153149.127278-3-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 8qL7SxJu8cZW0Cz1l-gyOjJH6B_o5qaj
X-Authority-Analysis: v=2.4 cv=I43w19gg c=1 sm=1 tr=0 ts=6ab62424 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=CWq738_KyGOviBAlNwYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyOCBTYWx0ZWRfX5CgBkPzeRG8U
 aFTfNUBA+DrF4n2aiukvqOhddNEaseroLSl1ESNgtiAekzR5E9IJ3dnKGDj1TTNNDuzesOC/3+h
 9oESDbsqfBVsvIS6r2qMBhcxA1FlqM2YnaKY+4jUbzsnNNDsfOGH5Xav8S/7iT7ubsjbaZSRJAN
 20M3mR3RT2pxz/xBbOYjiRvbD3g5hSKOY1UttICPmOtiNrsI8wETaVvPLKOnfgfeAmHdKDowDW3
 v/loAFRYO1aJtaKg9OR5rMXo6H7q7idPnlPzR6JFkqMKir3gfXRJD7S3Kj9EyrYfsLejx526MZE
 TD2bnEyuW5iGsUk5aGj8ib47o1pwvxbut/G4D67W8274sxDYj9W3RZauOk1HeDGU7Yt3HBCZLWO
 kXG3y3qwJy8f615dLUuwV3zy4sSKltSZIdEx0v95Y23tShgq1DWBvk/XEBnymNndUmcv3yl5Zwz
 6q5rOnEH/UwAhydyokA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyOCBTYWx0ZWRfXwFQHq1gY+8He
 02ACJUoV5P8LvgSKBg+slyxkdfbv6gg0bPZPph6li+N9SKJ4kCIzlm5p+iN1mYLm40YCEdC7ENq
 2zjalrrklJhPaLOKe3/u2yqzgj0XmIw=
X-Proofpoint-GUID: I8VUxl_Ivpa24-xtmVOGiw0xTW4nCbbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250028



On 16/09/26 21:01, Thorsten Blum wrote:
> Use max() and min() to calculate loc_base and loc_end, respectively.
> Skip to the next range if loc_base > loc_end and drop the now-obsolete
> boolean add variable.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>   arch/powerpc/kexec/file_load_64.c | 29 +++++++++--------------------
>   1 file changed, 9 insertions(+), 20 deletions(-)
>
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index bd80c5fb1b1f..6162afbe919a 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -20,6 +20,7 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/memblock.h>
> +#include <linux/minmax.h>
>   #include <linux/slab.h>
>   #include <linux/vmalloc.h>
>   #include <asm/setup.h>
> @@ -104,31 +105,19 @@ static __be64 *check_realloc_usable_mem(struct umem_info *um_info, int cnt)
>   static int add_usable_mem(struct umem_info *um_info, u64 base, u64 end)
>   {
For context:

The primary purpose of this function is to add the given range
(base, end) to buf if it falls within any of the ranges in
um_info->ranges.

If (base, end) is completely contained within any of the ranges in
um_info->ranges, the entire range is added to buf. If it overlaps
with any of the ranges, only the overlapping part is added to buf.

The changes below implement the same logic with less code by eliminating
the ranges that fall outside (base, end), instead of checking whether
(base, end) is completely contained within or overlaps with each range.

So, the changes look good to me. Feel free to add:

Reviewed-by: Sourabh Jain sourabhjain@linux.ibm.com

>   	u64 loc_base, loc_end;
> -	bool add;
>   	int i;
>   
>   	for (i = 0; i < um_info->nr_ranges; i++) {
> -		add = false;
> -		loc_base = um_info->ranges[i].start;
> -		loc_end = um_info->ranges[i].end;
> -		if (loc_base >= base && loc_end <= end)
> -			add = true;
> -		else if (base <= loc_end && end >= loc_base) {
> -			if (loc_base < base)
> -				loc_base = base;
> -			if (loc_end > end)
> -				loc_end = end;
> -			add = true;
> -		}
> +		loc_base = max(base, um_info->ranges[i].start);
> +		loc_end = min(end, um_info->ranges[i].end);
> +		if (loc_base > loc_end)
> +			continue;
>   
> -		if (add) {
> -			if (!check_realloc_usable_mem(um_info, 2))
> -				return -ENOMEM;
> +		if (!check_realloc_usable_mem(um_info, 2))
> +			return -ENOMEM;
>   
> -			um_info->buf[um_info->idx++] = cpu_to_be64(loc_base);
> -			um_info->buf[um_info->idx++] =
> -					cpu_to_be64(loc_end - loc_base + 1);
> -		}
> +		um_info->buf[um_info->idx++] = cpu_to_be64(loc_base);
> +		um_info->buf[um_info->idx++] = cpu_to_be64(loc_end - loc_base + 1);
>   	}
>   
>   	return 0;
>

