Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF78541445
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990130; cv=none; b=FapU/Qc3ENXTjnb9CnCh+/1rpLWNXASwwAyDGxX8a+zwNmGZpb3N1tQj01gYsmF79JuHXU0ApzdZ3irdFewM6Fbg1EaDvEMbD/6eu/Nhvn/hvBh3pXFi8oQoPykJcFUjzyJDgYV1WHCzF1sSPjiuTxqc/d4EDP0fSQu62nsq4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990130; c=relaxed/simple;
	bh=D6DSOaHcvSq0t/JVKqdCTLF4wlLhu48+ANiIihPgiqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p303+6v3vv8oxCmwq9D8U+jexRm3Jra8/My6ZoMY0RdtEQfolp+s2bCamTR2K6D6ZGqGjYTbrWEtshoKB/CBrJ1OaSq66hhRsOq7OOjlnCTk0BLhy5lxJIRgSSTQABzHURogtpEos4y9z51O8xGQp1sZSev4YT3471s494KYGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nckwyOJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOy6VS1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nckwyOJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOy6VS1B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEcbCK3209612
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VLs9L3lY/vfTjFsZ1UhtwMXv
	kTr/rNAuLor1fwi1wLY=; b=nckwyOJbBmDHevt0K852xtIcZq5G1mXGcllTXYTb
	Cnq8fF516yDCg2QhzN1Tm9RP5trjnbR8SMDii6RzLOjqj47RIzIBBgygnjTA2Ls/
	xSf317dJIuaT0db/ktl7N0c/2gBz+D8LXAGkSKjTAyi/imVDiisK6L49gfZjegbO
	/z/Fux0vxeRJN7dU3gjghXRFFosrrZJFrLz3FmDeP8G6Zf3/PPmiEj4awPJSxr/N
	eJL9+8ZOYUP2Ly9iu56xGtKH5ybukDy52dBox6fS2OinwvnwVg5nQQCU9r1JS6Vz
	Z1xIXqXBHXqQNdE8a3YPN97145FjQQttzi72kWdCJ8fcnQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6c2dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:02:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d6d5ea0757so4975078e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791990124; x=1792594924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLs9L3lY/vfTjFsZ1UhtwMXvkTr/rNAuLor1fwi1wLY=;
        b=BOy6VS1BHQb7n44vif00kP1Yqv6boew1tKvPH4Pe3kPWChrFMtgsNPx0lIIoETGTt1
         IpUUyeusQlTcPo4E41TCF1oqQAwZ74plVWyHcvKVhfxypyC/oRY32rq8HJg+td5SlC23
         WytYu/UYQF6BlY2eluS55KXRh6uadog+beIXyIOK3A6GYGh57jYYtKoeVWvLCC2FK1vR
         eLDhFqAqMSM3ccPHigXZO4imP297zsCgG7KS51nWmMUEyQCWCSMYVCK9MWj7En8J7b78
         l+4c+gyioAHcFky39baVBp8vr5qW0XtSsFmJajXeTRY1V80PVvyXQyzG7gz6HLkzn1Wg
         ivRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990124; x=1792594924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLs9L3lY/vfTjFsZ1UhtwMXvkTr/rNAuLor1fwi1wLY=;
        b=0h64ZUdN1KVf1kdg237Dm8exsfAZ1wQ/4vlSt15WUfLuh8iRY9yNlJwMqCytSd4YK8
         3/1GASCA37205TO9yvWQwoOp6RsiOtq7dL/VeDXTlAhAQWIlNJnkfMy5YPpx2BlMlWr7
         w6Cjn6DFrMKOv9+6Xe/CUY3tf13DOtXkM/CbdPe5SobnrHZ6tNuXHNe2aMQLrn5xqdZP
         lShBQUMSa+Le8T54v57GQyPot6cyYY7/OZCFs7P+D5ojH82XftIP+B2QxFSNTMsjGDdJ
         MpDIWpR6TD2WdzwiqPNgksfPRoqD8BQzW4UCE4zx9XEa2juiMxMNVlEq2wwaAZ1i1tLR
         4jgA==
X-Forwarded-Encrypted: i=1; AKwUvBwr+4VIGzJ6Nxji63r7oIb9EFWJVtIO8RZ9Vyapjm8cHJctBRRRqThBmBxmsYNtunerEj9XzewooF7iUGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmeHnq3BNQ+dvIdGzjM4TR2foSEqg7bTjW0jMruh6Kcgo0br4/
	/Cly1JS+7KstGEdSzfsbq+ZaWook0bEEQCrf9ERqYUZ7dQjr4UF0ZgzbSmqs+uhOQRF/e+XL2I1
	YjXkT5pl1hr80kScfOV5VlaeN3NhJ//dFO7MKJ1dDsQCyZqJmxERbxMb3UOHJ17o3/0c=
X-Gm-Gg: AYBFou2q618KM1cKNLV+RGD53gX+UMURXnsG7Yc1pRYQN8rKQOazVA/04AiUqPEVcru
	fThySS4j35Bp7BwN2v+8ML2BD/R+cuTzkUCD3iFJqlW+VR8lVZ+lwMrJ5iA79KE9OlWT4tsW336
	fpUK0NHMKV/8dheONWdsBlET0TcVdpVbAkBjtvm2dKImk+C1e8lZdH1VG6bjOXuN1m9o/jEAtfY
	fvmy+k9QARtus7KcX/AarksnY+AEdHD8dQgj8w0yyu+3AqkWZngnIbSxNH1sZqjB7WssnT0s/cH
	xlRGCs9PRgmsGLOTZd/1IH8JAyd5DA4cICaCPOWUEjyMCrVzqs4QNlTwPlS2ANSEcGGSomkI6sO
	sK527t8Ych3k2cmpkij6f7KvXNub2EaaOtvsZHp2WL5jmW+4fUw6gPo7kX907v4eHeZi48lIXcf
	sDh3KggE0rdwAH
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr5417834e0c.17.1791990122775;
        Wed, 14 Oct 2026 08:02:02 -0700 (PDT)
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr5417712e0c.17.1791990121807;
        Wed, 14 Oct 2026 08:02:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33da3ab7sm703310e87.83.2026.10.14.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:01:59 -0700 (PDT)
Date: Wed, 14 Oct 2026 18:01:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Message-ID: <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
 <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OJMQJ7vlMXBAjAB-3FU6uQQoKUIbMakO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX84q4oDRfKsDJ
 URKDIM+IlTcLmtrVR1lWyyAb0/EdmoOmw1i8DtYqirX8c4qZKXlkiw39CcZmT3Edn4024LXsn+w
 LSX23f0vsrCtAu3eM3/FybWNRygIz9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX/GX+4LT0wO8J
 XMuCIg0JGUwYO2uMmSd9nN2raXQpUMS5tJ0pj0LwEzrBpbsB6zdWdJHD0WTJeX2Dq7NokFtuAU9
 n8v/5yMBLWzDsR48mh416PIXKUE6DPl/hFyErLlECY1RRBYTqUrLNy3LfnNscAXOCLhEJCIZ+0u
 A+MzoL/Pkan5XzRSERj+woVkhypG/5l6jqMRNoZJLXQayfGoQ2XZFSGf+7IVYSFVTkHvPHAaCrn
 cIpbvtc927kLpO1v5If0Ml/isjp/oIhVAoLCxMU453QXA5sAZfuqa5CUCNCzDbvRF01UYUOrNRm
 NA8S3LeZD+IKCi/hphJ8mpllcqdgITO5R5TpaFY9BjokFHyenhO2yiDPFVn4mwyjxc/NU5TeJMi
 Jr8FSRJSNcyQ6WYfOaHGwMk6wFwckQ==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf996c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FrZRtYz5i2LrMhXnUOwA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: OJMQJ7vlMXBAjAB-3FU6uQQoKUIbMakO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140059

On Wed, Oct 14, 2026 at 04:36:11PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
> >> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The SM8650 clock-controller nodes omit rails needed by their clocks and
> >>>> PLLs. Without those connections, the clock-owned DVFS implementation
> >>>> cannot attach its voters to all required domains and controller probe
> >>>> can fail before any clocks are registered.
> >>>>
> >>>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> >>>> Assisted-by: LLM
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
> >>>>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>>>
> >>>> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
> >>>>  				 <0>, /* dp3 */
> >>>>  				 <0>;
> >>>>  
> >>>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> >>>> -			required-opps = <&rpmhpd_opp_low_svs>;
> >>>
> >>> I think this is neccessary (at least on some platforms) to keep MMCX out
> >>> of retention. Even if we can drop it here, I don't think we can drop it
> >>> for older platforms.
> >>
> >> MMCX exists precisely to let you turn it off, the clock patches
> >> retain a way to keep the clock on during the runtime-resume of
> >> the clock controller driver
> > 
> > Turning off MMCX is possible together with suspending the dispcc. If
> > dispcc is resumed, MMCX should be at least low_svs. On some platforms
> > it's handled by the cmd-db, where MMCX has a minimal value of low_svs.
> > On other platforms MMCX lists 'RET' as a possible value, however it's
> > not enough for dispcc (or other CCs) to work. In theory, *I think*, it's
> > exactly what 'GCC_DISP_AHB_CLK' might need to vote, but we don't
> > represent it.
> 
> Retention isn't a ""real"" state the OS should vote for, as the HW
> downstream of the rails generally needs some flavor of LOW_SVS to
> function, or at least I don't know of any such cases.
> 
> See also
> 
> 7178817f1904 ("pmdomain: qcom: rpmhpd: Skip retention by default")

Ack, I missed it. The price of doing OE instead of kernel for several
months :-D

-- 
With best wishes
Dmitry
