Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792534106;
	b=XiT4ggPlYSO4VSB9fPbHVbnP70Au8DmVq9Sr/u1ZftEoLNfZt9UgZvIQ5hjSCQ2BrVJd
	 heghooUrs9YqZhzHJqtQ831cx0xRCVMvFpj48Gw6UmF5eP6ciZu9m8OF7J/9C0geiRkNb
	 Teh70zJiBkcJoGRB5anfzqkVuwaMDOkD3STn15tC4KNgMwqN/mrR//wNB2XazXw3tvhwD
	 rO8EZW5Cy5GP1fGEWl7FAR2v3YVzqNwhuAEIqnX5AedagNJ1Z/UHKPwhYLFg6v5TsNKVM
	 ZK8umI16DdyTdLCboEALV4dSfDD+zM0pPP+5986TjgqqTVJZ6oZfKY1wotFnbR07JuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
	b=ZdXymPrRLlxunhQy3/K0r1DQu4w6qJqguUYBlwb3UEJCI8V8+eHE8CcWgHpZYofhAo/K
	 /aU7NkuxFTdwwuTB+I88ngzspkygGOIGS6fp6mdXMY4zOj1acF/S5OSDSZN0wd15A8PYa
	 D6qqZgTpPh1hEQuvjAgtq9jngDopLp1XlZunY4CyC7yLdluNfZ5pc8uxQrdjRo/p0qjXO
	 xrWF6RYLc+5wM2myJT+TqXdql5wft3sThM2e5mf451rW2Cza5oG1rx3KnaARJbDvsgq6f
	 fxgzmG2KxvrMKmvyG38z2A7KTfPTO9LpREF4ON/m06fhjOE+VQLlZODuURu/Jxkschw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E0F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E0F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtePa3856203
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=; b=YlaRjfcqXcboaVER
	1sRzZAh0HZmehbrFy3UhCVu3vYTichraLfUUhymZp7bS8WmM+1ILHlTWUJND9zH1
	molG1kOsh5qZXu4oWndIDWnLZYCKH5bhpLi6x7KTJOgQfqirofxKnQIxaeQxDMmZ
	T1ptdo6i4RT/9PpAHw8RWDrJA1UBA93lUQ6EvzTa/qWKVJrPqHe/hpRFmntVORul
	huURSP231+POlZc8B4gHgfOJibHq2Z+pltWIDWIcz0cUfyUsdLmvtm8pRMYXLrF4
	VPqplyftx/lioIukz+3RRBitIdinjEeC4elRpAXXTxtCIBRQwUlcOeoAROSmvKWV
	sCuQtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabgt7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:08:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e941532594so471375ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792534104; cv=none;
        d=google.com; s=arc-20260327;
        b=WrmMZk/kyJxIl+S/NTrWlPMTCEDO+XPimghDHJy5mAu4fR1fUrKgzzPNVlRb+RpddX
         gwadK/1UOfsVcX7B3mtPKlZwYfsu2dA2iuNy6Q8ih5QOfErXHJhw3cFzJP3lhBFnUiZ9
         1xkpuk0qhV7798pn7IWu+LBltYmYIQ79RsffWQ4SvXenrOpI96QO1HPbBKUToH6gF8sM
         57YzFZ0M7znXac1V8eWQTdb4W6jAFFBjINqeP9SU9ivK2YoYn8aIP6DOGkrAGKpG3Kbn
         Amo0qKdKOSiDm074JwNPfV2plbOf2+3Pdz6zsxPeyNYEVNFHkL1SYGD1NluITmunRGwI
         VrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        fh=87T/AwobbQEXkpqHa9Ll3Mjj7ivPk4Rj5AUqUeSDCew=;
        b=Gyh5It6DIRsIwn4r7Hz8R0GCbL17xic+Q038C9ihbrw/V3UweBJks59XNhhaKYMlLw
         75NIaYMuJ3gKcxzswxO0dBs6mBA441Wal6tN1jED4a2vkXYp3l6dJZrG65hgbIy8azcI
         e7zMNSOPSq45G6/4r6ZTxOzgY1RBZdt4oP9qbF3kwkQJuWF3n9aK+mqTSJ5hE3GCHLSO
         SP0LUvbatkwq7T3HO/Bm4VxooRsGNcGRVaK25qOBV1Ob2sHQ0mD0evpQdeFy4kZFtJJS
         gW1Z3lmOnCacpxZ4iYdjpNWvY54oXnsBiKEYpi/3lsSeQmjqNXuDWAYe0JrgFK+TrMjA
         5zMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792534104; x=1793138904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=VYJvx1auuDRH2wVC08tOG9Z20YTD5JPjYHPtr69HH03y8NFtkUZcpGNLud3yPWIP1u
         miaymRq2HtxRfK6hs/X4WIkzzAYxIt59HyXwmDxmKCJlrES/2eqUjmZp4gjJXWFkTRl7
         U9p0gygH9rfH/75K96YMOdfoTuHvwtYJnj3rEFlfT4os85Vjb+hPG+qrDGs6u4Relznb
         tKnrZ0kK9mQmeSZtDJLi423qdZ8CuVYqdOIHalNpruqMDr1Ji//ryJZKdzwhsGDwbmfE
         IeEt2OKM/hBAcXFo0hZ1cSjnp0iPm1TUBzAgiqHOeqwkrjIMMMTeilnuummXGM4wtwqj
         t89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534104; x=1793138904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=XHaJt+FO7Hy7Xe2lv5aR3dfpsZAaeEL+Odaq94KGIUZmdN4r6TIj692h1weZyDNof7
         qzyvIOmLLdY+7bJKN3UJdKdK7HaPasqCNi80cnIrR+CPC1V5elJ0EsHLLtmygFUxF2Nl
         G7XhQB4Fwkuyu3CtkW+xRG/vG4n2aFI5efbTZnEt5PM9J/kWsZxFPBlIDBFBXxyC+Cee
         beuooeOF4kr2MnQHZ2OnHE+rMAy3Zbu0vZIwGFK+WgsQLkPKyknwqoJxoz41h5iS8nMv
         0SYXAaTYJQPicTRZrWRo2Ly3PDvTOkZt7SDjeFIoBNsKMbTUfdQBJcejo3OaK/EFzJd0
         A8Mw==
X-Forwarded-Encrypted: i=1; AKwUvByG+NehsVYuD1Dq6F1D59p75CsrtO3cpoB+AURr5PCS9dESxPqQB5mKnfcveOB7EMZI1NBrbRmW/99C5fQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPppY39xXA6wVRwBDoSKbJKEt3iZHaOr+KJSaraP+P8LZNEIIz
	dxQfYxqyy0em4ITnljF48Ss2EsGc7YRA8zxCLtu6mgG4LJ+OWEH8+/CxCJAC70urhIboFzbFLlr
	OrrYo1dchfH/KquO/M5+LPQ/2alaVUmZiA9MZXtQtCT5X9hhHxbqgT7gXlOpwE+2pWKx6GwNn0X
	WTyckXycwSfibSHyyddO7T/wp7nxpcciRO8I62Y4gAyQ==
X-Gm-Gg: AYBFou1DtkPFCv06+NmJlb4j8YTxeafvRSq5hhfZf8KYIG/C7zbHXmr8Ex2KEzCcNnW
	LwHs1SA0APmky9jJOUKRAkK60GaUHorwRWp8cYrmFAz5yyaoZ0Jzb1TvEIDnXtHDRW+JGfkavfn
	PGiQ5qIGEXU2nIRfdzTDp2xCHcCMevJ+tBZPDXb0Mz9TTbt69iKb9sC1fyF9GdJsoB0KL3nw5DL
	jzrSeYQ0YiU+tu2JYfDKoy2cm1xXqkKehWjZEyL6MUFOxU=
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id d9443c01a7336-2ea43cf0d3fmr947245ad.57.1792534104148;
        Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id
 d9443c01a7336-2ea43cf0d3fmr946955ad.57.1792534103541; Tue, 20 Oct 2026
 15:08:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
From: Loic Minier <loic.minier@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 00:08:11 +0200
X-Gm-Features: AclHuK8EIJ8ZjWBQ6mFXW1Y_Kcn10ejjzpfnSn9R3N6EwnixFcyxmqimJkA2vVk
Message-ID: <CAAwKf-ftxr5fw+1Jkz17YCROjDB1G+7aEZnDyD-zs_d_OrWJJQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfXxbhipLOEyii7
 t0pTts6aSfi0UIpI8OmOv7Ksqs5UMheEmFMkttBDVALYCRwqr+NYNz6f++Y89GOGXEM/aa38EBj
 rs/x0J1isVvY6deMO/x/g2Prb0ZguyY=
X-Proofpoint-ORIG-GUID: tJtteDes3zrgL8hR36YXAlKWwGRxWBMn
X-Proofpoint-GUID: tJtteDes3zrgL8hR36YXAlKWwGRxWBMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfX3NPg3dl/zIB7
 rzV+RMvRFgjR1vF7jl6VnICOiYzew/zjSJTGCSek8FRrqSBNoM5YaKMoT1W77oNKxE1IDLmADxI
 a9B0ocbOf9YaIhcGRSzrXz4B3LnC+JJCyXJXqoAue4v8hC0hlxBMlx9BIgc113o5IaIBP3DSUfH
 zNr+4b4xpWKfne/UaXS68oF8sh6mVXO/eojOXghZJu2W9G5iID+H2WGh1XOgPc5Zk9tFjq/BTK4
 /Y66QkoKTF6zt5De7iAARhkoZKwGw1pQvauzXhEoH6ST0dkh+mIA3QZsyRM7M3ejX7BPMOnmvYO
 c2gCZC3R4ML1zS+Dvr5TI2mQ4Bq1436+Tq+QpWtt4hPr2fuGIv1gMjVn+Ajs9nssKZqTVYqw55v
 AaDrJE9SDi3ZyHA58BCb6VQuMHaj8UiFjjj7/zl3R+2oTUx7O3iSIyL+jsrwfQY3iQzIHy6LTyF
 dZpbCdbFrVv25Gj+J8A==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad7e658 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bO4u5d9499Dzb9AJ53AA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200088

Hi

On Thu, 15 Oct 2026 at 10:59, Konrad Dybcio <konradybcio@kernel.org> wrote:
> The Snapdragon X2 series-based Zenbooks come with a bespoke embedded
> controller firmware [...]

Tested on Zenbook A14 UX3407NA: hwmon temps/fans update with a
stress-ng load, keyboard backlight levels 0-3 work from GNOME/sysfs,
suspend/resume works.

Tested-by: Lo=C3=AFc Minier <loic.minier@oss.qualcomm.com>

Thanks!
- Lo=C3=AFc
