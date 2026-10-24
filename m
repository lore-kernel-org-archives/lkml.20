Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830006;
	b=4zvGk6KocpO1aTjsrmkxNVf72mglBCAiTdScwskiPJemSx1f7OsanrT72f0en0yLXE8h
	 QTpoF/EHMwg62BLHs1cTMnuUGz0gJL/pTONHRZU2xYQvSQ/YajaH9bI4e2OZW+rIU4j1N
	 cu/YYrS4RAJWTbmqg9nQXguXTZ20L/4LWy7qDpppSZD6qBrXLTdYHztpN8A61SllhEQbm
	 D8/N/hSXyxe7GGjtGj6i39DSVWxZTiVzx+AJOEJOnOA3AT7ebbZRlslfqooG9PKYNTrYR
	 YtYbRvNudK2P9sAmrXlMRj1ocPRk9rMuqNrgETeVulxI9duIRwX22s1qehvLlOsGYiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
	b=h58w3ldUg5tRbolTf2imLV8OXb2T90BdUje9G3Ud7OXQexvftXv0M8i0lrmUCYOF9Gcp
	 WNnmu+HKqW1VEPvi/a8fpRlBkSFoAfCSLaR+6Uas0mFPqZ0SwYfP9D72CqQ4fzpdx2x6A
	 XYjLmaCyKu355Gb/MNtb0hC8N9BpSPfyrOLV+B2EMxsMDj4KhqvaTjr+YZvZPf1uZUkLV
	 9ScBAYMA/V3qsPApV8B3nJOw+ErPugGjS2Iex5v7TPa43FRPZE4jenUjpQgjOjiA4fFY+
	 WO1jo+RnjdQPZ9B+J71DSy+gaN+xwRPJahaaXnFL4FlbT3gSuDrxWI5lJtUTxJx793A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1B2606A322
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1B2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O2BpT0820334
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GWHL9All+sd
	wJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=; b=FCewLPDkOJ+qp3ajXIb/IX0SDcQ
	lhDmjdenesdG9rV7Nt9bmTlIPeW1fBLjCzwIESJAsVpVV0KpaHTjD3uIWy3DMwAW
	HL8PiuGTu9+AAKxbzcnSWUfyixJGn+UgT9ZQzMJSl+rqayzw+jFcQe3Vhap4bUMG
	gp39vo63t5Hce9ZXPdhVMdRLr2Pa5jLFq+ipKJVeVsSm6KPfLUKb8lXzd+dCMSzB
	A8kSXighHmEnzEln/dytbrDSstjfkCekhHzeiooM2lVl9fHA0AfDYEN1pqyqUD5+
	6S45cxzoiP+De70Mq3msDsykwsr1xf5RFwYbRXKy8OFzFBGv2AI5K3D5BFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6gnqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so303538385a.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830004; x=1793434804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
        b=EXcExY+/blJIMDdGAcamkDdxUcHZ8QW47OS5qnc5nWFj53OVICLCGQN9QE7tflVJsW
         oGD/kNaLGOLEeY+ZNA2CzwpMO7LRGqVNcKCZt8hMS8+c+joDx3n6Qc9L4G7/dkExzRCF
         nBi3Sjp4G/oADUqJO6lzYDTi5gtFvumAFa+s21P6QYL+O93DCaN0japyg/HU1gspjPNX
         EsRCwztZCTZHcZ2YWUlWKYmAJ0WJj/HhMcSjMNZcIX414jvIEf9jauOXNR2hlCtaFJId
         h/2QxFPYl/NtEmjhuRrxU7oDYX4R++aMApKxmIbQyE6ZPL1yIVTcI2/jDUB0aBDdY4vb
         ez4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830004; x=1793434804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
        b=L1TRM3gDAQFlBy8FnLctEoSAfxAvMbUI3mq6ngCyebHsWKV4v3/30iKbt268aL8Ap6
         gkGx6oZFf13vMAvczl66bORY6u3frimxAHyMzQk/8bRWObS9+FgBRXuDwMv0+p2nJH3S
         u69PUzrGZygVWscmqqFyanLi7Amno7pW7043t4gYF6/nbAogcgQk3divJlxjwpI94CZc
         a/Z+57n2UWNF1QU+MeyHtQmGq7s9Lr7pd34NjYlZ5IBpOUmhrGiFQsd164evtekkoc4L
         akxRjofoo60fnGObN3aYiLkLtSehXhm7X9julMp6W3/s9mDVyME881+TsaItr0qSme3G
         CJvA==
X-Forwarded-Encrypted: i=1; AKwUvBzyv26qR5Iq38/XwvOQjNqnz9oVYNYEmTd5cj0oRFDpjIwUsm66tWq2ATdN9wVhkfTlNK8UF4gAdKAeEQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJDnnCTPVQObzxpVewERTtIIydNtS3pF1zot/kQl2/iG498nHe
	mm3JK3iwUzbBGnmqirDItQyb1U7duiaPq1Zt6XCquLUet0UJAnWw7lk08NINkYlnxL4ASvC7xBr
	ItKtmX0J70k0eHO7i0zkCnjduyhciaHRWFfN0xEZvSVUXrIsGocPGctn38eGJKWLvvmk=
X-Gm-Gg: AYBFou2UzZ7WzRN4bSYPgmXulI32ZpvBeo9ImdFTMXGkmWYHwQXYLPn8m8yOGbfn/BH
	BXf/kXd0ZLMIA+Aqk6ZA3icIRICFBMUu7zBGogd5IsuqBCUGFSn4b3adPosjC4Id3QqkQ+VdyuD
	23Qsbwj1WHYLHjhaaxvPKm8N6505BSeXHhULTrfoOeA0iYilOR2z9B0jfsJ3HWpX1o/Txr/96lK
	cELAi3Bu7CBU0ZKfQ+TgGQcjROTmJ6scVAvZnGdjeLboxwyVc2rzba2lAjvsmVfQFXQCNzIbOKn
	Xx7szMaS5B2Xlyv6DISQ761AIUvI/ZVD4QJf3rqXKZJEbUYTLgcOWcWdBDjkyulAUr18otYj3HK
	KTH0wOdE9y130QAyL+JfYcdTm
X-Received: by 2002:a05:620a:288e:b0:93e:618f:8127 with SMTP id af79cd13be357-940ef91e2eemr166869385a.8.1792830004335;
        Sat, 24 Oct 2026 01:20:04 -0700 (PDT)
X-Received: by 2002:a05:620a:288e:b0:93e:618f:8127 with SMTP id af79cd13be357-940ef91e2eemr166867685a.8.1792830003898;
        Sat, 24 Oct 2026 01:20:03 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Sat, 24 Oct 2026 11:19:58 +0300
Message-Id: <20261024081959.2887288-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com> <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RIBzej79nMc9NCrejF9hfUDE2nuqOuiP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX69mLc0vzVnlj
 9aQ2dDM79K4tgytMPLeNgUUkF4Jn8rUXNstOgnbCY8QSPLOIAbs/4jqDUx/0cOCvKY4flBEgTye
 VtaN26FUkaXcEthjCESyNhDXfdfGicw=
X-Proofpoint-GUID: RIBzej79nMc9NCrejF9hfUDE2nuqOuiP
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adc6a34 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=GIHIbdnDCuNUcvcnLtgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfXz2XBW5rmKKRc
 ZRdd4Di8TAdeEJtXY/PQh2e6zn3QvxoTfy9WFGz1AMb1v1nZ+JgETW4JUq2bYW2VLZHMtz7Q6eV
 sNBp33iRZB+0KKPaOUlPyhwQO5R+lYNe3HtMR3IrI/MR79Msr+sEyXowtgdh/qj6EckbDGY83nY
 ezAujV5iUZJso6K10RFmQW/zPRfK6sa3rBx++VYxKa4GBzCqZLDdjQQiSh3BmzntvV28e4/9D7m
 srfel7J4OO3yFvyiuX1ifcoZL6ptu2SBlI21BB4NwIbHlR0ZNH9AZBMEXvkWZYeE1EKmhsMMYe6
 eZIJcdSv6x4LU1Id71cZP0rPX1LcuSjFYguvXV743AamtZg0HZmZgrQvG/DczB119+Fp1ZWO6Dc
 vxffkE4ssPQo1S4Y2YXha1BMkBWUI1S8n9PkLUJMya5MIBLgBOPIZva5rGwRuCvC68rVSgRyzxb
 T7/PlIIOJbFhXERyX4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240033

On 23/10/2026 22:32, Bryan O'Donoghue wrote:
> This sounds like it needs a Fixes: tag

Yes, I will add it in v2:

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")

Regards,
Atanas
