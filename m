Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308097;
	b=awJwJD8itsakIsbauPKL+N9FmHZU6AIwCzbUsX1AZNiZ8XDG0DBIQ6oq1xNTp1pBqfql
	 wXnGUziBGK8Ij+ko579TjdA2mqJVSgJ8KM1iLuOYqAo7wJrvKC/QuHcN8NieZ6OgO9kCW
	 dFasFTZwpCPOkV9lEvsvZ+sJwNGdXZaW37M4N/M1Gbhl8QlllCFHB+5V6Nf5Yl66QkBJD
	 c1ROfARDLl0uR4ipXjJLEguyTW2b1wGxQZtoOmcV+jxZ6ghSC2aEeCEfiUb9D58app4Hs
	 3qluCdyMXm1w8mWrNTf0mtljOTSHxnXHmh5E7zyXDaHEbF9IBiMnQwZSSsPBJXw487g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
	b=ddmn5UsIIxY0zGJ18qLWEljjNo68b98YNGVkLrvKN2evdorDQ1r9ReH7s/SCrhVMQFSU
	 PnleboSJuwjEoUe6VR4ttSTOv6mNLV0olFtaFqDl62EM7pxEn+YJI415mLmizR7P9/byg
	 rlhScIAdewD85E2TVgqWfNMFRliRF6F2yNVwfl9DCSCsS9TxBfDODrManxUHo1uPKaOaT
	 hrUsVmFRR7H48IPq3NsvCZX4z+i4chDwyjhHqWwpA3YgtG0TcR3wMMCE0xI0qYPFnB6Pc
	 UhKMhVc31eVRAENTJKWyOIbJ0X4TpdKCCajlxiupWNRWo23fHPOWs+ORUcVhjWCPRiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUkDTENG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nd6dJblK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2689C606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2689C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUkDTENG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nd6dJblK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8W6oO2833675
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=; b=mUkDTENGYogoUsvm
	c5dhKSLCd9QM91OJxfv7P/41BMyzplzxuqEIQ4Jwfu5jYTWHF7U1Al+4NPkDOMmz
	iga3w6m/DQz9x05Hu9jEWUPSVj0DQ+pww6XjtaK4BOzQJUUQzeMDbkvSWP1xCfQb
	0cmmsd+uwojsqcaxuywdQYFC3RKSaQSJySWIjUGOp0+hQz/+wGFAqiNu1IAv2scU
	DT56nbSTh7LM7nsybPDfJ7QOz1+gsMP0gKCTjtD8FAsMH8DKtMf/47ypSaKhclJ6
	Ld69AdFzgun8lHVDOU8Z/NTQ4NFao5unLvq/FfX3ryDlH1sx3lKBGP4vLqhuDSO1
	JmnEcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrghj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:54:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so1782164a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308096; cv=none;
        d=google.com; s=arc-20260327;
        b=SNR4K6Ih4gXoBH6/ikrJym8JE6d82f1tMsQME3JRWHpwVAcinOMJheowOt+vuaNUFf
         SrLJPEDa52+M4xgB0fs2iGQ4XmzeqrXVzTOHByiCQXOUG1LI1evROyYVHcLzGE/8vj7F
         COOuLCTZUsnTCpPMRrcU4wJHozglXeqjLTiq4LKzn2JEFV15TMcBXMt9wzAcUO9m7Ax7
         AfA5zziikWawOX0jgO73r/n/WNA8g/vRzo+GADEX0OFnaDfgjcKDnab0m8LlQ2owwmS9
         r0QAjI/IZYmA7f3BZuEX/gAg3+FeWmM6yhArBZytOA7m42CMrB6KiyT5Um2QmLg9Y6fX
         bVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        fh=fXJ7vUNoq+087q5VxxR8HKlLsR6kC5xg2evpjqidOz0=;
        b=Wc2S/+ZRNQ6a58KnNv85i0LT2c3mZ/6VmprLNpM2fYyp7ZKCjCZHcBgMnuMRQ75yqd
         KwlOoY1+pjwiEz7TJDrJWHYIr9Z2KNpJHgLuW98fUQ2ULVUBmf68l/wtB1pUcV2ZzrRA
         vd7VTA4c/stpmWY0HKPfheNMe1/x4tRmo1BN5Kn6NFJP6DwinO+fRAHKdS6FBTA9OV8L
         DUaBcEPYwmHkTFherRgtF001/ZLhk/VeA78ia4u8Xvbq52o5jaXrnSLAkB2JFtKpvaNf
         4+XhZSrez7eqV6Jwz1tmc12y6czwEfiNzlkOX+dOV40QU/bUz6OQu86r+2XC74wRe9gD
         wwjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308096; x=1794912896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        b=Nd6dJblK2RB6hH66SV2Yn7HFbHm3pb1QuCWCxo3+ez9AfAkCw3XtElPemwNcgSeVOy
         KYQZSjC6OlFn4s7Mvd65C13oCaWDYIAPwOkonXxQAtPz+wX9SVpUjonUL31pynfXfc3o
         EvJs0zZ9Vy+9LCrrKzbCmR1sXrLTjLZ0KhjA++NoWjoZufFAkBf6ZzY4v002Ko3ro+kN
         +hvMl2m8D7ww8u6g2UAplUBJOqtbApX26DXuA9mw2OixKPkl85dUGALYUnAPobwpraDA
         J9Up9pLiyjoxEXe5yPn1f82FMpCd7CHdtIIIS+qx/MQHb+g4JS9P5BYoIC7WSvOHIW3s
         wcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308096; x=1794912896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        b=VtjSd/F3OzMuk6NxkGir68U0VSPiVmTVwMgX2UUHF2CtOnI9f2WDnoV9O5Kjhr6bMn
         +GzGVixmx+4sjqlRoO51jMsZDL1eYgFhUJ3ZDiS+6RMKR2XapourFoc1A6JjbknmpcdZ
         jOy7dh7LTuN9bYdZm2dLi963WYEAnsRXIsyspV2/JxtR/3DqIZvIMUIKutm3kBEN/wg1
         JjGq2jpHeoIXENGAXWiatm4RslBN83vPjCX9ViyBjCqC/z/u8vhdS4NQasbCHCdn8PT/
         uRUcWPbQJ5x8ULcpaqOcT8ljPu2EkuLsy0evgtal5d3ZWZMFz3rXJ7yJkhxWezc+cBk8
         pbeg==
X-Forwarded-Encrypted: i=1; AL+hErHrwI6Lu6jWSGoTi+MJrT1JziykQh8DhMoIiAgIEhvLeeOj7JpJbEk1CpEvqXe95JrX+cSIz9hNumjYbEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UwVjSYxEWoRMGHSKB6t/h84mqNi14zxC36PJiU+Bd2S9801DT
	lxB1lDRk7gLAuucDZSb3S2T2PDludpL89eK4ew2NA6XHhrIKCqPoOk9oQCIVUpQD3zWcT/d3y13
	OkmVWhAABRS9PfuhwnKI93h7IVUo5pZ2P1/JG8S6+mZbQJjubhcgKvCvBOaMACnSl/FBAJxYu7o
	vodLdMXo67vWdB4rHa03+K6mVNpabfINz50vx/ZEu1MA==
X-Gm-Gg: AYBFou0RX3Sf1KvtTeqGXoEjzm/DWx2gyxiuCqWIXI5T/Ln17C6qPYDFvXbN6HhmID5
	o/LVpXsSEiPTpgxo+yR3JI3v5qv+d4xsjDOqCJ8ofAamm7tSMT0+X5VD48IQmuXIaSr/DYAZP0H
	pWDtRuJ4Z7Lv+9KHtoSYRM17WXP1wuQV/I8D0oAVm10rnV2SjAxv86LpC94Q==
X-Received: by 2002:a17:90a:e7d0:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b166a5fb0bmr2419116a91.0.1794308095869;
        Tue, 10 Nov 2026 02:54:55 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3a8:5fd6:cb6 with SMTP id
 98e67ed59e1d1-3b166a5fb0bmr2419092a91.0.1794308095395; Tue, 10 Nov 2026
 02:54:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com> <6777074.j6PcuT4dK6@diego>
In-Reply-To: <6777074.j6PcuT4dK6@diego>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:43 +0100
X-Gm-Features: AclHuK_tfQs_KED6YGEFdDQzYeq154VOUvxzh1aCGwTqlSdSoloobK9cAe7e-pc
Message-ID: <CAPx+jO_gRtipR7iuh0D7G2Wi25GZoqFD1JHVbJNmhd1UyC3Bmg@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de,
        ogabbay@kernel.org, zhangqing@rock-chips.com, royalnet026@gmail.com,
        abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
        sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
        chaoyi.chen@rock-chips.com, diederik@cknow-tech.com,
        alchark@flipper.net, leonard@lausen.nl, jeff.hugo@oss.qualcomm.com,
        rfoss@kernel.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: H2vVtJPjv-sNzYZ974BbHNEl0MssBsBQ
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2f800 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=HKy5YsogUvdA2KhsgGYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: H2vVtJPjv-sNzYZ974BbHNEl0MssBsBQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXzZo1vDWNAjm7
 sAj7gZBMPl5LISw4HKi/wcRhAtHUGl65D56aEqTlhDJ4NUNbf7hXMtlKtkqMmoHle5iyL+4NJg3
 u1TQoZ3ZF3qEes8LDPbtTaoia/RYIIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX7KJ2k8MkXVPc
 zdcL4dUn0P23Br7T8Ww3jy7YkQWLT6KPJfAlt9KSQ14tck4tmSocgNIEpG3JZRCQ+99Rc9Tlva4
 TWaWzlAGFHjW47neP/ZrwSCNhWkA8t3ArlBuVCwpJZcFIxapAPvE+L13vBeyYquCjyQjQl0xG90
 wTu/YIddw+1Pwuj7FX9nHJd62/3GjJIiUvC5t9ZGWMdvAFPN6lBIjfTV48jmskVV0LzDe1bymDj
 /tvCETOdvMvlEfDWJmUXgRbSYGCLYPtxnnPBnzj/qQaxisJoBKPg3kfimVyRDt9WFuAMPSCNB26
 Vah6m8BNiMj4hggtbroyJdMHgahlmPpbpzmuwIsdc4HLfjYfgydaJAXL64yr1DkfYkOTu5VdLvM
 wupw4QkeFf5z56gfyo79Bfzkumqdr65sD4c+SnNt//ytuz703J9LXzMU9jYimu2yJ5PZDwDP3++
 QvQpZIpW935mCxOac9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100043

On Tue, Nov 3, 2026 at 11:39=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hi Ulf,
>
> Am Sonntag, 1. November 2026, 09:22:52 Mitteleurop=C3=A4ische Normalzeit =
schrieb Jiaxing Hu:
> > Ulf offered to take 7, 9 and 10.
>
> I've now looked at the patches in question and they do look good to go.
> So it would be nice, if you could pick those up, when you have a minute :=
-)
>
> Thanks a lot
> Heiko
>
>

Patch 7, 9 and 10 applied for next, thanks!

Kind regards
Uffe
