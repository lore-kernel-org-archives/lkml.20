Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE702C237E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227163; cv=none; b=P3PyQhrQScQGuXyVOgNtk2pYWPEATEEeBj5SXG73Z5MN1pshSqAFyJKlz5BRkhgxXFd/vWH2krX4Mm8pmm1oueBW2IQvGEXeAWxprvdNrm/m55vhGpaS1KEnPnkxqAQdjQf7XW4IjfFHlSlV6843jkRVPKmNQyIgK5hQfXhIYFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227163; c=relaxed/simple;
	bh=Gj2WKPwaXMtJYToshXOewcWcdTEU6qlzHTUOElJEb54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpbFNyRYDCZmWLNSgPaf1WAKFNNN86JDp+PGUIy9BP9sQvFJzmz5hS2xwY5ZJGmkVIEH0EY5Ds5KWQyZ9rDIWfOKCUamFWSh34Xjjli3KFXaq6oQP9mZQWciYaQwnm8bclPLMIaL8w4tqHzmX7zQnkMH6+C5DgyQCQ30yj/M/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzLni7VN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCnt+/H2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzLni7VN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCnt+/H2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdrag198930
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RW+uvZMapCNlLj6TCdNZsvYo
	rpF2ANJfi66sX+X8hEQ=; b=dzLni7VN6Q5Y8HQxG1eEpMItzIZWiOXir+NanzuG
	Qt01xqVYtx/hbumS4ZigLS7Zq4RP19TirCYI13qZfLFy3/8On6kV6Dr6xKAcgx4T
	7FCopa5hKjtAy8BSmOL2VXvZTHyRJ1a0xpVj7hDBoOydhbdxN1q9Vi0TSs6QrvQi
	4MQemvDJqmuijA7N6Sr4H9Qi4NTOuTwvP8j5KycsIeT9xTThxQkjfYTMF2T8nNQD
	NnX35+UCwSRDIgofol/c7wSuUMnAw8BX8ekI3LwcvJZ1ustsYxyDez8GIZlSQ3vk
	Wj8eFLhFNWFys0tgKI/MdqMg3/++ydSm8U3qSpqZrm+4ZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ch8ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:32:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f1847fb9so185224285a.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227161; x=1789831961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RW+uvZMapCNlLj6TCdNZsvYorpF2ANJfi66sX+X8hEQ=;
        b=KCnt+/H2e3LBFu1DdY/PFK/t0L4e42nqX310qpPRSQbu6s/8YCmFV1ST1LF/50BjoB
         STx3Zn2ZWijp0N7Sqpjcz6huuRfwhYqMHGl4+4c8kwgFQZXwx2siHBDl+B+ewZq3lhI/
         09nv5UCR7z1/uI9EzhlKkiUcS4pPCvLmDHoXdzQFTd3lhL/dCKyVlj19v7B7JkEpzYtC
         2sSHtXn7IdfUzVa2pRSssZ1QGXxjnPnQpiJjkVnck9Cn4/Ewoj3fvf5g/AqMBhr7avU8
         vjrVn+qey+GIHjWUFpvZLDg5zPBT27qvbbx4WCKNbWC+5gsK71vFX+QF4l0W9pO8XTEM
         JMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227161; x=1789831961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW+uvZMapCNlLj6TCdNZsvYorpF2ANJfi66sX+X8hEQ=;
        b=R6mJuu5OCuQJowFyGkV+KVK4maGHYOMZwtHGQFNkUZ56kZNXCskz2PHRanZ1vmh/33
         G+ajRfPp9XOuz+6rIk++kejc20xv7H/rCw+I0OsZ3D+InwDKhQocHZ62XvyTFaJT2Y3u
         NnjO/ooP6rF1L/XUrzGm7Eeb/WvQpJTeuHtzWBFYGwsTFZr7L0ISA7MMOIVlYvVK+kPT
         gyiyWCz7PbbQeaqEE1p8FkFy27Lt7vQpnphuY45rRhLcFtmcWl6PJpnYxs+cwHNns4p9
         01xNKnwi8mSrbW4v44lp7i8j67lg5PWj5o6Sv8Ov64gQczGMdJKdJsuYvgMaYSHlJGgD
         1YKg==
X-Forwarded-Encrypted: i=1; AKwUvBxlC2s+ZlI2XHHgCqCqr0288IEwtZvGDRvnJTA2efDq+fJsHuJq5HqK2JEMGAHZQsHyQkx+nwJZHyFApx8=@vger.kernel.org
X-Gm-Message-State: AFuF++nnKfzoa/HjjrTP2HTW1cfUdHtFZQD67WM/4YEsmvGbbDaLvWUU
	biC3lhIKam05SmbZQnOMrSAvgNep7hvBch9hIUQOPXjTlEumoGvxQeXjgCmTXnbLc2/KEwVSpEH
	MGYoUJ6+QSwmwPcw7ct5ZOkq1Vsz1kRgsdJET4qHRPIMLnXPxRMsHK4CKTG+H/f3vYoU=
X-Gm-Gg: AYBFou12B5/0q2WkOtxecnn2t/l73zpx4jQkrrM6dVBkYKk6Kd/tEwF0V8GLDkWFHqB
	BJPO/5zXV4WrufNvwSgX2vuUXGfkE5QT8cMJzZEuBsouOFMewHsgWh/yojb4B/Z7NJaRNZACBiS
	O4s9wGMW3yMcT2I2z3dsK87tH+pdxKn+H+5EEfN5RmgPsj7hKrBx1+ei7IXdls4aV18CYGvTU/Z
	mjqU5Dt+p7ib0Hc+ySPPs1Tj3jQprAUIDxcrG/+YgJSQSvwhc1F4dPHFPgdCQc4+cycBgE50nfn
	VVNhWw3EJYIEIVFoWPTu3VoIyj/lK3JL1rZw6PiN3orQcThj5Y8q1t7TIBy4DcXGJjrBBVVsWIh
	UWscTcGzBNT4Jf+s=
X-Received: by 2002:a05:620a:4611:b0:939:feee:630 with SMTP id af79cd13be357-939feee08eamr739524985a.30.1789227160499;
        Sat, 12 Sep 2026 08:32:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:939:feee:630 with SMTP id af79cd13be357-939feee08eamr739519285a.30.1789227159987;
        Sat, 12 Sep 2026 08:32:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm13061375f8f.4.2026.09.12.08.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:32:39 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:32:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
Message-ID: <uqusqjipcssrpmphugludj2yujz5jipcnjukubrgl6wdjqbrh3@yly6lsgymdf5>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfXxvfGwHKprM/r
 HegyLnqaN8CQSVbCyC/yfL35ElWmVqzOIm2nT9tz3sgTMHTpsk695BIayi8d0iuqITverUUslKG
 pdRDG6127Uy7VrqoddJjwNnNfdaRkgmghKEb/WZdmkOp4a/kIgND2ZrY36uTYLIYQ2IeORT0ueb
 Nofij1JHHft6CkokgCCE1SiVCGe+z4SUEH3Gs6ToJzwBw6Rvr8pZuwJ1qv1QaB8CeSIBwpv0kBU
 a7W33DF7WlG3LMCGNmtZAmlppCX1hB/2rmaojbKhgnkoQ6J4X8jGRMVqfV1r3PJJTN59GY5B+gP
 if2xHhnDVR0zceZGEqWq2jpb0OVT8eL9i+ocWky4mrncXqs4ATVzTYir8j6HEwOd38SK9A5H2lb
 DWx2Ebr9M9pigF/T52/dyExlr2j6St3AVM4XYgkEqSx7q0QyKHOIu6jVT35mnEczCnumBqa14Mg
 cEU+bem2qf2uF/Z+MrA==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa57099 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QHX0HLVNp1UGJ0cSOcMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX13CgwV8RI1Ul
 S9Pf5VDlJUi+g8LAtThdy/yFxnTVYRdAkqDJt/444Cs6s7fECCPm3vFpGuDSIu86SAqjzb8ZXPW
 sHXFlwyb71Ku+cJwzj7adsR5OLdpOFQ=
X-Proofpoint-GUID: oUglDJ14LZBMSP52qwIXQkZE9LNqzt_k
X-Proofpoint-ORIG-GUID: oUglDJ14LZBMSP52qwIXQkZE9LNqzt_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120224

On 26-09-11 22:20:37, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the base nodes for the three DWC3 USB controllers. These carry only
> the SoC-invariant properties and are disabled by default. The extension
> for the embedded Nord variant and relevant board files will add the
> platform resources and enable them.
> 
> USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
> capped to high-speed and told to use UTMI as its pipe clock.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
