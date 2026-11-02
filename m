Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625823;
	b=Ftbjky2+P6yFbxwJlFieOUc7TWEzpBqAXBt4XNfprH+1L7iXTHHYt0IzDEp8Uq/2vcfM
	 OxSI5UV9UXCzzOV99qw8PvEWbLn/VvnKoqnW74tKpuO/lanPjOEjyP7HEh70MBqJIxdd7
	 p7FbjHFfK+PDl9q4bo8Hos74T6E1repq0Pjc0f+FHs52FlyJ+PUC12hzl4DjYcROGIbwB
	 FMIOCMd0ei3LoSndpEdsXr8UyPy5lrrt7lWgYexDk2m8xRcdpSpNA8nDeNLgCBFgB6tf5
	 EQtywJLSR7zYeQsThxHV0mmAEojBgVYSIlE+BiCbrptOOINSU0UMadZ17QSJJc+hKOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
	b=vdjFeMMIESZqcm5HFTvJAUP04n92M8KIwAHQkfeOEvUxr7YmW1GBkF7xks1tvGz60OhC
	 nBQRuvCRo356WQscVF1D7e8CVdjsavUspCp90GrC0bJUyPcfUGVPJcD4sK8ID1r5YbxVK
	 de5Tt/1yBYb4crzyoESMiLmtw88Wi9bIL3OIYZfv4QwmDuLekYG5dj+XjCjUcjW1K6We/
	 PwG9+DmrlWFlxiPsmuSDb9ytswU33Lr8K0tJTFRXxGXg3GmFVRQhVlq/Os3+VuVV6RsKw
	 +OHHq271DDs1Q6yk6cWgXSaqNj/D0Mt/xHKEQKZ4Ib4P07OtF2roRR20FwHRe10TchA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cck0U1do;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqreRL9I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E0A606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E0A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cck0U1do;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqreRL9I
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAha53423774
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1dUytA+EdoDg+Eu6pKR+9XM
	zqtgSGYZ7n7ArYD1v7g=; b=cck0U1do+7MoT8wpb9pSYByRS1f9zyPEgQk2J/9n
	arFVVM9W62d/4YaWORfE7gVMkb/GCjCHPX6Ex/4jCGeym7UPg3GXScng26/nY85x
	PdBZIcB+dOexJbebuSeiTjINWgB4vKeXtVlLqdAm8GzZHQm/GCqFloIlXwTcdn0u
	StqcqimXbXI19xfe2W/a808Otw+/kkeO4nG5MbBgOH+c2VeIdWx2Bga48ZY2Afm2
	ZwxzW0KivTKL26iinFnCjQesZwyrHkoEDYlkpw+EwTok5q898AoB3vywz85Tswec
	/LvJc3X4uwnoY/oI9BbSfwDFrHKjqXayb2aT9rUzb7oUAQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh0bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:23:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7cb9e267so34446286d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625821; x=1794230621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
        b=CqreRL9I+wRCvzeX2l215BXXJfh6xbfK94yjDT/SLQBLzZiJeF9FZ+I6FEKMSdWSdb
         Cv7lByYF3lnoK7s3dFjf5yiFPyarinQG7oEfoJRqT/fwfXctM+cd5SjUKx2ZME3jc9zf
         PraWayYXEKA5S97c2e5rxCNzBQdhTqqwtVyTl11Yl+RBnqkmCTgd1Qomm7Ooy8bSncib
         KYtG++APEPpJJ1TE1CtPIcR0jI6uLOqWe9poiek9Q5rbne+eU1DumBW9bod5ybTC4dVx
         XrYO/Vyurq27w8iwGfSldsdoI0Gacv48Irq77roWVJUKJvNSedq913yOxWTcY75FUBfR
         +V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625821; x=1794230621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
        b=d9hIPwLLgvSd8TFtDVpMLte9noSNegkMMNV2b6RdTvQn0bYF/BVW4pBfrfqj4hBN7I
         JBo3PJvyB0h9uKDCyOuprBalIXrmNYQSbtG+Y+5VaOcwvF9JIcGfo0VGCMLPAKS1CI//
         eOnTadhN6SAolQjLXOsg5NMtIdx2Qfix+CR6an2VeBAPm8A9XeLTuSnG3e27VkcRlzif
         T0mBF9WbtAWpKEm0mrS0Xa4qaIO/A/Xsym7nJkc1yRx9nYl8BKNZjP1VNJbqI5aCAE59
         xIUezhwyO6EwYDsWl9jrJzvxW/RpVuRK4k3Pms8PN7C8vy6gviP8xs7P7Enz6eBgoDoD
         vuvA==
X-Forwarded-Encrypted: i=1; AKwUvByRXIXSKMy3mTgSeWgVarnr/qdK0EQyKzakhLV2sne5tT8dYhwPZghxTYYPdOAY/yHKduQSJiIRkxnPm28=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5mlI4LKmVNkDWMWNsQmFssWsAytCLTUmUrbChYya/JYaQK5CC
	WfkPT9B/jNbJ3k56m0jrOVmRdhnop8uQsOipBlPVsZFJ/XlbU69yER0FklbiKr4YsyqKfNnUtit
	1ENvjIn4GG1kUa6MJ8MeDIL0HiT5vjJHSNWucSxT21A6YuC5DP5iZ/Ilfv6OmeL/uF3o=
X-Gm-Gg: AYBFou2M+6Cf8ZlzUKlUlyxJZjOWcrdirfgtwaOqHaMMXELk43asSa4vetp3OvMahzP
	E+GNgFvTyVwgKHOoySrCXsXgzxgwM8arP6W1mQ5VQUJ1Wu5FwLApRpyNoTco9+19GuJLvvP8Hbs
	h7HnXlRlMT40li0X3PAgwT6c/LyJvoOWDwCk6zJRmG9Ncr6til+an8JC40osVludXYio1ridZo8
	SH+jEJNQVv5DDEkzPML3l4huYGnvzNUj1iK7O8EGq+Xrxiwhg5Ml/Woi25IWyOKUnbc1ASf+elv
	ECScEKeY0vkF4xK8vXOFWnUSZOXUGp3nAOZ4FtNBntn3mw6RpXKRl2Wj+AEjkX6L60RvdWf4e1N
	H6LcuNUt8XzTqLL7sPl7/vN80tebjMV5+ywuv3QZBIyD24oxaeIGdDlgSmqBRKEs=
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr1562602785a.56.1793625820637;
        Mon, 02 Nov 2026 05:23:40 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr1562597485a.56.1793625819910;
        Mon, 02 Nov 2026 05:23:39 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm217300315e9.4.2026.11.02.05.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:23:39 -0800 (PST)
Date: Mon, 2 Nov 2026 15:23:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Message-ID: <62dacxdue7uakeqximurvi556y2d6cosaxc3prrytneggo7x52@qxvwqe53bpoc>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
 <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
 <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88edd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_gEsykP72j_chJFTmiQA:9 a=CjuIK1q_8ugA:10 a=ukwt756SXJsA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: VWhQ51uk3DsoF_87S8oOmkN092tkWhtA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX4OSSFL3RTY1O
 5cN89VvMRLMCSbjIITTc1g9RLdN4+T4tqK6BCR6KuqC6G7C0nm+/EDuGtuR/Q0cHQdiWDvJC3yK
 f95iPv3dl2oO8t41R86oEpEq3BVGjjg=
X-Proofpoint-ORIG-GUID: VWhQ51uk3DsoF_87S8oOmkN092tkWhtA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXzvN6gBZ3n1gg
 qmiosGag3KjE8+oLO3h6D3CMIV/VRueNpZaFMc3bV+Bby2dhiHIvV4pC24Z9l3mIrJAXndobX8q
 quOOhpA/aX2ncMuN8/8EqKSmE/q6owowmqSfNCPZdekmkL4dipKiv0mv5Tkk4KJ6/t0NYxDCTP8
 nI37qukHR/KU4pADH+f6MKcJ57KB5MLJm55+rUFeCJehMLgOxpFJqjKWTv2+9W002R3AKND9DXL
 eWneAvfTEA1yaYK4PH6tjyTCZWqrWwYw4AU701QqDmuBHglrDWYrbtH2FSdPatnZWUwumzpMUPh
 7CmWUiLQ5ziSwFEywi5dersl52JblqzHCttD0zbOg7eCCKgt42GT3W0vPmvnsGdMBXbuybEFIUt
 lrIVQe/JYzLXjDcNP8KAuBK8uI4qo3zU6zeUro1/jUDVd8uhJR7uEZcpoFyVJzXsMWNq9k9CHvw
 UY4KOigEkgytXmg+gNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053

On 26-11-01 11:45:25, Jason Pettit wrote:
> On Mon, Aug 31, 2026 at 11:30:52 +0300, Abel Vesa wrote:
> > On 26-08-30 14:56:15, Jason Pettit wrote:
> > > +&usb_hs_phy {
> > > +	vdd-supply = <&vreg_l2h_e0_0p88>;
> > > +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> > > +
> >
> > No redriver?
> 
> There is no redriver in this case since this USB is an internal
> connection to the USB camera module.

OK. Thanks for clarifying this.
