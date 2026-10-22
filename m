Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657630;
	b=eEVkwJb2goj5tSTckVxjPWYYQFRe556Czap3Io5Vu9XcI0xNcwzVm3Tf5y9n73eZfVEp
	 ouINhVzk8ryvVw+fqhShJ9KQhIiuotu1LaxgRoLHSoWHV/haY60UaHrRwxn2pJmG+VN/m
	 VbIxPWYCCZqf0fxsYEE2BinB0a7G4qEQK3kQO0yL6puARyF1sq98ydk4DHEMhVCVQVgQJ
	 ZVGGj+f0J362htDdkaBHObWiTPonT7gczwgIhrhhZI+P1KEPgJwjpZiNVLbaVI3b+xvtI
	 GATMknDY17faxF6/98TEEihzbsz7fc9O1JTi0PdPMHPsMYXHlF1hlWHKZE8VQEbAcjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fgqxS9x+QUp34QYI9MO5rz8NIdDGEyzpsmrDb5Pu9Ys=;
	b=O5fvCSiHwW0fJ2DRlt4m7NNqtvc5cCyrJjdJd/bA2SyWhT1MilmwYgqYFHbqNm/jFJsf
	 nK/a3pFquT4p25cNNn5h1A1VjCHpcu97wDCX4UelDIAONJcD6bHr7S1tHqwhM/zeYGWtz
	 jGfnHMwHkFL1RhHBLPpR6/Vo5Db5XFZD0bjBAn4TB4lHfWZgTbfBkJEUzGhuHUjTKMCW7
	 fvG2PIhpRMLSi4TYNPfC09lFVhQKK4HcZb/3+PiTJsy4PfcFgqOOAwJI8edtIbGhXqQOf
	 uXgEQe4hr8S8JZDaYNIm7pdL4VIsrcgyNlrQ9Gz86bSg+LU+zmjdxCsd2lz232Cl8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbnG0unp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apATCVoa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C845D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C845D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbnG0unp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apATCVoa
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M707rt3591188
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fgqxS9x+QUp34QYI9MO5rz8NIdDGEyzpsmrDb5Pu9Ys=; b=DbnG0unpk6sWpfqb
	IKvelYuVBi0BhugkYpcdHsRgZTKSLMa+LeObSiT/umhylgcTXscx8PZbPTwxgd4o
	e7x5J06rNzq1FGJHRy47TBHjyF9/9PD7nOrFIBgsWLmjsZSfMKiAjTV85sru1HYg
	rse1r0FdemHn6aWgtFbOH7it4YJY3givcAZuJ/RBtS8m9DLWp6mwjPcJ6ZufE5E9
	4+Hz9OIynMjXXSqX0v9rbgvF1qWGaYusRuSQ/c4yYpfhS3VpGz8xSIbb/9Y8teFx
	wVkLycmKEPIZkiMbY0nfaURhnbI6nxA6lumQQEGeviYasMcBkm9SpCuk2GNhXv2L
	LflWIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9d36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:27:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso47480685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657628; x=1793262428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgqxS9x+QUp34QYI9MO5rz8NIdDGEyzpsmrDb5Pu9Ys=;
        b=apATCVoaqScLP09u4VuOCOSRlqZP9FMCp89aT06cE4xge//ar39cLsAetCWgOqN8Th
         VrfJV56/Hae1Fn8l9CIEsp6Tbq557jDSwt+BNGHjPXVGraqdjALktSNm6jfPBRRCb8nf
         om9BGHNPQvMnALJ5jsRhhGZ17ufm2YBxoX3k5tk+wGvmUXyPiyv2AApclDVkB1lz8FEG
         OTd6zBJBml9TFGIKlSDSGPf7/seeyMY2iuSwsWCfvjVYWC9FkhHJvGyblUw/KmtTOCjk
         4ciNg7eiisylkvC4uqrjbwHQZI8BX9gW/OdK2jJ652rMoWpHjJrab/iOJW3DVRPtBA33
         /z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657628; x=1793262428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgqxS9x+QUp34QYI9MO5rz8NIdDGEyzpsmrDb5Pu9Ys=;
        b=BX53KLv+DsedNHkGGZtbnFvquTcQnObS28ACxZTRuFbLwGVdrt0L7RCGX8HH1rjudR
         hznMoeAJdI2gfAPfPkuqdeWuTzRUd0yiihOgnJ/9qy1/82yniK5+QR2QMEfpKJBVUqYR
         sOK3OcMECZ1di1yMMtYpRjC5bsou/aDa2YnJa3Ve6f7Dy95vi+z0Sju5KF880mhdtFcb
         liAkXs9OcsCTcutIi6VxybHpcxcV+mfJovxB4u0F9adtccbKvt3Z8ttefSfPi7W+8YGY
         bnfqPff9nfNuQzkg5Um0UZ+QhBgOsW1SC8KZtHvUafzbjkTaYAb3IYcYsGidVKtXphsb
         g+gw==
X-Forwarded-Encrypted: i=1; AKwUvBwdS/wYN50uSvwEm4ljhEQtc0y2n2rxQGZjiUhZ/cenjfpHtgcwsGTGiyuixqjsr8tgOQn/JXoHnz8Bv+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Cv/QhOnmI1EQyLvLhLHh7sjHdUttL9tsd0T5t7gCp0nQZkuE
	uyAUWlkHsYijKR24h+2fMrXWgtdkQlWWXyiNF5C6PVmE5V87attpkIkD25/fM5TFRGIrz2Uwf/P
	5mK/5GpPC8tYhZFMDLk6E/saASDO9svvHtOnd6JpB8PAfezDfu4XZuGycZKnFmapY4Nw=
X-Gm-Gg: AYBFou1E+N3pk8y4LhlUp/tvLC/PejfhzCnklYK+ugrUAFc0qkeVjZW9WmfvSYnJF3z
	Pa/00p5Hz4aknAHn8g3OFMkysryG6SGjVkAS+P/7/7LFIyMtpUWGtn6MItol0RMcPMlfWipGQmz
	uMyVflUqM3z9zORIpHWJFcjZdWKtuPHTX+HPs6+Aqif5fpElFfmSgi6RYcEHK6N/y5THahy9uDn
	holoUXmFs07hx7/FWQp8Yfnmr8VG7tN6cABt+jjZri6tOEBvI0CRQFQ/Lq7rkenWMD6DvNbb5Ys
	rV/F/rceqi8evNrXlirPESZscGDsc3Pl5IEt0xytMXHMd9tmzLWWMRpPdzJEfzSl2L4v6vHTvzC
	bMSwEq059UfekhINFsPqQgw==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr971932985a.3.1792657627904;
        Thu, 22 Oct 2026 01:27:07 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr971929585a.3.1792657627400;
        Thu, 22 Oct 2026 01:27:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61a2bcsm77995666b.87.2026.10.22.01.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:27:06 -0700 (PDT)
Message-ID: <1c8f4222-e7e3-4b10-8826-60de6dd89a61@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:27:03 +0200
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
Subject: Re: [PATCH v2 13/14] drm/msm/a8xx: Switch to generated protect regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-14-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021204244.67160-14-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX73kQoK6MbevP
 w9U7TKsJJFSv45nzhMHMopEbHl5rWt/c5kXleMvbcvcDmTHfr5a52rQyLupgklb993vOrIapCuU
 YJMM754bmmD0AZtpB/P1YjGhiOyeohE=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9c8dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0S8MXAzXKKfm4D3irQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0poEgk1pl4Yf9QDSmRrR53ehjG2xG7V2
X-Proofpoint-ORIG-GUID: 0poEgk1pl4Yf9QDSmRrR53ehjG2xG7V2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX2Jlzt8bfxfUg
 KXPXSH3C1PZayxMfkxuVsWBIA3ZIKBKotvCeFg/iZ5g6qVA4wv8WnGVCC5gUEcMhAZc+pVFW5nd
 pWlKTHBn0CH04HZ6aiJX28RJD8hAMpxvzizzqWWWVCvhc16m12ZA+zLZbkg2lZQZqlLFC7XpFfW
 VXxbYg3FZD1kAguGb5z3jvDfcM0hDjVLqxrOGjTisbJe/9qeNGxF5LsOMIVFeQQe/VeWgSD0K0N
 +Bj+8yPSOtRi99UyBq7a2CAhRI5YZUMK2S1wh+hTnJd/7ol5hjAblx+GJQlrPEqs055Up1j6f1p
 VyKiMtNvNCdKfBcWn8/xIUqrcZ33/hGb/sJwG8gItFoJ+Q2gWCP2RbY1fY2AHvGPahQgYqGuqQS
 tk8lfAaVahGU43Ys+bG2pOpWbRrAvcUXwEj18TUoBpJ0AiefOqPURNVi7bjBp+Mbn4tIOtmycQr
 FEDwahEgEux3F5XCXDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220033

On 10/21/26 10:41 PM, Rob Clark wrote:
> These also fix some perfcntr SEL regs which were mistakenly blocked
> since we previously just copied the protect tables from downstream kgsl
> (and only sometimes remembered to fix these).
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

LLM summary in case anyone is interested:

- Almost nothing carries over unchanged. Only 22–34 entries per GPU match exactly, out of 47–64 in each table.
- The generated tables use finer-grained ranges. For example, NORDWR 0x8600, 0x1ff becomes several smaller ranges (0x8600/0xf, 0x8700/0xf, 0x8740/0xbf, and so on).
- Several ranges that were RDONLY before are now NORDWR, or the other way round, and some change length. Some ranges appear only in the new tables, such as 0xd200/0x3ff and 0x20000–0x27810 on maili.
- The generated tables don't reproduce some old ranges exactly. 0xfc00/0x1fff and 0x3cc6/0x1fff, for example, are not in the new tables. I didn't check whether the new tables still protect that address space.
- count_max goes from 15 to 64 for x285, a840 and a850. The old 15 was already below the 47–57 entries those tables held. Patch 13 also adds BUILD_BUG_ON checks for all six protect tables. Before, only a810 and a830 were checked, so the old mismatch went unnoticed.

Also one robo-worry:

Unexpected: on hawi, GRAS_PERFCTR_TSEFE_SEL at 0x8610 is still
blocked, because the new NORDWR 0x8600, 0x10f entry covers it.

Konrad
