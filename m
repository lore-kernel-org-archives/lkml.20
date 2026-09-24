Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D58D472F9F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247619; cv=none; b=oxoQhyyyq6Aqu7Tx1S8aSfu3GmxqrReHBAsRrw0JmCGQOMNdxUk7yclj1zdscUQi66v8MImmWA9Tqh/gKH246YzzUAjdUGc22YnHIhZ7jcW/g1WboIsJfsgzih10cfdvLsVf6HUPcOUXwwvUdPIeRAk3IUyr1P9mNqJJg2RnLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247619; c=relaxed/simple;
	bh=fVQcxdGJaOYOaw1aI6eXlbQyaIzwy2ui/CAggsuJw2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYQi96A/rNI0YlsifKr0UOHwR4UFbT04PWPZcTTJhzptPtyhV86phWAS1hABMDYVuSIBbsm9+Scg8ZJqlGyiD8XMda6UJhLT8Q9EK1BOZ5PIzNjCpl+cNydqhN7EcZyl8+aFcvlV96oWpCcijg3N+9O8Ox0VnYWnGJ7aCx+sQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHxAQHKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNqS/D9Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHxAQHKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNqS/D9Q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PlNa1270581
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=in88g7r5SF3d0J0T8CY+cmqo
	kzL7VJf39MG9fHoUBpU=; b=HHxAQHKYufYnBu9C+hmeM65ttXwIfwI7z53k9GpA
	psh0nfdpDB2e+lX2PXjo8gDKtKo0whxTYxCj5bBQeArrs78/ZKSDtNyIlPYgpBrU
	SxK4uIyL8q1ZqBKUWfhDprjLUqyA13urRKqsjw1PkbgJBA/O5B73tgktf0pjtey6
	AVxRKTgPeaoOZkQHuBd/QU4NfV3MPH/qJKJuOlbdUJXNFCveYxBdD34BQlpeATZG
	7JBDko1iw3u6qy4Ey4BGMXXKYmhG1l+QFE2FTrSZWPgZso/QFKMyBV8xHbV7OqWf
	r5jUHJvGOBWMfhMwsLMBcek8s4V3aWfHbBKGx3EgHi9qLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90anku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:00:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso267476185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790247617; x=1790852417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=in88g7r5SF3d0J0T8CY+cmqokzL7VJf39MG9fHoUBpU=;
        b=HNqS/D9QLKMavfa6L/UngDmx1vNulYoaz/2qa/7ebAMCymM2YaXHl0KWFTOMP4ia0w
         CADaSGBW5AQXlzqsJCMYvkR43Xah7rNvEr72uyBa0DSwoCgj+Xxomb7APeCPJL/SmpXE
         T7a7hkjyUdBgHVBsRLaouXDi66KbP4MoNpbWG3RctdANAYpIOpLAORrcrWDTa6HFDvPk
         Zb5i9vNQ5rXagvZiWH6gBm8r3fFKBFmDMDPNCN9TJr64+FT5FgLIVrsZWYwB9u0j1/bJ
         MeCIxTTgYi76xsTpKgMWSlJ0xJLM66WVOzxjpk7HAA9coJ7S3UWOlrsv3Q3EKSJ6GRHg
         dJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247617; x=1790852417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=in88g7r5SF3d0J0T8CY+cmqokzL7VJf39MG9fHoUBpU=;
        b=1EDQVkFdi083l+gyKcrN6yW49elwpoMfhIKdJP6EbU6ZnxFAhtAkQOcF0URsCHjvIX
         IVyh9u3vLXtljoYIkQKwXES2GMjUjMjds4G0QtS8w2CJyQ72lEIuGVhAZI1s3DZK6qyU
         a1dpRo9hhDWC2jj6ZnHqJtVh+wsgCryf4UZDIRgC2RQ9PgBu+q2OzKgJd4K+NMObrlcv
         SaUhnQR5YYVIlHLup7b6rdn1thutYHMttTvO1y/WHmaApPqwHhCS2dC+LKngd/91UPR4
         otKKugKku9WUmsm6MC5s3rIZTU2CGtJSwJnLSEpLTQ46ZQSTKupFL1qmkK3ADEd/YTxi
         GiiA==
X-Forwarded-Encrypted: i=1; AKwUvBzecmzd7rRbbxOyehXx9CVgrPY44iI0D6rfQodjN7s7Zs2Tu43WmivwT1L49CZw0wrDQpp6uihciyizsnU=@vger.kernel.org
X-Gm-Message-State: AFuF++mrKjuSTx+8m4BQ1eWKXVa5NnuAIvPYH24Viv9Us/QJqLmluUcm
	0s+FtErXXV/byCw13FxnpfkUZfU6d/2E18AHVvRQGMdo57CdwT9HgQ88NNRUhlYRXX37BsEgd5b
	9QFyXjJPlgJ32bIXCwLsnWtJuMXpXfzbDGqOArBa14mHCaMQ7WUSXmc1/SIzGdX9cPDM=
X-Gm-Gg: AYBFou3xkbO58DxSvJiQ7GE0mJCNXmyMuMtd80hbzEBDk14RIhY6v+wa0V1iNV4OhaC
	eWkCuXPq5vwphuD37AFd25kmMMw1XhvdG3MwPYSkqOxTS5TnUZC4F8JQkFhHsl1OhucM1R4Rna7
	DDNVXaNR1Q6zNZsTCbAyo1FlN7Yc5HA8YcdYUO6bvs6d1UNH/0DqpFNRSHpSuPkqTVfwF5rGiAM
	sF8O3svpTtvaxbZ4tyWd6o1/MizZMMXPG/W7Vuq919ekjtRAlLryhiMBn7FkHUOH5jh66FjF28l
	8jN4iEqAB3MLb1J0MUYCxIBSJNsbnVNh5KvcH90NCHFgPzPP7WOylv3kH3eynJJ5/ox2nNKv1jE
	7zQmaG38xDBlI55w=
X-Received: by 2002:a05:620a:2911:b0:93b:e6d3:b33b with SMTP id af79cd13be357-93c36407185mr252050585a.59.1790247616361;
        Thu, 24 Sep 2026 04:00:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2911:b0:93b:e6d3:b33b with SMTP id af79cd13be357-93c36407185mr252040685a.59.1790247615301;
        Thu, 24 Sep 2026 04:00:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4cc01sm54580845e9.3.2026.09.24.04.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:00:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:00:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage
 subtypes and rework generic parts
Message-ID: <stanm22bnloxjv4kdukrzhl6tmofgiezz2q25rhaurfoh24lp3@ernh7jgxsiou>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
 <4acd4d53-a444-4282-9bdd-1f2f2a487239@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4acd4d53-a444-4282-9bdd-1f2f2a487239@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NSBTYWx0ZWRfXzcleNI0pX58h
 7frmiQj790Eg/nilx7rcprhzlLteaC0+pYRJT/l4X3PbrTqfamR3JNqKTGm7WAT5UcdVGgK4bp+
 GTTC6zeO516b9t61hiiGZrzJ3M2dNkc=
X-Proofpoint-GUID: W8E_XTWwCNcFhB48k6SiiWSKDfRL_K9V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NSBTYWx0ZWRfX+vGbWb0DBZGD
 Mo6G1I+1ZHrKKwS3QjjJUErVB7zID7y3iyJX5laDMnfKfcZBndPuwED/lcEXi2lqqaDyANVg88n
 RS9SEtdwRY4gA/0x0YRCZOpYnuN2nriZnvEv9lknJrXa40qRD/jx9917H6ON1yCdGK4sWCD8Bgz
 6EbHwoGf+BDeI5lkRKstQl4c7rzi7gRQlsgbFYjEcVto6uCpEMIm836krtJO21+HID0YOer8tor
 XOUymJO/IzuAdXgzW0CzXJGFRTc+4WAI9HRqx+YOjzMXOSU6AJSPa8ce11Hgj56EexlXIKxE+TG
 ys+tl0x8yh1LAzvbYPC6zz68KQyNiE2qgqpQOpCpXIgjBtGQMun5zlontRlOsybaW/lSaSlWrge
 jZHnRzsficNQfdJobg/03ArZxxEyrBcWYC9qNteW6JXhzHuFkKeftz9HstUlsmWKycd5EnqWlu8
 ugnyXsafPf6W0zceE9g==
X-Proofpoint-ORIG-GUID: W8E_XTWwCNcFhB48k6SiiWSKDfRL_K9V
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab502c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BWc8GxF-UijTqollepEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240045

On 26-09-23 14:59:19, Konrad Dybcio wrote:
> On 9/15/26 2:03 PM, Abel Vesa wrote:
> > It turns out there is a UFS variant of the Eliza CQS SoM as well. So lets
> > differentiate between them with -emmc and -ufs suffixes for DTBs and
> > compatible strings.
> > 
> > Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
> > files will not affect any current users as these boards have not reached
> > public use yet.
> > 
> > Also, move the sound card support from the eliza-cqs-evk to the generic
> > eliza-evk, which will allow it to be reused not only by the UFS variant,
> > but also by the Eliza CQM EVK later on.
> > 
> > Changes in v2:
> > - Actually replace (and remove) the eliza-cqs-evk.dtsi when the
> >   eliza-cqs-evk-emmc.dtsi is added.
> > - Collect Krzysztof's R-b tag.
> > - Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Abel Vesa (5):
> >       dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
> >       arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
> >       arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
> >       arm64: dts: qcom: eliza: Add CQS SoM UFS variant
> >       arm64: dts: qcom: eliza: Add CQS EVK UFS variant
> 
> I was hoping there would be a bit less duplication here..
> 

Do you this so that one includes the other and then override ?
