Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793357985;
	b=HkD9wgpLqyV+pOwdW/hu/lWGKRobGLJ0CvXHYN9JTcTfulSnaguhSOxo0Ya0DR/sINBm
	 sA8yx4Keh/9k+1ZbC6veS6RqZu2J/6GOCjVoaNKkOm8bQ0znNKsKprp7uax0ZWPb8Zk3G
	 gLCkstew6OaC3P1cW2mu1jCLwVQ9EZAO4f/rSSTpIUQ6xTEGXJ5wVOTRIuC5SFlZuAPKX
	 0wwSSjBPBtp4KKvK8sfiOa/+iPlCsF7QrOtdOUL96jZwKDu/+tHnmCbvOd6mw9xzr+5yd
	 XjDf+6qlhPfOyDkCKuAm1SZ48Xvvj4vY/1e6uiyNiexMPc9P7A3vjQaclSth9oGlVRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
	b=XRsWb+I4EfzHxeo3fGUoRbMCOVdRApNzShoMWJus2zbsgIeGg8q1UbNzRx+/QlB7SjB6
	 MtnPdAaZpB2EINUxYvgsM6NSbXXEkNnePgAo9dQq1bfzzzpTcZjRiiiKl53MqvTqI+WrU
	 tzmO9oZemFKH3FoIqHUhEmmVdkua8CCQ5yojZlTGBjWWUFTBQiWRs/0s7l8S3vM2WaLn9
	 LMgGN2zceYEpkthiqU6984OzGd+2g+M79ZQxFEytj8zt7WQDaRpqD8R0uHFIn4plNiqhr
	 Z8CQ9mRxw0ueHjZQ0T5KzhrvePjb3s0XVi50ZGIJE0JgJAUXw1w1z6Ci/8/3SsRhxHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FoN5mx08;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2MME4E9;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE28B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FoN5mx08;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2MME4E9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F29x1120522
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=; b=FoN5mx08YJMEym5Q
	rgXbClm55skGvq4gNRlOdq3VYj5bvbzTVDcDlzPDAfW2MBCLQpT331mdy1eBbaJ/
	/7BVMVBBszlN4oUHv0gPezwhdeyVijSytqhboPbeT7xM6EZ0ccfy8dlweducXX/N
	q82t80W2DpqBfcMZsLacaTuavA4WkryeZQGbD6gJQ2ifRuEpWxVarNVORqlPbrMI
	KQPOC0Zx/ZmogLXzEQTpOuK80NdtABggXJe1AyhEinXsZnlbeQQzO0WgVJVO4ucP
	ETs8cseSTsYNqB/r3G1Y6hozHOerakapy+NBcEQo7pH3h+ZyCspbbTxOMKUsTh4H
	LfVVcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pjjnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so446072a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357983; cv=none;
        d=google.com; s=arc-20260327;
        b=kl5PTwwPibqLSEC1tSRFaZOUrWIwryZCrwvzAMjBiUkaCqvJphuu+FfWJ4lXtfQyP2
         OdXJX056feknr69n4/7dJAO+cs9zPIjrhXz/g+XNDmYbFDt9/M7F1yk/ldMsfAWFGHYj
         Fm4EtfqUQdw5+kNsz/6OeTaBc/zrSSnbFxH0d12F6+SWaEg2WeLQs8JAh1yBg0nxxr9p
         ckm+Sl53zQ0wWTN8LEm6t8OYM5GNi/tvzVsF8QYbQew1Poro7DX0abUO2vsqCNRI3n82
         gJEvspd9WKL8/bbbHGyUvtB4YzmVexDBfnf+aW3pk5beMP6AvtnU33NvTSoiRxrW0DAy
         g6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        fh=S7uA9QkcvzWYMjBif4k5VYeZcYmUzUQa725Q/hgcLX8=;
        b=TLTJYS0umy4gudcqCP81nAXxc7DSHF8llUCe7MGiIOmR0QbABVbf856RWoOf31pyck
         qbuA+PVTJ7jzAudLnT1hWjpJBylWH70NqYCEJb+sg4RB0DhMx6F10993TUqiZM9Hr9QO
         eW2tt8vgbaG9aHfsAD5UBKDmzNGxOPKdIWQo6i4Geedn5sbdSHMAfL7I4tbq0Ycu9WJy
         WYUGEL7lFzv2fXk43VcwyxYwcELcR+xjZD9fa7g0ON2RnJ0OSKvlq7NFi3egcRyV6Q8i
         idYi1FdYrcuZZZFYnuf8unWmbSPbW23nyHhE3RZJjMbwpZa7xR6n3y0zhEw+R7oiIVxp
         EObw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357983; x=1793962783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        b=U2MME4E9u0dEPktcvBOK+5rTWe+VYOqcIbLgTa7ux9ZkH7SP7fERIZR9o5oQUqVGhI
         HFbJjYNf7P2xvqL3ytiZVJBxyZ3G+bp27OO5JxnzbvReT6QrbfZc9f0l5vKYsAziP38V
         VXYDDCTeYt6nylnPMkOpB3ZZIxmYLYU+Dr0lxuFuaZpjQFqAydYB/VLMnP6SRrMgcp1l
         2c3izN2aKKnnlVIg+VZpMsacJP3dUWYIdJu2YdvxLsNBVbcEP4eXmQo0D5/YtAyMaSG+
         TzDXDYSm1CZk0fP8cKAdL/wZCJ4RH1lUTCTwIn/Fpr38hGIXvPD/2M02VLpVYscZy9RX
         N7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357983; x=1793962783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        b=X/7IHAEP12vSShsoIkIL43G7fONQShRbDfygKGi8zryAw7ePw5meI0WCSO3rR3vZzd
         ZBV2XJUB1i5yqAotz5fSM7Kts9yp2FnOJfqBZr46ZgIkpk2D/zwgG1TyHsMv/NDNA3A6
         Tv3pc8k6kqo8uozyTunFGYR8rEkQuiGu6xzLe88EEzO5seF7XifZuafNNWIrN8Yd29k0
         fCPjBmol6fBlx6Vpm+7n42wmeGEELBMptB2ZDcmkULo6qvgKo8PI+XFDGvi+EsXdtwDo
         W7KZscNnNqyZtmdxQg0AZyfDxdVhP/DHGOUcYYYwFirtTi1IgKl5nwGYaOQcACbZUYoG
         AcOA==
X-Forwarded-Encrypted: i=1; AKwUvByUnyWR6d5QglVlY+kaviZ9IVSixKugGGViXz2mdUgcoECJa2238b5jfFFIZ+GqTvu9ngZCn2GbJV5mfn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzgkplX/cTL55VAoWVm8/s8otAiZmLr48FLAYtM3+K7TkGMW4D
	QRgMWAxmC7u7jJIfc48bxP7TXujtsG8WnvFyl0x4ESw5iMi5RTdtoqdAxQngHy8JCBo8nJQtBJb
	7WyAxLGXaz3TrdeDVXkH0MCv84BCEil/CHDmViyPeB+DbiRKX2jAuUeH26tnSgolgyyI8+/m9Rj
	4DYmeb52xv6rD+5AqNyxh/Coi+/sjUy5oyg7OhUbzpSA==
X-Gm-Gg: AYBFou0IBl8fRbxgcFeXjqptl881XaGcG/PHoWhm82L3d0IMiT4Qm1mGKVnhnxCfqsO
	7QskrGcBaCtb2HFSsMEHmIdMPNxwB1K0+r23v6dRyfQyxQMQz0ZYSaXmWntJmyKvkMvOF8KJZTV
	i5KJs44sRnwi55OxGKIJp5NKYcJ1U7+aZ7PH2oEaefmkzx3JWJFe6o7oeEaw==
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ae8984ec60mr1499297a91.51.1793357983158;
        Fri, 30 Oct 2026 03:59:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id
 98e67ed59e1d1-3ae8984ec60mr1499273a91.51.1793357982451; Fri, 30 Oct 2026
 03:59:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
In-Reply-To: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:30 +0100
X-Gm-Features: AclHuK_ToRvM7ToPCV5jS32tMVtZ5JO73u8yLnSIIXc_hjp9eNCpwZsxviWTqwQ
Message-ID: <CAPx+jO9tr__fFj6ftwbd+VP-GAA66=T8DfHgcDcZLhHhEGY=og@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] mmc: meson-gx: honour the busy timeout for R1b commands
To: iav@iav.lv
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX3289DioXiYDQ
 5+s3EOgmHlOpDsAU3mOTYzBsEB/69My4qeXIRgTV5wf6A93QaTCKfQlBlainxUg0oACxKnj7eK4
 AlLmqnn5zkTvOor/KEhUP4IbOz8LCartdPRD2j4i3D2HtJZoNAXyQHj/uQRboMGh98dfruvp/73
 aP95D2bc+sTuMieiUeASiGRbpoX5dJDKqK6UZJlAPdMQp6qkJsMJoVwkZGK3Mo5Uj8p5gObGnuI
 Vja7VpuNwbOFyaIbOlVszKi1sYRIXPHWlL38vBrF9wEEqz87SgMmX/dpETNXAxZtIlT6OzwDbmy
 TKZ7jJ/fIvNrSY4eYfUP4rqL6gdZMZ8yB4zi3vsjsAISD5wDhc/1drPESaSS2qEl3+8eXatqHrk
 0OsYYv3c5W0m2btHRyf9i1UByk7fXFp0mzdnFeoJxg1MM7vEnRNfbz83A+KTh4ud/LkVm9N8c61
 jJd4hJKeI7tIX6wfujg==
X-Proofpoint-ORIG-GUID: w2cuIHTQLd61vpEM-OoTYDfoEObkqwmu
X-Proofpoint-GUID: w2cuIHTQLd61vpEM-OoTYDfoEObkqwmu
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae478a0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=r9kgVt4VC4hP7zZAK8AA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX76VqCbVZk/zD
 QSZ0tu6KWo4v8ZRhMuV/IBTKwJqmOWoP4ho2tW+I/e0bb13IE+Xm6n+yNut2sD3Hk+/VRE9CA8n
 hRdn+XkkeXWFMLtxYVAP3o021DsHXtE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Fri, Oct 9, 2026 at 7:03=E2=80=AFPM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> For a command without data the driver programs a fixed 1024 ms into the
> CMD_CFG timeout field and does not tell the core how long the controller
> can wait for busy. Erase and cache flush then fail with -110 on eMMC.
> Patch 3 fixes card_busy, which reported a busy card free; patch 4 makes
> the core rely on it.
>
> Tested on ODROID-N2+ (S922X), 256 GB eMMC, btrfs root with discard=3Dasyn=
c,
> Armbian builds in docker as load. Without the series (7.3-rc6): 262
> errors in 3 h and 68 in 2.5 h in two runs; the first came 4 and 43 min
> into the build. With v1 (7.3-rc6): 0 in 16 h, 2.4 h of it under the
> build. With v3: 0 in a 37 min kernel build and in a 20 GiB write +
> fstrim; a sanitize went out as R1 and the core polled DAT0 for 523 ms
> until the card was back in TRAN. On 7.1 with the previous eMMC module
> a synthetic test (20 GiB write + fstrim) gave 48 errors without the
> patches, 0 and 0 with them.
>
> ODROID-N2 (S922X), 128 GB Kingston eMMC, 20 GiB write + fstrim:
> without the series an erase hit the 1024 ms limit and failed with -110
> in 3 of 3 runs. With v3, in 3 such runs and a fill of the card to 85 %
> with rm + fstrim, 5 erases took over 1024 ms, up to 1219 ms, and
> completed; 0 errors.
>
> ODROID-HC4, SD card in SDR104 at 1.8 V: 0 errors in 5 boots.
>
> The timeout is rounded up to a power of two: the field holds powers of
> two only, and the timeout is a lower bound. MMC_CAP_WAIT_WHILE_BUSY is
> not set: I have not checked that the controller waits for busy on every
> R1b command, HS400 switches included.
>
> ---
> Changes in v3:
> - Clamp cmd->busy_timeout to the range of the field before rounding it
>   up to a power of two: the rounding of a value above 2^31 overflowed
>   unsigned int (Sashiko).
> - New patch 3: card_busy reports busy from DAT0 alone. It required
>   DAT0..3 all low and reported a busy card free (Sashiko).
> - Link to v2: https://lore.kernel.org/r/20261008-meson-gx-busy-timeout-v2=
-0-8bde1adfb5b4@iav.lv

The v3 applied for fixes, thanks!

[...]

Kind regards
Uffe
