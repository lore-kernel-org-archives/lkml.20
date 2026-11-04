Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814783;
	b=C/CAEYBBcYQqVi1pWt2cAMvapfzpy9R3QvBYs2RAqmPNt752f5T9p7qSZkiSEwhYX4rE
	 6zFsvw+JeEvVj+hQHDAvIt96iY0LcHrP56Wtj5PO6T/Rgq6zMv05GeYo0jA8+MFelh0rR
	 uQoMw61lVVMhMbOih0Q2byRf0o+57pttem03Egux9uQNfB4S8sTYgQY7gtay9nV1Wv+eZ
	 losf2K29nYlY8R4xpxpfR9g/53bcD8zZWilKAv8HzkkZrKWarVCJ6rx+MspA5a6Upgl3V
	 8Pk6o5dwCV+TiJWRo3SzJlEHGc4/KyzAT6UWztEZHrIHq+3hsupAP/bxK3ekw4EqhkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814783;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UlkDDkfTbz08Cti70LM+lRTYxUR46151wY6yh2rnh0o=;
	b=XhwV4GQFh6o2+jcKrQiS3olYHidsC1tzRnWd3aSTbOvScXecdKOM3xsR2OEDnGJR1wrq
	 x8SCmIsYb07Z5I262EpJWnjuoyIrnUIR8UlWaWEY5dwWZB4+4rrn6AZ5c+/zier3BrhPy
	 Iy7uHOwcIkjq7bst5srRMZueCGDoWAXtAGK44oZqhjNxRSW2sTMbwf1LnPrLYUff7a2f+
	 nAGFIxIUsO0M9uzdtljYP70QF8UYnqDDBtaUAI3jf6P6Zf5vKjP3SeszFln3erXo2aBsU
	 eWmfkYWUNe41kLEeazGML0BhLaEgSQb7jxp0KxZmduZMuiKx5TXZIZJFXHRruNsSR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9IiBFKI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KX89ZNQ3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3CC606A7F7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3CC606A7F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9IiBFKI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KX89ZNQ3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjKpt2244434
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 17:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlkDDkfTbz08Cti70LM+lRTYxUR46151wY6yh2rnh0o=; b=M9IiBFKIN/aoZSti
	pUANlYWjEAs7DFWBmGf9DWmdUCLVoh5vHuTXUyzTvdcsrPp+WytdeZgVbL3gJjo8
	q44ig5uLIt2f6bk5Bt6b3X3Ws0ux8B3LON35bN2N9r8lG5nRokUdWmMzuk88fR31
	vVzSSBCoQqX5H09GKAQPt6fLSzyV3DIhm2xw3zaugz6ejjNU8hDDGzqxGdCsIF+J
	7RKrEU1B2cyqiILJN6NOrIFTdp8rFvXVet4/RHplpvEgTB2hMZMuIbdoyjC0yEGr
	3aN2QmssomiGyF4ChHK/50xJ4pu/YNSLe3hKLiAuTBfnI26Hoz1i5p+DeVbJsWVd
	jWiaYw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyhn0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:53:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so1093743eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793814781; x=1794419581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlkDDkfTbz08Cti70LM+lRTYxUR46151wY6yh2rnh0o=;
        b=KX89ZNQ3IR3kHf77SGV1HJZVjGFsC1oCHXRkhCgYKI2ybo/ZsFDHtAfKp1rM2lNCKp
         Do1n2s4pAykYXeiK4ve8quo6Tyatgv5dnLHKVukW16mOf1gWqMFy8oNzfOz9/haCyvJt
         bfZ+tS6MkHhfNip1Uis46+h9QUqP/AZ84KJtAf1IcP3P2qQuIN6SNoEUezXHRB+d0wL8
         fNywAekwlp6evKv3CzOjnc8dkNn2nxUPpb7Ur5OXPlZw6TKxmjGa1+DJ61OWl+uIqNKN
         hEiRSPOt5tTQC/09glkD8Ug8fmBj+5rlyb8MepoxLcQ6YENI92X31oRG2UgTP+8NCWy+
         WXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814781; x=1794419581;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlkDDkfTbz08Cti70LM+lRTYxUR46151wY6yh2rnh0o=;
        b=dDSvL4XERZH6GAfntuWOXAkhbDHbXtMEeeFoJFtUXEaZqfr0/NuAmd2cKSJh5ksOwR
         XLuVsvVw8MxfcBhEK4X4ag3Fj6Qr+x1IyVuneOAhPHh3GvG3mIpwv4GPmvdmK/f9qbmv
         IkYAoA/dDT8Fg1FZaZzotAV+mDMUqz2DNZggO1xzMAKHGNyBiSwxa9DjeLOCIQgGsqyA
         6rFZmaIUEQtcZPTHrFsXIwCigAa9rGy3d4aNLnZ5WiXEG+VOXPyGV5SbS5RhvWjWi9Cj
         RwVctwOVjm6v8frFeWAgeS7LSt2ufjk2gur4Pv4cwro61t6IicId2oqmEtN6KczvNZDv
         7cOA==
X-Forwarded-Encrypted: i=1; AKwUvBz5U0xBGfNp3zi2JtdxISGx+0OC9spA3uHWd9NoEhCfKjcw+OHaeXEkOlgCSWI9xEnTJqqdxAatYUdT0o8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eQMSG0EioXsZww5URn/G95GsbL+j29KO9mNgQO9sxd2JDGecB
	1x8Rdh6307m+qtIqFZ2GXaZR+y31Vn4r9G1jNtozvAvwhM+9l1cE0Gz7ZqJC1mK92Fsvmqjmhwx
	noWJMQeZHofKXHC7Wt+7c8DxGGgBq2ON2ZLYu0wpfSG101FXLuDIr3Yb7wTOoXlRXFEI=
X-Gm-Gg: AYBFou2Y5lAUI6O2qQzstO0bOyoZ1trXX03vLIJvBLSB3hCFdvdwQzPfhEZ05HYvqoO
	UOn+8rnwW0hB1xbuv1mX5L936jOMjrKOSdR2qgAcwJ0bShzHSyqLyZngwYvOH0KQUgs5vZjYeTu
	KRONkz9PSnBVTHxVQ6yUVXwZEMWsgAcB6jEiAEbej4W/vdlRN6bVZVe350xSWb4NfJ8gATRXGXI
	MDl34Ta3LQwgEfwIS2MJbcfn2Yvl5UDJ513DC8sC+JXB6KlT5IYsiMd09nPjqFedE0W21L0EO74
	JvacIBj0B4mBpameDaZOh/YQ0u7MPQyNcu6B7R6eSWaiZDq2Z/MvwKrifSpWU3u+HZac+2Ub97k
	6UjWHU8pus9+AJbxKKQi5ZX8GjUUK05MHvtxrXc+TjMBDwvCZw080KQC/1RbaWYPorDdB466PJh
	G1vnAgq1L/36PZC+JbZFAZ+8oZoAIJoGk=
X-Received: by 2002:a05:693c:8951:20b0:36d:f46a:87b8 with SMTP id 5a478bee46e88-36df46a8ed9mr73474eec.37.1793814780592;
        Wed, 04 Nov 2026 09:53:00 -0800 (PST)
X-Received: by 2002:a05:693c:8951:20b0:36d:f46a:87b8 with SMTP id 5a478bee46e88-36df46a8ed9mr73434eec.37.1793814779881;
        Wed, 04 Nov 2026 09:52:59 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm14147740eec.11.2026.11.04.09.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:52:59 -0800 (PST)
Message-ID: <d00469f1-886b-48d6-9b15-341d8abadce8@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:52:58 -0800
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
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath12k: refactor m3 and aux_uc
 firmware memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
 <20261104-m3_and_aux_ucode-v2-2-b6c335c14dfe@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-m3_and_aux_ucode-v2-2-b6c335c14dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb70fd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=YWIT4pjlzJolhlQAvkYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX2c/oO5pAEns3
 nya8+cKXsGzCVGLkBVqPG1sv/Dx1N8bgVTkcgNnCsl0goFqL47TpuI28NKpznRqf2zfUbY3M+Kq
 iekz8nVgbzGct/7fFomDMVgM6+vYU5ObR6IYvWZFtcZIStjUM5TWAELCSzN5fPtgSJscUIF5EJY
 S9ZDyPgmJubKQcQNWym9JBFfImxBwP+DrlWXLr5cg8oWQMBBEsWHEwzRgfkx4kqyjzrFTsXmiff
 lN8fW3zADOQON3QsWKBuJxN8hmGrilbBIHBvUgr9IUqzzA9VFpG0aQWfcc/tWhZbn/Y2KYRz5PJ
 nQrWGCFe8bK8qOvHUzsND6tW5LpMtALLSgNFi6/MeFD/CmJ1/8XfuavZkQvKgPEevQkTEb9hlQk
 2a7AX3vWVor7xidlHyiz3gBAbWX8T3QNCrF9SaMrstZCXo1br94yhXwkg1vNukIEHPPdRBqwluD
 r9Jekgeeqe1bzfdBhlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX77fZwbFLGLvz
 EwvC84D7pv5BQHGU9znDLuaA3rVUZUMortnuKElQwnjfalhzLTpDw5tEzBKGZfon5uMpZR6va/U
 IkygoFr9yiL/AvhZz1g18QvG2wuAO6s=
X-Proofpoint-ORIG-GUID: OjNkuOAHNeYDXrLVYKXxYwmub-tOPfDr
X-Proofpoint-GUID: OjNkuOAHNeYDXrLVYKXxYwmub-tOPfDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040071

On 11/3/2026 10:30 PM, Madhavan Ganesan wrote:
> -	m3_mem->vaddr = dma_alloc_coherent(ab->dev,
> -					   m3_len, &m3_mem->paddr,
> -					   GFP_KERNEL);
> -	if (!m3_mem->vaddr) {
> -		ath12k_err(ab, "failed to allocate memory for M3 with size %zu\n",
> -			   m3_len);
> +	mem_region->vaddr = dma_alloc_coherent(ab->dev, len, &mem_region->paddr,
> +					       GFP_KERNEL);
> +	if (!mem_region->vaddr) {
> +		ath12k_err(ab, "failed to allocate memory for %s with size %zu\n",
> +			   filename, len);

I've dropped this logging in my pending branch:
1) checkpatch complains about it since the failure is already logged by
   dma_alloc_coherent()
2) the pre-existing M3 logging doesn't trigger the checkpatch warning only
   because checkpatch has a 3-line lookback for this issue, and in the
   existing code there are four lines between the assignment and the 'if'
   statement that checks the result. had the original code only used 2 lines
   for the dma_alloc_coherent() instead of 3, it would have been flagged as
   well.
3) in the case where the memory is embedded in board-2.bin:
       if (embedded_data && embedded_len > 0)
   the filename is not applicable so the message is actually misleading

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=f4d0341946db1dcd3c36296d7577f2444cd7d412
