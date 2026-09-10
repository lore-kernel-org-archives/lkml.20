Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A1C3C3F6B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027772; cv=pass; b=etnBXnZyrdqn57GSZPY3G/Ubhk/0Q7ZNcHI83OGfoOa6BdYjP/9RIdxNVepJH/8S3X0hGJsbWCeu6Txp9VhDMsVkO0aQdiPIj3UkpWckDLBTFSoHcV99eF3yfLQLKQbr24TWBrBflj+aE3CboD1ZON3Ewj6AI+mgg3x13fffh1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027772; c=relaxed/simple;
	bh=e+oi/7PVMHZr0yXmqHSvM8XmVBC199Drw87zijqnF1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/28fq6zsBY40vGPUmxfW9OezfLgcT/t/MXWjgGn0j7UbVF8YSqEpFWhWUXkI0SyyXbxFWad9opHAkHsCXtvJ9DnuVXO8UlDPXxF5lVUa6MyNBRzEhWO7pakObWo3QflhoRJz7oM3NA2O4/WCzvIptGtEoXJBNquje/WeccNjMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnuYhC7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KESZCpMu; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnuYhC7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KESZCpMu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5HLDZ2974614
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrcreM8EzHtIJPybaks7D9tmnm5FFMtbNZvHl062kt0=; b=QnuYhC7AcE37eJFg
	jvAa9uaIU5U5Vs4O6u1T7WQMvGVxhQsbjnkHsXUFISkoJMLC5f+sQfw8A5uU2W7U
	nYyQVgD+GkbYAmEfVYYk0et3A55xXWVCtKpfQakPJLQRKQ9OrtzvYgC6wYUYTX5I
	Oc9jLRnSOC6K2U0a9W+WBkNmNQx9GTRrq4A95VYU+WNf6f+jTMjQbawatgqTcC2x
	A7IseivJpEmmEs1rLyQtIzkn7sLN8MDA/flWavDKujiDiC4nXmUpa4cZVGFVwwf+
	5P8UkxxANiFRCwWuGFinpIMJSJuAq7M3g3gcXm5IhfYINEX/qKz6iS5uAvzs4tOO
	GQ7vYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2sh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:09:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93917f4ccb4so832141185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789027768; cv=none;
        d=google.com; s=arc-20260327;
        b=UYBUmwKDz1KHcubRHJNktpvTZsH3bQ92pIDbeWKhicW7DpzVSamZ1s0ufo1bpVGycI
         GQgKVe+7xiZmPJfxLK3WfyXs9ghlxe3YmFc9J/pTPD14uKWesGjjrrFdTelT917tHisu
         vBF51943zwwAQasgB96DsKOF/gdFk6TMJ24dg08qpoZNDIhj3n9QCYiZSKfV5iQQ9gwM
         EK+/qXyskd01nBGou9i+iOh9gdQKhiibn7N312XLVvxT1dCoah2hxxM+zbGpNgKnz3YH
         xUUZR+P0DTUbsG1qryqjznF1vU9M1JwhYW5NlT2MDKpgcY81ub6jbNyra2IlNeXyELes
         Pg7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hrcreM8EzHtIJPybaks7D9tmnm5FFMtbNZvHl062kt0=;
        fh=bCpPHEy7Om9wz40WPuVm7OjYCFCFjDdg9c71/7u/y8k=;
        b=KjxSiBcRbIEBVa98PKAcyqdxIwMobV2i/+1S2skwJLPjQIdCi1DkTvgOvftu4+SDNw
         stzRLDrejcWJuS3XvPmkOo9gA6o+9KCJ74MnAuf33LKPoVb+BHFoDbQQwMVrtyqzYWkS
         mBcrYAf+q2+wKew5h9AyaB9gnyHT5v8/fo/qFzUVQJyz7QbB6PIQ4M3qgBflmtH/jXxQ
         G1+g9xak2thZkidpOxZv+c//WL2ry57HUw6dlXvBpXdOYhvB8bhhtGgzYcjHXwJLFePr
         bDdvuowxST+46ZQEmW1tAo//kC/olpn0/zzLU9/iAuplH5e/6KbfDOskIykYy0F8yItg
         S/Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789027768; x=1789632568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hrcreM8EzHtIJPybaks7D9tmnm5FFMtbNZvHl062kt0=;
        b=KESZCpMuHpgIrSgbTFZvNukqz8adFOI6az8OxiBszlH0ZOQ4NFX1cQfk3oRvhfKaNz
         PzOTd6EfiUPR+DBh6GLJQn2YC6gWExKver97uJMPFVUis1CqTZ0qDpXNT0FS630H+Yc1
         cd0anqSz6lwZP47BqDfB4YY6LC60Q2SFkjf4R8uxaCXjoEFDgQTtRSS6O/GE6jaXzBXF
         eMyTdI+pJ6CqfF9XvywS/LWksXF5+byrFy7uW8tZ9AbRwvJrhA+7FgkS6b7SJEJFgPvt
         rlKL9of68mWy2wKChabhMcX3pXLxe/mMGhtnZVxCrL/up/PxIzfjZr4iOScjkt9PHv83
         vTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027768; x=1789632568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrcreM8EzHtIJPybaks7D9tmnm5FFMtbNZvHl062kt0=;
        b=RQ7QvZ5W2mwnYCJ3HG2JsRL7z5IZBmvmzgjQTyV0YkXTAvCaZ3WiZhwm1oYKCozB17
         Wp8XH94jtCfvhgrzmqUXod0Ffl1RmbESKRw46BEFBINcCNBHzEmFqHwbV/vdG9ZEUu9T
         aCThcJY46wL5Z5qbIqGF5Jbxw2R50Ddb2aGGAXVtVDcX7aRGJW1wTr9vzUTPtMBP8ZiF
         Tk6QM3D5gO+FtNbdthf/+JneCpWK3Cu5nIY1XnE1KKW8LiFfcjdRTUhDgw0Wrmz1AlD9
         UTrGxSK/JqmZA1jKZODJm9A30iwQBJoo9OMLkbyjlxblEdM+gbPfDjh28TfPKeDUvIAz
         aAMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSvUog7gfnzRRGueOHqaEeqNKmoYE4hMreU+Vm3c7GeQJw+VtbUjQ6mFD+f1M/IQIVt8tLG+jvWuMc85g=@vger.kernel.org
X-Gm-Message-State: AFuF++mlKWd1VVTCyYbXfL7SS40xOjYmPUowTyonfZyPdW0kEGbQYomi
	9oQH4Uegw/7dmViTDDG31LKrOhNN5RT0UD6Ktm1WS+uYCTS9nAldxVCR5o9MUQUl6b23pABUA15
	GtOFvDvTceUuBu3SQ1XWdCDRlQLxAC5md3XFbjwW5rERD1kAwYnpSq6W+Y8jlFOyef/nVAvqpfT
	ywSvzCquwXfiZXp0+O+uE5BIwdwFzXdVRJOOhgmhfN4Q==
X-Gm-Gg: AYBFou1TSm2QEuk8X+wAzMMcEmKm2beQv2xtjsz3UteEvRI7lMbnAiGfiC8/WXEbnJc
	xJTgwPh596+fJbB0g0f1ZJTDPOnBW44I0e5r4SX3jC5I20kYGFTIoHUUkgNQQPiclL5kdB5qkzh
	36KDHkuTUobFXnJ1+6C2/m0h9wgpcyhnIXgAurr5m/eO50iw0duWNFMaHSu1FGXTBLThdpaA7WH
	NHdC15FSOv71668eUfcqmY6bAP4pfx5DMLo2xa3oAbgDI9LX9ypFOAHpVCgW50rSTZPNdIFsAUN
X-Received: by 2002:a05:620a:8105:b0:939:6de8:43e2 with SMTP id af79cd13be357-939804cadaamr3577777585a.47.1789027768177;
        Thu, 10 Sep 2026 01:09:28 -0700 (PDT)
X-Received: by 2002:a05:620a:8105:b0:939:6de8:43e2 with SMTP id
 af79cd13be357-939804cadaamr3577772285a.47.1789027767689; Thu, 10 Sep 2026
 01:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910033356.1052661-1-zhugl3@xiaopeng.com> <20260910033356.1052661-2-zhugl3@xiaopeng.com>
In-Reply-To: <20260910033356.1052661-2-zhugl3@xiaopeng.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 10:09:16 +0200
X-Gm-Features: AcwNN1Ve1L8LMjcOpqIQaJD_QJYZ6Rdp4UWA7GwnfSgFAJr5DOKNJ8SBomTQUyw
Message-ID: <CAFEp6-1VVVk94T_EoaXSW8aJzRNuWeGTo72ZQNPJePa=aAL5-g@mail.gmail.com>
Subject: Re: [PATCH 2/3] net: wwan: mhi_wwan_mbim: check skb_copy_bits()
 return value
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
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa265b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EgahoUkMAAAA:8 a=VwQbUJbxAAAA:8
 a=wIlMCVVetkfELOPdIZwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=D2SkTF70-_n5gOfERQdM:22
X-Proofpoint-GUID: 9DKw3gUyvJ4EvYf4HqGDoVw6ensBnZrb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4OCBTYWx0ZWRfX2JOZ1SXPUtJ8
 uPqNz6IAUsfwd6PQh14OonmkScXZpPgxEZGbZ6RcLIWkBgS1Ca8bIr8hIgYpfJ4meiRe8B9jpTM
 d6OrtCcscvu9ma/Ixcs4dIE8a8lcuzE394OqcPbZkh8d2lvmsmLmMv09IxI/a44DjxmTsyguRxa
 DHmnGBUNYMGbxV215GPNGEp3OBlXSrSkZ//pSW+Wk0b4XEv4Z5SsBImxWWp7li6ExyXkc3v28nG
 DLUNcx3kTLoSDgF1ohRaG2rNSDG3xdhlVyuT56bZ671G2UxfY4jeyQgBs/ZPBbBd1yC7ghYLvuN
 cDHoy8BL5CgruAoJ5e8nJUwrDBTgbEAJCPuaSPZ6GONIMjZvpC1McVIbMWXgv4L003YuwuOxQgL
 m0m1tar3BSGjal4WHx5zifBmQ1VTSe3iZ6tyLM6J5/rpuAq89TEBWQsKyJQpLZ2bZsgzG6wH3wj
 QZiOSjsfBP5ViAVijTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4OCBTYWx0ZWRfX2I9KQXaMI5mb
 MU0abeiClLW241eEy3SEEL0l5+iPAWX6cikCzCEhdZ0QLEfVm9rxDgg0RBx2jOOF2PseR+DSlmF
 0+Zz5cqyy8eEFIM8PI8j70S6c1JgXf4=
X-Proofpoint-ORIG-GUID: 9DKw3gUyvJ4EvYf4HqGDoVw6ensBnZrb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100088

On Thu, Sep 10, 2026 at 5:34=E2=80=AFAM Guanglei Zhu <zhugl3@xiaopeng.com> =
wrote:
>
> mhi_mbim_rx() ignores the return value of skb_copy_bits() when it
> copies each datagram out of the NTB.  The datagram offset and length
> come from the DPE, which is only checked to lie within the NTB
> itself, so a modem can point a datagram outside the received skb.
> The copy then fails and the freshly allocated skbn is passed to
> netif_rx() with its uninitialized contents still in place, leaking
> kernel heap memory into the network stack.
>
> Free the skb and account an error when the copy fails.
>
> Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
>
> Verified in a QEMU guest with a fault injector pointing a DPE
> outside the received NTB: the copy fails, and the unpatched driver
> hands the uninitialized skbn to the network stack (observed as
> "unknown protocol" on bytes that were never written).  With this
> check the failed datagram is dropped and counted as an rx error.
>  drivers/net/wwan/mhi_wwan_mbim.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan=
_mbim.c
> index ef158edeb..71e700008 100644
> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> @@ -328,7 +328,13 @@ static void mhi_mbim_rx(struct mhi_mbim_context *mbi=
m, struct sk_buff *skb)
>                                 continue;
>
>                         skb_put(skbn, dgram_len);
> -                       skb_copy_bits(skb, dgram_offset, skbn->data, dgra=
m_len);
> +                       if (skb_copy_bits(skb, dgram_offset, skbn->data, =
dgram_len)) {
> +                               dev_kfree_skb_any(skbn);
> +                               u64_stats_update_begin(&link->rx_syncp);
> +                               u64_stats_inc(&link->rx_errors);
> +                               u64_stats_update_end(&link->rx_syncp);
> +                               continue;

We perform the same error handling in the switch cases below, so it
would be better to factor it out into a common helper or a shared
error path.

> +                       }
>
>                         switch (skbn->data[0] & 0xf0) {
>                         case 0x40:
> --
> 2.43.0
>
