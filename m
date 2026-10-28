Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207702;
	b=n//hF4fha1JIZsYodd+uHOii3S/yg9zrJc4KBy6LyTQBiRD6yMY1JzTCjBoZ5tSzePnc
	 tKyIeHynLq5omI6pRJx0Qxl/fwgm74RyedEf5T3MMxpbRxHUlmFJeoX9kMKN8h0zjDitW
	 oG+mCgVoNONtSVroPAZ3HYAwei0VRj9hsM0+KWYHuYOc476iPm0C/ORLt0Wi8e0FTlVvf
	 qbhdNJHafBy1twvViUyJnOS/KD5qlUbulBJHAAIGwog6JEWtdlo5dQOGua7qwRxO8EROJ
	 1WuxOcUGpF0ZTcvTEM3UooJ6YHNytf7e57k7hoDzoddrXd/LQ3fI3SFbWh/B2xZr8tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rPkEKa8G376PmWlqG2pXdXODHiWAvtHfvGLQI2zwKrA=;
	b=vWW6VICWMp146JxTsAXla2p4AK7QuL4/HfMtX3oTiOFCSb+il0bRQl8a2rwS2p4Z1hLr
	 aWpz3nwrjbms49i4Zj1zkVzjz2BTRMiW75hGozscaf9gSJ6X7vrVhJW07uUOM18w7rQ2l
	 6COTeiLjL2Opm8R6S9hxQMZGaf0YlFxCeUwEhFRpWvZLzSTokmY1Nxowe12Ui2der2RAk
	 C/4NL1ZKkTDu/yHfAG7p6is0BingO9RaNlayHIk1Jm3wUThRZ5VpAKzsPD4LRoVRH19qY
	 OKosgg//kR8j/fRSo/5sFSlwmoJ6PSdtndi+BAOvAFu4fRpWRG1MDQ1K1PWEyYiYwlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p3etyJDa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YFB7oOKu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B3A606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B3A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p3etyJDa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YFB7oOKu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB7cq2070914
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPkEKa8G376PmWlqG2pXdXODHiWAvtHfvGLQI2zwKrA=; b=p3etyJDag/XAgjGy
	BMSAyAOS0Ty8MRK6hiM0ljcdW/0H25SLDCssKgl7Yf1IJJmJ5b1L7hz+Wtp8kjbm
	4WxLxtrj1ItAqRt2S7CWXxh1Me2X8WT1BXImAwqDAD7cUIoC+cuQbGFS54PK5rZ/
	yOPghN36CTxg5eUbotSM1EzhSSUGWOyGMe/dkTiIaF/8R8/6aWVjR1wGVHZxHJWj
	9tyvIf3YULOuSNcS3mF1lB/CaUf17CJHP7QIn62VctPZ3P07fhJyT6YFfsZ6pIKV
	uSJZkEsBaIFL+5pAM8YZM6rInpeIyYGeoZ0vh90R2SiTIQmzOdMr5jSFfle5Q7Xj
	1hvi5A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7kdw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so1549024b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:15:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207700; cv=none;
        d=google.com; s=arc-20260327;
        b=i+q4oFbhtzqHInAUS5Dzm1daEpHMlFuScyWxc8wQ6XseqvmU3G2T7Pt4zPw6YHIyUf
         sju6zQUIop2tSYWL33sZFkBrQh+dhIfjWjMdk5jd6W0SNb4eIy52ZZG/Zu7IHr2fwVJq
         V7pbABrtzDmEhf/g5Jnl9gc7J5CBt29RfLz4NfWtsKUrj1X8/JiXn5syBX0dXlaScmiY
         mSJZr+dPg8EtsBQyssKwtqEmkefaK5pWUmCXzVTkcDXSV0bS0zme1EgOGzkE2GdhZS4h
         h/ZjaUK5/r65sJJ+ldpLe704wsSCsaxnqzNiYGMDsjbR92Iyb8mJAzJoVcqWf5iVJGt1
         YcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rPkEKa8G376PmWlqG2pXdXODHiWAvtHfvGLQI2zwKrA=;
        fh=Cl3wHgcBg5DRhmUqJRr66kknCdTa4cJTwlgTknJ25u4=;
        b=epIW9mY/gauzqGJFFOdBBUt3cLf1bmtrQElYGsAg/zVDzg41zpG5uMcpZSy/Kp8J0U
         nO5jrXTHqfaYEjSwtDD2GITyP8+BywdaBkoOHBL0Xgh5Ws8dU9cexWM/DyMj4T+ee3da
         n1slKqcEmPVbIYCxoLddebv9MKpz7dYMxpIWQwdfh5kooshDa9r7112Tv363HrirTwZ/
         oudWPhiR/sb/gIjEhza4ZzzyG++n+qNzMiuEKMG6a5EciH3JPy9xDy6HjJnCx0se8y2Z
         lNR+y2zDMPn7DpnZ/O84mKvpaex3Yj0whykOCGUWvbitnbP1s40OHWwcCpktod9jwj8P
         mbzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207700; x=1793812500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rPkEKa8G376PmWlqG2pXdXODHiWAvtHfvGLQI2zwKrA=;
        b=YFB7oOKu0Xcl8VXHAjOiScAOwTqy2U9t/ahKgs8f43OUGAYJcrh9TVh91ia3e0/Who
         hV/ANBs+1Fq78Q0oQkTCkTFdkEbAgXO7iGy2vP8l+xLFxvcg7TyDa5uZLcY5Gi2k84z1
         557CBbN4I1xS6eBkBgTtRKrscO5k6ZBOEbCWYXpS0y0gV3jgOQqnlG6j08KKjjRfrgmm
         RX6aR6He6sjKFmxmoY9Sh/rBolED+w0wSYj7HO/tS6OpJYWnhpvZpmTemSDacNnJHq+I
         /zO08AT4XWYaZAOoONQMMzdheovBhGkN7Hl4Z6oXE3vcR/FeAGF2ABZfrd2EmVeTPJcf
         N/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207700; x=1793812500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPkEKa8G376PmWlqG2pXdXODHiWAvtHfvGLQI2zwKrA=;
        b=Slt7A8g6HwYYipfUCjClaGSM7Qn01+FUW5KRjrEoLHj1VSgMjYpX51ft8jo2mNEN98
         OoQ9HYbBHBM0OciSbDwvQwFscBJ7qrhcrESLilq16FiBq8M8MB0i0Z8V10z0oaqeCQGT
         vv27xQuEpi8l2hgcDF38sFq3hGXyXghHsWfL+f9+ZpLylYXjpqbGEBxT9KyUyr8EkubQ
         0jARI7Dd76KKs56AvoCkHlnrQda5afTgKzWSHpgm00gbzO/FGAChPfQkDGcYYGecg1wW
         tV2fbO1P4fEr+cMtofkO1VCrby7Czp+9CnXOgH1xOZyeNg766antydtuDPvCUmCDxC2K
         cMnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmhdRuwNWZ5PowWhea5jO9lyvUc4BVvkxjX0ysjB9Jk+r9fwkjxs2HaTIKctkN5Z+yee6o0ZOPPGnxHK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhp1amVkEyFDjr0P/393hO/glQXBcx5tqP603T0sAdzOpHGAKv
	NmizSsnM1Z6jtJQfe83mdzZqNMpIbRJ5bGqwe1gDCsOCaMz2n7ZucmuUYHA7l5baLwQ2ucDaA5Y
	DXwBayIPhH21AZPpqnoItMsFHxdlsAECdDYBaK/z2NPvUhoFO75NEv0ZLMTlpaeE30X8nYWw5Jr
	1YBh9OBN1GYLU4Yva+Ms4QhZgRFBEbsECOf/J89Nurjg==
X-Gm-Gg: AYBFou2yLsgvC4+BKHmWiifKpP/x/Fm6VXxMlxIrGsh/wLWBBPTvWzIP4PGVBMcCSYb
	LUU439JTHRUjmXp0WQHW8ryjOhFTNOKQ3cXbUo9W2WnQFngGstVqidcL2o7Be7o6xb7gEtX+DOL
	44rQ0hSz19ECH+zPygi01oaY0WM91qXfUCos1uqr666xMFDEV0RXzXjeQ4kQ==
X-Received: by 2002:a05:6a00:12dc:b0:899:f331:9bd0 with SMTP id d2e1a72fcca58-8a6e7acc641mr2396679b3a.43.1793207700154;
        Wed, 28 Oct 2026 10:15:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:12dc:b0:899:f331:9bd0 with SMTP id
 d2e1a72fcca58-8a6e7acc641mr2396627b3a.43.1793207698757; Wed, 28 Oct 2026
 10:14:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1790742751-245571-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1790742751-245571-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:14:42 +0100
X-Gm-Features: AclHuK-EHCrebKy6iA5Pald63UEkwBTXlyUZe83As0cMNm4BVTN5kiHvHdG0-5w
Message-ID: <CAPx+jO--dmN6uxHXZbUL3prESgvts-QwGoNPR48Ay4rc0gOj1g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Let mmc_regulator_set_vqmmc() use ios->vdd to set vqmmc
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX718lKmMDoaH9
 N/27aIG8Nkx0e51oF0eVIA8GKSBxHn+8TV4H/jm6Ab01jmLc+6ZrMbA4QgnC3L1ErvUJu1Y3kZA
 rkJhtN4RNuuE0t+m/xEe+ajyiPEOQtE=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae22d95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=s8YR1HE3AAAA:8 a=Qqk-UaXwsSa3U4-5TL8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: Ks07CTly9-cavG5lo3A2j_gARe6h-bUT
X-Proofpoint-ORIG-GUID: Ks07CTly9-cavG5lo3A2j_gARe6h-bUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfXz8HVNQhB3m8k
 iUhiXsldrE/PhEb3FXrztBq2ZgMaDgK+C9dCnVz7IzKsc7z2n1gVMJvuM6+jz9mLu2p3RVGA404
 +nMDiTTrZ+VACODF59ksaio7Hd/syOgkgNUKQ76X/nfcxGE0CM4rsBGnlIAxyPu9lzvYj148DS/
 GDNRhpzYiKgfGxLyx1jvdZZftGXuNDMjC01a4YwabT6s02VRuw3XS//Y+mR6mhSwOKVwSSlqiRr
 VkKhRei9i2tN5cBj5b0L7iVG2UgO+LQNDcwJOHZRrTQYgKVjNKBAHg34j9zCBHwPytWVPqib3YD
 fOnOrTrNH6dd76cFlRWSSwMEj2k9F8rHYyATdQriB5UfL0BbaZzYxi4hTyLfQXwtx1VTM6rkHub
 SRBxuuTPxVehjfrZyvEzWHN8PwTpUQoPSBqSA5ZZ6Lao7aVwr8XS+AztUSk1nixql9NV9Pr0tcK
 SqyeBTe9FTpDleOXMgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068

On Wed, Sep 30, 2026 at 6:33=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
>
> mmc_regulator_set_vqmmc() derives the vqmmc voltage range from
> mmc->ios.vdd, which can be stale with respect to the ios passed by the
> caller. patch 2 uses ios->vdd instead; patch 1 prepares sdhci-msm,
> which passes a local ios with an uninitialized vdd.
>
>
>
> Shawn Lin (2):
>   mmc: sdhci-msm: Initialize the local ios in msm_toggle_vqmmc()
>   mmc: core: Use the ios vdd when calculating vqmmc for 3.3V signaling
>
>  drivers/mmc/core/regulator.c | 2 +-
>  drivers/mmc/host/sdhci-msm.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.7.4
>

Both patches applied for next, thanks!

Kind regards
Uffe
