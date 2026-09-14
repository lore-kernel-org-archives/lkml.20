Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CD352017
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391949; cv=none; b=tIo1VnN8XV6By1O1HhnvoKsqeKs2i4gek099n8w+RkXtqigL+AfgA5M1NCsfiXi8hZA7/R/h/ooXCMxuX1ebOo5atpPRMhjvUYynpdispVYPHXMVYpq1QPtaOZ5xNciL+9kc/HVrYE16X96Pe1P/uaKjXu1LPkbuXFB+UQ93CQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391949; c=relaxed/simple;
	bh=YiSKZVw2fDzM0eJF+VxE9Wf8bagEXNffdOngrQQf+uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H67KFGsAlMm9p2mFVCY7GpLn6XUJl3q8yYeVwZ2khTkbXsgUulLGDUWT3YOqnGA8ZlDvOEymQwtOA9Hp6nIamAQ4ky7/MAv7IyjBdFrZ4Dl33P0qAVfHPsnnh7X+ikEIxstNeedXfheEhxkiG2N7eISCQUgdXHYvSjMAnZAMm0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0f9OZ28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fM+BMEcs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0f9OZ28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fM+BMEcs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0XHN1025819
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jTxHxmy+kUR6RRqJXD/5hkpv
	gyYXtelfKgZMuBm1egM=; b=k0f9OZ28aB1bOq9HwXQWTh3Hk9bS5SaDLuWQ+jzl
	9MkbLwAGZCWOujwrjWGXhhds07E3aCoItWmiTQeE1bbRdDnHltNto/ZkDcX+naUO
	HzkBUSjYu/00sWBLd7QwtnsF7HPWaFuXLFgkYPCJYLRDbJ8u6S9Jz0fj5RwjCcNo
	/jo0bUEvkVOl70GfNtOI3kl9Q40fygakA7NaddAzI3KQb+gpEX4eByLmE0UyXHBa
	ZtlMyzrxAlD6Fm5v2YXhsS+1RK+d6SAlINMumfPOPZC+yLTupH/CTIwuEtS0T547
	cqA6iAfp4eUauzW3hgAHHKZmFN1r3SfdgEIKZNwg2FxcAA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5s2js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:19:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8645a62066dso6847383b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789391946; x=1789996746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jTxHxmy+kUR6RRqJXD/5hkpvgyYXtelfKgZMuBm1egM=;
        b=fM+BMEcsibAPGwS3Yfsw7zg1ODMGE0Ax/iITptqM8a0UK8C/iJ5fYDA3pkaNb/axLQ
         B2+aiSVEkZT2PLhACRjHnrfSjWzul3yh1UkheqKY9Yn76zZ+0JLO0y2kEY+zDL46uGWn
         ene8bCAUSkryEdVfI49Duc6kNogzFIJe0q3CHmWtukWoNs7r+TrBTAUQ8Nqegg6NcU8e
         sQLbcTQ0VUHBLMCRg7z8xSJZ2xKCoSA6mr9VuaorUN/n95/bBrhFLUcIz+Yt+Yade6Qx
         6pd6ssb1diGBnXsUVlpVZVXcA9u7PxE1ix3nqoxqacpaXwaSdBXj3y7D26cco+A2Esr+
         QLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391946; x=1789996746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTxHxmy+kUR6RRqJXD/5hkpvgyYXtelfKgZMuBm1egM=;
        b=Kw3BEKFdQZFpJ6HtEOG5BHGqyozK+DLogfy5Ke2Q9Ala6TVI2UMwsB5yxHl9SInMCF
         OTZA9rvVQE6tqMFcIrXfBx694VOLXZyvNwCL81lPXpb6PxPz+YrmLbSTdqxSeImCr6ZK
         NsHyrj+Dy2TFQZQdKOpphlFkqmALH7fVf1wMaJ/wgUbysI2ZrnKxPDNdZorrucWoI2KM
         OSokfIrx7sxv0aOmmPp0oZUDsEtBBkkJX3PsgtnufDZWcX6psrBvu72rY4kezQkL6Nim
         xwB4zh2kJY1LWAvYXcwtzclu0OxxKTAjnQrnGMBr6LWxd254Abf31E+SHp7LbJrg7cHE
         fiLA==
X-Forwarded-Encrypted: i=1; AKwUvBwfK06I4DOMx0VhQFG4IepZAmsGXXvWJJyBdPpAFTbNcIs6cQcNUEF51je6JTHudAMsjfPuQBRnPLJK93k=@vger.kernel.org
X-Gm-Message-State: AFuF++ke6N8CCDHeAgZtFpzOtKWS9vjMGiIcP6fVLWL9FXC27K2KcvDZ
	Y5rUPkxDVl5n0wKqpWWaRFbHDNIZQYXATJakvZzPRrt4fuvw/WFIolC+/nAA9X2BfFCJjVatmBC
	G7s5PSJOMMn36hh/1ZJ1WIB0WA8gMu4roUfp2QaImeA6037xIqRgzNrzaLBnUFClRkT8=
X-Gm-Gg: AYBFou0OrKD/KdGks8qoXLW6Mle+bJf4T2ZnbEPMGpVgfxB4c3BN7ZeHBH7bd/2Xg6c
	U6h8kvLGAR7/AEkooMgPTq97wPmAahPE8LxCmoKFD5pUT73t6ltWz2m1ARucOtRpkrbcS9SVL5b
	iB35vFmRlUxAK+j7Ls8MRRMrHLqRJuh/wUP+K5ck+PJ3ZpvXVJsWwZf8u0Ki7fjk75beI44yc45
	82dR1QFOUfcOWQZj4RUKzCG5Kbo4vcGrCvVtUcoGy6y5/hblOkNY4QbPMhAAMmNPoK5kwdaq1r3
	Fie1Hg8pwRNE/qt7X13Hk78CVRdZR4ba0X43t+pHaEahDqrR5doPNVzV1sy8vnz25jpS16R3f7l
	4Sv9aPRzl49U3qw/604802vzn8087ybBCUCLWlSZUf5kV/Y5/G0abZIBUXzXnWYMfRCtMJL2R6N
	Qfvk6e0J6TQZXr/KpihkCSUHhk
X-Received: by 2002:a05:6a20:939f:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3db406fc7fbmr5352326637.22.1789391946108;
        Mon, 14 Sep 2026 06:19:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:939f:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3db406fc7fbmr5352223637.22.1789391945575;
        Mon, 14 Sep 2026 06:19:05 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm26633558eec.25.2026.09.14.06.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:19:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:48:58 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        thecharlesjenkins@gmail.com, jtaubepe@redhat.com
Subject: Re: [PATCH v6 1/5] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aqf0QmoUmkPUcCzi@hu-himchau-blr.qualcomm.com>
References: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
 <20260911085359.95227-2-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911085359.95227-2-qirui.001@bytedance.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5MSBTYWx0ZWRfXxEK2MCsqfRyj
 63+Tt/nndgo9vOoiPeX4bzJUtZK8n9UZHB0pPQEtopu+dmrgDaByhujH6/I0U24aYI+6zD4ulf2
 Xg4pI8sthgZI+GgcrJIDsQoUU6wga68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5MSBTYWx0ZWRfX/anDIFog/0CP
 yCN5yaOvHL9bYNvJSSFj8knRZswpDZ495rfWxC274esCgukgXtMJgsBycR0x1BOMpwrC0IVTEqs
 ymV52cheZMzcTHu7nAodFyCFRp1V1LpRxk9L5OK4XIHxFRWizvoi31Z2oiXpfOyLL4Ne1jLuiDu
 snQYoCSowUwXkSOQcQrnV+HyfsiFNBdzh4L0suX+fpXHmdStX+h2aT140mS1aVGa+UJRVJMics5
 9qmBzvkde97kkh9GoDsRxqVTrIw8MzQ21XAnR+jQYn6PxKFC9cvbdZIPilXOLnekQd/rRw4lcgD
 u2e0SFYbV6DIHY2jW/J6/DYCPHgAd5FnXclRc6Bf8znfSt18kBSL3ZEX0y/UEHM4pdG9skx72iT
 neryWBeyooZbgUVZbsC0coRa5x3JXrEipk4Ai9W3FagVbj+WgjfEhXwtIqSOEkeerPiYp3rHKHw
 Kjpj2u5Fg+t3yHb1CKw==
X-Proofpoint-GUID: Fjjd0-xAABgsyvwGn3Dhbw_832gv-Kn1
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7f44b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EuAT8bhfm2lHp6HEtwcA:9 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Fjjd0-xAABgsyvwGn3Dhbw_832gv-Kn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140191

On Fri, Sep 11, 2026 at 04:54:00PM +0800, Rui Qi wrote:
> Hi Himanshu,
> 
> While testing this series on a platform exposing type-6 triggers, I hit a
> failure that seems related to the mcontrol6 timing/hit semantics.
> 
> The current execute breakpoint path demuxes the event only by comparing
> the programmed breakpoint address with regs->epc:
> 
>     if (bp->address == args->regs->epc)
>         perf_bp_event(event, args->regs);
> 
> On our platform the execute trigger did fire, but the breakpoint
> exception was reported with EPC pointing to the next instruction. For
> example, the trigger was installed at 0x1062e, while the trap came in
> with epc=0x10632. As a result the handler did not call perf_bp_event()
> and the breakpoint selftest timed out.
> 
> This does not look like an instruction-size matching issue. The trigger
> itself matched. The problem is that the kernel identifies the matching
> execute trigger only by EPC equality.
> 
> For mcontrol6, I think the driver also needs to be careful about the
> Sdtrig version exposed by tinfo. With tinfo.version > 0, bit 20 of
> mcontrol6 is no longer the old timing bit, and hit1/hit0 encode the
> fire timing. The series currently still defines/clears
> RISCV_DBTR_MC6_TIMING_BIT and, for watchpoints, only checks
> RISCV_DBTR_MC6_HIT_BIT. The execute path does not use hit information
> at all.
> 
> Would it make sense to make the type-6 path version-aware, or otherwise
> avoid relying solely on regs->epc == bp->address?
>

Hi Rui,

Thanks for testing this out. I acknowledge this issue. Similar point is also
raised by Pei. I will fix this issue in the next patch set.

Thanks
Regards

Himanshu
 
> Thanks,
