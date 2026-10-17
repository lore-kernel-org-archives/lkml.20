Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23033C3F7F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224740; cv=none; b=aZq0IFAyoVxtgTFIm3uLF2IAvfBhtX/JUKH3Lzc2FMF8BY8k+Na/e9/PvqdbIPDMKnks7IfmHCPqbR1XrKbBjc+bp6Rm3+PsNGj9z3feRor7n5EUq+ADeS3OI3FH/Dm01tz9sb+XYob1/vIDmjTa8NLaqWIJsXVHZvqt10vLdKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224740; c=relaxed/simple;
	bh=khBE5gCLlHDnx/hehXcl92gZyzTRmZ7UB26qS9fKfiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmtbcMMcpFCwVN3LAg0S3yTVAulOdlAwfRDcX+C2BPfOdSHLK611s8cJw/e8P16A4aMMaMvVu3wklNC95lnXn17SeqCbVZ1MZhrQdiKWYs6ckVKrRqvz7Vmue5d7u3GG6UVo3OFN5a1EHJRgrehgBTZLEu/dR2oQsOWFKZs3BEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zma5IAPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9xySSyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zma5IAPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9xySSyl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6nnLa3700454
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1bHXN9EBW1qn2KGDBVGxGLF
	4ixZx98AkY9JtEtX9RQ=; b=Zma5IAPA8Rx+ZZuYiDPwW8YTWIOjTYyoGvPY7LU+
	daREA0USMJraf5joe/13BpEP7bugKb/QCtj3TCpjMdmJJwo8coivvHommIxSFjW6
	k17af+tDAjvb0JtsKQrmwbV2iBtR8jRPI1FdyrjVyZKKt7uTHo3B38SDNxBRMNSb
	hGc2vj/g7kyazMGJT67EccmrgP401ER67wW4GCc/LEgXDU0IXOh/mu9l2q32wCdz
	/pwuuQgE4dgdj0e301Co6uI2DRb3xtBZ3eZgmUYbT87XuTsn6PaicgYyCJ4iBDI0
	WXW9Vbbh7+ly4w5EX23s21YM7hnZR8pnEOKaz16zTnh45g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9gbeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:12:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso1784460eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792224736; x=1792829536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1bHXN9EBW1qn2KGDBVGxGLF4ixZx98AkY9JtEtX9RQ=;
        b=L9xySSyl0kJXIPIBKF/uWuy8bwzwdeR8BhTNV3z55FN7jCf5tns1azmhJVMRbWIPc0
         4VvXBN9MqCdPzHbIzL5+4osEOs3i+5tZpYxxDyaanROn9vL6nAZ3Nvz4/pK4yufORsuQ
         JKHKJZEzuZSfGheDxM7dlG6U2KAIPVQ9M9Y9o+WwV/XfQBIxd+bhLKTWehi2y/WEPio/
         63LAqr4uOZvbAUUWCHIEKB9lkSe2HYWE8FaT8XEzbeHl/29BXhqZkGsVktls31APzeGD
         ZgSxvtOK7r0+8vonaKsWnR8ZC43kpsLuqJLHQm922gn6HnrgXC2CAT+iDn8TREUfDHIf
         uYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792224736; x=1792829536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1bHXN9EBW1qn2KGDBVGxGLF4ixZx98AkY9JtEtX9RQ=;
        b=T/botmkdfoY+/yQ2I2GgP3If1eMC9i9e0ZOHbP7yYzyTvdayG66de4eVlaEJxInATl
         s+Mr1z+yMfIHWpD6HJv0tQfWbeXB8UQ+eyWHsfum4HdBwjuKbJaTIhg2GQcxhC1JTq4C
         fjv+Eran9ms56BcRuuZ5tgFGAI4jOsgCaW84b/tfyrKnqw5F29zUfCP8XfI1DcazI+BV
         dMsJxThhydkbxLuaz3S1ojjjdTQz+Dbu34fgvEKDVr2MvZsWDsxiOJFhtStnlPyv2fOv
         yBnsUBbcWrg1tOcG+bE5VRK3VXvENLXhKXL1quTs7yFV14HlTP1k/0Hsvy/PB0d5G5MC
         lk4A==
X-Forwarded-Encrypted: i=1; AKwUvBzAdq1Me3o9mYiV5dcNi52EQSrGc1VxmTIiFeoUOGG5qp0iQ6ZgD9zkIZi0TlZEb9vhF86NU/97hi+S2rE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAkGJGRK0ccYCuqbIk0366PDgYhGzeMPzGG6xKzyOOgqKg3kPV
	6qmxN3NhdYC7u6bY/6dMRIoR1r2YlyIya0lnGaXolstM/Xn7LsuBYGvIe5Vhu/V99TuPzIHloPn
	csooYkmkKA1uQlL5L40G6VUW9JVddIiFO9fIkBrxTEvRgM3GwXMpsiL1XiNRDzBIXwqI=
X-Gm-Gg: AYBFou2DtlvL0N37grZQKmvwIRtkNUyBpc/ZpwbxfoNS+FTz6c6hoprIeEgANOceAqb
	DxtGtgrHVvR6Y3RDaIXFNZG6pPSEYybPm8Qe1ZoCUf45tYH4Y7bSr7c2D0x54Rqa5QAQZGdoNZz
	BcHi3Bztf1QnKy5/C9eUja5UBgxlDssBPsOxHqNJ162YxxIF1g5PbHJdvYRfulU84T2Z83Q+ski
	qYWldYpHb+FCTXJAsk/DptyUzBr64MKZbxjrtjSDbG7HddEATj2fM1EBhOevAb/VHctMm81Iu0/
	fG//G0NAQu27s3clOarHXCdETzpHwSe0RXw77V+bNcJtqEQrgPwJIZa0ex6R4TAHbMnjWEH9FKe
	QZmzjnj5vKIDI
X-Received: by 2002:a05:7301:b13:b0:360:dfac:6817 with SMTP id 5a478bee46e88-361a18632fdmr2926431eec.18.1792224735990;
        Sat, 17 Oct 2026 01:12:15 -0700 (PDT)
X-Received: by 2002:a05:7301:b13:b0:360:dfac:6817 with SMTP id 5a478bee46e88-361a18632fdmr2926398eec.18.1792224735267;
        Sat, 17 Oct 2026 01:12:15 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm13566623eec.21.2026.10.17.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:12:14 -0700 (PDT)
Date: Sat, 17 Oct 2026 13:42:06 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com,
        linux@armlinux.org.uk, Daniel Thompson <daniel@riscstar.com>,
        ansuelsmth@gmail.com, donggeunyoo.kernel@gmail.com,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator
 management
Message-ID: <atMt1nbVPsZJFDz8@oss.qualcomm.com>
References: <20261015143849.483339-1-elder@riscstar.com>
 <20261015143849.483339-3-elder@riscstar.com>
 <atDz2hJ6xpA3p5y7@lore-desk>
 <4fc165eb-b57d-41f8-b7b9-c9fe433d866c@riscstar.com>
 <1af4e7a8-adb9-41bd-8841-61180b284470@lunn.ch>
 <atEBPbpMtlmG+Mxe@oss.qualcomm.com>
 <e489ed64-9319-44f1-a74f-f75165c189c5@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e489ed64-9319-44f1-a74f-f75165c189c5@lunn.ch>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfX4Jj+57bUa5ie
 Eu9hYTifAKXemXmuFVDd0Bkch4Bs4eqAMELjxjtpK1szD0jhCRlLsMFO4d0qVOFbp3YQmnekbg/
 Q4Wx8b/KICSTBqT7I96C4xqY59nK768=
X-Proofpoint-GUID: 5Ea8M_gWxNdZzvDh67Qn1hXctaNnmGJu
X-Proofpoint-ORIG-GUID: 5Ea8M_gWxNdZzvDh67Qn1hXctaNnmGJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfXxv7BJLIeFgfe
 SgAYflnC4+8/HxOVE7HR018Coc6wfhPe75abRT8JbSAFByYPldgWvO458ZZ6R0EkBOgIfINLfMK
 4+v569Mt+cKidC8/jZ2AL3Fo+htcz/TXixin1w0DP+9Ej8QX33RExqQk0lE3ibl9cbmBkAOrFCD
 InVnozv1+LsSYgkttnuqiJSgT/Nkz1Kh2crkzYE5oblToy8S0deopmWu26QEToSvi7VHnTeKUWP
 tv4ed/J5ijQQhQOerlO/KkZnE96gddF/UHa73SkGcKLxQEjD2AB0QjWzOUFIJ94sAYHZMokt2tT
 piBtGakVIHEtbkAmbjvAHdQbeMgApUfFCpdMcv5pTTPgaURy6zt+KI6009n6HBHTjG/gwm2oI+d
 4Y9ooAO3rqvu2sfTQY774SE+5e5tfTyoWgUxvcfuNjd7sPiCevwHw3np5G+Ew///PkczS9IDCQ1
 03pidqwx7Y8CUpGv9XA==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad32de0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xcn7ZbKIuaFRTQb2Q6EA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170032

On Fri, Oct 16, 2026 at 05:17:20PM +0200, Andrew Lunn wrote:
> > I was going to share a text version of the power-up diagram given in
> > this PHY's datasheet. This might help.
> > 
> > Power-Up Sequence
> > 
> > 1. DVDD asserted
> >    |
> >    |<-------- 10 ms -------->|   (required for external power)
> >    |
> > 2. DVDD18 / AVDD18 asserted
> > 
> > 3. VDD1P25 asserted
> >    |
> >    |<-------- 0.2 ms ------->|   (required for LDO to settle)
> >    |
> > 4. VDD_LDO asserted
> > 
> > 5. AVDD asserted
> >    |
> >    |<--------- 2 ms -------->|   (required for XTL to oscillate)
> >    |
> > 6. Crystal 50 MHz starts oscillating
> > 
> > 7. PAD reset deasserted
> >    |
> >    |<------- 10 ms --------->|   (deglitch time)
> > 
> 
> Are these supposed to be staggered? Or can you turn them all on at
> once.

Its a confusing diagram but from what I gather: there's no delay
required between 1., 3., and 5. They are shown as partially overlapping.
This might be a better representation of the diagram:


DVDD          ..../-------------------------------------------------
                  |<--------- 10 ms ----------->|
                  |    (external power)         |
DVDD18/AVDD18 ................................../-------------------

VDD1P25       ............../---------------------------------------
                            |<0.2 ms>|
                            | LDO settling
VDD_LDO       ......................../-----------------------------

AVDD          ......................../-----------------------------
                                                |< 2 ms >|
                                                | crystal startup
Crystal 50 MHz ........................................../\/\/\/\/\/

PAD reset     ..................................................../---
                                                          |<10 ms>|
                                                          deglitch

> 
> 23ms does seem like the worst case.
> 

Yes, I thought that 23ms would be a safe value after looking at the diagram.

	Ayaan
