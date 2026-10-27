Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793075212;
	b=RjKPwPGJXNv/pDwNq0spyU1Z6hpqZ8bnAjLEZrVSmQoiYUHC8IHAmOd0DYVTq5pxHnhN
	 7TkHUB7YSNfNUqvXWTbej0rfd95rzAe7Zv7LKt1ELZOAWMpCY0pL2gkr7Soheb7kS6xIt
	 sFcQKeM3QQwBqjW8a5I+dk27UEvtj3nvcZFpXJAWgWrMlNiub/8zFPZRxRIAAQbZtVkbF
	 FJE5WN+lBJ0kmbMF+wn3skV106UbyK//FoiQOc7TFG/LYhc6pHdXl1d1QbgKQFp3c0v/M
	 QCOthqM0L9xIu88IiWtKhrIlgWTmpbCe+vgVXX8tWqVxbfu+1KVL0hxfvMw23bDFAtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
	b=EUIOW0MeBQdtlISi27+Txw4jLiiCev+6RxcoBjQ7IWwChnPzHIiz3M535tSu5x1FWYUg
	 X6t1tcUPGSTd1X+DFBKzIOHYa00hjggngS1mKegMFRk0lYeGbhs4j/LAnZL8Tr8qO3Ri2
	 LrO0Xd++FW9X3SP9KQ+5wyHUMMqbGKgpgZalNTdhLaiivyOrNyqJvlxRXpITyekCD9GYj
	 m0y9H+Gq2I1XDvqWkXJiWVJaDIqFh1jZzk/r/FkizEWkpXwNlDm4jFbfXWO3Z6z1Atmqp
	 hbeFqcijuxNEVddytXIk08DLdYFvWjjsZpUPaSd+qNdVxaal0FoaZUI3m4g27VVHBdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWdUgzXB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JguEorj1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB3F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB3F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWdUgzXB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JguEorj1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2FHqp818812
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=; b=iWdUgzXBcnZtNJQ5
	49eWB9KnM2mby/Ra9xncGXEAhRUpjwiKpTbXVN4ctA+nP7FNDaTqVB+Np5I/2CRQ
	WWmtcC6JYZ6lSc1VeGB05ZZFQA4VkLoB4E8ZEbbIUUw+49EJbKMo8+ZB88dOHZap
	m6xyC8m6Q30X7Ped2XD0S4+UChoAp8KswWK7hoPtMOxhghr29dJGOUxW8hcQ4XPO
	KD7LerWeTdCw/0OYr0TUELNPzPhJiNUDBR4QqQkMuHpKSAkgIXyF2HGNlj9TCb7z
	ra+MPyL9MOAnO+uz5QRgmWS0rYMtw+qj/2W30vw0J7el0k1I2ntiZ0vLATHtkOdw
	Q2XysQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y3jq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:26:50 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab2a9a633so4941317e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793075210; cv=none;
        d=google.com; s=arc-20260327;
        b=CrtoD4KlwVl5lkU4s6qQtnuPLP1ywIhMypYn2Axqdwhc2e8jUH8luyvzZ5uqQL7e5k
         V1mpat1zC7f48hosYg/NrvG+PKW4Z33QZpgRu3EGVBKdxE11z+VwesHn6QDQ6HcSdb0A
         Q1m32bYd0j1momqhpnDoBo3kyST7hy4nDZElKcZcpI51wSq/PQhV9G2K9XsAhiWi4OXB
         3FCbl/0C01llYRS1zhP+eQEfVabKEIZXftnSndEZpybuUUHLvMl7+4OmJvwP+wFxb6Y/
         GqURRwc0sdEOjnovQL4DK7cgZsvC8aZ3OTvYQYSE70IYGAWZ/z+gnemL1/s4A8T86GnT
         pZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        fh=0GnOovAb4YBKyWyh2RgDTyvUrYTXegA58Juw9UTxWX0=;
        b=Z6b8o5b8Dc/2uTnhmXirZb6M5KlEsY7i6S90McLQ9iFwfllAMUzkSYpPJIUEJ6weVs
         oQ5Xz8OxiHK+VyhJiXASf+64UKZkOKiMpPatmWFrvE9a/JmZtMkSfvWvnFmzS8g990Nd
         wx1exJT5laBhGGQJZ9IIrY7tlHExFI770Pdye4oZFqzyi6Za6SmB336AM7j2t8rpENn8
         M/3+RLHw+Ue+WRPB48Xz1NUjl4aD/PjkqRcTcuhvRYfMBmZajh7nUUlXYd56tv4pfEyQ
         sMLlTIDPCpR3KC4E65YbOVDl+ifGCbUsM6qVwjuOlVK1WcbngOXbU//cdxPwKGeeNJvc
         LyBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793075210; x=1793680010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        b=JguEorj1DYC0ZHzRjcu+h6eEsL20UXSswiEk/FQVzneSKbaiVmZ606RHkmkMr6HQkh
         xB67AKdZF7NaksJsaGwpF2ynbE7m7sfrtER0yPAhyWwUyJHNnha7wk55m1DaTqIqBLB3
         ewmGD0O01E+6Lk9MiMtIc/x45erEfkogNGM4gMgoEdqfL4taCm2tBv34NuLuNWeDwHma
         hNL41R4a1zG0XMhD4CkinKU238yCx27ff3TFWvLFtfrcrkVwE8f4O8vtQP5AeQXSuCWE
         /fr0j47R1hnVyD0KaIWCVJmPSCR08uxyiIEfgZnprlO9P2KwCsNPH8Am1pOSAD/hP6Yo
         ryBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075210; x=1793680010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        b=k31/eolrdqwItsNj49tC65SbOVX5G4VNyYVNBtVBuLKjySnSyDdw47Bv/nFuL13Irm
         +S7LB8WS063roIHJ4Y5u7iRzg6daR3Uqq8jTqwypso/voONPil5ofs2dvdBiOJwj4uRc
         hn3clCyFRsobuZ7G9AvL0PuIwEEDREzOixaZ1oZbmFdrio7/1f1KirwGqDN4LELtleEc
         XGw33ot1l/Xttqbsn5sByeHnErs8voSFqy9Gj85w2yrCpi6NEpTldQ2NCM2XcAzfR8L8
         tUTs1YOgsewarrQgc05JddSwX8HH4tKbMqRqOi/We6bAvbBP/43iUvrCl3/dzCrPCxZZ
         nakA==
X-Forwarded-Encrypted: i=1; AKwUvBzCQ7+IxaOktcljgyjZOo766Xo0VAK2ihX/9ylGUnfMtWQWSThF3XyuQhGQWO9R5L/PzBtydiNLhYU7QHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVtsFKQkA5d4+pi9V1QHNWsRodksRTftL0uRbUSVccHHTWX9x3
	pGAlLAwCCCZKVTzbq/NBRpAlnv/WnWQ7zwPiVHAolX/9VUL3JVZp9zOeYAmFpmtIX6wzoqysMMG
	D+WrP3FeLC7syKudXrhvN02/42/LojJgZ24uyJYBX9R2vYQJyRcpYX4jgG4a3CpTgWhYR3YNTM9
	muwfwapJ/J5TF9Xh/jUGPkGQIMgnNU/jpy8SbXaBGxGQ==
X-Gm-Gg: AYBFou2WQV1LNm7p/9NalT+Gb23ir7yvUoptZDLv6ZS8QdEmOxkzcOQsUBd/hTnusF0
	zofNGkQIs/LjAptOAVGYbSnVYvwI4UyYlWUDqWlYaYdBhPcV/NwDotR4XfJS7KngxHsWCHbhNX0
	3uE9wB8utekCdRSMCFp2Z+3yRwvprC8VP/36QoP83DG9gATu73nT4BGu8JrQ8DHPUuQwvOPlR5I
	3Z3jtSCOdpvdKbkXQ==
X-Received: by 2002:a05:6122:d1c:b0:5ec:a9e:d80f with SMTP id 71dfb90a1353d-5ec2323eb13mr3595418e0c.8.1793075209744;
        Mon, 26 Oct 2026 21:26:49 -0700 (PDT)
X-Received: by 2002:a05:6122:d1c:b0:5ec:a9e:d80f with SMTP id
 71dfb90a1353d-5ec2323eb13mr3595406e0c.8.1793075209303; Mon, 26 Oct 2026
 21:26:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-11-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
In-Reply-To: <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:26:37 +0800
X-Gm-Features: AclHuK8va6xRV24M9rgTF_POC6JkORw-Ok48zk8PcpaxNQ1oNylaL8QpCWYsZNM
Message-ID: <CACbMrhpYMs6CvAUzJbZDd4+JkpsUSoJaXHcF-A7a0wNoZQDhgQ@mail.gmail.com>
Subject: Re: [PATCH v22 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfX79GN1TwPwRdJ
 VpRZ2u2zSKO+C5Xvr3CNzl0yX0bujMdGVlTHd0lwslNceR8FOt7dxMkcjMHYGZaKKH1xG3VRcuj
 ih/JezoWLZnHuly++J7JMiXTMAbCC3M=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6ae0280a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=6iLt9ATBiMRDfCnMGdoA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfXwibjWYSnXmXU
 uzc7+KZVVD7PC8jC0NXUsWcBTMb+puMkWfW22ECQputGmLMHnrOaQKfkD59QPA77GmLO/sJYQyL
 PZ5KuyLYlGsjNkBDTbvrv72wDAH04R+21fzp7NUzRkhn8ZrP5bTfLDJsYgwWSPBtnJD7HXqF6+E
 xlmsiOD69lD6HqhE0PcltHIkt7I6EvmT/psg4XMbOqlLy8IW1s1kXKFO24Yyk+8e+bWiLr7ANGF
 AcjnhKEbtkFu+mGnDuNW39woMlAEe5GqHGAA5LLoyh5gNW33qdZK/ikYhKsPPgfkizScDafEpW/
 qsNhncs6mRV7hLMmgNAzxeF1RoxWpAc93pSRF1Vpkaho+CTmeudHCGbk8xRpGWFg6yicMZMzrNt
 a+pgj4lVmmcByYpEnJcWcyfK98mZroI4Kth8nAiaZnuJCULtZLvIMIBqAaBCasgDvQiHVejkF/i
 bvupZJSrMO+2znEwPGA==
X-Proofpoint-GUID: 4T0JBGYMcWqkQtSTdXvigiK9T6T2iMNc
X-Proofpoint-ORIG-GUID: 4T0JBGYMcWqkQtSTdXvigiK9T6T2iMNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270017

On 10/27/2026 12:29 AM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelin=
es
>> can be enabled by board device trees.
>>
[...]
>> +               camss: isp@9253000 {
>> +                       compatible =3D "qcom,kaanapali-camss";
>> +
>> +                       reg =3D <0x0 0x09253000 0x0 0x5e80>,
>> +                             <0x0 0x09263000 0x0 0x5e80>,
>> +                             <0x0 0x09273000 0x0 0x5e80>,
>> +                             <0x0 0x092d3000 0x0 0x3880>,
>> +                             <0x0 0x092e7000 0x0 0x3880>,
>> +                             <0x0 0x093fd000 0x0 0x400>,
>> +                             <0x0 0x093fe000 0x0 0x400>,
>> +                             <0x0 0x093ff000 0x0 0x400>,
>> +                             <0x0 0x09151000 0x0 0x20000>,
>> +                             <0x0 0x09171000 0x0 0x20000>,
>> +                             <0x0 0x09191000 0x0 0x20000>,
>> +                             <0x0 0x092dc000 0x0 0x1300>,
>> +                             <0x0 0x092f0000 0x0 0x1300>;
>> +                       reg-names =3D "csid0",
>> +                                   "csid1",
>> +                                   "csid2",
>> +                                   "csid_lite0",
>> +                                   "csid_lite1",
>> +                                   "csitpg0",
>> +                                   "csitpg1",
>> +                                   "csitpg2",
>> +                                   "vfe0",
>> +                                   "vfe1",
>> +                                   "vfe2",
>> +                                   "vfe_lite0",
>> +                                   "vfe_lite1";
>
> I think we should probably start adding the CAMSS "top" register
> region as well, to provide a more complete description of the CAMSS
> hardware block. This register space contains, among other things, the
> CAMSS hardware version information.
>

Ack. I double-checked and found that Agatti, Shikra, and QCM2290 have
already followed this newly introduced register layout. I'll update both
the binding and DTSI accordingly in the next revision.

---
Best Regards,
Hangxiang
