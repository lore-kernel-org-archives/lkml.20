Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF674A6CD3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966487; cv=none; b=RzB7QUM/TP9N5cOzSURgT1e+0QMHRFtfCfoeh5iSii7n0dcgJFhPb2bChh4RctXsm8ZzTZQv71k9JdMNGXdAQo2vwPfU9E3XrSrj1PH5gMrLHzqvEPHcckveM5g/707+2F+ckHWU2KL/lr6emCTeMUPEVbo+FIyzBXUdxo53q/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966487; c=relaxed/simple;
	bh=hA5Jep5pACbObsfPa/fLER2WRbYqlyN+IWuj26mmClk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsjJN4Oc3ZFAqRuyIBVw+RD2t2KeB3Z+drp4PyTgk5QTr2EdvTiUquLITB3+0XPUKDhXx7oPSdB1FOIgVchKEDfBFr5MWKqSXetKmmae4Uddoz2x/wtFnNROEbV81RaBLz6pappAeOWj8q9GuuK7NWKU7uxKOfXYkFIOftABtmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/Vb5+OT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYifpD/e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/Vb5+OT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYifpD/e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67kNa2685314
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X/S5SRmbTexKmsjmoZdpsnlp
	+I+xKbH89Xqk3Tt2TQo=; b=J/Vb5+OTiCuO5oBT1cUQpH44EzoDl8aMYiuwNo3U
	+8tMf8oJDgglHc10Mrm+/F253hakhKEnVDaQ59fs3VMpQiDqmKTcoFkuRVADPVV2
	tzvkl3rmFHz7Dw2k8sI4+zsHJZLhmnV22iPDG4DASih6k+VWTHPmXq6mSOMKdAIj
	dlW0GpP2mjZPDekHXKDsMWkaFR5QsAivJmAw98SVlY8fNpoZN3XcElodBtqYh1Zl
	j0/KliDizHtucSam3winuX6RTotlBTURlkaoxkUHG/MUQqJZjzO6WHV2MIa6Xcrg
	P0YjC6kv5HNALn/rccCW3IIypKp3wSBSd6A/QHAMx50Svw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0j80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:28:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso135985585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966484; x=1792571284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/S5SRmbTexKmsjmoZdpsnlp+I+xKbH89Xqk3Tt2TQo=;
        b=hYifpD/erz22hhnZghl5Tr3LRKHyig0g2Amixs5pkeUaEvpUmk1KWJy/zXtsM3pa+o
         2FwmPutm2OypGVrWvbvdDVM12eO/0jNQO9cyhbSK2yhkwFo/ujoQTBZjtp8OpfWXDX06
         trNH4N5yM06tMakoBgjFiFWd7y8n8Q5vYzGe2sYSsyTHcrl8bkFyQ9dTEG2TzThnsv54
         kO8dKVd4lN9JrTjkyeRTYL228FB/yiKUDOdoUJRPTMIwSi2VsOsu3tw8rnFajq0FH38b
         jGrVNYDZaYP2piCzdAIUgxMhE6YB6+LtWYcI6x12FqWe9qJVxuuVFzQ7gk/WaZ3LJOVG
         mu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966484; x=1792571284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/S5SRmbTexKmsjmoZdpsnlp+I+xKbH89Xqk3Tt2TQo=;
        b=Po77vMzm+LXkoyQZrTbvW4Z+AlCvyjeU6zgJI62HCNrkg8kXWeWD40oYohLFivJJmG
         /CCNE3lIas2cXmTIGRcQg2dPvmI8wXPxIYSEVxKH5s3uvbpX52vyLj2hVEBspM+Mb+WS
         N0f0VUcACN0p5t6fp4cdqez1n104C57x0gZxBJThZcd370ZkROyW365Ytleb9YmeDq7a
         Za6yjq7ELLx2FTK6N+myu9JLyPqqJ+hokmbSAEMIpRqOZshAgXpmc6I5mHp9fV+e+CX4
         fTTj8+h1vlXrk0v6DJmnWTl67vkYloxiKpOnlwRswyxoia1FyQwaShqIr7i/swPCaRXP
         BSew==
X-Forwarded-Encrypted: i=1; AKwUvByfQB8YuaMphZpK8pVJVhH1VeMVAgABSjrJEVF5gzN1Lc5jvpwCOSFjQtSMJ/HD62+DLjNnMRUx3LCxcdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGOfY7Pernu5lsoCDlXMuyj6p4DBrmb6evFq0HWPgvaEmLICPH
	FS9vnrlUO/HG3UxHuu196IacWff5p5e9xWdu/iChHrdLZeVNzVUrayP6uYsmfR6C5b0CgaMsWce
	CXIhkzECdI3U2NjOHZAEeF00ogMW5KISMUXIOo0MLgghgaPq82UvN1+1U7anaX+88/uI=
X-Gm-Gg: AYBFou02eUo0mYB5dKETwPUTmFAy7eJwIrBxQ9SmZ+eo+odhyC+mNHvrJA4LWKr+s9u
	Gapu+AAuCwffgUM7kcs2vTwQPi4lxJ0dPgKZd/MMJAZSI3BJ7MA2BIF0fAe4N9YE24Vbep9P0fu
	W2fGkcn9Apg8MxPsJsF7IlTwou2G18weWQgSj5AMyP8UTnHcAMmLWSF9lZLp8DLfhWkSx49Y7Ou
	fhcWzMJOJwhBozXwC4t6+pK+wCT+brq4yotGmAq+O3G9+GzHbaqlOpCz+DU1j5tYYVeOme4oNxs
	FhABkyBu2jLYIzl7geH+NEO2APb1tJ6HIwyUCZYFzwsP0yKpzbQ96G2+k/4jhc0pQV3NvIalCKi
	IYShCAxE2N/kOdVnG
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1234644485a.5.1791966483419;
        Wed, 14 Oct 2026 01:28:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1234642685a.5.1791966482859;
        Wed, 14 Oct 2026 01:28:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm13464144f8f.0.2026.10.14.01.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:28:01 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:28:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Message-ID: <vhqpbhknc4p4syz3y7jyeesg2vqsrcakv3p6r3tnla7v2kr6c5@kpgsr3rmhjvx>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
 <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXwK8Au52ys1eM
 HTGDAam7pKzTtwqFPt3lM5jAUsxv1pGNHTEqd0eHr4SU5IxuS2PZ2sMydO2CEwDpbD8FTrmptOS
 opHmrclRrILz4fk4gP090wweFGP1PSk=
X-Proofpoint-GUID: eTuhEB-is8oKW2Lfs1t46yKyttT8Eox4
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf3d14 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=x4xV_kGm9pRGdifk3eoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX2a3rEQnMh552
 iODi6rilxCfKCtWTbJx6BzhEEk7UKra3OeutxJLgFjbhycIhn1psOVi1GApudfdTNEnp8M04MjJ
 i0BTV6O5ygp6hvo2dnmcZH+BBeMNjR8d1PjSajkGYBKqILDDyBxn1VjLwfBn21X+LQyKA9oxhKP
 EdFuQl/f4hslv6olEYDOthv1j89mtIQPrhc24iTHkLc+JGuK/mC7MvOOM2WQKL1hD6jNPkcwlh+
 k/IUiZjOfnYpfWVaGKbkfUlTmmzIE3DhEQi+xsntpGl0wzVD5bV9//ZqCbKHpdozThDvJTT5xfz
 3bWFCoyR8jLqEZ9Aka9u6jvGZcY4/Utgx7tIOm8xAO/J8w6LaYwhULCJwbrrNRJTJ5exBAAuVzK
 HuGIQQNFaWdWRECJNEpGjahp/R5V2RPa+rdHGzAMj/HmEqyuSfI52gQlZFOP1VhFDQ6r5+IwXdY
 NXI92uGIrclKNQxk3yQ==
X-Proofpoint-ORIG-GUID: eTuhEB-is8oKW2Lfs1t46yKyttT8Eox4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140033

On 26-10-13 12:39:45, Varadarajan Narayanan wrote:
> Add 'interconnect-cells' to the clock controller node. This will be
> used for enabling NOC related clocks using icc-clk framework.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
