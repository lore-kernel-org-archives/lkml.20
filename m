Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0765012BF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570084; cv=none; b=KbKM+fg2Xc43wRCSqY9ObLhwjQN/4CDvkkBkt3RCfxlUvi0fyvyyvNIf7PNlwlCqNGOhkzDu1VWyhDvBrplgazwBGDXPYw983U3/I1shmPJAmMfSPO0bzLuCNq5B4J5SC1rY1lAKC9G1kdp/gEwPJEVfHnXOQ1+9eJ+Ybg5cM5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570084; c=relaxed/simple;
	bh=QG/xfKAg3z8PmN9x8CvACM8+/Ordyxc/n7oiA43oTrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSjV+WfJvk9iISUbm14VqwC1kE9XeuMCCSkGGfLFDn+Auo2erdBiJPuscyE5oehjec6/qFXDBBYmEkow2dWjnww4Mz3wVqiSOJ20RvwNHBjm6Yh8OrD8gYXUpG9Kfx4yHdeIBpbluL39KobXVFPxJmXkRGxW2yRmazcxe5eS+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1HW3RSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cE5g0Kir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1HW3RSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cE5g0Kir"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZRPV1620153
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 18:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+W0zAIuAAPdlKzcr9M8PXjcn
	x9tgfmOxwCMvNLyqNQ0=; b=c1HW3RSGsu7x05u0+h05lOhk6Sss72g2ikLekh6l
	XoPO/t1I8i1DQAkHh76kA270x1q4+PdSeNnt2h7Iko0l29d/14hEzbfPUwTZpuLy
	uJj1AhLhQrQONHfQMvCfCqipW898p/N9kUvKFPP/bgd12K6WmxYQehVzplfuQPyn
	cg8VBRjvL8ZECQmsiV9/yT7PXZ8W8j1WbiEI9bgYgduon8XTogX5kJEqCXCbpH8Z
	bBUsfv8KYzwsahJAZzIK4ZyArtWEzWoYiFw3Q8lbQJHViJDr3kEe0y1IDygG3M1O
	85LRjaMp6VZzflyEe4K1brHGEpPXKHmiONkOE+4rknjZ2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t705tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:21:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so1339116985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570080; x=1792174880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+W0zAIuAAPdlKzcr9M8PXjcnx9tgfmOxwCMvNLyqNQ0=;
        b=cE5g0KirML6Jtn2qaieU2R36S9y+H//JC1lZIjQegq6HkEESmxkEi3MxwtukWmtbfk
         Hmvkauo1EciE6uxe5vHd3vFVbFMJh+Nnb2z5tzV/5PtLfugZmYl2Juk8NUlumEp45dYJ
         jfkQYttl41Ouj4KWYwSQeAdl9jt2SHKU1446ib57bY6hnG4od1ZaFIuMbqYCccG9JooX
         WwFdTLU0T/8SGVi+GEjNo/5OgA1tWQEd12Ol/UY6W9+KisM6RVkan2nFkWuNBLQj+boq
         4peN5LK4hHeKq2bViePI1KOztCR8d592xjpnhmZBUMCBQ7Z89xWipCAkM3UAI1yM8yRd
         jmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570080; x=1792174880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+W0zAIuAAPdlKzcr9M8PXjcnx9tgfmOxwCMvNLyqNQ0=;
        b=oMtb+E1htJqkb3ZMdinT6f5q5UEeCbZ0zGWgSI0UDcX7cIv711Tb6X4UiiTo102Mvq
         lo4aoWRYLoBl8tYJE3iBmqHABfohBL8Fex0iOKBSwy39iln3hj1Gyanm1uSkcZUH6xx1
         /MeBqZpz0UF60qqEKZB0W0L3ELnk1mQ6ZXmE1BaDFUy+QhoM0IPm3UzLVtHdDiZ4EACW
         qUJ/0YAaPGUDhj5YFHjDPf2ZX0Zjas2d//aznlGO4PavOxmjw6xYPfLusTIZmUyhZRVG
         a6cgBChb2OE/3x+S3trIZeWRuGpC0YCoQj/o13KTgF4DfLWc2jqMxajbvBy3PD2vV1X8
         4N0A==
X-Forwarded-Encrypted: i=1; AKwUvBzcQwA4AIBEwb7hb+iSu88lCqpOmrvc/W5lsSqF5oo2BPk8LGqsJe0jIMgHvGSa5nVlD3aNcsXGXWAGTwI=@vger.kernel.org
X-Gm-Message-State: AFuF++m0TR5Qq2wgtU+3H0/vETjeORxOtz49Zs2rbTVUdRy/tOumF00p
	NjlxcZ7RAA+y/S4PRx3Ha0M8jsA7P5Br7w5TTpWTi6eomipBQCezFi0yuzdtW9oGwg6O9gmVe4g
	YvGqfTYh2tmlUomjpEWgMAJFs5FbbtE8s3GPQyad3jjfHymMSFGqI1BZjtNKKUA0kPms=
X-Gm-Gg: AYBFou1t5KN9l5OlqwbCLku2glIt03PNbW5BwCQRNHP8pkeTN3LXd6KBgT6Bo9Th+46
	6mbYyM2ygJ00y7irUrmCepZQJnraAZtxz/I8lCehCajXscY0aLA2DvXVj38e06ibKJCDL1PnaWJ
	mBNoS2otNAXfvMDOQO0Tcd/UaYfkzq7qQiV+NcjyY13SGzM1cLFZieXOafQhMdGcAN+p3PG+G5k
	bgP7pr8QmKCEJoAC2QArSxWSWBnModzwlQmR4gnfQbAOqMp/5KK98paoOyp0+4CdCUNNPLI6AiK
	cWjZSmbxcfZOQD290CBMNRF5FK35ZsCXMpsRm83DtQJPP2HRSEN06wZ0eNk+PrQu3EuX28ZINby
	uiihApBFFh8mDRi8=
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr315327185a.70.1791570080257;
        Fri, 09 Oct 2026 11:21:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr315308185a.70.1791570077935;
        Fri, 09 Oct 2026 11:21:17 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463a9dsm5307067f8f.6.2026.10.09.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:21:17 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:21:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Do not keep the video core clock
 always on
Message-ID: <urlsho4oj4uxzrkqgsaimw44v52zcr7h4oocpju4gwgkcqtapc@zk4smuejtnsa>
References: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX24P8agwUTsKp
 WXSkG5526scvfcmr7pLazN+9nPf2atUI149c6xTc2NP03VofH9C/bIyMFV9TBJPQ2eO6V8PQMb5
 AAA8ntECELBfPkZvSy3FqOoOAFF+VIlaMe32uFpRDMzou3lRNZkEtcFNp8RCrw4n7T3P75Bwg/2
 IgCYzVjNR0YmvdJWU5Wn/TOtgFPGn3nMZIgmMTBdB5wzbZn7woaYViymQyAh2SEoOKWJXDTrwFB
 qJmpZrF4kToCXlUkfZSrV8NoZr/OX+n66U8Ieel0cIwkUEu1sCMIpF0vS9CMjGEHhBqMXSKgV1j
 FMVnHFnAkYceH5nlmmbJoLNqxnQj69IpHLmI0NPtSnRLuvIutXhuJfNwABqbX3ZLZTqIdj0Y/KI
 aZgulMvGu4SKaM8a/rOXPxJvyY0sHkxzjKnYYbGyrJyYqlsAAfP5utdHFk69yL3DpER2lHnH0Iu
 E3SVLTPM4h8AEQyXonQ==
X-Authority-Analysis: v=2.4 cv=Zt94uN7G c=1 sm=1 tr=0 ts=6ac930a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jEBpRxE4x8LBKc-QtTsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX4y+ERW2/UxwG
 ZDHNMXDxs6AFQSufGMv63vzeII5Jnyd4iakjhSSe1j/1IQvmiPlNhc1i3hSzqbyijawa5ngkoP1
 J00oHnX8tN3Uu+ML05Jllrn4qaofwXA=
X-Proofpoint-GUID: 8R2XNZR_xLRzdjFgsNxod5pui1-qZhFn
X-Proofpoint-ORIG-GUID: 8R2XNZR_xLRzdjFgsNxod5pui1-qZhFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090073

On 26-10-08 18:49:18, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> video_core_clk_src is marked CLK_IS_CRITICAL, so it is kept prepared and
> enabled from boot, and with it its parent XO, which the RPM then can
> never shut down. Nothing records why: the clock only feeds the video
> codec, whose driver enables the core clock it needs, and the same clock
> is not critical on MSM8996 or MSM8998.
> 
> Drop the flag.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
