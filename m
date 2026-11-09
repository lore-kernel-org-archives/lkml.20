Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191521;
	b=o4WNss3wbHqfoWjz3r6VT2FygQVzj8iFerAR1cH774weKlDzzdSBneAOM+P1J3un78GI
	 RqLqv1ngQfg4gjUv7dq8rCgUD4+I4TFKxbC+NHJztMFJMl8BUl2xYFeU+cCaIZFcS5wIN
	 PkQskCTuD/eA9uK3eteqYBSN8Ier+Oipgx062Za7aOgka81F8ve3Skjv8zz5+49pj+8D0
	 ZBA1jrlrbFsMgJNAUUMGGFlTB9XkF609uCIESxSNKTdz1MxIq1gjxzr1d/Q91rgJltJ76
	 9F2TFqlZ+5TG7KBROUIo1uUjwoserSc4kLBv34onMD8lNzsFdueosWrmFjXMnOvEiwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
	b=x6RJ2Adg5CMqLprVMsMHOPcQ+zzZqdtJ8btAaTgmThxLweaon0Lhc7apSfDlNhm5iUzT
	 weJxsqoAn3sUTm3xxworuI5FppJxWRIBTFiwyoLusY1ETdu78bCFrMDqm6QK06+uPqkBZ
	 1VYE3llCxT/BlkNFLmBZbwjSBV1mWcgnmElyycKxWmaIzcK5E/O1z/bJPp8zirlUOYKLG
	 yb9Z15fy8wWUZcc5/R/I2907pIW7jfZ8jvoXMMXk/DkKf+IpRSJ5nMTztm5jHE0IjGNSm
	 hKSfGyVVr/ZmUATsoSPfBIoSi1HZ/cX5ekppAUEduNDU0qfSJqx2wXypD1csPynmZyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfY1NQzN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2eXXTGJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E7606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10E7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfY1NQzN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2eXXTGJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H3h82872400
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 02:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7SFrqMGiGYXTqFUF13dP6f7C
	gotj6WnY/CKyUSighPs=; b=MfY1NQzNlgTlzpdnjDkdCyR45kO+Y6SrUk21XBhs
	+0ldf71sxm9viqmWjP50XeV0MdEgrhEZc68hBHc/1H+Wnca+9zMbgD1cnE3jVoFw
	Db1Xss3ir39qcW78GW++YwKsD4880GikqvvVsOzc32KDesGnfoNJhhLMDja6FV7F
	Lsab48oGjW0JMdveYXwbhfj5wsR6cWkPigI4h0sV4da8uWdGc3A6Kwxnbu5vcuUO
	PWJPOlzvPdqn+5Hk8nlvXanIti/9jprJ8Bzx++Hl3PwV4ndrpM+7ex4eO7urH+Nw
	RsfkUXANQNXWib90mUq350pKl1U3C08usjqiqhEzML424Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnvsda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:31:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso107757c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794191518; x=1794796318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
        b=A2eXXTGJ0cjVkA6JHUp6iTxttBqXeGkWIfhgaAD0fP3uuKicNVg9Qe3A3uIrgyMeWu
         ZHpDjntMmrK4w4aRTdI4zyJGmE75ICgLqKoIEdOa0XLggh1rGFno+bXvnkoKx+0iRAMr
         MqEuwmnyIw9ZzdqqbfX5GGofrLHB1+PZrPr4bqSmDyalQajZR5bFvUU26Vm/rY69PeJi
         zJLB+n0arM2OOTSkKZnN2mITRsv6iSf4PxpCoaq1ZAeiZT+YVRAqGqt7oGNuQw5/+1Hg
         rR99X02/81JqSmD5x9lkTz+eRD/gcDxyFPpb0zxLU7DlAlsKPacUKtOB6FiAectpXKNS
         EjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191518; x=1794796318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
        b=aiV8/AwxjZBwT4vmFpS1sDkVEnAe6JivMVdysQMVcmeqOitjlc1UtffCd6qqjSjeFQ
         I08k7FgWny4OvLFlbcEgAHax3zTxTcYpC5qdPSNfPK1XWM55t9tqU+t2EsLmQhtphDkf
         PKagXB24pI9f27fBDZ7AxCZsHIg5urLi1gGuZiep1xouyqlFnMkdTmDOcxhzrnQVKYL3
         TZggaIPQuEYrbHQTA2aOJgwGHxgEokrnbEGns8FYKW6SB1RqssjGP99V4sBwdc8iQj/j
         BqKnT1sr/qx/yPqeM0zREfDvz6z6pZIVzyuaOEKNbohd+bo9b0cnhsXCbGmuiOjXCEJX
         sBGQ==
X-Forwarded-Encrypted: i=1; AL+hErEaLJGTuiYax6GyiEPKIEri7CGMi5vLOSr4ErPj0c0tiDwm/k+expMBS8lb0QKDBaEhKVF+UeaQ9GuFKSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tW+u3KWdejRcoiNuSj/mELZY7RJ/LFIsZSs2t5tmKSSQ72k5D
	3dzoJ/wqg2tw4iynWXfFDRrnz1TnixK0Rh/t0UhdELGQRZ+8BfSFmRFQwCg8jSk6kcXDNvneCcL
	/2pIaebdW+8bIr0n+Yi+EqqEl3WJ4IqELSlRJBnRaA2nemXiM5VPm/tfKDVGil/O3Bbg=
X-Gm-Gg: AYBFou1Bimpt+E7Cnd/Kq/VkcWAy7oHOa5pzn2zz6979Gvpc6SQlzGerviuN65mDQlC
	CCfa3fOV+Zl1jLja0E/dkJcUXCBhuAg9i5jW5OMC5ehXBtt88DUc2hIzE/2bVbaQXMwuOZ4seXg
	nrG2cAjldgQztBVRlABaaHDoICTRhxuKNreVs8Cb5J/BMl0ZaNi6s0LOejq9/oPoejg8x4cyrHX
	rByyoo15xcjzKePvRQEEiu+8kdptYN0TpZxJoBlg9HXFriLVyaZxltdzaQcxYeSJj/sQ0c0UHwR
	WPooMTccWpC30ykw3RZOIPVS7Fh0JM0aEy7zfAgh3Us0wJ0hW6tATDFv6BJPT/7gAutCDlfVjrQ
	TiqIzMsZFzbbBwQMXbS/vdpFapSdj1RCe3ptATxlvuO8EJydr7ec/QFF9sjC8Qhr5OjVs/LPIw6
	ZYHsAKrsidpS8g8X0W2O/5r6hnoog=
X-Received: by 2002:a05:701b:2905:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b39fecbe14mr4302372c88.16.1794191517824;
        Sun, 08 Nov 2026 18:31:57 -0800 (PST)
X-Received: by 2002:a05:701b:2905:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b39fecbe14mr4302325c88.16.1794191517129;
        Sun, 08 Nov 2026 18:31:57 -0800 (PST)
Received: from YUANJIEY2.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b372ed839fsm9659808c88.0.2026.11.08.18.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:31:56 -0800 (PST)
Date: Mon, 9 Nov 2026 10:31:50 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] Initial support for Advantech SOM-DB5830
 board
Message-ID: <avEwlqGhRQz51b_0@YUANJIEY2.ap.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
 <179416929274.628393.12037192351352245383.b4-ty@b4>
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
In-Reply-To: <179416929274.628393.12037192351352245383.b4-ty@b4>
X-Proofpoint-GUID: -4o81btVh7J-48hQaGOxaLd2mDzOgXhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfXxlPlpzHatN2p
 SYsalHKkaKnpoOpphQJtNihIPzZAo8yynzsdstcHueGABxJ/1DaK+seVPI+bbuywKXYSdX1Oitg
 H6VwYPRHWFMKnCcBsso+rYjYxdWde7PWqRYtohDYlkUA9B5435PLpXEE9zrX2Smoy9rOC0Ov8ny
 V6Yt7twSzsYMbTsQqVOGWXJLNVpc59O3MUPBG0QoOGidgmsz0hekE/NP6Fw6hFTdOleIeSsps7b
 GSghxeAMktRS9yt+K/m62Xe8b25O+UjDH8oZVLkQb0+PzodXuxgxEo8a9OosRrNn4Oboz5hxrVl
 P0+FV/mc4QrzKYr/PFu+3dA2jRBHKaVNcjS7CrD4B9CopOsuCnMTTEXJpMQJTF638rhm7B6i3RZ
 BzSocgMQGWpXnd1oi5zQAPWItx1WwbvtBSgUTg/IIso3jhHkwiOQ8Stp3UnJoTGq5xXwtfKP5yb
 QU2tHe12iaCzAmYF+6g==
X-Proofpoint-ORIG-GUID: -4o81btVh7J-48hQaGOxaLd2mDzOgXhE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfXxriC38RxNCzb
 rDGXwMN1QGHhWiY1IuYEezbszGx50UT2XDilCGpQhsfxCm9+s3RUq+d0kO9Xo85VrNV3dmwlXmu
 Jg5Fjyo0yS0kEMd7B9M4mNHjWF3YqR8=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1309e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=kNaXiPVJs_Xvx0yAIYMA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090009

On Sun, Nov 08, 2026 at 02:21:40PM -0600, Bjorn Andersson wrote:
> 
> On Mon, 28 Sep 2026 11:18:47 +0800, Yuanjie Yang wrote:
> > Board layout:
> > +--------------------------------------------------+
> > |               SoM (Advantech SOM-6820)           |
> > |                                                  |
> > |   +------------------------------------------+   |
> > |   |     SiP (IQ X7181 EVK SiP)               |   |
> > |   |                                          |   |
> > |   |   +----------------------------------+   |   |
> > |   |   |   SoC (X1E80100)                 |   |   |
> > |   |   +----------------------------------+   |   |
> > |   |                                          |   |
> > |   +------------------------------------------+   |
> > |                                                  |
> > +------------------------+-------------------------+
> >                          |
> >                          |  Plugs into
> >                          v
> > +--------------------------------------------------+
> > |         Carrier Board (Advantech SOM-DB5830)     |
> > +--------------------------------------------------+
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
>       commit: 5fb1997399eb2e27086f1cdd160a120314358f1d
> 
> Best regards,

Hello Bjorn,

here you have merged this change in v4: https://lore.kernel.org/all/179065170995.2673486.7594805451558800807.b4-ty@b4/
and you do some change [bjorn: Added "-avantech" portion in filenames]

it is already in repo:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f28aec2091c949a0e2ba76ad6b5eda34301e0a


Thanks,
Yuanjie

> Bjorn Andersson <andersson@kernel.org>
