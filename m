Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020719;
	b=TR6hWqKcTmiTOPVeIoBC+MhEjv/u5tdu/vIwr4ImNmZSFFEJVUMCtbP5hNGZwfZP4C1C
	 50hW2r3u+6nqK3PFcMtaXgLCdqE3Y59m+YczEj72nHyw2EnUcHtbPG5wfkBAWoZNmdUkb
	 JR44fjAMkK/o7lEdgTIhEz9auqCGd4Zwa4VzgKqaD2RzrYhotywipuI4URDr7+gmd5lGs
	 JgjN1RHxZ8tcqn3fOKjBERnpwEW9hQ0Dif2idxOOn8d1L7g6u2xsyxR3+xSHX83Dh0erd
	 yW8c/E55okD9JRyfhKRhJ6mO6Dxqbew06TVUJ3BBxVmGVScdZmMx0EYXHBa6gBtwc8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
	b=2qhPxOA2ZWXcvoUhdNZDIK1anmHZXlCW1FRJTtck/O8rkjJ+LXZ+Lerymlb2nuFtJZoF
	 D20hubvaPGNgZctW7eUylZmXDFgvy0U/cRwDhWEPpBbV6+Io4ZsYUU/Wo1hPcSldObKiG
	 41euX/VVR2BcL3Eyu859PUS69ir+FnS76T5M7QdgTQWX2iJSkxvFyLtV1NkQwYrslnHYb
	 1MuhTilnyGkHkgWWvyP2LTD1D+1hz1a/pSwH0zHtTLckWl327oamYYuiUBo1q+4OR1ML+
	 HgTdNaHEPu9VlfiQ3SCK+KBnakskrJzSj5G6WAOEkjERLq2Zq5eQ1ZBJQSVqnFD2ZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnFzD3aT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0OFSJTF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8962606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8962606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnFzD3aT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0OFSJTF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtX3u1547952
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9I6xBe+KeKP
	pG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=; b=lnFzD3aTrzxPY5Wg/QEwuxiUK6Z
	B3ngorPNEG4sNKZf3iL3h63Y2nkJgbNshFm0EL3Mf590BdT5fU9atqCiAOAf/r2u
	qcQSrCk2SY3QnySUQG2rsyhhMYHX90hI+tmjD8RmT+KPT0HQOQCHjZCq1/2QKPNF
	On+7JvFdX0C6h0uwx/2W5JAGUzXPFnbJ8jIrYGWtrrRxbHXH/OCE0TQB5wjwNIem
	iapwoZvWD5V+5ytuFfCqsW+Z/HCKXgWxnhCr0skrWazBJzwwNFCfzI+qjh3EJe0g
	XQ9LQ8KzKubgz5gYfZ9U6jjH8pfkDnYF1i6mjoaRCC/Vmjw7UW+WVEOF0YQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstkdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f568dee56so432959585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020717; x=1793625517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
        b=P0OFSJTFSmirM306MS+S9otX9d2aGg55fpYmOAUnLgs04XVSb8LHQGMJYNQ4GsN0ki
         ODGTPtPhmFHoF+QwEx29V6ncBUxN4lidBGs8m9eHTzuQ2czFjib/+wcZyvleDozJWFwL
         TFuzZtJMpHufY1DJvYOD/s+udKmMfPrIYKeQdVxSPGl+zDVSGT2MafXQsG5zqAC2SfJo
         Jbw5MAH96jcuu/HSsaRfgmOrMAioElfroQp2C6FFxasHd1dvPebu+vLYfO6fmfr+UpTG
         0ktzWfTubfmp8s8eRUeFzW/yviEZ2O7Qtp4kSqSJDleSIIKlWj55/cGPT6Ni9Q3DYABf
         5b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020717; x=1793625517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
        b=KUWvxii7FOwaDkoiSmbCLntugXBaYAyPpMkXKMTzn35yvTVtP1804Eettu/eSX3w97
         RqMwaoXhVGPCbAr/Io1N1K1Xz6Wk+TI2WGwgAsTvbBqpW0b48mEbbcxbClufsEHw2vZf
         HgiZvmRgTHyKUIKE6DW6tYkAEoTQF39PTZzzFlGfIXycpZKQY0SlkrcRn7pF/cA/Ajqg
         oBvsatgkhuQiHbNq5jCS23lOHWT/kqDl0v0Pe4b1oY1qIkFqxmWqIc08sfG01DsXqe/+
         f1zPuYQb/W5i4Zio9aOMgyiWa6k9fv8Gu3r1F9G7ACzPxXKVe5UMFB9uimk3+k4p3hlF
         szuw==
X-Forwarded-Encrypted: i=1; AKwUvBwECmyLpZZp2dwBVt+dqSXMDky/L5LF3GrNqonjIyZw/ALOKFPVZ4X/UE1HIK8z8FiyE2ufsQfMvkbWMF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi3xXTlXwyYGWUEzBnltbZldvz3GksvEpVTz8WmYilb1cgWnhV
	97cV3dbeDrywPZhTeOLA3WpC+5e7w4aWyo/PiMfDliJ/uvrxqMDRJny5EwcULBHYznD/rMX4xDC
	e/aRhvJ7cjSSd/2C4PO6oJhpDVIB8nAimpd5znPRwDeoQJCNRh3RZXlJOUyA2+3Kkw0Y=
X-Gm-Gg: AYBFou0GHsNH8G1E87/ZjvrhwSI3DVkNINzCCG1k8Bowa68dmA0YjX+mvsnvNuP8Ykd
	6AIyl5LjwzPflpCxONHj7Lcr+wQj5fauHy0HJ1FnkAKBR8oY1HeadQLUqv7LUM/M/P0oD491+Oj
	2+sSjzHGMwvf75N5JPb/dOJB6xhCzEIazJvGC4S5bY440hz6wRGQWOxlPifA26wmF2aAF/Lxwap
	MZSeN17RcgNEpjLuOHJOhdc2JkwopShB8LuE8iW2g7yG5zuigrV7L/ZP1zVN6RlhC8L/5oGv7Gh
	TTlYEHoTJKaPxNnS4CMbSiNGSdVHuJUvVuq05IrsbOCasQfYm/lwuukkeEleCHaa9e/pglPGSjK
	cedMZO0uE+po4oc8cx+/1xWfI
X-Received: by 2002:a05:620a:178d:b0:93c:c405:3215 with SMTP id af79cd13be357-940ef8f0a22mr1031765985a.44.1793020716828;
        Mon, 26 Oct 2026 06:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:93c:c405:3215 with SMTP id af79cd13be357-940ef8f0a22mr1031760285a.44.1793020716262;
        Mon, 26 Oct 2026 06:18:36 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:35 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Mon, 26 Oct 2026 15:18:31 +0200
Message-Id: <20261026131834.3247963-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com> <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX+dL/ODqFNh//
 bXVdMEmtIdwPsQwMVYdNyipRkrPV76wJ4JDPMN7vLVn8tVz/MqKWgxqYDKNfzi3QEcXtdzXzRvk
 PkaB5gfY32LEkNiTSQIoI2PWd9wlKws=
X-Proofpoint-GUID: hEJd7ej-F6gTWTLZqMVnizKycBfsOHfj
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf532e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=CA_on-7weURM0OGBZFkA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: hEJd7ej-F6gTWTLZqMVnizKycBfsOHfj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX9bBYw6REk5db
 Nx59nmE4dVLI0LPriKBwu6qwW5QIYzzTZVIBiDbwTxdibQr3gL9c5HVLaR93kg+Rkiw6JH64GzA
 YlqOaKzSiMcL1GXO1rb3e2FPZD+uzj4pRiPQS5LeEb1e2ckCmtjLoBlUUgdZvKL9eL+aRjWCLSy
 aC1GZGU27AKwOMp+/ywr5EFtTwKTf1H+UttW429fozurmc0W9Z+58KmoAnMolbeBD9FhF1ZzfC2
 0agHC+4ir4puRFWTVoQFLPVNB9CHkcPCQa3ydxugrWdPLPFOZAcMpYMaz79JCMKHAeQ7qJkFyEU
 dFrSsQGdEHtjgjBU89i3n+4w92HgWH5h3etCg1aDYYt6mDp2kFDlCX656l6NlOoeRllVOvTWajA
 tPKlM5U0Sz7hBx9qYDp5v0vfa7l+u0MtkMyDKXFOHNI3ZKV0K1AZn9apsRXRDwaiBVOBygNt/v+
 TVgz4p8xauFiHRiFNtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260052

On Mon, Oct 26, 2026 at 10:28 AM Loic Poulain wrote:
> But are we still comparing the pixel rate against potentially
> non-pixel clocks here, such as AXI?

Good point, thanks. Yes, AXI is selected from the same value, and this
patch does not change that. For RDI it is the line data rate (pixel
clock * bpp / 64), so a rough estimate of the write traffic rather
than a pixel rate.

A proper camera NoC bandwidth model would rather belong to the
interconnect work than to this series.

Regards,
Atanas
