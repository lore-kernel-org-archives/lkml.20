Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793975713;
	b=Anl+vhWu7EXZ5a9fa1cBt5MKkEFB6ezMef2dy59J7zVJXNmcFWLejYnIjBNg1kIzkRVg
	 RqL4bSAMr7e8ICIGMI96SsAyF0Zp05koUcoCjuvzNIRdRf34MYKvrLtewU8A9eiHuOoH4
	 Kz/RyfFEVdOuFZyxwp+mdZ57/ZrvE18GkRiETrshbqnRPWN8sl1GcEa5Rj74n1jBmSLex
	 13HR4u6J9lfuJQq2lxSwq9uMB8PDowV2cLEGDl8L+qfpG0I6pgNbHKWOjy6A75HYfKVHE
	 zPf5+x2lfFGT2Hm3eMprBKcJQ6Y7gMIxZr7rM735JCahNlnhD7IKoh9v2G4sAgcgSQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AgxbqOaoVM9+7Pj0+8CQw7G3IaiuCjj7kRy0IPi5eVg=;
	b=29WNAbVuSP8IlPwHKV/sVy61UpBhTZaTImhC9CC2K5aRvUEOuqKMtq3PZQkRrVgcsCM9
	 UJyjyrshqAsodz9UeVm1/4ty3LfZcIdrl2+FOVwRj1lUFegHRN7hv91lm4LVe2fG1t6+m
	 zgtPHlZ9DqFtRSEsrumMDJ705Ehuj7lTFO68qbWd9VAAN2THL0+aC3WjAIJy4QaGq73ml
	 9Wx1tz73oKo/7S0P9vBfQX8kaKcn/pqdU5KvXwTon684flrcLuptIf3ggekMeDNzYVRAO
	 DlQsMgxcOLbVZOyvV+tL7PCUKqRJFFxOnhh9GrICgj0KVcbRWH+a1+d5uW0PqNbSPPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="Ma+/RZzQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54567606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54567606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Ma+/RZzQ
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DcMBW1329523
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=AgxbqOaoVM9+7Pj0+8CQw7G3Iaiu
	Cjj7kRy0IPi5eVg=; b=Ma+/RZzQRAikshvpTwR1Eb4FzE9gsBtnnc5LGsWWCojA
	AZBj2PdwgHcwxlq9AD6KjiX1dJ6otI/lgVtK7TMCP/zaJAE2lhFayZbmAfgmLPt5
	QsBoDuhurAzVoZRIaGDQJRkuUX0wYVDr4HDPlJyadIGYaWUH7PVjUPyd2k1URpig
	eymuvPUPbXpWjkZs5IGZlLVwePmBqAqRT4GG1FN9yFOMBpvx/KIYkZZW9mNbSPwG
	ZettMPQWsQeSk3oL5NOxwAjcDI9WVmStSr4smwpckP6Tjg+C/mPR4NgcI6uTWXVH
	SNYmQm8Nkx0cVvB3CE38ko6Rgzr7SVDg7CFcI54aJg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pcbe2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:35:10 -0500 (EST)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b320a98b7eso11977917b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975710; cv=none;
        d=google.com; s=arc-20260327;
        b=f9beE+bWl5tm1alMINuHePuvA3Wjg95q1ewMQRbtdy8QP/fr9OZatvGf7UFMH6+yq7
         Q197YqEXmCXA8Jld2ns6x4xAB+OR2kU0rlZ+yfbhwayFHBxG21MtxpNjPk7eTSc6IdzX
         qvKgTyabgr1lQIKM+oCx5L5x0AKt0SY5ApeauC4olkr3HVrrhhR4S2Jm6njUkZfT5ayX
         W+tUsgCy/BkU6plPuuBuJD7bRUuDppJuHZbtcx2i7ukEWikfBEZQy8kuimUsROS+bUfY
         9hR0N+TeTpW9TiSc/KojRN3jSxPpkhqlH2j2LrsM82git63Y/m3QuFqCMOBlhq28aApP
         jcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=AgxbqOaoVM9+7Pj0+8CQw7G3IaiuCjj7kRy0IPi5eVg=;
        fh=qQU3jnBLDp6sIT2/gs+JXF4sCsbDgFW1Ee+0O1FFr5A=;
        b=Qb/clb7OygpnwCaNvmgijEpoTgCezJN4I6kI42xJJ7jwg9qxGbVgqIygF6OF0ozEVh
         id8oiMG7F/ceOBDm+JsL4qrkgEgHqN+Rb+p+mmjYAusAvsts/PP+MgqlIxAHanqwArlT
         HCg/kpIqVtzxJFJiuSjMuoqyHuB4FA16NAKU9v/uIHZbuXT3y/E6YscOPehWUEN2ewJK
         kiJkdASG9cSE2mi9X78Sm/ZS1JwHI+ty+aXV1hhWzQJYltsfEZ39RJhjxIBXKFjBvOQ2
         cnihPH5o8dpfXxKQ3On1qudVzV7T9tDweikF6CK1lWH/e6mehoZKd7VulQzlgBdjWnK5
         1rZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975710; x=1794580510;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AgxbqOaoVM9+7Pj0+8CQw7G3IaiuCjj7kRy0IPi5eVg=;
        b=Uoiqef1rv2hNo+xDWmjZf5wTzyBv+773yQw46g1vcbYk0NTp0vOFVnztPzhS9Nxa8U
         Lu/Zi2fvSrKqJTyKnuNpX71VIL+u4wilo1yrOc66N0iioww4VCfBbjHUMN/D46gBgdxY
         IYl1NA/H36ctrc6rYJvZbpkud0t1flfS5Vti/CL66Fm82MM9fQrLNLr1nIDppMs1kCHS
         Fecnxt9PZt7XBZIPBQunHLumaVn/EL8pSkt0UmMTdf4Bodf/tGCGze6Q4YJhNF7m6TxH
         ksbEtSJP6n7WfD53sy7/qhhAbt5gQheCUoCLnL5knIYMTy6nvIRSs75PC1fSN1IcsoWg
         0yDw==
X-Forwarded-Encrypted: i=1; AL+hErGwpyNKM7K+IQlnJQ39OrYrZ6JYEOlVLoU1XVxC2FmeZRIuxACrV7KC9u43sLO/DBVJ61dqxT3zTyxnOqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ClQfvV6mEZW7DVzysJS3XTDJBMl7kpZUjC/Cqz26XcKjSGnH0
	WlQmGG8aigDlsvyxTuUChfERZuPN4M/fjv+DbNdCz7haUJdnKND2feq1+/JnZ7evuo5EGKHQMvX
	daDygeToHoUlkYH823SStnV5Uhj6TpFjwxUtUu1G4TwRuJW7z+S07wgMHAREfKfP8KQrh4pevyn
	WltlY8PeNuFzO5oTP2SEHRzxhRT7szYBoEHLMD
X-Gm-Gg: AYBFou2aQ5ovC+G5HK8q8CHKW6en35fUBEOVhqSYALsjR4qkPkJf8FHeVYmqRkPSzOH
	UcpCLtJ5vR1JpBQWyT+JSXzyQ9G9EVg6+0tc+gbDF63881UJO7BQs7YdbiFN0PtUTBPySSWPa7K
	FYUjK8bYZFZ+o565YuxZBaoE8JGI3PYHNRmJAAz6FlXPSXuKx3kOmgQb1m3JM8Nep/h7B1zKY44
	9bgkDOCU1EJS8x0ZlgScuoiaW6TADUVS+IZu50tbOFqAIDw/d8ce4VQwR8W7p9Ekz9yZxH5H+XM
	LmyeP8WchLGXfD4j7Dyo2ASgBlBxdHp/OA==
X-Received: by 2002:a05:690c:dc3:b0:8b0:d027:c4f0 with SMTP id 00721157ae682-8b3417cfa5fmr14408627b3.1.1793975710494;
        Fri, 06 Nov 2026 06:35:10 -0800 (PST)
X-Received: by 2002:a05:690c:dc3:b0:8b0:d027:c4f0 with SMTP id
 00721157ae682-8b3417cfa5fmr14408337b3.1.1793975709944; Fri, 06 Nov 2026
 06:35:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-pin-barrier-v1-1-04ebf118175a@cs.columbia.edu> <CA+EHjTxoNcx4s4L2DRXLu6VydiG2N3OqRYr+kscghp0jVVwg5g@mail.gmail.com>
In-Reply-To: <CA+EHjTxoNcx4s4L2DRXLu6VydiG2N3OqRYr+kscghp0jVVwg5g@mail.gmail.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 14:34:58 +0000
X-Gm-Features: AclHuK9bdlU0f_EKHjmsScSdj7QwMgpM5fQzjjzMWksK2dalOcvjFLTPsgJNF-I
Message-ID: <CAPOPQMDYJ7rEHd0W6Re4fs2u3FVf_Qs=5wD_U8DDOccHwaSY3g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Order a later pinner's accesses after the hyp mapping
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Vs62kO2n c=1 sm=1 tr=0 ts=6aede59e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=SMIg8bpeATqOEtpUIEIA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: vmmfAk6D8HpRnIW2oSZhJe_LzGFsBbX8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfX80ASozaXZr7R
 AOrnixnUuPIUYVK4DOtj8cSJ4DsWBoUiYxJaOhC5o70b5iAyY8yK1XHIVa0BiGuyLqu3xMHczQu
 u2TjXL/TOrYeynhfI1U+XuYH/jwdZGlsitkw5U9uWDO8I6Nu/SM2
X-Proofpoint-ORIG-GUID: vmmfAk6D8HpRnIW2oSZhJe_LzGFsBbX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfX+i0NglL5+x4U
 HE+6zDJ39wgGZACW09cFaQ+AV9MEKmRtp6rpvCtCtcN6uzxhDmBNfr8tCnZ00PUN3eipYTXiXf+
 +BrlAmdupMp+xf4lnylnZ5bRkrBDJelQ0+c1Yyl8xQMTiKYRZlD9UupvoZGKtcprpcAdpBJoqzS
 Lfv8ucgrz+00q6AG3i1+KMTZz4egB4WKW3tf56lp8C143cD7BZgCzN/Vpjpd80U+64SzpplpREv
 B6oMz5gxizLifsoVHuzaKoD7UxUeRjge62mKw+lS6VqDEje3YW7353Ezs1zo1GPBWiIzZCL7i4O
 0kqpPemv/l3hH1G3ASBrOKEtEn3WfDIajMZNQzaBsMHFaprdHP8bdDzhx3h4u/JghsVzTxt+rR3
 +MDSvKPD7ZNYZBAM5VyzTcPJEukt4cXXX4nlI1+ppuPmziZx7/Nr5o8EFEQN4NKr/SzmpQol4uP
 u9UmbRvvPj5MNLR4suQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 suspectscore=0 bulkscore=10 lowpriorityscore=10
 clxscore=1011 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060058

Hi Fuad,

On Fri, Nov 06, 2026 at 12:59:36PM +0000, Fuad Tabba wrote:
> Could you also give a case in the message that a well-behaved host can
> hit? Since 7.4, two vCPUs of one VM can pin struct kvm at the same
> time from the __kvm_adjust_pc hypercall (cf533b4d3630), which then
> reads it on a CPU with MTE.
>
> Either way:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks for the review. I'll add the __kvm_adjust_pc case in v2: two
vCPUs of one VM pinning struct kvm at the same time, then reading it
on a CPU with MTE.

Thanks,
Xuheng
