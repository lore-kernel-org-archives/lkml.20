Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C25E3B3C0E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461620; cv=none; b=DDAPwgNKsBGVOP7EjQW+HpU/Os+MnNJT+vIdZxPnYS5SfFgmkp8KZovlppZNxH+hFHrI7PLdM97Os3V6a73Cwr2aOxXtUCq2nFpYQivZj7Cm9BNVR6WYj90XbqKjaNOXjyPXZbzE8kgbFQrhFrTNMAH43BUTw/eoDHRawrOUM5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461620; c=relaxed/simple;
	bh=ihOpY57dJ6ptn6bsjW7kDrDeDTlFHOf9bCBC3cquFmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivTpcS4LWNNJgaehFwPe//DSxFulQC6BccbVtbHUe7DxUaW21PHL1CmP40x0Ryi5utYTSjdoTfKi/NWPWInXDzaFzzQDrZj8TXE42XaIf24YSLq9KezX4F4TOaBc0DCZKmkRF7OMwRdzYKna5ncpXLHW2H1rlP6/FKxbROBXiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exZihVhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O72fv/RQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exZihVhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O72fv/RQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3H8m927995
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y9vi/nZKDsDfSyAIlc9ccf28
	vm4I4bgIpUZPKJ7f4GE=; b=exZihVhHXKE4LPHfdLGiWPX/SAxms5HufyvbTfNP
	mDV/yVYt1FZ7X4be+GDYRSJV2rbfUzWhdAPIezaCFcNXPp0tyPlnXpxIukxZC5nW
	mIXzy6x9HRcL4M46bu5p+cxL3E929ANQVE8FmdDyiJFYZnuGwpjFBptZ/8L6saBV
	Vmxg2dzvF3TnlQFT2vflzXcX/sOUuTEb8L48I/J2DAIyAtGU2FfGTHEO82wCXJLo
	XPve2CjBN6kys2jTmJknRE8TzVG6rgqEqTqyPsupCY6NcJoBo44qHHT+hw27BWLQ
	unz2o5cKbPpt40ute7gjlfoTFQmolj6JiM7qqMsA+Fvu6A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx2bns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:53:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so261816a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461611; x=1789066411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=;
        b=O72fv/RQEHnjqhVFQgE3TsAoZX18wNA1zPeJQ7Jqz+jfC5je0PYY/tZovVSAcn86fN
         1C3RvLdFo9muZuLVRbLrRPve3kX6mjtjlZO1XscITxI0/jUi1Tf1Ek0wE/0fiTS2y/lh
         nNUDEzHISArEBycDTkxZrpt9SQ2VyR3islza54OuXKL+c8O12T05Nfi8X29Av+Bcf84p
         blqGrePublLHZr6qk5DvvX5HdCHItdRj2NyMbsc/z81WmR//hbysigoZizzdcQ+guFO4
         fODgljK4H8bQ9kEhADNSA3bDRnEfGyNt4eynyH5rbYwRN8QkjHk7WFafFEyRdthCce20
         Bj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461611; x=1789066411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=;
        b=TXyazo2OfX33ydSMFcuLP6EqTkt01qF/6XFHVuGNEIHWfhHiLDsno53nPnk2RZ+ZWQ
         vF1h1W/lUWYk3DcGDbkwEA/ASEjArmY8SCeZsaF+9Sx0uV/xeCsKshUqQDzg1Fr2jfZQ
         DCHVM0zipNS1bqH9yybZMegGWUUpLXa/vLMEIHnCgK0WENUOKzB+LhQijgIvRH6hyr3D
         +2r0DVSsQux5yN1zW9tv3eUZzWQFbKnjk+W1OesznqINH6AJBUPp0fAUcA8kXr8UnQ04
         kI6AjW6fp+OXJ0kF4FhjNUuevcr+oKrH9wWnizb56vDxLhP2PhsPgW+wylZdsN0vpzUs
         nsQA==
X-Forwarded-Encrypted: i=1; AKwUvByOmSqPM3TlLg1frVjEjkEpxsDDK84QJ8jKgJix42+guPSAxk3u7j9N+xYRRX3EFFzZBXex7QhI3oQ60uQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lF2qVQ6TG5eyFk+P0y1/hylrwAdvnFax2Tqm3g+mat0Vp9NcRc
	+jkq0ddFzVIY/s3N2EB+xVIo1zzLgp749lBX+uriAkIdL2pfWW7mwluZPlXPPrNLdWjhP8+3l0f
	56SVMt5AlN7tDRj9ke+545yh01YTJZcxNP9u5tAgx1UoHTVOSRyxNXy0xHC/uJzoHkGw=
X-Gm-Gg: AYBFou2Nex7Jw+fvC3xoHn0+oKQw0o1SwoPQ/Eo74Rg6V1VXSeui5Y822ThNlReAqHJ
	d6kXMOZuTsRkBZsMJbIeqfRMm8Z/lHL9q2VNP7rbBw/BdRu0pk32TBlIyw9+1Zl9ywJvBDQZBiq
	3gog/Ia4wHDnry6BWcisWGJRrsPs7L1i/rM3ZKbVjztuYoLYhGsiHllhoerZYmOwsrC0Pngp+G9
	st279kKvL78XF/KFOVQvD4ivYWTChAKGDR8/hgvBOrOwYsvOdfvvLTvdW+K+zgI7tE6G2sC8Skt
	W749Vdncc3GMRPGXv24dt4/azKunY7D4qVfJHxzoKzT6rPui1oeqyxhDL5fiVLAhEbtqyDThlKs
	Dws9fAOXhisd6AA==
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr820683a91.7.1788461611210;
        Thu, 03 Sep 2026 11:53:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr820628a91.7.1788461610790;
        Thu, 03 Sep 2026 11:53:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm656611eec.6.2026.09.03.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:53:30 -0700 (PDT)
Date: Fri, 4 Sep 2026 00:23:21 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <apnCIWJ0b3i3P6YG@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
 <ajF6q5eKz92ddqVl@oss.qualcomm.com>
 <apU8Yx08/PJiS9Xw@oss.qualcomm.com>
 <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
X-Proofpoint-GUID: TYVnlJgrUwBb7oVskFw5TsqdkKfWFLQZ
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99c22c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=jdP34snFAAAA:8 a=bKGmqkx0FprkRVM0NBYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=jlphF6vWLdwq7oh3TaWq:22
X-Proofpoint-ORIG-GUID: TYVnlJgrUwBb7oVskFw5TsqdkKfWFLQZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX4Z8IB14GbVfo
 3gWMIjZU4TLb0l6fqZo8ZpypfbFsk1RcMPiqlmZHLXlsJEtcGZTy78flEuhaeQYIuJ36uiaFTsI
 1sj0Ho3QHd8s3j0NJAQAZQUpqeZZasVjeGPSMT+ShtTDyX8OgVY4/vNAJ8O6WF7a5pTCMjZCWUO
 YIQPI9mU1LaqakeajD0sLxHWVQyJi2n9Y3w2myvWC5Vulf2nM9MyGhjZorrOYRR02QLVDVpQtWd
 2j9ANgkNAwck2GddlScB9dUq4RL8MXqyTHrQpUJ+bkPCnGLaS8TaMBPW5or4PULQDwgVogI5CNF
 Z8YK8Y2FxkGXSLxF3xBGCbmh86BQpyHYhksQii5omkYDvrwRFOQ/yChsrLf2La7UW/CfiFu/qrP
 KcJILLZGXWcfeoQz//rKbxw7EdE5/DG/LqlmCOfcxzOqU4IhdgLrgM03PwXeB0CB6wYgoMNOfPc
 fMz7pUydm5JWHFW9n0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXw8EC/vsiLZwr
 awWSRsW5l47KrVffvREnELuIVKipPPMrcK7sYu3SrEecXuMjnhemzRbUjWz9/fhteCVudn4rXsH
 tON/L9hKx6XGoTI35olcwPhfJFUB2u0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

Hi Maxim,

On Mon, Aug 31, 2026 at 07:01:04PM +0200, Maxime Chevallier wrote:
> 
> I've been able to get my hands on a qualcomm devkit for ipq8064 :
> 
> Compex WPQ864 6A02, has the IPQ8064 connected to a QCA8337 switch
> through both the ports, one using RGMII (no ID), and one with SGMII.
> 
> The DT is downstream, in OpenWRT :
> 
> https://git.openwrt.org/openwrt/openwrt/tree/target/linux/ipq806x/dts/qcom-ipq8064-ap148.dts#n198
> 
> happy to help in some testing as well if needed, this board is going
> in my CI for stmmac stuff.
> 

That's great. I think this board uses the dwmac-ipq806x driver? It would
be interesting to know if it also does the whole "use RGMII so that the
MAC can manage the delay" thing. While I don't have access to IPQ boards
I will try to figure out what this driver is doing (hopefully I can
track down some documentation about the "NSS_COMMON_CLK_GATE*" registers
it programs.

Nice to hear about your expanding arsenal of stmmac boards :).

	Ayaan
