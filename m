Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794123381;
	b=XcwNC1k5uRO26jtnMI2SyC8zbGjcCFZFOK+xmBFCbZq7RMEoIdluKLWKFARCNEa/szfp
	 MC057biGS6X+ycYRgC6F5cPH9BezcKDdPujpA/5gjZFJ5cF8mfyTGHBbuMrGpoyTmTw7s
	 XqqCXfMpM0Tq7FOvZzTdTdLDQcI755HNiHSpHpRLgwJME2+O1DlAV6bm4f8xCm9t/ig2v
	 2R8e0w0EZnY/lA+eEU3g5wJw2HnWfZyeQa/+WTvaBG2qRT2mt/xMLknV1MGnhAd8Ifbvo
	 cFnFLoFDz2hWHbEeeEEXcgkyELo+M78IhO8U4dtQ+DE03+QjczrA5sNrazvIx6G5KMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2n+UGKuuNYXc6rxjwiFZUbX5+lAllqeXmuw10kG/+ks=;
	b=qVrwMi8L9bAj0+t99b2EBfArfMGMaqVm+ibrISv2znCJznqNF7I+0FhIMHXshpJ0NvEG
	 PQff9g/ShJkqxGChs1vim7U0GAc6wPYtlDtd1Wjl4C3kmd4SC/e550PXIpi+C273rs7fz
	 C9qCuVP8LpdFwQsT8GcUNAgSYW0k5HRWlU6XiyiniwfNnegcOwE7BGZz7hsFQJtSlbDss
	 4w6jtzMLPVSH4QLlHr3YSleqiDM/9cw6qIM/EhFV7zGaBMv+XhV6UTndqE+BOH0V19VHu
	 7yFtzhzxyaadtLaoF8+HMtxY2Sw5InDbPZjw6EVeH2RHSt72CW+1m/Eo8ApNyra/1SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ekQHlie4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HE/hHY8w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28278606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28278606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ekQHlie4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HE/hHY8w
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84K3Lf3716763
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 07:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2n+UGKuuNYXc6rxjwiFZUbX5+lAllqeXmuw10kG/+ks=; b=ekQHlie45SBXLwQ4
	Tzm2HcRuAecMksHtkmMyocRQ4VhTa6Opsw0ziH/ZKyQ9Gq71nUB9FZrgFhVqGAm2
	CLu2+PqogaM6Ah6rwawi/kQtKWwEJsXuK90MdD7ICEGxRztiBzu1vQwg86x+Ve+s
	ws1xpIxbtHz/XG9nwc74SWUZUtLJRtPbIw79RGvGdSbvamvM7wUQrvUcsqxSLv35
	JDKe6v0mUwkh+eCodXW3TRtQmTWNdnuSrPT43I7ZELi+9iompXOXL836sA9iP9nn
	ymhYhvG0ycyN3b6Sr6Ygfd8WkkAj+1E/TkFGt58AzSFn06OIcRb8J7uFznZGeEws
	JQXNAQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99jb9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:36:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso747796eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794123380; x=1794728180; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2n+UGKuuNYXc6rxjwiFZUbX5+lAllqeXmuw10kG/+ks=;
        b=HE/hHY8wGSKO2v+U+g53wlt/V4DnD5fz1JfwFu0FyRDN/1gNSsNXFFWzCg3Syz53dE
         8InQBI6T/AbUJ6FxfY6Zw5hcwIOqwmr50L9OZEblFVoTat6E5V/vONOLxzYoxIv/dRSK
         Qi1IgqBxGUplwCeZsklEK5NzJlyo1P54oZObvqjG+N9dG5rjLdg01mBBcqdRsiB08+ch
         CBr3fH2zHUHgOHE6yge8pILmFoTme4t18CI97JZWKgkfX3fW3FFOSuFJWqAF2Y8otYMF
         hUef4HCUR1z/w/2S+Z23dJ4vt2gTHAhhGLSXRs3KRWhjtrszw3DtHEvwcO3mHkZmcTLc
         cfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794123380; x=1794728180;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2n+UGKuuNYXc6rxjwiFZUbX5+lAllqeXmuw10kG/+ks=;
        b=U+zOzZFdcOEI6LcuDqhsA4NhYC4QXt+PIDkw0OUctAFob70RhcZFEzvHZHIP+delFv
         MXXlgUs0xZAD7iF8SH31rUcRY1dmOluwXE48YXf5f7tV6cpNhK3ShOI+IeuCUSpLtdwO
         FKvY1GJ3gPBWtg4Y3j1f8HOaQeQeW8RuijiSSTD/iM/+CcuxJ+bHdlOZDgT/En0PeidE
         7CJ3lk54YQdK9mBRQBRvt3FEiKBJ7/aOvVWIyCaiane7nxDS7yBoICYtRh6VUmZWQnVb
         pCZsQmZ9tbcSSfPqJ2WfVVe1ZFK7zRgOk0HPvIA8OKTCgJX0ijNC8bjcBnnh25RzHLF2
         MNQg==
X-Forwarded-Encrypted: i=1; AL+hErEWRNohIO5bdVtQ0HReo8XN/qfO/MN4DQkhTrWqJB8P2w07mG4AjqIYSTyikOrIjcZsyWephe24uKG/MbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZG/MgmqsVBZ58v4170uToBxJLUhiRUZ3FhZ0ynX9zkVWn0/K+
	NiSM6UYR1nOCDVnpYKkbAS/F7ZZg9WBTdXMWXAkLfZPcQkp8QgfnFzn/KWBTctYfx4m0CK/5Jcp
	g+ZRVsvmmNsK07BLXQL5TS42Eh9/H7be7IfgCTy3d155oQvHsCVRw4eKavvs7Zt2uol8=
X-Gm-Gg: AYBFou0+XUe3HspPeKWGgutfGOPxFePq84NlW0ay9edXZxt1oDYzCmP+0Ses1yNfCpr
	Xj3REe1bdxYSgK6diB538rx3/5EpVIcuXLTQMJTeDaMfvlN6iB3+1SiUkELA0fzQyLWdkvHH2RH
	WgqkSV+qRPtCdfWpcXZDq+FlpyeAYMK2Kt7H9yQS0bC+bLH25Q1bqygsTcUeTp+AaiDva22AUKG
	VunmWbw3GpsjFc4n8lpqgslcFJz3gW1/1p1vO5irz7HTTN8Jtl7AVoADHvCKrHUSTEEOU0XDYlE
	/hsCAlM1FpgHCpf6Rv8QOeJVMwsVqGrxF5ZCGS0IxIWfyupCw3Xo68kqPSM7gtPP+DmV3o5IIvk
	6d3GgX6eMxfxLixObDAfy51RZT9yQeaWrP3F3kU4rCvX4p+Wx1KPd1DJM5NuHGxz+cUuRaVTe2k
	cOglLMBPkvhdzknWi263Ed5UmfZ+OR9Hz3Pzzh3QBe5A2bQ0IEl/07LoLN
X-Received: by 2002:a05:701b:2903:b0:16c:ff3a:d72e with SMTP id a92af1059eb24-1b39fe987b6mr1231202c88.20.1794123379556;
        Sat, 07 Nov 2026 23:36:19 -0800 (PST)
X-Received: by 2002:a05:701b:2903:b0:16c:ff3a:d72e with SMTP id a92af1059eb24-1b39fe987b6mr1231170c88.20.1794123378880;
        Sat, 07 Nov 2026 23:36:18 -0800 (PST)
Received: from QCOMk1gASIiYhG (66-33-8-210.colorado.intrepidfiber.us. [66.33.8.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm3556452c88.23.2026.11.07.23.36.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Nov 2026 23:36:18 -0800 (PST)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: =?utf-8?Q?'J=C3=A9r=C3=A9my_Jean'?= <Jeremy.Jean@oss.cyber.gouv.fr>,
        "'Sean Tranchetti'" <sean.tranchetti@oss.qualcomm.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20261031221052.1642262-1-Jeremy.Jean@oss.cyber.gouv.fr> <20261031221052.1642262-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20261031221052.1642262-2-Jeremy.Jean@oss.cyber.gouv.fr>
Subject: RE: [PATCH net] net: qualcomm: rmnet: bound TX aggregates on byte-limit update
Date: Sun, 8 Nov 2026 00:36:17 -0700
Message-ID: <000301dd6f53$d7b931f0$872b95d0$@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIan9Ym6wgfeJXkm0ec/mIILiLtiwLTqZcCtpLKmjA=
Content-Language: en-us
X-Proofpoint-ORIG-GUID: R0funZ1rKZs-Jq1iMQIST-9jUl1pQcMM
X-Proofpoint-GUID: R0funZ1rKZs-Jq1iMQIST-9jUl1pQcMM
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af02674 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=OltkOWFNRHEXGe+8VJKHzA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fZt6mqSA75pAf0XC2eMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAzMCBTYWx0ZWRfX5wxultGEkw/V
 nWssnPjr/MBJo5FAz6aSVnuoHC0C4hAXDffnRz05vqn9mqT5/z+qA13TSc1ClB0JAdph1cKfHKq
 kkWs+H6nnYTrxzZTTA4Vzne9ClLqPb+0z7yO5bAbCOHt45AqpRq6+cHHF+4Ln6inBARqQxD09R8
 Mz4O6rA55VoAM5WnOLzuqelWLDjnmL8AlsIclAiKL3EzFz3ZvUiYxIFU9IdZSxDgHqaGzLo9qwX
 H0CZSwo+Nyx9IxOnpYBb4Tgt7zSoLp1jHdbQ9K0lB3vsK02MIUOGkOLXoFZyERhUgfrcSQ7FtmE
 cTfu7Z7aHgrC5jooq11MYStensN83V7AUayCkhZE0R++t1thQgB6c27ZL0qYGl1nvMjZTdqH0tv
 fC1w3fNDoqwdo9s9eq/MCjZwssw8n1XxoihenFY7+eb7XRvLRjsSbRpXJQLBowTtKfqVoxW1Muq
 5KfpmY6jh18v/BhngpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAzMCBTYWx0ZWRfX5M4Q6ypoq1OH
 EnS5VvPwVtRViRycXwB094O1V7MX5oDbQ6SW9GGBaPLqQASs/eRgY86w+vd/9Z1Hmq60yjNKUw5
 TkIA0XfIaFLPXN52g/1ir9M2a/ecH70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080030

> -----Original Message-----
> From: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> Sent: Saturday, October 31, 2026 4:11 PM
> To: Subash Abhinov Kasiviswanathan
> <subash.a.kasiviswanathan@oss.qualcomm.com>; Sean Tranchetti
> <sean.tranchetti@oss.qualcomm.com>
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; =
J=C3=A9r=C3=A9my Jean
> <Jeremy.Jean@oss.cyber.gouv.fr>; stable@vger.kernel.org
> Subject: [PATCH net] net: qualcomm: rmnet: bound TX aggregates on =
byte-
> limit update
>=20
> If userspace reduces the TX aggregation byte limit while a buffered =
skb is
> pending, subtracting the skb length from the new limit underflows.
> The later comparison with unsigned skb->len then lets the buffered skb =
grow
> past the limit.
>=20
> Check lengths before subtracting. Flush a buffered skb if it is =
already at or
> above the new byte limit.
>=20
> Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets =
aggregation")
> Cc: stable@vger.kernel.org
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 12 ++++++-----
> -
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> index e6f48dc9fe64..205ac81f2c82 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> @@ -594,7 +594,7 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff
> *skb, struct rmnet_port *port
>  	struct timespec64 diff, last;
>  	unsigned int len =3D skb->len;
>  	struct sk_buff *agg_skb;
> -	int size;
> +	unsigned int size;
>=20
>  	spin_lock_bh(&port->agg_lock);
>  	memcpy(&last, &port->agg_last, sizeof(struct timespec64)); @@ -
> 606,13 +606,14 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff
> *skb, struct rmnet_port *port
>  		 */
>  new_packet:
>  		diff =3D timespec64_sub(port->agg_last, last);
> -		size =3D port->egress_agg_params.bytes - skb->len;
> +		size =3D port->egress_agg_params.bytes;
>=20
> -		if (size < 0) {
> +		if (skb->len > size) {
>  			/* dropped */
>  			spin_unlock_bh(&port->agg_lock);
>  			return 0;
>  		}
> +		size -=3D skb->len;
>=20
>  		if (diff.tv_sec > 0 || diff.tv_nsec >
> RMNET_AGG_BYPASS_TIME_NSEC ||
>  		    size =3D=3D 0)
> @@ -630,9 +631,8 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff
> *skb, struct rmnet_port *port
>  		goto schedule;
>  	}
>  	diff =3D timespec64_sub(port->agg_last, port->agg_time);
> -	size =3D port->egress_agg_params.bytes - port->skbagg_head->len;
> -
> -	if (skb->len > size) {
> +	if (port->skbagg_head->len >=3D port->egress_agg_params.bytes ||
> +	    skb->len > port->egress_agg_params.bytes - port->skbagg_head-
> >len)
> +{
>  		agg_skb =3D port->skbagg_head;
>  		reset_aggr_params(port);
>  		spin_unlock_bh(&port->agg_lock);
> --
> 2.47.3

Reviewed-by: Subash Abhinov Kasiviswanathan =
<subash.a.kasiviswanathan@oss.qualcomm.com>

