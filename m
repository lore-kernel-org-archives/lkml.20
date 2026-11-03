Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705308;
	b=xn79u12+Yh2akKIZEItkbxZq+tmQu6L1iR/57VNSkhf1BtWss76cfCnMZ5NI9/agqNGH
	 M/Xa8BIwXSNsimHGXING2UkmYjD/gexecrelbzmgcRPXlV3m7VpBxeYKUWTDRmHFA9yiY
	 LhRLYNfljLIIvQk1Re6TkYkgoSZP4D7/ROzw8Dw55vcccJL3QDEWrc8HZbWc3Vst8SHEk
	 oYxpgEF6j4nrZFjmxEo6X3/cT+/uxMV/ml9dAFEXkQFLd55mArwiBXtRPDJNqFpbwNJF1
	 rIwD+kO7uHrWp0n/rbPIhoW7Iu5tb05PVCTiTbZzlYu6YDvlFjUZGdr3SMx+AEPFonA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n1K8gFpZzIXklkm69VHcUMsC/cRmRqUO7+6aC1hGQj0=;
	b=ctAbyc0K1UupQ3Z4rKtASDjILRRWkMDrUHxyC0nxKKTnLLrPO/+MKgZPZ2AXmcWGwm86
	 igsPG1mk3rfJH9hmEGNw5sPhLkVuc9iFWc5BroLKMXkxQxczbyba4cjSk4rVYmwhikLuk
	 QsZQuQys8/WBPp/kRiBihHd2BBDoE8ZyIqK2tawBcxJse+zWxxKLAb5MBY8NU1K2Jg6gz
	 YgwIIUonlTWvAb454QXdH5Y8lglQL73uq9MgetV+ZKFrJMfKdO/JnF+AgsiAAjFZyPs6/
	 M70NTBzhaXU7alJll9+u9VWZVQF43TSSSSrK6pSKU/cVt88kck4oHeYxlHMJb+OArIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KnupJP/F";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0uxnspA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F57606A802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F57606A802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KnupJP/F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0uxnspA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AACfl3161603
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1K8gFpZzIXklkm69VHcUMsC/cRmRqUO7+6aC1hGQj0=; b=KnupJP/FW7mAWCsw
	aU1LVx4SL4IT8JWOW0VVn4IyZX9XVtf5/TByL67nDPHKbTxpTx/L/Pq5o+oMgFpf
	eUeUBFomC4sTkPQAoex78wyVeicqkBABHA1VgFCue47OdNE1T3BWBivoqbV5p6rW
	8BwSsRErapGQxFRxvMtw5q2reXZpnsAF5VYqXCH83hl3OMcAb4ph2qyxSdmsgSYg
	QRpYlHr3DA/PrOVZvweFt1Yx4hM1o3F13M/T/fsZsc9EAy9atUnOU0G71nnkZK7B
	/f4L9E/tvhYcQoZV+tdrMILWnn5oa+OfanSUWPfauXWQaEsZfm8DkEua2/wyAAjL
	TalODA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9a07j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:28:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so74288785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705306; x=1794310106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1K8gFpZzIXklkm69VHcUMsC/cRmRqUO7+6aC1hGQj0=;
        b=O0uxnspA/wos0Znj/TX1s2wyZcvF2X55bbuMbGegwatHE+Ojb7JufjEQ/iMYNfGPZ9
         36MC866H2qYr8RinQxsYwOWHzbcrlPhmD04gT4rFJ/Awe7+sPDp4Faxa29UKxCTQ3WS+
         jg5dlxEnUoANgfqWaLTvM8W8qtIrgHtR6evb48eCqMSANIL6WT6QimgP8vTaYUxjF3YJ
         g+RiDJa0VELe6xcelbQ1dguLjAmF3OTqQJyRbUFowC4jFleaFN4eOKLCOK/QRfeEKYWm
         ZRME5M1fe5BuUUT99lac7QFInazMwkLXzGyc7vV0xfVvDPims6o7TCSVPxbinOQyJRcQ
         cCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705306; x=1794310106;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1K8gFpZzIXklkm69VHcUMsC/cRmRqUO7+6aC1hGQj0=;
        b=BPe1A/AuTOIj40HFXp/3Gg6ZimY9Mbb174NPGFINNUYo4OOntbncUA0TWh9nceXnoB
         RkkBy5J6KCCEHnIetbnUumVGKC7K0PR2/F+YCjRoM2glCOWr16hLZpuaBR25czpEuvie
         JzlKm5/qc3e+9zXvwKyU/i+SZ6s3FCO+Ax9QNPM7tjE/reUEiYI9QgIx/RmfMkW0+duz
         HEcIQU8KRl6dPAs2imcddUoNBywY+dwCLtH3224azn5GwLvqMiqs0wd+2+ZJuaElUCz5
         0f1bR8kHhlCn+wxCQGIQgTgg8nV1SeEBl2GeftxO3yrY0sCPgoJllX1loZG/aU3CDCz3
         01EA==
X-Forwarded-Encrypted: i=1; AKwUvBxX2Qz3mXHu+9Ngkmb/5BDHb8N5hdCV8SCuJsE7IOooqu78inVem24N3Z9UUub6d64xU1AP8xefM8iyT7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dNprihR4GZD0bR22nBy3vDx32AbDZ5cQKaia3GSA8UpMaXk2g
	Q5+zLyMfpCThd2332ZnzraLrl1jiRdT0lM2VymJ68aXKcqKgakPSL52YRlSK/DIMNxj42fJRuxR
	mN88jhPMlrJlhRMfghBKW4y4l+8edg9oydgxALd1gvw5YhTwyF4FeGHH1HhajHSQQc7s=
X-Gm-Gg: AYBFou0l7qkwc8T8k4w+cEN/T0u7M8dHgUEkVaaOKC7947dfM++6CEsyx6YNBKUUwLH
	uFY6rcDFxjF5nJBzgKeW0TBvr7kIKCDV+tqZkL+Tpio1JUJdcCyy5329jAupvBFRdpB6v8tKsAI
	ts1U9BeUrRoqTCIVwbOgHgliW8hIaXvhva80CnuIfqcBhRh8K1mhvNcKi65OEGJZOX4540KyYAd
	+zCd1R/NXkOiaRRdBMU8VlHQU/R427vYp/QKy4XP657UUPXgl60sSHxcDmMxVvmToqDVDwIs/FF
	cjj9bEU8epOknECsBBMBuvbiQShycw2B2WfX+jHJmQEMiwlDLmiL9LM5HTlWO/TfTZQLziZf4GP
	+FgSZBkGBisguCHa0QS2HP7QddV/1nI8mdHt/wxZkbFdPgpI+cwEJ9Nv/OJgDIqy85LaqJw==
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr2278427585a.3.1793705306125;
        Tue, 03 Nov 2026 03:28:26 -0800 (PST)
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr2278423685a.3.1793705305627;
        Tue, 03 Nov 2026 03:28:25 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm3956570a12.36.2026.11.03.03.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:28:24 -0800 (PST)
Message-ID: <337e7d96-d45a-48a1-9530-909a00c0d610@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:28:22 +0100
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
Subject: Re: [PATCH v2 4/4] drm/msm: Inhibit IFPC for state snapshot
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DHXQzPrIG3N5qBCja3EM6BraaPgi4ECg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX4hvQdnTPerDX
 wcYx9v2kTrk5SPZTBF9GA1XQwO+O6rFs1gLjaAFBnHdhHJh0puR0OGJNkg/1jh+szP2OW2ZLybe
 reqDq3P8yeac3J7D/SjBNoo6VlNx1fY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX5epkQzzE8zIu
 TDUZI4999/oeI5DKrP+C1mAAKZt0L94Rdexju/EOgkks4tB0ldzrqtGF9deE2MLgvG4wp01DahV
 u2qmTuQGdXoeuEvdtNbg3yItQzF2MSSBxRwVjCypUYst+fMkT16k2R2jF+ephmzMAg9AGcIYJX/
 qQ+0JTUKJOPLfn5dTZAAEHW57Gfcf/SlWSCaXnO06V4/uoabO6JzReBFxTT3OkXlzyhNf9gKlqw
 HO2MB1Sxe2JrMB96HXIZvqvJGRMNzAH5niXgzTLcvz2wlIm609H/1FvBSW/IqE9S//1zeftlJJJ
 PQwwYeSjxuowBlBHcS/L7bbZLnz2hNFr8TlLWvbzDXPNGjYWSDYCpZuHHhhlouprfkm95iP0Un8
 iCL4o85/jnK+ZFEkRsP21gdhFJ7/c1YKxcRjVYZkRhlHCyxiPIYKW7qvAoPMbZ4Ry/1MHjCHLnq
 vyUNNAMx+YMCgeWXUkA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9c55a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DHXQzPrIG3N5qBCja3EM6BraaPgi4ECg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/2/26 8:00 PM, Rob Clark wrote:
> We need the GPU to stay awake for this.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
