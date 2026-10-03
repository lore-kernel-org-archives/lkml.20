Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998AF188005
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025876; cv=pass; b=amgydHsVJ0NQwYUo1kSBL/x0YiYYhMVXsH3igww6D3ZXN+tOcthV7KtBPJwUFsIpB9YY0/FVA2p8RC4hMaC5Sbsv0BAQGnnNWxzfv96xNPdDXiqMpmtJ7gUnG9htwiZ4wD0NOhTgFHI+QXgBo8tg+K7ifKRx9HubCJpsjuWOPhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025876; c=relaxed/simple;
	bh=QSTsi0xJf3W1mpjWc0B8G2aXS3mqDz2jPj3tOwKmY1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVu+r9OEgBhdFyIvNcgbExdyTFYRLHeDCyBAOX6foXotuw6EoRN05nvKef2WE1DoTPAX/japS5ueFH+QKXzft3aM0qgAkWupvthmb7YkQThYK6ElVPlQlQBONrm2tTM5nN+uLH5T1XmPEpnBDdnc6+Ay0OtSGHCDuDH/V4nQkIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2oyxHBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ez6pS71k; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2oyxHBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ez6pS71k"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693AuDHk989139
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 11:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=; b=V2oyxHBBB1jvM5Ow
	crcDF4evfefwb0OIznLHLFoXGMh8i8tfuPMFKahTZkdWR7PrsX6H09frhmcdLwLX
	6FyrQaMvTJ0KxitESHH90u60fJA9QnMRhB5gQp18KmMPPriZaT21Dr1MObotAKcT
	VIGDngQ5BrHBgmQVBEZhOFJcFntKAn5nupT2bRkQpF8ax31aW9/FhpAvcjRSDhw4
	tUY7FWyVu19KLcvjcrA/3Pe2Q06+UDZs3sB2wbeXL/mNxxvcDFLw2qynBj35j3mb
	rcYtBdXHH2h6ozG9pubUOJ7ejMv9STp07C2ITM9nR5hztFbge7lMqRaGtUTiQLqz
	Sy2YNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr68qv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 11:11:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e0a8f73addso142808e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025873; cv=none;
        d=google.com; s=arc-20260327;
        b=HeBAXwBQZnFXJfRkePi5PtVt5WN/jTDKUd+5U/PCH+dPOn0eDWve09ZWgLNRP9c3b1
         qNA5vMwKP68TK6Oxhwf0wima99C56uHJNJPn+7ZC3dHTAv7QnjUy9o8Ec8jy1BrT/TAG
         OBfLL7qo2Aq7N/jHTjqvrtRXL3/SkvRIfqgZJ4wWwPD87sVrn1FzuzbawXofCEbRYfKQ
         dWgAEgC6pct3vWoF0DPXmyudWNQMyKs5QnjR6dSGan5A+/fYV9ekmDsafQAB81LN6XBI
         tSS2mk3ycfFp9pp2BUYZkH072fgdvrt1SuqmzOvgAXXRtQMFJsJgb8ah+dhbR8b+9xhS
         Fh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        fh=/uP2UtI36qkjY0E95Sd8G0EgKSvvd24fQMCH2KEHnfs=;
        b=II3lUt/mi5sLO68HfyKs0m8pTGbYj1L7NMRqpCmgQPbjWJx8an25TwMnxIs1mJo4u3
         lfRS5m2lEMEJTvdncLCezJlU4GYa7aksuwG9gpDGCV41i/lCkIiu015SzSRywzCRhTgt
         pcEHHIEkh6RfUaHBLwhlEcxdTFNndUbCrlhPF5tHZAhmzO1xhWA61901gMUCkB6uo14O
         3IYYLEOu3aYhPIdk3BKoblqV5SaXchat1LPxaduGyv7jrJC66oANNIek8CtJ1Ts5QUWC
         1iu5hzeXmc8pXDZhIMIkDXrJtfbl0Xk1/6X7J5Q+IceppoDA9BLLkyTrciIMAxPrTbdx
         /eHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791025873; x=1791630673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        b=ez6pS71k7225yfO5SQ5SIyeXqnSI3ya+9mGeI0QVId4tIHRvmUrWmUUGptxbB8smOD
         PeetxH96f6CI0DdvX7sXYqex2hy3dQaHLDYHJVAklrQ8iQyTBbwn+IRtnscs1j9drPWt
         vlMkD/F1ewDkSNmzbiPK7dgEaShnxVIAPjjhozlY0R29IOhOMPiwHntU6nPBYN2KyxWg
         Qp7N/li4CFsT+4ZEPmmkJD+kbQSeF/AKZsSk/JiLX2Vjbl9LyN9bZrc2Nk6OQDNGXtDH
         R5pXF77jFVHCCcWOWH76EVn//N0aKU+8A6AkMvMxmNljjg1LVOwZbPFaM8jtcMXZRw2e
         7t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025873; x=1791630673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        b=STdH9cspghlwX7Qie8amjnTQ5qPyZqlmXnMk7iYh1rXoW0pnGMijGpe1U7I5zW+2x2
         UL7ApphWUGWY5/i+E9qE7mcsHeT93LSDmZGM3eZsr4OzsIv8nZB9mW4o/v1xhU+5pw3R
         PM4c8rzo6wOAbTYiv2uUi7Tk+fUDMRxkBKUME0EVo6pcBG9hLLvbMW4N4x5X6NOLxu5d
         /v2my98697rYng+ZjXmQ0kGzq7ljrlzzlc34NrC1Zc6oQ0FovKg8CKA+Cw46FBAhw12K
         +vik22hbbY2d9t1U9YPnu4jtrhtB6Xzx6Lr4KB1MCi6Hx6UsSRgv/e78dCgrq8A0Di22
         yv8A==
X-Forwarded-Encrypted: i=1; AKwUvBzYbuQrbVikt24s3omDXX0n9i7xvVRMj+T2UdePijgDTmU2e2CwfKeaxK998l9E8dTK1wn3efFqEKK6zfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwdC2OPBn6UtctAE3YXjaLNF2TXLhvOur+Nns8WYXtLsLVeNco
	II90mnHji/DnPJ+m4+sy3CuQqHFtH1ku3xRolvasaZ+6ErRi7JGpoiXPjsudTK9g3hiYb++sqGM
	dQmpO0K40iXCDD6V9caMkLo+zyyIkGbzOJOrBxmG4HV6zrwKGfiLxgjtczJ1BGoi6RQd9yUHtQ9
	SV3Ht290I1Biy/uTkKSN6l3lheZR6ttHz11amTlQB+WouOH6KB2BHK
X-Gm-Gg: AYBFou3ANcvJmtac0D1jVHS8GVzluhijKqZlsaiJ9+bVMSysIlUtWoZXsJ14DTbaEGa
	baiXerlCvmIsr5m+9qvrCl7339084+yYtvtAbCdkGO0GILgmQdsHkaeSMDi98X15Gk75twbOj1g
	00hGPO+crcZHX+sm4dUuhmOBLBiN+RAWcGnXoM65F8ZocoZiBmMZ8XJDuz5ZNsyJEWhoCXR3k61
	oLHikGUUMH7M3HZEg==
X-Received: by 2002:a05:6122:2106:b0:5d4:f492:bdf4 with SMTP id 71dfb90a1353d-5dab3357fa0mr1691060e0c.21.1791025872942;
        Sat, 03 Oct 2026 04:11:12 -0700 (PDT)
X-Received: by 2002:a05:6122:2106:b0:5d4:f492:bdf4 with SMTP id
 71dfb90a1353d-5dab3357fa0mr1691051e0c.21.1791025872550; Sat, 03 Oct 2026
 04:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com> <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
In-Reply-To: <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 19:11:01 +0800
X-Gm-Features: AclHuK9kb58p-lhxZ0JM2phaLs-oK0O_r3eZlqRT_1LCVxXx_9IYV-_oLUsV2-s
Message-ID: <CACbMrhrB0k27wBDgADSbhD8Cjyx_-xBvgCOXcwXMxmxxuEhBGA@mail.gmail.com>
Subject: Re: [PATCH v18 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX9i9rQdg+yAUF
 OhL6vUCC1PGcJ7hHlZt+AQvU8ID5/wvF2B5L1+JeiLYoxmROMNf4hH3DLc+qATdaav8StkUFMgN
 xvz1kdyK0wDY+3gIlQDH2Z/H7KjA6Uw=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac0e2d1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=kQtmRZuExVT1y5CfGhAA:9
 a=QEXdDO2ut3YA:10 a=1SaFWpeTM14A:10 a=tNoRWFLymzeba-QzToBc:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3aLtlbdpkStOn8yFrExvR_O22MUjpkHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX8r2TiMDxXy+M
 nCLUtNuHNUz2bnqHRtkqOuTLan+mfoLU750giZEq8kRFHN1iNQPB+Xt9Z1O0h2t7sNrRDF4pQMi
 tz8V1sYPR6d02wSfYwrfUqqM/ncv55dIogItMlzrmNbeqvecwlaHEYdnT0Dek0jOyvGpsdBzpBo
 BgyJl9cEIjWmwmJullxWAvyr4273Hb0OSusCv4CFiCgLL58ALHGbszSgJu+2Lyk26RyjoBIQc5y
 Yt8my/EG+3N8M3/nL5mNO35MPt82uf+r/pwPLDyO3ScZ5mfQs8eNR5+HP2pBM8NmJhEM+AlSGHq
 4WqiDszZGvPeRwR0PFXDIA4UaR6ZUWreR+IeJ2p6XjqL1fe3BHY+wx/+mq2Gs/Z4Y97kbRRgJZR
 2T8V0p1FWN4EEfKsal+mxHzMoTZ9o8oh0wBNIdVfClxcYyodgL21ckyTA7DosXkrGsMK2d1hYZu
 5DBOV+bPs1bMzL+1QNw==
X-Proofpoint-ORIG-GUID: 3aLtlbdpkStOn8yFrExvR_O22MUjpkHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030044

Ack

Best Regards,
Hangxiang

On Sat, Oct 3, 2026 at 5:09=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/10/2026 10:02, Hangxiang Ma wrote:
> > +                     .hw_ops =3D &csiphy_ops_3ph_1_0,
>
> There's no reason to continue to use the internal CSIPHY hack.
>
> ---
> bod
