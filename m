Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723615;
	b=kbI6ZX/PSnUeGryEW/98Z17yuMMVoYvLRcayFzRMNGNJXF5OzEWBOrCPL9e7g8pXHvf1
	 20Pk4f4wTRAD6S+9Gf2Kyb4YXoG5RRDpZIUcO66fHINXyPzyFspMztsqme1ETSAAdJtnl
	 2+He6OC2PQO9ECrOxylefm8U5O1p/hN5o/kPH4QwSkZMPWyrGSOTU99O5eL0muQXMBY9G
	 srsJIQ1wDnJm6BDyj7jIuNb6irwZt+7ATbfF8O7bYlEAgx8FJkQ4UTSfAG875vQlnJnYM
	 rtzId4sGdaSCoSqX8bhlVP+dBlx1/lJ7EiIy+19xFG0e6qm1RdCLds06oxDkN5MGVog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
	b=YWazLicFRTLYFRXnko23rYCZhUYl8tPDmndzMZ50EpQBYyAtP+H82nayU4VvcXA+GFTI
	 LUzPwAoxulLJ4Cq/IZjIdLfUKHCuni4TJeO9zVp+gk2dc3GroogNl/3ulblR6cOInhdHZ
	 1AA/jbg2bGgQPK1VgjDwVMnDj7KTL6iFduGoHjg4g+pZxvx4xvuHsbuHEUvmACu2HDDYF
	 cgQTjwlrqCPmFOjySThUn2YACEIJqJP1g+b4qcSHBssBLnAoq+1vB+8DU/UcLKPRsDHYm
	 uWu7fIrajA+W/lmP7izWG259S5D1AK57ifs4OSqeaHF4rQCUS2GwHSRlCZ/ksZF1DDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lCyHy7qZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GejysvPz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D7606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lCyHy7qZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GejysvPz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FH1C427088
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jZGakksiT16L7VwD3yU9IXON
	c38dFFpjtCK73vPsBFg=; b=lCyHy7qZAbrfgvxkRgKTcON+7ExWcvBcBqfN+dyc
	VtUDL25cAEUF1PPP1l1l/gzWg/myL+jGg6ZTeh8rSzLZ5lv11tqgb1KanvxSh3x4
	WuJYQjp9hrFjsU57LumEKuXeL94eIQqhelPBaFs878O9eRH+s4ggN4DuT6M2B9K1
	TlxuRwH89IVWIIZboZwqFzEumvgFGbgZ+/8niGm36VaU0Ubnd/0SAdGheFZ8uwXZ
	Z9YxJG1wsuL9vNZozXMua12Nkz1kSjUxiXo/ECmF7zd9bgRk/gtceMf5de48HwG8
	bsYH1b0IqVomT0TpgfEX4zbtPIZJOZTAzlP9/V/hQNdX7A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms1gsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:46:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so705272eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723613; x=1793328413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
        b=GejysvPz+umkrZWuiMJmqtrKZV6dfa3Ivos1Z94HH/zFvkgRAz44MhLeIGkis7K32D
         ZZ74oFG6WpchsSEocSf/i3hHFjAL+hnr58Baxuws7DrfUe5zNp6A2Bu8F3LOMQb9wCyN
         5fFIfiNGjSYPB9Qs3OBehABwDkxQASd7Fj6ymg+7fX2MbtPbYb6f0ogFN6JlVNLDC2pu
         91VTlOqhSFYzOqH25jDsAXJ4yrGUj5BMo8G/nMQkYhxcEuCVKWhS544JWz+pjigvkqnA
         IZs5MAjDVBtKDw2nutW4ahtS6jiA/ac9IZFTW6jwoPdgfA3X5vSf1VS1HgT2hwFylcGX
         yorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723613; x=1793328413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
        b=WmW8cxDKgy7F4Na7aB71nc0qBbz42JzMEtFCLOGr1m3Q7L+e5H3E7mBZckZXQHLVE1
         qi2FsOWe6jKsJ8WYGf2iAzqAjHBEnLIn0KtI/b2gFxFsrDSm6ZqQtPCdmN/h3NKxtVRc
         zjfO42OdmTOW1nf5Le7JLcaVzRlirxHY8CLNU5cmYX83sN3Ltf3jqSLnH5LyflLD+2B0
         uQw5798+1v6l4hJScXOhrfF/U9JpnObh6S+xxjLAM3UKA8+SBQlC8X69J0nM2TxY1vuP
         U9gXd0pFsy3mWmVMfaaWpEp1LZP5yu9kZSVtpqqPIC+5KBbWMTqCCGOcHytR8czHj8p1
         t4bw==
X-Forwarded-Encrypted: i=1; AKwUvBxbwsr7+msQDP2NdOBkSabJNmfKPO3y+t/pdfEwL6UsDEYw4Tv5JZxhWepdYICUe8An74zsQFUMQ/rE+BQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQJWpzCf8r6QA4+HtkdKVVLyDDsu2Wx9WEmPDi/3rE4oTMQLR5
	sz9twueaNyqWE9dTJhgRrCvMWqUG6ouy/wBG1VAgWKm5ZNvWOY9vEGws3dYdmN5x7cqIWVVK3DC
	PbsAXskJLNbE96Zb1RE/5DivqCI5O5qGSrhY0eqyT5ib4hP1DFr59G6QWCDhV+k73a+E=
X-Gm-Gg: AYBFou0EkIuDYd71BI/NA8Z3h/4miWO2jEq2V3z2GdTpAqIAJusE6XCMVml1Pyx2Gkp
	VrTP1dF1L43X3dMPZcvCWUlxGMbBGgkS772r+qPtdUzxyQBTroWIWMwL9bTqBCwisvMIiL/NpGo
	s4+LFNDqypuKY8Com8iF/slr/pWoyIV/+Sul8uavUwx1buvfF4pgwWbGGbJqd4JwC+1xIrBwpaI
	ztdBmt8stmbd9lh+T76Lae1COmCdCIqSs6fhSRMmPmb3srDQ+tSGnKe6Dv8C3n4NvRKSRGXjkAC
	gVxItTgljWXhZvNgdOvCa0Sql8nuPUMJpGlzy/WcYSX7Vu+8pJwVZuEoqILnHAL9M1ASFJoydJ5
	xbZIjKBtAsgGlBQOhEupRFlUS6Ngk+V0N0EUIbpH7Ug==
X-Received: by 2002:a05:7301:6183:10b0:351:4d03:c6a with SMTP id 5a478bee46e88-369d96dcf19mr1233567eec.12.1792723612812;
        Thu, 22 Oct 2026 19:46:52 -0700 (PDT)
X-Received: by 2002:a05:7301:6183:10b0:351:4d03:c6a with SMTP id 5a478bee46e88-369d96dcf19mr1233533eec.12.1792723612058;
        Thu, 22 Oct 2026 19:46:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5e9edsm2112066eec.9.2026.10.22.19.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:46:51 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:46:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Message-ID: <atrKlhwKcQ2n1v8U@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX+3PdD6eJcrwN
 cmtmOZKHW2q2ig5/1tF8736FtWyFFP2Zp7Qr+fqDMYVcbBFWE72cZWir/eYt1WT1AZH1JbTmGhE
 m8thIm8NZ3hp5468Wi+wtZgI0JyvU3CszbqIiixSKwTi8yEG25flnjbzFfsEvPoeZjLR0Blkvjc
 +zlNqL9wTBayN9EBZTSPFV795PoM864F2Wh2VE4K9HoROpSBM6hEK+5z6gE10Zre64sAK++O2Sm
 GWr/PjYOVlPeaHTYeEty5uNBlKalUf49qS8XYGt+XsPJe83dKMHR4RLxux42+QdKyetIBkVeANi
 qsHXjE7G+17HX0anM5Wws1B+TDjuoMoGRpKu40UTrtf/d8SynatpLk01oK0aMXfhNd3aBPZQH+u
 FIbueTlENjYHb1IRiv2pQb1Cm3lwBTnTzKJCADhTKYArLTMqXHJ6Cip5jQYgHriGzRYdCgwChS5
 +F4XlpTEz5uoBrVtGKw==
X-Proofpoint-GUID: ByWb2IThUQaiRupnsuNi6KbOkcE1OGaR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX3YcHYPCift26
 tlc1LKMraTLbriMCyXGtEh/7A/bf2dJOI4x2HE9gL7PB1Uu1dJze3ueDEyTr25KDPqR/WL81C60
 Ab1iErh68II+3S3QSOnuJ5OkL3kgV1k=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adaca9d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8VUF_Pxp6yIriAAkYdQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ByWb2IThUQaiRupnsuNi6KbOkcE1OGaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:02PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
