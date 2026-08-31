Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB73C197C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159677; cv=pass; b=J/XBAINXC91fgWE/rKFV7qgNMDDoxNcU1MQwNVUa7vGBkM1r+2llBzUiRtbATZawcVTEXiUhKJmoAVQ9hl0yDuFeK8qTzy7EiKQTWvx2blllJ5LbQXUpIfCX8eAFMsrPEUOXtui9OWLoiDCK0EPGA1L8uBGugOEUpc+AtGS6y+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159677; c=relaxed/simple;
	bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlFRqrkfrLudWeQdRCiFU7PBpk0ESZ6gqF6jPxHGd1PHNlvC8s4FX0Jgj5Cnbm5uNBM4095P1be+KFWlUNFWhKPhJrUR+vgfL+HtHEnhj9k5VvnDdfuGjULW9WmWjw7YvimbFWNOuQw+W3FTGGPth2qjZIyYM7B/nN0zJh5D9pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADbV7gF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBaGzU0B; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADbV7gF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBaGzU0B"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52xpa2018332
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=; b=ADbV7gF0JLvS8Cfm
	MbksJgGLNSKI3xxGjotgVWvM+q8epb467QICaXLotIyYrv99Y1alK1gSWrH+9s5l
	/90iasfhS4zbr2buBXBnrfuEoH4lc1q3SH2YOMpoMSwXt54vqyMuRnlsEXfhPKTy
	AFhGjQqBwz/kXLuZ1Yq+kDsC2rK9QdcF2UR4E2+7GnoV4iVec6OORZn6kNYOjTA/
	3swAnPDtX1XRJvyA2wVQgMRrgxZkWbF7q+tduldnVPLuaoLSNKICnOvNRLEIgzqe
	l2zgAqscYDB5+5MR6bNgxfSWqkPokSfcMB/mwoTRoNqAZgO9ak6S6NXnC7srbmHJ
	47yNbQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6n1a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:01:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso5214155a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788159674; cv=none;
        d=google.com; s=arc-20260327;
        b=iYLraVO8j0eAg9GA3EfsHj4PSMxgPW4GLLyN0jZ1YDY05YAUfk2SuJhTqM0X+UpZ9X
         j5+2rPzDybGAc60VnsJH969Eebqacb/C+sZmhR7ebe1HfV8uI+5Olr9f1jvDM+GuERHn
         pbr7TErv8vG+8jWc3ue9K4X+Tc6aZVAfATZAZFwgjtJA0UfQf5RyZBbsk6q27EYu8auW
         vSz+kP1F2BUeLkprqOIq3RMQsOaydGEuHuHklNOh9mpo47aY5s79tNeJtlMEDGJGL35B
         Ukei7FHX6E72dksPb9jfTvZuzYK+wJ/heS3ZrEZTGFjUIcVslUmASgmQ0kbbVgXvqR/6
         o3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        fh=Lq81J9cjmwgYTM4QByCjkKMTk8P9KLk6kgnfQUVxP0o=;
        b=ANP225NZNQpEeCadbyxNjYz/kb0BDTBTi1oediOK4ZBQAVa+ct78CrBvLFjLb49xQb
         gdR9l1QKbMZ28XL9JmV3gC4UAu1HEqHbiBvjOhga/bZnt6mnAskNmlToB5BAw9c14JMO
         pT+Nx8gyvb05EiM18p2ylJDKFV/o+QCP50bS1N6noU6BBQtx5CAarehv395s6EA2vkKS
         QSplo0GPxQ/TTqLiSPRnEOW9zwIBp5RcpYtMNoXeIUSWvtnkVz+ntkd2xQ78UIAsCuhS
         hP//tZkwXlMq5qSCP/k7tB3bdHFF5XMSWbisj+Sfk9WcMVJkJ/W7Qt7bwTQKJvtb6mdI
         swBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788159674; x=1788764474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        b=KBaGzU0BYxRS1Jzcn18f9TvHtYXtDbrs3Axxmy222bTtUT88NS56zc52f2qFltqYCb
         NpNcDuE7hMty1Y5j376RR80THwZ+g4L9onCjz2I940/vtJXNDosyXgrmt8ZfD1jpx5jl
         eAzzXw4ngA+vy7q4uYRRuH6oPjmpEF+EWo7vtTsw2VPAzskm/5YsB3a/Bmnoh/3Xvizy
         W5YemtZDRVcMOK0aCAhaqvSq70KN5tkmsSc7Ia94KOLDfBwC4NdfNvYhgNof+ww8Kn7t
         DidG5KhmnDwbpmmYkSYtRCOEqMqpDRyqjmbCsHi0VnLsOuKsYpp4UOKQl5TFr8h/TvBJ
         PnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788159674; x=1788764474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        b=UJwUoAzGjytL8kpByvoa/CJSpoq8/ZjST73d9QXrUIXrQKLVTFyF3ccLulcUPlGgeJ
         OL/+DlJTf8B1FKEcPwqomLCX99K5zoNa/rW0bPWr88mE5qlcDcimvj4aKlGJLyYcRrof
         kpy48OjNgmC6TTrLBmQyS1V0p7AiwyJEQB0DmYGwvogX4wJ+BIHI0zSb3A4baL6Wm2aR
         3T0F5y4mkXkfmlS/gRZnQQl7KPeubkLxcB66wNMhz8YHrMnUwim146Sa8HYmu4hyqDeS
         jYtA9lvkJCGLEm8O9SGz8+Otayi8aEXWROESfxLUFwnQ0f2zlHSFBbng3M6R733hvC/s
         HX5A==
X-Forwarded-Encrypted: i=1; AKwUvBzibjTLWY2YQp5oBls2cT5+8YFDsuedFXvjiMYUQ5K6uT8c4fS2p4INX6RcjcXjY/r2qgYL4RNLVQouJuk=@vger.kernel.org
X-Gm-Message-State: AFuF++mZnxf6b8WqbuBS2A80UoPBIZNEcBwTeoLG7Y296pPEA/gRp1U8
	ePilz7Rq4lPVPBNX4v4/ZP/6QNWTMeYlD1gH41S+IZBmkhUX220vtkbMIBb5E7NY3HCTvL3S3ZX
	vzI5SB2Hg294UklmLRnfzyfl/EOuTg8VGuMN0UdOQ8hdGERe76aDnAHv+PMi5Bvd5Uhxw6hxGbd
	p+boFyeiopLnc09Ab/alpoUXG2GQctyut+oUrwurSjQA==
X-Gm-Gg: AYBFou3xnVM3r8TKZ+SlCDGifoJohYY/BVph16yJDgGaslXtapgwp9YHKAiQV2IArat
	T+X5KuPRHCkrehc2sr0vO4vwz2CYMgjWlWyivdXldlp39/rX4UdpWeiuMVFq27yH0AR9nkknAU1
	z59v6e6etKhvZMrIdiQFWcMQjcb/ZWuAYXiK2r1NZW8W9baH73woE2sZSzQSQ=
X-Received: by 2002:a17:90b:4acf:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-398b17b3dd4mr17738448a91.4.1788159674119;
        Mon, 31 Aug 2026 00:01:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4acf:b0:398:b17b:3bd2 with SMTP id
 98e67ed59e1d1-398b17b3dd4mr17738374a91.4.1788159673614; Mon, 31 Aug 2026
 00:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
 <20260818-hunger-module-a44d9716010d@spud> <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>
 <20260825-mahogany-reminder-e22b34a405ea@spud>
In-Reply-To: <20260825-mahogany-reminder-e22b34a405ea@spud>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:31:01 +0530
X-Gm-Features: AcwNN1XDZ4A5hLcyFgra6kVvN3M13-5kLgxPTlWatkTDhr3XPE_BrCOk6BTaEa8
Message-ID: <CAHuiULCeHydeg2e8vreq8xHcrfH8ium+jG2k6xEwWX0UEp+8zA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: bm76zORdhfDMZ2TvqafDIpUaX3uC8zfw
X-Proofpoint-GUID: bm76zORdhfDMZ2TvqafDIpUaX3uC8zfw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OCBTYWx0ZWRfX7y0jO7VgTg4p
 ZW7corX5uC/akl+btVevOZunNLlUtGK4E3v3yX8KjrCD8OEkZ0lP0tC73GdMB3B7U8xUXASbZKr
 9Qb0fjEdUZ/VKJ3CPJXi8ldWoTJdT2nnAiN0I7hcJAidkLcXkVxTpbIJIcLWkzlLQU87WntGrRC
 TaHv1ISOhzTA0g+7jC2hWERHKKcV3vda4LJMSz74UXE7UlU7g//rC1x/ClwCJJWDFclsfvBvajJ
 ymJMtsJ5rQjtu1QGoowyQFl83G94LEAsU63eElaYU1zmiUdY3o+CNxyzHDDjhFb0lIV6mi6Za3X
 D+VfcOC8jYcCNo/O7p4JM4gf21TQ/VPsiGFfKmBre+dfXZh3F8xsF8w+wIR8sFhOfJgRMcqADKa
 RPifqDHlVTFN3dWgQ9xGTxRx9TdvMWHZbxlN9zP6RdGZpMDsEWCXSOjpUk/vqBjbErWgXgvJJQj
 3c54DwY3WF5jiaju3qA==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a9526bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=37CK-rImlAPP-qB_EOAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OCBTYWx0ZWRfX6ncIzgQoVWg+
 xjof/d3VeWSQINbn0fi+K5acS1Rlgqf2ZVz3HfhY4wn/fysRLAW0Pu82A4QMozfwZ2q/EKQeid5
 b0rSqfa1U0zspmrGnxO+I6HqKwmTcVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310058

On Tue, Aug 25, 2026 at 10:12=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Aug 25, 2026 at 06:46:39PM +0530, Mayuresh Chitale wrote:
> > On Tue, Aug 18, 2026 at 3:05=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Mon, Aug 17, 2026 at 09:32:17PM +0530, Mayuresh Chitale wrote:
> > > > Document the RISC-V Performance Event Sampling extensions Sspesa
> > > > (Precise Event Sample Attribution) and Ssplcofi (Precise Local Coun=
ter
> > > > Overflow Interrupt) in the ISA extensions binding.
> > > >
> > > > Add a dependency rule requiring Sspesa to be present whenever Ssplc=
ofi
> > > > is present.
> > > >
> > > > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > >
> > > Why is this series RFC?
> > It's because the spec is still in draft stage and also the register
> > addresses have yet to be assigned.
>
> If you send more RFC revisions, please include this explanation.
Sure. Will do.
>
> Thanks,
> Conor.
