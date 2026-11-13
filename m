Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794562853;
	b=fWmQQLKu7xaHPr21ulmksnHgc44tm+7XAk6hIzcDt3pEeJ+uu0cC6tYipernuvSFG+Kq
	 00WwzCAKtxuXzEYMCTRKQ3dHF2diQNpCAFTWRcp1/ipnN7R9wHjScBEVdAW9nPn721E4E
	 /q+QqLVk+s7Rx75HGAXH5FHqyW2erQxP5r7qXURoRSB8a8mhwJP94bBZRpngcqMR2OL4e
	 zgeoqZ+eLGRxdAAJ8kFFo7koQLJPzGjW+xIgYGyznf8GSgpB2srMiSmIXV5pWRkvcm1yA
	 jh2ZoZsjwgnsDPuvekbTsf7UQYFDsKGjdBRm5qNKhCVxVGx1NZ2xfWNpor6mq/jWKag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
	b=dk38lab+nR74AeHmIP46gwgE9sqYHEqiKc1fbGquv2lDpq/uJ75D0p1umucFz4ctJgAi
	 qLYCk7rGuDEumaouNTngaLMMsa9ThsiV4c/ZLU49TvPQIlN48LXnphtPE0nn52noSz2/V
	 QRZRRujvjtb/b+BCULhw0ovu8c6Y+XLQTLblHVl0ookLXHoUu1IA56/yA4CKnSIW0xBTR
	 e0l9MPSs5FdFXXZumBwLXIl5akENIgBH5E0/VF4b9zWtBUYnH5JKGIMOo7l193osjGIay
	 f7AxPyJyYD5Yl57sdnafyj2E9BlyDtFSS37q4iF6EJz2x02YCVZ1QbzKqVdrZ0fXLlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OwN1/M4Y";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOrlXi+3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7001F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7001F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OwN1/M4Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOrlXi+3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VSUZ1527743
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=; b=OwN1/M4YDae6Mh1n
	t1kPuMJtk04rEe8lVDx9PYrDxOmtFrGCAyq9h6ciAoc6jsMAhX8v/BemYK2Yhtla
	qK0jwA/TsfdyVLCdEP3NmHGc39YwsNmRGLqL5QQEoL8qwwbsOD07viyDs9GiNKwz
	LriFTHwoZNG2noQF55hnFAiReTka+/Bse4EBSXW24FfOkYWyofUm5bX73BEVlGeF
	gtUawsT40238X3FNzuk/g086zRXERkYvWDESKxcZywQCdGI0Y51RuObfHXUyZSDZ
	xYQ8AATMAlTry8el9nNg6spo2mzblvxf+mdLvAdt6L+kxNl1dWjDPEsbVpwYXtBd
	mc7EKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8p8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:40:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so19461685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794562851; cv=none;
        d=google.com; s=arc-20260327;
        b=qhTD+IVrzLvBp32rtmHVEa0DWH0vysWzJFfRMXKZ/Rnyovoc//o0q7GVQ0/fbF2zlp
         /Oqn5fgx4N9rOqICzqkGhcZtSCY0gnWpVDpWU4sMZ57XlNTlg4U4B9Yb+qW8VFzyK35+
         BbIzEbhijHYWx/nfWTsuYAZxl6oKRW8kaPsSS1ZdLFRD6fUZs0RsAz9Xt+lbr4RO0Uf9
         SBYv4MuYZ+vuq0qA31lcq/IaVAfjbDVNp9Vfi/7CcN+hp5IsWfO1jYWvFTd+6GaNMOoW
         IejgtBYeler0npr2KhAFPr4Eopt9heO5H1AX+LrWLmFPKVr/53mS0JEJwTAlCXVGlVdi
         yZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        fh=LLcsv2rZv3kTyWsD0FsWlNPDO/kS+uDfkm5xJKbedFY=;
        b=a3WUcqbmBWeXZCa78GnOiSpKjpjr2LKuqcF/arqGoIXpzFFFRjk36e387Y2910b+nM
         DCz2wjR/gQ2XD1E4Il/1SjKCmkqimG/MzslS02l8GFggVyjFaOepbKrvdAhNVW64wQDx
         zGLJAY59flprtbytLvCAZ2fix1as507FCYrqBIIvaezhDwThjT6Vj/bqGUt8k5KAd8wP
         gIHy9qBSvim35ugMTsO6x4n7BNl10tbiiaHUMZ2GhqahlSkejleG/lCSHNXeig9+SgUm
         ioFONTzIFXrbZz4SkaLFXErB4NNhy3fUyjny2v71m2SRJaatOIToY9n8XjcmRmas+i7Y
         WdoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562851; x=1795167651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        b=dOrlXi+32Xz28h8kHCBNRNklAoLM6O4tA2wHZjenhS4xtWY0trH/3RdjDockXuYQ0z
         mgIgySmz+nr0EtqEsBmkfovUVfGFyCUm2uKPom5eaqshPsiw3GU58jPQS8bJiiSIY6L9
         uX5obnpPBVxLBvw8apFK73HnKe2vHpqroCfdoFiIk3yCzrEKWADiV+GGhfInMZ2JRDab
         fFuOkYjBynioPS849eZ7U79BJouPRX9omnQ2rCJ6nA7bo6gpMSYPdEffG9E8WtsNDip7
         HtJt1E/hxUyJfAZM1KV1Lfw3MWCzSZlIgDKQEPD4xKwaJIssHtdEX4GvOYNV19fV4R2h
         +X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562851; x=1795167651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        b=Pbq90OdGlaGrm2Y4w1t/mntQ1/+R5calv9spUbffoZLiIHABxsTsN8mP1nd46jTC/b
         4D97CJ209gNcOvUwLxW8s/nIR5vbsYgVb5v9d6rgkyKVgRU+nJMqUnfqqhfhHGOTyMQ2
         itVhh4ogV/BOh1/ICi6nJpz3vAhryllIJqaZDx4Qc4tEr36HpLE7oUjfPpFXtDuvv7tp
         ihaPiN+f6PyzoKeMOuzKQTeq+fCcV8/+BFwhxx0NB2F2HSd8mZ6a8Tq3FxaYOetEEvgH
         QMISpHNa2lkI7L0RBSnv19Un5f+R4yV81Zzr7wx28IMDZpfUY9PEStj+7pwr61/MIhC8
         AFzg==
X-Forwarded-Encrypted: i=1; AL+hErFl7Eee84y+MRCeFCppfFTsP9dBABa3Pxy94+/VZDBQ6PJN7fW8aqZ7c80oyO2emobSts0IXiY8ZWl8O2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DyWWh7SMPfLdfKxrVa/UxomPOFocobzov7Ge5oJsEeSiSLaO0
	PStDS/QCWP2XJFgHoayvcxWzvVNxrwOQxtHoXvNHdcxVCJoOfI6zEMEEWAKK7MJBqaiYdRsaclN
	rrnS7N6EPdChrCeK3haab1wr+IjxRoOSqG2RdXhAjoiglwdh/zyySOGXzr68u+/N/cI5K/p38G0
	ewurOMThhfeUmr7izsZevNjQfdRZFSEXHFkmQtP1KWJA==
X-Gm-Gg: AYBFou3z0qOHmzm5fBGZQI9etZaDZpdcG1TY6YRYrp8t/5dE2Il9liIIQW9d5J++UW3
	+WNDQuCEVJ4D95QD2iWolDDfsaUeaAeAt8ckSxlq0yIZvETAnDfjan9qRzEMpi6Wx9wleGAIels
	fEgTjSly9C0Ql0X4DTQSxlg0m2Hm2hHqCB2TgEN6x+Itac5/0GfQ5Eu5V46KFQRj6NBv6fI3+uC
	IwGHdTsL/77zfqVUxGAQ1dHibpchXpPAHLR3fd3pUuhCkeiyELMBo5Fj2a6MKDscRG8Ke/xAAOG
X-Received: by 2002:a05:620a:2616:b0:93e:c6ff:b787 with SMTP id af79cd13be357-9494baf6061mr306641185a.13.1794562851364;
        Fri, 13 Nov 2026 01:40:51 -0800 (PST)
X-Received: by 2002:a05:620a:2616:b0:93e:c6ff:b787 with SMTP id
 af79cd13be357-9494baf6061mr306639085a.13.1794562850904; Fri, 13 Nov 2026
 01:40:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
In-Reply-To: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:40:39 +0100
X-Gm-Features: AclHuK_8b8bwFHBBv8-vor330OglvaejRUeIF8CJZhplHPOL4obTXFv6PeqHxyE
Message-ID: <CAFEp6-3EjRbdx5JuC9Xt+j5eY7R+CG-iFerDDB2n2kSzk55LuA@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: fix status of bundled mgmt tx completions
To: shunsuke@nagashi.ma
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX15OWFDgsQW/B
 RLlxHD1Fk5NeoRGh6ptf/IEjfD/FWWGixOiBliZS6C0pUuFV2HfU7d7l8AOBSjgf17saC+n9yfJ
 RlgI5mtVFHbeB5Fj65oyf2WysWrtfQm125EiOj2rDt9JRCymfzPJErw+17M7fYkarp3V2pZeo+O
 SQePSdH3meWoPaEzw7PlNnVPHpwS6p7dwk7bMuaKu6GkWgQ6aN8WlVYAO3mEg4UJjj2B8jLPShl
 YkykciPmVkxlXODP+a4GELrbGN73Bn1XTFPFjedeqDqJQDxhLC7d3ltSG4Fr41hGTIK0570DWVt
 uK4n1kWVpOqpksW928yVFnukMvogGp/eZWDIk/WUkMqwMIxVF346yN8dWPllTTkoKqYnIwq4UZv
 UPIPuNfkRES5vzhBMkr/43o5GMR2BX+t7ZiWS7AanxswhwaGe8eD02+TSc54VXGJAKr7Ud03l1i
 JXSJDbhWQXI2jGtZaQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX2Eq/ZaehKZym
 de3ZItCwwiJsNdVv+nyjpPNrzG91gsfhi9y3wDc+WgfU1Ci7+3+spf2G/4rc31JTu2oTkn1fBPR
 nrpr/7IRhbS1RCz1cp11gikxR4uR25o=
X-Proofpoint-ORIG-GUID: o2rBT7eLWFsbffYjpClAx5tRB3CzbiHN
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6db24 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RNmw_1-gx_wr1L6n6KYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: o2rBT7eLWFsbffYjpClAx5tRB3CzbiHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038

On Sun, Sep 27, 2026 at 2:10=E2=80=AFPM Shunsuke Nagashima via B4 Relay
<devnull+shunsuke.nagashi.ma@kernel.org> wrote:
>
> From: Shunsuke Nagashima <shunsuke@nagashi.ma>
>
> ath10k_wmi_event_mgmt_tx_bundle_compl() takes the completion status of
> each report from desc_ids[i] instead of status[i]. Any non-zero status
> is handled as "not acked", so a bundled report is marked as acked if
> and only if its descriptor id is 0, whatever status the firmware
> returned.
>
> The bundle handler read status[i] when it was added in
> commit cc123fac978f ("ath10k: Handle bundled tx completion for
> management frames"). The commit named in the Fixes tag replaced it
> with desc_ids[i].
>
> Seen on WCN3990 in station mode with a WPA3-SAE AP. This firmware
> advertises mgmt-tx-by-reference and completes some management frames
> in bundles. A debug build printed status[] for each bundled report and
> could switch between the old and the fixed line. A sniffer watched the
> AP channel. The firmware status[] matched the capture in all 39
> bundled reports (15 with the old line, 24 with the fixed one): the 30
> frames with status[] 1 were never seen on that channel, and the 9
> frames with status[] 0 were acked.
>
> With the old line, 6 of the 15 reports gave mac80211 the wrong ack
> result:
>
>  - 4 frames that were never seen on the air were reported as acked.
>    Each report arrived after mac80211 had already timed out the
>    authentication, so they had no visible effect in these runs.
>  - 2 SAE commit frames that were acked on the air were reported as not
>    acked. They were the second and third of three tries. mac80211 gave
>    up on the authentication 239 us after the last report, although the
>    AP's SAE replies came about 5 to 8 ms later, so that connection
>    attempt failed.
>
> Take the status from status[i].
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c10-00459-QCAHLSWMTPLZ-1
>
> Fixes: 4b816f170b1f ("ath10k: add support for ack rssi value of managemen=
t tx packets")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse
> Signed-off-by: Shunsuke Nagashima <shunsuke@nagashi.ma>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Tested on a comma four (WCN3990) with a v7.2-based kernel
> (7.2.0-vamos-7626c37). It also carries three out-of-tree ath10k
> patches (MAC address, in-order rx A-MSDU, SET_KEY wait); none of
> them touch wmi.c or wmi-tlv.c.
>
> - Debug build that prints status[] per bundled report and can switch
>   between the old and the fixed line, with a sniffer on the AP
>   channel: 6 connect/reconnect runs (5 WPA3-SAE, 1 WPA2-PSK),
>   39 bundled reports.
> - Build with only this patch: 6 connect/reconnect runs (5 WPA3-SAE,
>   1 WPA2-PSK), no debug output. No warnings, no firmware crashes.
>   One first connect failed and one reconnect was slow, for a
>   different reason that was also seen with the old line: the AP did
>   not ack, and the firmware held back some Auth frames.
>
> Not tested: status 2 or 3 inside a bundle (only 0 and 1 were seen),
> AP mode, other chips and firmware versions.
>
> I worked on this with Claude (claude-opus-5-5) and Codex
> (gpt-6-astra). They helped go through the logs and sniffer captures,
> write the debug build, and write the English of this changelog. I ran
> the tests on the device and reviewed the change myself.
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19..67be6e817 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2512,7 +2512,7 @@ int ath10k_wmi_event_mgmt_tx_bundle_compl(struct at=
h10k *ar, struct sk_buff *skb
>         for (i =3D 0; i < num_reports; i++) {
>                 memset(&param, 0, sizeof(struct mgmt_tx_compl_params));
>                 param.desc_id =3D __le32_to_cpu(arg.desc_ids[i]);
> -               param.status =3D __le32_to_cpu(arg.desc_ids[i]);
> +               param.status =3D __le32_to_cpu(arg.status[i]);
>
>                 if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_ma=
p))
>                         param.ack_rssi =3D __le32_to_cpu(arg.ack_rssi[i])=
;
>
> ---
> base-commit: 753baa59527f8e606c49eac25692b8b08918a3a9
> change-id: 20260927-ath10k-bundle-status-24113117b683
>
> Best regards,
> --
> Shunsuke Nagashima <shunsuke@nagashi.ma>
>
>
>
