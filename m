Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016122;
	b=zdtgiwwkotlOxpKITRpGFCeoK8MdPq6NjblbCOH18TDUjXV2Etuczd2nKVR22bXoSelo
	 5D4hJVw2vk/u5oHgeNq5z4zY0YzTLsts3fUfEIkqO2xGJrfHW6BbGxHnDPnazq+58vrbT
	 9Wr88OaGoZjO2bSSxgTopAKAeVWfmgRLLpOPe2uNqj9D4UoTC9STySKIDXoKnyjXuy4PC
	 sb232hL4FUpvymfQ86B5lX0vy9//Bc8iBia2Vme52dVvCIe229AylcOsT/HRZPg81AtBQ
	 +02DGRO4LSMpX7cVhYY+T2keTggEPZOUeZQ2KuR9Tjg7t4l4v4UqmzaECAwgp7H75PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6FwZpsfmJUNZUlkHboNK+aqwI7PKWRJo811Bw9yHhN0=;
	b=drPb4y00Cmg/WgZHrW8nHxARxr7MCZ58gLHpffc0UUEinuLG5yWgFi9MAOzAuRHANId5
	 iVx5F6vVnrnY9TGJ2w/xfdNMJ8lpZa9JyxG0UPY6dIU9lRD1l8hPSgNAMUjKvKoaFaRJt
	 uE1/8OlSneqM3+CbzAIDcEx1V/BGKTOcE/C5R5sQn7xhudkITOsjdItP4bAZhhHJre9Ge
	 Qq0qTykDOYDIhq9siE9ThzjFMoK1y1KUJNYLDhGl7bioD7Fp3aUh2ShUvX60WCo30L5II
	 NbKMwEcL/ZVIoorZYaXgJ7XzAVb0OF9Utw/h7z7IxgyuDn9An+quPSGUa/SV/l2d64Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItEGc5uu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIQH15v3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD7F60A3811
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD7F60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItEGc5uu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIQH15v3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt8Ep2733524
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FwZpsfmJUNZUlkHboNK+aqwI7PKWRJo811Bw9yHhN0=; b=ItEGc5uuZEPb/KGb
	EhHnE2Ni0IRkipvHjLuYd7Vrs9LtGXnJrR9MqECWpw6mjRrLbsGnFVwTJyque5Vf
	g1wCRxRhQhN3/Mgy/qJ2ozw73hvf30vdn3Zgz1zsRPKMnP3A+gfrKBRxjr/sFrs1
	1JR8zxvQOi123lmZdwm7kuNZu5I864qfTK58c+m3ShwcsH+QQpQ4DUcIJuuQUnwM
	sEdh7zoTvXgntul9ja69eZVwMSrOFqrElCp87JeKYctt8TgOXSxWVaDEX5Lax/uH
	cY6J5FIbc0qRTQuxVoq6D+CdSCfCl8+3GswbcrthaA25f/A57Rsbk5z4rjeZoPe3
	hG4+fw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8h18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:02:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988c723394dso100158241.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016120; x=1793620920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FwZpsfmJUNZUlkHboNK+aqwI7PKWRJo811Bw9yHhN0=;
        b=LIQH15v3gM7wnCbVuhLVvmkHBlxEBL8Wl2KWzZYK/KrKL2MOysHv7nwT688z9OmWXr
         +buc1oiHLmEBeFmpclkRVNkZmnQc6YGlrhxKRz4rCcsiYxtP3TdV8HG6YPTNQ7rEY9di
         F/4kICOMTUH93oqv/Wm7EYk3Q9FWVfdvBus2j9q/fcMRjIP3RRP3hyvlSWKsPcERvxBX
         Arf0aBY+rU9o07TSN4AFasGJQnYDXygoVUrb3gnHxv/zGNfzRnDGLgvCX5Zvy8peSGg3
         iMG4KxSckfm1hno//H3VEc5pbyFgNbDW5oyq3BKQhjS8k80E8EUVlg86SsBfFEs5qgQn
         m7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016120; x=1793620920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FwZpsfmJUNZUlkHboNK+aqwI7PKWRJo811Bw9yHhN0=;
        b=oWIFd39sNIlWudnMcgPCeRe+uaQBjowHtjSxfSfVzl49AqVCXf3UpC0EkD59q35Qk/
         pajr2xWvFd5N1FUYjqIUCmgcBSdDz5MIKNk7HN3WBiLyDwyOxNBGsWMunTBhYwLFlVFx
         GCqSSBEUycroXND70t1NM99ot3PtpfAbWG9xF2tmyi3eh4IHiyzMsIYShz0+F28jOXWo
         iSurc+8+g1vcCAWSmDFO3m3DSHchJKCPhd2dC04oMz9bYS9Cpy1jOx/P1X/TNayCsSvP
         2EsrGyyV248OB3lnJav4SIwBdAAaIQmxw4r0ksmkdGywdF9R/kaAheJHCCXDZ2GUr8M0
         AIyw==
X-Forwarded-Encrypted: i=1; AKwUvBxe3/ZvZSr17lPbRN0B8Qxc4mGJvkyX2Porc1poOIlbw1NubdhcZVOo6v15fFHSRrszBxrpLmWMddxKVfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdTupEbuJruxQ5Enci0EoIyzXsZTF/KPP0KjMekiJxu8cwDseF
	7Rw12JwIGD3iOPIjKJ8aCqmxRZjI7Q5+XEbqfeyl/ITaWg/E7FEU9Y7wHIYce5Rv4Nkicfe3g9e
	8Iah9gWHtfRQ0Ugl9KUDGA6l4u0dMPdlJbC/ft2rOwgv4ue5qkemi+8yp16GIJX8Tod8=
X-Gm-Gg: AYBFou3aSQbiDZvhdfOE3RFArAWTuImVlsT2h+5jKiTiaOMpjDp1UaiFpMicqpIdZs1
	XHAHk1/6xkTUlPbpOxKwcg5a2l2whZ9AqplagoyhGCCj988+WuT1P4Zy1Ee/Hs3trXKoHFVQKgb
	grXdu2tyzU97WVaW5l8VFjAoKuCh+VIlHEp35gpJsUCIZl7TuHKreNasEBk6T3AsmcF4iQvUry3
	MfiB9WqgwT3Z3aIiezTa/Vx7SYjJMETLmWclaNJj8sfZF9EuL3lpsC8H841kbZ66FaXvucM2LU/
	YbA8zhVmuLM0bnMWiHKlwiRzdCT2+m2U7CYz0/esYSSq4Hhz89k5PxpJkz13iT4R6yKyABD7TF8
	2dWlXcnMPtUDePhyCfZDzEA==
X-Received: by 2002:a05:6122:e012:20b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec22ecf6e9mr1504333e0c.0.1793016112279;
        Mon, 26 Oct 2026 05:01:52 -0700 (PDT)
X-Received: by 2002:a05:6122:e012:20b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec22ecf6e9mr1503020e0c.0.1793016106287;
        Mon, 26 Oct 2026 05:01:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46c59c063csm265518866b.34.2026.10.26.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:01:44 -0700 (PDT)
Message-ID: <9845762f-c667-427f-a848-ee1cb1291779@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:01:42 +0100
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: lemans: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX6TTOxz0zb71q
 obI1tBVF5QBqEVXJ2wOzM8Kb+MD77stHZVHo/miwBZrSC44C7XVvSaixw+1kmljy5KuPcnIGtNd
 bFcJGiCrC4DEnGSDz80LI8gHuKCV27gcqLAxdmf+8f44JXMxZyBKaGl2TSNqMUBDUCJXDoUa1Zw
 6ZV07uypatJ8JNqd0YQBF532J3ToWAeMMFfXh4ifKmlWTqdsM150GFmKlMdLdFpn7V+v1J9cqsk
 EzNuBzrzECwW5oe5b/FDM7p67veu7g96jNdATm5NGCAkSjQQFUwC3PcWsC6VWULk6es2MaP1vJC
 A1OQL0e538YkL+JL6Qoz0yR1ATIQX3Lh3w0dR6Ftq3g/ttzEPXCavefMvYtfXpv/tMLka92LLra
 4jhcn/mrG6JNw/aUDbivZNS+ZjLMMUNXmAnzOgXVjzYUNfPwp3kSKc5tMi5V99uSE6qncS9u3My
 iV2UEVy0i0fHQ23RUyA==
X-Proofpoint-GUID: 5nMy1wivEXqGnUmTWjgD7k5L63HMrG6s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfXwS5WQY1WGu4V
 vn4hTHBLd9ZARHjt2AuXg2zeFMeC2zbq9I4JuvUPi9kHe7yHddmAvEUPAaomNNqBxrU5/PEp/eZ
 a8BAJLJ6RghOO4WV0FtvEPVqbsa2wso=
X-Proofpoint-ORIG-GUID: 5nMy1wivEXqGnUmTWjgD7k5L63HMrG6s
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf4138 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=khcIRSTurGpjo1Y0ADwA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260047

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from Lemans device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---

The documentation doesn't concur this for this platform

Konrad
