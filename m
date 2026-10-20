Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501005;
	b=EE8vWfYtszm9f3hulf0GNJgVeRCl4L4mXkQMoa1kpjpQeoZEt5YEwcl0NdW6/9lMJaBk
	 PN4Qyn518T/IuNg5ZsvTroPLZzQnNtL4E3tYwGbK7ICzMo+6pKWkGuxCmN1tNX06te4dV
	 X69DwGgV7jlKaEkuZZZa36CkCi+cgOrJZyqAPEWm8kJrbjX7u3LFm4/N475UaroeWsrip
	 9HJDDxsBDnia9UMvHQLPL/VXrvf14sPpcyiyYbvP47xQszlUcP04wEEWYYPljGUxFYYIS
	 PjwWcnvDJgBqdOxfOglf3+RByFBwsY+zTpkVhauwCnBYXs1Svj6XIpnyl02S+BLEnbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fA6u+QVA8/0SemoedM66rC+5XwKUxyIl8wzqUeav5gQ=;
	b=3D5SG6Of0JMclA+D8ruUXQGsePZPwJ6DcvWsDM0UgyMIoZE78E87MaAZ9mi4uSAgvsof
	 g9SCCbMvlMZwcvOWbiPsOLThBUojF+HudSNp7c0/vhyq4JfBCUwKMThPb0JTDJ40rubo1
	 e8618rugkqhELuiiiXtyOsGn8uWTypxLmYtyMkEpF9uM7xw4hlFJJWkbr12mnqywb3rPy
	 Q9G9u+KTHH9QFpj1kMefw4euq5aNvOsr8JfCNzWRjHSbBdkj9aPX0KrgextdHuS5Zc7qc
	 G9XAQgmQYEDnp+fr1AJepUf9vLm+rDqRGy6SXoZdYkA547YVN54WHPvKe2sWfFmUHZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qo0wi76P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDF3RvyD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD248606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD248606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qo0wi76P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDF3RvyD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWSMa1571649
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fA6u+QVA8/0SemoedM66rC+5
	XwKUxyIl8wzqUeav5gQ=; b=Qo0wi76PBV/zSvuiTffR46Yzio6ZDJLazQFgTw3e
	/q85hBR8O7RNKCoZI/XYjqyzoOtx0vX0zWlVfWQsAKAYhpgQKupVjm3lTSob7JjV
	NZu5w1jx8WCF+9jNUerBXfZKX9Y47ozSvWXIgoMRSa0cocT56OR7WMNVODjhJwQB
	wKkgLCenmrhTgj4gtpY0vQUJv21LWgpZLchSycR9IwYuWzYMJYrqKVKqydwhLDpR
	gMqDEi6Nosan3nj6QV43g7cPQDWHr7EuQtAxxsx6b8KCFzdAOtNb/qKDxcOJ9hQu
	IAbN+Ray95UIdp8AlI66brUUumSqd951AN4BurroPbLg0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h288pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:56:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso370696885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501003; x=1793105803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fA6u+QVA8/0SemoedM66rC+5XwKUxyIl8wzqUeav5gQ=;
        b=JDF3RvyDUrQDoQHzvWm/Kst+ARCq1JOnZYLim4bIn7wxJQmGq7HNF/q9tDKGWiHzbS
         TFtvsGSy7mWevHHRvGduuHSnUPlCBsqT+6BRY/6VvfoFz6gf21D0IgpQwqE9/hY0SQNX
         nq6hC01CVB1nCmE8YcI2O/i4Xzd9AlYCrwb/9UXm9dj0ltP0UYQKBp1W/7pn0nkpWZYA
         wyCkAqksxfEXtpo4g4qQFlpDH7a4eimQMc3lUPjv8Vo9l7FZu13fgoEb5+o0ggG+4ful
         rfIkvSLxP03poLX8IT1aGkTcHBkQrWmsN9VvHL6fW2hlYAn30KLpiyqV6TaWVD4pk+n3
         /shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501003; x=1793105803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fA6u+QVA8/0SemoedM66rC+5XwKUxyIl8wzqUeav5gQ=;
        b=pMfPPTFMcnlOD3BZjZ6oqcrPh8WULL8WZwa80TJHjMw2TRGbY3g055urOT6VwXsMuS
         V8Z7LraDnhgFpz9ujRBol0hqqMZAcIadDofFKPDxi1bzfVh0+9R/hojdcVqqaekhr7fY
         zzH/d37dvdQwpyva/AbByA3kDQ6ZQ0lVSzReH/+Nn3a+mkXm4h9HvdkBZEMzmCeiOOJs
         XIVXyQ66RKuSxoR+nZ+Yak76fnFoAelWvJ6w2yo5D80Wdn1zGdC2XScT53q+YdmjiCCA
         GGXpJzhzv65IG3o+OB2aX+F91Xe4qjkH3Q0VyROXMNUdmElgpKGmTZfnGe0OrF9WEzSO
         aQ5g==
X-Forwarded-Encrypted: i=1; AKwUvBysSAVtHDveG/xLuodraqe0JU3j4yh2Wndt5DRQod2Nw52xrUlSOuqX008Ec+OgTP7S1ZajLk05LyrabwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs0rJib6NHIJ1BmZRSPtFqQPuZc/wi36vovgDHYecrn/SpIXMA
	x2A84Na7zwfswePzki77k5BFuI7FkitKP2N6kXQEvBeDUOAmRkFJZsBljx7YCFy6++VCTxAIKur
	yYQNMEo0LKhoUAPisAJWKFJK25OdQOnL2Gbj9fck4+TLN4Ooc6oR2+yE/mnm+2hFdNag=
X-Gm-Gg: AYBFou2eKpBmeaC2NEA8DmJcZYidRhzA65YS1DO3RVuyXxR06lETvVeDmfmCJGnCTL0
	lfNcpuBnDhyhMUSyJD13hyXuSowOUAdu3Af7+TQrNf75W0UKafmg7fhxJRPS/Fp4emlcNLHIHab
	38ymQsWyv8wj69D4J0h1VKKwnNP2LlO3HLak2wHa+Mm2FBTL8Sq6GcIuATKSEAZx6m/hWJop5rZ
	lGIznhNf18Exoi2wpPt2OpCUi2DSacgBhR4DPckxe8vST9bvp+aFwyNRAjXaoS/N8XMcC9xKWF6
	hnhf2RCnyX13JSqNvuCPHM+5rHC9e8H7FUFJMWlihoaGbMuUOlubtcW34yG+fzXYaFcDQEVRDQA
	t3Vs3DLQWHbR/JhsU
X-Received: by 2002:a05:620a:7001:b0:93c:6fd4:467a with SMTP id af79cd13be357-93f29b8133amr1857052385a.2.1792501002899;
        Tue, 20 Oct 2026 05:56:42 -0700 (PDT)
X-Received: by 2002:a05:620a:7001:b0:93c:6fd4:467a with SMTP id af79cd13be357-93f29b8133amr1857047185a.2.1792501002172;
        Tue, 20 Oct 2026 05:56:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce325107sm297109145e9.3.2026.10.20.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:56:41 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:56:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
Message-ID: <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
 <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
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
In-Reply-To: <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
X-Proofpoint-GUID: ojVZzX1mkq0gUkUD76vhNG3zT8rrmfdd
X-Proofpoint-ORIG-GUID: ojVZzX1mkq0gUkUD76vhNG3zT8rrmfdd
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7650c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=MAucDEMgGkwSF4ccb9EA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX4cQogq/D9I8M
 z6dmjgZBV9tiFS0RwGX50+c+UN823SOq9+o455TjkzwDgdSllwgJAXDepQkHMErHcZZvePZcL9w
 a27niXJuJ3SGk1NNHIPCce0lUcrg6qY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX6mrVjFmXKfGL
 2YM0RRMiCRIXVfybyjvgiAiiaptgcXGaz5eujG1t/Q7w4m2tdBxL/BloPY8EFFO6uK0gBvkbePF
 56eVNTODtFnxq+oyhCpEvuHF1FdemjpU5Zf8BqLMU2f66uJ3Zw6Va2t4o2v6+jcurL1SiezldPq
 JR7U68E477Cj7FWBqisPlVtaGDds1JzXhAAc0ioVGvPKA4JKYtsXxeqhrJIFZ/awCMAyeFv2ie8
 slBDjm+Kq4wfkuQOVi6qaZ8EkADYMHzInYaCiXAl0hzKRspfOo0Mf2tmZ8zA7gf23gDGkK1UwQ8
 /PUKyNSsfwPb/uNhXhvJ582LuuMWO83bZ9AKlkeonaFztOBn6bQ5vKCUNgrNJxE6LAznYqnbmOL
 qxSF1rn8pg89/1DoyJWel7nNpeTNdXIGfCZb3RrU+aR4TqDCNB7veg0q8G9JTIvo2GWGZbETaFX
 /1Xl5BlXPYUey+sdNeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-19 20:03:47, Gaurav Kohli wrote:
> 
> 
> On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
> > On 9/25/26 12:24 PM, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 9/25/2026 3:13 PM, Abel Vesa wrote:
> > > > On 26-09-24 19:52:32, Gaurav Kohli wrote:
> > > > > Shikra firmware handles CPU thermal mitigation up to 117 C, while
> > > > > Linux CPU critical trips trigger at 115 C. This can shut the system
> > > > > down before firmware reaches the end of its mitigation range.
> > > > > 
> > > > > Drop the critical trips from the CPU thermal zones and leave the hot
> > > > > trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
> > > > 
> > > > I thought that was the whole point of having the critical trips set to
> > > > 115 C, so that the kernel can gracefully shut down before firmware cuts
> > > > it off.
> > > > 
> > > > What happens if CPU gets to 117 C and the critical trips are removed?
> > > > How will firmware thermal mitigation handle it?
> > > 
> > > Thanks Abel for review.
> > > 
> > > For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
> > 
> > Does the hardware mitigation just pull the plug, or does it signal
> > to the OS that it's about to? We absolutely need the OS to be aware,
> > so that e.g. the filesystem will be synced.
> 
> Thanks Konrad for the review.
> 
> The OS is not notified before the final HW shutdown at 120 C. There is also
> no useful margin for a Linux critical trip here, firmware/HW mitigation
> starts at 115/117 C and hw shutdown is at 120.
> 
> So 115 C overlaps with firmware mitigation, while placing it higher is
> too close to HW shutdown to be useful.

But having the 115 C one will allow the kernel to take all the necessary
steps to bring the system down gracefully, while relying solely on the
firmware will just kill the system before kernel can do anything.

I don't understand why you want to reach firmware/HW mitigation anyway.
