Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699896;
	b=yI1yGr9aSy9Y/Sa4aglN97HUamTAsPkfwf7q8ROUvKqvYgMyTxHKshMMPaR+QAyXKM7r
	 VQ2T+Zi1RA/EqXPdt+mauhjRdx3C/1IKzRNLbFl96hjaKxDiBbCV7hw9tOJGnE7LQCPFU
	 m4knDHESyb1Uze3I1Pse0r1xAsFvCctluWb+XSHDEuirN9vfnFN2PxVThZSUj9OrdFFwi
	 1Y2R/xcJ/RMClfSRPbqvQjWRqt98Z20kO1IzBjSN4IRdOvL4xjMrR8dB7GDl9f+5ptSPr
	 +Lemblyc+2H/5Dwbw1Z7l8byaDpGnyvh101z9U7UUgnkixuZua9eAw899NLVmm1PReA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m10pz6bgz4a7grQB313xpGgHolpNKLCmq7Y75Ebr6sY=;
	b=QkT9gX8e2O95bE9DG/vfNhETb63/R/Eu94Kpz5Pg7UlvgvJRmS8s43PnQ2tp/fv2iASl
	 aC8qXf9z5TD8a9zaTsVx0X4BsEUUT/pui50RTC4Cq7QpP9SxDaYo3rmpO9nnHt2fyt/cu
	 0mM6ldBiJ9c/DNyoFWXnpmAhoVLOV9rEE0ZkRWYO6iAreaWsCnGgVTqr7Pe/LptMDUKmM
	 xl961sJOeA7wWJt518mwwHuLGgjeoO6VW+PsY7psmhSig+Y2UYwqC9IrzSm35xS0CA2Xo
	 meEagK7zbHyGuCcbLgyrBzc982+EmECKxYGeuZm6Fyj8ZNKc4p9tdK7GmNxGxXqIROg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBgGzfkm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h++ii0m6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960FB606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 960FB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBgGzfkm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h++ii0m6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38Q7RO2106878
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m10pz6bgz4a7grQB313xpGgH
	olpNKLCmq7Y75Ebr6sY=; b=XBgGzfkmI2zU/pks3scJQ/zKjRN2l7JRX+Nm7tU9
	xuotO9A0Jwbbux2WcYS9WB8fj0UNjNbyZtm1nrVkkdO0Zi0kiD5P/ynRbvIjFx6E
	DFJ4itFypb699z45BP2wMZfPuDrav9jwwp3iMxR62499Gb/U33bNyQQHoLII/G2d
	/61D433/RAsm+5NFvrWaZ0gPJYmogeVGxOriCsPj3wZjUdK1x2NP1ADD8ILDeLcZ
	5ORJejjuPzAXy0KaXBed7V8qWrx4xscDt+3ipCf5RdoU09TJmY2eAHIfNcHrssMP
	Pyv3jxfxmzpsuIBJeP3ReDd7xV3uo87ETT1bFQI7otNvFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99nhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:58:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso87251485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699894; x=1794304694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m10pz6bgz4a7grQB313xpGgHolpNKLCmq7Y75Ebr6sY=;
        b=h++ii0m615QC+Jncj4PxaGjJfWrg3gsfC/AhsOiHgG8haH/dJ9yYgY1r7fbV5ya3pc
         W8OZwU1MDoe/C20fd27x1d2Dgf6SDgHGXHPvJRYNO4tvzoPruEG4KEStz/FqdQR+5DxI
         HU4tr4gma2E9gEfEqstdYBX6PIciQ4JsrQF7Qh6eTpltEwclwkbI4LWpd2mBSK2cAqby
         AQW8P8PJRIr9Y39tpUp2hHMhnWLOEW5b5mB99gAH/C1bu3YV9TPphb0PyrUJRK6oI/UA
         bPMeRtj18nD6SG0AGsCB96h11qDULdLyjYbjoW2UEiEKpW8WqkARTzXC6mZ/NKxXHi9y
         gcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699894; x=1794304694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m10pz6bgz4a7grQB313xpGgHolpNKLCmq7Y75Ebr6sY=;
        b=Y/laG6qYXb0jQeKoxw+NmLkMDzEdIiYb36+zA+CB1KqZrxrVAy2mmDm3UHNwDY7pzO
         hZUALOkZehdp+TDfr8HkRzloR3ZSzJqrFiaorDdFIT05aFERprUkXMbYoaEfJqGFtoGa
         hXzBj1Uu/qs6a7Q5OW7FPXCKEs6/d7+EeR7IGltPzxN5Es5A+HJxcF+zIdoh1+GIzb2/
         3yUF3ygLZI/ljIfFzkqaDWxa7cYmsx6HMPO8wma60CbtT8/XQc2bVZ50LUbZWZ9cxOhW
         a6zHRwy4/GPn7m7skFvTcnCYAdNUp4OPiQ3JYttrZYhtnPmnCLAUmk0EqdYfnrHD460o
         rSoA==
X-Forwarded-Encrypted: i=1; AKwUvByNP+EfDIhvWf9mqlWzG7mC3KGBZo7vQJQHAirReoz88ZmeK2UwZa3kStIypAllQVlhNIELZcUL4a6Yzic=@vger.kernel.org
X-Gm-Message-State: APuU4Z9so6C8kAXzBFMMyAHR7sKnEKgtl2Cb+NIFds7BpZ+wHgMIAO7c
	M9y0HHNJf9XdwpAfBMhWZhOXd/P9rkuAJoZxEJG2VZ7wfIpfNW2CFHF3/09mhcII8qoT6CwUL5D
	0euXD5U6ejmGtrTt1JFmKe88UmILA69DPzcbTJdH/pJHhv/ZNqll6BFqyvFa8VI7zLEZvR/OVMq
	yhAQ==
X-Gm-Gg: AYBFou3KKvynNBDes5O1Hlu2azlL7Tm/SgHv/ZAJf+sMUFFk1NzgxLbm+nfE70yI1yf
	5msH8NoNADpxkre4TIa/C7EHOdP2LhCEVzPPJYx1StfzmEhWrXQVH6r3W7wZePmnoL23WmT3RJ+
	9J+5gYrjdwxN/5w7T8kJqsUob7sSWF6UI/mz7oD3Q7a13eq70jtFaDkJSwJjsHoewOG2XN/k5JA
	Kr0CAPBNyjRJGzk7FA4i+lZp6bXfkRCMVQBNmSCKSOMgVCzZXwk66U61kO/+Nl66YgKH+eswD+E
	+tZMREMNmbEr6cOcRK//w/PhthhS3xEfzVfKnggHWKW8BM1yrboHTff6dRlvvEQIH9KGf3ZDOY+
	/87GpDgYLBOMNF04Cto09DIWlECUY4leOoNWzXFMQTkCF+XVqHrgbahi85xgueTE=
X-Received: by 2002:a05:620a:6013:b0:93e:5de7:fd45 with SMTP id af79cd13be357-94413382637mr2082786085a.18.1793699893598;
        Tue, 03 Nov 2026 01:58:13 -0800 (PST)
X-Received: by 2002:a05:620a:6013:b0:93e:5de7:fd45 with SMTP id af79cd13be357-94413382637mr2082784685a.18.1793699893006;
        Tue, 03 Nov 2026 01:58:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm217341365e9.0.2026.11.03.01.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:58:12 -0800 (PST)
Date: Tue, 3 Nov 2026 11:58:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] phy: qcom: qmp-combo: Update Glymur USB3 settings
Message-ID: <76rbzfynxxjfejmlmv5pqn7t5ltrkwfa43hf46kq6lyfeiw7p2@o3oqz2zmtm7w>
References: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
 <20261102-topic-usb3_sequence-v1-1-5b144f5e6865@oss.qualcomm.com>
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
In-Reply-To: <20261102-topic-usb3_sequence-v1-1-5b144f5e6865@oss.qualcomm.com>
X-Proofpoint-GUID: x9Zz2Rhpa81Jkdst8p892Y4UqOhxIavV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX/2XNlBicKFiR
 y6gLOm7xZ2IiVgOuFXZrUHQ2QUQaYXBaeDaOBJW6TXKKLAFELMQbgn67cwrLNI3r6H56Lrc4OxD
 Heh8IQQY/O6/WPcH/KeTMt0VfiirUfY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX6gx07EwoU1/M
 Y8ZDKcpbEHtGBGi4IZkiXjhCp8BP10I54OwjnM1npYXfuktHShcEGtJR8mXQffn3o6kD6DMH+mF
 8jaH/YC+1I6nlDvt41llaAhXGRBGfqAZIzYu/byioS/i+Gx8YU+vGhYHY7hQpj3jUu+7jjXYGa3
 3JCXL72nnrcM2KVtBSgucc8Oskjnv02v1BAb5XBOEGtNFMD110hI7pQEm0TczpMBeoqZH5A95v6
 +rJ7W3BciuXVrDvTN3tf8N3VbBxdKLGZROhX/z3jOTvxWD9PCX9MBBdiwbaC18yfCex8jGb7Fk2
 CC3H36EO9o4xVpVy3u2J89YVELE/sRvVQ7g35KfmYao5MmDFJuwbryOvYI0bt8mImEMOhlF0v55
 6RAwfhliD2TNNjvK+1ED44AXi4J1aOiWpcBmjCrXx5mrZ27rTvlprNEw7jcTcL6vc4jiYp2pFs6
 Al0rbOaetzHdgahQbUw==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9b036 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fJp4sGKrnHNzjJpNMsEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: x9Zz2Rhpa81Jkdst8p892Y4UqOhxIavV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 14:58:36, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Update the settings to match the latest hardware reference guide.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
