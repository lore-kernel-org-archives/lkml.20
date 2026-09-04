Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4AB45FFD6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514921; cv=pass; b=YMt4Jjn1YI/jaKcTTHIF4UxeIZ/YRDHQxSAWxEOTIJYBrvS0/A0bmciOxF1erjGuhhRd3aTXna+vasuyKAgVfOblYHbRFVtksIUWSz42fHNUDhBmCeOzpJx0hVW7spkx4933LOe0G0PUVgSFH32zLfzja1JdpKYyTG50SWvzkM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514921; c=relaxed/simple;
	bh=zu7emRKboLzHXzyXbEcjLUBn53PCvlKoXemd+/irgw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L95gyKlcVzOZUxXAEZeVm3rknKoKhydakfZaTbUuIrMhtKYXol85Gk6nWcZp7AjdXUoaLRqthBKldXNr/YUH76flzMOGvlohsXfA+CsvUi0YxtD9TDaueXGM5jBUDLmukN7yjdWzEd8HyKM8QV+ybiGtYb30yK43irgiZ4MtfXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNWooOyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyDT/8MK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNWooOyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyDT/8MK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mqHg2430193
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MymcqnZkHOqjUJcCaTmpmg9eKweEy9UxXP0OOYlsdYI=; b=NNWooOyY48IabF6h
	3KcJixiMdydZRJXN8MGlW/Vns1nXSqMnNboKvm3FVCX1gk/MYu8ftA7HhKPj3HkK
	KX1Dm0P/Jbh+pQ5tmhVDELDu8xZx3UTYHNgerZCd96PbmiiepMW9jaLNrGkBiKvZ
	wO7sgch6Hm0Ea5oHpkCX1u/2fz+Y4rxp0M05Pe4Q0Nq6BWdK5y6Lg1RahFvtchbB
	2FNqTkOxiuCZanqSop7wfwN+c2vS6woWA54JtXJOEbo6UzVedCRkxOEZD8uJi+Ek
	H+c6JmDzsrJW4GiZcHy7Mu1Qz2+Tty9VwmGJsYXlQwUwn4z7tczYYX00DIuatwJQ
	kjRycQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk921m3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:41:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84842381150so955260b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514919; cv=none;
        d=google.com; s=arc-20260327;
        b=W+ppk7Vb/gYL6/iXzn6Eq4tX2dti6E+RBm4nppbgVcMuCCDln/NLpzYppTXpdqW6Jb
         y7e1BuJThd7dKLbq6SuA43aTFhHFrvu6cDiRqbnXXZNpPWEdM73agHP5IofMlRBumsZx
         1q+Koo88rIr6LbOLcZLWc2lkmFWXua+n/b4CUt0antiysSWbJgSEer8jqBOJggydNKmn
         DNwZ4vAJOuCKA+1HRNatK0GbVq3Uz35ZamN/zNa9nV9yjqzXtln3yOCuJsYcy/fWp+bi
         JJY09uWNcLnfLjSuZJuJLPUh7Qjq0eMrr2cu1FxtkSNdbTu7jrIK/T6+rXS7IPgbMVgY
         ZFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MymcqnZkHOqjUJcCaTmpmg9eKweEy9UxXP0OOYlsdYI=;
        fh=jZOsxzPWtb4/BaPnAVw4DPJOjE6PuvmTe2sbJVYnKxA=;
        b=ODZb2NasmLWrStq/ebuznBdb9XADARoawnj3UIfqdkjDSAVV5wWmLr1MPF0C43zuyj
         H28Qc7KgKrTlysotpSh1mpQWSQU6ERTUABINcialRJEe60kk6eNlZd0F5ZfbCIeI/263
         qF0quslPo3t2s8mEBc6q2knRTFEUnBs7jBkPFa4u99nVtEqoGKeHpJgcUeMOlefwXev5
         2eYJlytL9cSZ+9E4iE/FfRTHs55ksxsaAWFywVx8Mv4cUMdj3epNtB7Q+CB9xPKmzuVH
         rZ8dorjPxhyJQaO1+K4M4vb42VdWcdpp8XP28kah0ollcS4tR/vKxejTTn5N8w54yPdH
         OeZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514919; x=1789119719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MymcqnZkHOqjUJcCaTmpmg9eKweEy9UxXP0OOYlsdYI=;
        b=RyDT/8MKoEkDnaWBrCz29P/QGTipLbDhtmiGv2nNCdr1cvCFY8AnA/H50+Q+9DPDT0
         EhsR329e+C2hMEhYz0eaaYtg8BICLyxvXDTMspHh2J+FVZW67gzCPrpaelnbHjUdHuOp
         sm6C1Hl3oLYmXg6PP8vS6hx7cvvgx/ZIAMA9KKKfnqePFDy2cPaIoZfSRoabqf9nS/m/
         tCyT1QylgPsq81q9yVzBH1O8cM7lQhLnGDNcj1unYi0mxF2+GcRVRCw0iH8ZzGQubXfi
         ZB8VFIyHSXUS8/WXqztXLfmZOAX82OyLaVZhSXAipsAs521LLfZqsCurDooxtmFuZsze
         UHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514919; x=1789119719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MymcqnZkHOqjUJcCaTmpmg9eKweEy9UxXP0OOYlsdYI=;
        b=rqI27BuC2h2zMks+d6V4++2dZfd4uqD1zaQSOoERI+XRUEkfSODbnDGRiS2Hiy7xEQ
         k5R18xtBKuEfrqib4A1YXjYPCokITMk1Ija/ccdumJwZjjF2wu1NbXtbHnwQ1V+hOklB
         yaQpcUObBM0n6FnOaDdE+06NlXOfS+CJzPM9GsW+wYu5ayGbJy8yzxnovu+uVpnBB8zz
         TOg2maJiLoaKCHdryr9h/tHkjif3RAG5DcdFhGjE9ms9KPyTAsULQKiEa4DiC8KQIMMZ
         KfX8b/YRGFpWsgxonmMALBEdo9fIFsrJP34CL4Bz9XMqo+QKMxCTMBxfJMD+CSUovxcX
         ++OA==
X-Forwarded-Encrypted: i=1; AKwUvBwppDmeR8xK9CtBaNH3gOcgv6amp6a63gdE+nYEMjYw6xwt3wWdEyRJUKTTjdZ2Gd2Kpob5SAsXbApe8wk=@vger.kernel.org
X-Gm-Message-State: AFuF++nH1zpKhNKkNeOrxLJYNdQWwuvPR2j9hu+bnoDPv02fjS/NJH/L
	aDql3eK+gxoYt/5kK99Myen8TWmmeT1swyo9Pep/5rRjONL1gBCAL6wbgHzlDLjAFdbKEcwZbZC
	jYK2+ZHIAo20fHgRtcmBoyVnnAwXnz4ZzEBKO62wQ3VrDAsVIxVofQ8T70+CQoMMlXGK65M2Mcg
	ImKjnYMurfkZuyi0kGwAzpeScQX8gD8K2bXukvIXh6SA==
X-Gm-Gg: AYBFou237MYlbYx+4Rcg2A3f17fvFQnQrAvRz0gTBcFlhVj3M4pSYuMBvreRDAsmB5j
	LO8vFZ7r8HtwY0bHWig/IxAJpzJt0YweLNArzP5QURgFSQYyQELQegMwMV4u6rgAuZGwiXDuZCj
	3g1lT2OBGByy0ycanIFNN1XIwsc/8aRqlJM+p8G+u6TrzAYh6IYwSr0muqHg==
X-Received: by 2002:a05:6a00:400e:b0:84e:e741:174f with SMTP id d2e1a72fcca58-861669c6df9mr7906448b3a.7.1788514919162;
        Fri, 04 Sep 2026 02:41:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:400e:b0:84e:e741:174f with SMTP id
 d2e1a72fcca58-861669c6df9mr7906397b3a.7.1788514918708; Fri, 04 Sep 2026
 02:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-am654-sdhci-v3-0-acc91d7d7e50@bootlin.com>
In-Reply-To: <20260807-am654-sdhci-v3-0-acc91d7d7e50@bootlin.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:47 +0200
X-Gm-Features: AcwNN1WY3Q65S3OXvIJFG9cyzWdBxYBgoNhzeyg3bRWcOCH2qLTUuWKCE0IcBIQ
Message-ID: <CAPx+jO8UoYuWmKRi7ZNb=5mhnoeZB0iLHeqRqC3d+_NO1mx3zg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] mmc: sdhci_am654: Fix DDR50 mode for cards without
 tuning support
To: "Diogo Ivo (Schneider Electric)" <diogo.ivo@bootlin.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Faiz Abbas <faiz_abbas@ti.com>, Judith Mendez <jm@ti.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pascal EBERHARD <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX3/o+DDz1QRAP
 ImpVxjNtQh/ZTBWGlqWjtoq7McNrPwAojx/QC14Pg9E5G6zX1MWMNF4DfEeQFIACtawcGvDmqcP
 /+XUbzP0dm6oiw4ekOGIRkBb7IwI8oPWbCCAwH6Xabjx0+SM7LVH+N093AzVKzPWMWazAbeyzRS
 wDe82rqZ4TOWpci9orXOq7OJRHvHZS019P8YvJbl9Nfwg1glcOqlMDiQyEPQ2XwazNEV+dNnjkc
 biaCYlGsh2CUC6XuvvutfgBoYxZH1SlTI2Xsr0S+XHZK0ITjB5jYh5aOlRQAdTmQL7QYDP6/iYZ
 WyID5w1wmzexWyeP4dvrUoGVj59yh945wGjLFguy0h2RGo8yEVcMj6TOlhUC1SU8twDnXrFv+zK
 YZphL0YqCZ49y301NjIs7GoU2YIUm6sbzXkKT9gMppoy9F0Qvm7NZxrGr4nLO8p14pklYreFfFF
 5GMTjriH0en+a2PnmUg==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9a9267 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8 a=P-IC7800AAAA:8
 a=Yx-hDG8L3HprUginNkQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: eeeaG0po6ZwU9LNaJ3Tp2PtI0_9iV-nh
X-Proofpoint-GUID: eeeaG0po6ZwU9LNaJ3Tp2PtI0_9iV-nh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX2z8lOhaZ5vhU
 VjD1yK8s5bNeZnuldJnZSclv6zsLe7esjBoJS81YbtXuzq339s8C6UImMjCA06+TnKVRSGhKdMy
 bQL88/y93mrbgSw4uAMbAHAVh/Rm/Q8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040088

On Fri, Aug 7, 2026 at 1:08=E2=80=AFPM Diogo Ivo (Schneider Electric)
<diogo.ivo@bootlin.com> wrote:
>
> DDR50 mode is not required to support the tuning command CMD19 by the
> eMMC/SD specification, meaning that calibration may fail on cards that
> do not implement it. This series fixes four issues discovered when
> using such cards:
>
>   - Patch 1 moves the tuning_loop counter from a persistent struct field
>     to a local variable, preventing failed tuning attempts from depleting
>     the retry budget across calls.
>
>   - Patch 2 ensures the command/data line reset is always performed
>     after tuning, even on failure, preventing stale data in the
>     controller buffer.
>
>   - Patch 3 clears the ITAPDLY enable and delay values on tuning
>     failure so that leftover calibration values do not interfere with
>     subsequent I/O.
>
>   - Patch 4 falls back to the DT-provided itap delay value for DDR50
>     when tuning fails in this mode, making a best-effort attempt at a
>     known-good delay being programmed.
>
> Together these changes make DDR50 functional on TI J721E SoCs with
> cards that lack CMD19 tuning support. This second version addresses
> all comments from Sashiko, which I found to be correct.
>
> Signed-off-by: Diogo Ivo (Schneider Electric) <diogo.ivo@bootlin.com>
> ---
> Changes in v3:
> - Collect R-b from Judith and A-b from Adrian
> - Add debug print when applying DT fallback values (Patch 4)
> - Link to v2: https://patch.msgid.link/20260803-am654-sdhci-v2-0-a5ee5be8=
6133@bootlin.com
>

The series applied for fixes, thanks!

Note that, I added a fixes/stable tag to patch1 as well since the
other patches depend on it.

Kind regards
Uffe
