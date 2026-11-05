Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892301;
	b=YXIAHET5pzE5DVrbdEK7oFRTtH12ew1/OLD3SNIQhhIeJv0CoS+m9IxXIsvr9VJl4u00
	 +hBe8uH7Lrj82e58kBPxYkgiM6AfmUkkyXTNUifwIwNLwVFpID37fgvqvXNGA0c/dxF7C
	 BUmEMPVxhi1HY9GvrN+sspB9PbSXDJTFyBg1pjmE5vMFuQa6NDDNXQhmL89ZCxjPajQXN
	 O92gYArpIZHwNbmAzIHQ5666INczyIsIXrTQSJOALrGF7yHoRk0Vtb8S+kqpwrIqsQyhq
	 rYqcvRTXUFG5uN/bH5VOV+W363DvBqMpnjSWH2Ks5YEfjzR70IzPCqgcOmQYiB2ER1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=is5cGT3wh2YUPL9Dg0SD2uO00B3vUYDKCi9fHxqZYh8=;
	b=IiOgML12GZ7X/2j5r+7Vebdx7ahufJnJuAqe2E1Qpuopia8hMLSxA1zk0AXWpL4uzhC7
	 MtfqPOS2EHWjEAwNC4fzqvLZqg3CjXRZ4Z48MzJGuLPt6VnBu8Rv98jRWvqCFa4zUdFUy
	 /dIahoVeSUfXukXF8GvU47t6KqYo2fNsrGOdKszyvV6G/Yitxepo4yl7flk1/k+e+r7fr
	 PnHDFWnjP8Ptrl3C5UD8IQfxObLEG2Y2/qy7hp/Jy6kR3X0tp6GQ/AR2qIKSSkMlXLY3w
	 zVta5PehHu9F+K1LRxgJwFRJZMh6kf+FKhEhmzRWo/VgtKBM0L2FniWK8iowsplUqfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDPxA2rc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UnpKmAnK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28064606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28064606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDPxA2rc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UnpKmAnK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQHIG687154
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	is5cGT3wh2YUPL9Dg0SD2uO00B3vUYDKCi9fHxqZYh8=; b=EDPxA2rcw+gUfMOt
	5QBe2mpOHgSS9mr9OBH/hAnKqN8Znoxeoh85giv3EUds/mO0iMk4kh9Il2aHnTKN
	tG7J60Z1Yb/nfacF111+NjTuhNHJ+UEzsYm6Up0oXSFQt2Qz98zO0JXalZbAneKa
	PiaSejvAPPSyIpqYco4LtzEql0SdF8vl2n3Uj1La8RCSdfYe+er33yTHK20MYQjV
	thIpZtSC8K57/WHb9/JEDeI78xFIFVoU879oqpeo64rCYM/A2pjxMaxGrrFdgoH5
	MR5rrOwUOCC7NyWWu+Vt4ZZNk/4pv+OkV13gKzSJlas4st2h8mw/4RlR+oNQJXEX
	i2ZKzQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p1j4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:24:59 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679a3664e1fso3215302d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793892299; cv=none;
        d=google.com; s=arc-20260327;
        b=Q8ivPV7CJ2Rk3NeoI79mlFxs/w9dPUof2YEwRrwgow2v117PILTFK2LBpMd7EO4gU+
         jTVs7JNCkYzZvm1CffUsxANReyMZ5unX6GhApP9B8SUlNYAO1qURE72FxE2Ig2b3tTyj
         Ajh5JWnJBr2S2Ev7dlTB0SoDD1itiOXixcp/Bhat7/I5XJy7FZxK8ikvOI9+MrHposIV
         EcPabU7ZLKzmMsXrbK4tRNizV+CndPWn3USAPb8eOlRupNsZpqkwyi+M5hMpSwE+8S4J
         NgzE5QcYoIJHyO/Yy1UZfZ97y/xn2LXM2lk1qg9oSQixHEp2PNVqeTvcwKgZNobuh8mP
         EKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=is5cGT3wh2YUPL9Dg0SD2uO00B3vUYDKCi9fHxqZYh8=;
        fh=PyKv8oYmU9otkarDL62AoHtNB35cnhTEirLpo+4CD1I=;
        b=snDQBdGwhUxVr4QXCb48Y6zJwFp7OySz23Y7k6kdMg5qmurxmu6PbwRbQ5gcAeRwx0
         GWSP1WFnccwzp5hAJ0J5xBnZ8QjTc4/SEP3zD48c5H8UqeSIIcz3+rXLCsBMf4Hfogr6
         nmhYG127stnV7SNuGArerBVMWtWrllncEtVWMfjiI7Yodh8y71vFN83UVSN+dC8S7qWp
         IIOf5baWFAe4ps9e7dTMkk/TOgrJzsSoxIFsTppxuaMZyr2+b8TBPgpG2A/TfyXYdtGn
         kS+hAtmcHnWGGxfGzUN0uguTta3a2XsH7EgdVIslC/CDuqCBUeZH2oO5G9DR38KlhoZ6
         LAmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892299; x=1794497099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=is5cGT3wh2YUPL9Dg0SD2uO00B3vUYDKCi9fHxqZYh8=;
        b=UnpKmAnKh2wVAGupRDktSq9jL7sc+fKuAUUcWF1zCQwOU2QpsLvrRTe466+/dKTIBG
         tR3lSjNW1NS/8HryUXVf6CPMVNNH1UGqfq81cNSYif/7U4B59iBTDtMBhLfMoHSiYt80
         xpaVHqRe06PV5rF57AYIn7C2IhitVqUlDKZDvAoYW8MgVKPM3H6R66KuW1RqDNyYY9zh
         siX5Z8rKlABZoOHuAIwi+eCK6xeZUk5t/oLQf1NRqNdmZRqEBIXOfyvFtwZ3Fs6/YF5M
         yTMfm+1eiTizWq7w+Tbm2nSQ6cmrDSXQCb0cpTY/E0Cyse3+QLvtN5hwJPNPTk8/TW6v
         U0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892299; x=1794497099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=is5cGT3wh2YUPL9Dg0SD2uO00B3vUYDKCi9fHxqZYh8=;
        b=Px5uEanOtI3lvwP3aT3S8hHpyo5ePF9jsxG5G+Tzh75ebInrwy9Jqs3igffJbGsPbQ
         zayyv1aHHej+pG8iMl2E6XQggVHEj4ZNFQOAQvsOXLpg7xsP69w7o/8lu6z1mn5o+liw
         b114cwXk5lusJLOD7gHKbv2hRpEkxwBx8e3imczNdwaVxGowFhE0HTmDBwNCUWzxjic/
         rmPs2Q7mYpGcUOQLMaIatIceoKYICmZ292PlCFrFuX3Z0LoHHvRJG+m1VaiUlKSb0bN3
         HRIep3plJmDhgvStXA3NVPBkVxTf7NZf+05ZT6igNwH2Ud1k30ThTyPix0rJfRA5tosa
         0eCw==
X-Forwarded-Encrypted: i=1; AKwUvBxEG5rV4mu6fL0X5HMRiyL8SfNaJ5EP3SncOF9hMG9uG61/EW2yD15gIe3b08cEpYZ2Zmc/V/zfnDjqdUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vo5OuVJN6mbkUpegjtWrhUCpTd5l1EZD/M2nLCvHEpPp9N2Pa
	/dBfpvGMvVxvPtNWqKNN8Mgpjfr3SIl6UN33ag8ktgdT5PBhBcfo4+kXJOBAnwDHnWK2+V2W9RJ
	zzECz/qs7frj5xZvvgITMwAb627Mlf+RuBxT/uOzSPQe4U9B4P9jg0B/4UDc0rs+3uOQ2+B8vAY
	A3SDXSYQ3fDHxyHZSzg6uFncIrmD2/yndNUg5rdcuaXA==
X-Gm-Gg: AYBFou2dvUiHMemM6O6cgH28HOeUCv6EpXhxjZauhUeCs6bEfzohlGwNnYsQvGhjVL3
	2rfyI8NW9N8TvBzmAyGEKjHybCzPmuL5Xk7G326DxCfy3w7Gl6vxgyQ2KNMBMzAn4sf3tcoE2KH
	oiXFG687SEQ1rE+7Q4FRLqk9WhpOLVAroZn/BOs8mVytAO9X7H328dRAm7gljNlz9o1OOVsg27W
	Hu8Ipu4l5nEZ0EMHddgHqxkakwWCp5FK5DviYuq
X-Received: by 2002:a05:690e:12c2:b0:67b:f465:bbf7 with SMTP id 956f58d0204a3-67bf465c018mr3069099d50.47.1793892298996;
        Thu, 05 Nov 2026 07:24:58 -0800 (PST)
X-Received: by 2002:a05:690e:12c2:b0:67b:f465:bbf7 with SMTP id
 956f58d0204a3-67bf465c018mr3069086d50.47.1793892298247; Thu, 05 Nov 2026
 07:24:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260831105824.3141687-1-shukai.ni@kuleuven.be>
 <20260831105824.3141687-2-shukai.ni@kuleuven.be> <CAGgiveUQ9_uZLL=KgGtV0PNiBRbHhRVMqKxWwE3jww2asW98VA@mail.gmail.com>
 <auxzjSfifbLjPasI@sumit-xelite>
In-Reply-To: <auxzjSfifbLjPasI@sumit-xelite>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:24:46 +0100
X-Gm-Features: AclHuK-Ch4fx156Y_JLzK0BM9AiP5Ql_lVFBL18Mz8xcqk3vrZIIPyvXUC_ouqM
Message-ID: <CAGgiveVazq-ysbd1yyED2nKFXQ2QgaA9AHw89hFoZvbisi8VEw@mail.gmail.com>
Subject: Re: [PATCH 1/1] tee: fix page count in register_shm_helper() error path
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Shukai Ni <shukai.ni@kuleuven.be>, Jens Wiklander <jenswi@kernel.org>,
        Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec9fcb cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mw5mVQRo2VRv8ALKo9MA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX3/C0mTInNgi0
 R1EXX622TWjy2HVtJIFMyFyv9txG+GbVK8HCnFjxeZTEKcr2WLn4nBvbi737GoatODWAOeybJf+
 bsYY3VMUSHe0jWtuwqOuOTodiYLZYpXlQJ6qMdloRI5sUYgDa6jbRnnBHDjRDAL1jNB7wyrQsy7
 U2exsm6srl3Y1Ldt9pQTjGo85P3hZb22uFvq1JB4fEX8udLGsZWiz+gwyfkbrORUAcmTSawwaHH
 TZVBI26J5OL4F//pmHpQES5/407e3WYrTyl4RTkWPX8L61IHUqUUmSFgqEmXTjc+MxGUTQBXvf1
 IhmCPObH0fhDCeSjXpLLuD2/11jl4qfnIHBRHDV6YRs+JM7NIDNWr+3ALYcK0ZfpJvXdTBVpheO
 /PlmALMSgQKuO4bCOrJ1Fr7knYGr3Xoi76Ig7nQITTjvzFXmV5BhvNelib/RnxlRyaYbjGjkOzv
 apuQKWbosra3cB80fyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfXydC41XE49poi
 GJkM2QNtCvHq9vbeW4zlQASCY7eQKAl9uQH2PWxqyjMs0nG5JyzBXnWj+MgXK9/dIiYeOGhYqiW
 sGbCa8h33JnbJMcHzpVCXQGFe4/0A4g=
X-Proofpoint-ORIG-GUID: znghsc3zVWQxtRAJV6rHlhFwP3EfHG_n
X-Proofpoint-GUID: znghsc3zVWQxtRAJV6rHlhFwP3EfHG_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050061

On Thu, Nov 5, 2026 at 1:16=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, 03 Nov 2026 at 19:11:06 +0100, Jens Wiklander wrote:
> >Hi,
> >
> >On Mon, Aug 31, 2026 at 12:58=E2=80=AFPM Shukai Ni <shukai.ni@kuleuven.b=
e> wrote:
> >>
> >> iov_iter_extract_pages() returns the number of bytes extracted and set=
s off
> >> to the offset into the first page. For the iterator, the number of pag=
es
> >> pinned is therefore DIV_ROUND_UP(len + off, PAGE_SIZE).
> >>
> >> The partial-extraction error path instead records len / PAGE_SIZE. For=
 an
> >> unaligned buffer this can undercount by one, causing unpin_user_pages(=
) to
> >> leave a page pinned.
> >>
> >> Fixes: d5cf5b37064b ("tee: fix register_shm_helper()")
> >> Cc: stable@vger.kernel.org
> >> Co-developed-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> >> Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> >> Signed-off-by: Shukai Ni <shukai.ni@kuleuven.be>
> >> ---
> >>  drivers/tee/tee_shm.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> >> index 6742b35..fa446e4 100644
> >> --- a/drivers/tee/tee_shm.c
> >> +++ b/drivers/tee/tee_shm.c
> >> @@ -454,7 +454,7 @@ register_shm_helper(struct tee_context *ctx, struc=
t iov_iter *iter, u32 flags,
> >>                  * If we only got a few pages, update to release the
> >>                  * correct amount below.
> >>                  */
> >> -               shm->num_pages =3D len / PAGE_SIZE;
> >> +               shm->num_pages =3D DIV_ROUND_UP(len + off, PAGE_SIZE);
> >>                 ret =3D ERR_PTR(-ENOMEM);
> >>                 goto err_put_shm_pages;
> >>         }
> >> --
> >> 2.55.0
> >>
> >
> >Looks good. Sumit, do you agree?
>
> Sounds like a reasonable fix to me, feel free to add:
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking this up.

Cheers,
Jens
