Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F16036B054
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944906; cv=pass; b=bNXwSKjE2BN2SrTkL0oOZlwG2OhNr17eTwPrxrwkFuZj1OrGWt0qpMCEYAx+jK1py38fT625MZHDn3/tGlGB4fWxeiyG/oTEcieBDarR8RkCHPPXhqAEEicCVlr6Z3QUztSrFLmvkqU1Im0B4FW4gWRDlgzMrolfPd+mkYTt7oU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944906; c=relaxed/simple;
	bh=dRZaT0v2TmBZvF8WsGQdtfCeSyKpr6m0eRP3xCHKJKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Luw506aEIrRU2EwsdFiRuUZjtezvBm6M8E1755I8R55LA9Mn4pKZZ9kZdBoLVC00t4Ydx9UOcbZDbykNa7SWLb/v/12oX2sai/OAqBg3g39hqgeC6uao045QvfgthWKzIA4O3e/erH0oNHYVyzWgJU6Obvf/q3tDak6jLazQr/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3mYYKpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPcKklfT; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3mYYKpX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPcKklfT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nm41208269
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 12:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRZaT0v2TmBZvF8WsGQdtfCeSyKpr6m0eRP3xCHKJKA=; b=O3mYYKpXAsxABBqg
	U5I9dO9TF1exTEE6OcmhZO4qCL4JuCSlZR2Vq1f+xixjOvNlSWt3FJe2Mk/z4lw4
	ICGBunk3IUplElpmqCustFs8VuuJl6zWFMnn/CCGf9NuAk+U4NP+nOFEPextLLWF
	XNEJ+1YMVt+k/WU7svtTTZ4WUa1J8flu9MTt+kwR9HpitjFWvlVEnMxRMtFBbEZo
	i6ol4F1qpArcWZ8Wb06n238+s8bTSlM2lGXdh1CWmdXjFOF6XUFRjPp+IrwaiLGP
	c8+jhStmkQAwxnCLJyvHcgI4noZ1JLSLXAlpy9ltVsRLj3114cMfANYuXEkjTJ4b
	uHedGA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v033e3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:41:43 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-677afa56a1cso739046d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790944903; cv=none;
        d=google.com; s=arc-20260327;
        b=q1Kc7qNKG1frA2/sjg+vnMbdWokyTfkaVTHYhXsLm3XBvdYdhHvhry7W+ZVoZR8d/v
         Rl5sUZtaVYmYFAu6VRWdBGUVYzdszizPCSJRBNjXi9196dbIUAdXmXaSU520sRuKhzTj
         fdQtjA2rIaPcapobPhXoPXMc6LwgOl0BbhVVsTm0/g+sO5ixFeFqrB/WNbJ13XIvjwUH
         5jDxV+JT3gyWPAwH5yaujiZfHnw+VAxwDAIqlevtu8bmrb8UslA98FkaNroCKQIZMXzn
         R13E6ivKWMgUwgMmoygJ22Mx3ztZqnVIdBwF4U60Eu1LwPSmLj7pAJRsOpWsiCSn/iiV
         9GkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dRZaT0v2TmBZvF8WsGQdtfCeSyKpr6m0eRP3xCHKJKA=;
        fh=UR/XWuCWGxz2VQwFhD1VSmK+41bbJp4A0eykAYmwHf4=;
        b=TWBXb7rOJ2qOi3sLOaWf7Ke85um8ZHXa0ud0Ad9FSCCE0DXdEAp8KLNHiWv25jZZc7
         Gci/tyLoBibtCnF2uvQkVsYEIEf+UMBkPPxGSbPu8mkTquq+a3X+q1Ild8c8vwqLHohh
         2c4a2MK7J8eLtZkv4OY6C+4iqqUtxwzcqJ12xcZ25Yg0ZwBaEPijlxLceCYq64Elp3Xw
         O60Izzyx5ZrP04v7BrLUsZhwO8Rk2Q2MherADPXLR+TCgmjl/SwUu/yLkkPGN1m6H8MP
         JdibcoBOS/o3wj4GfbkWLBzwyyv2gi8Tu6Tghp5qCZLY0MecFhWkbfzHG4h/VrVuhssC
         ZFwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790944903; x=1791549703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRZaT0v2TmBZvF8WsGQdtfCeSyKpr6m0eRP3xCHKJKA=;
        b=WPcKklfTneghZH8u4CPEEJsYMhJic4tHkHxoXw0P/M2rWKlwFkTGdQlZVE7IpSbDhg
         RTwI8fDVJQjp54wzCZAQisxrZGT7yelyizcApclrkZ1M1WC6YY+S9a7V8DKoYKuU949h
         rlZKKyQjQHDvOy0xBoxHp0/S1iomudWSrCGgAEEFe8hlkphmzTBeaq8u93keTG2eQGvw
         eH8SvdRDCGxuCAwXO/XR5/uQSw7zjEV65t8vv51Z+w/NTUy9EI7lwvw/vepB0pk91lrC
         6aKis0nrM1UPhpFonvY31ql+JcWwf7N/UwpyXXNoGNwNdsUdl4Wt1moH2gUAvXwm2KbF
         WLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944903; x=1791549703;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRZaT0v2TmBZvF8WsGQdtfCeSyKpr6m0eRP3xCHKJKA=;
        b=N8k5jM7TiXetUD8qBHgUxUiMoYtvAeMzZYmbeNHAHQU4ZyUEO0FS1fnTK+CUE9+EgR
         HODKldU7+AMPrsSM1+VFqmf3dZcM0AazpDKR98o1ZGf7NWEa029QrI82eo5EmyDspX25
         aBrEBB3007Op2y4UhdADtAb/+TeQpHyCfGGXg3hdzsaFd1Xo83m6IYOb+pTHDcoEKe5n
         YXLjyohPjHI9dOSWr8jCJCJXYZtnZYgOHFYM3XasFljyzZZaKxUVLmmT4EqkMuSuqEvz
         WADApFfcCvL0p6bCphOIeXm1ngnFYxfpj/+qIs+MV40y3tZERvxLXo+UelrFdZaNOLp5
         vMNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLu4XGfMqdEXg2Owg4/ERC1k3Lq0RWW8O6yKbHh98P6+TleXxmUMXOp+6mT6iS1JHiukiDInQmP6qgInQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmfOquATJKA+gXUhT42oYBZxpdYonUID8Q4Ylx5jaN3Ar67VGS
	vprwzJpFftXYg4qs1RKaVjR7hUaA+oMi6Kpaz2SjcPebVWpbR2DzhhrJfKUSfo2koD6hW/R+wP5
	oim5O5yvBQCyguOoqpveSoRQJct/YoEhEA8oZPQMCTcLtuHL+GAPEagSjZuS3lOKJ8NKWp1MpxS
	lb9ZavOI916oklt7uRlLj9pA7/s2rhQWNQUUfR7cEpx1Xn57rHMwpD
X-Gm-Gg: AYBFou3Lljgs2C3jjNb4RUu5HxIIjDND4fOUuFZPKeIUqa6D/iA9Dz5a5Z124Q2kP5N
	TBPjaondQZVc/mqIJxWPEDZRJl3A0SFvWqlw8ZGE/YqajzlYAtyvPHxrCEUxQnsYN6lDIvoXKoP
	7Td54KgbWvRE+NyiI3S4kf4ciH4Wjrax2l3zx/V6Egj5mSTHXEhdV3VfY=
X-Received: by 2002:a53:ac94:0:b0:677:b096:dc85 with SMTP id 956f58d0204a3-677b096e313mr536121d50.2.1790944902444;
        Fri, 02 Oct 2026 05:41:42 -0700 (PDT)
X-Received: by 2002:a53:ac94:0:b0:677:b096:dc85 with SMTP id
 956f58d0204a3-677b096e313mr536113d50.2.1790944901914; Fri, 02 Oct 2026
 05:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928143113.1700001-1-g.osokin@auroraos.dev> <ar5ZrHihBjaFKf5U@sumit-xelite>
In-Reply-To: <ar5ZrHihBjaFKf5U@sumit-xelite>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 14:41:31 +0200
X-Gm-Features: AclHuK-7c1iGj-ldS6d2v44_ZjTFL0eWnqOG7BeC3ANxyOwSZZphCREJwfZPF3o
Message-ID: <CAGgiveU894kL9YiLse+JMJgX0Ck7W_6ZQ8hfX=6KU7wFAr=WAw@mail.gmail.com>
Subject: Re: [PATCH] tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper()
To: Georgiy Osokin <g.osokin@auroraos.dev>, Jens Wiklander <jenswi@kernel.org>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfXybNYTVOpUykg
 c8OFtcKGmLPhdqDafm4s95vbNShvhbPWRG5nBAbGelFIMEB9mtCo27aDCHz7SpnN1V1BHWwq4SY
 Gcv4mJfZi2JZd1SYyX16gfhULu4ETgg=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abfa687 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=HH5vDtPzAAAA:8 a=EUspDBNiAAAA:8
 a=k6Az_GHFfqOohqVTO2QA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-GUID: DauiEsB74Sk3t1NfUEy818BfGLlNGwho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfXyAMim5SBTpO8
 A8n8OiCagjurZgoI0WGqpKboQr1zDWSAItj85oBuJlJ1dHo+nYgJ4h8ivVOetPicet1bV3/nG3A
 N9fvTIlvdtN/pAVO8pF01wW/Ll5x6rC9EI6ZaMlWLRfzli009o2RwlrbKSMJqUiMxxccmH2T3px
 3kPOEN3288/3zVK2rSOg+tMc8+XNaztPLxzxuDuwzJ+TO5UJFgg1rNaKSMfMS4H7WPZTWqBsHZb
 lfJ8Saa9Q0mp+RM1fLS0Sck1tW0RwT4q/JQ5E/sfYHYamU5qrKKqpHBu91wG5V9NCHC5aXTteve
 GK2d0lmO8K3ZqDnLlflVd4/6FIC6z7TX17MdeLwWCAF0rUd6pj31hk7rfiZhVJMSaiokTHE6DN/
 EgBDY4o2MZTDUoRMuK5Q+YbCT1pCgQuCxsW52TtC/LzgC4SCWH9x8xGa0BLGL+j0YYStwG0vmTB
 59Pu1t90iQQcuhcYLzg==
X-Proofpoint-ORIG-GUID: DauiEsB74Sk3t1NfUEy818BfGLlNGwho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020050

Hi,

On Thu, Oct 1, 2026 at 3:01=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Mon, 28 Sep 2026 at 17:31:13 +0300, Georgiy Osokin wrote:
> >tee_dyn_shm_alloc_helper() derives nr_pages from a caller-supplied size
> >and passes it to alloc_pages_exact() without checking it. For size =3D=
=3D 0
> >nr_pages is 0, and alloc_pages_exact(0) calls get_order(0), which is
> >documented as undefined and returns BITS_PER_LONG - PAGE_SHIFT. The page
> >allocator then trips its order > MAX_PAGE_ORDER warning and fails the
> >allocation; on a panic_on_warn kernel that ends the boot.
> >
> >This can be triggered by TEE_IOC_SHM_ALLOC with struct
> >tee_ioctl_shm_alloc_data where size is 0.
> >
> >Reject a zero page count, as register_shm_helper() already does for the
> >register path.
> >
> >Fixes: cf4441503e20 ("tee: optee: Move pool_op helper functions")
> >Cc: stable@vger.kernel.org
> >Cc: lvc-project@linuxtesting.org
> >Signed-off-by: Georgiy Osokin <g.osokin@auroraos.dev>
> >---
> > drivers/tee/tee_shm.c | 4 ++++
> > 1 file changed, 4 insertions(+)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Looks good, I'm picking this up.

Thanks,
Jens
