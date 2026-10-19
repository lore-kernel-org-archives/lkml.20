Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771064915A3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405614; cv=none; b=QY0SGiwCRMKYgoRh873nJJAqRbGgvP9ZRt+gT54jISl0SOrrld/82Nv1L4dJiCzVbdREwTWb6cEbVxgaggQd9q1vbqouIgAmdpO9/OSgzJa8o2F2jb7KOMgZoshlL+2LiVoB1InogDrArOK1ncJnxTxoltKbNLuDXRh1Z7uzFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405614; c=relaxed/simple;
	bh=Ote98vI9qz/LW3HtMpRzLbduL+1SdafZvtDXqvEYh+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUJCXtBRTsJpwsfg9SxzG4pEpa5IMrzGEzP7Wo74847UxoqeXXwGKTQ8IkPrc+nGmSdOoUgLZIU5EVVG9XS0QkCp2J0STNgq+6bHKwSMHrYN2t610RbBKGgQRV8z9ihakodFMfkJwIEerKcml+gjyzX8zXx81m9Dy4G6aC/q+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKezsfgi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeWlVLdW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKezsfgi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeWlVLdW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OoPX2234216
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F+LKQoTb35jRYglAbCLwIauW
	hdIYSRn5yyAB/X8aCJY=; b=JKezsfgiQ5BQB5yy1PZjfVo1qSvJ2na8uOD56GU3
	oUKsYcD1OyIsHJzKfxUIp42qr9SbNOxLO9XP+aD+Oqxw7gcrQZ2iKx76mvtwXFw2
	R307TZffIWrVnTpmhEF+unb0PUDaQDDQK7aoO07g18TRglNeZbZyDobikTKA5yo9
	L+NZMjdXXr4QWetyYnDhU3TtFYEKM7XlOjbR6mqMjpNMp7a/x+YLxefY1BIartYw
	CwrWDBpVZq+mr6ZdOVQ2GjK/rlJ/5QJ9dx2exS1ygiwsI3CXyph6ERYXaVDSc6LE
	rNFpX7VBjsmzR6f+Hj9gO/ZH5KSLc6dJ0xg32xDXnUFwCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x8mev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso694651985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405610; x=1793010410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+LKQoTb35jRYglAbCLwIauWhdIYSRn5yyAB/X8aCJY=;
        b=IeWlVLdWvpaYwCPMdzwyPXlP6HbcdWf8p7r9kGaqK1VLHKY/LixrmOHBtVutuWucTt
         FUNActAD4qWZzegJt8vCVIYxifK+r4Q+QJWkcdocKm428tqh9EUqe0g9lqosdrzmh5td
         WA8hF45MRMr1FwObFXDGpSeRIust2gtb0MR0jJ9f807nhHrfqEQGtlsAYBRgTKA+QIEO
         IGY4PK12Evl1hQWra0UoW8w+TXC86PUVJeSsjjirf4ojBPK1+50ARV6yNCe4IFu7ecc4
         qKHmf8vvSeerw9dj4mahw5QG2Q+6igd9ewl+wjm6qJ3+ssl+/JR1SsF08D/rMKz2AGOt
         uMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405610; x=1793010410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+LKQoTb35jRYglAbCLwIauWhdIYSRn5yyAB/X8aCJY=;
        b=Ii0TguJg52pIpEwxdTOGBzyQOycOdUmh/gcqdE/P/ozQlRAkAFEgeDcTsFKl8ZKuRk
         07XO46GnAlYorhY/Pgtv+Ep5pix8kQ7px5Rm3a3895OagUoGqYg1Aq64Hs4OVXXANhNk
         n1Am7cR057GWwkUEngJRooHCke948pN/qA8BqYQIAK7GKU+VXu2/dzR2foR8VkHdr2zY
         8WxOx6jvOPXz743EGX2FNBvkmjKeOt3RtLovfCWn/umEsjodL8mVw/JS2doQ+TubifL6
         zMXBaCtjxA1t9gqZfwDTsC1zLuQlf/nxcVEU7PSEwlOTLZCjS/wiGh+1LfrwFg2ksVYI
         NswQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUrwmZ4TbEPWy+WYP4xLDl3G5Le1lTjnZykvDiREKsDuRiATTTJXNcseWQ/QMXsQb6uR0LJPGFPoc1quM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmeLX3dG7Y8w43OcLhejpSlC/BlVwmkkpBvHycEqMLaVPKiqR/
	LE9Y7deKY0/u0jEPFsMPezBb6PByMMYe/imbbmoKcbVhF378jL7B08iYyvUARfDiiZq1FjcpWIF
	kAHOWo6h1wK2kpWzSJ/q5TX3uegwIEAmcep2pm+b+1SdvnPpUT3zlpoptfbk3ZAHq8zc=
X-Gm-Gg: AYBFou01c1SPFUZoHZ+1MuxSehw6gORK72a0FX8fnwabvwNtnYyUEivlWOhc4VZn5a+
	TnhJEdd7o3FPybO3+L7LBLH2hLQgd7WHlFDLmcb2x1vZsuE9qwsTETwr0LR3INvxVvg0X9yd4U2
	Z1k7rUY37j/YycOzUhgxnkt46zqK9xMmd9rqlEb4IShsMgJUliEjl7ciF2/umMzcvJ7VN3QN64H
	Iq7fqhVR8rYJ7ShPO/p3sfPc/M9t4xspgT7AiVk8Du+KffP4VphV5XzL8wULoitvQx302kRbN9t
	jcbJ3ciI1cbw9KpfW/ujzhzP2ucDe7r8DTtJUUasTc+hew6KcNVZctKVUxO49+1hS7bEN0/7QsE
	J7JgZlHtoJ3XpMOU1
X-Received: by 2002:a05:620a:260a:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93f29db9df9mr1156269685a.62.1792405610318;
        Mon, 19 Oct 2026 03:26:50 -0700 (PDT)
X-Received: by 2002:a05:620a:260a:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93f29db9df9mr1156266785a.62.1792405609758;
        Mon, 19 Oct 2026 03:26:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm281985745e9.5.2026.10.19.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:26:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:26:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
Message-ID: <dcdpigc2i3lfwisawli3dggr4otxquy7uwmkzn4tmuy7jns7rw@ljcdemrrdzsr>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -kBBnQAJ-RFzbt6PSeF8QqPfOGtaG0X4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXwTeP1Q/sp2Wr
 WP4PVrkjDuysEW6L+axnJMYTFP2bkYWOujylMW0bfEqP3B/heePbacOxMBhaIq9f6wv1HV1pLh+
 y0W6OTf1HaXVEElgBSZZm7n6+b8pZPA=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad5f06c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YwX7B-rWpBLcgDuOc-wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -kBBnQAJ-RFzbt6PSeF8QqPfOGtaG0X4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX8/EO+0497NYo
 v6qYj7HOJ9NEaKQJxYjpkK2HkSbzPFgCCb07PCL6xbEbvgJBt4bT0MmVB1Pu+r1O+9/kn0ArRXT
 DfJJ6iJRvjhnXSbf8LMfsR0i/sVRERspfGzJk3a13mClWujIOpEr2tDtJ4MnjOPr5yG40nu1CSQ
 Pkm5I0NYgucyudzLpRyAZpVj/1BfdUKhQXUYIimgu59yVan9CLz8RKeFRM9C2QAZgG8TZ+Zkbn4
 VdlY3rpsOZmQdmo/BwdHrdp+gCBu3vzSkTdVl3jPU59cXRVv9kwCK/dQ7XYb4z/xdGUxh0/y4d6
 Jz/47qIe1dingQgY+yi/1BCFJWHnnoiodehllUy/xy3tBsVryMKrgT3sDe9hSxj+Oru8SV3SVFa
 WRI471wwL5RsL5nlgE/p91AZgeke/0+aRbT+1FpI+qHr3+m5AdZsUDj7sxlcuzxZO/IQlguWsdr
 ej3xYHa3FCFeqcS4NaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-10-18 19:15:44, Peter Chen wrote:
> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Without this bit setting, USB2 HS device cannot be reset after it is
> runtime resumed. For example, after:
> 
>   echo on > /sys/bus/usb/devices/1-1/power/control
> 
> PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
> "port_wait_reset: err = -16".
> 
> Set snps,resume-hs-terminations on all Glymur USB controllers. This
> makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
