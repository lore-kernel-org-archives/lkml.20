Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96636549388
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088987; cv=pass; b=VmcMNC3AXl/Xr02wGQqu8EF0y0kd998fcPavplp+Srp1lu/p18rZNpcjhNMDQUvL8ngy1tXTpGNhW5TRjJ4LhLIKIK0O7g98p9d+jjPGhuEn7W7a5CIRPJ+7GDCka76zEjz1lr2Y7lqVOJVpi47EbnS0mzBpqiAffCB6VDrXFlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088987; c=relaxed/simple;
	bh=Gvr9z8uZ9WkScolJzxXQvpxeADsyQ7B+SdrANzKCU/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktJC25Cxen89lZCYXLOqZjgBek25lqpjIbRirFvsHSbAotZAceDQgz/kvtMOo0MiqrOp925lQAu6o85LoL92gYRpoelUNriqOIRCXBrNcSFqcNH4XL8IGdhcRh7X2wQktQanTlHVnlNXReCzvdFY+ICgLYhhQuBWXMLagCtMwWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdTZP08g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQJ6Nalg; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdTZP08g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQJ6Nalg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjGYe449454
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=; b=BdTZP08g5+gwJ9VH
	KCFil2EltUtb4zHLkQAqIfqPWv2gfvy+bFvVn3Y2Ajhcz19MtLCLiDNrdVKCjg4Q
	bYRPyaTfaCa4lOvb04xT9Sez7eCZm4xDpq5m2iqnFkwryspSOHPu2pUmMHQQbVWg
	pDZPGBYeM/P0+X952PD7meN8oZiHpRV6BObK4ri+OKQLLR3bImB342iDNrbIf7pE
	qzo+gdO3Rx6y1zT6kj1SNCN9IWT6UPf3VEuWPVUgQJ5paZQcbahMmQQe6HuW+MtP
	G0eEdYGc3VBNsSvIIXDLnYApa6vCF52O0wvGUa908j92Cm10L+1xW/rQaJC1EwzG
	QTHjAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyswue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:56:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso7239828a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790088983; cv=none;
        d=google.com; s=arc-20260327;
        b=g2hC3x8kkvHLQFejh+TWwEW8DkWnKVnp9YVn5MIJEC6zFQXvhhoEX/4VdLOaJBd7iA
         +gXb/U914PaV+9TXBCk9mNd2c1kVsBRWciW7TkQDF9ZdXRyxGw2S3xtqlmwNrYxZgnXV
         aYtp86AY4Ze0YipptsU7rEqX8+Voe39GC4vZXACEvvWrpTAyVaq5mzs/ZFSkadEC9t3z
         FNljuPAfFppZSkQaOlSRYr7DE9ZW3+lFiVIoI9vMiXdK0iq0XthAXoPcJbPSOFFDL1+9
         lt3HW+b/JlYocCdWZ6Nu7/xU6Qhwtk5JcM9MyBl0m0fl5aPI9ydnl4X/M3B1fFQLKzCs
         3wMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        fh=58S3LRpAH0QtR4TtmmXdB3eaucWSWyh/r1KWRVfDDEE=;
        b=ItZgzpUN4bJDCFD6zqoYkoHreCKpYg3R9nE/ArdZIkn9caKPQw2CPJ3h3dkk1IY0P+
         20RJZbA9q2qf8UKjtTpruprPS+wAXUYZPgBqfhl+GQ5z25qsriks2mLVEU8cZIGFjsrH
         UCKEZaaBirECSiG4Qf0Bfq1PjpUCYMTygeCVfY5l4bZ5ZqEpWmDStj6Yb/4i9CqcGQ18
         GQQZpc30m1sqQ0G5TPHgQCcJcXQsjR31vu5KeT5oMrfjIhcMWm7GBLDY8Oo4y/guz8hi
         rGGYIYjFGCqpRTfueJlfU/LaeJ0EGMxBVP/LRqOnd1R5NU1SmcWRnjoF7ivqF1fjNl6M
         rqLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790088983; x=1790693783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        b=OQJ6NalgjcSZY0MsahuorKX725+Gio+NG3kRuAmQj254pYZ8C5Dx/a5+H1H3YEtjIX
         7fB/1SpzGsJB2/hnfjj0K23BgtGSJmEs1ScsDEAfU8AQwrUmT3vwxGvkfN5ZPJF08SXK
         3ZC8bCZplQtGF8ScGEPThUVddWNoMnvyAjTvec6iCNrM/NbEEbSCRX8LAKdN9vL1Q1sw
         M11QccXXmb66NIcAjh1am1E+0CzYhzQiF0mG6Wf9Q/W+mjsLdexAG5PSJg7sk94oCjk7
         bXWPqdN/DRzyXh+7IsiKqiEUudTPOhTwsJkZj5G/WqbJ0fU2B5/BWinP9zdjVRm0lE1P
         EfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088983; x=1790693783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        b=n0hmX4t7iL/thW4IStgKYlh/WWrxNYSWBgQ3VnIWmxey0jC2dbkhl8g7JgKyEoBH/7
         l4hEP9eae87pTEGCanTGGFjY+VY0SbAtR89CNDDv7GD5EzRbn8cgWs4fEaoxkDsgh8GF
         8R1K9Al3DYUDVZF7HBVBcCGQqRKJPup7pn52HblXG4ZELotKPj34g8odZE8SKiJOaPch
         2MbDuATVyVh/PEfJpaDyk6IqDE/MUa/ROPRQ9QWQ1ci8BlApZ1lH3NCD5atumVbWk+bB
         JJmgFTMx8pRWq8SioIkKfMeODAx1g+k/YfWrsu0BZ/+5VK8pWzTXXoIRsyOXuc5GqWlV
         Q4Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxssJYZvH5Era4pBDOyVuNjQB2xcNXLmXFCQJxF0/lT4a7M0jY6tk/zujQYX1rAs/oLkvPEjkvCCgcZHqs=@vger.kernel.org
X-Gm-Message-State: AFuF++l8djRuuvYR6urMk/XxvJunctJYrHH3b60YegraSzlgJ7KeZlMS
	K2JSS+Mjzistv/v/1FH0EpXg5lKkuv3KAkFM3k9DUMcS50iKT9YYgFiqXghxJ87aTQV84WVjlQG
	/9nbXcD8DibaE+RqR4VXY1ERbHIXpwLVWA++6p+TA+2e9sPYoUiirIIxY26C6ad3GtC4qlyzQLz
	Foao3aae40U8Oa8X+/rAs7PTQm5rBOX6M6JV6leyIlaw==
X-Gm-Gg: AYBFou1MukIy0qiN0+BaSn/Eos51AfX/tpsBGxljyTh5VtUBvG4WrpLVx2OUdCS1Jwl
	kR6lLNEldat0zXBEXtYEFTe1drb0LMUiGNKU5AMQINAA0qEh/66NzWosQQfovFtT2m9b2Jb9a47
	yY3XEAMyMsunStqWS0YomiAsNdWycUpMguIwPVcK3jGxvznRURIR6FVGXZrg==
X-Received: by 2002:a05:6a20:7fa3:b0:3d3:adad:f173 with SMTP id adf61e73a8af0-3ddec65dc53mr1956418637.21.1790088983226;
        Tue, 22 Sep 2026 07:56:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa3:b0:3d3:adad:f173 with SMTP id
 adf61e73a8af0-3ddec65dc53mr1956375637.21.1790088982664; Tue, 22 Sep 2026
 07:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com> <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
In-Reply-To: <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:56:11 +0800
X-Gm-Features: AcwNN1UKlLikVQy96fk9vqNUhC2Valt1AREowrLvxseRUePla1hTGuyeYqMVWxI
Message-ID: <CAFkd8huSqbHBirAshizAUNUGFQ9VU8k-1RMxjVrODMi-GE2vRw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pussin@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: PGJjt102twjc_lcPoxUov9tvRh8WA0zS
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab29718 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=oTPx0ikOrH0KZUEDTLAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxNyBTYWx0ZWRfX6vnoGJEPIJvT
 qGiDw5wA+zHAAI3KjOMUjzRjWd5l+uxd9/syc6a/xg7AH6MI2JMClnKg6VNEBr0VYVisZWqvTEP
 Vg0K38tCISC60QKZ1hirZKAoq0ygHDCQ4O6S5aib5E0lOwTV/lDI3Uyk4AccF96772ElDGqdQrL
 xnENVhHl5WjWINLFIKdKd5zcTs+H6zuWHH+kp8nk5d18QnP8cyBQu1gRvfAyZOtCO1T0QKMjUU0
 1wMyymfNeLiXz95CwqBLBIo6kxYdZ2ogbWYsdQ5zsJ/P5LAH5d5Zzt1TUoPshDe4E46mj4B+0Wk
 EHdkGJ+4lm05Kc7MFQS0xWxBTdV23bXI5cjZzu/ZuSwONOeMcBsSAmAJQeuZpyI752eSO34czzn
 8n11T873RYHs6bHNTL1pPx75y5kIR9zq3YxX8VKm4UnK2cC0PV+LVj3svugFZib2A9Ai7I3gZFR
 jUkhy+/Bol0GiDCCHPw==
X-Proofpoint-ORIG-GUID: PGJjt102twjc_lcPoxUov9tvRh8WA0zS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxNyBTYWx0ZWRfX8b2/Z4Wd0UMq
 W3wkL3JOgATeLqnqjpf/ywOEcPQccaij/uvdlcZY+0eMaUOyxahhBv54gDBMIcjomFutnLwYI0Z
 h12P4/SDeSB/Z05L7VomKkO6OoVMvHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220217

On Tue, Sep 22, 2026 at 6:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/22/26 10:04 AM, Shawn Guo wrote:
> > From: Pushpendra Singh <pussin@qti.qualcomm.com>
> >
> > Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
> > frequency scaling.
>
> [...]
>
> > +             bwmon_cluster2: pmu@1014400 {
> > +                     reg =3D <0x0 0x01014400 0x0 0x600>;
>
> len=3D0x500 for all the region is 0x600-long, but the docs say
> it starts  0x100 earlier (with registers actually starting
> at +0x400 like your node here) - unless you want to solve that
> discrepancy in the driver, but i'm not sure it's worth the
> hassle

Oh, good catch, len should be 0x500.

The address is intentionally shifted by 0x100 to remain compatible
with the existing driver.
The driver expects the PMU registers at this offset, so changing the
base address would require updating the driver and could break
compatibility.

>
> otherwise
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks
