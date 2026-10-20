Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792491319;
	b=sAO14x4yJMIa6fbuWZg/VNy+T7K/BlOpfokqzPZuS4yRN84L/LZDyUOo+ZNqzKNobY9v
	 HmhuTMB6LeTWj679GrZ0Vrf7f9OKT4KtpmbB6ExV7ZTnrafM7yNasL2nCUaLzpirqq0CD
	 UDDUHo6Way6XBD5GrHtBohBBKGR3K6o+56tltu5ZQ2XHvyAjUgj3uucbmwkhEZXKuy31I
	 +FhrJ2PzfSBakMk5C4X21Q8aL0820nFlqougqsqbnUQLa6KTRfGbSo4cUTY9Iq9KxA/eo
	 ugfQ7G40sp4n0qJIW4IdbykTGrIRPknLrCJv5HFabXLT02WYf2gc+D8nq6PtxvxN88A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=USzUAeXmvNCRnE9FctU6fubUlHkhva9uo5i/eKw0KrI=;
	b=qArrRihtYUaygQFhC2lnbIzZMxOBWCtXXp2qhfmVbSI9gPvHEmsvtiJFAzBD+4z14Pr0
	 yViuC4HT96jsZZyGMW6QL5G2IlOhxaVe3/MRy9zPR5dYKtJj0fK6PFxdybuLrHcnT3zOA
	 pnjbSgqQY9Fjl53ywHCPYj54VMs2TqzeIvqbKU6cTlBHBrBaesqQRzi7PgJAy7+ZzZIXa
	 JKWI7bDXjjqiew0HO3HX/P3ijgsEg27MMHCNCA6t0sgDp+2dQ2GyuLtxVfnK0tpDJOqBW
	 Bij5jlliUBXn4UelVaxSajPTxQ9G0qrTt5nzUZIhFu9smQ7jVGLLnxD4YDYMYhnU53A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UKkTd88o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ulz5B1US;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA19606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA19606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UKkTd88o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ulz5B1US
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8a9rO2877957
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USzUAeXmvNCRnE9FctU6fubUlHkhva9uo5i/eKw0KrI=; b=UKkTd88oLwZdCd/+
	YCxYihHaOby/yPYVVziRpjuEbPJJKmoW5Qq1EKX8mhlUbr+UNA4Rp9aBTauxsV7U
	q+QAdtBVdkXyAs4ui/EUUREDU0dSc7H1CbD2lMHucZGIBbY69/eUavQu1/ttygVB
	L5uf0QCUd2auv1Yox8L0OviRJMJf6rPA5CvPAvX2ReTBCM7TDtqFKGI7FI8r7NrV
	IpxKEll8pVtkdc5GZVr7wmMW8doXKpFi92V/jknOgtIEYOTXntihyQnCG8I0pov3
	pgmn2yo7SFv8/4wS6oFvnSdXuSW7mkoHv1Zr23dALiHXYlKdpsU8VGBRIVqkEdXy
	uNy3ng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pt1f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:15:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so688725885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792491317; cv=none;
        d=google.com; s=arc-20260327;
        b=Eap6h1dM76GlZAU1biXP9aXx6IAaah8koSAnNayDdNhZ6iNzcIkVM/ldIJxpKwosRA
         2THqQHfEK2MhhlW/JW2ibA2n5zEbJGfnwR3zg+W8tuAA7Ug/IqFMCcfGto14zPq58J/w
         C/TNaqejcArZ0V2x7N4J0lD8yzWH3LzQ5wV0fhP4rb1X52kwUM5aRIo1W3GOY9NkilaI
         p36zDOI6G4c1G15l8WML53ScUCjoUVk21+1h5lJcWG2TWHWNmIE4Ypqb46LWPYMbwOgB
         hkRkXl8bTTP5TW+lXNM39smGleB1uPby1yzekDivn6fzENVuQFffISCct8Nz071Tfzoe
         ERbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=USzUAeXmvNCRnE9FctU6fubUlHkhva9uo5i/eKw0KrI=;
        fh=7M4P1dGXK+Hp833XX70aLD6t8SMjhs4T7+549tEhHRM=;
        b=e1ArFrk+r+cGiWCLKGWiUSpxc/bEwzGBtDmb1O5JLXzd2++037akJftbvHIJRunZW7
         ZmOwbV69qsjCQn1xlO7ML2gwTUFDVwxYnSvKryzNtrUkNj18jWKj3SuAe7TbtBeazLs7
         56sb8ZxYaJcj+tM3fgHl4W1kaFvoo6kK4wkSLmpREI/Angzfr/rMEiHIkJfJ1JQ6pyau
         TQv++gn6z2pdlK9mits5W7fsDZuvJfZgB+72IRR3FvslZMnk98J6gq7bLBlBwe7zHF32
         iL6zYG9onig3BCBLDirEOAcNRK++WlCdCd1YRDTkhZF115HCeIVQjdbdvKCw5T2bAZ+p
         aetw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491317; x=1793096117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=USzUAeXmvNCRnE9FctU6fubUlHkhva9uo5i/eKw0KrI=;
        b=Ulz5B1US1WxZAdUJUv8EZC/hYQ5/YRkEuT3q80ZV8FVNrib6/z9JF0vCH2Fo4zoeNV
         9n4k19tTy8OcPQjscNIB6/X5Re549QL/XhXFQbqwumqKebdiM/G5YaS64HMeWDkP/k9l
         wRg6bQX+5Yuku3yyg1GKUY++JNirktoDdaYOAJMlmrJmnUBnj6/JBCU2UeOMCeYNJ12O
         8zo9UVcC5Lq3uk7ZGIdDe0SvJwUoaRXMyFiHCgyUEU8iVGPtW9HmH6r8qyPcLVdegRbn
         qAoFzICDUseH18WfbiSht9kS0m4xDQuNn0LyfWfdnITVE8xf6vWTXCB2lAAYAFQ9komP
         AXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491317; x=1793096117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USzUAeXmvNCRnE9FctU6fubUlHkhva9uo5i/eKw0KrI=;
        b=CkrZDL/U/5JfEAy6MlCJp7rOa8J/sHbWX/6XW106It/PCrNqY840wgSGDl10BNxCrY
         ZTz/5XdfOhi2XNWORS52s7nHr5C+5yjIikUz0XT5niFJbusMOa8MmFeXUY7LVNBaTtxy
         WeiX9n6EcydFlWlQiSqSuHmUgZ9SRDKteo9E4znIZ5JKcWFMW9MjRbTLFNYFOIa5TOym
         rARQZ8KRh0LZFreqyRnlMBdV6mnSKH0Chmsx0ReQZ3UeLVULe0jyb7JIiV3I4CCA9A7Z
         2HCvFLykgZCS25t3WI+OvfdcbuyOJpng/DYZyzHwoIIrNUdKS5tpDEj27VG/yd8yVu1w
         7apg==
X-Forwarded-Encrypted: i=1; AKwUvBzlyFi/yJj/H3suLBZCkMgRK5ou2VfI6n+q7OR9fAkrzt2cMze1q7RdIvDs9tYJpqPeHjevSFHGcNfAkSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC8RaM2IdmYg3YnuHDELtjYZ0qZWUNSvkTGzMC4MSLBIP8ByFD
	m6MvD1Yxt0lKRFogbn5ouft1obIYpRQ2miuJyYNF/QRbZjJAF/Acl45caTTt/63k6HPJnKt0OoN
	LFPr2Avh9cTgqcfxckpLTub/9frmOaW/KJNJWkCTrJnibpf4Rofq1dizbvN6K6AdvY3QSqmMjSZ
	u16W5emrMmhpNuZ91KDdDy9EQFkOW1qA6XYmwatHKi0Q==
X-Gm-Gg: AYBFou3IqN/aFzadMylDUL82NgPa/iE/Ch7wNghcQHMnQKGk1/ux5CTUhEOTF6svKcc
	rUWMFDsoNC0tIY8izapURGPMWGpFdhSU0kr8wafd3v/oRaNcoad+qz0uEobWxeJiJqPLy2n5O1p
	C+Sp/yCBEK30E4xofvC2hHWNVIvZsKKl/mG+YdIYP9U+iU9NWKxEmHk0G+xSsO0Wo5MxPlpRCBp
	cxkuM9XyirF0YzZK8xEOpl12LkhRQLJSXUpsS8I+jWOXHG+21Qt8E1jVEzfMNqMUQnbjk0bssE=
X-Received: by 2002:a05:620a:c4e:b0:93f:1f22:96a4 with SMTP id af79cd13be357-93f29cefa8cmr1720594185a.29.1792491317485;
        Tue, 20 Oct 2026 03:15:17 -0700 (PDT)
X-Received: by 2002:a05:620a:c4e:b0:93f:1f22:96a4 with SMTP id
 af79cd13be357-93f29cefa8cmr1720589785a.29.1792491316829; Tue, 20 Oct 2026
 03:15:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020094254.4017726-1-liuc63@xiaopeng.com>
In-Reply-To: <20261020094254.4017726-1-liuc63@xiaopeng.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:15:06 +0200
X-Gm-Features: AclHuK9KNDkqLpjluDp4MS8p0mVyq6DiUSCMyPi7A_OSUeyRYLDop--oOo4-vxw
Message-ID: <CAFEp6-3dycfwn-2O3X6tMYmYuTMgDgoOgYrxGv1Qcg-F-YZ7Lg@mail.gmail.com>
Subject: Re: [PATCH] net: wwan: iosm: validate msg_head before indexing msg_ring
To: liuc63 <liuc63@xiaopeng.com>
Cc: M Chetan Kumar <m.chetan.kumar@intel.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Fang Xieyan <fangxy@xiaopeng.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad73f36 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EgahoUkMAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=D2SkTF70-_n5gOfERQdM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX5NzuYq2FFwhp
 jLQsH9mzVyFB3CGkrX+mYXu5O2D99EcXdqu6/FveJPRXhQ5wKSPw9a3l7KGb6IRHHfy9slq5ufX
 3LntO+1jICNTyj8wnTVPhbmcUqgg5gNwdIJR8VCb4qMy40FU9SWCeqQDKOUxlBydS95psOUbxSe
 uF0WetbM7infp9p/cW6wXPbW/+DHspBs2Ow29oCRwpMjK6PukACnyV4+XvjqK4icq0BPhT04GGB
 Mcavt0vu+QT4/azpQnLv31+91czHv26mdCxVuw1LXnpcA1bolM1r7Risi1edbWDXGTiZsKdxtLn
 FEAOJHXVYCjJQw0/5fev2+g2eNfy4FwDFn5KcRCGhpVwGeG1FK5H7+klsLIJodBKehbcJa5VwVJ
 +U/giBMZZlvjVjtcUcobXZT2l9vO6kZCE8ReWQIhpO+AgjCWzX4BWKbEmmMEWiTKHuvl5Un7zWw
 4YYFMZp+3WHVgA60f5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX5wMGz40NVTWB
 TldpQbihsTlAy3JrZSTmBdXVim4Vpff2Svfw/f1xXXAXeUic+FeeWbpW4HIUYb8j8fi1uJ20Snx
 nbqnS4R7v/t2IBFHZ4gfhB984atVZpY=
X-Proofpoint-GUID: hR1DIh0zXxTba8c5b_B0lvUqyT3knZRV
X-Proofpoint-ORIG-GUID: hR1DIh0zXxTba8c5b_B0lvUqyT3knZRV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On Tue, Oct 20, 2026 at 11:42=E2=80=AFAM liuc63 <liuc63@xiaopeng.com> wrote=
:
>
> From: Liu Chao <liuc63@xiaopeng.com>
>
> ipc_protocol_free_msg_get() reads msg_head from shared memory and
> uses it directly as an index into msg_ring[]. If the head is out
> of range, the subsequent memset() writes beyond the message ring.
>
> Validate head against IPC_MEM_MSG_ENTRIES before using it as an
> index. The ring is a circular buffer, so a value outside the valid
> range indicates a corrupted head pointer; report the error and fail
> the allocation instead of writing out of bounds.
>
> Fixes: 64516f633bfd ("net: iosm: protocol operations")
> Cc: stable@vger.kernel.org
> Reviewed-by: Fang Xieyan <fangxy@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wwan/iosm/iosm_ipc_protocol_ops.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_protocol_ops.c b/drivers/net/=
wwan/iosm/iosm_ipc_protocol_ops.c
> index f2f86f41fd10..004920068c45 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_protocol_ops.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_protocol_ops.c
> @@ -14,6 +14,11 @@ ipc_protocol_free_msg_get(struct iosm_protocol *ipc_pr=
otocol, int *index)
>         u32 new_head =3D (head + 1) % IPC_MEM_MSG_ENTRIES;
>         union ipc_mem_msg_entry *msg;
>
> +       if (head >=3D IPC_MEM_MSG_ENTRIES) {
> +               dev_err(ipc_protocol->dev, "invalid message head %u", hea=
d);
> +               return NULL;
> +       }
> +
>         if (new_head =3D=3D le32_to_cpu(ipc_protocol->p_ap_shm->msg_tail)=
) {
>                 dev_err(ipc_protocol->dev, "message ring is full");
>                 return NULL;
> --
> 2.50.1
>
