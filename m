Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575962;
	b=2Ucjz9kHzsJQgFbSlgAf2AM7ROPdCG/Dc/56t11uKge+CaYmizAbmnROy6SXDYnDfdoi
	 JxfYvUs60Z2FGEYCzpNnARs49sr0yMWfXCjO8V+0ugQCBkEkaQNkd93hpedaJSyzVrl60
	 8KHLuHUi6mO0mpLon0liVY8LrmQwA5MwbRdZ6hppSWajws2kjroV0GqWbBRImoQCh5OsQ
	 l4DcqjnppEfj9+bcPMK3zki4GLYmyechgzdioLpHjlUkL925NyMGMlhyGMTyfM93KNi9F
	 Kk0I06LlvBziIAxPt3EL7aHktGewNoRKCy+bVh+Tk3PWwwglM7xTrvlorb3UmjZAr5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p9+kvjIHXZ14mZtQUS7aUqmnr3L7WL4yh3D1cUye5yA=;
	b=w+e1K5GHwHNxkbPuX/KJxII3CvARFwD8UBrnO/NXDM0IwLrT+U1UHYo1bTVlagaVzt9z
	 vTJbyXgkBNlFO8xtFYsZ0JhTEIVGowrwTwL/yVkhMZNKqM+HkGBHbF2W0xyEIlUHoEe+W
	 fYfw0zyES1doIOsZy1GQF+VCXhmWVtUxzXAb5TI9pEjQYzvZujAVB351/Gu7KKeh2BE7B
	 F/q37AGeoPAebGkDv7ykhsWW8jcxGvp4zVWJ1BH/hvSAV9lPS7v06IXMgXpFtIH7n+mz3
	 OVEqFEUHZFpvKUCwVUg8b9HoPdOdhR4J9HtBb8vx0EsIRi6OCCHXCUDhpiB8bCAn8Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkiSGV9o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eoWtndR/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96195606B55D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96195606B55D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkiSGV9o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eoWtndR/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJPVK1226943
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9+kvjIHXZ14mZtQUS7aUqmnr3L7WL4yh3D1cUye5yA=; b=fkiSGV9oMEBen73e
	3z3PXFbDHhaz+jN4Juhm/OAHGyzWR5THMgLV6/ep/4YcHrW3wBHscpFlSK5Fhdxh
	nIFazJ31SoXEVTJMorHr2ErEP+s8LrOPOUQYvsD4c5miz/yPNVQYx47NsvQycS9B
	VEnRCv8R39sk3fGti9QdSBV1F9E6KdVnhmmceFE7icoCcsEGGqS6UGp6WnyUXwLS
	FOKRYXbZavF1jbKoO8ENEoTAIkwsdxTG2V35l71vpgfXVg1z2H142jJGEr7UjzEZ
	0MyMmMCRHWAz/qDuUYaMXveDgAx8EzsNeSbnxbZ8ooSgnT6PPk8PHbonx2IRjXTp
	EEy5Ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp8f06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:19:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-555d08e97c5so30560701cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575960; x=1795180760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9+kvjIHXZ14mZtQUS7aUqmnr3L7WL4yh3D1cUye5yA=;
        b=eoWtndR/pXHgQ1aFoYbhBcQbb8HdXDBaOcfLERgPDIHEL3i30UFrfDnkZ5aiP52R/k
         Hev0E2E78bM5OEyeAB8Q4uQ6P/H43tjB9/wFrzoH0ukMhQJ2hm+PnqufIw1Ud210b6bd
         xkJQNf/fhiiwBa7daeAGdvhLdSVi/1WHkUfZjIyQVk7a8NkPdntus7V0Y4PTsJB5BuMl
         qdl0tJrZ3sDhUYoxX7rVGXwVv2zV/Fe1w+e+kKSpW0KNL+Ac7/MBsjSBiXgvhST2Jh3R
         4EVHujsxjHn9kGZD2KekSIXnSdhJblc9kJBjhC3tXDbCfrKiqfdCnNiqcOxpSlbs5OQx
         Vsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575960; x=1795180760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9+kvjIHXZ14mZtQUS7aUqmnr3L7WL4yh3D1cUye5yA=;
        b=pG+W9tMlk9B51d3kotvpxmP+G02X/6lSTYVY8zjgQB7WsZIEUIwoqS7s9bCIlMea2P
         yyM2pLGU4xI8NniYSpcbniXtxH9A9jspaUhMU25+rJ9fLi9LLi6BU0WgmoIlbYIRHnpH
         rwH9iuU71r9tWGi/cAeNgcnIeS1/JyRalBJ1+ntbbUfbIRPwVmQ3xl1LhSznfFxJk4JJ
         Ug7cSKth7HczNhZtUCsYThvBkGU9LGcVa2vWjtnw2C70QhmqsqVhvf8qneag7GJ0yIIS
         WQBqPt2q8t+R8oFo1RrXxEYTBWb3O5RbCf6B0tLOkzykEBbARiLJdEi5WY6ARj6m+PeF
         U8KA==
X-Forwarded-Encrypted: i=1; AL+hErGRKJOANDqM+McXmDq0Gs5mQB7GH7hzIoQtgUGUwfBeuf9lzxBsswjNQzwfLrigPOEhC5yIriT7yABpiYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m2IdXXhLFSWVkiLSLtNHYtQWmtoyj8jNxnDDqUVterwtyi40V
	4EJPbRVXfPNqizIbYMDkRiB5tjPrq13sB6SiabKMQR5qJHbc4nECX4AAB28QXurcI52KHqX28zs
	ebekiRLv60BN70PByQ22YnnD2lQ1YDV8gbTbBDpEerWf/+oTeoJ+uB5xplkl2MTaVx0Q=
X-Gm-Gg: AYBFou04nww3UE+FZXCsQJRImlbm+uXry12fWNgYHOC6DRX05EdHu6Pd7CFHMRA2hGu
	Syf9XZr5jz0nOyQ+65q5bv87KuYNT/HrdL6/6NcJJ5/HCaCTNGnaT4oWEbzN06FtpW4rxf2Pk6W
	x79FVKf1QV1GwdEYIg3QIaTI7X1rSZHby5qg/1Mk/g6Al0W6aAMwYrIlSg6j7N9e8c+2IAKg6Dr
	tmbDjMhfDJ+MQ0sf4J8zKrxFv3c/FG11MnJuCi8DMpf+21XHCHRMgJz1O/YgbApe0DjQFKXTIYZ
	r3EToW470Gw7cPZZa2akVKnWUPIPZ/AA5rvxzRhdqeZ2a5sVgujQUh4f5+s3HnJskXG2M+sRXtB
	S9QfGXu5Pj/30qd/W/2wCZDtcGRGXtMYGD+/VxMNBeq6LPrQENMWK20OJiD3E1aTVbRxi1q3un3
	NmNIs+
X-Received: by 2002:a05:622a:991:b0:542:d089:2060 with SMTP id d75a77b69052e-55ac8d8b5c1mr34890211cf.37.1794575959861;
        Fri, 13 Nov 2026 05:19:19 -0800 (PST)
X-Received: by 2002:a05:622a:991:b0:542:d089:2060 with SMTP id d75a77b69052e-55ac8d8b5c1mr34889651cf.37.1794575959180;
        Fri, 13 Nov 2026 05:19:19 -0800 (PST)
Received: from [10.218.9.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b11d9csm18250821cf.28.2026.11.13.05.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:19:18 -0800 (PST)
Message-ID: <146d6fcc-e977-41f6-b34d-f7a9a4283ee8@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:49:13 +0530
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
Subject: Re: [PATCH] i2c: qcom-geni: Prefer asynchronous probing
To: Wenwen Fu <wenwfu@qti.qualcomm.com>, andi.shyti@kernel.org
Cc: viken.dadhaniya@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111090955.3378623-1-wenwfu@qti.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261111090955.3378623-1-wenwfu@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af70e58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BP9H1aEygeDGrBmwyXcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: SDsVbcsdi3Ev2VJD5mMXdMZAGClNPJo5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX0GvI4zmf+3+v
 TYf1n1uqJNpNjM/7+lYNB5basiDU7UFsqyKRPj/f6V2Awn2azTo8x3t3Jvil/irm/i2k0XshyKb
 3qr1m8lQEkVFJVbuc38Q8oUjuXYXBeE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX+IpRNOFc++4P
 kUdROhD+dnAgZ1w3kc96R5qfoZjTjEp5ugTCgF7xT1tNVhMdBu+eV+M+Fo2/NipGneGgEaTOiap
 gdHJ9FfZTF2mjboec79gea0O3fcl97kUXgy9gJWvrjZspRp5S4ccNPi83OIL+gsW0ha2wptAdk3
 M6vZUORT8ZMi0FxxJBefbDYFT/HTh2njFojiyt4zCbzKPax9wsOuJrUowgJzfgX7XzPhXmGGnRe
 D6SiitCKj+LPcXM3/0oBeNFp7ujO2n/b4hjd1M7uaBErSQyG/I5EIAbrODu6L8Pac3GzVO8yIAM
 K5qjJDJUT8xIcgwQ0H2ht+uurLBwkDRMZuzT2xwgJgOBg21aQKPNASUdaZWorCcNkmlVHRIGMHZ
 yK7Hb69snAc6jGH7TNAnthw1OjD68nTY4wDQXuXkwR79ZtYVSgTTnVqRskCzG8tr75OHiadHcEk
 6bWINpGuRBNOG3i+ozw==
X-Proofpoint-ORIG-GUID: SDsVbcsdi3Ev2VJD5mMXdMZAGClNPJo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130052



On 11/11/2026 2:39 PM, Wenwen Fu wrote:
> When built in, GENI I2C can request serial-engine firmware during
> probe. If initramfs unpacking is still in progress, request_firmware()
> waits for it to complete, blocking subsequent driver initialization.
> 
> Prefer asynchronous probing so that other drivers can initialize in
> parallel while the firmware request waits for initramfs unpacking.
> 
> Assisted-by: Codex:GPT-6
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
