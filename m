Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8EB4C227C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057867; cv=none; b=CSdlqzg05FD3rm6Tegso8kim5yRIYWIlfaxSf/Sow4IOnm5WXFW1R9599xut7mTc+SmFboTwXfiJ+XANP3pwA/LxGyFuOMkcYvMnOA6AsMv2yg1czLPSOd/hIZfnw/kfZ6MX5aMT5Bz8DSVm4WrPGY2yjvfOavuWRLyZ9eIQuk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057867; c=relaxed/simple;
	bh=k8MmBGqlD6vtzuFFuLfgaTpxSsHu0xPgmRnpcwvoEpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvjhuOhRhQlgIFNSqwawiyOAq9nLDl6PMG5tm3otlvKg3IStRj3siOuCTXpYoeFQHlnFEbpG8zWCL6PNV6K0aU3X0XbywZbgSuCwLBI25DjNKRg4xfEhBb1ws4ncVj5m6TV+ci7EUUIpVXSTtr7Xm6IiYHnAJhxImH/S7lcENKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnBDRBIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUQtU3Gi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnBDRBIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUQtU3Gi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00DHS1978710
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WWkl2gI4Dl651xy5p+ZRq11f
	rqsemeLyAmJ3wzayKPw=; b=GnBDRBIwRxwG2hKdfSdL1C+/oagrSMerIR6B3ast
	gFSZ/l8MaIiWqwgNwE/LPLZ0gkTGMtbMpyY3ICt+6LZQniNcJSGquYjnW9/FWXu5
	A6mBhexJb7PnHOPLt3Wf5WtvGbB5sGwhXtlCwLUimuppaQaUmqkAxFA0Rx/vjeQX
	N9GmrL0AvaX6roiraAWk+qzahYA5CDxHf+6w6fGN3poa/IOhSiqmqKAHISoZeQ0D
	7XPAA48EvlTtyLZ7qciYsvJ8NbLgiD9/CUo07DIr+L1LK/5mueVsJTaQxVa52Ec7
	evFXgRB3NUeag3riS3J/fqYsa7SCplCPT1TPplD3b5isQw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0ha8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:17:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5136596a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057864; x=1790662664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=;
        b=LUQtU3GiqLcfyHglIhmhUHrcWQ+5ByuIW/7V3EZVZpX/IQjnZuLWiEYgKrZX1OeOfe
         lHOn7+Lkj9QYcujLJ2ZWL/w6k31bOSRpmYkJr7zTGONSIvojCqlsVHkbAJjGlifkQMge
         6JiVohTeX44+jnE8BfJiwP7HVY24xFSGlWcXo3b9cPzKhWnSzt1qZJegqmFPP/SPgZkP
         FxqRjRz90bofbTUZBuLg5YQCdsac8uPI9tqpEEnJA9ySnjIq1O8Xrf0nzjqTp/18TXGr
         rnTVbS+QeHrX2iCWtIRlMh7buwaFzyk70ub1PfAxNb0aJ6fx8CtwrnwOniiTb3BbGtcR
         7VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057864; x=1790662664;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=;
        b=N3Y4yaMtpBNFvO2IT1DQ5GpZ5GatcIGZOYHoLsmVb0xF4odST9meSJKVu5taZXgoJD
         nK0QkvbPkA/7TuRRWk1JqA9w4b1F8I23vLefO0Wpkl6Ojry5/pqF2WxwmON36C4U0Qiw
         y8/gIe+8b2udi3uLnVVNi4U86zXon897JZevZkR72fjKF79A//tQBHnqCig6YtFeXWKM
         IAZEvXWMMgBp7Z3kIQXXw6+qqbDqlqsEhNe1EyzvRVMPJ7enOrVu7W8P4S2RmhIqg0Ck
         22PmMxv4QSiECW/+AT9HThGHjZQchypyhxKdUy7Th6ERirMzjrkZentaOuPwJ0nFkErb
         5ySQ==
X-Forwarded-Encrypted: i=1; AKwUvByOoi2JOAhXLTBnlTz7jhs3fUiOI5b0e6PQZN7R596ycPh++VgDi/iaFB0JwS7P6XwDzpEPxGGF/7+BAmc=@vger.kernel.org
X-Gm-Message-State: AFuF++mi4DJaw+wfQt9lYNUCOQECBPk30RcwUz3ikpKWD2dajQCK4OsN
	6pXSxqXsMxG6l4UBe/lLdS4fYhj3F2PwZTPfv5tnu277YPruK9MkX83UmEfp2ssjfkFITO5xSgU
	H6JPeU2BaCK7FxAPGlU+QV+oTtihjdDJDFK+IZhrN4Itl0o7xBgsj22AIZZAgbV2tFxc=
X-Gm-Gg: AYBFou0CmrTeeWPLAuIvDum/VmPrgXoyoqKNoLAvd+YmmkIqun2Wrw2MDx3MIn590nQ
	873qeigBV/ziJ/2JKgH++XBXb7pBPyGa4gFN4REepIVWUUK0yBinqPIOUILB4bdFY+0xfIIoU8j
	k9b8IADSAZHHg/R1oEaKZtAQYafhERMQoV7zeMp+1aS4FlMyMDdONHKBxoDQPKvtpgiEq1MqDqJ
	XdkR1x2F0yTOOv4T5RKCKqKjzpNiEitllIHwi7boazmGmPesO/b8XkJaoFLAiEDbi3b1DfcymtE
	xwbue3ZXTCVjKd0/gdB3d3Z+TxnEkYPu31AnfmanmHQEvgaT5K9UOY6UPJPbhkbH5+3TP4xmJuo
	J1gYig+Xc+0kZvI5d/to/2QtJ9CXgeblqxuc=
X-Received: by 2002:a17:903:3b86:b0:2dd:c100:a5e9 with SMTP id d9443c01a7336-2df60b7ab72mr1331685ad.61.1790057863705;
        Mon, 21 Sep 2026 23:17:43 -0700 (PDT)
X-Received: by 2002:a17:903:3b86:b0:2dd:c100:a5e9 with SMTP id d9443c01a7336-2df60b7ab72mr1331645ad.61.1790057863321;
        Mon, 21 Sep 2026 23:17:43 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm2974252eec.1.2026.09.21.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:17:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:47:35 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <arIdf+RFybbdI4ki@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LNwM4Ehr2yKFh1dqTpcXPAGgXqAFmKS_
X-Proofpoint-GUID: LNwM4Ehr2yKFh1dqTpcXPAGgXqAFmKS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXyNKBilUvDtLc
 zu6XHQWhvQepx8xZsvZNn4cIChO/WqdvGyRpAmRfDawuLg0m+d6RzDRu6HsySxC/vi/shHNgd8A
 Vj/zv22r9ZUhwbK7qD9u4L+PHFkBBizRtYdKuc6gHQ7lZ6sIcKJ7HRKaCd2YQZdyd+pdwUyzonL
 Kn2gqk0n3BMgO4sUmR1/HTHrZwjyxZIIGjdTbIHiT/QyIt9Sta+F1plXjr5TbP9bxjiZDKAuzw7
 TgSe1NPI2cZ+8P8uCbXH2r6WhJvaFsBY7VE6a+Ky4xv1Gpu97tmeHbpKn1seNeN2xird/Ieu7Wq
 KrqCt+FrW8wBPK5JN9HCeRPOULiFh+eY1d28NNkKSYss58poVhj/zALfcpNKRLnRdTMncyyzErZ
 oqFzxXGx8VbNBdcfL9xPTWykZPhX0V92u9XkUHIkB3Ado16TM3mLm+5Hb6aZM45GuZQNwADevNF
 NUYvAwTF8VWHdjzp+0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXzTxd0LVO0Ixi
 oIWD1HiFtQMOFDoT9NBbDhUr4vkoU0L1i5IE67FT2CZg/nfTe8OecxlgQMjCS7qVJyvNER72zCv
 Uz7GRC7viYjwULzcI0lIe3K9eo4KTOU=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab21d88 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=x-C9AHaFmKqvuEDWSewA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220088

On Wed, Sep 09, 2026 at 04:51:01PM +0200, Konrad Dybcio wrote:
> On 9/7/26 8:33 AM, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	reg_dsi_touch: regulator-touch {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "rpi-touch";
> > +		regulator-min-microvolt = <5500000>;
> > +		regulator-max-microvolt = <5500000>;
> > +		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> 
> Does this need to be always-on? There's clearly a consumer for it
> 
> Konrad

No, I'll remove regulator-always-on in next revision.
