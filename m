Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D53A2544
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045544; cv=none; b=C+pYTuhZYruob0iLfFkWUL1Jp2mLZoUQK3+tY+z4FjSn+xzDs/71jigv+E7/h4rjlzAsT134+/PKOd55EgG+8vWQ0lzInZnLoPQvRXnBPCSFx1lUCZUENmyNxiBxjoDOz/x+JX3U+J9B4RFHphS+TrrSsMUyAj5XmiZtI/3A4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045544; c=relaxed/simple;
	bh=LnWFaGodOr1tggkpDDY/aW4ATkwMMhWBEF1iONPT7nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H379r1fG9vYTBK3jYbLUt112T1Hc27x8JsPqQ/hCWYh8s9fwH/6gxLnCdUAJmdujsbYXXmDN3ugrW3crQln4aeK1h8O0WibKGVGZU8vu1qwgSbu1IYKj3QDa6RoTbKF1oKeoHeL11Cgb74S2WiDFZ/l2d3FMhahMxUOAApz10+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJmwfnFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kldmfutI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJmwfnFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kldmfutI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0F1Rh3186361
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uT0/gMOpUpZ+5E9JDyQGOSjA
	QJzn3ux4WM6EmXZgqs4=; b=cJmwfnFaLIXFTK5z9I9pI7saGsqO7S9Z2yW9ptQ7
	ET4Zxy2GMlPLY16qiKUpvNxq8Lonhk7BhuANvQ6qUVprXv4fpmHKFwXbDhQcxPv5
	46gyi+/s8h3GNfCJe+1tAU50iDr1O3xRjV24bkwp1yJ+pR3GvJOPThIoPRDfsxBh
	ynFZzVHqL37c9F0fVDuDd236/OqG33Zt3hhC3yE1raHY23Fcq/64uNql/QiCa7ux
	s7Ge7511cjlco4rK4ZaT9NLw22ZZdi6eYFDLD/cG4ZL1iyPmCAe/eP2KJWtpyBUo
	5c4BK3CksrMGMVINCwBjhakA2AJacUGZFlUKsTrvtIXn1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybgfa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:52:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so565066a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790045541; x=1790650341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uT0/gMOpUpZ+5E9JDyQGOSjAQJzn3ux4WM6EmXZgqs4=;
        b=kldmfutImJFK1Ym2MeWWzhvnoinI/mcGBMooG3u4vqAWShdrEfkUP16sxn6OPJqbfZ
         bJtS6fp7BnjonIizdP6Z2KyDuX42VXgj+6eNZFi/gXLPlB64KAmFjj2q+rAqLvd46r5M
         GCUBSzGuubMxqUd6bG07H98sbL+iqpjvcuOqZFtwL0C2kyhIvf0P8A11nLi0BCcQr/fn
         ve4OT3h0hkNv2mcQASF4Fu6jvzkSRixBu1pPk4EE7LprxiAhrkakz6iH0GrTdbysVVti
         3CxHCsOtNxW+I3Q2iID/Pzgz08RioDvG8l6qkxMa64EjwMrkIdTiBXLqKrUkfOPiwiAZ
         XXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045541; x=1790650341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT0/gMOpUpZ+5E9JDyQGOSjAQJzn3ux4WM6EmXZgqs4=;
        b=VnKUm+g6QIUY/fnbFpTehyKE/V2t2dIr7lcU0kx7gQar8nG0I6f+pLuqtRo7CaCkgD
         Bz6wSsBOuBbHz5hhpos2p3Ehwf8WUc8JwR1/cObfaglxeGFL9otoZzpGZPk3F+7Cn4yC
         vqgJA+q2RM/Mm1TkoE1AO6N6k/8R8LE8sbC9QuP2nLn+aDnsbjbgYzLpbnjj2H6Z0QMl
         /K+0JFgFDY3kQKMs++prPFcnu7kJK5sz7XwYjVmPfpO+TyTFS4z77dFSDEQlMi5Vk3b9
         36zinL8Xk+g36EONVUH4GQq8e1b1bmzXCn6UNZnpWSj+ED1UQEqGCI4oyAH8wLeRKE5f
         Ar2g==
X-Forwarded-Encrypted: i=1; AKwUvBxt1uRsbvW8eP/qk42zOvuyXRSfOfGWutBJFJEEmiiHRt6GBsqtOW765zaUufkqjbCDChD4/mahRpC9J8w=@vger.kernel.org
X-Gm-Message-State: AFuF++ku36fjrlYZVWJGqLyyo9mdlPN7Z2xSsM0F60fG6V8BW6pMnY1T
	siZSUnRwjegzqq/FJQ905zXqx2oST3ng5LIY7DS42Au7bMqD9ENCYpHvgOUGCVVPB+/lsblkdQa
	b0wcGI8P/c502ydK7/NDIH1yhJW1kD1Oyxat+ip2Z0Z0j2MR8ZStNED+GBUYQq8avrNw=
X-Gm-Gg: AYBFou0V8N7th6m123qCNh/EMkB9QYVbdXv5g5kls6CO7x/avOLfCLkZTPENewbYPug
	kH1GD0H6z5d1SYVjZKnyqQpmJi5wNahd7/HFfErMXqMKKARONRXWpv55C3HHt5KwlSusw1Y2lo/
	ep+GgB2iHn+qI+VIpfxm8dMWF/6uQ5S5ZSfq28Whx5VqUwuDsvZxorpVMlrxxcvZryZKn6hVY5S
	upXV/hCZ0o9w7D0eCWUWM21Rxn9ghSJAj4Hj+G6BvfPYhw4WjWL6cDwaCpEJ6aw4RTwSIZLbuOI
	Roqm8mx3+3sgC+fykVSkCYYVp2Hl/nAduUEIeqAaWRPvLutEaLSF+BKXb41dQnmmY/W3IDu6F1p
	MFGwEOwKADuHV53A6VWxELyOpVeRkNaBXLqSvtgxNLQ==
X-Received: by 2002:a17:90b:4fc3:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3a066638ec7mr1123827a91.0.1790045541244;
        Mon, 21 Sep 2026 19:52:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc3:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3a066638ec7mr1123817a91.0.1790045540753;
        Mon, 21 Sep 2026 19:52:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294d894sm1376807c88.2.2026.09.21.19.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:52:20 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:52:14 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Message-ID: <arHtXsaQtWWpya3P@QCOM-aGQu4IUr3Y>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-2-4f297c983b94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-gpi-dts-v2-2-4f297c983b94@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab1ed66 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IF4djqKm59Tmvoe2PpgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 727VUKN_xmsisCvUPOobRfv7cx2Y1Z8-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfXymwFRUleVgvG
 M/2nzxN49sG2cHeeA7qn1hPHIZd+eg4rv9s3iLfXXbXEwIoqzvF+dCNpQ464aWIzlLrzktbm9OE
 37EJ3qrxVIWIpL646arnUiEQgjgUipuDe0h5KNHULuQuRNpny3ZMVVZpkTGqK6Ncrj1NE3n5D8h
 Dpc7o+R0JOvtG31qt2SFEGX6uVavOJQzf++UNGTn18s5MfH8X3ZruNEJForTKKNWiQkPiim8B8Q
 Mx47jPtnhx0IMyJFBZQoUXvZbCh1XIce4zxkRVu6XuTmgTux8CmJiyUwQcDTKKDPWZQZAvdThoZ
 JhU+XRrsnvMApJ8MrsVrkHzL6lDOMgCkJ7JZeIB85oW2nguMN3jdZbM0EZUTnv82WPP5FOoZbK2
 JqHU7PEur34vztpDBPR5WeNdStG5tQm11eGMhuJsiUM4hoQF+CaT1Sc8mi4xCA8zCOessSYpA1m
 22V/woUnQ4JN/DnEaJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfXwWp1V6+t8uu3
 EPdB4NdOy1V5oMYaG8T587k7a7Wunv1ceAeTaSl8WDkYOlRAS70dJKKsp0eh6/RbGwgjGV4KsN4
 83s2ocKIdHay3LOARtkvY6WOz6S6Gac=
X-Proofpoint-GUID: 727VUKN_xmsisCvUPOobRfv7cx2Y1Z8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

On Mon, Sep 21, 2026 at 04:46:59PM +0200, Bartosz Golaszewski wrote:
> Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
