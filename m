Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777105;
	b=dfA79cEISRHpZLZS6o+FzP0++BmDEhwMpqevsjdKIPMdxpxCScpvMPcaO/DjkMXhPokJ
	 cC1Q2Ja+mDc1tpylLa/5om8uxaoqxNly0Zt85V43znhQzHnYDdEV9s+PIghFw9v8CeYts
	 ppwGwSC1pBCvXzxpHbNX5opvwxiUs3qHX5Yni+NdWe3uxooFZZNFFq/9sO4ocW7KO1fEo
	 0JHvOGVZKc2ks55Fi3Jl7yvnU9oClfzNVWuvr/BfKrBhJyXw0WnfasWRgf+WHhlCVIzN4
	 bQGKiugqqCLpmOO06gyZS/mYA1eon8DP+LQe0Q7qqCY+HPT8uE+d8haeWvY5rR0mMPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q6oJS16sD1XK509mHnNdi+5JE7YY0ZS6BjwD5nrXrBM=;
	b=2lnN7TKcaZdLoq1dmYefGTuTdF53bl46YCyMnZZtaNlnMf9Kf8aoZIoQb/MfZ1dTjm9f
	 Qt089/6rpCr4g1mw3KFtp3b/8utlg0rD89pwwU0iml2uZT3OYenEp0TH2fMDp9F7KrZEJ
	 tRAsIUnjuGeROJYRiVvup5ZzGqG6C6D21C8zlPmaRFqh6rSkwC/0yAMlDKmLSvA+f93Fx
	 xz+qUgzogP1AAfKNYo6syfomcB5rmh2ZPMoK8Ll4l5b7WByNCqxPljizwl/+SsTp/CJC2
	 pOClA51TaVqdXsMN7KfveJSIRv4EIAKPwJpT5ma/82pEtIWpOoROFeoBVjvMMax8TlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6rJ+jfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZWN66Mnd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E04A606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E04A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6rJ+jfO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZWN66Mnd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A470bu8809413
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 07:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6oJS16sD1XK509mHnNdi+5JE7YY0ZS6BjwD5nrXrBM=; b=T6rJ+jfOnE2+2j2g
	lr3aTQuYynJag/uX7VPfR4CubnwFXluy40/bUQyDmLcmOswq1o0HLA98FcJxDQJd
	afwP9yZ9G442qTrZdQNpF0APHujlFwwNE4PGiz216t9KuHoI0K3kuyew/6P2QZpc
	DZdU1uAmoyDGk1wHxhaSAMBSm1IH6T9SZAd5lWzscMztnOEnGzL9bhfvbPNIkjl1
	o9tmDSXX1kxk1krwP5Bo5mTG1Q7beYSj4YxXBSp5vchi2hQ+Ioa9RTFl8DA4OZ27
	I05IYdIvmJw3sqySPz/luYhRFtvdovtBHOizM+1g4mtEePQO+4Xqfty31uGh1DrK
	9f2OTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpb6hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:25:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso851451eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793777103; x=1794381903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6oJS16sD1XK509mHnNdi+5JE7YY0ZS6BjwD5nrXrBM=;
        b=ZWN66MndWaLT69s5NOiwctWK6XDnySY1pBT0FI+1WVrMU3n8mSxHrA2RTcZnl3kFzG
         F3USAS0160+MjiufNgMMb+RwXtjcLLAUSjh68tWnPKqFFNd+ZasuF6BEARaqteKz5vdT
         Z2F2bFtmXCiR3t/hIYoMyZpBFLMP3CQZgcuqQcqSnfKyAuQI1vpPFQXPcA7G2Vsb7SDW
         hmihzFzleKcxkMGVJLi1ZllDthm07j4UR1hI2WIpJJICQl3wSR4n/0P5hgmrJYGNA0Ou
         Dcz5T8Mfy4LeZDTbfK6yDecM0yj6hIszDr0aVe1LJIIpUjkCM1tilabEMvuE7fEj9fFd
         iMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777103; x=1794381903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6oJS16sD1XK509mHnNdi+5JE7YY0ZS6BjwD5nrXrBM=;
        b=CxVsf3s4KLkqpwTMMS8GiiiEKMy72dH/GbbqLw5GjsAcwlZnGcKODK3kMs8l/erJkg
         GB2nTCD8CNbL1JW1XNQeOxih/3KDXkarosQxB6d5v/3K3HsGUr5KZaYI+zxt8rFalmV8
         ltGnDSscvjphtOuCEqM75X9ZZtHzXmRirSaLle1QwK2OMyYXNB5ndQ+SyrmZW/TArSsv
         xC/cnA5Teo/h82LSYql7zf3/xbFeuuvuKFMbckKUYRKd8wSkd0nshTtIwNMuQIRy69fk
         euCHa4q6YgGalhfujuBatG2vALn79YnEhnK/tTaVbul3b6gV98EoVA+Xjfb/nJExiIeu
         AEHQ==
X-Forwarded-Encrypted: i=1; AKwUvBydNEL2AmWdp/G5z/T0uITy5wf2Tt4WwSexyCbmpkUTFko6VlKg8Tmp6/3ZNaXDgIpQnAvw4t5YPADZCXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CZ15jt8nIUI0VGoHukOUEg09Dg9ShmnaODArp7380eSBmUW9R
	B77W0qzoUkBUrFB4G60vM7XV50lW5dbiSipBNmg/op799HVhnRqK4gVq4OOSoeiAjrkfeW6bcKe
	3IXHEtReLLwx6kd36NyfeNSg25wL2GwJWL72mpF6nGVChpvlB96s8j3WSJOg2wDQpP83oLsTVZI
	Y=
X-Gm-Gg: AYBFou3BYokPMJnYW1Os3bIlz0V8wvzNwp0xKW639grsDBjFJhnCRypFpDX010YVNWS
	VFQALYpLnFVtBItytWCsAjHTQCHbPuacQy8W+iw6eYGnWLFxtDau7D4UVj2LLmBJk9eXYMsI5nQ
	soHJHPvn/emhrrRRiPxL7jVqAgUvQ1+rsTsI/E15ZBVb18n4MSQsKgnBu9kttpoV+fLDViL8mj8
	birsFd4X/AoJkeCNb45XStUCThVfJnWvibDBzBHQZB/X53R5OtigHRymKzn8ZP0ARUMUmQFByXb
	CmtrCXFRj2MuDBL7jzO/FGeVZ2kPs5gtC4k4VTtc6Ci9RUSksTor0FQhhDNtnzVGpxfHOxet8OZ
	TwHpcwebdN3Q9KyaSAhf4ksgV2c9CgCUhBc3TrobOwAcJmudkspY5Uj+YYuA+yw35f+TYFvwiSe
	zqbbhqB+QQb+3QvyfQWT2L
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr23022308eec.23.1793777102880;
        Tue, 03 Nov 2026 23:25:02 -0800 (PST)
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr23022274eec.23.1793777102156;
        Tue, 03 Nov 2026 23:25:02 -0800 (PST)
Received: from [10.152.202.164] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm5422435eec.12.2026.11.03.23.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:25:01 -0800 (PST)
Message-ID: <2d508cb8-fc7d-4cc7-8c13-4b67989a81e3@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 12:54:57 +0530
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
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOSBTYWx0ZWRfX+Kd5wjrgaF51
 nycEo9Q5jXxAl0oTm7djJBn/kalTa2h/Pm+sE5llrzwkukEAzYf5lfq829u34aKG4TNg2gebwU3
 Ezv0Xz4Fk0W1O+nkxsPzqtCeOS7GkMnw2QFdH9AbQq4vvIZ4mTWPq0tr/HW4oKZdmDNbGxk7p8q
 Eq+UlOvySP6Bv4Oig8CXDmDwhLuGdl7bj5Tmcy2FEMnmQ/C/D/VrVdcbD+p1SYkd52hBP+nEXip
 PSYotprwMLpCSZJ6M8INIai8dcInV6TkziG/Kz2YJ0A8yJtztwGT0znqOjRKx96ghkASjbQXtN5
 EEQ7HsMrU5bYFyH9DH26c173vx7OpT2sZNk3MWs+h3ZiT0unqT/QiDinNNhLB/P1rFak1f1JrWR
 gW4uJbhhzr3xjeuwlMgH9Q+/WpH2fw9WWbqwBfj8UV4ufVWPkg+Otuv4W41zwQeqk+/1hcHXifd
 DTh4hzhU8IpV4XIleTA==
X-Proofpoint-GUID: oXc2Hls_eQy744S5pq6qPBjIO4wNDO3U
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeaddd0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WH3b8gmyxz3kVt_5t98A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOSBTYWx0ZWRfXzFRAhvB4v/R7
 iBWFFeIUPHy7i0WOo3cWt7BI+rMUAwVA3IfdByhIxWEVUyhodGo6zHkWb4r/KJWG2XmPpWW0nhi
 hnRlag8jV/nASWdWsMeKN6WP+EweJHA=
X-Proofpoint-ORIG-GUID: oXc2Hls_eQy744S5pq6qPBjIO4wNDO3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040029



On 04-11-2026 12:00, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> Patch 2 refactors the shared free/load logic into
> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
> rewires the m3 and aux_uc wrappers to use them.
> 
> ---
> Changes in v2:
> - Addressed the review comments.
>   
> ---
> Madhavan Ganesan (2):
>        wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
>        wifi: ath12k: refactor m3 and aux_uc firmware memory handling
>   
>   drivers/net/wireless/ath/ath12k/qmi.c | 168 ++++++++++++----------------------
>   drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
>   2 files changed, 60 insertions(+), 114 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
