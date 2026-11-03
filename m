Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712844;
	b=2zrQIuEy4ffN2+yWimLZw+/OcXt3tr6NZlqXcmjEZfNxAWpajq6XP4SnziS4k7uTkp/C
	 YqFEofm73IPvWpTVKsI2Zaz0lt+3pkt80TYe/kd5vgq2BdTB39ivAPrwObcs3I/8BnnDT
	 P00OeDGvvmJ/SpTeOzzWv1HJkzv++Nckgk32WFyhmYHBB7dn9PsgOiUScPrNF7Vknb5/q
	 uvCd1ZXII3RNXF3T9I4xbFmJ9QQ8rjTia9rKjT19/lIz/IwgGq5B9cz8Q5djxREKy/blz
	 nI6CiqMNrry9YN7r0MzGQWR2Qe0h1t8OFAO5g/jXYacNr/2XHgnsURTANa2YkCmdFCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
	b=whf3GgnrFR/aSTo96OQ3AscW7FJ35gJiuRJbVfNPBqM3XloHLs/YN32LsKk75h5a52rQ
	 plbP0gy42hPCCM1sGUz37vt7saBan/TEL5UPBA7DGOk7TYSpggwgne9iZN+umt0D2A+IN
	 ibbE1EI6PW1mWEyG5wzM9vXKfyjPCJqzdMLGPU3xLOKeIn+dNT3pHt2u5XfAGr0en1VWc
	 /nmRyVY1jxsUUej5FoVlvKoExi7hn7P6cS+PEziNzfUBBdJUipqvNSlqu1tJdjJXPhKu1
	 l+UOsTmZ9goIh1cfk+bAkVhXRWwiDLYHqBciMrNnCPYwPimKJJoB7+mT5uOEJsk1aaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTaeY8pY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVn8JOoJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F167606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F167606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTaeY8pY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVn8JOoJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClEOG2897062
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DGNnS1KDT9U2hlA7Y5N5vTjH
	wcDSHZRJ9lAcF86hn2c=; b=aTaeY8pYqKW/lDJlu+aXk12OEIFdcLcZTjKBbe+S
	zbVJcD3buxpIo5ueC0SWQ/hEgPGdgyRdQQKClIEJHpexHzlqm0cafh+JPhtOlwX+
	XB/N6dxacegZLiM0/nRMuqz7fz4XGSgRRDb2wm4L+Ytoj+GQX9ueqjELqIQA/A5N
	nPKx+uByj69LfjgOQyMu3EslPLErMjMtbQXZJwYsy8e+dPPi3Lg/Z/Rel4u3sb9r
	QL0LFL08NZGdu+JRQwlq7y8Q0bsRpipU3hdePcpGDKUIRuLKeRChmnTuRLVUJUsi
	vrM0+CkyXpo0zvBg0ZChmnlU1wuLn1sdHYPS/sP2ut3BHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0873wxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:34:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so585903685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712842; x=1794317642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
        b=bVn8JOoJX/cV8ZZOqeZ1WalPtHRVAWJV7lL7ophMCten8uLliFI0J+DvWtJnrxk601
         GEbFQ+AQa61IJnR/H5r7l9cpyvjRqXFq9W/ul7o73U1pnKamNoG6xZEGwk1BFNTZJILv
         suSZ2RdyDCKspvgSQ2uHQNU7vn+dKRXPsMVrtvtqoUEQhQyPLfBWMvR+eb+LUFIByrNY
         1gyLa+qQ7BpWEDYil6OWy9QlREX1uZnrZ3l69KNN6So8+jpHWYj+Rhww+0w4YUgcfpCv
         ocYM+L7/T/YLZF92rd6hnCON0+w2uhGmyXyuTJXAJrk48SCCN6NbX4VjZn5gGHIHAS0T
         Q+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712842; x=1794317642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
        b=Uh/4+nJ5P6kXcLjASsF86FGMqRZJYs2JoAQ/OgrKymXMrBCHarpvW0lXbcOtBqqsoW
         hwYhMCR2kh239u2ePi45er0Iu7EUyvm/gYZUN7qVgCb9iQmfJy4yHA1dZ3jXgnW7qzbr
         hxLiNqaTihqWXtgNh7cYILSNBNO1z6hnWuHxHwNhhOwp3ulTk3iQemC4g8L7rAeUGlvu
         IxWTqiP6Zo/stZ+lKQ8hoDglYTLtIXNf+cxV15YfzN9irh8VNC3HJq/qDVQUnHynNU4C
         51OFv2vppkMxlal6USZUgHvZTwL4V0SwVCyqYaIFfA33QC6bMCykP7RoU46K1JVMXkk4
         O8vg==
X-Forwarded-Encrypted: i=1; AKwUvBzaY9G0WlCZ7cpAXy6DxzKTNSY8KCHoGq36+5ozx6Yy8gjYXWCoBovQ5EcoXy/AhP1Jex8kDqRkT+mmm0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hMIBeVtpwQZ6/8+U2PHmTuiCA0lYwAHBw7DBDCh0a7ESn5kK+
	oALK2EqKb8JfHUi+NqK3+Jyenv001jNp3rgSVVOqgM1jjmO9AGRbZg/osJPttqntKUJUkFVP/QJ
	W/a8ix/tQoGjpcTanDAVfcR3DYc0G4Ur0tNYwxewXk0/CD2rC52OpUv66o9vVdSssF2Q=
X-Gm-Gg: AYBFou2XYnLWKn6/i1H1lZ5DPyj1IJ+LVKF3PTS4zsozTfOVQQtzjVX8A0RewEDYY/J
	IT1vRGtIfg+ijZ/+uhmLhdGjZSET4Dfrp5idmIehTAlhdwh5AHrD8Hc2Wp/IbuWWNBqQc35Usco
	Q9B22inldX1/9PAUr2gFXiGbyjI4jPYc7qBHHcCxGo3CsOhZr7ssz38f+xBFF1zGdqS6Yj8XM4T
	ZkD/5AGECXEFDJrmXpMSd78o0FF4vgOSYUiSJdSxOnxCuEtMFYH0v6Wpg26CgwZyjPQUptkR68R
	yHPFgLj1E6gxMJRy6fs/LAx+JWaciZXNJAYenD4n3bdDKPLGpYlVjRgjWkyd/HXxfAsjCJCIdTA
	xclNjlggpIQl+AY4UIZDdbLyosTTPqdwtp9RfUyd9l1RHAUU1y5WMAB7tkhSI+Is=
X-Received: by 2002:a05:620a:400c:b0:944:16e7:15c1 with SMTP id af79cd13be357-94421659b79mr2181061485a.19.1793712842225;
        Tue, 03 Nov 2026 05:34:02 -0800 (PST)
X-Received: by 2002:a05:620a:400c:b0:944:16e7:15c1 with SMTP id af79cd13be357-94421659b79mr2181054085a.19.1793712841552;
        Tue, 03 Nov 2026 05:34:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm54953005e9.5.2026.11.03.05.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:00 -0800 (PST)
Date: Tue, 3 Nov 2026 15:33:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
Message-ID: <emrjperfywy2xcuxpu6ywan2qvk2jyxf7iy7hpgb6gm3vaqj3i@masqj5hu6ywf>
References: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
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
In-Reply-To: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX8tU/OeUneHmD
 95W7Qy3ZfibaWINjJCMrb3MmQn993yVbgr3S2HgwGLA4giDVn28fkuawXCNzXaNXtB9JJ+2Vc/C
 Grx1d2n7hbf33qyyu7ehwc3lw/5uhLI=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9e2cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tvCzrSW5HJhQ_1vAfrIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX8pS1koPHHHcS
 uVnk4gib3k6heyT1cmCWJreIAEEnwJBgP9opBqzaVhYSWBgWf3L67rQYsvZPDdXsCBq+Pbqa6JV
 t6rFw/kzvjYWYNadHUO1BRV/9SDXnFsOxzEJVmFMy0nEO9ws3V/uOSBLpJjpnrPe5mLZtXBFXKq
 LrH5sdQiHWf9snxFuoTbVZzczQCLwMHlP0c1WO4RQ9NFpcyeavM2A8eGJBBTHfK5HEUG9Y70TMI
 ZLGP+cfJM+9ern1TPKSS1mc8gvlj2TM1DXSNIj18m/iYe8YhtIuilVjzpYT164jn/Uhp500SG2S
 jGyi1wKbix+gUWdSG/kzjqH++PwU0ch82Vk21EJbThV+weSFUI2qX9a1FbORIk4PlObROGYNFvI
 jCzTGHRpiYkHoruVPAy3D/n2jlTF/dhqfYEoHs1eFsYh4rziNLGwEjEFbOkTVxJ2qroPGGasK9g
 OU4Dcl0ItZnRiHqMbbA==
X-Proofpoint-ORIG-GUID: TnvSLRk8eq6KhfL2ko_1SEgAafnayGL6
X-Proofpoint-GUID: TnvSLRk8eq6KhfL2ko_1SEgAafnayGL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030053

On 26-11-03 18:21:44, Navya Malempati wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
