Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793910954;
	b=aZxKwxDWfAKYhZ5RD7n+LKkblZKhTr+tysBdQe7DaeFAJDcC1YlvceThmr6kiLQq3AxC
	 jAOboSO7L+cQ8+heVcC6cZrTUnJHtIHZPn6lK2XKahzyC+mV/qN1WVR64jeicXkgLym0l
	 pbkaCSc2SxoiVoWfffAE4zpMIUF0wYE3hWNcEbeTDWXhNdxP2Y2l2fHWuaeQ19FI7GW3i
	 5ZwF3UwbZFXIr160XyHkDigAa1KNAulP43QW4O1U+CfIKKZnkYWr4t13H2iO3mns999q2
	 zvXxTp4G9BsW+4KQnFVHKxpNh/02Vn8xbv+4s6kSgYuGSb1ln8nigs834eoA9Vx81Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
	b=sk9FP3EE7BIOBRGGexnIEz37R+w0GqanQPUdjxrjjTKjYI1WylLjHGqhJ8K4ADujl8A9
	 Uwl8xn7Py/glLVngHR8m8uZt04grgoIj32DKaun0ZMh81setGRU64G+eHFgR34CG0Bv/o
	 4+vaMbTIcJvCUTEJde21v8TgwkkQxn1gFFydgAJnIhyvxFACVwnlKrA3XDazqN7qBqC86
	 Car4fl8esbiZDpe97u9PXdlnZkD+o42jNkBPRyllMSguBcc2npRZECElWnuVfGhuHk2FC
	 pFWJt67oXYQTP5v/JteKUuzvIsisAguqg++lkWnq8MaKWKT+Q2m4o3F9Xqd6H/cfEwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pence/o0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsxUHvad;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985BE606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985BE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pence/o0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsxUHvad
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeMZK1440029
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=; b=Pence/o0Cr96X+co
	fgfH3MYzYjLkMYp3ywfGF285Z5K8sEYtTt9YdLhWA4l3yxMaUc3yekzmOMd6+Kx5
	tzMyurTVfA6LL00YVnQ0WcmXB3ernbUy7xZcehnAGYON87zqufguq60jR31Nk3s2
	ZEzfM97q+k+o4geKZZwd7FMGLREKATlHHvVjeXkc6n0duUvCzaW/yc/6sJeS9LGz
	JHwFscz2BNx9fo0/FSDxxmLBjxMLhqbJPWqnlU+ySSAt1SfRGIeWOFTSTzhEVaCD
	Y+BskzXxQtjI9MQKmnxGtgX/Xj2AJ8Op1moRzziDuj9V/gUOq8vyDZcWRD35psiV
	EWtsFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v3pu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:35:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so534162085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793910952; cv=none;
        d=google.com; s=arc-20260327;
        b=nF7ZMF/aWP5nGsWEB6TdOo54wHuvj9CbhAA271NH0Kq5VXjqsV1Q+42FW4zOgGgaSD
         ktiJ6frysZ50krM+JN5qcydi7HKgMvqb91HQDVpVr0nTcnwBdZRbNeoPC5Aotu9HiqIO
         TdDnGqqlK5HmYT3StE54M5WRdeJrb7poXRj5EhQlp9OEWftyjiVFPHpbCpiAkxyDHFr/
         xWWlaW7GOW9xKGlwxXPHlUKXFCPJ91/Oyy93PpDZ4lUcN3wjJq35O/Uq8DFrpjhKKM1q
         aDElz7WZZm6AyAi83xOODERMqFcbXJgDXPKyMAn0D1/b6UnDAHnsVY8MU1p4qlg80PQb
         8eXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        fh=cVAT27orXapPW8v1I2ObDwrAVvH3u0jpdSg/igmsIcM=;
        b=apu5uyLVxj+UKK5KbbkFLtMToCEtXTIcPGYTjDwCQT+Q/FqhYHJj0sPwIztXABfp3P
         A2m5B6DVfeIKkg1+kN0MWuvkSd3WUSn4lIrTCv7zxjtzjFFMD7hBtZ+LOXGJeMpR0Lm3
         LNAaS0BdK0jirgiwphtvNT8lNZ6yj1svnT7F4n7RloygNK53PjuR6OIifncUrb13D7sz
         BD3PcfASwF+/6Du+Jst1Ig+pC3oea4Q6LKPZOjAcWiHKsDuZEm0toxVYTuIgTFcPbmtO
         vkp8pithYuJHJamv5CKmoYUUtdxAqAZT3wmSikmQIVtZ3aDL4yMutiAiEJIn0xnCyx9s
         dNUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793910952; x=1794515752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        b=ZsxUHvadDdTjjnU/lVNQPmgNKOXgVpg1Z9qaRHFVGT4xgTiaEDWczoLMnd8oVKkO4M
         V1HdQd1d0fzalYWGJ3QmMvp6+eFVNID48pFxIF92MVMpc8zjpHgpP0PqNKmfyhCqEpqb
         QI6bl+bHAQSAeFeVaaudVEtl0SpLHvSrzyNe5BgStgpMFTfh/9Dic8bL4G5KSyBmnk8U
         hIBdZGDo0UbTx+2hRzjYODsdiawhgRBpyDvdyFGkAj1PiTG/h5+VrQjNt8h6apmcyq/u
         GKptG+C6LRxj7cfwGl4OrAmkd02peyH0tZfxO/Yx9ndu6Op8E+6D9SGrUgA41dXqfL50
         B5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910952; x=1794515752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        b=YsXRyYNK6rEaBeFeutlv9uayVcl3N80pxGS/u0Z5DUxzTqA/1IeAsaDJQhtrsvMMjV
         Of1qQkuWzW+l6tfJ6eG3w7A1AZrwxL504MSf2JBViaKgNxAvlIUxZiH7YBiefr+TSG9M
         eHaiwtuV515UAnaPQEQgjZBSKLS8AzFfC6MuNGwIf6e+bT7WtTnSNZ5RXbseX/CllzVs
         ao+nR+NsY2YVr7feCr7pUGchn+gja5ef1UddMW/hlNMnfUI++MLeJmHTynP7ORxYT4GW
         U5jgD4XnqV5ubjvNwq8Uon/zfSX4s0BTzSXNMnUqDs/Z6SczNsimpsaTHCR582r09VgR
         WsSg==
X-Forwarded-Encrypted: i=1; AKwUvByhVaGSmDcnAAe9/bsxf6ZD8UoZn7n7u0c7oQyl+iJUgDfLWIesRry0IFBoKRt6ZBaBuvISmAZezQDmou0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/xSDE5MoKUfCQtT8dKq9CG7G/VJQWt91l4tLKnClUAzKYQk6I
	nNGCLK9wtoNiB86uN+/ZKjc5t/uM+YrVHvCxuTUpMzJDfV9LO8WbrHiXU28+ovwYpvzQVV8i2pI
	JOqYPDZeZK+T8fnmfcUxx4ZdCk9WIG2DKDu739o7N7SLGmhGJekJu3DlpdiwefmSKM7uaTD+0KS
	m/HnhsvP4XlOFw+FWoi+3IHDsi2/C8hVsY0wB+85yijw==
X-Gm-Gg: AYBFou0rZL/EHq0lhqz4FrfSjll1/4/PJsbwEkS9YIt3d/WVDN9lFFSYNNGGDL/feCH
	Vi6rlqjqbPpR8sQy17NywPOWminCIlmvHsjJ5TDpPqesAeqtuqo5ujVI0saTz6oqxt89aKRDa/9
	IR/cokEexMvpxCGIRuh9bbIULeyE5RP1CPyeBTfkbQsMp6/72z2848v6HZCIk8ZEW6ofdfUmq3T
	Dq5hOZD/hY7CFqGRHHDaJjo8aET4ZRgx3tx3DxFYZ5Stktlr7vmo0JCPWUE/GUlGF6prAwO7N8=
X-Received: by 2002:a05:620a:838f:b0:93f:3bb5:5454 with SMTP id af79cd13be357-945f34d7e57mr40709285a.14.1793910951563;
        Thu, 05 Nov 2026 12:35:51 -0800 (PST)
X-Received: by 2002:a05:620a:838f:b0:93f:3bb5:5454 with SMTP id
 af79cd13be357-945f34d7e57mr40706885a.14.1793910951121; Thu, 05 Nov 2026
 12:35:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <010601a0f11c4762-f4775077-f8b1-4000-bdd2-d36d7658c606-000000@ap-northeast-1.amazonses.com>
 <010601a1ad265b72-97c3eac1-cb56-49fc-a50d-c5339e11e9d9-000000@ap-northeast-1.amazonses.com>
In-Reply-To: <010601a1ad265b72-97c3eac1-cb56-49fc-a50d-c5339e11e9d9-000000@ap-northeast-1.amazonses.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 21:35:40 +0100
X-Gm-Features: AclHuK8XUhhVbuJuvKO7cztGu5gbxLTTlaYVpQOBsiS-Amrfp_ILfbRVbQK_xpg
Message-ID: <CAFEp6-2vZT+c9fz2Ob1LvPQBjChOpCdAYa0qAWCyiDg3s4d0LQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: stop started subdevices when
 stream-on fails
To: Jizhou Tong <fqwqf@fqwqf.xyz>, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, hverkuil@kernel.org,
        todor.too@gmail.com, gjorgji.rosikopulos@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX89fXwEhmPTQW
 zYQexfLknjb89ZQH8XWpamk37EC+E4O0rRtlRW+pSq5yhVVB+t0zNUGT70hFl5Z0Kvo0i58xpld
 01pjfGrlSy45GxwHF/nirflU01fgguU=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aece8a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=zfNuECduAAAA:8
 a=8g3GZXDhwfvaI8gMI10A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=EUuLU4E-60pLtsqvbPQD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXyceBfEXpnO8E
 g5gqq1tN0PI+AEyyrHCMxCrb+cZO6/xhBUdWK7omWVEsKHuwPKI9CTXIsgA+VR78/gtXAVdokKI
 7WkYAbC1KbTQPCKtSDFwVMxbhojI0+KbzWK9RnTnHXIxjkdhkC9KxWA8XiPmVgcurNrD0qqir5m
 HOcAWPCDQJLkLEet0IuMi1F1TXdS3izzxZIsIpBXaTDEgET9Btmwo/Zx7RiCJo0E6Cmr8yLZ4Uo
 gL0pzmeBRJc31cR3hrlnw1iOYVHsHcDwhB/VMive7jqLFOej/mczq0vDk58BmgAEYBALGDetPOB
 LzSou6au1759uHu6TWfE9PbAVuPvAUSIpW3u4eURtYvac0+8wzoefwwWsejy5soZa0ZozgWWsJe
 Lk8P8N6h0APvp9qU8YYVEaPG/0LAhlrB2dTxcLtNNKCui+zkLyAagZHPATI6o5IgHXI2qJZQuLA
 VE+i+dsrgR+bKZpdgCQ==
X-Proofpoint-GUID: hK8cU4gj6YwO-LwPigikKSGu8nyHc7Vf
X-Proofpoint-ORIG-GUID: hK8cU4gj6YwO-LwPigikKSGu8nyHc7Vf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

On Thu, Nov 5, 2026 at 8:18=E2=80=AFPM Jizhou Tong <fqwqf@fqwqf.xyz> wrote:
>
> Hi Bryan,
>
> Could you take a look at this stream-start cleanup patch when you have a
> chance? It stops the subdevices that started successfully before a later
> subdevice failed, preserving the original error and unwinding the pipelin=
e.
>
> I checked media-committers next at 6628e7d4c6b2; this cleanup is still
> missing. The original posting includes the SL7/OV02C10 failure case and
> the fault-injection harness. Please let me know if you would prefer any
> changes or a rebase.

There is a similar submission from Qianhui Xu:
https://lore.kernel.org/all/20261031041154.308030-3-xiaqinghuan@mail.ustc.e=
du.cn/

Regards,
Loic
