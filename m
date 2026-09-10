Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769033D300F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028452; cv=pass; b=qYDXksx0HxKcW451y+k05pIgwXC4I5+YTz2K+3HioWYZrg/qMYb2L840E8O04cMp2BclDLG4ifSOShc+1OWFygvrVFRTvMOlkE85HO17Qa8G50VZ9kxKIHyGKoHqPLni9Od3xdblmJjp75ynQvkTn90TAYbhzV3qDU97qj5PIog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028452; c=relaxed/simple;
	bh=WvmQjKnGuI0dGsnyCGxoMDIHpfNF476NUnQtUUHZ7Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgfN8hvy/jOKVEyYlpaj3p4Bd3MLAxgTYzxmvdRVU/1Gx33f0DDOSd87jt8l8AXrMmH1V9LCDSvo7Ey8hpiCvUNUrO/4vI/rnGPdN4KWDVAVPggiYD1Yw0Kxa9lXxQfGlLabQUpyEHl1xOoL1hJXvNqY2yHFLGnVgqPFVy6J+Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMVmnSIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJHe6JlB; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMVmnSIU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJHe6JlB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A71Cl9754346
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvo+gJKJcdSTFsytJP4C9fn/vpgKCrfkkU2F3RLp2rM=; b=WMVmnSIUNnQMnz+G
	E9htb2pX1Xxykkf68zC7TAYJgyqUHA1f3o5ozjQ8z7p2MSpQxex3q5ed/RPjsYEi
	1V1FpicOGtHk6bxkUR84+7y6ixvBxPCo29gDlr8JW+i5SRxPuCBok446iWdXJvRB
	mde5/iWYIa4j0QfcqhxfGSJFDptmxM9KeydmOXGnVjixZvS0bVsy/SAB0adwsoyN
	eIWPN+tjQ7fvKnHcoFy8yBM826WJfVogBgQzKfXHoLpcMazXnPgq/8xATJowU7Up
	v81UceUP+o2B3qNBVWkIVvSBh94v0Tg59/bLIQat7ZOvwyAjSAgMN/XgaXZU7w4C
	/777LA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvr9u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:20:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9399b66e0e7so917423685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789028448; cv=none;
        d=google.com; s=arc-20260327;
        b=OuMUou2aqlI0PT8gNPnMs1zQcUz6n5VtcmXy01Xzdmaw8/5SoBvdyynwI8WUj4cXwk
         dB/WMehmSUYjWmheN0ES06+uxXQOxmoD5Fty+qGAsNOvgicSGgg+18LbJTHDZRlCsAGr
         td6/dAmP/Al2w4yhEoFLyxKNxScb6XgCqCB2Ftv0I4ev5IFYEUn+DNS+7Dbst4RaE0OS
         bMmsvmCMgTVVbhqov5k5w3uAiNxouf4+lDaElwVce7JYhc2law7Duzy4vix1dLTuHyz6
         QQiMjvmdYfMO5F13C3FVeoU2SL0zY6mmALvSMWofsLWEENG/W30t2GfRRmhy+bQ70g/u
         Whzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvo+gJKJcdSTFsytJP4C9fn/vpgKCrfkkU2F3RLp2rM=;
        fh=QZpEuLN7m1roxlYl01Y9qytDW60SfRv6JmcpY5VXgnI=;
        b=n3LlA1r6JENA9HU9dbbqo57KGCSl9ZCbCD6QSWXMbRn4U7GHYbuGbN43bouNGVhDM8
         N1A5Fu9LKrOtP8JSkyxP7KeiaBwrMr+93wrL6a+161DhMDDi8I7Qe1ZwDmxvWnhF8GcW
         LLe+Yyp0KqWkg3zGJrrbbji88fBDFJTyMcJWfAmvrI3H12DtsJlAcS5DMonyqqwu5YfT
         vpz6pRMeAX5HibgJ9CFgJc+HTUo+bx3F0jiZLXRygkodquWB/rnzsqbwg8zDBW7XNa04
         Y2dMmWDVjMWW+bzCas/us4MQQx2KBWTufiMpfgyjRFLryqbG7atJckn4RiktlCvrbmzN
         Vrdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028448; x=1789633248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvo+gJKJcdSTFsytJP4C9fn/vpgKCrfkkU2F3RLp2rM=;
        b=LJHe6JlBbhJWlHS4rr8d0hZj5P2uLSN9vsuXmqs/fJNLym7ctREas4rFzVxGdsd6Uv
         vR1C4UFr4AFGeOukLItrRaOZEjSpeJ9baYMl6WAgROh5ZL/CmmAb22TMsYthRRDLL1On
         LpPF34rm9jcMKeiftMSO9Y+4wBPFGGYxzMF8gXNSlnWo9sQ8eSI9i4b6zgkZPTB4bS5P
         jcvlvSv7zkxWXgY6K3JAQF9m5n/dewrKZ2/iIrvjcsVCqvzN1rdNp+Iy2vw05DxrOxBE
         sb6nvkC/wDyrsCD2yNiLBL09FLchX5w5iNOchCHdBHRJX2oLKnO0vwIptVOKuaK1i2fE
         +1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028448; x=1789633248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvo+gJKJcdSTFsytJP4C9fn/vpgKCrfkkU2F3RLp2rM=;
        b=O+6oVWG9U7cdruR4sPc2xtEWf0tRhXeyTVH+RtrSoWk84O6DBdJizB+aVmxQmKbr56
         SiV6enWWAiJ/t42V83w1QwGubuwvLN4oNs1JgKFiMNuyfq5dSoLmCs7MQPk2SfktETCM
         4RZvoE60sOmv/7d7I+aO52X69zo7Mt5ifuJ5wGcpvYq6KLSixzZF/nG5JmJ93yhUgvPk
         801uSXmofoxsqSUveEjbQVlGHyLqAxzT3p1ZqJG+q6GRGAF7QSvrWBUn+NvatNL/OdbH
         UW+vaRRZHOEFm7S4WDgXHrI01PDecPnV9AW65j0EBr/9AwQuj5OtjfEiYvecSiE2mkCI
         153g==
X-Forwarded-Encrypted: i=1; AKwUvBzJkX/85v+YriRS8L9PiPzr1lWCq1q94aPaeAbuEJrFfkDeobgkXGIH+smAAL/NuDgICQ9e2inHZP7zWZY=@vger.kernel.org
X-Gm-Message-State: AFuF++m8Fw3XKDqsE9of9sWgP0ePSii74cIRheXCTPW7sUZBRyp9U3z7
	r+Zp0/AJetdteep9J50xyQ/emSTEn/3r1r0MDI/VX+ZbhT5DWIxRCNAHg/dskTfrvgETOqf8AD5
	zKTF/8nNsYcT4h46J88zl3M0LZgoSbGGJg1OAPJuuBkQTVH161OvQx+AZ+r1vbpuFEJMJW3Nc6F
	CAwjIDNSmARIFDvyAPiaIkOmgvw/M6ax8OwW6/68YdJA==
X-Gm-Gg: AYBFou1hoVHVB7rRym4PycpL5NPuWKq21lakjB79I3r0Dq/7+XoJtjMc3/gagn+/+HZ
	zYUivcL9w8+m9SS7cMV0EO87U8s5VLbEkP6Ehqd+2XmgrILWL9V6c4r86lke9npCEjimD4FjSjM
	nuWZrRrdKKjBohGEaj0/bhKBWXF3Qjty65Nt8B+lWNeIXLwuhFmRqI2wfblCF/PoDAlZoHLrE3C
	O2t2s5uwAV3me+iSX3qwMG6JaIz5d1MU3I6Ps6HPGRrN/zIRVJfOZ0ujdBX5Z5IksmO4ApcPorx
X-Received: by 2002:a05:620a:4389:b0:939:6de8:43db with SMTP id af79cd13be357-939804d76e4mr4288511385a.47.1789028448412;
        Thu, 10 Sep 2026 01:20:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4389:b0:939:6de8:43db with SMTP id
 af79cd13be357-939804d76e4mr4288463985a.47.1789028443258; Thu, 10 Sep 2026
 01:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910033356.1052661-1-zhugl3@xiaopeng.com>
In-Reply-To: <20260910033356.1052661-1-zhugl3@xiaopeng.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 10:20:31 +0200
X-Gm-Features: AcwNN1UxpGXbZOkTtYTEFpfk69pJe6c5Zo9ztfNY-JIQ24mBlchhctEeZIV-neA
Message-ID: <CAFEp6-3QOiY27ViJKtSbXZs4fBDQ7pVr3T0V4Q7ERnmUw0jjOA@mail.gmail.com>
Subject: Re: [PATCH 1/3] net: wwan: mhi_wwan_mbim: guard against a cyclic NDP chain
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
        Liu Haijun <haijun.liu@mediatek.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa26861 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EgahoUkMAAAA:8 a=VwQbUJbxAAAA:8
 a=bSoUDPcfU04rEmEJkLgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=D2SkTF70-_n5gOfERQdM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5MiBTYWx0ZWRfX23SXaOJkHyVb
 1V/wj/tu0HNNDLDQd856RHEPEwuWHgw9llMu1vqdeY1IUv/hlVSDtCXZvhQFppBJ0dynOOUT5NM
 VpNJpIzuZsPUOu1xY1AWJXN+7rMYSNl0TQVvhFqLDkrCByOknsRT/HtIBbw67/jGOkp0CI0I+St
 0jL1IyOqF/T3o2NKN0pq7KCiZy4WKOuUvA8rPmD7fzOeWlHnxemt4gDLSIH2xMIFehcVhILjSsS
 oe9n5fQiFGlmo7pYdfWXwwa0d1bzYJoVyXNOeqTEpLuMCLJTcy/l7/jCnY85ycFgwkZP6xY471q
 +HTZF9LJSjBGz71GY7j2Wxm6Y/QrD2QKPKGqaVcBqKMg56C09bCdEt4xdPd6C6KdpC8HA0qM451
 kH3EA/z5ZtaJuvTfB0JEjnF1GdKl6SN/Fh6JeyX6qvi7Yd9EVHeyId8Gei7USurYzcmecuB8Ngr
 NkI0dVo0llwLmflbCtg==
X-Proofpoint-ORIG-GUID: 40iVde6sIbBAOUztN4j0gi5mQGSv0bwf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5MiBTYWx0ZWRfXw6w1jmcwMfPl
 Oga0q16f+TurYMfBvqrAT1lDlhY3oSdEwAbwsI4q1mIcWJ55+FzasVF9sMpz4++JQf/Uq1e034O
 Cj8fmOmDDtfUoWaXB32fSaMdeqY4O2Q=
X-Proofpoint-GUID: 40iVde6sIbBAOUztN4j0gi5mQGSv0bwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100092

On Thu, Sep 10, 2026 at 5:34=E2=80=AFAM Guanglei Zhu <zhugl3@xiaopeng.com> =
wrote:
>
> The NDP traversal in mhi_mbim_rx() only stops when wNextNdpIndex is
> zero.  Nothing requires the offsets to advance, so a modem that
> points an NDP at itself, or at an earlier NDP, keeps the loop
> spinning forever on one CPU.
>
> Break out when the next NDP offset is not larger than the current
> one.
>
> Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
>
> Verified in a QEMU guest with a fault injector feeding the driver's
> receive callback an NTB whose single NDP points at itself: the
> unpatched driver spins in mhi_mbim_rx() with one CPU pinned at 100%
> and the thread never returns.  With this check the loop terminates
> within one iteration.
>  drivers/net/wwan/mhi_wwan_mbim.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan=
_mbim.c
> index a94998712..ef158edeb 100644
> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> @@ -254,6 +254,7 @@ static int mbim_rx_verify_ndp16(struct sk_buff *skb, =
struct usb_cdc_ncm_ndp16 *n
>  static void mhi_mbim_rx(struct mhi_mbim_context *mbim, struct sk_buff *s=
kb)
>  {
>         int ndpoffset;
> +       int last_ndpoffset =3D 0;
>
>         /* Check NTB header and retrieve first NDP offset */
>         ndpoffset =3D mbim_rx_verify_nth16(mbim, skb);
> @@ -265,6 +266,13 @@ static void mhi_mbim_rx(struct mhi_mbim_context *mbi=
m, struct sk_buff *skb)
>         /* Process each NDP */
>         while (1) {
>                 struct usb_cdc_ncm_ndp16 ndp16;
> +
> +               if (ndpoffset <=3D last_ndpoffset) {
> +                       net_err_ratelimited("mbim: non-increasing NDP off=
set (%u)\n",
> +                                           ndpoffset);
> +                       break;
> +               }
> +               last_ndpoffset =3D ndpoffset;

It would be better to address this under the next_ndp retrieval, something =
like:
```
n =3D (int)le16_to_cpu(ndp16.wNextNdpIndex);
if (n > ndpoffset)
   ndpoffset =3D n;
else
  break;
```

>                 struct usb_cdc_ncm_dpe16 dpe16;
>                 struct mhi_mbim_link *link;
>                 int nframes, n, dpeoffset;
> --
> 2.43.0
>
