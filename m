Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260466;
	b=j27nU/idVh4jeUrEnCOnnuIS6bMOH2wXu1eNF+sgJ2SyXgYVyS/mvDfnCI3NbylsgHKw
	 MKSWrGpjyb1S76z6BGJN+mPZgHnDKKjJxW6CKnsubRIHflBJGcFCuiTAmjSA9xAS3UwfX
	 PycO7TpPMBUInJ64pNz9W4fokwyHlrntEc/D4tI8E5bdaOn668SfqB2OQgfC63N7iFwUQ
	 XHGcZdzqo+nyFbqZXDBZzhKcH5uL6JpQDW9sDNYQaYYbEuoO1vzVVlgosFGoyWVCU/Y2P
	 G0FMQn9F2G1miDjbyr/AJNaH8y2VAb0YjVTaT66VINjx4hFKqAuaMvx2IqRV9sWT4xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=;
	b=S20TwkhxFV/w5oU/Opel03ZPh5NkPlrbOshGny6w7UjfQHDZyBYhmpyr0sTPwIH34Wu7
	 ULXxko4EZpnzjvGS9tKAg3j7CRLaGYTH5z1FxjAA2yfVSlJGAWqp1u6EsMYpd8KH7tEMM
	 x8tXwgvY7p7EbCVBt7m3SBu5WuIjci312QT0R3zxnveqZ9nCNZ2fzJzZKqkj70Aa0FGOo
	 YUAKLn5p97pP9FrYXeyR4KSe/tOzYU99dXPGf4q9H1xPEPCII7nYgwlkpmoTN3W1/JcRD
	 8d0PLgU+hHJANBNM3qj+M1D/T+177kiGGL6bwgK/Ol2rcqUVioLvmrbX60iBehWRmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eURiKT3H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GK7RzmM+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4961606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4961606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eURiKT3H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GK7RzmM+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAILm2376842
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 21:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=; b=eURiKT3H8WE93c3y
	RkxVynWtnTDIP/28IS77ZbpRtvhtf3v4xO9TOJBSjlLy2e8JvTYWhs+3sr7l2tYC
	fjxvgWLS5mHOjjsgdB2HHFEF0tF1/eCqgT5chvgHDC2S0j5Q87vBGz/X+DyKPS2S
	cK+4Fe4WyVahPMyRa3iZf/ygbNo3+L9KRY0pQYxdXxa/LxTdPLHAhWzpmMWbv/wZ
	w48TN7yXBTJc9g+VUPj0D47w2iTxs9H5Cz3YSIF1/PTtUwpKNPkaOl9R/GHAIs0y
	DHn7el+YOKdPPZ2+OgRlgIdAIOJHbgTKaeBZk7wCmkglOuhP9VZMt1IBO9rMygyG
	H1wmcQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qt0qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:41:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso2228130eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260465; x=1794865265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=;
        b=GK7RzmM+9XbcstiUDzIg8ypo60Mg8+QgIQ43VSsg2oxOkbOxgWMhqLj63nkmApAQgw
         Q15TF5hy8E6Vp99NraJ3x2Sk5nzokTGBILUQWIp1f7YToN4YJokeFi6W7IPtTFE3pkgI
         hnySR0avAcCPcEiXZWgfE8ZRB2g6Fn7RRLTd7/j0NMkFb/l3HWozOAsU5GDRpeuGNrls
         Qeuj4r0CSEzSkXdYBd6VcXw3IPkte8EhJ2KydeVXsO4TEzsMQ/AcML3SEHGheZ74v5DQ
         6mdxlpxmnge/eVxPtxqvdl+RWyE/mR0HaXPta/z2xMLtU7Kr6MZlJm9d5eTJp/NhJOxM
         umqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260465; x=1794865265;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=;
        b=fuYPZfabs9qecLj4DKkbxpWHm+dahyCsvO7dGXJONvO7ZoldHqG0JcJg/GigJHurQA
         aKTME3A1xymAbd5Ky+B4Bwg2Y35VCelmuGWEs7+RSiHtLvT33DMVPwSdYC/+aHeZ28rJ
         f6qDgU3CI6nG4Yj8eABDcYwrftIRuneBGbK2Fkw2YV7+rgSVril60saggYYsUgmuG7Ze
         z/FhStDZvJ2WejZTcqFNbAiM8PPXoFkaylz4WOYu532N2GVB6v+AjNCeBaDsX8QR5qEW
         ihDf9W0Gq3Y6c/HosUsV0Qo0r2R2DTICbrojCQmXcMgxmuPxujmkk8IlZ8dvWjB/UF6j
         OOrw==
X-Forwarded-Encrypted: i=1; AL+hErHKzUJn3L/Ler/zly/JKBLf5IDpWPQR4vFU5I5ofEa21e5hNuJEgmk2MbKcsHAMyirK41A9Ky205UHaxt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sSso6615SrvT2XxEd9fs0+DCmfOljkrrB8a/540xjOK8LLHwp
	YLmkfKnq7CwITiACLUsq1RQXN23k0t7MPuPKmwuKoEg/zJZLpra5wxbCf7Q0wvHyyJkgOdwyF6H
	a5KThDkrTigjouRv50dgZ5GHTT179YS3OmC+z+8TCeR8WddJ6EN54RHNH+fug6pFcY2RLwzv0ZW
	M=
X-Gm-Gg: AYBFou3A+lFobf3qh2Wr8mKMcxqkVIlM0i9JUPoXHaf98cUbFH4mKlSb3LjcjCnTn4g
	EQ0PJ+Q3Yfva0+CQ73ojUx6D2gOe6m/HKUKp6gwc0OWy3jazM00kZuXbsG/32MQNIfbHscCzDAL
	J83iVYONEqY8oBNY3SY++IkVXvqPgoSMmvOzq0HU2o7vCN4dlxO19ON+bsx3dthxce33BPwHeLa
	3X2j3ri5eAqg3utivqVJckA8W9x2S0YwpPdffhZl0ATTiVkcyCWyzoUs6XS53FLlKhAsKzSlDPG
	hVwUjCeR8hlF9OJpBYZ0QKcAyCGEfCl5S/eY52pGE23fqiW/GylY7U0sbxBW8G8oveIKMljEbSu
	9LCSxuUvvxoDCooa4g1OuK2NDKAat2Ssyw8xj4iLICrDgsXgrPiVa+0gUjvl01eypaUJtpjybmA
	VEH2wcg77xcEAxQD5btOVUD3baj6E=
X-Received: by 2002:a05:693c:4007:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3751fb368eemr735800eec.36.1794260464470;
        Mon, 09 Nov 2026 13:41:04 -0800 (PST)
X-Received: by 2002:a05:693c:4007:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3751fb368eemr735761eec.36.1794260463774;
        Mon, 09 Nov 2026 13:41:03 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:41:01 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
References: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
Subject: Re: [PATCH] wifi: ath12k: Fix potential SRNG configuration leak on
 init failure
Message-Id: <179426046162.3811579.4898140189159012556.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:41:01 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfXxXnGG4M+Ad+g
 tfNSto1ZGGCdDef6yig4bggLxPav2iZSGz9j6/wDiGVWBdfdlJWz6H5I/uEjvaurX9eAiPox51b
 XkWl9CRv1jGzBHVsUpwu5hhasmq1wBj8E+sD+pgCrPoDHtxtkPazkS9xQbCG+reui39RX1nl2Q7
 0UUbUfvLUcWyUP/S7nSMts0Qb1KOVVZyQQPkUz4pzuUaYMRaBvGFxorubyM+t7VkAybN3f2BVSd
 RTR7Lhtvt0Fn2RS/jDhfw/1SqQ+zp2oveRkynBwA2SRm08J/T/alh6xg7psfHIqQxTGI+kyK42t
 Av1yQh1ELo/yGHNfHrOQGqUfMMdYKoY0lFMkMRPbndme8wSEJZo8Ktnz7ZsUfs19gB2k3yRdC/F
 JCvzSNmz6o9iMOihR0zSyuku8myKkfoObcVGfAvKx53N1/cbsujZ0IwcurNENMZs6FhQWphfmSZ
 +FGKeenDgYKFxxjGrvQ==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af23df1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1y-X7YYiyRxnpW_vcDcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: h5_IaXpNb6iK1bMQeiH36uHp_WEPlRbF
X-Proofpoint-ORIG-GUID: h5_IaXpNb6iK1bMQeiH36uHp_WEPlRbF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX0Jx0Ju9JtYO/
 tHE7iaMEPbePhPngyQxEYG8TOk5a60PAAOyW8NzCw6vUChzzI+ecFNPe/tQep3HxejK/6QOUm0J
 V2Sn65GCfsGyzVTeFo2xTm8UJB1hHCs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090086


On Wed, 04 Nov 2026 10:33:44 +0800, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix potential SRNG configuration leak on init failure
      commit: 30cd6ad81f234ee01dc67b1d1166db94078edad5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

