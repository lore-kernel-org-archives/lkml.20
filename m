Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794582385;
	b=QUtpJ5qccOGxJKkrUF+adc19xLAU8bWigNfeNCUeNjFedJsEKq1eprCcwAIa1r5rXzDA
	 FxyyF3VFoxZk25ecoCUid4nhJGs5ijk1p1It9Gr8TYS3kLrc4Z4KBcvS/r4afLv9AmSNq
	 gtQIvdVrj5v+dc37hq8JU9t2scXQ4iyocBmeScLB95BUq0IsnyKayGocjipT/9L0xuvF5
	 dN3v0cp6d3ul8hRUhZrv0w6fGIUbLh0jcrscKU5vURWD0twtDtklBFRaHpZNOfwSgSR6R
	 v4Dm8Yb72SAaQNVyCfMxFIK6MdVSyUC+HPstrUAojgUxgKgTLjwOb9suqeNV4N0aB5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=;
	b=o6eJFE/IyQFhpv6o6nAhkV+mW3pxKczfSkPTNOVRFs2xLvg+dYmfxzHFtudT/weuafoO
	 rcasAtKyuV35aOFZA5ZTP1KGsVZrbs8fBkrzaF6C5Tl77KM5IFJpMcabFL2939r5eOg7/
	 OUcFF47F8GzMv6t25IeyyKVEysQX/TVbXjGwXoFgXJ1zOcYq9CVAD8FpGiSTr6y3ipeRT
	 a2Z1OOAlp6jqxfb2QVUYFn1y1NVFR5V1323YAvMOywL0vMy+YdjkIvs/jmjygubTLbCPq
	 JiCMMVsFiIyPiYl7aU+8vpOGOqJYtAyZXdJ4caepxcNDfySZGeHMuNYHYFtI6yjpAIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RarNiep5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U4Lsip5/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8D60A381D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B8D60A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RarNiep5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4Lsip5/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJc6S2139211
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=; b=RarNiep5MUR5lMIT
	8lLqXyMgEs/rw1xbOT+r72pPfKsp3/WHQ5MQYvnqnyLwREwoFc4KVK9mDHQZ0XN+
	WujmmrTE+fWXc4H0FCUAGuTg/85kD1I7q5/PlXJgsibe3iGvvSoVJaF/BuMboRF6
	Idiv2NaPr8qDQ7EuRGBK89XBDEEL5ThPvKmnDoGWtT3ahXi8+a4ZeGZCGBWgpZWQ
	q3kihX++ylhPieuo5j/aXh3v7HzcndGSyeCmL5DQzNzKgL4G4dhiuhTmfiJXDhyE
	Z1R5WD4Wi2HZhjAi/1bgpwhZynggkhN71UJ1cg59Ek+R4PvwCEQCpbs88fDIh8rf
	fbrnYQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9s1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:06:23 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f8281066c4so1435754b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:06:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794582383; cv=none;
        d=google.com; s=arc-20260327;
        b=oEp6xmGWs889b4lw7iDK9L1bnEw9bK0qTrpRWqaMPW+kjXnupXJdKpBXsSG95OlEmk
         fa1AxxBHWjXi8XYfL8KZZYnm3SKkNpflRTdDuyMAdUruqPDYtpy+V8X1IfXcxB12rRx0
         anuIA9Q+PHB1rESwVoe6nLidJizOTwNdXjqHuPqS5dkj+5D8Bz6HA60hGrvS5apiGqMR
         BLApUXhVTladBTjD9PpbtfE9cixdNAR45G5wpLS9R+Ytc1ALlfKwMTA1vA9YO36J0bYJ
         yTEyy1W2K+S8gnyXa3zIio+wWwpSEZkBp2/ViValBO07/NNDaePKZDy+OSF4EOUlCX9G
         NGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=;
        fh=qZVNYK2EMkCeqnrAPFAqkrhoOzCVnDLgWQCetC8UO1I=;
        b=P8fmTt04HzmzqfppGP1san6nowoJe+XuqY6ctBsPOKO+bMS5ux6Z/r7xZwtNwX/5ev
         3ouIucBF5MwPoufqEXm03+2PXUwDkadijP5ByN0MmvjuVhsWqPk/dxQ0s0y9ZQZ/rEsn
         J69ZrGSQltYZEo9dnbf1yYby8xDZ5cc9wqy1VRtfmnViZcMi0amJCq7AN0S8klpWkZtR
         0HMJ8Hjm3cehU6TicDwCNQboknyhkQSCVav/4arQcbQDlkqF8A3e8BgZczibZZdLV76i
         qqzlXlfFdHZdJjdTW72M0VX2Wa8zkKkpvnLIBc8dtLrr8syHk8gqwE/Zt9k+cfiaue7W
         xtiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794582383; x=1795187183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=;
        b=U4Lsip5/z5x0DqpikPpoT8wp0+jt30H2/OwI6A1wDHFpXDSnJdr5OcV7nscoV1XK5P
         AjKXiP+ALVvGtADcrmqiVs4gERyP+kVM+5lj+tnphiDwSdtIH3x9CsMON1XBK7TxiclC
         r84MyQofR3/iNrssTxiBeelQLeZWWZgtb7kIJfTBXxExq+m3Pov3IVhzeqQg8IsSH6xQ
         LYTa0qhuciUp20EPUz29XVlfsojVxun+3v9WB99KXhHpod1I6LESBBhpQfLw/Pm6o7Ra
         Q/On/T60KGkehCu0hTjeO5zoxJjosTDoh9rVGNvj0BwYKV74InRcxE1LmKyz4Oe2poH8
         N+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582383; x=1795187183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=;
        b=Gr9orH3FhUsWVRwIP6+U4nsbMzu6QWbAWQ3quTVmELv6NgDgm6ANS9W+11cZxFJw+7
         GChTSkO//yqQGFiWqACGHdamW/xmnCd1XDbKVb2ZkFSNPfYwNXFb7ZYVHDzxOpL2U+lh
         KXWN003A1krGJzwW2Bw0z9qk1iAsciBCiF07V9IX5/2pXgItkMhsBhoTIwkAdZEMvHa/
         OOelEojZR8P/aqFRwGVSREmxJ4DrP2jYHs230AC+53JVfY6ndX8IXj6u4K1TR6dYhYNd
         pMqBC4YVkGSAIiQEWjg9dYoshai0A2pOBK49F6nqz6AXocOpHThMKlkYiVvKJq/Ia0oz
         Rwhw==
X-Forwarded-Encrypted: i=1; AL+hErETRyCkd8eoOYvovyRZ3Kg153ktn+hT71ZtWQmGN5y8pJD2WRujOuhUNO0zF3f7S6EAmBv6bepf/4e8c7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vueza3+B0W6S6glR7hcHSzll5fqdefqo7Gtr1YC1ZOnKQwap5
	kdQfn8LILRWutond9h9cK+XpKu4eNvfv/mpxVHXvC6OYnwRmPUTO8F/gdIo66myF4zTazTg4RUy
	70jkBmWK/SYtxxkBSwgkRlpatyJ//uNzcVYPEyzB9EXcGm0M11OKUuwo6+TNAN5zEIef5nf/ba/
	0crTT6Pt79WtHDKmTDhrMDZF2HbKQv44Vlo2lIB8uVsJJqgg1rey84
X-Gm-Gg: AYBFou1lVALzc9BldhiKuBugFRKB4AIlOyL5seqGBk3otetlwM3m8ZHdXvP4LNP4hVw
	5Sanhf++vIyYhOLJO23KIm3eId6P/hpmD5kXSIUeLuBdjLdu4Ain8rG3QHsyMxqxwiY4Zhbuv9H
	F8UlfhchXLgjgUR6Pm2rAsdaK2mQUXGfj5oXBVTC24IGqUcGgeeLLza2SXHLDUQFK3Ghn+SljYo
	fAMqj77D8zL9WfGCqbVa+BHJveTw1OeCQr/+Iggc0DOk/ltmQVTLApfFFjkaq3rYemnHQ6QB/Ia
X-Received: by 2002:a05:6808:bc9:b0:53a:6769:c365 with SMTP id 5614622812f47-56e6328866cmr2333718b6e.12.1794582382757;
        Fri, 13 Nov 2026 07:06:22 -0800 (PST)
X-Received: by 2002:a05:6808:bc9:b0:53a:6769:c365 with SMTP id
 5614622812f47-56e6328866cmr2333678b6e.12.1794582382297; Fri, 13 Nov 2026
 07:06:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b47282f1514a9012ac51d0915afb83782c3c0050.1794417398.git.len.brown@intel.com>
 <CAFEp6-0yj-+7uYnj5PCvaP39ruQ=xduBbQgJc7MyakuPLJhmvw@mail.gmail.com>
 <CAJvTdKnnqZJrZ6bgaxsyy6QttGwgh5RL=De9ggV3KhMPDau_BQ@mail.gmail.com>
 <CAFEp6-2sLZkNQqDg7seE0ipZbuve_TZMjgNHV4ubW0Qs80Pyhg@mail.gmail.com> <CAJvTdKmGp6t44CP-smrjbm3aoXeTWvyUUM1Uv1w8UxEo3OSPJw@mail.gmail.com>
In-Reply-To: <CAJvTdKmGp6t44CP-smrjbm3aoXeTWvyUUM1Uv1w8UxEo3OSPJw@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:06:09 +0100
X-Gm-Features: AclHuK9bkZ5reHD91VpKpV7QwREy_Gm5RBl2twDjBGl-eypJtj0BwlEjdoR1eWg
Message-ID: <CAFEp6-3QnYgAwBbscorkXt=rROpt+iNv8R1=t-GdyDpHVL0q0Q@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Fix erroneous system suspend abort
To: Len Brown <lenb@kernel.org>
Cc: rafael@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfXxthz9eeRCvuW
 8FgBBbfvdO3K7z8E9VmuF50uFKpRJ9ctVC8JFrsHmBHr6jMlsdPDIArvYcfx/jOkG8DShcpAEIG
 geadbHKoJ7hzYsA3PNPjAO7rkMPiKcb2S90tOaaM94iQiJtPtopYfy5KZHRHo2c2tUxYLdU1szS
 5/lBER4a3L3gRem16ijn0z30gtSKI0Vmj3c5HMFJ+Sw/D9q6gw3P63LAwh3myiMo0SZwaGxOBI5
 DTf5qutehh/fQKluXHbx/zFTuwLVWlaA6Y68k/vz3QmP+qutP7SCTBhmh1FHJ+1xPBs3Ozhr4/9
 Pf6BDMOFVNwUudvhnlYmm/UKcltbdGsDZ+qJuXrW0bnApdqS+LCiuUQpRRsq+s2uEMgVPOd6qUO
 a3ayYrrSHNWnnc2yRvnAOC3QyaNskRgAemDpfFiLVDty/NpDClzzyj5rmW9qG8CrW3WegynodpX
 PnNtZsyDha6xFp/IN4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfX3bmjH13l+2Lu
 WyYKBMnXrH5Xwi5P5fkIChBAQNF015W34JEQ51MhevAN0TcTp+L+CWQU7uNvoEK5uVNlhxceeZz
 EJ2kpuPAN18I+OBnYfmWBsnpR4AaLcA=
X-Proofpoint-ORIG-GUID: gh6B11fhg26fosssOI0bbMNAW-S5jg7u
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af7276f cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=qTCYnKY_sxFd4FCAs5QA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: gh6B11fhg26fosssOI0bbMNAW-S5jg7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130060

On Fri, Nov 13, 2026 at 3:09=E2=80=AFPM Len Brown <lenb@kernel.org> wrote:
>
> > > This 1-line fix should be applied NOW, without waiting for internal
> > > mhi internal or development.
> >
> > Fair enough, but would only ignoring error on -EBUSY would work for
> > you? as this is clearly something which is not relevant for system
> > wide suspend cases.
>
> Although I've seen only -EBUSY, I would turn that around...
> Are there ANY mhi suspend cases that merit aborting system wide suspend?
> If there are, then check for those and explicitly abort system suspension=
.
> (experience shows that these scenarios are quite rare, and it would
> be remarkable if there were such a condition here)

Taking a second look, it seems that we're not propagating the error
from MHI core in mhi_pci_runtime_suspend() and simply return always
-EBUSY instead, making it the only error that is reported anyway.

So your patch is fine as it stands as an immediate fix (along with the
comment). We can then work on a proper long-term solution separately.

>
> > Also would it be possible to add a small inline comment saying we
> > purposely ignore this because of buggy mhi suspend handling.
>
> I agree.  I'll add a comment to clarify.
>
> > With your patch what happens on the system resume path? is the MHI
> > device recovered?
>
> This laptop is generally quite a good suspend-resume regression test bed.
> It does actually have a wireless modem, but AFAIK, the device itself
> is always unused.
>
> $ lspci -nnk | grep -B 2 -A 3 -i mhi
> 08:00.0 Unassigned class [ff00]: Quectel Wireless Solutions Co., Ltd.
> Device [1eac:1007]
> Subsystem: Quectel Wireless Solutions Co., Ltd. Device [1eac:100c]
> Kernel driver in use: mhi-pci-generic
> Kernel modules: mhi_pci_generic
>
> I have over 28,000 suspend resume results on its local drive, dating
> back to Linux-7.2.
> The most recent 3,000 cycles included this one line patch and showed no i=
ssues.
> There were 9 suspend failures on a run of 2,500 suspend cycles run Nov
> 8 - Nov 9.

It would be worth including this result/info in the commit message.

> I've attached the mhi messages, as they'd wrap if I pasted them here.
>
> Twice we see this:
> mhi-pci-generic 0000:08:00.0: Unbalanced pm_runtime_enable!
>
> perhaps a hint?

Thanks, I will look at this.

Regards,
Loic
