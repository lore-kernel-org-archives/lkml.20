Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615516;
	b=Gi3fzXWmaNUpBEOpbCuTGuHt9uhux9QeBL8tNFj9sYmJH9wiwHf0HdjXSlnQy3Ln7xeo
	 gI+gC94UEPOkzf34Qc5NiBoxvhiUUWr8kQ2j7W30zThKDAnKGYdQGuyMYUqweoqUkhHOO
	 Qnx/jLZ0NBvOLkkj5bVNNLMaJL0xfCklzv1aYTKN92mwWhPabl1oMRB9VF96wpQY80vcL
	 CHWawimExhtFshh3gW1y4HIsAxyW6MUdYlRAvyEfvRU2hH8lo6xNGZf7TJ0RQfrxRDrrM
	 v/6VVOZXZlvjYoGzxalMBSeNYbLpZEq3cQ//jxkS7niBI8c5/Vm/vcz5d0sLqdp8uQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
	b=c+aD5g8I7SB9O2cJgsPB6nasQmFc21ueX0q2WMicfQni2AcQ9njWT7vZbavBfdsaCuG6
	 XOqgbwt58kviiaoddrh3fH7tOo2OUEzUD6PCeXsDzdB3t76U83biRN0zLc2irprIE4Kk2
	 l7q6RzXW4RJmHv/fbaBhS+1eYMBQj7lj9qTgcePOZjOYGDfmQpA15ZK57EHsNdlzdf/sG
	 0ewkwSKCOCTIUcO1xdeNqWh2MFLuxV2dliMhUnrBnhmbLSAzRYVrZGmmADWV72CFSC1a1
	 IqAXdWIyx0/fXvMsVwzy3oup21K1Lhl3fxCAx2T3zCUXEzKyNLswkEQ7RUK2xY3fzMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwHYaScC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKBEKybM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44CE606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44CE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwHYaScC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKBEKybM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AP0e4039722
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uyXnqQWcaQLaj3tsaPz7FL4n
	VEjagE+Vxk26KQ/sNaU=; b=CwHYaScCqnAktnLKbwefXAtcrQfw7DQxwntVIy4X
	aEg+V7GMxxJOVyNCMXFNgjoaC2UFXe9b26BiGb3/NQvylRFsZpwICCI3rQlWPqmL
	or1c4wrz0UcGTrI12QXfkujgHzJFf9P6r48vz7VaZ0FFr9PGge/W34hpgqZZ4UcF
	uxat+c5kD59iSk/jEbpIzD7Qjd+1nscDkDvADZM1c/mJQeYK8AFWF0sDsBgkwTjX
	/H7j9zlkVgcFk6N7q7ykac08RHUUEjEUr4PiSN5qrk7p+B3UwM+K4xEWlqz3mw2t
	UP0Ekpeu6LuloBMYLzBWTyHgIAKPLy2h5J0ICCrsNZh6Fw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18p2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:31:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so462763285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615514; x=1794220314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
        b=kKBEKybMJJYWp6+wtf8NSp3eNTZ3ybd5ZS9dsuvhyikhgdfcwvo9BB/Nt1jREfn+1K
         sqzVx3C5NqDdaJe7z3SDnZisaRUGn53e1goDptvM9Ya5Ny63RlknGKNoSLtSiDVHp52U
         EgewAshOrkHnAehM0dCt+i+EhIzcLDWTxBMrbVQUC8uj6JsrHkGd+8r4W5/7rhocrc9j
         GxPBtblIm1hfbIKUBJkt4G5xoZvefp+oFX72dfUwZB2QuXlXbQvOGlMUoj3Ashs2+ij6
         wWuFMTIvCLurUhXEHVAfCLymnHWq+XXjx85Amnmmra/WIWFgBOecuRUqWh+gVdF/CMcw
         h+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615514; x=1794220314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
        b=vVw3SncCvIsqaeyy5O9gXo2nH++863PaDKCKm+ZgxgPNqFHAWdKIh5esF6mmfAtSpM
         6sZ4LZzIiXEvlTupzBU05kq8QX0wwNjv/BXdQlTRSpJ98QI8aeIqpwwNLEVrTpKaUOHa
         qit7VX9ddH1nxrTO5uyStUdwSBj03YZWkfNH8aHiN+7HjnLtVGqG0ySmKGPZuDrN230J
         c/k6TYq5NUulghXQRV1QL77CeQ0vHXWbUGbnc1JPyYenUwwzN1q95v+a4GaOGkqZGP48
         R52JcqK/JvUeEEVUSlNWElgBIN6q5PfiEbJROhLHZmRV8oOgchpgXclObS+2Y+WlqgPs
         aY0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7webd3P9Dh9SWUwoRHZotVWSx4gLt3hDTbjT366zSoGn2A8bYYv5JyKn4FqK5twkXunBJTUyiGLDz6ro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtJbbs365HvhpCy23s/aCM14vUD0Q0TXI/t6ve59xCPDwjJwxP
	7SAr7OoRzdLi38h0YjoXmjFwnC4diPrhjLesjwu5bWkIEW6o+E1C7PGgrnxdH2Z4Kweylviyrm/
	UNYXQmZihDgQn2H5SYPMhmYEpK4tPnIIdxjglGQ+wMuelQefHiVg7jZdrxOCGsFXWOLU=
X-Gm-Gg: AYBFou3aK+kkAeynA9arJe0lFgI7q4ZNV+Wyvk2qyVKN3hLQ9jaXfq9r5MpBUZcAvBp
	xCudH9KL8podS6IWI0tbDac+O40I1nvsVRCoF1qF6KIPZNV8aXdu3u5TjL9n1B+eS5webXFGw4h
	yDRWbGtj8g7sfzbfTJmCXlHNzihoyUQ9kO/sLaOzMy7Fiae5A+7q9iK294uqlJ7uNo7JN3wSNp+
	j15oMrCuUIc6ASBOG4SXQXecuo/MXbKKn4qHpP1m3ec4U1kjkeSXWbmHgCFTYiRta/cZ+W4zfyC
	IUx8ewbOgucgdjg+5a90RX45HGgclIyrl1m6EDt/VQmnhEMcXe1G7krHfU71U9KKBNshhS8+8gc
	BszUY8H0BWplCpKt9ck/QJ+S9lTevCpDtjxBgJfxvx81eQCAJOCYDPDDg8/EU8Da7Rrk03C9OEs
	sbmtuz4z1NQnAlIURrzPTxCQHR8cy4ik8ls/cUZvP15mnJqn+44TO/s42QqIyO
X-Received: by 2002:a05:620a:a888:20b0:944:2201:2770 with SMTP id af79cd13be357-9442201292emr1020058485a.39.1793615513908;
        Mon, 02 Nov 2026 02:31:53 -0800 (PST)
X-Received: by 2002:a05:620a:a888:20b0:944:2201:2770 with SMTP id af79cd13be357-9442201292emr1020056385a.39.1793615513478;
        Mon, 02 Nov 2026 02:31:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd1145963sm3142181fa.37.2026.11.02.02.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:52 -0800 (PST)
Date: Mon, 2 Nov 2026 12:31:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <tshclix3kzs4iwgfxjrj46o6vebelntyikhthqwfpoi6muyckr@lhaix6uban63>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
 <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com>
 <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
 <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: zzXwd9kJ4hJzRRijxrxas-8B-GqacViv
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8669a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bJwWMc3u49Mdhy3934kA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: zzXwd9kJ4hJzRRijxrxas-8B-GqacViv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXxtXz9MK6JvH4
 CpO8hkUAtF0edMwH+XMLXz0irRNxx57e38Y7pb9l49yDxhTS+al86GAIO1oBwkDMO2w2W8qQva1
 TOyivEL/Gh2O/4hc06hUSXf60mgrD/XX79y/g8UkCPA9z5wdqJocDTsLCtjm3gmzhOap9E9FOYw
 r6Z2LhYXRWPtz/pxyNstyNl4Ielp40+2z6mfxbbEnSmDNpJ1ZGAjn0SYNPhlc+dQ2a+T4uAIoeD
 Ou5bz+o4/+mh3ZjpYr1DuOtR2xHgFDz30zbsSjR6eDwFYM7SrvNIy84N5JKA//zUDxhNeL5pIm+
 EGi1sK1uisEwVm8bQMDtRovfZ923rfCmGYDPT1vtA49y1bSSZWuukRqU9q59YFYI/uR6betYzyg
 n8wwz7Sy7IN3opqZroNkLtw9m24J9VcFoM0LwPQFsptx65PfxXOEPlfLv/R3e6Q3FiGr5w1c89J
 UVSzIs9sDlIj0FTVAmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX1PFDeDvsDg/c
 6Ny3EAo9CeArVp9gg7QNGI9H63pR8H8JcaBzXjU9+2z8Ja3FTvctaQKFfrsPSdN5mIPv7gC4xNg
 hV2BiD1D0bD3/LWdKbjWIj9tbsZZ4zE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On Mon, Nov 02, 2026 at 11:28:28AM +0200, Atanas Filipov wrote:
> On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
> > This will be true if:
> > - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
> > - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.
> 
> Both hold for v7:
> 
>  - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
>    subdomain, so a performance state set on TITAN_TOP_GDSC reaches
>    MMCX unchanged.
>  - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
>    so dev_pm_opp_set_rate() votes the MMCX level through the single
>    TITAN_TOP_GDSC power domain.
> 
> > Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
> > (MMCX) power domain, while its parents (pll0, pll2) cast votes on
> > vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
> > not match, so we need separate entries at each of the corners.
> 
> Agreed that the PLLs need MX. Upstream nothing votes MX for them
> today: the camcc-sm8250 binding and DT describe MMCX only, and the
> rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
> the camcc node carries MXC next to MMCX.
> 
> Since MX feeds the camcc PLLs, which every camera consumer shares, I
> think that vote belongs to the camcc-sm8250 clock controller rather
> than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
> power domain of the JPEG node. Does that work for you?

Konrad started to work on that part, but currently all the votes belong
to the consumers, which means that end-devices should also vote on the
MX (e.g. see Iris devices).

-- 
With best wishes
Dmitry
