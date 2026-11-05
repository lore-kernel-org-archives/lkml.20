Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898785;
	b=ytL2iRJg+0wWALQHgAy7S5L5JmPp+4XJAOIGij/ZWNb5am+nfey41nx1sy1Y2x8gCIrm
	 unvjKlRW05iz7BN6oWerBERIfWL34pdbs/4Yczu2CVhWlvZhD0Ylw0SKYwHCsMaKU5u6c
	 V/ICiMnzETmmZLvzuQ3l0ieNf/ABIwvKgVOa9Fb6XRqQ3LuowoYvDo1no4+eLguc9HUH7
	 6TrlC8z6c6GO92Xuw/xFQurRiVWg+fov0iQKo4cdy7IfjKnTi9sc9Ac49hnWG9MoDFvoG
	 iI+Q9k4oF6e17qfNwKniiqWj8kVcmSf7SWR7LJRdxVjdsuI197gZXfZ/Iu1MymkIvqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=;
	b=COVUNqYFx+Nn7ylcCvQLnjFA7WA1ChVhCqP4+l3inh+Kyhpj7ofEb4yrTUpasiwwP1ZT
	 IoJ4U+Gq8GepQeAjXYSuggNzyiy5aORLjufqWJKjs81Fx4lY17RKjTcI+fOEVJw+cPJfk
	 rihB59ksGRM3b3QDJKyfkXGKzavOk5y7ZH2g6/VuaaEz6POe7q6nBzSIZ7W9UZ3jHsRII
	 zcEwugVPiROiGI1J7v2vSn+mcK54cXOiHOaqim1GN1isHMidFGIwwAqHRBkOJbAQyJ/6V
	 rcnQVP+9PjxvgBixYgEziotz7qWiHBUG3zCs3Xe9DRa7IwvJ67LWaufFjPgBt+mmRcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fL5Qr21G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GbyPF8Tr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE85608360F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE85608360F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fL5Qr21G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GbyPF8Tr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQGj22004538
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 17:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=; b=fL5Qr21G6LvfgZjW
	zB71fq0ilSJSJDDYmahlqNJAn47iJ4Q8KOAoADIZWv8ENVqZ0QHoNeV5gpcotNkK
	BQogGF8D0g5+09WrN4YZQrsq2MkGSvrkCmQ6CWWR0h69y3Wq1qizJWXI5qoXWBTH
	Z/qY1NGBda/BhFm7uREiIhjqOn5LBlgcdgg6BSZKpvl5aHNf1G+qcHkvyRtYEp/z
	IzGN1QiTNkniGgw2Woc2olaLOVXXEK4MJKTQB4wl29N4k0+hpncmdDpOr/PN755q
	l/ya2RNKt/E4gBIAMzwpIN+MbjuuraIyGodoxxEXyFk56/tGv/miyX4jpdPIoNXm
	1mNeFg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1uvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:13:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so7076876c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793898783; x=1794503583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=;
        b=GbyPF8TrF1MkxokA8PydVZjgCOzmxIJMDUvnf29RGe9KiLgmfxiSxTQ/mKBr2NR+pl
         kcwFGVEjsB/3FtKZcaQpDys9yBqW6hMleCVx5xQrpBlvdOxinvhrrvKNKz3tU3EW7b6f
         BrYlNQo5TO5mUBs3j5yfxMdR/P8YBNFBI/ga23RZijeF1fZT7e7XhvdxKcY3+FVbiVje
         nz5h+MYpMM6cQU4JoAOshtDlo3pMBQRnMXASM9d1FEFO1Y2eZd/kOpEay7zvhqVFPafb
         aOCgW7gylh5JbM97F1FS9/NCWSRsXdOB5OGn5cYeciz10fxS/vFaPYLb8nbjqTbqeuqT
         hHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898783; x=1794503583;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=;
        b=o0k/+PMTwTvbrHniQOuwNty0ThmVgoS6nU94SuMT0uk9dTh2BWFXPZXjsiDW2FgArL
         eKIEw5KQWtajlAgh6s1hC5fUJ81eXxZsLgmmL3W4hkt8g/WNltdlPxp1G5A9PbKvRuaE
         GY26j+ZZIWQYae2ICTZgHJ9U73GJlK6rvdIDBykq1ie9S6bWxoVqVi7ZH3FNnqSxMNK7
         VI5SHRGrkXMNDraXB9jU1wi55Fq0lR2Gsu3ocH6ethGQ8dWlj4ZIBbf9kgIHi3ORlYfq
         jdmqxgrbsUUuSkTkA8odg4hl7RhvZfxagxgPODVA5u3IrA0OpipA2fYLKgEmWcPdImty
         1gkg==
X-Forwarded-Encrypted: i=1; AKwUvBwf//2CqqnfX+weqAbvTNTPCmhfPXTHrH088hzPK02jVaHy9pveCx2CRAZeo+fdSwC/RWDhKGNdUsrf2Jc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HCsGTJuCRq6eurvhl33roFaFOiMA8vsiaZhDKPbqCULY6jIBs
	GUi2+MMyL0pOhyP4H2p3E9zpMrg5VTRcVMripeMDTgEIw2a0v1drTmEBIjWF+4+lJQB8ss/P8ja
	9MsZwHlrj13B+JogKQspG3rpHd1aOVLPN2WeHTu8D+JoUkhxGnMgdu6K2+OYj3XnKBSM=
X-Gm-Gg: AYBFou0Q6AQA8iGMgIGPQDoN8tGc5I22mFaTFaaP6Co9MAsfUScqeoDQ4TGqzzai45j
	wtVNFfcWLdftO0bBDDBk1283/uJvaSjmM/stG1fYhobShy8kmlClI8brQZIAAK4Ed3AIQglXgje
	3gXfvHTbD2GQYKqqrLnf0lR1FWrAOj0qC9hGVsgUvTDeGwtONuZF53i25GLoR0joRzIQcFZZaZk
	Gp09LBdW7Ulb5l7LnsGxCEUiD2SwPcooZE8VMmPyyrK2qVW+vi675vplFSBfGL1Ny8+su8GDdqH
	Tb++PyhDmTG7RcZfuaLqv7uuEQufQ5Sm81RjoTeaVsl4f5TNTh/pRpgB8hSBbt+GzKtVHRdbvcV
	VePEmR272R90v+Lpt/u743SHvq+Btedo4wl99a8YoM9cR2i/t3dII5lA1676d1XW70oGBKF2s7C
	gO9/CZP9tg+N+tUSg=
X-Received: by 2002:a05:7022:ea51:b0:144:c112:5f24 with SMTP id a92af1059eb24-1ac5b028d82mr27782430c88.25.1793898783332;
        Thu, 05 Nov 2026 09:13:03 -0800 (PST)
X-Received: by 2002:a05:7022:ea51:b0:144:c112:5f24 with SMTP id a92af1059eb24-1ac5b028d82mr27782388c88.25.1793898782603;
        Thu, 05 Nov 2026 09:13:02 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25100667esm9541181c88.19.2026.11.05.09.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:13:01 -0800 (PST)
Message-ID: <d9da4f14-4f13-4cec-b519-2c848894c35c@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 22:42:54 +0530
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
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: don't bit-reverse the
 firmware's PPE thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        John Crispin <john@phrozen.org>, Kalle Valo <kvalo@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        ath12k@lists.infradead.org
References: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX9/izJGWoJlas
 +oQqkcYkqfgf9nEy0rPNqIiXpuDe3eZPr0kXV3dGyUnDWSoFkM6fPmitflC+jQczVr2ZThFkjBr
 79BGhydogAC/m6gW256bu26e71Xdpg8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX1apQI456SGrp
 7MvRRp6e+K+7QbXHAKYw2Jf55+oFXJqla+9Re59qImUdlqsm4o9GYRpt49ktVhpFDx7ufCVwU0R
 RjZG3lgxs9P1LbqSgiNfMIUQqMbp685TMFqRZo08iK11BDK2uf5RrCanSA9ih9wrnOeOHQ9NNb+
 bl18r5MWP5BmCpHMj/IXFa2hVR+hezUGhrkGcgGbPwn36UWUbASRTYR8h9vG8r4m469CzfpQgLD
 PMxC89VIQlQUm7rD0BxZpASjM04nR4OU6kzFkW3+/U6cMYlyJykxmkC94doux//gDLulnzMRK2a
 WvVrfsnAKXkf3lenZWUv0WbsMoZkeYZbYc6JWQTLQZaVSju+/lIl8pNX5lSNaT70xGdZVTm4GAi
 FXOxsoI85S7aFj3ZrKWVtoXvVYGD6P/JCTe2PLW9MDeGpB+JvRQ8vESp/RTKo8xg7P8SZDM5EO1
 c9Am9lh5ehE38OEkhzQ==
X-Proofpoint-ORIG-GUID: 1IdiHi0g9OIhIvsWQ66G_UO0eUyozden
X-Proofpoint-GUID: 1IdiHi0g9OIhIvsWQ66G_UO0eUyozden
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecb920 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WwoKhXFDXbz0SCtfdboA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050068

On 11/5/2026 10:47 AM, Christopher Griffin via B4 Relay wrote:
> ath11k and ath12k build the PPE Thresholds field of their HE
> capabilities from the firmware's WMI layout with each 3-bit threshold
> bit-reversed (QPSK and 256-QAM swap places, 64-QAM becomes reserved),
> while a peer's thresholds are converted the right way. Firmware that
> reports 0 and 7 only, as IPQ8074 and QCN9074 do, hides it. One patch
> per driver.
> 
> ---
> Christopher Griffin (2):
>        wifi: ath11k: don't bit-reverse the firmware's PPE thresholds
>        wifi: ath12k: don't bit-reverse the firmware's PPE thresholds
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   drivers/net/wireless/ath/ath12k/mac.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> ---
> base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
> change-id: 20261104-ath-ppe-thresholds-bit-order-436ac99c5745
Apart from Assisted-by Tag nits,

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


