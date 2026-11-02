Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634623;
	b=gDmRRFYnNVtY/c7TA6OIZVlFHNn+yrhIMx8mkvWnza9P2VqTjB4s1T0xZbCIRe0Rx0J1
	 /LDnfjCj0tdZJutKyKZk9CGRK88zM6CXao2zYScOeLlWm9fHkzz/dOY4tpCPKsLaH3En1
	 rd6x0Tbtagj/u+xGsxeIgU+gXLafKrCgoAwRS1SucA/yn+W0fAjgbzChvee9qabw6oLN9
	 F60AlwRZ14S3MH/mfdMJFklKETckT9x1G4avp8cLgeC9o/o3alnRKbPz6p86rwyqrsB7n
	 GyoWqX1VxaiGBfwJDFzXy31LpMTOh0Oh0EcbjxZ4IRiQcv1az3MoW27ryZX0UHQu9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
	b=xQmnyYZGP76nopOvbp0pEAOKGZ6uW1+QjJZvxBGpz2Vadq6iQpmjccnlUR+keW4kSMvw
	 eg9a96evhQukgU2AVXBZEqPj7h2OfLco4N6mDODafYkDmWocHUwHNHZ+EIOBOF5osFVVJ
	 fhxO4Nj9vUigAYrP6ZelpRHQ562zclmrxDaq8vRdJrdnQRwSDSYw3pwZ918grW2hpjCf4
	 swiwcZKGv+iyMCiQj0OXKNHhfJs0oXHoRqdvA3C/suDkcxwJgHHFLKcZTYpnmdBylVzUk
	 lVz0WF5VnoV0COInJQj7Kx+8WPlJDnaTXsRq33OTclBHI1cJZ/eYjLIbnYiwe14z/+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwmcO+Nu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RoUPBwno;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DE86079A88
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5DE86079A88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwmcO+Nu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RoUPBwno
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRaT846152
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=; b=PwmcO+Nux2qBYjbp
	hj8NlyxjExt0jFuE55TaYYFpmctUOQ3Gz8Elzy3EPNk0+375HLoNDPE4P6jr/FpR
	bVI1Mf+pZQtOFZCJc4y/elaaelHmxNabH0qH9xUOjbtn4vqMPjPo4KzmKoL3jWmS
	FQlkJ4CdlOOQFee1l+OQXXQjvYqD4MoXEeC+Ub5VYJv62oDR2ao3pHG1ySvEsrod
	r2tkeWhKoz+68+2aax5sjk3Q5WOgv40mOkpD7KOieA9cKab30uyNV7mgYkGRHXSR
	+wqhihBqiq5nR/lprfMO0qkDzaOPBBLj+Yl/znn0cnmif54WozgHJ1s6nq3lpuSw
	j9qojQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tfb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:50:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so632535085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634621; x=1794239421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
        b=RoUPBwnoEkIwU+hVxw/bSvuADsgUOShgaXgFsCGyM7kpCb22VNRsjmzrDFsJ6cyu1B
         bbCqjVPdZGadLo3V28QxRSkKplpJIG4gbjW/tNiK95SM7m+33FddtPGR9Ma4ekIg6RXf
         IhwBms4W5V5c2PfRvtxwkme/5OiU3OWbXQR8PVEaJrjQo2kPM4NtGWh7weCIkNRe3ekK
         5d9bA7Ocnp9Gxy/OFYwsmhx4GOGNmtOZP1NV2TiDqxpPwJRU8BdV8ClXBln5TNFIYlk6
         9rZ3kqOKwaYISBfRu1Q6/M7ADu12epVhjkkkSrrZAEIOlUZeInDQ7RS1uONdWBVpL/q3
         cA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634621; x=1794239421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
        b=Umh6Pq6+r71M51Qu40h8PAFumpNuJTECsGoj3BiXLnD6MpBJui+eiN6QDcxZdAD+Ox
         3BJtj58OZxyw4wazH5Ka0ogqOZ0ltcIGopwI9/Js1rmyu6hxKlOnwggImCYHP2mraw+4
         H1hffXeoG4isycCqw9VE+2JhS0ArLNVEH5lxxWOtwjUsd6hZ57U1zSjyzh0YVTtHGi8t
         WX1vsIPp5l1pTekQkJi+OD21RMja3nTlVcXeDxSxPqhVNARTUZA9mo+AkUFuwiVDZsYn
         jM04xjarvr4/YTJGqMh9ZEyuJGOdJWT6xqT+kRW+T4njHaYGeLx7PqfuxCHaET/izk5R
         IoJA==
X-Forwarded-Encrypted: i=1; AKwUvBxO4f/mDehK7e46hoWD2GsmAKJRkByKhDH7Vf1vkKMxyXp6fugkPOMObEB3E6b9UFpRlTUboELmv8RCrS8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvvl9kYmY85TG+w+OuZgVRSKR5Ttdsbtu4+oI1Zgd2EklDKPJQ
	rFw4ArW+AelmZy52EE5Xkwo20GtmqO/iiH1APop9XhtC18lMCXFsjkkbCwyhi+YxZ7kl6ZUdT9k
	OgUjGYB05U438Itzo+I9cTSfL4sr6fhP78h4MP9RqnLqA6iPzUSIzl4m1xBLPnwqgPDI=
X-Gm-Gg: AYBFou1cFRZv/NC96lAGt/lj10ecW3WAGUUvp/rNIIyCOR/H9AvNluHBTWgSWO23hFz
	gVO5TTHuNJbQSfFVOw5viLu1UB3tnka4joLFdpIUEAO5fxskVpYG5WRGOaKqz6m5xSQaSN2j0i/
	8ukYQlXO9PDgTYZJnvzbFQe99+KEXjjjnLlcJLZzxrw96D8pWxqJL9YOF7QvDtlFnrv0qY656QR
	lSe0+vHgZccgDb31HDYjm8JTI9f/yHDS/8fEZryiqpS/JwxBHmwRmMITWTLFXVk3PUofuhm5aWk
	xXLqxGaw6mHOYv0SjdC27k8bAAWd4mdwDZW+YVsTz/V7BKn+p4gP6LRaAXvB1gv1AUZTPls+50w
	PP2V6oNadiKoSll2CVBfVWm1kmr5qk9x8+g+sXsmC0l4bEjcQgOeBz8J7530z3UtwHgQvFoq4Hd
	Xcfi/1wF7jTkHGiFV47LhOkWaOw2da27MvIhrCqtjVsFi+D6ym8m7mMQdimYiZ
X-Received: by 2002:a05:620a:371e:b0:943:ff70:dbeb with SMTP id af79cd13be357-94421618787mr1723020185a.17.1793634620918;
        Mon, 02 Nov 2026 07:50:20 -0800 (PST)
X-Received: by 2002:a05:620a:371e:b0:943:ff70:dbeb with SMTP id af79cd13be357-94421618787mr1723013985a.17.1793634620321;
        Mon, 02 Nov 2026 07:50:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0740475sm1825160e87.62.2026.11.02.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:50:19 -0800 (PST)
Date: Mon, 2 Nov 2026 17:50:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas =?utf-8?Q?M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Message-ID: <ppc7kbhduxhams2pg5eh47gy3pozcpxz2ewunrzehemh4ajqmo@ey4ek2i4jrub>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mNSAbdHEeyNEVCQvGpBAilat9DRjbqej
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8b13e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XXbD3vZemTXwHt2epcUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX5Pdrb2Xy0Ydn
 /e5WZclulV1AiMkmLEtU8RtSOkYFo2bTeb75P0+mb39TrrbP1mlhFF1ZUf5c0/mPr5YoHlSvijD
 byWnEWz4oAeWOkLximBOIsGM4HIjFSLz7M/6GClH+bJMfN0mbrisU+ggUDL2bY7R/t0XRZk3Ar+
 XRvS0Y+L1htTcrdgwI9jaK8de5EHvEsF7/h8qnVvAh2lftm3/ZazWKrEyufy+qjje5vcBXFFRc+
 /RcsCIAmyP7vKCd3vvxqBxwg/jrr7gQeWzmgSOq79e6Lo7rK+qWICq5ZKjoqSCD0fYkzRQqzLpx
 rsYcGza1dp1eSZgz2KunxYu+O0KNyPmC+9BL0ZKK+NRLi3aHdsnwXu5dsauSVo5Ai39NJMOYRR0
 5U3KKh7eKAO8vGut6o6b6KuGwXNY8TcWgE6pgcjF37cFPhM+JCf/jAV0oDO89cUsICP+TNImpqZ
 lRclERhcl1mMskTgCNw==
X-Proofpoint-GUID: mNSAbdHEeyNEVCQvGpBAilat9DRjbqej
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXwIPRk8eUDmrG
 FiLLAGV5bblK+pcm9Rz+G0rqUqQBWsCxBUvk39C0EsGmMEFcTIZ5vxlWJk0Gl6YLg9w3c5ljXVS
 i45QPx7yN0frtGRdc2NDMmL/JMR58iA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

On Mon, Nov 02, 2026 at 03:28:12PM +0100, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
> ---
> This depends on the Mahua GPU support series, specifically
> "drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
> Support GPU and GMU", which are not merged yet:
> https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/


With the dependency landing first:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
