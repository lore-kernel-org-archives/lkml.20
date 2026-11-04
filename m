Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822184;
	b=KQ2s4GE+XqoctcrhQ2G45Y+dOBO6YvSYm2XtSe1DKqfElJq8i8x8ora3GKG18ZIReO8J
	 NvVqQ7f91zN0VDMduA0WjJGPa7z06SaRBEV5TIrMOIaY/hC0DV49gxo3Vo/c8zPQOx0oy
	 e/OO/m/AfWcUwo0nIj1Fboh6dGKMTjuHGpmwUqAp9IZAUpMDHcII9Pm+2TmD8kG+hpSYT
	 b9p3GScRJ7lMZn/8Z517yEF4eR+vKe8zqI2VDT17QtVfdbtFDc86K4ORoFBjZm7AcDgho
	 j6q0YbytGuzVJR9cytENKHdco7LQ0QQ0p6I7MJ5oOR5YZ8VZgx5LCl8WlaYiqsNmKBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
	b=DxYg1J1S8WuWGq3QDmz4Z1/elL7CKP8O2nwSw+EKwk3fqo+nEqN46+BpTMJhP2TBqayt
	 P+4cEDmNPhfQDQACwPvcOcnwGkfc8/2t/TO0X+u8xApgtBck35YR0gKgWD4AJ8tWqCZQM
	 24sMeMLCsnF6PQXJojJZiUEwqsAQvetsu4S0OEGbAz0PSDU3XSGmcY6z7AoLzuAsMN7+N
	 ZI01g7LyNQ5VX5NV2PcyLUJbHhX4ZTPU1vjyduhDnpHMa5ARozsNarK5rM6moe5a1DTz2
	 6ko2ZBa3kez1p9m578hmRMyGNJokxrMjJiB/wBBzHosvLhqLDpMw2TH24gtLZgpotjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c135YuXN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YH7OPnga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71084609C5B3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71084609C5B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c135YuXN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YH7OPnga
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FitDP2210764
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 19:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=; b=c135YuXNvYw5b7BG
	fVpcjq7l4pnnMIm1qG2GHUJgCNnlfn8jgwbzvgnRYJPp2KAFBemfPZxq2QR18xkT
	0ty13cOiwNnHBANVNz+7DFgKWTNu6waSuk3O+FRzPab8LVWh9uJB092CYHSObM6f
	O9fh+BI4vQ/HGdk4IEr5EwS/pQ9e2D/RdFqG/w8pVdW8sXvMR5PivO5aKBxvUWMa
	qVnau7cRVYvhT2zQOaZMsQCrnGvMgkBiRLeCYvYexLRKu6tx4XMO1t40H46DhCgf
	9fs+ZxOvTPSV1gDMXEF9HY+NLzQIn8htO8rh8DpFQCZrRnNy4hQH3sXhszpcY2Iq
	/wjQvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdsehv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:56:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9440b27c1feso234056585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793822183; cv=none;
        d=google.com; s=arc-20260327;
        b=b0f1JJEBXAJmbdD/Q1eAzrrFFhUCv0c3Aj0fuLC9THyZT4ZHyJ4NekUPrPOlkDb6no
         NxHEdbUe+9qZqd7msx03mZ3zDrRROeKNDLYW2GTIDVNI4DrxEAUNYN/L6PGx4nLBICnl
         +jr9ltfsnr2AVuFh2BlDuRPM5Q2Hg+dwzyYOENrJ523CMSpcA7miVD8RuXnmBuG47q0e
         7VCggNpBKrS/rdx/hYpdMfPB1wgyjqj11oXzDahCkV07AABEmkaVZgufaettEEVZ4Dyq
         +qZMYNfzdd7wKzaSve/fHAGFFSO9mX6xFPD7Wq/Kupj+4Op92jLVZcupTaEvUBleBwOA
         w4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        fh=iv3fJQxPKHFywD6SzF6mY+I6DzRyesKfl3j3+A36rBA=;
        b=WKJHNkGOVOMoPPerzwx58QH7ee41gB+oUWkZWIrz049BdopXFfkMdMEbv58/+JWPt1
         LQNQkh8qlG0JTmf/i7LDxZct1D1Acl0b5Sw4i7cMKSGCj4hI/Z8KYl+uBMIfpoLYpZNC
         OlCNjKe8f5F0ZYc8MDVt3mB/szPKY8IHV5+eT9epzed66gSsxAgKXRP8xQdO5AAtswfa
         IhqwMuF2GaHW11nFw8wjkYIjcYHMTjbW59p4GknB2DevZll+HlCJ3gbIQnPwyPazRuY3
         Q63VOXzKuMYbvRDVJbP0/UjownJRxgf78QrmSI3PmyorqPHErq03ybGjSM3POMRcqkMJ
         Sklg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793822183; x=1794426983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        b=YH7OPngaVk6SQmUypSZsy8cTcsBVcv6/0F+Y1qOggD6P7sDKHaQwmYHcpJsSLS6B+S
         /x6iwZQ6WJPLvVdV1K5nmjzSy59o4l6Z+fSn4ctP+LE5zMhnta+Gk4J8MZekBFPfpgET
         pKKVdnIckpIKIth/Ai/BEEWr1yjREbVVFh/r/DTxJ2shro5RJshKgCQ58n7m3usBxW4g
         xXSVCuss8z17vtVTPQdpJvD6oxNrnIuiKxyK0iC2DYD4mNqu8otXbOkrqje/iCG4pZTT
         m++NNVYfPGtiqLw1ST9eP10WZUtQCozTYApJHwXP65nZ3d1zYHW1PPnZLTCx/No5xU3y
         EYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822183; x=1794426983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        b=QkdwPpfbQ9iXjtTroO05lSib1FURKn6ID2v9VSsuXT0H+mV13PVqXWODwrZpH7YFz9
         SXxSV9o6w6TR4SJl6vn2tBy8gWpLwmGSJ2zSXbrjaUJg2yzU9vrpm8kDOXc4UtkxAsJ9
         BALQ86uVJtwwXAkB37L+SUstpiqI2UtGptoMKAz+jg/gwkHJ0WQs0WmId4/kjm+xtx5J
         pZaYcjkF3PhleVIo7PcRFaAjFLnfgr3WNQBRuostlKAv46uUsQvpbuihFPZNebf3MCEe
         xx1il/Ks8qW/E+RIQYD8eYYfMnT+MXKNSFjdLVFW1Z5MzIUX9fISdFkMMmnSSsQqnD6H
         zdLA==
X-Forwarded-Encrypted: i=1; AKwUvBzi5/HEW7UDxwT/P37jE4OpSSeQAvT0nMuDZQNtdhxDU0oj1EltdFU6ST0iCjqA/OsZVfdxwPy6sUrTsgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9526nAueWxIrRDcgx1UVTb9LClFmKGU58EXAZqwLa6T5Z08yXK
	QYNoFfcualejszkYMKfxBQOig7jbigKU3UHA1v8bSkzxgeacHqV4VldDtgDmeZm/N197IRuD5MV
	3GjVRbbV+bIrsHKUmCQmiEOgqNwMap3d3AZIyInCkx+/UyW3MNVNSCMKCxfar8ovUzhqFot0ibO
	Nm5ljPy0NPAVu6DjS4qkyafBnGUClobLe0hL4z5KuKCQ==
X-Gm-Gg: AYBFou3d1IAfbafOCToPww9/KZUh7PN+dvKoKOOAHz3jtRC3be30JKMZ6b3pH0cpEtp
	ZjfS1dLIpxjphxTWRv4lAhDe9sitYZRkavCZGn2kGosIc6+tvTrHaN4K1f+/javqqtRq1Q3izks
	msPSosaLdpCqFBfvOGzqLrlxjk2GXlK3em0NTyPr97t0XyJRLj4mj1Wja/RYI2So4VLfXw4XQBd
	5aReKfj2KhypWW6Dm120G6ZAjWAURw2bnmz/+c/BlBVA01aAEPARWOqVY0Sj3iXipa1C3e6Lm5O
	N9c9ZP5d273XcMaqP5wvuf/uTSl3
X-Received: by 2002:a05:620a:468a:b0:93f:17e6:6ee2 with SMTP id af79cd13be357-94421585e5bmr2998716085a.6.1793822182604;
        Wed, 04 Nov 2026 11:56:22 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:93f:17e6:6ee2 with SMTP id
 af79cd13be357-94421585e5bmr2998710085a.6.1793822182093; Wed, 04 Nov 2026
 11:56:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org> <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org> <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
 <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com> <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
In-Reply-To: <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 20:56:10 +0100
X-Gm-Features: AclHuK9iS-SlJNui77YNFKE0lYus5bUHSbzooakg4b1KhZgza0So8ebhpAkDmh8
Message-ID: <CAFEp6-0O3PyyytNvAUdvMRaMR3Q1Acb7KZmJmDT2J-gVfjYbsA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX3ttWCC/19Vy+
 9OT4HkMVapaLihaQ3mOvknbVG4yEvWCidpPeZvIj17V8MkL2ggnPR8amf9UChdDxRrupDIbirIH
 QkdrjzX9vkD0ThxySfMv8Mk5ayouvew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX345DNM/rD7Sm
 TeCw3C1Xmw324LuA5NjPssVswV/qO8ueb/RF//gXlOLCfev/TKrbrNxRCLc23y6ugkjha5ni2sf
 IYWe7ulKgx8vKtjDhWlpIuLCEV+YDOoG4Y+gBYFJgEDvOUHmjqCZs/yJ+Xx7gwwwpatpUwUxY5O
 7PcYBdtiVruxAk5btkRfk3yWBZSlFFlJNxiqpsX49Rl6Qvjqe52yqOH3/daewH4hJdQ9thwIDrw
 Pd2QzLfOBttiWcMpo61wQl6Ggf/4Fe+B6+JuhUJuPoDDzRUzQwJMxnJznooe0epY8FAmkV0+FEw
 A+35UpZxzTjg3E4MXUirSnDF1rhDVoL2y/ImTSFcfmBJ5KGiDfpFzRvj6X4jf1SDqh/azbDVLNJ
 OeimfqvuGrGbIMpvMBcaDayvH9QGojwTLPhCQ1ZQbxtSNF/HUfmEPQkmV3iviJ1pA50rGxFGYV8
 bCh9uE+Yz0Wx97cII1g==
X-Proofpoint-ORIG-GUID: DmaZIEN53wyOHfAtFMqCPty8ZbZ4yFmt
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb8de7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=oDkJ1FRbrV4SKMjXgYUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DmaZIEN53wyOHfAtFMqCPty8ZbZ4yFmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040079

On Wed, Nov 4, 2026 at 5:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/11/2026 16:11, Loic Poulain wrote:
> >>> We have a series from Antans to address this though.
> >>>
> >>> We should list the clocks the SoC supports not constrain that list fo=
r
> >>> one specific sensor on a test-case.
> >>>
> >>> ---
> >>> bod
> >> Good to know that Antans has a series addressing this. I agree that we
> >> should list all the clock rates supported by the SoC rather than
> >> constraining them for a specific sensor.
> >>
> >> One additional concern: if the clock selection logic still always pick=
s
> >> freq[0], listing a lower rate first could leave CAMSS unable to work
> >> properly with sensors that need higher bandwidth.
> >>
> >> Could you please share the link to the series? I'll rebase the next
> >> revision on top of it.
> > I don't think Atanas' series targets the CSID clocks, only the VFE
> > clocks. Ideally, we should make similar changes for the CSID clocks as
> > well, but for now they are not being considered here.
> >
> > Perhaps add a few comments documenting the supported rates and use a
> > single rate for the time being. Once the CSID clock changes land, we
> > should be able to revisit and adapt this accordingly?
>
> Its the same principle though.
>
> I don't think there's a valid case to exclude clock-rates purely because
> one sensor requires the higher rate and we aren't willing to do the work
> to make the clocks smarter.

Ok, fair enough.

Nihal, feel free to test & pick the following CSID clock scaling
support in your series, and add all the supported rates:
https://github.com/loicpoulain/linux/commit/a02dad23d219de1daa53e4095eb5289=
e5b5a6a15

Regards,
Loic
