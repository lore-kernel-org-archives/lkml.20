Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367804;
	b=iqhzqwyD5RxJz4HJrCEb59/xjsKG3hgma3RDSzhg0Th3sujOGJNnuBzYhUjOI4o2BQSP
	 NPkfqhXw5oqcpR3cinODuA9585BJEiNOuSzG/8ruOo8+MIMnhmR8sxUwma6l1YQEfGw+n
	 a9PqXZPEeackke8zUPhMdkrd5n6Kmt9oacwIKQYwOgN/pJqkbWgrhVvFwSsVmmth2yyT0
	 raVuYlVo4mIQ5awZ9e2fMMbA+6NlsBpiOpWbcoEqOl8JufCdbRAMzqcC9BzYNyM5eaMxd
	 G/HwXOFys2rKtHnXdg0MC/MLV6H186GoaIVocROmgYaaj/u3LQziiikek07ARLRU9kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YdUMTqtAOkvENFK918Fy2pUtYQjevISfmJKm9P9R3QQ=;
	b=atF/C7Hc/aa+i37riK9JLXuGvhsF6ATDpj6G5292fuF3eMOBau8ndXtYwOBgkDj7ftbw
	 FAiUWFUGd5J/Ik7e81Auf3cSxlpgHcQYtJyBl1PgKb6ET0fCWSeAzxqnwbMSpOrJJMKZO
	 guebJpQWXonHDvRg9nObvadEsoTmWGCrYB1DUmxXHcAcaEPZSXD3d4zEJXSMMONNrETHE
	 6hlEsGNM4T4IOdG+iZ5F5xTDvPLoNb2Z8Ut0SI48khLt4j3NC79O9MYEMSUWDQsd75RdM
	 D+yWQkLrIkUsxrb6ZCLtDHAVdvbMhlqeccEQTXjDUwWH+rKLlsU0BZdUyfJxKYubynQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S0dENm35;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO+Sinvf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954B606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7954B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S0dENm35;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO+Sinvf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1t5i91905740
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdUMTqtAOkvENFK918Fy2pUtYQjevISfmJKm9P9R3QQ=; b=S0dENm35vTOYdDml
	DA8NOGLL7NNluA57GO/shSH2ZjZuuhdstH/Wfzlc2TTT71LSEc6okcAB/W62hdJ6
	EP7mdyD1cGW5V/r+qSbiVhCCfYQVeQObVQu4SGhI+OyOVUlBTexHaErVGTsY/Z4L
	hxN+sTVp8RZ6CpqnlOSDjhwrXP59xFUORRlxxC07McgIRfnnRQCVgh50bhMYzL3d
	zTijKjet9rysQ8NJhzOauTxJp+7TXJHIsG8tOMPSXA8EmnY+F23XwRNLM5Wmtss3
	Ow+zuZygRIQoM218cnBIkU+3ekLPbyX8Wr6kuxWETVap+l0BvN9kEVvEfFHtT1+M
	gab8ug==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp0kmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:30:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so5812400eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367803; x=1794972603; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdUMTqtAOkvENFK918Fy2pUtYQjevISfmJKm9P9R3QQ=;
        b=CO+SinvfJALCATS8spBnR87zErErm9mljgdyLprsaHnkIEZePMcZ9JvzopcnRsqCAs
         Zh/ASIitx6rR2+4tZnb+4PejGwbXH4EhG2OFjcUj3/+PJT/N+eyE/a9ITBUb5gTdDdOm
         sgr2od1tvq9h3DKyU0utz1Shiy2dz5plfr82Ptl4IjJ/s4qbHR4zvIz2gVya5tJ3Qvy4
         8vC69nmGVlr7Hn/ov+UVA65NVmCCc5G4oUDUmoWscROmBJBFiOp3m7UV9c2jgNOdgTbV
         m1AA6tjx5jz3O7eg50QeHS9ytjETR7Uuq9lGcuQ7jTnec+6g7vTalVJiUkVqrUZTS45Y
         Rttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367803; x=1794972603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YdUMTqtAOkvENFK918Fy2pUtYQjevISfmJKm9P9R3QQ=;
        b=OmUiy6qya81a0mb097sLOLgAmYiBzA84ouNMPLB7YCKqhXFi/xZZ59HjCs18srHpqM
         dU6aKPDZ9VAXNyCQ4/gUA5ywpCkKAqyEYB3Xnj2GCRwCQRS6y6Gv69WCiw0jZ2YSgI/X
         IS5Fab/zg2NyF1uWqii5o/Kbv18C/gOWVPBo8ckCFksnqpvc/8GKyBP//Itp5uXGB4Zi
         dIukRlL71GC7Vf+YCfnF9lee2lowYTIajtwi07CFsRF9FobuzfR+jL/GtJne2k3TyA19
         xMNyYFnuyfHIK+2/bcVfXWL0MoKXZ7KcmzuwaFPc46bHp5D1oUont/ojN4gsleTulML7
         zmkQ==
X-Forwarded-Encrypted: i=1; AL+hErHTEroHePGZaT+0u+MybF6BrXNTEG2n0h2B20HsUzLBDzMlc14yMDppCQeZU3i88BG2ntB3bIJAGZbPQjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A+rV2NLI2WfZ2bZ747I05IphFUhqeN0xLon+hAp/Q4VOn+eXF
	m8iL/6LVoP8Lm3dxwiwtVyFX/RKIPobvK5xkA5DMslVquUCl1g2rbzxOcGinNph6bnB+klA9OcB
	Iof0OB/5yL4UP9v4pK7hByQ2xxRA+BxPlSP5lnBNXxtptrkZ1QO+cuic6X8fHXyvEh4o=
X-Gm-Gg: AYBFou1/gxGvI0BFO4F82W/w1uFwlp8QYAw/zrtI+XpUA5sg9ALK9WjBm0qKuBgtscw
	TBc1lL+HIBjGAlVyJw8cdU3STXmRglOTR+HmUXXzWNCHsOjEIEKw4X5F3FxsFEV2UA5Bqw950hY
	LkGbnGaHIV/nDm3xhaNqoSGZl7uY0v3HVJNOqnHD4T5G+BvnOLH6TUOQ3PcXNNl0LRJeX/81q4V
	LU2PsE7v3pt/poPJdFn/Fal2gQptcRMKzFUEELlyWXLy5xkjiwxf953Cbw6QLQt9Wz5usifVqxT
	/gmbYQ1/ec3eVb6S8lEA93jveMHagZ65tEgGB5I5cqxdDrycX9vvJWgvMqLFff6JGMzH/xR3g7h
	ticbxm6iRp1KMm60wLtlAask5rCqwA8iCH6x8dgo7W/rd6QgTFQlvZLHKwl3Nr4dR2cwyjnmXGi
	9CgZHjSye94JGs/CRKkF5FsQ==
X-Received: by 2002:a05:693c:8942:10b0:36b:f09f:924a with SMTP id 5a478bee46e88-3768617abeamr1782653eec.14.1794367802927;
        Tue, 10 Nov 2026 19:30:02 -0800 (PST)
X-Received: by 2002:a05:693c:8942:10b0:36b:f09f:924a with SMTP id 5a478bee46e88-3768617abeamr1782624eec.14.1794367802272;
        Tue, 10 Nov 2026 19:30:02 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm23040256eec.23.2026.11.10.19.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:30:01 -0800 (PST)
Date: Tue, 10 Nov 2026 19:29:59 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <avPhN0uahZkYVFSK@hu-petche-lv.qualcomm.com>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
 <avGLwjn6yZRqpBhF@hu-petche-lv.qualcomm.com>
 <f1beca15-91da-47df-aaa8-a2a816087b88@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1beca15-91da-47df-aaa8-a2a816087b88@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX6wIjltgkNzRs
 9jhFpZopsYj3dAQf1CrogHiWDop/wDutEjEjaFqI85YvN4kG4mMQigkmQZeaZYkC3rUopLIIlZJ
 J01broWXnMsPAIZQyB5kLfjCWqSULIFqw9dAU2t1oULVHd0v7XwZMYS7Pb6w1jmAG8BT7BSYgck
 Zgpzjo4JhEUKXhQy0OcvsCSFYU0nORRpvRRFepTyXC3tc7Jx5Suw+cBT7bTyzTdzu7XuRwgbc8P
 yWyngOsuvUgRunGZKIWcFaSsi/dYJ8fcPkJmKVUIeu22oPVQ9OJepoqvVwucxw0VQQM0IUi0yJ9
 t3wMy8UwYL89xMGvtBXuMVzjRgMH3fmxpBxSnmGDSSdmGcNqOOUDPxJDTMP5uHOB/iIf6iP8sYG
 I8K4V2BgotJUQIF98r4ppjHz599mcsyUUPJw5ycUW4q6rpeAtPuhfnuQqg7pGp8c4FQ7RB+TpcZ
 GeZpAdeiB/tKOo6TjvA==
X-Proofpoint-GUID: kryW9VMYuHoiSpZbt2v9aT0Iyd88hXMR
X-Proofpoint-ORIG-GUID: kryW9VMYuHoiSpZbt2v9aT0Iyd88hXMR
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af3e13b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=kQgC6_mu_KQiaI9rv0QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfXz+isqP118ZkK
 TmfDAaFw6/3SrTEscbMXPAHDCg1OYOBjtLWfnKYVkd1r6paEw/BgGSVSR1zmLPl3UCOJi+boM/p
 ufg+mg9hlycf9Uj4EA/+fm7b7Ah+zPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

On 26-11-10 18:11:31, Akash Kumar wrote:
> 
> On 09-11-2026 14:30, Peter Chen wrote:
> > On 26-11-05 15:32:16, Akash Kumar wrote:
> > > Increase the nominal max USB memory bandwidth vote to let DDR scale
> > > higher within its nominal corner, fixing glitches seen during
> > > simultaneous USB audio use cases.
> > > 
> > > USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> > > MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> > > frequency; the vote-to-frequency mapping is platform-specific and
> > > comes from each target's interconnect/OPP table. On the tested
> > > targets, the old vote kept DDR pinned at 1 GHz within the nominal
> > > corner, even though DDR can run at 1.5 GHz (+50%) within the same
> > > corner. At 1 GHz, glitches were observed during multiple concurrent
> > > USB audio use cases.
> > How we decide which value is suitable, eg, you set 4500 here?
> > If DDR can run higher, and we have more stress test case like UAS
> > transfer + UVC transfer, do we need this value to be higher?
> > 
> > Is it okay we just set the highest value for USB, there is a platform
> > OPP table, and we let ICC choose the highest value for USB at specific
> > platform?
> > 
> > Peter
> > 
> Hi Peter,
> 
> 4500 MB/s was arrived at empirically, not computed: we swept the peak SS
> vote on each tested target and read back the committed DDR frequency.
> 2500 MB/s capped every target at 1 GHz; 4500 MB/s is the smallest common
> vote that reliably crosses into the 1.5 GHz nominal step on all of
> them without pushing any target into the next corner above nominal.
> 1.5 GHz is also the DDR frequency our power team's KPI bandwidth table
> accepts as nominal, so this vote keeps us inside the power budget they've
> signed off on, not just inside a technically-valid corner.
> 
> We've additionally run isochronous endpoint use cases with this change —
> mobile platform passes the full MJPEG test suite at this vote with no regressions.
> We've also verified UAC+UVC concurrently: for that combination,
> DDR is bumped at runtime on demand by the userspace application
> rather than relying on this static floor vote alone.
> 
> That's also why we didn't just vote the platform max and let ICC pick:
> not every USB use case needs or should force DDR to its ceiling.
> If we voted max unconditionally for all USB activity, DDR would sit
> pinned at the highest corner any time a SS device is attached, which shows up
> directly as a regression on the power dashboard across every platform using
> this shared driver. The static vote here is sized for the common case;
> use cases that genuinely need more (like UAC+UVC) bump DDR explicitly at
> runtime instead of paying that cost unconditionally.
> 
> In Future, we have a plan to make  it configurable from device tree which can
> be done based on target.
> 

Akash, thanks for detail explanation. I had not considered power consumption affect.
So, we set a default value for balance performance and power at most platforms,
in future, we could configure it through device tree or use space according to
scenario.

-- 

Thanks,
Peter Chen
