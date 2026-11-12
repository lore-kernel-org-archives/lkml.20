Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490696;
	b=iauqcJe1HZKv2sHztWUFeWReFbtmzDF4GbXEQYc7wOwSuWPfSEeBtFl3dB6TtPmhBn4Q
	 5tTB8vy2ZsugZoVx+vl+TVuHmKhmcKjYbYMtkkMNi0V5x2gHpHL5fUYsOLwX+bgffrbx0
	 sVErTWWFHO7lWGrEW1+s5MVYYSGxGYMtM24ZFuHt6JBSx5IFjoPO4X3vjqXeZe6lBQJDK
	 iS+aCDSCOpsLKJmQ1H4h5Fn4/4HOb8rRkk+r2yCNt4dNaKyPZUKtyfQ+k/LboIz8CwFiJ
	 xUHvQ2se0RUxn0XA2i8JCX83r+tFhkm97BhKpmM/e1JUgnUDVZOkvkQtCcMwIfgFkDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=;
	b=39BQ+YGCjl0XvO0gAchb9VgcLcC2XRHWPOomxUN+jdsI4YS0iCDFkPEON3cAiOL+oaB9
	 HX1GRtx9svDxN9O72Zovo+/uwIaa0LNpsXK6/Abay4BHKxwNLDjQvXH+Gl2mOm/v4w58q
	 ZgY/rHqJRQNJbAXHT9QkA+Twh/K7+5e1Z7grYHmGOnSUAm1SpUPpWCZywVm5yXenCRkjL
	 cXmW9/WbVIS7+S/IOEti82iiEl7d4holrp03bd3LG04MBuJKaEOmXwQf9QN+DX54TTn3b
	 J2p+LCLlESuqkXhCt7rX2SePrvs2hGUsJgzWb726h9TmXoun6sr6Be6Bxt+HDC/INzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtUI6b7Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjSMJFt3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F109606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F109606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtUI6b7Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjSMJFt3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBDtK53893693
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=; b=Mt
	UI6b7QHyfXoOS6mthpt5UkYsrXFRFdOvk9PuS6cQY5NyGIuFYB86u/dqXUjXTtfl
	49R7eTNlkbSLIk03IfdrR58QxSwGLTlLIVmM93s3jdH1l7OPOhK5uoavskG4BUj6
	KTzGW+FkUKKyQvA5xiNbebNOtXwfnK8sRkGGwGmj41eb3wviOyl9nO8jEhr905kB
	vcq7tuFStdabpWVFZlSJYVJMCxmfcTrwYLrF8sO06RJib2XNDlRBXYMMDXUNldy7
	Z/f0DrYsWc0AnceZgHfq4VBvQ0XTAGQn5P5n2gVUygvbxl/htcC1uB9jOwaxUoKM
	4yXJBz4za3xxVUA2rwYA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1sxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:38:15 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8490253aeb6so3955644a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490694; cv=none;
        d=google.com; s=arc-20260327;
        b=ZRFKHzpe7fG0d0Mg2KWbopundlF+L3om+JhBBo6NOO7CPk72BOnbcuogJgBvTTcFou
         9wUGiY8Gf6qHCFC7yUY3qICFc4XlYMZYK++9hPKVnG4GE7gHINleHzwATAY+TTQbmwfh
         hBzqabdKrwTd3wrXWP1sU4lr978KYEGAFCt8ixTpmerHFU8xpFD0b4JzOgMPB5oMtpIy
         SAwRPgwmR0+hkZQSZXsWqGDRGUCIN+cYsjLTfJ9+xvYq2jUAJlMv6b4MeNZ/oLpic5G0
         MBDqVOpTbwXe5Ggy5ioGLotFCgB/cR/7X2bP8zETrIDSUmKCaerZ9b1CQ+O7BVFSKmF+
         IzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=;
        fh=y/uJ/saatx7yHsWe1di4gX1irSQbJpRxr4HmaSPlZmg=;
        b=NiAP9fvxxpOk7iKVltUzZP2dhVRlAJfrS4MI41mbmpWgoovNdDr/NbjQFwvkRCcct0
         gz6/IfNzL10ohXb3i0zcuJ0YL0iLuQnfxjxZubu5yRUoOLMXgVZSnmzpPzaAlXxlmNoL
         i8QVrhejOCAjUfPpsHGgY2cAsN7A8XhBw6kjZj/ccmO1YGTErIBJsnFVI0ZbFpEAMcOW
         Z9PS4wPVSPDJTBwIaBpPgwH46LWZnOOt6vAsK7rjW6gdnpGwLhiA1Eajv+vz98UBBvX8
         p9YKROXo5h+ErO6l2QKfzDl2GWHfDfbMpHqOI+M0+k8JgExcrvS6+Hboh/EjxHgKqUVq
         eUnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490694; x=1795095494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=;
        b=LjSMJFt3OQ9EeeS3lZE2lW4IdyF2K9by0rimSlDL0Qhhq8UUr+BaCZBLgas671tndI
         4eoe7ZZQ40ZsQ2dsDMdpi8gu2I/VDJ0xxO+pj8/GWKbIJhxByCVvQtBSIwgKx5ahjmam
         t0l6N+WUkfs/bKGYIGrIyrX7FDKg9porOCVrsCQElpzmNpyd6nb91FUZtBcwfNW1EiGU
         xmDj7pqVMlchzvNTZ00eH56Vt+UK/7DmkYKwn6LpIkXd3zb7te1dYOsRlG5rBm2d9F+v
         +I3Wj801494p+Px98eqk5t86nKnHoBxB5ZMl3gsREzokrLHE4yC0jePpw0SdES/TC9d0
         VDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490694; x=1795095494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=;
        b=tpsaNpaCe9atbZmZURKJzARRzh0YauP6Z6fct3B+ftiXU0PrwK5CY5vjvqIwNXQfbj
         MrklolEsmu5y7QllN0aJnZYjNLX8AW4XVgQOc9p3rtcHvIse95aA6ypDJp+Mb7zHQ7uJ
         HGdkAIqOV9+d8DofanvQDxqcfAo24faMHPcTSooBy5g8IxLqhRYLDUgJFX75nTdlDA1s
         ZcXOmrVQ0u3fe0irIqGU5mJDMvankTrX8uIdtfXfiVRnA40bUAkYPTu5GONeqhyqjApX
         PojtiWt2vyRcmS/KvpYJ5h27j0w0fsFXE0i+c4G/JjQjho9/SqdY2HHKmD9aI72JwVQo
         XEYQ==
X-Forwarded-Encrypted: i=1; AL+hErEGamIwMJDgvQw4fSmBRzFnJOpAgBzwrZ4GzRN2FxOWqF67zIPWmxjnUVQxnwHsgQm5hXL0GyunUi4p6AM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NzWh7sDMBpCtmLmhPJnsF3LK/w6TZMEXGztkEkYYMWLlRR89V
	nmp8I1/1514NoeRCHccVctBpjzy178biKdSPPD7gcFFWOjY2jn61pLQumJujEAeaKvNIScbolIN
	4Uicle2Ru9gjWTjRWKhEZWNAqQW98SjlPd/w5dpk4BKqCMB0Kgjj/eBE4yQkTJRILN1FNPulB3M
	aBjZjiE8W7WZPhuBHE55PyViX6vXj5p7X+qNc6bR858g==
X-Gm-Gg: AYBFou3MMhgtM95oZZsPxv+0m9mVkW7nLaAr2qfo29T2QCmkJCTJDWxUHtzaHmdlfrm
	izJdZoC1+8Y74WqzAiiKsQXnp/McLTHtXEzzozD+ZzCag8b58Hqr3WnE9OJiRm8LtfOUixFE6gK
	y3PKwK6DhzOHtOCsw+q0ZNPJ9J7bYUi60v2zt8/vI1yQ/u3HORnVr25sEtgWRnzTW9dQ2Ws8paZ
	+a+gQTfwoYKNGTUo2qFTQ==
X-Received: by 2002:a05:6870:ac93:b0:479:47f9:27f1 with SMTP id 586e51a60fabf-4ae46c5620fmr4972456fac.36.1794490694460;
        Thu, 12 Nov 2026 05:38:14 -0800 (PST)
X-Received: by 2002:a05:6870:ac93:b0:479:47f9:27f1 with SMTP id
 586e51a60fabf-4ae46c5620fmr4972438fac.36.1794490694085; Thu, 12 Nov 2026
 05:38:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110204732.531432-1-robin.clark@oss.qualcomm.com> <141d09b6-8635-4e9b-ba50-3c5f352bf045@oss.qualcomm.com>
In-Reply-To: <141d09b6-8635-4e9b-ba50-3c5f352bf045@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 05:38:03 -0800
X-Gm-Features: AclHuK8IvmQSAh8MLCERgDgD1nk4EMGzjbERLsRckPKn8tpmXw-AAtPEd21ydVo
Message-ID: <CACSVV033yjfbbpLMOMtWbSGe9y1XjbVmveRGMFDu7VzaKAAd3A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a8xx: More nonctx list updates
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: KA580O2iy6XF2kCCO4HcYycX_OFMy0RV
X-Proofpoint-GUID: KA580O2iy6XF2kCCO4HcYycX_OFMy0RV
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5c147 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=RUdMuCsKevVNhb-ASNUA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX/opdGbTbdJlb
 35jwCSkaVurKNIY1nSXcb9xth0fLeepdxWOwuG7ARywzKYtsWIP7OwUoFGyKwtAjogZFcPafMis
 9JOjYVMZcb1Usk7QUcE5/TQqN6DRzyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX7DCOYk+vW63v
 2MOOo6vksc2aBtdsPMsf20KaWls9qDktam9zxwiFDydSaW8zlb70lkRgwoaNPYKKFAudKDXwiqg
 RwAYUpLZJBuDWiinmCQRE5+35VyV97fHHn4IWElwhxT0yjlZGjR1MCvdFLWorL82lrHvwYR3AQf
 s/UUhmmF/LF2Nb+z58l09Wa4SRJyYrsWv8xtM9b4y6AdETSY0dtd+lZhTK0iTxVlVqvp5nspZzx
 aNyKSdksWHBCyOrgEi/eFIjF/1psrMV0RGi6sqsUK9AKkkVLiHb1YzcmWwdgmUYb7BE5Dl3kiXP
 hrNE7bboj56TYuhE9rBApyku5avuEuGLpgVgm/d9HZdDYF1PqvpS0GC28XHbHj70gSTillcltgV
 cBpIAqN8NI//SjB2PvQ3XncnAYuHZbdFjfspypYJuihuU1vIgYxxCTs/5bdPmZwKdg04vwIFLaZ
 ngqpXFSA+kXHWLke6cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054

On Thu, Nov 12, 2026 at 12:56=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/10/26 9:47 PM, Rob Clark wrote:
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Any dependencies on mesa changes?

There should not be

BR,
-R
