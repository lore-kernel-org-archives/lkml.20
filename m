Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501744;
	b=Ql6coEOoheqZ42KPONfMTNJcA8XuQWLeihjK2qIad652gBL1/dSJdJW7xIF/GUJ0lBW9
	 LetYdJVgpjEgqwMm9+wHUMbYezY9YUN5m0bsGEJt9yKrQ0dNpboGn2EmNTUfCh0OCKXNO
	 0kPENXXkBamCCDkZtzCCeBkG3NiAgTT7EDTKwocDYAdZzB27Kz8Gh+AzZr69MVMHU5cDg
	 kRKhYMQFRlEcY2oUi01bieXu9dgrCyIUBaRBqT/iBuMhwQRmMead9rmo6ZHwdaDvgSwhb
	 js5DUiYrOeuiwAt/Nnsu6UotzjMDjLBOgPDetFZJfd6dU2+ycPb8bsQeMmUWx6BQ7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZfBTcbdAkrP1xzVcqe/uJFylfzEHBiLVgkItAH8nG28=;
	b=wjHdTcbxYFR2zmDB5V9DMjFN7wf38CclV4ktT4XutZp7JqToUSUasPPITTCSFlX+rehn
	 z291PDSLFsVsw92zULnw0d/VmKm6vNkRnq0hs5YtRe9mcJgAjI2lj9WEjwBm/Wd0TdoqB
	 mSEZtYYBA3FriY80b2jbO6HQ0ahOiE+3ESo+ks8Gc3tJsRP0AKYmHXAJL+84QCb3K/dYw
	 QT8ewYULgwRzx+XHmNM65pWqFllfWmUfFpsXuItD30xDn+vkHdihnLu/owTAhim7AoSzd
	 XDc155kChoKV2YBKRXHk0po0ovnoASr19y+5dNiFMiM1Q4n4iRW43i3E5EN3J1IwpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpYbHdDJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVw5AKiW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B30606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B30606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpYbHdDJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVw5AKiW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx6TG2524250
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZfBTcbdAkrP1xzVcqe/uJFyl
	fzEHBiLVgkItAH8nG28=; b=JpYbHdDJnpRTP7B/DjzodEWy9htv7j4R5kEmOEpp
	CiZHY6xCZ8Wl9pK/v6Hc+sZPiRoha4LDaK/E+4EKAh7GlT/iOxkByexHHlIAJ/Yh
	CA7zcscx9RiD5c7ZtHUBwvOo+Fex2gvxA9ZtIOaffZIpellgMT/xdEDNqkFpvVJD
	2xd7PMounMSuMg6mmZMvI7ON6NpkafZuETvnlnT3lYn2JqDMZVo03e41lO50M9lS
	m58PxkWQQiHa38OZWcMeudkaKQh9FkwO3ePP1RW5aKO92lNTK+I8lfMxs0zgvfi0
	/ImtzfZ5uoPLlWAXRYV9ZBuMx66kxHTzUifdn9V7BM63mA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2krf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:09:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso372195185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501742; x=1793106542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZfBTcbdAkrP1xzVcqe/uJFylfzEHBiLVgkItAH8nG28=;
        b=fVw5AKiWR19iQP0592SRa3uOA89awpFnFrKPcfeFJ62pj1QqGelIOspCOX7ODdFEOf
         bUfRzmoYjliWkgX64SkxjEioc0Rcobw/r5ALjEOq8JxhgP5vu2fQ6E62q8b2cruErhko
         zGVWECytA4Q+2pq8ZOHnck13S1DyDedgCbApJJBRkDI/zWy9qzFcw+t3cx20BnX9Ykms
         Ns7nRVxUJ2Twtkl/3BXgHU2DiiAkstpTBSSWmAlcNB6wjVMBoiPO5mfHb48D2UpS1F6a
         PWQ+F8qIKKMvYTJkKVQMIjOx99IwFtyw+MzCPHz+PCXB5ptUQQchvjBGi4dJwSgMWsSW
         P1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501742; x=1793106542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZfBTcbdAkrP1xzVcqe/uJFylfzEHBiLVgkItAH8nG28=;
        b=sfZoke4T7gPtayyTsL6k8gvwEwZvaufHIds0u7zTbaJlx/0W0EIoRNN9DmcxIh0HWO
         MGar92rJF578pvHB8V07ulkXp5r4s7AnbUagSmK7CnG/DwqWk4baGwqvYD+4y3eALxuJ
         PspcaqVU7DG1XPFPzfPVMASm3m3na1SC8xB0tz+cUiaha5m/XjMqbfixSnBug/epmJOQ
         qNMOANXrRKzWm1KitXgUT1UBQwW/Zsli7EuZD1QIMe2ZbI4D9yI9hw3kRABVMEiwPzIV
         umfo0iorMu813VBu46GwnjV1RE/dAs5xNZYITtD3EOiK6MV1DHUOpdCGkWo4s6PdZ3ed
         1gig==
X-Forwarded-Encrypted: i=1; AKwUvBxAHTN/4Qq5E+Sj8caZGggIJAN7bXdtXe6fmMnFs0REeUAiAF8LgAwF6TZn4opim3CQGpKWGcu6oxfTakE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIrtG3BQcs4bZndpGf/0n1M89roG9zFOjq7YYhN8JW66rdgURz
	TJENmhfQ5tWQQoSws1OOKi+I/BpEfaDneJnJma3PQpYto73DjODCBodRsXgf3pvTqzvlkNp46I+
	PWXiEDrwfFaaIswX4RWOyaBLYhN/2ZHqJgHBDbVPcwCLgWhJhPp72qv1e7vtqMiVQgEI+3N0xfL
	E=
X-Gm-Gg: AYBFou2D5XWc6AIAF+icQSuJASXyS/uHpv5qsKWjof3UxfFdWjeFVN0EFnTk3DmDbKk
	RNdOb5qxTNmz+oD6Ps+EZZAuPcXrCt+RUFuUhDuNG6mA8VrAW7DQa8Qh1h0AoVpuLbhQJuTAeEa
	fL+/zTUhhYWgYfyXGTht2Ld3/kVd8++ENykPT0/FVVs1nn3CiD/WzSc63HsDlCZoS5CaZ1wCZDj
	Ddakh+j7DrUxGXIXwmPbZJkyzj4oxqAuMuOprW0ZQTzieMVH1V26jcOG/enggH1KfXdHP+rBhyX
	2q40mKZ+PLg1P/lRf4Ifv6ufvXXV8lb3GKH7a2Qy/S3dtFLLa0tlj9g6gHp4SUCZDqPv3/IvEGy
	SN+v4GpH0KG95UJMK
X-Received: by 2002:a05:620a:4689:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f3646a313mr1452577485a.64.1792501741832;
        Tue, 20 Oct 2026 06:09:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f3646a313mr1452566785a.64.1792501741030;
        Tue, 20 Oct 2026 06:09:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810035sm6446413f8f.13.2026.10.20.06.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:09:00 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:08:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Liviu Nicoara <lnicoara@thinkoid.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aleksandrs Vinarskis <alex@vinarskis.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add thermal
 zones
Message-ID: <nayh3uva2fbvb4cnycwphfqgkdotnzcnyuhbbcw3ug3augpek4@hop3qvnxr4ko>
References: <20261006185557.23016-1-lnicoara@thinkoid.org>
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
In-Reply-To: <20261006185557.23016-1-lnicoara@thinkoid.org>
X-Proofpoint-ORIG-GUID: Nzza7sY7HETcGmkdCsP8KzVQzn-n2qhz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXzQV02jsD/RVo
 NKxXVv44MMlSAWc7bhkquWR5mMc0WS5JEXWfnamtMBUfPE8Oo7EVY68u1UkO2EezVnLL25PhKLi
 aFoZIJX739MwaAjnBEtLejF8jEYc+6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX0prAS8l+sOyS
 xhws7WsyJ3764zqSMhAxVzf34lTPizVGy2aghZYUXKzMTod3/opMM7HsE0pfY4Y0dt5qfX0z7AF
 V09BXCkcnlQYI1VLzIvR+XxP0hmGQB89PopiWhYbGBHzeDk6q6Qy1LQ9qnISsFD4mBTmC1vIXir
 moN6kAS3tWu7WHeQMRsVjFkZjUv2qd3gO/X38320JvnPFa/wyJm0QzHMJJ4sGr/pVqq2GFh/PXf
 eVBclIgC6JujQY9Ywc0OEDeIrcu6JTCS3jTxiXFRfCT4/bQZQEE9L5pWdVNsJfekvwh0RcB50vE
 mSwKP/2tjOCneoe/gQutPZU+hdjYQiN5Vcu+HAm1O3zEw5bo9bd5bLnaTcLSw7zBhhWhjkwLn+8
 f946vgu/oEGqN5vF6nZh/UoLjAvUlP37nCld2H+bg+uCy4LajUpgmPI5qU2HLVI90EVQwljKUqV
 U95qe+PQ5mCqXZb2X4Q==
X-Proofpoint-GUID: Nzza7sY7HETcGmkdCsP8KzVQzn-n2qhz
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad767ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KOsBq0R2AAAA:8 a=EUspDBNiAAAA:8 a=G_HJgEvyynBOfEdg6UMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200052

On 26-10-06 14:55:57, Liviu Nicoara wrote:
> The XPS 13 9345 has seven board thermistors on the PMK8550 VADC: AMUX1
> to AMUX5 THM and AMUX1 and AMUX2 GPIO, each with a 100k pull-up. The
> ADC configuration in Dell's Windows driver package lists the same seven
> channels, SYS_THERM1 to SYS_THERM7.
> 
> The ACPI tables define seven ADC thermal zones, TZ31 to TZ37. Three
> of them, TZ32 to TZ34, carry passive trips that throttle all CPUs and
> the GPU; the other four sit at 100 C. The tables do not name a zone's
> channel. Taken in SYS_THERM order, TZ32 to TZ34 are AMUX2 GPIO, AMUX1
> THM and AMUX2 THM. Heating the board confirms two of the three: a
> charger on the left port warms AMUX2 GPIO, one on the right port warms
> AMUX2 THM. Sustained SSD reads, compared against a CPU-only load, warm
> AMUX3 THM and AMUX2 GPIO beyond the other channels; the second is the
> left charger's, so the first is named for the SSD.
> 
> The passive trips follow the thermal mode chosen in the BIOS setup
> (Thermal Management: Optimized, Cool, Quiet or Ultra Performance),
> which the EC reports and which cannot be read without an EC driver.
> Use the values of Optimized, the default: 53.8 C on the left charger,
> 62.8 C on AMUX1 THM, 61.8 C on the right charger. The critical trips
> are the tables' 114.8 C. The other four channels get report-only
> zones, as on the CRD, and all seven are put in thermal-monitor mode.
> 
> Assisted-by: LLM
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
