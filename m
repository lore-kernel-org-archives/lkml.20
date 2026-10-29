Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260248;
	b=v6jvf+HWe/fAGyHDZ/ikwEDlNFrW6jtTFxCTRnoJGrVzxb++gnO+KB5azQolcN2Ze08h
	 5/u0CLGQzB682rLOpOtjcoe1/tW34gAEMEwRx201uJfch/BGEiG3a0pfJ8zaoyslPyHKn
	 1c7zs30IbkiYWO5plj6E0OTNJUMPbDSf4BxdS7uvAA+6Usj5v4e8oDmMBZIUryQB4CHUW
	 L5GhQ7xc/bUTaQKwVboeDM7vPqrTDLqydvjJJr6lqyJf/iYLEgEPbLRH6PikpCy/KvjPh
	 o4coWzTweNQ0xQykGv7UGBaufpru0PpVt9CafutI9TfxG4Y2HDCYbta5y3iOw9NCzkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NRjITIPkdmWIGWowLy1TC+g49D0fUwGLw1HxPYp7dRg=;
	b=CI1vL74rXcezu0DUVCG9TpLoJ30pRm2RIfYlrrPwuuLueUJ0niBoV3+pCgALQonjBeTm
	 Prlb8If7GQAIFvw2H3FiaMhcO8ayYkxCMQvHl5qpwO47/prJlegW4/EHvrPk9gJA2BjdZ
	 wHnVxELKM8TKdIEs0UXz6YitukR9JRVbO4SHl9A4ZKvwPznSXZC7OPryyCZoH1h+orzxg
	 m2hPvpvSl1vKYNteJpQ33CmdcCvA01m/cBbIM7YS0X8eqWUP+Xu7mQW6fRekIQ6KrRaF4
	 zCRDlauFnCVnDxmSvo58OLE9bseqxhpE/wbshWAw2Nfuv06JTa2e8QTmYvRGjGhEsEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9GB5CwF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Dq/YHesS";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9GB5CwF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dq/YHesS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HCwk2244621
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NRjITIPkdmW
	IGWowLy1TC+g49D0fUwGLw1HxPYp7dRg=; b=H9GB5CwFLiO5T00Hz8eY6N8cqBf
	Zq+34UgfeztZ0VA5dItQCf+rQHeTHWp4qsFS7FsHIA1W/jF1/zKydiN+bhS8FEHw
	9wZ0ClUjLSKCVL+GCkPWz72HdTm0QR2lpn5xFlAkLAyX8szPqIwGXiEUuw+hkffM
	lR8JKMn2WfihnSjWhSbggLU/wVTK88GhfY3ovaLXwBETgVmyqyAgejiIGu8Jqm2O
	fQ2UAEFHVpQZ4eMMVbpS+Biw4F/HrBHnOZfMCzJ7fdqQzlmUQNZjPI6dReVW7Uar
	c3LUVr0pG8nmulbfCrc/VR4AZcavxUO970pMTxs8QKMCjmtMU1r96gZKrHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s8n2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:50:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so375392885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260237; x=1793865037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRjITIPkdmWIGWowLy1TC+g49D0fUwGLw1HxPYp7dRg=;
        b=Dq/YHesSlruM8oYYOdePIQ3WMvkiITNBWS5lRuDNeNWeKahCRRZDk77HfhE2qz5Zvc
         +EEYnH9gPOlRSASOcK2yh+4yuQxOmXmSXXWRKPh1RD4WSrApyXEDUgWPRJmk/m6kUqVE
         vQwIcaUt65MKuagLCfhuRD1tS7giY4rtAXeBLuzsh7SCucVehqXKNn9CMjRHpDDBRSsm
         kgbglsVbuMT/IDJh7eMazhIHBwCOigvlORjC/O1arU8FrmxyyhkLJurLNop7HKOfrvqJ
         UebP70DSVlvQ82XGkpyjiVPjy8qitbahkeLCyJayfpTrm22pyhC58b0uxfxrflQzzsiZ
         4x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260237; x=1793865037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRjITIPkdmWIGWowLy1TC+g49D0fUwGLw1HxPYp7dRg=;
        b=KoJyfkWwlWu2mKq5XiHpN79X5NeTkkK5N8WC7YSrbfM9o+rncW6+h21D05aWaC4ENm
         r99aA6RXtR/tUv5AbM3nfJ2S6scD7AJHjcEMNsBIAs9RLKea8F2iH0/mPzSLqDTkJtA/
         a5SaP/l9MQTALTTFEE+DL61po3sQObascjnCy/qlCjM6FuuGHeCcI5p+3l++GN+GtKWX
         +kEls3e8EFfuyZL54ugpghSrdDEqoAc+GANehhfBgp1i/ZCYsLGHvZJJK/ow5AqRlBkq
         bXS48GocYO24e5kaXtOW9vqOUDZcr3+WCvJcBpCdhbulL5NDD3ziWhLWVfUYDczzwt5P
         YpkQ==
X-Forwarded-Encrypted: i=1; AKwUvBygiaN/n9g5DDv/Snr9VbWCqNld5ZR8qfgBGqeEEXI2Nm2HLvGfazQ0sUCpYcz4WSfcOs2It/OAza9OXuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEPnb9riRkqyXwMw8JGGCYxGkZX+KLIIccLzaYdwovFh8OOEYo
	aTxkQ/KWPOsvpxAbom3E3YC+uCgTufF6O2cEqgi/ZqZFEWm0kaYsBEI87k3wTLeYc9JOdr8okcz
	deUQFM9CAO+yE5zWJax1MyWaHm00QZjYmD/0ovN2UvZhrzfp36+4YZKvBPC8J52l2P75TWQFGaL
	JOaQ==
X-Gm-Gg: AYBFou2yZRdBkSTuyx5qil3PVJFhx7VcEIgyZs3m6SeBnEZi64uyVK1PG+yyN5NeAEV
	sSBVjixUSTDVu4jNNFUlqYIEelq0i5edIzIIQXZnTjqII7IjItEgwE41YF93ZE4H6q+df13Gn8O
	NZ6WZ6KOOgs/FVP5HADnhr6nuLzdNdUzBItPbcJmJUSW0eCBvqHh/EJ7l6p0DGSSFjTLLNg8sNC
	IVAQ4rEJuXK99jCz3+SBZWWF3Fx/ki5sjxpLlYg4incp0xL7XrygNP9AvSI7B10tU7g156qAfzC
	j9LzysuBN36lNNLLYkHqjoyB9ODASwSJfq3gVREDBPsiFoSlsC6PTlJZX8K7b31t9fWKfksFddH
	QTFVkznvZ2XKsLhgFlRaWhnE37r6BPKQvVv+1MV8ed+6du1RyXGP9CiDnSZ6ty/UrtsuJBghNRw
	==
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id af79cd13be357-94408cf77dbmr715123085a.58.1793260236644;
        Thu, 29 Oct 2026 00:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id af79cd13be357-94408cf77dbmr715122585a.58.1793260236287;
        Thu, 29 Oct 2026 00:50:36 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm31876763f8f.14.2026.10.29.00.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:50:35 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect cells
Date: Thu, 29 Oct 2026 09:50:33 +0200
Message-Id: <20261029075033.3558229-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6ivurpkaxe7rs5lxpbyahpst2bqzpkcb67whcymoopdgo6sjvq@xd2otcdpe6gg>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com> <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com> <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za> <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com> <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje> <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com> <20261028174523.3514860-1-atanas.filipov@oss.qualcomm.com> <6ivurpkaxe7rs5lxpbyahpst2bqzpkcb67whcymoopdgo6sjvq@xd2otcdpe6gg>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX7CZYDLquUKpv
 cDgGBBue5MUIbe7TJYf3aUJz15ANJCK7OKYYCMqETpzEFyzA6WAoEv2UqJc1Dxm5w2Ve2SyPl1i
 NUCCUY3u4e0LZkyz2ot4n++6azUq2aeFKE7UO3HTbqbE50F+ZMMhBNcs+WJ95IF5ugs0ZJ3S1GQ
 ivoXG/Fs3Kp87hW1wbUmzjGxvbI1dDljqlL3bA+U3jypdD6K/RGJpE15n/5vZRMFJuPpaKpfTDC
 F4FCcm0BwisLLS6ABkpiDoGjjik53wvZHhuL1fcCvbjOCsV+i7tKfn9Wk5j4OTFAFf+EehBo1GA
 +YodwQ5Lr9fZlXZgqF/umSvR4yxa4xrSvXGM8kY4jDVNerksDqvfiaNYG9YwL99Nd9gKI1Mt9wo
 erlkF5acnHLifr/iuQ5zgnPJxgyEp2OKAKpuL4upsUu4lD3sFbsdwzWlDA6B3PHq3mV3oYldaiS
 Gwdsv/cAVXEYNn5SuUQ==
X-Proofpoint-ORIG-GUID: s8d7UrEYytHsP-bSbQWATZqu7JneVVun
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfXw4Rwi2km2K0U
 L4DhTOZxNUaj52ziIvgsvKzDRkk/3REgkqKSvgJsQ0//4euPQvi4e9CDqVAHIHbaGztyojKy6Fa
 3WZEVDYE1bTJpxF4pqTAV0CXb7YuWAU=
X-Proofpoint-GUID: s8d7UrEYytHsP-bSbQWATZqu7JneVVun
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae2facd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=tiiBXXJjtJp2WioFvjMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290030

On 10/29/2026 3:41 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 28, 2026 at 07:45:23PM +0200, Atanas Filipov wrote:
>> 			power-domains = <&camcc IFE_0_GDSC>,
>> 					<&rpmhpd RPMHPD_MMCX>;
>> 			power-domain-names = "ife", "mmcx";
>
> If IFE_0_GDSC is an (indirect) child of MMCX, this is an overkill. You
> should not need to cast votes on MMCX, IFE -> TITAN_TOP -> MMCX will
> work for you.

Agreed, IFE_0_GDSC is a subdomain of TITAN_TOP_GDSC, which is a
subdomain of MMCX. I will keep only the IFE GDSC in the VFE node.

>> Does this match what you had in mind?
>
> Yes

Thanks.

--
Best regards,
Atanas
