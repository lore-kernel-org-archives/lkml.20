Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793130526;
	b=Tl0Ko06tso3h+qbWOuxcH162AiuWoY4StT33Dk+PpP90Ev/UyaEq/9KbQDsfrLGtXG8t
	 jOUS7iOpdXUicF+crJewOcr+TUZ79uR51QkdvQ+Bivso7ui7IbmLLR7HsgKk9N9eChvHF
	 /9yqkVTy6Z6A1YEum69ZuQyFXYSrZqiTys8tUQaVYo2KB97fhCXziK5Y+w1jdepBu/HJz
	 NkGKffoIJdBVa4SNriD1HQ5AJsTOZmhZISidEYAmUkiIjpzmoObjD25mJ1LwVgZeoKkwj
	 vVZnduhw3ktRTjU45GYsVPFn5MKV2bqlgpKXknGa5WsxXQPcIpqShH4XxCsrOb0S8eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793130526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GAKDu3kc8j0CukIhSS6fAinefmQmtQ0RlUa2NxUx96g=;
	b=ZtddAi+GTuVI3RnwpfRAVeOWAiqkEqyDxCyWiasz1SDPB90pcPL+VuQaWN8qf31CUY7T
	 0di0ZLJid/8/2yQExJE+r5iRMykrXRgP6jgw8x2ZxuBZew7ejmvvpsl6BsNlPwfDIi3PP
	 qyYhyvyezUzEAKmTpjktW4jZzb6Vdv4QUIH8twL4abqtNcQvzov7kaes5jGq0tR+2Pqfg
	 M3LhfiReURwsvuDQlNz3hCN/PtF87MJ2/XQhU+bNuBsCS7n/LTPNeV99eQGQVIAOaN9bF
	 +tXOnXa4zWDv74TBdYSHNnjvS9wdD0A2rsatEXoQvXw/RKNEj/V6vu04ALcM4btxYfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1dGnmiq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KquNEFbU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37072606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37072606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1dGnmiq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KquNEFbU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHvwf2961223
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAKDu3kc8j0CukIhSS6fAinefmQmtQ0RlUa2NxUx96g=; b=i1dGnmiqrekMPq9w
	Xzr/PTr6jE4yd2oMHGcvTZwVAn76nugVn/W/6uC361hTMN0jqs4Ucro1XRBW6gPR
	Kr8jAuvazNVKdDNQnv1BshL0gIJKtCKzTa9U549aLSSGAz6Uw9N3tlPpDHBHc4JP
	ZtVtuUhOz4Sjo8E3HN8PgdwAcqk0KOmLD5+7BU9ZfHAe14olyP5x+FaMRCnZRuU+
	q8fnGLdQeE/FAbb5iTT2RQMF8MU7mIzkC0KNFBhcV7sNJnxCuvjDNMyT6hjsZ2Bi
	QojjPSqlcPC9gOCBLOuhD+fbCU4Wif3wYAwpULApJR1eAKC1ayYcpAw5bXwQnr8Y
	GaY2fw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy670xkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:48:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adbc9a47fbso250424a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793130523; cv=none;
        d=google.com; s=arc-20260327;
        b=b7vZPuqKBU1xm1ctUS5QL5Bvqerjb5cvubZ9PakeoyjZuL6SF1s+fwUvOuNGFiCb+5
         njHjK283qH459vmvU/wk49uCyqyYuWCigSdcxPNRmeKvvRC9lZh/vHCYcH/gu9JD1AI4
         TjjguuGSorgeQXpvFjM5k70fRit07b5d2WUSFjkf3PxSwuuUZuankzBzXtS2asH+OzTr
         HbaQ7NVsGyijNST/7BdeVfVctoIZ59GYZwRrcCilTU0izO/UysI1Fq1cBnawo5wp3n+b
         i0th4hxI/SIn3KoSGX7pDjyAHIYoqO119P3pJKC2qdiFbUdvlaOde22cfTnl2I/OBiAf
         IXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GAKDu3kc8j0CukIhSS6fAinefmQmtQ0RlUa2NxUx96g=;
        fh=DVAaJOu1IULY1XjPN/+EUgz7z6fuHLqYYs/iDr7tKQI=;
        b=DMrgByrOZdhaSyVhuHdW7zY0gbnNMinRWqh03tYcFo1UwIgGXSk9P4elwuCm9Dy8Kl
         ec9diKWnUJJ7d1YPVi75QPOfXlUdVl3W/aiiiylECdzkkWysMyZHIMLIgtPjJ+YTrAiO
         9aJPlZHZujsmnJarRY6EZsIAWHptCuxpyaMFhijZgvftZt4mNHhbKTGTvWsrxuqKQTAL
         PqLRgdy56glRkLgp2edkp21GA+eac7nG06fJo07xxHXPJjfT/HKDUBUsqWd0K6zdRxNH
         7iaVRrZYV+AwgS2/no/lNYoQdbKr6Tyvw8BBmDaFuarImucpqmpO0Bf7S2TFxI4XFLVc
         mEZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793130523; x=1793735323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAKDu3kc8j0CukIhSS6fAinefmQmtQ0RlUa2NxUx96g=;
        b=KquNEFbUYeNSs5/MMo3dWqTIFJ9akt0utPDh1FD8ntSVbuWDoulkIIAbVsu3nrXywc
         LV0njWiBslk66pVaGPZBpGuExMWErvlFfKSBSsEclQib+1rTyG9omidUFGKbx1kua+Bh
         LNhwD3JNpTjzSNNCCNmOkT8bFVP9wPIUZl8rBYA65iV65hK4bE9JuT1lozIZpzHWiCw5
         4y23nRGcdzYfbMWKA93mvgpPeh3xue2y5B2bVfTENkHjkG4qfqwLnWQHB+C5G0Za06lp
         j+FeLfbJ8w8pTl6Hk9GRzhzALhd8cAJCtEsew0CVq6XdjITDVv65e9xmD0D5DS67TSrY
         pS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793130523; x=1793735323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAKDu3kc8j0CukIhSS6fAinefmQmtQ0RlUa2NxUx96g=;
        b=kjAza99xLo/85BID4MFRq8mqDpX3r2cHjIogZKFBnSz8jJAtecdxKrPcvXm/dVopxz
         Vwsz9ThghUwd+OpLS+MfeZHzY2UXen41ATJC20qJXKLp5NSd8kvhjKmMbLGOTlq5izKZ
         ljkR1EgWHtRISKqKqSsRJtfskTYNp7VJGRVjq5uPofj0u2RSP40vlYdxPOpuOJQoe7Fx
         rjEOEdaZLL78MLzZ25Myj+jHGOT7SZLJG8AWtCRdmKR5ldPcYi6wz867PbBMVHgyc2ck
         Nm8DMv7oD+9atcyVZcyIUDCZlCuzPT05rUuDT0YAmpsl/ij3yNxxI+c5eeDOpgrEsyLm
         ruaA==
X-Forwarded-Encrypted: i=1; AKwUvBxLjlSKByWKHBIgYtdGeNlhOv7yJgBNwM6Axvu5GGQKuNcwUCHyPghmu2Vu4XTkcorVlQtwdQpNjAUia4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVI+5oD8lyXvlS05p32Wt7TP0+dBIyRXl3xHDM5TU/U45Y1crd
	LU4Kp8yLH6QypPr2K1FsoX7OYrGKZgIv42UAWO2OQUB/n2Vf2lmK2Do61IKQAWXskDc8X7FmvFm
	XZ0JvNtpDjYXnJdSz0yHzDcAqcX3gJcPJGHODoSqS7a/huxm3aXoSrCSobaayzkUH0LIpwHuf2N
	gzYk+fkmy4acSFIAiWAuxGcZANqaDXz7z9kkRt6NOVvA==
X-Gm-Gg: AYBFou1Au0ss+7WHxgiBmB8OzWF1ThbnFPg2YZpfj3fv6KSImvcwgyX5ZowoE6Yn+Ry
	gWMvT387gtB/wkU027Gro+bECFfUNJrB1cRNM9RruLX2kzvCYPAu6lXLt7/NjU5LwZv7hxWeExv
	lW9Lt4WlHnc/LsLWp7G+emQwLLN+5JaQ9tqgeeVd9tScZLuFsd0DNbB99k2w==
X-Received: by 2002:a17:90b:4f8e:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3ae5814f7ffmr78466a91.32.1793130523048;
        Tue, 27 Oct 2026 12:48:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4f8e:b0:3ad:1b0b:1246 with SMTP id
 98e67ed59e1d1-3ae5814f7ffmr78433a91.32.1793130522182; Tue, 27 Oct 2026
 12:48:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-2-ulf.hansson@oss.qualcomm.com> <00b63b4f-053c-40cf-82db-21a86fc485c6@kernel.org>
In-Reply-To: <00b63b4f-053c-40cf-82db-21a86fc485c6@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 20:48:31 +0100
X-Gm-Features: AclHuK8pDre3YwuaROhCo5lLvSQlS2cqt0DndLdfwRm-CMEXrzn19IcRZVVnLI8
Message-ID: <CAPx+jO821-wULVT_KbZB4oaPSYAHi3PEpM0VzvSL_7NBns1t_g@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mN4PCQrKXmfPa86eXucW1HEnqs_ELxWx
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae1001c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8
 a=hX8ArNWt6CVKnETHcRMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3OSBTYWx0ZWRfXyEpiwySoNoRJ
 OInL1Jt5Yumiz5I+NWjQdPIHD2anYLLnhTfIZFK4/6nqwbv+seHkap/MJgmKTw00pFcNpB+rwiG
 MX6Uwp+KRMOwiwr7VsmP92u9sysskaQ=
X-Proofpoint-GUID: mN4PCQrKXmfPa86eXucW1HEnqs_ELxWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3OSBTYWx0ZWRfX/IZlXqneFsjY
 u6U4H23AaKC3wcHjPVBWl/JMC/DX3Lj0XANZparCsCtMmh/4WU3adMC62XZi351PvO3doV+0QqW
 A0tKto3WmFFOHf7NcmWO6b8B/NOeACZfrKHWhPNWrVHWpqVbAjPe1spRJJoG+48y0w8yodTrkhe
 pPGNMgRtZK5XMIW5PCqKmZ6d0fdYScXmmu7I8p6RABAIxfZkgRqNc7CvpezaXJA1N6Xmd3ZOOfv
 jcI/GfZZ2Oh33kAyIu0fCY+amy/rM/l3f7Fqz+PWkGiwp9aU3RBpokVmUwqG2Ai4VAx/LFjT+e8
 Ze+JODE+IUa7fboRSvO7poPlRM9J24+yBJhtMUSoAhBDpRig46TfzR3ANVbxiIfrLbPf+QtE5hu
 QIfdJ/cCwPj2sJyaqWUwpJZYpR1NEcW1XxRUFdwW7tR3PXgAAZIc4CUd4htI4McoVsOxwtCn1QI
 X2PWX/dYgs7D0sLaEeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270079

On Tue, Oct 27, 2026 at 4:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2026 15:40, Ulf Hansson wrote:
> > From: Kamal Dasu <kamal.dasu@broadcom.com>
> >
> > keep-power-in-suspend is currently documented as SDIO-only, but the
> > requirement it describes -- preserving card power across a
> > suspend/resume cycle -- applies just as well to any card type. Drop
> > the SDIO-only restriction so eMMC and SD platforms can use it too.
> >
> > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Incomplete DCO.

Sorry, I should have explicitly stated that I will leave that to Kamal
to contribute on top.

Kind regards
Uffe
