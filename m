Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201540;
	b=MI888pnNWhpOQ0pLliNDnBu6ndDcXoafuP3cRg/+z2vAvRNsdCT3CKnFO1A3HmkV4Ysc
	 PEJ+4dfv3mUtYsyVb3YZfWUhnNcw8SZNEkXQYEeJPdfo5/4mXKC9Ij+3nb0u+ozIDSP3l
	 BhSYkRL0wIKHYLrZVTCKUJtlK4systUbCaf+7MK9mkHjEL3lN0MBuoNV6iFW8kZz71bzv
	 hDgEaOM8gDbh/WpTaMXrEJ3N3RbZF4S2rsLj1kfDLgavqT9wS9aq4ar59FAcpIBnfI+FW
	 VFohsuuZrfVOHqy2pcpU7jl2B1JEBs6Z2Gwju7+iW+f/UDxArPCDptXFed+20vUoGrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
	b=aFAFwWhXPh3fTc0TkegEk3phdIt3QxeESijJ8a+Uy3XCPo0v36bGcukc99hFm/rE5jqr
	 3XflyNcGD9BdUCyEfUXv/OFCEvzJYLxvi9Gv3VhAIAnBOqT95KBURXWJg+lQgAGaiwFEi
	 9ZwW7qVLKRzzpUy/uqjVy7SealtqjDnUjPa2zCkEa46w8L6M58l8V0EBn+zUK2ybKcV0S
	 S6wIIMrKUn9XEXzcE0eG9Kx1v+jZvxHh4+vAjk5/iETnZfroKk1nrVd0sW2BtvOckjUwr
	 WrBo9wmaLjud9pzzGpv//zGtwGboO2RPHtcP2nLulvjje2B/RYQkilGNcMm2wcULn5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxxoOkAg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DISU0S2i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87F4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B87F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxxoOkAg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DISU0S2i
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA3bH4165792
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dw6X5L/ty0+ycNiG4u9zRpL
	/2FUMzoeQTvBpaFK47Y=; b=gxxoOkAgvYgEftnhw2pgzvkiYD4Uhg8U61y/qrLr
	1AbXFIelKKeuJojqLKw4GNM9ICYpSA0qVmD0e4B0TCsuPbChkGZViTj9rKMymemO
	68ShMAPHSz1A7RmQRJEY4FCqoRkKJ8VDXe92XchE6SICW3Y+zWsaICr3TyU+UfKA
	v7BeJcZUdSs/U7jdV7UYeCxNnsBXQnmUJk8/LoKhdgWaMhxoh5naxUVTkwcdhcdS
	vqqbCZgrjNBjdFxzdV6js4DW06AzENY0zovkLQIadT6YBxpyiMwfU8YY+5aJ+mi5
	fFwJLzyzD6ANoSe0IhQzl4XoxL1uwFlpk0VjYe+bCMdPwQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngkvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:32:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9907539aff7so1011142241.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201533; x=1793806333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
        b=DISU0S2iUL5DucVtYKgbi/ak+21KT7Oi49eBKx5WpStF5j/n0h9Msiw3WdAC0rconx
         GRIYPpPun+EuP/rSJ43VWs3yeeAIGJvxsPeZ7tdyEZfhq616JemZMAlTvK10Dn3CXYD0
         sMbkV8Ek2IKXR2+qyqnpSLNiYDUkNUp4ZqF7bwefm/5YSAjn7U+jnI+1TbyfUxTRLFJ0
         Y8zl4uZNmIoxNx2/2/kE3HqJr6PzKJ1hsMhwkOeV6sxvEN8Pz/jDsxFS384g5yiu7FsW
         DTRN7sT6TvXuCh35oFXzcSBtxDT3OytweyhjZ1g6aQCBOFHCedGtmY9ljLkhBsWdH1zd
         Pxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201533; x=1793806333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
        b=jjKdZnEEN37BXO+FcFuuiIGBepo4W64mw6BKYdkz2NsL/nF9vFaha9pnMAT2Pj4kWT
         hnB1YIOTgzolasykgT7WYtj1YACkPpYhcVEGNrRGyNKrPn/zd4/e1+f5wAXKJ2YQzzdw
         +4rqJvqgXtGZFSYG33MjrSuewEvWjJUpSVXv0b7A2O6Yd7xw1rn75ND5kbPtgdiTDOiP
         LC01TQCUuchao10MPnQCTGjFROMVtctcRAn4rYf7ntodF5lHIouI/AWK2DXjXSvlaFvS
         uVZtO4FKOPcqVWnc9AqvPCYzEl0KMUv39UVaiukRl7SzJU1c9NGLAgUzXGA03i+Yu9tr
         WWmw==
X-Forwarded-Encrypted: i=1; AKwUvBwWLaL20AYbS0Er5Sn04kA/+tpRtD1RhCM5GNUziEFgQpDQ8eSln1L5LuJmvJVBrkXe+gm14Lt3bgP1NPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX5oRuYnWIbmkmGbau8HVsK5GwKQZGHn1hP5aMXFk22cXUKmff
	Zcn1Ez/lHaFl0FFj37Z8b7jWRc47+e7E8aQ4Tjwc4kclIU/ITwB+3XxSYKIAESrZ51IK9kmkpnw
	BYMI5tYXkERaqxyBVBnAaukeVRuJdvZLgJ+VXx84TtNmxG2ooWvgUbpAfeMqcIJGNGTg=
X-Gm-Gg: AYBFou1wyxEquRGqRxFFqscNCiejrUuRJi4LotzQ8tgJRQ7i1sqxGaA9aeoFhelvpwj
	gwg+3oXKD0t/uBakXNf36qr+frjt+ghox11oPud87FjE6YgOWVGip3h9Mq6ubLdQZrMMV+6J4I8
	HlsakJ8LMy/+5QrsxIbaI8xA526gmYUW01SoHmNjtf/m2cZ2U8+v5XXs6KePtUcZI8fZQLPuU7g
	xjRBBIB2L7BabqLWfdBTUA7E9xH5GEnFXssAjuHlSpS19uoWNJbksWcx83nBDLV3m6bPYaP9liq
	J9LxfJPRULupfoJgDeom8lVm/CR+QzQl2nZky3yNuwQmS+tg7qsaWgGnou5VOCbc8NlJoDg/Vw7
	/FiqCnCPuRgz35qhLaI78DC854YFbQa2vy8qQBWed8NvbjnU/g2gmQZefZtAPsSfPzQ==
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d03a47e768mr1432389137.18.1793201533224;
        Wed, 28 Oct 2026 08:32:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d03a47e768mr1432303137.18.1793201532446;
        Wed, 28 Oct 2026 08:32:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm195145e9.7.2026.10.28.08.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:32:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
Message-ID: <bl3vrhszm2aicw4bfr3v6mewh7dghwpiverpylif6njbqwnjd3@hxqtrtt7cjyh>
References: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
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
In-Reply-To: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
X-Proofpoint-GUID: 8tSDdTRXnO4LvxAJasVWNS1BpBJHxdPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+IenBKxqxxiT
 cZFAaGp8mHZKkQoq1q7Fkh0IPFV/I9lzd/HTzXSnLvXcWHFK+TumS4cjWNqr13faCnwDPTKEkWE
 vFh+xFpV/rJvSuoxXmRyJKl9Ibm+jSSH3JFSPlLjhqAl9w0D44zvhU/xDE1LmgKnf8imaktaJAF
 BPygSOCQWZrzKugv2/gh5Ac7v6ojokvd9D1uU9AZcHsHdFe+Vv5f07nxZDP+oZ1cEy+Tj6mEyqq
 BCX3MyOGH21gy4gg14l2NpindmMeqtdy1iKzFT1/deauQmTjBU7j+YgvXk62vGCGTQ34cn21KEX
 sOsrSb/gPBAiODryAdMKX+DrXYbto9ye1FN03xPoRdHOwwtsynIJfkx8tEGYY3ARjJMiJZavauS
 mYgH3xR5M2CTmthYxMc6k+tEJzTHJ/GZZ/MFQIa+GSNkspQtayagH6F9bt6sEKxfxzN26O8eMt1
 8AINx7VGv2mEVgDrYeg==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2157e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=t_aS6gOLZcFuiPoz8KgA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 8tSDdTRXnO4LvxAJasVWNS1BpBJHxdPJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX59DRJtGj/PWv
 CYQPYkzUoMcoR4wUe3hDClvQC3UdqjtWWnnKxQjpLkpGJ7TOPEKP/vIbCgxMBixJOCFQ6KBoKbd
 z1L+yNh5hGELcHGd2aNWzVAb3OOMtMQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 15:05:32, Taniya Das wrote:
> The PCIe GDSCs can be shared with other masters and should use the APCS
> collapse-vote register when updating the power state.
> 
> This is also needed to disable power domains that boot firmware enabled
> through the vote register.
> 
> Describe the collapse-vote register and mask for every PCIe and PCIe PHY
> GDSC.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
