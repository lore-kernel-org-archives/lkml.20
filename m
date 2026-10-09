Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3173D5C12
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529074; cv=none; b=goj34c3wj0y2SaFTCewpSRSiFME9oZeqmI6izEl/5YpcpjHz1sqLOjWpL9+oAuzhfAyE9Az/29pSrqmdhuHsJFS2XiUtyzdQPpjbr4Dtq4Mdy8D9z4D8VwmDnxst+n+gQHX4uVf0j5WUcz3koGqxpUo2twkpNS7Hhj0ZisPtHFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529074; c=relaxed/simple;
	bh=5ERdhktJIoJIo9p96wQTjyWFqT0l4v/JPHtR8HbIza0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LithYhdNkixSey8L2pwscR6S4H29J/t8zZAJpn623J5Kp69KxvpeCRcqt3gS9CToNgpy68N4NfpL/3EJOR2ptYCr1oB1n5O3n+qvgC+E4Tr71bSw9KIGTjXckok4Mb0Eu/48VdLiIqGFrquyFzHABXJ/rb2YK9yUSPGVAu0LRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RS5fKhv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1JnHUi0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RS5fKhv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1JnHUi0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HF8U3768821
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 06:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/i8NmI7i8KDIOyDpCxYcf9EtRiTu5EYcsw8myqPflEg=; b=RS5fKhv4VL+Bwy9b
	ZZg3psc2JiyKmybpRSeKfUzHjhdhSEIytJh6dn9LAI9W0FyL+Olr3mSFZquqtgoI
	HNs9a++2Da1inLUV/6Hvi+zP7jDRrsrbEp8KisUDYqgwDY+SQtmhb3nsPn3Yq2Bt
	9fXzxwECcYq1yWt4nOAR9VYc0LpYaqn3Y7CAxJv4K6x1xPH0LQ5kFYZwnuf6OIBX
	lDiVSvXy6/fhuQNt29BvWE4OU2wD8qUEVPg/jjop1lOzm3lHs72NbPBHMwGfrN6S
	Yy6Ifqi2KtmJ4xLO+hVNGXJXczJkKur9eCIioHRYEO1wxX/NYxJw55Br0HEQZ81M
	4IBuTg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2av9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:57:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0e92d64a1so1195016a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529071; x=1792133871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/i8NmI7i8KDIOyDpCxYcf9EtRiTu5EYcsw8myqPflEg=;
        b=S1JnHUi0BvHG/MD5gNpfSk+9F5YGxOsQeQd938lBGxgeDle98ZuD4U1p7ohPIKSpAi
         a31Yi2KzI7j1VuVF0CHGvGI5oD7S52/QOCNg9YpEFkSztsOBj66K/44bzlYPPhqGiZKA
         NlhKukG/HkulVdWgZGs1j0bl3VJse2mcO2Jbpwl6Sj5bFDXnazMXb8qO4suMNsPPQuaB
         hu9Xgr2FfAV4kMwpptMBvAY15ZdAdRpSEWtAiDQ72LovLJptVH+LMSvTEh0iSvJDyEqp
         Hpi+r/Uh4yXTNmo94zh0HqBKpl45wmC4hK8PmYktFBmFjXofO17TrjptNOdiN7MkjtOq
         NtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529071; x=1792133871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/i8NmI7i8KDIOyDpCxYcf9EtRiTu5EYcsw8myqPflEg=;
        b=Nz7jUvkiUv9sGsrxZzJwNA01zQRYKbAzFpiJT0o2MRB764/QL8S5WGw/++YsAOvbwT
         yGQvZeCppIv0cIioExdwhBUXCLWxTr+tY+x9Ci3mdCqqYdXOHty5C+SYoA4rLrQsObZ5
         n5/J1q10c623z2Dzkv7vrw/7cM8HxHkVPnBZ6PmcCHQnkKVNxzghpcyPj0HxWYAGRfcr
         N8PW0eBmycnDTUAPB8cM6cPS6a8onDPB3uPqc/6aNTAGHSqoBDlHI1SCoKIEBwnGEV5g
         OsjiovgzPKPrqVZwPOsZVgvmJB7qWLQlUFaA4pMTav6qFUaXrc7OImo3/kMgXC4cFs8A
         PnsQ==
X-Forwarded-Encrypted: i=1; AKwUvByxw9moZRP38nh/e3WVELH6RJ9JQNSLNgbzKt2zQ0iXecCW9l84n3FEuigl2xXlK94FoqGAlmrBVLNsZVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaqlTXIRqAfth7kH1opZXwQjw2M89uORbF93RZF+mUo5mCu3w/
	N8/tvsUaxd4iwYcAE8qAzeBsUoZH+aJ69141ZDP/k8+Q9v41rPJvKQZwf4UrnLZkMpP1/m4BlPR
	/u7K5P55Tdm2bt9/Sus3NOgkNjpPch7DCcGomPOg25ZaVgudkHJhTAR3GliDgD09G0IQ=
X-Gm-Gg: AYBFou15zt4OTFxqvAd4Wbh+UU46XvWbnGiiiMegW0mzvvIoQrb78PYj/8/PNlpGOW/
	Hf/2+8ZrwRVsBZZ/0cLXzPllfWuO9+miv2+/blLtQh03aVeMw23ldqsdfwEuYJeehOTcaZI+KHk
	5cYHJ7sEEx8o33OVk46LjspEimz9YxMId9Fh9MC8GFW6DCEOW5yVPllgyPwKU6W6E4As82g65FE
	aaSuRSx6Tr0FG9RcEXqNvLF0zWQuYIQQtB+nq7Pc2Kwgzlh7ZvLNrLQsNedEVgZJtn2RrSfgD2m
	GLXvWL1TqmcvrYD3iLawWVWcy8m2ajBPykowzp+CdjtxhZum3pvZMmiCgc3CB6BhlzH+2+VjoMw
	Tx32jCQ1S/vZOnDe3afxiVS4Z5o2QpmDERGeUWrcmjazz2ug=
X-Received: by 2002:a05:6a00:2b98:b0:881:66c:53e3 with SMTP id d2e1a72fcca58-896a3a512afmr968572b3a.32.1791529070842;
        Thu, 08 Oct 2026 23:57:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2b98:b0:881:66c:53e3 with SMTP id d2e1a72fcca58-896a3a512afmr968556b3a.32.1791529069467;
        Thu, 08 Oct 2026 23:57:49 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c310737esm514809b3a.10.2026.10.08.23.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:57:49 -0700 (PDT)
Message-ID: <e6213779-bed7-4484-a230-ff3508e8ec65@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:27:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: initialize CFR locks before capability
 checks
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Jianhao Xu <jianhao.xu@seu.edu.cn>
References: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfX4FFijnTAzh/7
 WFnU9NKnbn0fazY7O27MUGVeebcHakBmqQ4fmyJ4HXGM6LveaRYvJEJMRPuwlZP4dxYWTNRswij
 t3JvRlq5XQrlhokwZxKkacGakvEjkTlGIWlMrubpeJK0FdDOvBT5zom9qROZ515bV/SduxsVnAi
 Ha6PMI9FhWTDFS7+eMn6uszCzKpSPEmebW0kQriAI2urF16JMmp9bmJJX4YBi06CsDVopoNvLia
 pmTlRE0NfOwFi7OyEMj0U7Zp4cbUWkBi+D5Tjv8afZkbZueH8NvHAZyl6a4IBkX0jCF1flhk8bw
 3b6UdQSkWp9fi75gLeq1IjuU7MqzCoCnEFGUKyhjad5qtVt8mWQgH98Hw/MKPzSnZKiXWi8w47r
 rsAUa9ZaLHvhx1GLr7cTJsoy3zIwi3hiL2hk7V0i3nOLNoMXWeskqre3zKtl2aU3MsgjWPCuBk+
 JLoF9MkhZJkVHchlhnA==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8906f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=ZH9U8Pc_akMW9uxFS8YA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: xcQ41frx4Wg0MoiNgbDAAUFTimWeiKUk
X-Proofpoint-ORIG-GUID: xcQ41frx4Wg0MoiNgbDAAUFTimWeiKUk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfX0t+dQJwn4FIA
 WYV04MNNNyksbxkFgkHFi3ko14WX+3bJbgwwyMdbHwsEtfYzHpb6Wwwevcm0Cj2bsWnUYBwu4gt
 urTzgRg2LYp7lhOBKsPQomQlh9ZHJ1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090027



On 10/9/2026 11:33 AM, Runyu Xiao wrote:
> ath11k_cfr_init() returns before initializing cfr->lock when CFR
> capability is absent.  However, station removal still calls
> ath11k_cfr_decrement_peer_count(), which unconditionally takes this
> lock.  This leaves a production path using an uninitialized spinlock.
> 
> Initialize cfr->lock for every radio before the capability check.  Keep
> the CFR ring and lookup-table lock initialization conditional, since
> those objects are only used after CFR capability setup.
> 
> Fixes: 9b2e3b4ebec7 ("wifi: ath11k: Add initialization and deinitialization sequence for CFR module")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>   drivers/net/wireless/ath/ath11k/cfr.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
> index a91f25fb6..0708ca28b 100644
> --- a/drivers/net/wireless/ath/ath11k/cfr.c
> +++ b/drivers/net/wireless/ath/ath11k/cfr.c
> @@ -956,6 +956,9 @@ int ath11k_cfr_init(struct ath11k_base *ab)
>   	struct ath11k *ar;
>   	int i, ret;
>   
> +	for (i = 0; i < ab->num_radios; i++)
> +		spin_lock_init(&ab->pdevs[i].ar->cfr.lock);
> +
>   	if (!test_bit(WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT, ab->wmi_ab.svc_map) ||
>   	    !ab->hw_params.cfr_support)
>   		return 0;
> @@ -971,7 +974,6 @@ int ath11k_cfr_init(struct ath11k_base *ab)
>   
>   		idr_init(&cfr->rx_ring.bufs_idr);
>   		spin_lock_init(&cfr->rx_ring.idr_lock);
> -		spin_lock_init(&cfr->lock);
>   		spin_lock_init(&cfr->lut_lock);
>   
>   		num_lut_entries = min_t(u32, CFR_MAX_LUT_ENTRIES, db_cap.min_elem);


NAK. This can never happen.
