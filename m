Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293647;
	b=Bs0b1FB/Q2n2FAtfBjiUDXUHyGObLexyvkVYd7UOhWnvSRb31iI8UFd2Ic5o4R5sufr5
	 9wMNP2cZXQOKBnlD/5paWSnbqvocbm0IZXfenKJP7jFQT++D+zBKDplIh3BB7qK5r2INz
	 fp4c4EGCnRggJzg4KD3ICcG2oGm1M61Hu5nCwkOlR7nDTfYyU6scxi1454dtFMhYKw5dn
	 AEOAxipFp9LbdDmYvl14GBo5EcDpNuzvGF1OfCWN8jaOVim/v+/e10hKAbvgPrPWyMXeM
	 N+qFqjMqlsHrJM2ofnOy+3W1j+h/O45ulP14/MQWeHdkPb9z+8INMQZ2jYu8gKvLrTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=;
	b=eXeVi45Dn1VOOTxCLEbhrt8sIriB65BjfYwhJeC8Ry2pxt5pdLNBaHcjzKWmmAlc/2m+
	 I7VhGSzn+K2sSba/fmXlyzpQx3UVTaIyrG3zhtidPBEwX7TJPrb2aOeiAtPIAS4nM0fXJ
	 0racMPdWu4uOALpF5n36cBBrq/0H7J0EEazJFiZFYSNFvu0IR/7GjCSNqof41eEN6mFZY
	 /R7ADAQNdUZYVu5G+q0CYrxorZU+SI5FxFl+w7tlqAX3g/isD4UpgQTei97YWYsklJAek
	 Cf2as22ix39SJIki9lsByP8FLxP1KiNhP/74CnokGMnnazDfE1AW1+eBsGvQsm5Wwcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bZITptod;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcH3WKTP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44696606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44696606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bZITptod;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcH3WKTP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AIIP2275742
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=; b=bZITptod6jUXEZTV
	RTmKSWH3iXK9ZY4xekxOzuhI4YdAh/46NictV+MLlFRS9mrGrjymC7KF5JGhkiLt
	D0sEPYUBt8o3X7sfWn7MlhyDoy40HOoXcxpRZN7FE0FIuu0/656KXs905NeatLVY
	Q8fVVXFhPurDlVTY4dCyM4EkdS+BZ9GlDdlehG8nwsKszfTmr4xkUML5ZYoU9b88
	/fhOm/iXPFmsPeubTUE8WBesvcI9eBH7vU0CFtpAsKk+hDNKt9o95bs3wsnjeNcV
	uBCHmbzdnAnnEpN69u4O2OaQ/3/FtMMv3w7zT+g0OtodHEkG6FdO7CuQIDCJcTy3
	bx8pOw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5bye9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:54:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so105042eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794293645; x=1794898445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=;
        b=GcH3WKTPUYP34bxKsoLz+3BdTriu9D4A/OqAo7rCXtqcgDKv75uNaPyqDDPUDpUxfU
         ojVRHxM3Vw6GWQ/AxrzMI/z84kyqCvYUPp3X88iR4kRLFWrZbVlX9kzBMxSJSBHSfJF9
         5Zpfpw86evBKTiHWG67oSa8ZDRtGaoj5JXUph/fkfwaFo3eDe4T4Wp18FP9vzrYhdj+t
         Hrw2Kf6Z+G8CwB0O697+JQVPtIY940J/hXwB+I3aAi9Kbhd1Hiiw+Xk2seRUXgtwfoCL
         Rbzx2QoQYUBpmxAF8+VtYgcz9YKRg+irdhZbJwWxYeDNFSNR1GtClrPWwGw0nacCkhMI
         7+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293645; x=1794898445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=;
        b=kF4wVVaxwO5jwSm6ok0hmDvWBacBBpv0a6UCN+9haJIdbuGvGXRHa30V21uM1+wcJW
         vcg4JwC4VzvebBMrIyif3IKzpfXNTvz/xLp7uwAwWNhbyv8CYSVO/zdRmzGYyHmVdoob
         KwI3FuqjYJMokPbaLgagAl1m/BNPWxAtnj8R8aa3na9rmaNsuRSiv+ZLWogDNg4aMNtl
         P/aFoIaOR+20sOCJkD1Db+rt87KjduO3tNa7cdiQlKxkLiq8xH02uDMZyM1Dyax1E8zR
         bJLX6BmmSAweNvx+oDoPIQcmr17rIvAlwHJjKTJiPLyBqLDi26/no7VZXdh7MU//BW3L
         gvKQ==
X-Forwarded-Encrypted: i=1; AL+hErEtCmTravvMmgaZqp6nXBL2CvitjvYuMj8uW2rNvjiPh3duzn22UwEyc/+/Eboo24jqHEOYWhnXvN2pq6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d2XwclcjMkOWl4cWczOrFKNrvnSmJWjZoN1P/SsNlYbpkn2IR
	ujxnCMD/VgeuQ0GjWmHFeUfUt9Y/lgS7pjTyvl60phmW0tTY7l4ufoqENcyMHMAnxKKUlImk0dy
	SO1DzkE179gXF6jfkugBNPa7+bLDahXpMxae5tcny3pBVh0F2QpRok7Wwl1pTG/tIwOo=
X-Gm-Gg: AYBFou1/yAyckCkLkuTbYxAdDCIr6FrPYl4BJljaJM2idUZ5PZ0Gj5msziVJsZ122IV
	S82uPCqOQ7iULuBlociyNo4otOU04x9gg+r9PTkphNDTFum5OQW5lpWwTJwEpIOI9vKxwlTw4lZ
	7jrhtAWkOdz4PQvRrFVVis5wK0WbmoFNXgYyUtX4hoZmn3ehStsoBenMb0HGzyqTnlTueLFKjjE
	nhu0lE74ZIYcBqKw/GiDeiXaZfw8ihjylGBoJqbel7DrzTBXMfweUecinfF8uNBh6j+x01FlytL
	bSh+AKDiPDz0BWX635YFM56o+TmJjcs+nLeTEzgWxn5Qadt5vPD3lYXsEjmwgBZUn3zg0xyRbyq
	giYNYoJPl9UEhk8lt6jCfbKxwauLrqpYn3KTkDApjVmBeKX53jYL0EzN7UxqN+VIRRlhTDdjEpt
	JNuGjB6aRXCeI4ZA==
X-Received: by 2002:a05:7300:6811:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-3751ef7fa4cmr2124978eec.7.1794293645024;
        Mon, 09 Nov 2026 22:54:05 -0800 (PST)
X-Received: by 2002:a05:7300:6811:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-3751ef7fa4cmr2124940eec.7.1794293644375;
        Mon, 09 Nov 2026 22:54:04 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm5190187eec.14.2026.11.09.22.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:54:03 -0800 (PST)
Message-ID: <e269da8d-f3dd-461b-93c5-ff4c81843918@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:23:59 +0530
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
Subject: Re: [PATCH 1/2] wifi: ath11k: simplify copying a peer's PPE
 thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
 <20261106-ath-peer-ppe-thres-loop-v1-1-f6bb5fe9ffb3@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106-ath-peer-ppe-thres-loop-v1-1-f6bb5fe9ffb3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 95g2Dbl7WmrSJa2-nyxEtrWvmmPiSZic
X-Proofpoint-GUID: 95g2Dbl7WmrSJa2-nyxEtrWvmmPiSZic
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNyBTYWx0ZWRfX6BVnC8+Y9W2/
 T/9NP7iN9doLWYBsgWO+l3At2iNdK/6G7eyQGDS560a1WcI21tla9P3V87S3zttkW6g/83o2kce
 dgB7xfLgGkIvmHb+sheFLn2HmZxHaQ4=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2bf8e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=_icPHbadw2IDH2Vg5WwA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNyBTYWx0ZWRfXzCyELclJbAN/
 A1PkcRw1VhD2N93sK7H4RTq0rFMv/05yh5o+BFzyIGvglnAJfWpeTuaCQjpLeUsIN8W0vUECEZ+
 xWQJdtN+kpMg24v+b/U1+o/izksxvf5XBZ84mt1nkeSjlaBonvjkSEiuRKMW7ephxZVwj5SG9M1
 IrsY0KYKKNY4wGwDFWX9aeEtkjVAc2OvZ1AjKnlmeKar58uaAGT8gp4UABBGle7alreaayd6r9d
 hzyVGjeD4Ga1aKnFhvezaSogJd8JbE+FYi+n1RtKeY2j/AT4zncqOK9XKd6Xqsh+6P3ryPvB9lk
 Su9rH5xZUtmP53hUP7DKPKNtIC4krW6nQM/lmg45zR/3sTHcvmqxmE+YvVAkhmTxQIfsFjrgjup
 u/Z1mt1lKV107RTzXUPpwjT8edZYaNy6Ivibzf2lbVrnlq2QswRFmh+SnvmtsPKqRVzPI1LcnMY
 +avRy6q3xZfE0ONn+jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100027

On 11/7/2026 12:18 AM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_peer_assoc_h_he() copies each 6-bit PPE threshold of a peer's HE
> capabilities into the WMI layout one bit at a time, shifting it in from
> the top: val >>= 1, then the new bit at bit 5, six times over. After the
> sixth bit, bit i of the field sits at bit i of val, so put it there
> directly.
> 
> No functional change: a userspace copy of both loops gives the same
> ppet16_ppet8_ru3_ru0 for every 6-bit value in every RU slot and for 2.5
> million random threshold fields. Compile-tested with W=1.
> 

this information seems to be unnecessary as its obvious from code.

> The change, this message and the test were written with Claude, an AI
> coding assistant.
> 

This might also be not needed as per latest guidelines.


> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d7ae9e8747233 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2496,9 +2496,8 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
>   				if ((arg->peer_ppet.ru_bit_mask & BIT(ru)) == 0)
>   					continue;
>   				for (i = 0; i < 6; i++) {
> -					val >>= 1;
>   					val |= ((he_cap->ppe_thres[bit / 8] >>
> -						 (bit % 8)) & 0x1) << 5;
> +						 (bit % 8)) & 0x1) << i;
>   					bit++;
>   				}
>   				arg->peer_ppet.ppet16_ppet8_ru3_ru0[nss] |=
> 

both comments apply to ath12k patch as well

-- 
Ramesh
