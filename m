Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213977;
	b=kjhWknGf9xjAgpUfxOIU/5yLMgyv6nHy/daFK+jdqLrrubzvMATEXrz9N92us+C1wHfn
	 +vYWWLYTFMpAjjstt+o64xiTVkAQpug/dnnYYO8eNriYlXvvMDCMAPRm7jwKDLo6mPjvP
	 hKHjnw0pENXUcf+5wTsMcjoTraNd6t3KZVbzCqjRv3TRyNqP42AIO6PS1v6N4Xx9ZKUbJ
	 df+/zdbX9pnLAE7RqtR2otc+MN+DS/6ckFdJBDML6zEkN8GOtNqVRlF3RnVK7WOFNQEdx
	 0p+v3z+78MiiREGM/MY2F9wC+hGGwzVq55P1YZQMktuYUfBEybCAHOQmlgjsTh+Vkow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
	b=uEHpq1GoF3JQS5xFckGSDCJ9EL+ej804A3NnwE2qZiVhB4+HjVj6HxcBpkZ5KK6Zk6Bv
	 iq3n2nOzZQEJj5lbcevmCVHFssMyy0YhFcBEEBihd7x/MlxvX2KUUek0dzbdpUIGteBTm
	 C23O8aTD5Z9V2F3BgNqzH5BKu06fVdBogx8Y0rX9ZtKtqNZQblqP4foU6ty6CdT79xr8j
	 Ef71a/8lDrMSk9RT17ltwQWtaimz27jzv8kXIis/esb1l3QC0uJaKFSs4lDV9K6byqGlv
	 qglcIKfVqf4oqWCOwJVLdQKMJYahW4zziDs6+y7uueuGarXalH/eFauJt/iphK5mqTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIjyrxxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQLoxymf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB4606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAFB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIjyrxxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQLoxymf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1CM3298157
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6aPhVMVnTP3+PU03MJpjQMo/
	vWxMP+DMEwmZ9LrbkXQ=; b=TIjyrxxorzBIRI+Xpdfe5wUX2n1ON4LGatB2aYbD
	jaA8bFqHfAsyCXksgE65yZDMeNcx06EIEtxtvq9DkpngKGbtkeljPe3Vt1gNuzQ5
	mPKbMDBnudmPspTp90VKRrW12BL6LovO644gGVaZCeuTQeduQ/KCJmZwVjLDs+8H
	d/M9aPNAoNBXb514MVzWzbB+d3SF9Yd1AC1wxuhyk9qv70AUEw41lRic+C5tvaex
	/SUPwaHKH3eRXtvqUPkK+9Pau2Blr6te+SmEdid0swwscNsspg8imktIwEGMclix
	lfEtXUyajLfiS5Zcp77RFWfIyJ8si2Z+ZLeuRcy14o5kVg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwk2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:46:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc36b97a77so52725137.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213975; x=1794818775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
        b=hQLoxymfbK5Sxg5oZSPnefwFwTDhbffiREOzEfhws4fqMsUrZc1BNpXYKGXZrCOn1S
         PvagUviMakdlysqqS8ZSmmeYGGLQI7F+cMJK6DURqoWmiGrj2Wp5A0zvzi3euZdTi1mT
         seprykMs907qpnsxYPwk+WEuzfuYjeAH69BGbOY/7Ec7m+60+VzKEmQD4C8ReMnit1Hq
         pz10L5J2JPvfDa0EUOdhOi/4rAT2ouDtW41lnydCwRm8VqnokSNQjb2uvmylcjeQYiNR
         Ooku6ST2C8Tk5zuhXqHmJ+P7aO7nzwxG87oYLZyjz0Jc7b9LM4xKUWVFjWwREYsgxrSU
         U2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213975; x=1794818775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
        b=DrapSvYN1hZ13YhzjLhTw1XvWEbrfvrNvavU9wdykwSp94Xy6M0nfjXM3fHhgErs+y
         wb5aBCEjaHRuok1HCk61YbBbhIA1qfZTEagEzEotz1/iQH1+8F7FwBXc/W7WGX68Eaw6
         W3D4PFkCkiWtSjcAWyKpwv/5nNgjeflKbtfdjZNhJzH82W7X/MSUEv0lTBpIjsq9hw9Q
         rldis9dsf28uePr7ifpTDLeGUao4lVzbz4ngQaEzA7U4WxbKSlk3SCIO8IEahy6/25Bq
         CnpKJRTEmiXmY1XLI1fPsN7VIQIrStgCob8NqH0wjgCE7MHcmy859b5k3iHB6r1MSGnq
         fHOA==
X-Forwarded-Encrypted: i=1; AL+hErFjgyOFYH/mKzogVYG/noBZv/gYbFkxjLgqcgLELdLGo/xAnxREZAxZu9ZUEtEzRxnStEzdDWz6qkfyoyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RwVrBqenBVj84OoZGZncFsM42S8LAUBGY8apiQ7p7uqSsMsu+
	PHlaxpB03XReF2apAqSBFkGKIVsbYJmZf7JOTw92kg22aeKCMbHfFOHleZCBf5PqMkr+uK2ofwc
	03nZTIuYF3d88qMp+wq+GbfCL7ikOpL7KQRviUJgoLH9yvlvDB47XDhZusZm9Doo8Quw=
X-Gm-Gg: AYBFou1eMT33xtTPDsdrWpgZuOCa9achlTmmoVgt7gQ1U+PrqsOZ1rVsiEIi8xwhruX
	XpIQHm2zlJDFnGoWHUYAB16jSUlmRew0hXEytuOGyHnzhAvUL6yDAjsKOAoRcC/GDh007Kb7dGO
	M57I3vjbdZEBb3TxsK/NvF2JFKVDfWYQppyjPoE7aVhtqC7q8AeIio84kPlVI3j0Tr4RDJZdav3
	A89A31M0BxXXinWhrZ8zx0i2zuBhrtMbFQIRZvzhoQ5wk0Hl3cq92xphfclVMpg+kkN5aD+5ZaU
	Cb7TDyKf2Lzc++Zpf0Ot43aoZsg6A2HYwjd+MU+xjew8Dww29GxQLEzhZXHmboEA1r80Mq+zm3N
	asqAL9dY6m4i2eLb0OK/raFPlSz+lCVCNoVN0/8/QppltjWHVxqDZqPL+JanGLuw=
X-Received: by 2002:a67:e104:0:b0:7d2:7266:2c7e with SMTP id ada2fe7eead31-7d2db056341mr780336137.6.1794213974771;
        Mon, 09 Nov 2026 00:46:14 -0800 (PST)
X-Received: by 2002:a67:e104:0:b0:7d2:7266:2c7e with SMTP id ada2fe7eead31-7d2db056341mr780320137.6.1794213974103;
        Mon, 09 Nov 2026 00:46:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9a9ffsm8948198f8f.30.2026.11.09.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:46:13 -0800 (PST)
Date: Mon, 9 Nov 2026 10:46:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: glymur-crd: Move DP0/DP1 to
 common dtsi
Message-ID: <qemvfv2jf25ero2ru322wxvvfccipniav5miupnsspl5q6g7iv@aqojsdwh5asd>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-7-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-7-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX4SThnQVMRPyl
 tvtgzFTVjTVBk4OKVDbwywLkyX2E3CLnZRrFp1Bo8XQSv9p+mjbUUL4CKyUT8VxET1WqPMJDVT/
 7YreqkcoEqM8GSzx11H2Wa+69rNyhBfyje+yoUCKu4a2ge7gBqUqPxNl347KMUSSaI9LTg3eKWY
 iTeLv/2BTn6bVOoByan3B3sXgc2Gs10MxUizsLxQPIIXxkykwfMDriwmUcPmZhAU0ZNfd5aJo8X
 gG28K/xihL4eGFIfTJ74itOXw9yqegAEW6aZFYhumhHOpx6ektGMXKpB0lrVR3WxOzNcEuzZDG4
 3ZWo1aa8dEbz3ijSyXWUUGZtV6756JN1n687bXVqmiv2DlO6QkT7F2NBI/tuEWJJ8TckG7NJkav
 r96lCxgpQ8/UTVW7ATALkton43kXVyTcdkdcPwtAo+LyEQadq7ftScTMlbN1UoAPZTwlPJJqeNc
 wP7rgDP96OqVVCfjVlA==
X-Proofpoint-ORIG-GUID: etggumYalvA1HiTp9mpvXLlyZyTNGfHN
X-Proofpoint-GUID: etggumYalvA1HiTp9mpvXLlyZyTNGfHN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX3qMm4mI+Zwi8
 +6O+gulBdoYITP0jIKCo27off9VlB+4IeU3RtCe4tVRH7IenE9PWWtqUgLCJ3xYDc7bhwGyYEUx
 sxxGysP4Uqzmwy+WhunazL8X35VRCfU=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af18857 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yxH0lVdBoRGP_fzzAcoA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:08, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This seems like a rebase mistake, move it to the shared DTSI.
> Doing this also enables it on Mahua CRD (that includes glymur-crd.dtsi)
> which is very much a bonus and not a problem.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
