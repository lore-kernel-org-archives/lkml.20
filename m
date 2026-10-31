Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453315;
	b=Tedpe49AdtJ8GSNoGKlyrTTY1ev+LsBTm/iEKu5t9TsUjj1vLdLncqJBGOiABYtyOiPF
	 EMHqaEeIVOZ97QGBZzGwRmwAWpA4bS60WQxKGXYHvRAgVmTeUkhZCW3XkE7sIkugV3lVP
	 Dt3BsnPE/oeY3rTDvICRyw8zHYT//qn/HAHkzO88zTdeSArHrRKi3ZCtHKgfz16+cppn2
	 FvEr+YxtlGTo1uPMKI4X0taX6wM25xRJ9JieT56qnn6fHlH3Y3tgd6tieS11MuPAF1Bpx
	 LwQG5fU0y4MOB+KHepDiZmk8StXttKb5dYmJ2JyAtkY1IWL+V5kRtWXhgqjaqL4ozmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
	b=XCmzuk4XGRJPgxJ5PYqyxE7n3H4SfOJL70BfZAjcuWAuITYfqY4zQI8sMHHui0JgCeQJ
	 +aUTKliECeNpDvWkrE3OBg+1E1h192BbkynJRLG0HB0tQQHv4M9kalDnZuu+3jHcwN6dt
	 OtTsrdVTFymfrqaRjhJ0RaePyRcSIMpzbSboOijI8rZgn/1dF7IExwHj9STyP0HM/5LhL
	 DphHuIwDGYasrZ7Os+I9Rs6RmdheCa6B9sbpFIEhQf4vZII13l8OA17xZHDbcj2L+d6aP
	 E/94zV/CXfw1N1TjOoN8fDDVt+q7RFYz0042iRv5vsJX7Kw8AyJme2boQOWRzNPC3CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTxcVNZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6wRNcY2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B4606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540B4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTxcVNZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6wRNcY2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0Lgn1233319
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=; b=eTxcVNZPJplLzNjo
	NY2tYdtB225XmF4MtDrZR+o/gH69DH9RcSKfCxEmxwXYkgne4rVIZdXKWqNYgVwy
	WrTNpBWBqx79kl7a9uVOXJKg6+aKxJqkpQjJIM2R4Ge7A/7LZu7rZjIr5OtoJs43
	oorLdlXTs96/zn9JXW6+P7BCTkhGnsbvzJsOGbWqtcqOn+EyJW84sEV/NCRyuIrk
	tTKtbzMr/K3a2H5WoT4Cz6OfPHm0o+vZtlkcUuyiYMD/p23A4RSReQ3EWMAQs5iv
	SYct+gH11TTtRfaXNPSNPV752J1ktMQ/oCmg0MrdEuaEeyMgkTuESSZTOv4181zX
	Lyc6JA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9904t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:28:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so2131312eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453314; x=1794058114; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
        b=f6wRNcY2J5It1Ti83W8W2ujSf7hPrQenDiD10C8Mw1VRt+ly9ukaOsRsEKY/yT75PT
         5MV/pU8E3Bxn+jhgVgQ7Nm20mGpXe+holhxU468ENhIcFH2svoAg1OYTTSNWDRp28i2n
         sS5hgkGZ1Z7FOu7STSY8yyP59Lda2/MwB8gJ+Z+6pQ5gOfKVa2RGsLmRBFfpdBF9lF7m
         AtD4qUbSc0v1RVBbPYnoAsXRbQsRqb97Z+EPJ18r2whzUvqTvkiCMue38ODBkgjM8K5F
         ybJ+n37ljWfBYCDZWfVdbgn0FnblWG4Z6NK92Dk4DowkM4BxcXA1Lg6njOghbFaAnG2p
         PHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453314; x=1794058114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
        b=FI/xkIsg+X/k58eooaMGyeuqqdAUDWtGPj5awwx7Qof1p1ibhlfBi1r5PmCLNdwqbb
         P1uGw1BTMTzgbTVRcBQSrReQJXjzXfHszsiHLY23O8mQGphbcsVKxF6IRjw1h3GotD2b
         KyhOTza1LcYwY/7cFd8m0Od9Sap77kJmEPatidTU83GNtN3N4zmCO8dHVWXw4IY4Xuad
         EzrGQ2l+i8DCas5klclKfCT3U3+Uan5y7pc+31Fngei2ZtyG5z6bP/OOMFJDgB5S0+aX
         9a6axeH9jG9P4chfYLKswbcqprUCEhfPpkE5MUXyG1jYnSblYFBxmZyPFPZ3zF8xldy/
         Y4Mw==
X-Forwarded-Encrypted: i=1; AKwUvBy98yKga89a0lloQ8cszVtjGkuzb6JG3jxKCjgnLEOmJ6ci81BOCgwt0zh6Hux0ryv73GFZarqp2JYUhC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Swa5jq1oKLBQZB7bY7TzdNtoISXxMR0/pLFsLOVQ7lXpgRH7
	z4IXGPeBCUY8RuhLB7oemXpryYIZ4MfY8pS0gN43XH3BuwyL/Aa/qifL8CB+krGo9Krljkip3Jt
	2/139sHyxOo6f++hWOkWDB0WkN2szeDIrT7PSlmu8/bAvNbkKmNtIA5/9m3KA09iXiZ8=
X-Gm-Gg: AYBFou32emVLwqmUMV7K9cDKv/NKdAGFgsVC9BhuRUrYOvi5qMm30+4kkxkBh3EZ5hZ
	3Ca0al549P+GG+PeSVp90YHdD6slfott1QtDK3QMNlLSrrgODwERzhW/1uPgLunDtXNQIBJnr/i
	qHLwaL0VGDPut0xfhxTh2aZqtOCHM/6yhv6R8HrePY3ZCRfT4d5Bj5NNVzlbcauVWZZynFiF70r
	guHAN9uONWRbN9bLyMDYt1rPJQsYAcG3hkecyx9TGHpQOuCx31QBJfzlGw34hN7Cd0iPnySAMmX
	Jlz+BBI92N25VGjvIE5tVd5U2ghUfgyAmHG5I3YtwNb9fhIddd+IPxFZdi3EGHNdG0lNIo04xen
	ZYbkZmzB/6qq3bxcAqmViY1Sxiq9qviMRtx/jyCwTim25yOHEHjLcZkHUfW8VIEHsG8qr6U3Pas
	l17FQdJlSk2zErqAQ=
X-Received: by 2002:a05:7022:2097:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1ac5e8e1e16mr7121587c88.41.1793453313828;
        Sat, 31 Oct 2026 06:28:33 -0700 (PDT)
X-Received: by 2002:a05:7022:2097:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1ac5e8e1e16mr7121569c88.41.1793453313298;
        Sat, 31 Oct 2026 06:28:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm16412510c88.15.2026.10.31.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:28:32 -0700 (PDT)
Date: Sat, 31 Oct 2026 21:28:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable
 PCIe controllers and PHY
Message-ID: <auXs-qBMufezjqml@QCOM-aGQu4IUr3Y>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
 <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
 <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QiGf_murEnNuC8o_8rqC7zq2h4TDxVSW
X-Proofpoint-GUID: QiGf_murEnNuC8o_8rqC7zq2h4TDxVSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfXwMRvryVF+hEh
 sO4tDArRZpkfgM2fVYvN54CTpmhSB4bBckHiyiZu116YA9Dxin1zjVjgxX1vykQYbqTAv9y9CuG
 k9mpL2XRivleMnCxHKAb6RLtVHmQqS4ODXrJaqu0Y1bS3Ko9tOCEd4Qv2Za+yUWWFbj6wLKoye8
 VLYaw5O9htcD0fUZdXyKUBqmbl7Cr7Es/iir/ZkCsgI99lAJaza7QMVE0+8BDSr1QJQONKDio5t
 DdCdryAeeKQkD0o3DitTCt8r8ZjhgHjaZNKAVY43bD8cSjkG9KqQZTxM9tanMqLDj7fgGNk89aA
 Jpt2SA8cvHNX6gbLUHxVthD7nktw9d/ajel/avXfZhljonh4nuYmbS+AcvH4KyyxG47h8bB4OW/
 gvDCYERfm/RQGsM1Jna4yf1+Vhkkl1cbOT5p9LjgxZsd4Xk3pv/58GIBj5tg+2D7JrZ0JrUCpdW
 1wN4PQB+H144FXY9Saw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX54vIQlPkjatP
 yX8Gnm0j7NHqfI+GurXNHl2eML1RRQV82f0F59ZPIDR55TnvRvuT4z+RR1eKknXOZsWnflczVlC
 +rS+yUP2Jt0PdrbrEdfnphNSbT0/Kxs=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5ed02 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6Qp4BPjpy_d1hweZHL0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

On Sat, Oct 31, 2026 at 03:50:09PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 10/21/2026 7:59 AM, Shawn Guo wrote:
> > From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >
> > The Nord Ride Embedded board routes all four PCIe links, so enable
> > pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> > describe the PERST# and WAKE# lines of each root port.
> >
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > index 49635695f832..fcc07226db8b 100644
> > --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > @@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
> >  	};
> >  };
> >  
> > +&pcie_phy {
> > +	vdda-phy-a-supply = <&vreg_l6a_1p2>;
> > +	vdda-phy-b-supply = <&vreg_l4a_1p2>;
> > +	vdda-phy-c-supply = <&vreg_l4a_1p2>;
> > +	vdda-phy-d-supply = <&vreg_l4a_1p2>;
> > +	vdda-pll-a-supply = <&vreg_l1e_0p9>;
> Hi Shawn,
> 
> I did a mistake while sharing these changes, pll supply for b, c, d should be
> l2e instead of l1e.
> -    vdda-pll-b-supply = <&vreg_l1e_0p9>;
> -    vdda-pll-c-supply = <&vreg_l1e_0p9>;
> -    vdda-pll-d-supply = <&vreg_l1e_0p9>;
> +    vdda-pll-b-supply = <&vreg_l2e_0p9>;
> +    vdda-pll-c-supply = <&vreg_l2e_0p9>;
> +    vdda-pll-d-supply = <&vreg_l2e_0p9>;
> 
> Can you update them as this patch is not applied yet.

Sure! I checked schematics and RRD board needs the same correction.

Shawn
