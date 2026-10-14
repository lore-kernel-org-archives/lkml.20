Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CF94854E6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964559; cv=none; b=jNhEL4NhhFMP7xJX17t1qFy6Gd+mnSctMjk1BKv0mGGy6KqtOUQR9O7oJr6PYnq+ahoYqNc10x+neOOrqKaiGs/3GLqgfe1iOvZXW3yJ6xTdG1KxnvVHxAxYHsDe4lloySXnXO/V5PiXkjuSM7BnhLXMciuifAkFZX6OMOcOKm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964559; c=relaxed/simple;
	bh=zKPIcvOng6sOoWT5GIAeoysX7DOIQXuoTK9dJ/h0xXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOT0rOWmF3mO3YuCid+ocT6yLnVB2Vz+oPKOK+f7Fu+ahwU2f76G1Yfcbfngipzs3N0VeYQ7kFuYUX50WoERHMnt/ibW2iDQNIsmtxpkO3DNTnvedXeNe38tBsrachLDzLHmO7qb7Hvx5EjSABeXh8iHv3i4yEMEQYiKO1DeP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHs4u3Ep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UIBRQqfv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHs4u3Ep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UIBRQqfv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7teOh3017736
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bwcuSGY118ee4NtPshCbzgah
	LOs36WmQjPRzBW+ykeg=; b=PHs4u3EpwD2o5FmrXfWp9HYocPJHSZz0vyHlZESP
	Ktse98DmzNlcGuoCykVY4H5PAQQqYJ2mk0DNEzoxeWk2qSB0YZuj5zxVTmXkfjfr
	iCdKk1ZZmsNeSq0XfHgJ5Qq1Yb8YRmN7BNo0yBmrO1x/o5i2gnX8/3pc5cfdURRP
	B2Vj5uSs+5bMBw7eag/+lFS+wkBShxgOXUVrzkCYZugDNA4ZiQkipS/6NT7CZlnd
	0eTt4hyVhXBhiWWEm7uJ4zAkL8FXWWVqh2WyHnwifPrn0xzh8eNsPEgHfTUvcnhp
	XRpf8LXXMHNzUvKagydjtfwWYA7/LcUm4vSPgUrWW51k1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b357x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:55:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so179202a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791964556; x=1792569356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwcuSGY118ee4NtPshCbzgahLOs36WmQjPRzBW+ykeg=;
        b=UIBRQqfvnuMMVDVBPjtzFwSEWPPEiQ0Mgi9Uc0lu7eUhJ2nplt1UttpqFmxeBXPEuo
         CRCk+4lGhicUwmRvPUyX2RwpuhAh/oHQIi7KQTFyCxVHQ0pN2sFKCshO3A88g5baqxy7
         pI8LQe6A8+w3Sk172Xx4aDZZjN3MG3aIDlgprxTAX0UcZJK+tpEIl2EdeiC5DTd2EcBv
         TpvGhiMrbn4VC5MtUKJwjkFsMhySMsO94KEcEi464IOmQH62zlRdQfeNVA6I60OsvMTY
         1X+FuJRs7QAQMLdrE55VYWZI2Uuug5Xj/XXdNCk1CFTA+LwSJhXiuvoJ8yO++2fX2uqJ
         dOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964556; x=1792569356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwcuSGY118ee4NtPshCbzgahLOs36WmQjPRzBW+ykeg=;
        b=ITeMog5KzCml6M3uNazTIVVH1hv20lUI4+McUhsZeEjZMy4nTj1oSritOayICq+gOO
         DwD4pd0gtpVog9GEq3uL3Vn7a2G0b7exyeDAF5gEOcvfXTHcKad93qdSXXAsHafbN9VX
         7CrDUVaIZVA76N7rBr2ozXvIzyRn8vxbYhF133G8+A4Th/Pi2jPheuDNovbXTeEPwJnu
         BR1uYn2F4VNMO+Q0y8KNB8p2BkJM/3VYBuOEujy+RACW2CCYbero5kVWr5qAZOoqGYpn
         LhpGojpKj3flepljZI/mqzD6lnZ5M/uqSWm49+36NMtkAjuAro/qAEc3dFaJ5bSRoFu8
         ywPA==
X-Forwarded-Encrypted: i=1; AKwUvBz02NNRW8fJpTUA3L/RCyxpOzWiqsJ2hBYEWp7dvOIHD6aSYsTYzxOAbGxGX1eHrf1WZYQGK6q8h6TXKUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQpsQbZizsPnFcAkc/L83vO08JWSXjCowEYzEdcCrAsbQaGRST
	sxjjWT8K4muyrNd6vXeSAzq52BcFoOdEqRK9i/RXs9FsZqnftDs/6u2rUDqP3/2qIUqemLNV2Ji
	tP1iopRotsLj7CQGLqFvwDKwQJS2OfU/AnlUPXA+JeRvHUp3bptlJym2jkdGDCb04JHEpZ4ysKY
	LkcA==
X-Gm-Gg: AYBFou1ogTWM3jrc1nzG2cFsraBVC1uiflSDYLnVV/QvQumQwkvSZKWw3rIALWSa9XR
	PyXUUoI8BSVEmwz26LWUmLtReZdr0qFhpffB6103bjpuZ8hQkz5soH4bHLria4rD9prt2nTzaX6
	9wH+CbSoCn26KIAyBNgsuFxNqaFPW6brcK6X4pR7kSoIYSk4jV4InoTs+Gf37ElbW7VVLDUQ+ML
	1KvPuEkLq/AX64FrkK+xulVjDnWHdEm2UMjdviO3C4EDgWxvlpNj8X1wntFYhQsTtk8EtSfplQN
	qUI/TSyCzyJ++8sSvdvmc1m/hlZNbTtzDo+zFzsVIyHggG/WATRWjfScIX+OpVTPhbI4kDHVScb
	aoMF5HnxXmQhrVgDAu6nCBqNml5jLy5gYRTdXDOuXFw==
X-Received: by 2002:a17:90a:c2cc:b0:3aa:ee83:6f2b with SMTP id 98e67ed59e1d1-3ab3a955970mr13203664a91.13.1791964556232;
        Wed, 14 Oct 2026 00:55:56 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cc:b0:3aa:ee83:6f2b with SMTP id 98e67ed59e1d1-3ab3a955970mr13203609a91.13.1791964554428;
        Wed, 14 Oct 2026 00:55:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f2ba9efsm3255828a91.16.2026.10.14.00.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:55:54 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:55:48 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach
 at probe time
Message-ID: <as81hN8Af7CKCYtl@QCOM-aGQu4IUr3Y>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
 <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
 <as8zq_GMu1pkoMYA@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as8zq_GMu1pkoMYA@linaro.org>
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf358c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-9aZd_Kv_hcnAOLhCNgA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: spaljonb5mLSW8NXHU9BLNfGbzt0MiNK
X-Proofpoint-ORIG-GUID: spaljonb5mLSW8NXHU9BLNfGbzt0MiNK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfX2oCT88XkonHl
 JsiUuxmyD2g7dFVynHuzunArMm5AHIqRVHgbWiejjJb6/wNryqzrWq3j7R9IoxDUsuCVU5UTPT0
 cqsdIkqXBnJlVUWq+xrMJPjuRZf/gGUTR9FmwrJFAE0+uJPy+sgWEBboW6lXRSQl/5QeDXpIknj
 Mr+rpRbsP1NeZhi3X6cEEeUAxIt/orKnMOC3J8be+aILWGkU28Jg9mZAC+MMf0vOpf7fKzitpnL
 H76N4AhAzNE0+bIY3GlxAreqdWMCIo+eXL6w2MnyHHAg3l81i+BeCYzB6DKLiYLFg4MhbOncZ8l
 +Vqf94ROGwhCXvU0FqXkhrzQ7nyGYrfnvxATnh7JbThQ/FRwPRKlSpT2Uz76TMP0vk4vujVzACN
 yWFHQN7hbKG/hx/gI5wgplhMH6Sz37PZ/FBv56vgTGk/mmoBh1u+G4pSUFUICaBJ39YECkjMbmU
 u/1c6Z+nSIcWdKfefQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfX2D4NcfMC5htd
 yDW1uRZ1gUnb3lesFv1qdyXZcoOeazqAjWk57EE6+KQcyDhBmgi7Or4ZkeOsaREYtBYb/fHE/Lx
 Sv67x4BU8geAtVXa8hwhyTZEfRNERTc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140031

On Wed, Oct 14, 2026 at 09:47:55AM +0200, Stephan Gerhold wrote:
> On Wed, Oct 14, 2026 at 03:00:37PM +0800, Shawn Guo wrote:
> > For early_boot subsystems, probe unconditionally marks the rproc
> > RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> > bootloader actually started the remote. If it did not, attach sets the
> > state back to RPROC_OFFLINE and fails, expecting the core to boot the
> > firmware instead. The core does not do that: rproc_boot() treats the
> > attach failure as fatal and the remote is never started.
> > 
> > This is hit on Nord with firmware where XBL no longer brings ADSP out
> > of reset. The remote never publishes its inbound SMP2P entries, so the
> > very first state read fails (debug print below) and the ADSP stays down:
> > 
> >   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
> >   remoteproc remoteproc0: can't attach to rproc adsp: -19
> > 
> > The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> > Linux has not yet interacted with the remote, so there is no reason to
> > defer the decision to attach time. Check them in probe and only mark
> > the rproc RPROC_DETACHED when the remote is up and has not been asked
> > to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> > path is taken. The ready state is read first so that a missing SMP2P
> > entry -ENODEV is treated as "not running" before sysmon is queried.
> > 
> > qcom_pas_attach() keeps only the fatal check, since that is the one
> > signal that has to be acted upon once the rproc is attached.
> > 
> > Assisted-by: LLM
> > Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Cc: stable@vger.kernel.org
> 
> is still missing. Would be good to have these fixes backported, since
> the original change landed in 7.3. If you used b4 trailers -u and it
> didn't add the Cc tag after my message that would confirm my suspicion
> that b4 won't pick up that tag. :/

Oops! I should have added the tag myself.

> Bjorn might forget to add these, so it's likely easiest and most
> reliable if you resend again with the tag added in both patches.

Yes, will do.

Shawn
