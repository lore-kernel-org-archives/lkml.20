Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586885;
	b=Gt/SuIQG+5SqO1skLKglFQtbzH0BEDxnncJCWRxs4lETiyqwrlvK240CT38sUnjLWzkd
	 NEdfBfAw2333nmx4lDyEVSOmRNUtTsGhu33roFQannpnlKh1qcMph/jKshU6rWwyLYujz
	 L61b4/SWcQoS4MSmVlRA9ZzlCZaOKXgwyUmFwcjK6xYaeLivEbXHpRURgoaCa7kFdpgRF
	 oQ8ezTAk9ikQ6OSiF503TxoBb4fBpSln+jAglBV7PGUsooFoN5nH0wM8QiGeZ5XFG7Ve7
	 eVFfQMmpmD+0KpdBVxkaJ6SQFHDy+lZ7TQi4gKfygIeXIL5InsUUSySte1X0xarx3vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
	b=Nv1HlmCsYpdkC48+Jb0eg0GGgicpudGM32k7leBI+n9Bd+GD/f5Ia6JIK6MCGeH+MIyh
	 kmSNIydTYJ/MJ+aAyQaatwTq2YS+eJVN8T14N2LCJZg0P6+9PgqKaSpEBnsjcBOxagc/U
	 WiDTgrhk6dN602BZ4yWXd0i8DV2A2qZ2bDnAKZJoSRkX2F+9uwaQ8+n3IWbqdeYz3Yfun
	 dj9RfB6FAW+nGhPAggiq1eIbDAfXTq64ulGNEIaaShrN3R6rt9JtPbdsi3nEVcoszMOVy
	 0i8FoUMikKoErWErJIhsTrbTrKNrJw2+wzQ/vI95t2Dp/nVurd67vj0OQvxP447bpvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="p88/p0yH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNftdOWM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DCA606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DCA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p88/p0yH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNftdOWM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20V4Wj2317429
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 02:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pTNhaZslzEJDcamLWWGIWWaX
	hbibgaPik5sia++AYaI=; b=p88/p0yH/19nh878ew75k6VOBTAqMWiYwmjwMTWW
	JSKLLR/ZTr55p40J8FBULNc7ZVavSZOeA2RG133M5X9F6L4mC6rpZCKyxfrsMPo+
	gwE1OKaLXrwyHNrDNze8uCb8hRYk1dCwrqCeWTK/ntarEZr3FGFS8JybYxhw2NGC
	7KRDnc1Zin7l48Oyrq6uOCFkJC0Ge84XMcNPf0j613AALd8Ct577pAB0wfeiUG9H
	95MxXeX35+1+JvjT2O+vaEpLzSHMJoKokkaY80pdbknP+6OFAmGc2c9uCDavn2Q6
	KUSBft9X6N2xPTeMvbvnwE1HZ2P0ScOElt12vUf/jtLyuA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg200972-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:34:43 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ab289bb41eso1397260c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793586882; x=1794191682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
        b=TNftdOWMFA9ulB2ibvL2rljbJZu5u3b9Gz4dME7VgVkzw6NGWja4PVyhwNpz5xfY+Q
         WOeK+Cx3gxWXGFdH2gsFXyYjEK9gNSGNMhfKfwYYXbfg1CaeEbO7bhlvTtxvmHlvvUxd
         ZrSugbIHUY5It6MmHluV1NSww/KMUJtOY6GXnV8WEAWfhidqAgDsgISd+H7xbGtyJGK0
         9oq7sjAms64w0iPWxtp/rI15gqMg5V8u3JznhZ/WZaHvTT1eypkfHx/sAqQrDWQ4xt01
         RHG5GUhgIYfv6r81hbHcr8NAOleP96zjfmxv75KKYAoEO8X8FklNb30LYJl6Hrf5scB2
         v9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586882; x=1794191682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
        b=n9S5OZzAN8kIM9R6ip9Mw7w8MUGwedJNfDZx8xkKaTFLVSNUuxMlXu9zKtZrxRcX9C
         6AxM5GJoBcZkEBMhlf0WubmqWUAm2hIP5WB2rXtqOw/VdF8pPgra+ikAvfLUk0E0SlXQ
         +OwE99E0tgTd9oK1ZC5AhzspPEheFe/4u32yyrgdWY6JnmdMG53Rd0q6ao/mj8BNHOh8
         Z+/R1CXO9KQhydJSKCope4oWqNp01zmS0l2CHmNkTBjmofWDIa+bmn3rSRDU6ubjOW0c
         uF3aaz/axmHsGCLg3hbgvIlhPciYRr3hQ6xw4enNlQHKxUn73pDG9RGT7+gvZStqBRHm
         Jd+w==
X-Forwarded-Encrypted: i=1; AKwUvByQH8dowPK7Tyqa/EsAsDocf7wO3OFYeAM5v5a/mARtapH6+w7BjEmkVYYzYrmqkMGLEjBqJEOpDA7vUu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa5lzP138gHfJQRG5yQwEzPkmj1uOGodUsSP6Ed1wbx6g4fpdJ
	1qfGFTchuqz8knoJx2wUb5EKFGdngaupFlpQ/tXtKlinwMXb7Us8F5WuUYAGG3uPSMsfpR2kOU4
	Y85wy1iM39k+4ktbV+anM/QUf1xJkJKCZFFb0FQqlCbyGhIxfoBeqBKsSRL1T7EYVHII=
X-Gm-Gg: AYBFou32DHIAODmbvNqxNi0Kl/fJaOTC6QEBKSXAsb0eOD2AQdjCfERlejQkEM1/D7+
	jsKyUgovruENJ9ydQVzPLppo9WMuX9enRRbqqyJTezW7hlBs1X3AnFLnH5nJr606oRXQRY8cS27
	/U1wJ5LIO3C4qkjH+2yzvFhtPSRxd/mDMwjMVnQwZGC0JdE6LynqohFFhoatzB8vkpu2HdrV3Vg
	v0uBvmo3t06jYp+qoNzb7AKPk5Nt7hwwMGIujV02dDEhNrMbDk2LVY2t4l4D/8zDDp4RwDC0g69
	2/3D4XAh3hyroEMUjShbQJ1ZjC+2RV6oi86TQMJMJByNUIaDM4INsAozMScaAL+nyeLWxa1O8DF
	AJbfZylNBb1XFI8BOwH9iRcB2vxgtuHgdr7lPlUE524Jny1Y4ypEzZPfKmmKTBJEFNFGqz7JNAD
	FC+n3k94NYBsNDLw==
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr13780692c88.11.1793586882307;
        Sun, 01 Nov 2026 18:34:42 -0800 (PST)
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr13780655c88.11.1793586881735;
        Sun, 01 Nov 2026 18:34:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm28674816c88.14.2026.11.01.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:34:41 -0800 (PST)
Date: Mon, 2 Nov 2026 10:34:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <auf2vF7MRgWDCk93@QCOM-aGQu4IUr3Y>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
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
In-Reply-To: <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Proofpoint-GUID: iC1EK3m7BCWvpL4c6N4qx0ON7KZrGj3o
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae7f6c3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qMigHBYzDqo8UOFGUZcA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: iC1EK3m7BCWvpL4c6N4qx0ON7KZrGj3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX8YW3DA7rDJh8
 q/u1Pz3YWFCgL8w7qKGv6K8tXMj0j60WN0zFbHm0wmGY6AZNt9KbKtE7imKyrx/yxHLHzmaLmK4
 3XI5cqRBYn6jLUTmqNECaFvC2P43oP1VJk/4l9ZMu5RbCaCB8gAY8QZF2ss2/ABl7hbbG8rKJ/x
 s+oLBuNspjwbfxPxediBsxptu+F+T0lV8i88JayEN0+y6B8bL7y9fl2nZDxmHeZQh878ZDe+w80
 Ww4XYyLeS1H5F4nGfl09E9i7mcAETcdGYGuFuwNuewVVBQsZ0rJlfHXtojxtDtNgpfFCWTV1OZo
 df/Z9+ZTeBz9Wpq1EjaLrkbkG/ZcW0/r6kCjCYt20L5/uVk7vGOn+r40IEXLULzDBfVjJffbQKu
 +glQm0hHCeqB4wgHGILp8rBO8JrK1Twq2WyLzPxHnw+E0TKzvSlZqPIbyq977YHSb6RssqPm1RS
 e1bOHy3stYG/wqvVqGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX57l7trJL+vgX
 A62oCylhwyzqTNFBqZkfCNZyElPdZ+6EihEyudLpT0FeXIEOhQh5EoAH6KKkqHu/Kj5FY7lqRuZ
 dI6Rzm4L8rXaw35JNj/1e222TPuv6S8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020009

On Fri, Oct 30, 2026 at 10:28:21AM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2026 at 11:01:03PM +0800, Shawn Guo wrote:
> > From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > 
> > PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> > expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> > AMUX thermistor pins are wired up, so none of the board thermistor
> > rails feed the thermal framework.
> > 
> > Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> > Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> > instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> > pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> > thermistors, so add only these 3 channels.
> > 
> > Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
> > a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
> > and a per-channel thermal-zone for each, following the existing
> > Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
> > ADC channel.
> > 
> > Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> ...
> 
> > +
> >  		pmau0102_f_thermal: pmau0102-f-thermal {
> >  			polling-delay-passive = <100>;
> >  			thermal-sensors = <&pmau0102_f_mbg_temp>;
> > @@ -501,6 +545,42 @@ trip0 {
> >  			};
> >  		};
> >  
> > +		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {
> 
> Existing thermal zone nodes use the "pmau0102" prefix.

Indeed! I will update to to be consistent.

> With that:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks Bartosz!

Shawn
