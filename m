Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794397529;
	b=T3Is/mX+2iwSdUuH/A/C2YhY+e7lggiIuA0klD2rp873vdXp+rqxUzVKkHCC05YL4f1o
	 JjVq2wsMztBQPVt+5Cis2hyBrVAGL3ZPDHs12+qL6pUW2GsMNjFjigLdRfFQOV4nbF8qa
	 ZGPjQX8nKcXNoCY5CI1Ivzp+mwWPZiUzsAKdOlf9Z+7y0bbBMPLF3xe6sYZigtUfhuIsz
	 +ISKKqy3/lDBc3PtAMQQNBsrIPkZMVY8iQmItsaHVQBB1vHgeh3nM64FNINnwd96m7LeV
	 Pd7kWHHPH3mLsQlFPiOigvxyeES7UzFIS0I81A56QL9jtDf8TWj733CIfBFB5hejyPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=;
	b=SZzU2R70Qx+nrIyMSHhCkhORoyPNhMrlDukSdJmqT9dEOqPS175ch+hkzweD95V2xQPZ
	 VG7tgtxknR9f9RXjdKISKC+DCwb+Asl0EycNRxvJcnFPoH3BzqDsCXwmcK1mGDHgUgj/M
	 JN50z9DRmGv7oZxDJCSl+M0tqQOV24LPGS9jgxAqFjue/IFNG30qZnlHoOicaDtVgbEWJ
	 0+tzbd4oV7xHa4ERXTmAq96P4d4R4dv5RGuFA1A1UojS+QOg7+/bn2JTYe9bqhnrJAA7P
	 Wkhk/YvxaGZB6JITnfpS0QP0Ieht/6Ys8T7Bjr+QglJKUWam4gqsLWgXUNEmmxmW0JQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oao7cg3U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fizQnXXV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B45606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B45606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oao7cg3U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fizQnXXV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7DOLd1590006
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=; b=Oao7cg3UF7NY6s+z
	6sW8VGmSVL1tUcLz3+LDLQmI0pzReNMUHEIgkamwDqPzh/A0eObRQwhRTn+e4aTI
	1A80EEiKnMZiJTb9IaIAy/HvIgjnx5P6/OrgQT7hzBA2dRze6Tze0Z7HCkOdETHJ
	ednLib0DRUXjYHTDe2ENXQ7uPJGRqAq8DCgWe76cnvLvkIxsjH2rmqkuNz+/5e5P
	l1K1OFHHemH9G7qONWVEmv3rok3JdA20MD5zkVLQLMlemnp016+1diLiNAuMIYxw
	vr0lt58mfSwxUpidowIJ2ZLRRlWUgpW7J3r6SF+gNnLzBvkfKIu7dnUmQ/9x4s32
	aLLlPw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm90pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:45:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso2092038a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794397527; cv=none;
        d=google.com; s=arc-20260327;
        b=EV5PAVN4ZfUeZpTyzUoQZtp5mwxPo94qNtQtlTKp4JfI4+Ol+pbuSVLwifUUoyjHyS
         2gI7/Cz05CTeiczLjvebYYZZzT5SBNy52OBR2hLTbcBsV8iMg2JCYTv8j5M5lXz3UEtk
         eXd+qAiyEkLmP9O6FZ2CfFykZrVy+YCd2/bOXBMy+g/+DHBdNoBI3zzBu2AlCWATWbcV
         NJhQDiox4lboauIJs4EIn3Zdn/aOjxLRmW11Hth6CMsMExrQiAh2J+ygkSj2BZ17+IaV
         U4Xg9mbI1aT1QQvZ2Z4JNQyvL/k4zUvkFqqm2OeYPplkDsT0KcwbdPx2eTPJ63DbJKIO
         WJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=;
        fh=k6uxoZO5WktGL+0g3T7rQwc9SDTrmaLbmEzItSdkSW4=;
        b=T1JWuDm/Nf8wKLT6OA2b0xYjp89CAq/ffutirjdB5wLIVP6syUTD2TZX+Qc1Ka9loI
         ILAg6g3JdFyCK01aiRSwFmaMTrolA+hKn4qMRe6Uytv9U3nD4PKj81KuMZeLV+ic/7dJ
         dCLm6dyzD9gy7h0FKMXjtjGABOlL7z5/uLipp6Ttz09qLaIScoHzEOKPDz7nInTn1hsr
         OhTq3X3XaTWE/9SyEcM9a1T9jh7n90vWYGo6fC1HS8bmyrwXvwO5RG72Psv4f2vx8SmC
         Ej+PU2dJ/Tye32lN5VSi/q/34cgkuex5hVfmf2jMwy1LrqyWJ78Dr3AZgLAMt7wSxIiw
         x1qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794397527; x=1795002327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=;
        b=fizQnXXV0pB8LTuJ5973+bMig8pBhhl1S7kOBtZF8l6oi4ls4XzIHrUbcdlQCxUy7c
         qO9puod2T/SqaNt+dmLEAEgEEbaUppL8+8Qa/Z1OrGNgpIKBFyGTm3sJVnkm1fT8qkRb
         u/tG4lNqrHO5ScQDyIuCj7cA2iiIvmF6MK94dih6OqkID2A9ky0azhmfzdHoVceqAyof
         nLo0oj/5LYObgYxFELjujuxynoto/2tsGMXI7ZB3MOJJyBJA2OMVzE9Q4UYNe4oI30dN
         +LQbBpfsvaQkFCEw/GP7TbBAWB+Tg4EN7AY+9HyyKKizmjvqzVeo22Bhk3a9q01FsNkF
         HdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397527; x=1795002327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=;
        b=DBk6z45Qhnc5mQ+xgfwbJKqZM9nCzPZrQUsLT6JLjE309HixdICGIcvnIHrHbLaVf0
         1kYa5PWf447UdY8WysZQoNOocpLVwvRDjxiPhoZniFbFYdkRABcc1C4ez+IIEYMmuac3
         ETQozKuO/d4vGQOQir2seTgLT0+QzDH1xPBCXLm6gHv9VH84nuIFH256N2BkAMh7BpfK
         lOGxaQ0AcQ8vnl7UT2IPc0yF96KRwkSLPIDKzdxPYZtwfKxUqHyO2GobPRgQ4MEc29Qg
         uroMGeIZhpcOAGfJluXHty4mByWmBoOpBrFWI8iLs7q666VngSB0bad5moGpSlsViYAs
         8Hgw==
X-Forwarded-Encrypted: i=1; AL+hErFOmf36cyAz6ccELn7EIOwzvX6xgo427lO7MUxXWEsjvevQLOFIHkSpO5qBsOO47qYYESm4h+hYvBpADnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RFn3w99qQZcEN1zg6NAyMXxM5h+nwbBBj7uX+80GwakNq36sS
	0VjRn3+HfUPv3nrhHkD+hjD2hAi0Rn2ePlqy6dTQYGLFBbfXfEeqrPsA6M5Xas6D7RGYyYe7ZQB
	VILpQU6xAepB4nOTLBZCs3BKJsraqYz4D9OEQr5psDEOOkKaTywcOA2kHCVzrPiGmaQdvSPnZTU
	W5JrfNuxrv1RN4BZcL83wvmXqGVXh4whHkSbNzp3VBNg==
X-Gm-Gg: AYBFou3OxstWNltRLjIaMVLPEAKNvuVBPFSbcBXB4iq5mJD34ZdfWEpKtewXNN+tapP
	ZXMEfmenjIgMWAB2CCDQsSdOcgXWFWyOp6yMzzZ+FOhghW2BAIKnmZzIySVcIF+FgiBAkqPbTZV
	L6+NyaLddOZNPpHVnXdkUnlVzn0FiCUflFzL+bViglwtRt7+ZGZ3rZC5+IDA==
X-Received: by 2002:a17:90a:d648:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b182f670bfmr2139905a91.21.1794397527161;
        Wed, 11 Nov 2026 03:45:27 -0800 (PST)
X-Received: by 2002:a17:90a:d648:b0:3b0:91ce:6726 with SMTP id
 98e67ed59e1d1-3b182f670bfmr2139888a91.21.1794397526705; Wed, 11 Nov 2026
 03:45:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030215427.488298-1-marex@nabladev.com> <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
 <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com>
In-Reply-To: <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:45:15 +0100
X-Gm-Features: AclHuK_0eILUxZKoBqhaHYOj-lAecM7Lt5i6JT97Kq2dLHdRsEfKiZp-ve4mj5M
Message-ID: <CAPx+jO89Z0Z241L1jyB_3sUygdEwGicqT-WfHc6ppG8egHUO2w@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Marek Vasut <marex@nabladev.com>
Cc: linux-mmc@vger.kernel.org,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, kernel@dh-electronics.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: d7NIOJEQ39KZy1oEjQCGBcw_3BYd4Nfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfXzYruq5K7NFar
 QAFLcZq1yfo2rtzuXe/N2MHRlSvHVqIVrdzaUSoY5gdgYUQtH8xQb22JkDzUb7pRaUhmb7DV6XF
 F4n7BYBHmHUMhRYDBS0OyUB3yuyPfqz0zkCDO6zVsEdsc51jPjE187Vy+7ZfWwM7gYM8YqljJ7W
 3wbYFHhJZlZ0qgRRHamkUrbG+9DpUvJSYQYUjm5gYpSU3se+xG8ahVy/HTcmEjdwAQSjUXGhVY4
 uL8Irs3B3RNE7VEqnuQH+m5U3VEbkHXcbA3yK2dUYkIFRbSKD9tCgqBpEleLqbQwCSUOqozmW2U
 AC9uq2Cj6TCm/V8XKgvYUGvZkx86vaI0SBHtwhbcTaEo3uK6NEF75e41GVOTcKjNOSaqvbMlH1E
 e8T+Z0gU0NkCu3zw246YKaBzzj26yuWSU3pDx3XR27PdlOqBQM/gXyBOW2ak3wtiwUQOZU7zShG
 +MjFRstxtOfuPwwVgkA==
X-Proofpoint-ORIG-GUID: d7NIOJEQ39KZy1oEjQCGBcw_3BYd4Nfh
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af45557 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=p-LfKV-GAAAA:8 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=zk4-lHRcAAAA:8 a=JfrnYn6hAAAA:8 a=phlkwaE_AAAA:8
 a=sBGgpDb1PmiqPw1N_U4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=97BuGM4RKn6GwmfqMd6i:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=7cv85riZL9-k45RWW8P6:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfX+rcFRkTa7uCy
 ml9aTsxmod0Y00gRRz6K7nFGCuixq74MRjrmIKv57bq9n1hM7wLjnREyYhgKSTVDwxdmC5d2sER
 jbPsHQlwAM3mFyJAWZgguRYFwLM9/k4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110046

On Wed, Nov 11, 2026 at 5:14=E2=80=AFAM Marek Vasut <marex@nabladev.com> wr=
ote:
>
> On 11/10/26 2:32 PM, Ulf Hansson wrote:
> > On Fri, Oct 30, 2026 at 10:54=E2=80=AFPM Marek Vasut <marex@nabladev.co=
m> wrote:
> >>
> >> From: Christophe Kerello <christophe.kerello@foss.st.com>
> >>
> >> Manage MMC POWER UP state like MMC POWER OFF state. In case of low
> >> power use cases, it will avoid random initialization timeout. This
> >> fixes a failure to switch DDR52 eMMC to 8 bit mode due to -EILSEQ
> >> returned from mmc_get_ext_csd() in mmc_compare_ext_csds() called
> >> from mmc_select_bus_width() after Standby1 suspend/resume cycle.
> >>
> >> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
> >> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> >> Signed-off-by: Marek Vasut <marex@nabladev.com>
> >> ---
> >> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> >> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> >> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> >> Cc: Ulf Hansson <ulfh@kernel.org>
> >> Cc: kernel@dh-electronics.com
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: linux-mmc@vger.kernel.org
> >> Cc: linux-stm32@st-md-mailman.stormreply.com
> >> ---
> >> Marek: Update commit message
> >> ---
> >>   drivers/mmc/host/mmci_stm32_sdmmc.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mm=
ci_stm32_sdmmc.c
> >> index 9dc51859c2e51..659a5040729e9 100644
> >> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> >> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> >> @@ -368,7 +368,8 @@ static void mmci_sdmmc_set_pwrreg(struct mmci_host=
 *host, unsigned int pwr)
> >>          if (dlyb && dlyb->ops->set_input_ck)
> >>                  dlyb->ops->set_input_ck(dlyb);
> >>
> >> -       if (ios.power_mode =3D=3D MMC_POWER_OFF) {
> >> +       if (ios.power_mode =3D=3D MMC_POWER_OFF ||
> >> +           ios.power_mode =3D=3D MMC_POWER_UP) {
> >>                  /* Only a reset could power-off sdmmc */
> >>                  reset_control_assert(host->rst);
> >>                  udelay(2);
> >
> > What exactly will this reset?
> The controller.

Okay, I see.

In that case, this reset also makes us reset preceding updates to any
other registers, for example the clock register. I would not recommend
doing that here, but perhaps there is no better option.

If I may I suggest an alternative solution, perhaps we can manage this
in the ->runtime_resume() callback instead. If the power_mode =3D=3D
MMC_POWER_OFF, perhaps do this reset there instead? Would that work?

Anothing thing that caught my eyes was the MCI_STM32_PWR_CYC bit that
gets written at MMC_POWER_OFF. This bit becomes cached in
host->pwr_reg, hence it's also rewritten at MMC_POWER_ON. Is that
intentional?

Kind regards
Uffe
