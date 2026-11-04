Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783119;
	b=sRRPtfv164szwfeV33TTcamsyITpTpVB1PGjbUF19Wr4sgbYEiLvuTDCpKXyspvi9leY
	 mHovl7b2oXCQuWP5w9EzNgJZEFZ668W4eKtBnA8B+DbL+7eVIOCujOaV1F+W4BiHynO6X
	 YtOJGbEtyCD0TbDe0/uuFdJvOLxOmZV3JJslelVWsGEn5GEOnT/JFnIh3cvKjMsiMUNmM
	 Lbq6sjCOuiSMQlfWnKxUSVU2XuaqUBQVTGFwsyL2K18x6sdxKb4yCUwGBhgwsoCEeicmN
	 88HnBXdttsjgEw8RjB/+GJ1tC793H6sWV6jPXNp76T1VtrC3rFyTB6KSJyvX3nnW7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
	b=2hKNAtNyKgnAanW6IL/jvAxkFRt++05AcXtW9xKpc0Zb34y+7PlNU15gJLVoYRByZe7Y
	 DgTQhgOe138biG+tG1mYe798O+e1/i0VgCzefkKHM0KCuA8rXF2R0dMPipdN/tEibJy3k
	 oC6yf1019hF//0qZt/XDN73AxTLntOLiIxG6Gmw8Qo7DCfXuGn29bq5Kalcdh1XPPedZ6
	 WYQAeEPnpCJbzhWYM31FdRKO36xtmdqL6sWMndIOB9iC+Fw2yeVo7KGElw1qClTHJc/2T
	 sNI2ubQuqdjKhCUi9D2Ob+ZwkfBJPCP04qv1JSLONIjdI3Nb5W+UNU2On6304DE7+zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwSafNQQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bygwT1e4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB36606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB36606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwSafNQQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bygwT1e4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48OmH0309833
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KBeG/uicFl/5Pl1WxPYzj06X
	h0SoRsIpVAvc4j63tMs=; b=mwSafNQQF++T2mhvQQzZuT6DGOKLYs90hfwpYHFe
	tLmBK/U4aLOQKYeN021mYi7FYQ9/EPO1jQr36TZ9QvMsJhuvb1FmF8ZknjH4JK0Z
	hHqwvSprqcquPOJ3hgwlcvIYrTwD6IovbfvnXaTryLGYXwkJzhQaSXuxuCzV71bX
	44A/9iKt8P5/pNm3bmPtbxbAk7k0gSv7t0lWTShgukvOhiCpDWTTYPjCV62WYFwJ
	9od02D2IvOYaZhOsKkKfTe5pkRP3D5YnYnNgYvk9YoKwW9KOJiaASnMDV03yTTU8
	cTucMLdbOYNSNB2lKiGZ2PMAnVk2Yyy3P6cJs9TMEPN8Fw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163g5t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:05:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8dd9b9743so6321565ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783117; x=1794387917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
        b=bygwT1e4rKFvFzo1NVcUpts1Qa8QcF8hfnS5YQKYPWURAMuvnFbrtOnzf+CFBxWTYb
         2+zZze+VuQERWW7i6//I2GY6v6i7VmfyhW4wgu6DxBTAFQGpy6bpFFXolNRlRyKtCmF4
         YpE6gX+zBqkW2RBxH6lYRcBnOurLv8zHyZKCHA7XGcjWTVP89OsRTIqVuJWD2yqfJDsD
         bQ+9dQ22KSgz4CqjWrXuumE+Y5RdQgnAa3hYhaLFJPo4+VzbpUI6JMl6RcADKTJXiKqd
         J5vKF5PyX3kvdinrPqPjEkLJ+41Q2IYf2Pxv/ZH+Pgz2GQ71tDaq1gcuH1M9JT7Y2b22
         bBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783117; x=1794387917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
        b=g15SVqPWsvNowPPL31gJDu8TDZPGYa3YFU5UxH6aRfYnkx9XqKkFzYlr3fJvCC2lsL
         3oW1fNCeszf5ciAD1VnpEp8dy4z7y6bwbDDBacf7+jVVOQuRoR82Ug9ko1hSxSSbybFs
         4LOUQ4aO9uOQapiO0Hras3RkyDhx9AJBYFC6DzqNk1dVyff3LyuUeAa3Q3fsAXuu8ToI
         5jkd48/Lb5/EfT1uS1VX49QfnV1ObYS7Ds4gJ/FiTXGeUbMMnC4Fed1QiYkBtFzSB7AB
         53FDLLtIUnp41Sy/PpeHbKUob3WcQpjB0gfthud06+X2BsAeySCE7/OxRkMGp1JWsFUT
         +qAA==
X-Forwarded-Encrypted: i=1; AKwUvBxt+tRWClsbcnZtndKEKBUP+mz7ekNCYRKmoXjM4lJmiW64Uvsn6h4dAqCskSyoNc4gZ3NAqxKhz7SnTNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0fIp/qCryiXTVVsTmUKL0VCZ4W95H4PDLeTqFL7o8MhzBm53p
	Fz1Rp6H7shP3eAlKMwsz5z/ObZEdEuUCK+5ZMyXFHnNO5ooHjWhjarX65yeyqNOQNH7bN8YssIs
	ijhpvqD1WPj8zyRlVxRv/mwS9axYl6kx3jK1pChfOp6ACYLUHBheI4EFTx07zUOpZbTs=
X-Gm-Gg: AYBFou2hourTQykSPMinDloY7j8/4cNmEproDaAzUmP7LYGTFyUkVg57L/35RZ0H62G
	3yQebaIrNRzRycAeDAXLzUzGEiw5XBJjPMZvgtxdUhJC+46Ntd28fTkDeus6oVchQCcSgrI8eII
	6h/JLmdKTfP0IRYC2Z9lwUFhHlgydbozCefqkG0jfjAUw3hjStBeA+LVmFE95Y8V/mHW5rkQssj
	egp5S39I8n0jW+3UJbWPAaCVV+WjL4E0ivbnMAOzyF9JXOMjFALVU/Sx5340UK+7vDZwGAMovFa
	EpI6oOzV3H+1Fryfwbpw/inaAby1ZmR92pUXntRS1j5kRYj4dsss4k/epnTk6Ssk40fw3Q/hoid
	NFcdU4Z5VXkJAy5tLupvn4GyY5xvAzW8t4dW0hQBy+SZ35R/1fWNhi8tCjcek+DytcHjIr20Yc0
	AAVl0vZd1SSiPICw==
X-Received: by 2002:a17:90b:1c12:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ae89286698mr12218411a91.0.1793783117260;
        Wed, 04 Nov 2026 01:05:17 -0800 (PST)
X-Received: by 2002:a17:90b:1c12:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ae89286698mr12218395a91.0.1793783116784;
        Wed, 04 Nov 2026 01:05:16 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8b1913sm8533760a91.10.2026.11.04.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:05:16 -0800 (PST)
Date: Wed, 4 Nov 2026 17:05:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aur1RlNm2YLYdaxb@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
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
In-Reply-To: <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fJFMJYHHoSeGSAc6m15tGH4OCFGLutBJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXwNbZWmjaQ5W6
 expuGMNaC+mZRW5IQG0Jt7icF5xeB98UfnQp38/lHngMqygd+691Ti0Qd96WRzSV5OehJbD0sxC
 UGzkRdX7HVt+XLh/Hq7WPtfHpxXvpHI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXz3cy3mtjieBa
 HPYXqMKdX+U9TRGgEoLMbOofkLB9QC6PepRpsbANdtQwIQsKhnf9TzeWwSJqa3wgI11j8SZ2wZM
 rtL++qwb8rxQYbVRE3R+53eeysbxQyuuvN2wwmoD6ioS19oqDERcGtXnM8PnMS52eLZAIweWQsl
 638UTbACmzNyu3VNO1cw9JAzPg/HoFd0nBRk7oJALQIWeXn7SM7//arOgD/+ZDgjmLmu9OMzs79
 XDCdPfrsfXp/LBPNe6uzKQGXuI3Yr/4MdtQqxD716HiblRuvVlAoK+CSqtLoX8/ASjLHwoVHMFp
 7mbnIKEHAeZTxg20HVgnkt0EmDfrVimpP0PkAeO/67j3m5uKJobJrmgF/zu9q44YN8mEKmFanWY
 HCXSoA3zr1iIMFNUg3+sUxdvjzCHKnPUNGO3yV28hCoyu0Vy3DO+92QBQf86uOyjRou3+InZp3P
 qquAbUoSpNnoaVbs3JA==
X-Proofpoint-GUID: fJFMJYHHoSeGSAc6m15tGH4OCFGLutBJ
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeaf54d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hOQGxnIeUdGwE_sWoTcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

On Mon, Nov 02, 2026 at 04:03:08PM +0100, Konrad Dybcio wrote:
> On 11/1/26 9:04 AM, Shawn Guo wrote:
> > From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > 
> > Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> > SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> > and DMA queues.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> I think we can't enable the ethernet hosts indiscrimately (I would
> love to be corrected here!), can we keep the XPCS nodes enabled by
> default?

Yes, we can. I will enable them in nord-embedded.dtsi instead of nord.dtsi
(to avoid CHECK_DTBS complaints on GearVM variant).

Shawn
