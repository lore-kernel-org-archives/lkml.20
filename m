Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793975479;
	b=2D6QkVOXerha9VgWkYebm6lcrZkuBlm341uvF4NWQSX0hJKudnBRPHdWFG4/vX+mp1Ro
	 dtY6RVlvI8f3YOg0aGKnsHnCfaRfX7ydB30ORs1+b1u65bd1Zab0ssrXQ10xst+Jho2cM
	 40rf+pEremthhccAQlTqKKcl6spHPNY1lijWlDrXAq/EtIwXWTOZDVdQqJDeb7THAgMD0
	 74pA5WiVIaX+PZQMbge+HHaOLOgwgwdrwSwXgrwS6FVQeR8VarZxPcrrdktRKu89UVEdp
	 2gY6R6JotTzA60sE2Nu7mV7Wd7DbKQUpUkrOaIXhVd0lx4Ya7bGrbQzdz5Hw7zmOCug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3R6UvoeFxFCY/Ej/MVx8n6FebbxoQvB9tmIs9Jv63a0=;
	b=B8+oWDEPa36fEVV8eRK3jK4xy2VCRu26wMly8R7nAGzcMaNVcZs6vDQyuhU8kb5BtZGB
	 CFHR6Vuayt1Qm/o/Td0uAjwsjstXefOkod1oZqxYEuoK3nVNWxrJoZx55mHIh0ZCcy2Mt
	 G2Z1D5XnMKACTiImWMOOLqZ9/0dSHOx1SOwHoErmK+IUyBbhNzC2z0DOmTLI4wft+MJHV
	 Z/JDK2dyU5thekRaBsUYxqOczNbEXBYHzrr0IvrkDZPDaZFToAS8Vu8m0yM9oqwWy37g/
	 WUrHYI/uLYO3zDlu47sAieDTZyjLyWALa02Mj/fWCc4j5Hko7liIyYVYWlim8f2nzVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5CD606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC5CD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DcYWf1302822
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=3R6UvoeFxFCY/Ej/MVx8n6Febbxo
	QvB9tmIs9Jv63a0=; b=A4sAs1iZWsz+Xe7qnrcwmJHgmp9ac6ZISDzRGcUUFnCN
	1ekY1+GBrHwdfo7muahziFncvTiS/aUUFn2amuxZiTcQZ8sUYT/X3aGJdFrVwJ7N
	ztRtKQb/UAIh0oaaVRq7EQGLhUIwUmhcnE3osWp+9zM6x8ml2TKjNmWQFhPkhzom
	rJVbJu82Q+D4UyVTl2gjddviOfvQPXT89j2egh3xYtXn8ZA+EIaEtbW8iKfV9PMf
	aS8+KV5ROBTDRUiw7HAIJki/hMzI9AeVYLas3NK/J9IpLwhgUEgzOQ/xfgSS+6t0
	jWMtkZ5osacwLaefXZggMa9T/on6PKYxogYgRcB2FA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pd3bk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:31:14 -0500 (EST)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d978e4faso8430837b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975474; cv=none;
        d=google.com; s=arc-20260327;
        b=GSAaB+cOjudn+XPz8aKrrkkj2wRuZ5kQ0JZx47Au1Cs6vJQyBkTRX0G5xQbALkyLCU
         NrVYwKDMgzmNeW2cY1V9p7hRaMWzvv9D6nAxEmKQK2apet9nEmEYNJ6asMq3KU17F4mx
         JGNlsG1K0e5YL8CQSg4rTrIyLj0sBq1P5l3/t+edh28219HcGxrQkov5UBq1krcZZ0YV
         /+RK3r6Dvk9NggF0l+yqPVv5SnNDm8hxnVVe1GhrqN+YpuKgI2yfDRlZ6p04UzVMkSMr
         /yNgrnDMmNb8mvrhptM5vTXJCmMQaT9lqhsKsJLgUO2qdO3x+ijq8Rk4rsOFV0P5f10a
         YzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3R6UvoeFxFCY/Ej/MVx8n6FebbxoQvB9tmIs9Jv63a0=;
        fh=sVyTYbw8qcLKfPd8KTZxge7QBS/L/UQrnQCpy0NR5SM=;
        b=E4t0UycKZihXuF9P1FtUgRRIdtMep32UpCnwVWrePpgiW4h8bnnmTXH2jwDeuGpUpq
         sEpBtt/EzojLNEFga1D/gdpHkV6he9owJK9g9JoCOKcBxy3YsrM4YQyc79tLLjv/lwGI
         Dslpn+L7aaElo9oc2Q21O36Rr8ckPQgQpfljDMmovMtxJM1gXDahTXJ5nKi+FhFItIXP
         pK80DE4DzpjzuHjbfHvs/PfqybNgEoBq9iDoRuzi0IoB/ph9SNPpcOW336/qakBRsscC
         yIvBZ1sV0RgqUEg261+QVjnPZMWFpfRdKPRG7CADZ7BIl3e3pph6L/XoQQExveJAtRrl
         Q2Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975474; x=1794580274;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3R6UvoeFxFCY/Ej/MVx8n6FebbxoQvB9tmIs9Jv63a0=;
        b=kGIsfp4okwcy34/akMbnEgYa66/v/vEptwgZ9LQ86dnKzSJylsE/sWOtUovorbRZEi
         4KewsWokzhROeDp4IqWQ0Paqr28lwwploqI9JEEifPqY74Z9Cq0u9R2xysU4wfjDCq+N
         VsrU4qHrOenkhcsqAkIvpiHr94IWutj52th0pmsjxeTe1lARViIUEzQ4xPZ7YTCQEOFz
         oIplMfu4STsnFAuZ/vI4+iTlNLBPDELxHdFZpRColKnJm663hb6SFBr9iqM+UwrujkG2
         cSSz5ZahIkCYm1bAek1giWEHXHfzfZKlODF+YWzDWpYTQ8O7FirJbbvj9AXN0oXqxtIW
         C6cg==
X-Forwarded-Encrypted: i=1; AL+hErFmRcBVYJurjhfYB69FV0C88NigY7rzsbUs3Y4yFFEpw1kd9hybFaygFZqAygOJCwAuiMu1PbqtAyh/X7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DhGJIZyjhZUeubJT7eE3T7fe8Lk+oAXhzwBhheX+vbuB7OUT6
	0kxq3AXdUx40UrXrieRlrktS7mzXNvB9iT7XKhDpQt53HGlS7yBIbf4NIUA2wexb9fPTRSId+Uw
	QIPpqJPfZH47oyCLOk2r4lzdKjfs249y/shovNtSL40NxU+h+U0fCC+heUYQ+LaG2bF+gdDJEft
	KhIv7YBBygbcwpwCDyH9einMkjlprg8xe284Ml
X-Gm-Gg: AYBFou2jalYLPeEDgQlojmwFjjhtRODpz0N4xpetLD75tdcKl5cgw3Icm+IG4Z1I0C1
	m2LXEfJUzvE3rBbO0jskITeVGNpGjTWwDIj+Oj1elk/eugbafGV4Gtd0hPrclI3Q4cmd+FWbvHj
	dTxdZFuOFO69qT72TtlRFQvOlrtvouOunWEXNYe0CZ9i8ADx6SpG086xB+cxMu3OVICVyIsmnFw
	YAHzpBqf5k/PJ89jhlFoqyRXeBi9Hqrq67bzzMoeiTYd9Ei79MB
X-Received: by 2002:a05:690c:8e0d:b0:8a4:aeb2:acfa with SMTP id 00721157ae682-8b341b2eb3fmr12003397b3.54.1793975474014;
        Fri, 06 Nov 2026 06:31:14 -0800 (PST)
X-Received: by 2002:a05:690c:8e0d:b0:8a4:aeb2:acfa with SMTP id
 00721157ae682-8b341b2eb3fmr12003307b3.54.1793975473710; Fri, 06 Nov 2026
 06:31:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com> <au3eALuLVKZ1WXhp@google.com>
In-Reply-To: <au3eALuLVKZ1WXhp@google.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 14:31:02 +0000
X-Gm-Features: AclHuK-uSTIad-lvfbjp5wOphNsNX579YiHzXoYmvUtAiDrC6RcBzvikndjQbQU
Message-ID: <CAPOPQMDz32WrE8K0BDVLKbPc_Owx9izjQ+xPsJEJ2Cwy+BNi7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Compute hyp early-allocation and pool
 sizes in 64 bits
To: Mostafa Saleh <smostafa@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Quentin Perret <qperret@google.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: pMYdUb8YznH-_Q4OGrsow48934AIyqc9
X-Proofpoint-ORIG-GUID: pMYdUb8YznH-_Q4OGrsow48934AIyqc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX3APTgiSjmozf
 uo2CLvOU5x7kTRdMzhKqwsWwXsHj4L9lEdIKscAmlHW5EOeTZRD7vZg5kJtnybjPknqe5i2hRMi
 3U09CKGLIwy7zdG0HHWWhbVnz00hCdJvxGBGZbQJkPBVWUhs9x+2p/JgLqWCtXYDsVsdD+/SdfC
 i8FSxSBvS6rf0ElIvB+5/FdRSG/XJb7Pi+i4rYvdrPNkVwnTsxiSxBP+NvVrwTMifSQkT8bp3JZ
 zdJiDzcdyQ9rJc6PZBrqp9Uz+bi2Rumtc201JEMDPTTtRaG4G2BTwKUvqTsL7LZ5/E5EOii2w/H
 mz1ojuq6pqpErLWaHpsSK1woDM997ILwDB5BY0RZx7UyNI8FSOgXw8s1C8lNVmAYmipXVL01eg0
 HILa0i0yx2YEjP/LvU0U9DdA4nw3t3aSj73fHr5K3JA0j1WrWh9/6F0lVmW9eQWjXmfv10EzzWm
 /iBftZjFsnEQfY4I1BA==
X-Authority-Analysis: v=2.4 cv=IvCL47/g c=1 sm=1 tr=0 ts=6aede4b2 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=qqJXGgh0nGIGBJ8XPqMA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX4S7z6/Sf1rAS
 aZJOEGqeirrFljYJSZGtvrltPcxW/q/e+S1AcK9SohF1TO10/XwGDThet2hg7u0RJ3J6Ssf05Mv
 Huul6LFsPOcf1BgEcxbiRoXLTVB9n7o3YANDcxRBvvHIywHzN0GH
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1011
 phishscore=0 priorityscore=1501 bulkscore=10 impostorscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060057

Hi Mostafa, Fuad,

On Fri, Nov 06, 2026 at 02:02:40PM +0000, Mostafa Saleh wrote:
> I was preparing v3 anyway, I can post it today.

Thanks Mostafa, and thanks Fuad for the pointer and the correction.
I'll drop my patch 1 in favour of Mostafa's updated patch. Fuad's
description of what happens (pKVM init failing at the BUG_ON() in
hyp_set_page_refcounted() just below 2 TiB, and in hyp_back_vmemmap()
from 2 TiB up) is more accurate than mine, and the hyp vmemmap
overflows the same way. Mostafa, feel free to reuse any of my commit
message.

Thanks,
Xuheng
