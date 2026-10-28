Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209537;
	b=Rwci7mh/h8e8T8fODFEYzzr+6FL/aJVs9b15N/Bf+bslG19BL1q+Jd9E4hnAjEYIKQHr
	 CALnYrfaTrKQ9G9Y6JR+xH6aKGbEuuPXeImTLJWU/ZiRLqJucB4Eo7DIT3Thzdo+3jiWd
	 /2UzUyfDfjtgs3gyoEVm/vdjlzv95XaKj1LPSTB9eAOjD8UZkBUSDzblg+Q7y2AGGnL7o
	 he0wK4HftYPc7Fwbpj+g/2YUfVziQkFzmncKzgV6T5mYj0Lst7Glh41+eHT5LAa1CDVox
	 c0xqG5FVoW8DK+R3ylrorrbOhjPHU4zEJir1cdIf6CMlT5zRmvw/EPWjU8/Bl6v3taA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KF/Rc89LdTq3PibZB2FPeM3UBuCsxv4hiWwAReCHAJ0=;
	b=XhgfkJRK/qLCKfZXY2aEGUqQ9Z4T/WG+l8fzjsv/I9KCBXyRELDinu90NTuA0mVF79n3
	 2I2SMc6IW6uM2JzYkkHlU11AvnUWTwaaqj/o8r9bbNf7rlDx2ewI7pILONrC20Um60slD
	 vAEfyKcHzixTwKxhGlUG1kPCg2qPjtMaMOshRWDdCnbpEjkLmG7nnA4WuwU9OqZWD23Db
	 YR+s0sh0/RLeO3M5CP4FAtvjRDrSehP6ST7xazR0GTBqeDVHPc7YUVP7Nc7ZK44CUHr0I
	 RBRV1oNNYtAov+C+3u63OGGZGEMioqfrJPDV+oK8qYroqucTQ70QeWZTp7D6UV/0gyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzQAUgws;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=faxuhLVT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C6C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C6C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzQAUgws;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=faxuhLVT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SHaSnD1474527
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KF/Rc89LdTq
	3PibZB2FPeM3UBuCsxv4hiWwAReCHAJ0=; b=fzQAUgwsZXJhe6CvIVZRfjqsi29
	VSElBTbGsvZWRn2yOKofbTGJ1V/uRgv1Sz6dd3kDg95IaCjrCyTbPFJz7hHV87et
	gBL043Mmcpw9IHiGFH85WzM9fMhpdkFRDms2inV/ndT62dfQ6vvf1RdD2o593gUA
	dSUBdIWe07OFVV63TUl24gtLhk6nUXOLtUp8Owm8Dk+hCQpUoTSqHNzXFyfmyJ5v
	D9jxpTtjKUTxpiITjq+BlYWb/ekSMDhr3YQPBWOaoRNCy212vgc0FpkJ5SvrQ9rA
	P5o8dMdycX4R1gGh0d1ArvJqWGo3AZ7eECWbia2Jv9+X3U+Z7C2zCqoev2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkp816c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:45:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so199909985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793209530; x=1793814330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KF/Rc89LdTq3PibZB2FPeM3UBuCsxv4hiWwAReCHAJ0=;
        b=faxuhLVTaFebAWTwPNDmE6WcmuQAEKCJ3ngGsNGmOqWbkK819yUQR0njHTDltWNN2/
         DNcCgqcdMIHGh7cf+rB8fjWYdPFaQI30+0m+aLUgx4WR7xnFnvAt//RZv8/UvLj0/5eW
         46mqLI+MDunefO1D3po5hZrkfQo3BrJmWjSdzUzN8rqDzx1r4cLEXowo8reOSMDLnDQk
         BgefcTEKYd7ikULrsdXXQ8AIq+1OkbFGcYg4riZzF0uo+ismaCjRqh7jqkuv7sED73RS
         GWrK6vxy3vl9WesAaJkymmvYxY6NgHXWsynRJSp9R/EieB1okpbhOg97iA9IsOpxadwg
         XfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209530; x=1793814330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KF/Rc89LdTq3PibZB2FPeM3UBuCsxv4hiWwAReCHAJ0=;
        b=R0tm48uBHoF4XNRTVGPWczkrU98h/GHI13x3drIusGD9Z0nhIgWhGd6282THjaVJLN
         3Jvb5Qsi+haG1wp/0V8r8D1TAPoYDSQ5hBiKf6VTQpVcNgF/XBLo0nrfKPjXqDVx5OAI
         /HQk37FWYchIOLI2v6MrP9atOZfCGvJlfaJrqvjAINe6wpnufGp4tGBP4liZrqVaq3W9
         /FuEk9NQC2r286xzyUCS7XGu7P1+w65p4eAcqXXQd3BF/ad8DG2wCdvC7W1Y3DM2De7L
         x+D5bTsNOBZOXsSx+vG0NoQvot3eI1XOL05B+DvoseW4vP4BA8O/GOVgzxsBQFatwKEa
         fA7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGNcO4rKbiB41naO9ZqqKAytQJbK3CS3V8Atgofb6mXm41GmA2qxLoQ7xu7BI5bcjTjB/4YkNC+KiurjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO2+KuhbINKvz7/oqZMXfjT0NVsD87qk4VswqR4QIqNFgypqzb
	/as4oTpAI/5q3Pd6vRnMaEI9k8wGcaZ/4nCepCcVcuKBtRuhmMuwgHt8gVQ6FI7FyxA1PdBKaCI
	CdqR9AXu70RJlNxMk8jVy5nzWzIMjezPKHThY0ae/38tSZ48rpFxWzJMn6KnKtCvWSd0=
X-Gm-Gg: AYBFou32FfNeYCB9OLXjSca60oIm2/iT+lQOILyvRWjOqlw7RHOwRrz+xFiIhc43WIs
	IPcM2uss5+9kTQj4pXBmHYYsIfQxmPECJRiF64uPitLIkmp6GKVSCcR53Gr+kMEav1Ja1w57b09
	4p7eUKiMw0T02FHp/hLzOXALstOl+RjM0zvzMJ3yEyUMu0jn2BvajKwrbqX1nw+GgcQnBv2dKNc
	jgBUux4oRck4X9HxB+JVmcbjAipqqvpfRNQa7AHh2+O56DkYrGU/FceBV7dDtBFr64PQk2puque
	9eLdSIMpq5lsxEh3ZGM3Pl9aiF4h9qzkgRoX47oSa08xH8Eh0UnQXYVuPYXDFfwfgGhtopGy1jN
	sZ//gmvynCxSY9IOY4kbOeBaLo+BnMEiVlWZrHxtnMAE92L8Jy1RLai8BNw4ymGboWcEcYUP6KA
	==
X-Received: by 2002:a05:620a:2681:b0:93e:d364:c9fc with SMTP id af79cd13be357-9440896dc2fmr489030185a.5.1793209529633;
        Wed, 28 Oct 2026 10:45:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2681:b0:93e:d364:c9fc with SMTP id af79cd13be357-9440896dc2fmr489021085a.5.1793209528623;
        Wed, 28 Oct 2026 10:45:28 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm6842485e9.7.2026.10.28.10.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:45:27 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect cells
Date: Wed, 28 Oct 2026 19:45:23 +0200
Message-Id: <20261028174523.3514860-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com> <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com> <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za> <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com> <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje> <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae234ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=CBOP4jDC0s-gxYZSdkEA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8G64O4iH46p-8HJQ7zmDRkjRGdvt4VvO
X-Proofpoint-GUID: 8G64O4iH46p-8HJQ7zmDRkjRGdvt4VvO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3MCBTYWx0ZWRfX1N9H+i3qfg6Y
 6pZXI3Td2d0eGigkk1jljvnLjMC+zbnLIVySB5aICg2IBdhCHRynYLajgL5uvt5o76dK5ulAfMQ
 rpL4DubKJCKuTUxeCocLfsDjU0HaTe4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3MCBTYWx0ZWRfX4yVqE0WY+XqW
 41qkPEIHuU/n/nrKiQ6XYhwg2iJ6Vsexk0h9BEmvGs1GY5zYzkqnQrT5GV4EZJwKqADe1l/k/d7
 weKRB5IBeiDewM6qDxvvNIRyTjapnX/tQpG36CzHNW/zL6IIAm4+BqUUjuX6bkV1MlyXBt8xXqv
 FNtx4zb+NIc5WfYAGzlv6qTruI1HskM3otu/oBdiUcqi5pzYuvgKmUpl94a0H2DtXRPmDlIqDsJ
 QrEAMlHsaU7VssBH9vnDb9fm6vuNdllrldj9e296Xr4/gTiqGfFyQpANivOmFc+0E3c28xbY7m4
 z44tWI+Tns6RxLFRKIWeAEI4crlVVMLmsXdFiFzJtRmpvoTjNRPJxSeINRhRhwsdAHokOqybzc6
 mhy49CgJWg5oyu1HIEMyvWljaEvRPbclEiBSMuak+xFug3IoLl39QxePFyK1PxKGH/J4l659c0b
 O4NGPGlzPqbZCcxD/0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280070

On 10/20/2026 3:49 PM, Atanas Filipov wrote:
> On 10/20/2026 12:45 PM, Dmitry Baryshkov wrote:
>> 3. Add minimal VFE nodes and let camss use those. Converge towards the
>> split VFE (IFE) device tree.
>
> Agreed, I will take that up separately. To get it right the first
> time, could you clarify what "minimal" covers:

After going through the options discussed so far, I think the VFE
child nodes you suggested are the right approach for the per-VFE
votes. Below is a concrete proposal. It is separate from this series,
which stays limited to the icc-clk conversion as you asked.

Why a VFE node is needed, not only convenient:

 - The VFEs need independent votes for three things: their own clock
   rate, the MMCX level that rate requires, and their own bandwidth.
   OPP is per device, so this needs one device per VFE.
 - VFE and VFE Lite have different rate tables (on SM8250 vfe0/vfe1
   350-720 MHz, vfe_lite0/vfe_lite1 400/480 MHz). A single
   frequency-keyed OPP table in the CAMSS node cannot describe both.
 - Today nothing scales MMCX with the VFE rates: camcc only applies
   its fixed required-opps, and CAMSS sets no performance state.

Proposed minimal node, one per VFE, as a child of the camss node:

	camss: camss@ac6a000 {
		...
		vfe0: vfe-0 {
			compatible = "qcom,sm8250-vfe";
			clocks = <&camcc CAM_CC_IFE_0_CLK>;
			clock-names = "core";
			power-domains = <&camcc IFE_0_GDSC>,
					<&rpmhpd RPMHPD_MMCX>;
			power-domain-names = "ife", "mmcx";
			interconnects = <&mmss_noc MASTER_CAMNOC_HF 0
					 &mc_virt SLAVE_EBI_CH0 0>,
					<&camcc MASTER_CAMCC_CAMNOC_AXI
					 &camcc SLAVE_CAMCC_CAMNOC_AXI>;
			interconnect-names = "hf", "camnoc_axi";
			operating-points-v2 = <&vfe_opp_table>;
		};
		...
	};

 - Only what is needed for the votes moves: the core clock, the
   power domains, the OPP table with required-opps, and the
   interconnect paths. reg, interrupts and the remaining clocks stay
   in the camss node for now.
 - VFE and VFE Lite get separate compatibles and separate OPP tables;
   VFE nodes of the same kind share one table.
 - CAMSS populates the children and uses each child device for
   dev_pm_opp_set_rate() and its ICC path. The OPP core then sets the
   clock and the MMCX level, genpd takes the highest level across the
   VFEs and the other MMCX consumers, and the interconnect core
   aggregates the bandwidth with the other camera consumers.
 - Without the child nodes CAMSS keeps its current behaviour, so older
   DTs keep working.

Child nodes keep the camss node as the single entry point and keep
the change small for existing DTs. reg and interrupts are not needed
for the votes, so I would leave them in the camss node; moving them
would only make the child nodes look complete without changing what
the driver can do.

Does this match what you had in mind?

--
Best regards,
Atanas
