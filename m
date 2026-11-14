Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666830;
	b=03aROectpX9KVJb1hwWYaMXUm70Peau/y3/XgdjkOzsho55Xp1k5p5rnWtiL+zGMi5cP
	 IUlmg3xHH0o9QQ7NCK77Ka19PaM1HgIhOGNk2X27pYcs7GahD3LXo90hzpBpe4dX/0c6o
	 B345DE/hXdaiqEArU9nPlOVobIGJBawavAGfPCmPq8t6qLhAKMExoSomu9V03dkbpsD4r
	 6RJJsdshh7y7Z+hRRf+rsMvwmcRS+/lMNM5dQTwClhX6AmTQg4BkB1vzGYUYF+7u0S6+5
	 RuU3Izqh9cLa3sW0DgbHuc4WNoJMZAfkzWCSfb1v8mSoU0ixQJ/5sYGktsUjDMzv4iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
	b=VMGCM6X4eVSQj/vxqC5T6QN6Jfor6vg1GBRTLn4gO/nGq0lG5/6gYDIsKU7bhZxAvBNT
	 8tEgauOv5IfLxqVw6T8UYwjwssLuzuYEOWirn1DRLYyujAOq4FeItg3o93P2LQygjF7Hh
	 uFeGPWELaMzOqRZ5dnxUfnpvXY20EtmD5OO77QJglKrK6rZUPi9EZhgN8dUR41um30C8K
	 36Vpx7mYLx7f9JAEL6ls1Nrzo9hplffI7BnGpmfM4EGnKDGSZUlp0ZBLLS/b6OKNt9MaL
	 jFaPidmLzH1771+OKVoDcUxu/wEoSW+EhzabIxuKHJhzMGi5bpm8L3u+0nN4RaiCsKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLnCZ5gF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HoyzYkXC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB41606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB41606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLnCZ5gF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HoyzYkXC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkOPc3630459
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XelhVseWOPwz4cK878gUhIeM
	0Pn5vcuJ7TytfawmQ+E=; b=ZLnCZ5gFbYxUpWpwvVj/NNjZnWvQTap1jU22OKf5
	dloRiopwOIZa0H0Ug9cSEg5/C9JyyQqZHkEGLQJxl2F1rsnnyaL1fDOpNYSVIb55
	dCZgmG9ncu9LkgWXp6RPCLBY4byu75CfotvNz/JBakfL6ktE5KaDchfl9KtUxcHP
	qxGPFckLqPYU0265+OWevF5DqPLRTJurlBFFoviRNpu/Wvf4wTGB8xaVFQsjLUMM
	JBweGVbuv+3Vm31cuB3WZ9Usdm+6iHbSgcLsaiXj2bCT26fo58pcFlN8pQAkr61t
	RyT8eah7xzE01GnmDcC8FL6ZtVG9VM8NEorXa/0TFj24HA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw8xmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:33:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94607500fb0so349682385a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794666828; x=1795271628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
        b=HoyzYkXCS47q4ZIjLf7aTpXt/HucpMPZKjiINEjczVIzbpBbqQHN8AWq11WzQZSoAY
         rmoh8YeW/X/D+k8uQ8RLpMOLYAX5AexC+5uK9AX1Yvo9vNNHD/ehUd5UvV5y2UDwOWNb
         zskJNX89hr9ahUuChY8Ku4R4ZZK7OAFVA3kYwDP+n7W++vtl32T0iKh/qjjK/QRAK9x5
         5tnOISCsD0PLKorpsiQxAjO89l6cIkn6lVU9xS6YnthT2LAeaakxHWwAc+6GwTGZn0H7
         mw36tFSRW/ugkZx9/XJ/4F8jORfYYhH/eCfYV/tt3LRKs/3iyXa2nPquHfQMOl+/J5YB
         stKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666828; x=1795271628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
        b=lpfyhbBcomSvmfzA1N1KzvxIQ029gk+EuKXJD06gl5RYjwdYA7Uz0zorSad5MbNRno
         7+8+9p5Rnqkz8wMQYX4U+eYfuhhPOpq7uDxI09jQn5ZXs+Y6Dq4M0URfkCdUvecc7n0l
         nBk706Ok+/l+I0v5fz6hwvmuhffuirApKOq7AKvKP+KVCA3bF9i4ChOraFMfKRqSmuqQ
         wBhQQOYMxKAy/YZjuSEK4euw2EXZ0Gm58AN9Xv+oL9N6ZFTRl4sq09JIyx86hWobWYYZ
         r8j+Zg3leicXcz3vJKmdVP+f4hRYCZDwWD54PDH+u/oYCtzXYaks6EmVznUwCLNcZlxM
         FH1Q==
X-Forwarded-Encrypted: i=1; AL+hErGwjOOSdcZ3JkVbGxS9HpBiYNs8f0DVJaNtadFJGFsYGvGHnyGbxJbhRd+0bOzbMfqAqvgiTZ/tBxk1baw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2R8QltBuFTKfJ0gAFvCsSqjwEbNCTspxCLyfsHFUFTt5OhADB
	z7RYOSU86rhyDmpH1AUl0LREdTOOUbV5U+y3V5vexzKC+KlKEJALXc2ncArq81ugoo3LZPYfnz5
	OXDUk6pmAxrLT/c1V2D52+OuRGY8aeMUryJH69bxjqfg0cnkObm/tZILEWYxjqDDIZgU=
X-Gm-Gg: AYBFou3MGfke9Q2u0/fVJ9VzWmTq3fEIHliQxTHgPJ3HUaRkHfCg3zyjqUpcdU/3QIH
	it7ipQcHhIOIPt8lKTxu6tAA1VphS740Kq3IZ91iGTDQ3bAq7L7BahjnEoxhCV29zRCHasBC7u0
	TueJ/7cAfk6d+RWg9OYVYKTROW66wxvmEsMZmqhtNVfcOgZvKJ2Bosk+15fT6K/Q8lsJ++qv+tf
	IPF6CmGbfMbuhikGXTlqqTOjiuYzVm/wKVNaP5NGNsOBpSu8NPP1LcV8Zcv1EPf2p872GGycLCi
	AhugbCtsYDAtw90sR10GvFjNc+ebHnn2g9VToY91ZRKhp2gs6WUYf5xGXtk/5g4mQWEUufY59oK
	86TkQnuluNvWkivqlBasONFlrXlqtcg7pRRLG0By71DfBfGCssCamN7mqNQMuGak7
X-Received: by 2002:a05:620a:ac19:b0:949:5708:3c9c with SMTP id af79cd13be357-94957084b2bmr546880485a.39.1794666827541;
        Sat, 14 Nov 2026 06:33:47 -0800 (PST)
X-Received: by 2002:a05:620a:ac19:b0:949:5708:3c9c with SMTP id af79cd13be357-94957084b2bmr546877185a.39.1794666826943;
        Sat, 14 Nov 2026 06:33:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm18652558f8f.7.2026.11.14.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:33:46 -0800 (PST)
Date: Sat, 14 Nov 2026 16:33:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit
 address
Message-ID: <slowdj62cba3dk27sgb5l6pe7keldx3k4iqvx2wc534gj7kmy7@x4dxbjmdmznh>
References: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1NyBTYWx0ZWRfX8h6RFxDYOhPw
 j6a3oVoFrMSMWHZojjU9Vdb6wZWGGPNsymjyU3JZbx2NsplL2sDUUpG6SQz2N58SmLZuhL1t+JX
 U75imspq83rNW5aYOudeiqgg0aRm1XZvQa7H78OhybDk0+xg0Fz7dgrYDxsJewjKb1fzSEfc83q
 /C7qsW3JM1tE4W27/kO+KhzHSD6Na8/BHe0cbeGamYvr37HLxsmd9PIqZvyFBCieptkTqOyBgpn
 lQ+4hfoRoXsJXuUbnKFfvwurm2cxQF3WTZZH7YawnP7HKnM/zufGqrUB+hXtxKNd2kPmJe7SrrQ
 FnI80GC/EXU4N9DrAsasj9jC/np8cEBK9GO5kwkqG1h2VkSeGbkcXT5/njA3jbCAkA40CC3I0iH
 H9KJ1ej7ir7ro79Zft154zqO1l2aNQUmgoCP/u1enoT45Wocm/9CZQRQsVwcXvoq23yIPLlvOJU
 DwMKYgdPOWyS/972qoA==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af8714c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V6h-8VdV8C8-G1v_c3gA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UhcpaTx0O-tKuhBxiwBUMYvJowl7PKas
X-Proofpoint-ORIG-GUID: UhcpaTx0O-tKuhBxiwBUMYvJowl7PKas
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1NyBTYWx0ZWRfX9/k39ysrE+1F
 W0MZwhe5XojnIk+VmuPyAIASD8wRJr4HBxESwSle5qsQYyutdTtUYD8OMFXDfK3WEbVeKyloGIo
 wSCu6sYJo5ovNsyg1XsiG0zYEPyVpa0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140057

On 26-11-11 11:47:56, Shawn Guo wrote:
> The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
> breaking the unit address ordering of nodes under /soc.
> 
> Move it between syscon@1f60000 and remoteproc@4c00000.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
