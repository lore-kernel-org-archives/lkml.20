Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD77C54DAC5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875034; cv=none; b=f57QT7n905n0r20aYCkp/m4we2/Go1UwMIdGXcA3zZ1gwdI+ecdKl1Opt6VbZt/8i4obN3AUjSTQtH3sOwuO2L5S8EkqLcwHGpJqoX7hv5QNasRncECnSxmYBS64+rEMaLx8PcbkcgceztA+8eSed8YOeuQDZ3rWLlfDqOQhMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875034; c=relaxed/simple;
	bh=/JZEh6olWPepouwU4hBOKCHkM0eWw9CAmBjHT5JKKw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0un567xhiRsWzEQ9HRuj5bFlsS7oN5vyLgjA0h+gVrQPYSRwgKwlUpXbuGh6bITtTKB/7Nu7+QLT5UbMI/m28fXb+sEZqy5KS/vCDGv/FWMZYT/vyQ+kTXj4HyLs+NaJhxZcXROu5ECFqKTJrhYtZ1R4wFVW2GN0+yUwjCsu9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4A999HM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlPB1QZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4A999HM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlPB1QZc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ckgwk4162845
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 13:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FNv4YZM6Cu52UIrM7KpWyRo8
	GDUAmOGuixGQjhwCuBY=; b=m4A999HMC9wgG4G2CMo484t+8Sx5PlNIbmg/aggS
	UbhWtJNQtdob+rwyA2BmXnfdSCogCZah2cRBHPkdDS2p0UUc6eBdIJ/YTZe7XtHe
	qgP5wDwVt4FD4tf6UsG+7eDd5G9eh4q1lu4mxoaq8LbN7IcM+dTvo2apr5aKK3kM
	6ZgcZxw+5YRgXmzGLJ2kdFJObrjHdeO53Zj+z+IGTVHSs0C4JWE3mc9WiYfBjBHv
	xZO65WAdE6fshcCNnmSzDRO+Lwupx7kJqO/APJbUcdw+sQ1WR8ga78iFDU3LqkjN
	0eImjhcFYwR0/em71q3GhQpRzYtF/BUaRY48r1nLX2fB8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pa6ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:43:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so3882896a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788875009; x=1789479809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNv4YZM6Cu52UIrM7KpWyRo8GDUAmOGuixGQjhwCuBY=;
        b=hlPB1QZcCp2SGEG/dBb56Kq5EOWtbkK2gO6EHFpo7Vdau62Q/UeSXQOzndAwROMH/F
         Sb3ALrHTDepzVYgAtcXq7Ck/7RarmmJiHvvOJ2fOXNGiHHjZL2280rNc1D4lSeDZ1kxA
         i2Srl6pHLmqQmjFg4xtzQZ2l7dCYolSEmBdzJRT6NhFCvjaLTYiJVHHaq+pKeU0fRdHy
         k7X3kpTJqbc71Lj0/V99fc4s7xistPv9OQpV/l4NvRJla2DefxjycSQV/H6awtIvQtsI
         hAEsItWmAkBg9acHG07xY02oh8yKIqHDGoNZhwhM/OLQ1Sy3lCbgYsmVN/chxujsJYU+
         s/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875009; x=1789479809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNv4YZM6Cu52UIrM7KpWyRo8GDUAmOGuixGQjhwCuBY=;
        b=g8Q2N0+X8GwecY0jFE7Qyew3Kgidh8+bF2FD/J5sNUGjbaR4TLredobInxJywXmYWU
         M1Ao0y4raaYmSo9En9yq+9RskDQVxUn4cdsljieE5ce6146Dd0UtWXNSSs34OUdstbFm
         hu2LrMRys/xNjX67YnNTVNrFcxpZExKtTH+ie9x1z+Tsuu2KTb8x5DMGOa958F9kCJ31
         Z4Y0d0jZqCtdknumBJHPpcf1e2Z5ndYr6ZZB/AhY1+6YjotezO90hXY13EM9t2T0cYFW
         u6j07Sbq7VzkQTzY+fd+zzyxA6MlptQ/aUtadSfzPrHTavHVh1rxl769cy5BC0PCwbeg
         4PcA==
X-Forwarded-Encrypted: i=1; AKwUvBxrj+m8hSR8VcAY/mtOKagZZGikZFBVylIeLHrW0Zmp56k0J/py+nUlBEpA/yMBoCrxqSDkOHaIRM9H3VI=@vger.kernel.org
X-Gm-Message-State: AFuF++kMZSwhf5SL75HhH3Kp3WROXUsdVWGxKIixDPYNc9l0RqQpCHNY
	Ldmq3r/PGrxxSQkQh5klMXwgeCpbEJETOssxpfgjVTDa5zaDNn6/AnBdganf56fHRrDSdvLP3QK
	UVI6LStOH9nU2W4AP4COhXlzCTvaWqzM2UX8f80an40rdvTRmnIUEZLqVdHJYqwtGiAg=
X-Gm-Gg: AYBFou3kuCgbPVpJb9dM678qcTyI2iJwKNLdCJZmqGm+rYE+/F47sZRT2hFRL7J5JEU
	KDPj9DoOJIRMZclR7QIKgaZKFDxtTOoUZjZLqnwPLZa7jGA7mnBa22l0mv69mZGvm/EMRobh6F0
	np5A4iKbaSK9rSuxKdF/qrG+5ydyvN5Qif2JrcxFPSa2NNR14+bc4e5OoyDYZmvts3ctFsvhHk2
	NKO0cP5Jo2L2sdEpEL7PFN0jEvgYYfHFDOYC43b9cVWPmP77AdqPtYBUEvHyTZgI0PgzTU0OgG4
	/D9XKtvvPjGQ26XWdiDHyWKtn1fZ6GbC6aPhXQlxUdbCLpfzyGxsMj8de/6Z7UPVg7RxgwVSX2f
	+ySClOO62PXLTkw==
X-Received: by 2002:a05:6a21:3e0d:b0:3da:7154:2ebc with SMTP id adf61e73a8af0-3da71543f94mr24925198637.7.1788875008946;
        Tue, 08 Sep 2026 06:43:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:3e0d:b0:3da:7154:2ebc with SMTP id adf61e73a8af0-3da71543f94mr24925119637.7.1788875008446;
        Tue, 08 Sep 2026 06:43:28 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm36539625eec.9.2026.09.08.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:43:28 -0700 (PDT)
Date: Tue, 8 Sep 2026 19:13:20 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
Message-ID: <aqAQ+BxwJstTlnU3@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
 <169b2cd5-d0d8-4682-8756-bacf545a95a0@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169b2cd5-d0d8-4682-8756-bacf545a95a0@lunn.ch>
X-Proofpoint-ORIG-GUID: flomseemzyQpvyZsuLmCtjQ9IsLRFksz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0NyBTYWx0ZWRfX1dbr3PxqP1P6
 c2/a7IEa29r1G7Atmwod8FKnO3UVHGOpmcA5sTro6CIPRhVXjrmAZBt+FSGw1EWazpGcT+y9I8L
 Ae6J+eSkRuk50/qi86stRpSVTIDMaA0=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa01101 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mbnDeuF-4I0g7l0wkJUA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: flomseemzyQpvyZsuLmCtjQ9IsLRFksz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0NyBTYWx0ZWRfX+4SC79o5cLml
 gmh0iZnxXVm/IrJRM4o3BnPoSBxaBHvoXrFJGN6fJNfCrMnlqUUH8Q0C4/73D2yZCsMheF5dhYx
 Lf3bokQOcBAsEXd18uJqoxPmSne9nu0XKONz5QuFSzK82zRFklxFrE4saFg9WBlCXwweXPFF/i8
 V2XXXAPUht/EQKuXKxo8iB2xXeWHbZqNdRzAMh/nJNRBu764EsfBRG/mOxthg/NBzU8p7D6hSjL
 Hg3kXMe7NV6DE/rOrH2EpsYWhM5I140aH0x8xwVjcT07O32iHi68aN1V7/974bXp4y+u9qg/BCb
 219H+6/afAuDa43q2fyc95m+Xg5nzXep1y9wv2ZvZWLHDRtiWHSjoQO8dYOMSQXDy2auqR+Kbn2
 QA9TNCMaI3LTbX61sLUMDIVgDVlVjCYc3Hn6dBsVY/Gmt9Ynk+3eRtwo4G0eTkLP0ic0yO5Tpe4
 fvrjWO872hx1897Bmkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080147

On Tue, Sep 08, 2026 at 02:11:22PM +0200, Andrew Lunn wrote:
> On Tue, Sep 08, 2026 at 11:53:30AM +0530, Mohd Ayaan Anwar wrote:
> > The GPIO mappings on the IQS variant differ from the CQ variants.
> > GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
> > Secure IO pin; the latter is connected to GPIO49. This incorrect
> > reservation causes the probe of the second Ethernet port to fail:
> > 
> >   shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
> >   shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
> >   (GPIO_138) from group gpio138 on device 500000.pinctrl
> >   qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back
> > 
> > Replace gpio138 with gpio49 in the reserved list.
> > 
> > Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> If this is a fix, should it be posted for a different tree, so it
> makes it way to stable?
> 
> You don't normally mix fixes and on going development work.
> 

You're right that it reads like a standalone fix, and that's on me for
the commit message. There's no functional impact on current users: the
reserved GPIO (138) is unused today, so applying this on a released
kernel produces no error and there's nothing to backport to stable.

I'll reword the commit message so it reads as a prerequisite for
enabling Ethernet rather than implying a current break.

	Ayaan
