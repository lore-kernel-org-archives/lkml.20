Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0553BBFB2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021587; cv=none; b=bd3iIZ7kFPoMG6rffEi85RgQP/nBgWU+ktKUHsPsLBL3c51xu4UmT3+x+lbDCg/+GqPewE89iGnxlMvVACSJhy2jKzWNkgglU9zGFGXiyPqh0j5hSDhdIARE12u2iIBknU8Hx8KfJhN+r13nwyb2gEY9v0iSs5wQ2itaTI/jQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021587; c=relaxed/simple;
	bh=Ljm5/80+eKYYhfC/Y5wV2iv6COTVsHuMd6r2nW1uC7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8EVHjw/CT7vv9H99AjzR2WfWW41g0fDjGfQA1HpOywBSCoF30X90ciq1CVSYZ/yF/kCZZzx2w8Adi9iyVWU8JMkzhbhu+bOp8K3/XaaAtGNDq06l7rcpfYAXwUf7jaAXnHe00SFtHyGkmnfpxmz1A6OhLPVK5xOgChYDDd9bOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O46HmpVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyJhqyda; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O46HmpVJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyJhqyda"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXI1p152313
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ReKVbNx+D5AMrmxj0HiDzNjM
	MNMqfQtzg8j7u13LE9k=; b=O46HmpVJH9qI9Cc9w+33CO6yrWJ1EBw2T2z9pILQ
	Vh4AvXalBt4x0JsyiRg1RtPbCzoKDNZm+GzJRjwbIDX+gf2xYpNGMB+1mHxtzPk0
	P7/80k4m4HKkXINqmyQPdWn0BKSxPZUlVdjJpn8aChpLv5AFvvqlOV8PAop83o0y
	i46jyUhlJ/zq4LGG+MHe60GCNAclB56uAJUrgf6LRmaqJSJDYCsCrp2jqWto/hrP
	JO3HL0jp9VAEUNU+pQYgZdxCeExA36f6FabsbimVXTdpKslfgCJarrrr/8qXhwFJ
	vMTIP4UXyomjpEp7IAiuPUkjHOFKT74/8muEUeqSw6kidw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aek3tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso125570585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021583; x=1792626383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=;
        b=MyJhqydaSLbDYIvHgV1bgceS1X8WBNzpaHYjvwl0KotpFnVR+zgeeLuhVtXA7tr+By
         lgYwYEXR9/mmplVeyLt0AADIKABKONx40NiBuTwEvu3CNw3NsJFO1Iak31lYGk8f+FxI
         90lRFFBvlMd61Cgt1y3DSglyvyXk16VIEAaCaiyY2ZG8smf43ftXlrQDCej1EIf2/9lL
         wth14iF+tCHO4lKpw4WCUu7BJy1LVd2FwLr2qJwSg4EJHqvvFjkZqhnt0zYMG5aXLpV1
         D3eNk4ULEE0amSpnORx7U2pZdaOgiH6juS82VmaWZLQzJxqgljv8pDS2bHlJdFoi765c
         wetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021583; x=1792626383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=;
        b=dLOfxBr4bvw1T7Uy5jTuCa6O0Os/HrxnUlegyX5hRIkLfsUTpA5gNVn4KVDRsRDFbo
         TGkicCeg3zeIMxxxXk0eVSAB34QMLHihOpWlr9UyzjMZSvyIsz1Pbm9ShFV65JIZNDpB
         kZp5hO/KsPF2irQO0sax7W2PjV655glr666sVDxUDmnl8Xb6vQxi1Qt7ydfudnCduT6F
         0SmoWOzBjiEMwwi/QY+iNN6CW//I84UoPmePBEengHGCmm0BOxJs04dRFeFG1t3bTPO1
         6rIA2xQuJZQ+q4O1S6A5izPNX+5TPLfoHQAUO9Drg8g/RcBP1SQF/nKlbAP27N/yZVpr
         9GYw==
X-Forwarded-Encrypted: i=1; AKwUvBzXN1aZG/QqPnfte1BRCVdLZdmcHoE9HgSwbMr0K/sipRVowd26e9+lhj35xHmBZ77fuC5by4EMoG69Nvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKssSUSbPPn7CGooCcexFubnwYxplsXCHoMTCbfhbdrpg4mg+EV
	g6Sv/Mafkj9VbgqPeuAmPoj4umvezTDZ95C7S7I3va7fXFrUA3H02hpTTRUbrCrOwiaxEIJs58z
	JbKK4OzqAhW2ls4xBQ/XkNU369c8cVWQAtLNBWyhIoE20IQVTXQqMdtz27JoQn+WGoKg=
X-Gm-Gg: AYBFou0laoPJC+mXclRFelPErwqERJseBKzTiETDPD2WTJPLBK56kuNQYH1s5sDvFnZ
	gq2pbBAklgm8BAsrZusf1gJqj9BDly/FGrHV6shubefD1knaOkLpKHTRuUQJRUzyyC5BIVylEqG
	2PeD0BUD0ZN/BybvmLQFK8aVoj/YwzjiNRq+9cfSftDx4eoIaHzyBQefl/wAvz7TyBKwKYpNXUT
	7bDf4DcqptG0+fUetcE4qR5eGMkUh2/DXnuaobwew4G3eJirQ40yygXcKfagnUrM4RPcgH/x81t
	zquJLMSjPjhU02abq/s7mOdTDZzrNzgiXgBgXImBrm5gYF1zzS0Fyyul4tbBP91ij3nOcR8m7XE
	feicmzwI2MLyZUl2IwB5OJqlomWTiAvD6x0+gTDmjrQZ38tB5ttOKjtbDa4AWMzZ9IpcMOBNkYT
	ODvLufQpZ+sj7T
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93ebd0be3d8mr2916451185a.1.1792021583034;
        Wed, 14 Oct 2026 16:46:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93ebd0be3d8mr2916446585a.1.1792021582503;
        Wed, 14 Oct 2026 16:46:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d90ce5sm957598e87.59.2026.10.14.16.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
Message-ID: <otk44i4caul5k5dhqsprgmv4hr4jrvtpq2nhcyhgc7ngul5iyl@jmz2ebrwhcgc>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
X-Proofpoint-ORIG-GUID: oj5Vvt0BS4fcalekoQc-PI2EXKJjbaqC
X-Proofpoint-GUID: oj5Vvt0BS4fcalekoQc-PI2EXKJjbaqC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX9LoamP4/knYP
 Y1KnOiP3iIFshFXnmy3oDD32FpCcXCpXrkQfv8y1O6dOdvMI7Z8fYRXMJFtYf7q8o6v3wCl72gB
 IDFKV7ZDWu96zgcUqffvjWXWY0i1HFE=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6ad0144f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=YnuTlg8LRq0IA_Y-aJEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXzbBe+QNLWaNc
 WOJEuMG4X59Y8R7HibS9mEg1rsuO924H8u79tOsiAVw30P5UcvmzPRPEQ1BQLkoyo3XQ1YvIBuc
 E7wKyX5U3un7HlJMin/D+8nDpLvRzRjDowvFX75FBnRR8MFKPL5KaghlGMGF5KyTwy2J9j6/vWT
 pIPi7VOca6gIX5CpvUtRbsV0WGKSKO2kiy8EfOr+XnICGapvbRaGkGtkYQJg8NcG8CLyRuC+qFf
 qqtow9MuH1rq14NzSYVHMy5Y38i/suFGxzkVNanznIE9sqPdAfFTj2Eii++9b4BgyTxKPJEpwW2
 t9IE9MzMsIUdugUkEnJls43TsLeQcNw8+j2ffzFQHQX1xVeJukW4pislToh1gIbriQSIAzPwmJa
 hzXEyin34H6HfiT3XXmehx8itNGnLHzsJYd2fMxpbiq4yHkeclOxBF/dbgmpGYo1eqLIrdWJyIs
 zrLQawZ/Ydhah/B3BPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:49PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The typical USB-C DisplayPort AltMode capabilities for a down facing
> port (i.e. sending out video data) looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <0xff01>;
> 		vdo = <0x00001c46>;
> 	};
> };
> 
> Improve the readability by adding defines for the numbers, so that
> the above instead looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> 		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> 			      DP_CAP_UHBR_13_5_UNSUPPORTED,
> 			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> 			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> 			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> 	};
> };
> 
> The generated DT binary will stay unchanged.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
