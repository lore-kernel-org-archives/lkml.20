Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687252FE39
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995048; cv=pass; b=MY/O6e1Is3jswqymgTiMww3g6immpLKmqgIr2xnZ1+RfNrg2Cc7ZDRMZQ5fOu5d1ryJhMgjDbOpUEwC2PtZ0fY0xwzupbj8TDA05P/DxCdSPsjuyng9Ykxuw6+VNm1i4ilUqoLEnroM3fiWIB47zJBy7baio5qDnq2Y9kDO/R7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995048; c=relaxed/simple;
	bh=TSS6WZYP178ktf/6Uj9ms2VHwcGUTf5mc6UM9j2rugc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwBmsN+EN8H7FO8d5BfQDgJoDpCN8L82NwB0E4TZYuxEE0rnT7d4dvuc5jK07ppFGyosAKeKzX0mfO6UUrrG1nK7ZM1j/xwn4hS0THd+4KcuXvfM9W8MBnoDD5kX2pHJ0tScBP0iFGk4XhyUvujsAaAe2ZII94g4ChYo9xJRgIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVt1quCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHROzcUP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVt1quCO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHROzcUP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbEQ3301075
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=; b=TVt1quCOhk2aJt2L
	WDTmchuxvsXQSrm6aFnTwnuNdAeUccpUmLuieI9w8wGlC5/ettWRGulXh3iRo2uV
	JH7PDqufGPJdmQ4tNxQoqfa+PADZc1XtieAy+d4s7pZe0AFpiLASqJLr5aWwcil4
	mSVl9ZoWBOr1cuhtlXX5WwH2ha7SfWcjAI0utaiq1irYwRn2muxuT9dBaYMtrziy
	cIZ/nliVPnypcI6pvmV2Oh0i9oi1Vwv6VIVcRaiM5u86fKNZY/NLjUSao+b9AKuf
	SOpafrzLnm07/pxEzoHM3Bvalj2/95ugi9vzZsp+zm9uDrWDYIk8rlUwTVlPkSc3
	JEFFEA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4622gd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:24:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34e650cff93so738234eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791995042; cv=none;
        d=google.com; s=arc-20260327;
        b=qCjOuF7SGqfhNpqPJiPbQfZ/zTcEtZPvBuILzCMRgUxDznYvW9QaAuclOzaA2nQjDq
         ZJcrq8OPRv3NePg7+0t0ysuddl8+Fkpx/FG4EH75U5t8rpFJSDCW1zlCl6ZRJaSkUXeC
         aib3P9wf5W/hujlTH9LP2QSl4gXPwVW3UqR75Q6DnXT3wbWudh/OV0YPuLs0mmA1e26f
         h0sBvz8DNURfOkF3sJp7xgfWhXU7wzAdai11h1BjOnn2bVz5cScDYwgHc38SsFUIOhEM
         oyuaN2ZDT14I01C7OstUuc2DpQKGeoshPHl7auHS+44p2wbooUXpZbvBXxD2Sig1TCzp
         GQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        fh=9KWu0OKxXF+yMKTrw7nLre/h0cIBhF1VGs5hUNo9K5I=;
        b=qiNcvP6FrAEkr2XJCi1vC0DU3cg5YyH0p+QEs1Bgw92S5bePSEur1Pr6AawycbG0d/
         bLAB6pJPBO5iFTy/NyJnGQKceWAzE3+2O8T67SlFMxdjX4yrnxcoyrZ0/v4DovrClvc0
         huvqgeEXMD332NtBsHQJsREiTQL5pLMAABZGLEsBLqR8v/ceOTs2NFKKYGZXW7F1IpPc
         6jJdG1+d4BUSpCjbriM20zKjhl38TzR3zgayZyrRe1xAHuChte2dpFVQbXBFGms4M8r5
         FnRWu5FAxPnk+ymOsVK0QtcBtfKq/2QS1ZPDab7ZUbHxgJjMU3ViSPu9MZu5C+keppn9
         BQJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995042; x=1792599842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        b=ZHROzcUP+sd5qj+PnTkA2NjxR5mbeYwnKiWtcoWNkqlPpyIKjN5k/YO4XadXZSd2Km
         bZZJsFa4Nb0Uc18OdgKqaU5iAb8WNdaCwf+ipdQBcCOWdZGpV4xNEKC9A31FaZghyfNH
         Tba2vgfjSZpX+fOeACTXwh6ZLX4sxGxMrgISbuZiOzIcqBfKQ2v1lKJA+ZuGHCiSL0RC
         OPQ7Xnnuk+UEquTFuK4SpMns4XI+KSRV+6uSx0a9hCQGQ8SDANvyIzFYYiGtC67Jxv1v
         xV3iOHnoncbWYYwRkr2Brr5K3YrcoJwzyEhTUeBafDytsJnjqEBn0BRSbVKH82YnNHUE
         EtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995042; x=1792599842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        b=xlgmF5OltsMR/HB35zV4VfZPTY5UgVBDemTXJCX/U6Efd1dTavk8P7tZ8vAwt8GND7
         6nNhMcbYH/U41f9bdTmrmaQsWIxDaca2ArDOzfBG0AMumsonFP8Sf3OACzvQWH1lhNez
         X9tXyldykGlvdliG/PFAxI3ItdFmmszdSDNvxgAkOP28X5dyfJmjQCS7Hkli+vPX3aKO
         VKGoiS1x/hmzT61MO9BadX627AzOCel9Ji4SfDwfp5qMm2kELlNwdACv1evz/PC6IzET
         QlknLW2DnEubQPrquBZqjWeBGcMTBQQGcfytBeKDQa2b2QFTNhkY/awp4n+PabHUMFjq
         wmQA==
X-Forwarded-Encrypted: i=1; AKwUvBxtVELT7g4XJwxyBrfUi9Wsyz7T3FL6szGKdSga8RIgqHvAh0jDMsOdmGxb97mh6hNUWgpFgVevtiKGyJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpL80E41jlzAbOTDKaXc6r2Dn04gfaFYKJswZ0VDmwmlJJhqpA
	fns63MHc5I9lghWunp/AQJn+/ucKi2ENYqywFJWI5LijnrvOhbOUnGjscSdbJaIQP6RBI4cMNT1
	BVx2RKmpPP9FbX2BkPosmZ784c7JZkQsdrugt3Nv9lVN9ZBfbRFbvtCLTTC0HXm8jzq+JbiBzu5
	4WrtubVi3B+7cdaatJzwWSSkrUAWw+P1WaLIM0m0nO/g==
X-Gm-Gg: AYBFou0URi/pBX2lZZJy7zhNTWLbVn+6AUKiLhEkuiyeX1klJxnAc88x4mOrF/tivVh
	aYkeJ9BtnRFM3eRuR661LWKtuuRoE94CaHEerln9k1yg6ws6qsGwQsH4MvsScsKSB/LeVhNidBs
	vuhKmld98m3HHhoEeGjtN+R6oHylYgl+2Iypoq6osZTQ3AkKyIINkpgAt41THwQIfHk2mPUGUm4
	aIIHqaX1B52+X1NYw==
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id 5a478bee46e88-3537dfdd089mr41541491eec.1.1791995041950;
        Wed, 14 Oct 2026 09:24:01 -0700 (PDT)
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id
 5a478bee46e88-3537dfdd089mr41541456eec.1.1791995041308; Wed, 14 Oct 2026
 09:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917064825.12747-1-jtornosm@redhat.com>
In-Reply-To: <20260917064825.12747-1-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:53:49 +0530
X-Gm-Features: AclHuK-uImdXK88rnU2XiKtyAUjSR6pC3yRcEp_C4bR0864jreBK1-o8m4IfHpo
Message-ID: <CABkEBKbHhxNsx5ZpYCSDEKtC2UpR+PD4hSF1CeUOwUBkTq2XKw@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 21g6ufPMalh5DZi5q8aEQH-r0hPqtiQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfXx3iuZLD3/Y19
 I5i2q0TkUHuk/VfEijXcchZ/qktCF3BsUsO+mIMax80WtQkSQwXVpeMSLHwLOMEF//lQmBl7KgR
 xH2UhE+nNNzjaygapVGA8G3FJWrkiwHcDWEHJqIwrySkacxNydWfzdD3+/WECMsM3pzgiG8z8ie
 X0zC4g4CG/LeAkHDZJOO8Dl6RPQLcZluyNRI/FTTunmpE+TKabtPgacaHZBN5uvueztASnCQqqI
 Yv7d/0aVM3caY7JM56ZT3/BYmlIawwv+I0Rz1SY42CN0HATEV8EajWKu/fjz1BaUc9qHbAvDGOr
 OPjmx1SsJSVGyic1CUljrGn3u8f08IlWv1uTjHFgk/GqRWjSJ8kK4q+dxr/w7eNjHTB0fqgMYYD
 nMLSYU5biLz8e3cSX7G5YM8VZ221p8XzCCUH0HaOVhoeqNWAjt6Ll1oYicdJj3oHlckfZxZ6p+K
 iKgrnD9Q/s5azG/N/iQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acfaca6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=lWMnthoht6l5_8CjfcsA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX/90TtrwpKT9f
 YQIi32q6epCWF1xGMSos4STJPGSiulIFWEhXSpQzuDQisfYn4owQ0ILTbZynCIf4WZZ/nmeWwAg
 s22RSyoG9kV8+5vzbOZ4l0yzDOYF5Hw=
X-Proofpoint-GUID: 21g6ufPMalh5DZi5q8aEQH-r0hPqtiQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140065

On Thu, Sep 17, 2026 at 12:18=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> This series implements custom wake_tx_queue operations for ath11k and
> ath12k drivers to prevent hardware ring overflow issues under heavy
> traffic.
>
> Without proper flow control, both drivers experience -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> Additionally, ath12k can hang under sustained high throughput. These
> issues are more commonly observed in VMs with PCIe passthrough but
> also occur on bare metal systems.
>
> The implementation follows the pattern used in the iwlwifi driver,
> adapted for ath11k/ath12k hardware ring architecture, checking
> hardware ring space before dequeuing packets from mac80211.
>
> Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
> and improved throughput under heavy traffic conditions.
>
> Jose Ignacio Tornos Martinez (4):
>   wifi: ath11k: use queue mapping for WCN6750 ring selection
>   wifi: ath11k/ath12k: remove skb parameter from get_ring_selector
>   wifi: ath11k: implement custom wake_tx_queue with flow control
>   wifi: ath12k: implement custom wake_tx_queue with flow control
>
> v7: No modification in patches 1 and 2
>     Address comments from Jeff Johnson:
>       Patch 3: Add the defensive pattern _bh in both spinlocks (ath11k)
>       Patch 4: Add the defensive pattern _bh in both spinlocks (ath12k)
> v6: https://lore.kernel.org/all/20260811172435.616200-1-jtornosm@redhat.c=
om/
> --
> 2.49.0
>

There is another series touching the same area: "[PATCH ath-next v4
0/9] wifi: ath11k: airtime queue limits, fairness and a driver TXQ
scheduler".
It looks like there are some conflicts between the two. Could you
please take a look?
>


--=20
- Tamizh.
