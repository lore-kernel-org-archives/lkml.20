Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B66E43B6CB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277587; cv=pass; b=Z0yrHLHvTPkweUziKE9EQF8Y42SJ2BL0NWvdXWDmeMndiQtR8AMqfIbj0qRbxdHBEGvJBG9xdI0jBOsc2vBmB4JQGfi0i+c8tx5TNGndZ8QdITdFp6ucE00S2uDpKn0+3TktqXdBxxhS6FOF/vjyRgr6rmLV5Z2OmtjvIw/TcMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277587; c=relaxed/simple;
	bh=XFUUQpQVjHmTX/OMS23vt6bYwXDq4wDECu8gMDnXyKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qP9jTW1FLh8VeWMQUXndiWBZiyaqFVXZ3+4gWOAEJLfb7IuMKMD+kefpYuHCBXNdWZdRfpN+5HN/8zVHBAxs8jIUXj6bW9dTPEqONt8p9+LiP8W2Hn0IVnC0YBEMfYV4uiQasB6EY0DM3TVEGH4AFUKAYFo/tC+lS8frGHxxpfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn2uc+TX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVIgAbu4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dn2uc+TX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVIgAbu4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E91iq2647240
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=; b=dn2uc+TXd6LM8e5N
	jnnwjWOAapq/YOWMDaEoFrFOeBIDw9qcaF15/5VAmvOmGNMj66MbYV0ewcPRKZ79
	sbGACZ3oeO1OFMEmi9OwY9D9VnLExCHrvSRQF60SHV7whqMBhb4Y3eyOMQioBlJU
	vSHKPVsbSHUJ4VBy46m1vYsEY/GbkGTrUE7U3sa2vn9UGV+gDcYeQ7Cb4k/jnxHf
	eyfwOQcrcAfhaR5Lz/d7jIZ5PNctbJ6Y4Wd0AQ3TpgrivnL8mfG2r4ANoGujlQyK
	mD52DMquVUIMMAIxdpBS200NSUd+8D3eu+OmvNfqG5CkgfzxvbfGgs+9hdfEbblP
	lMRRCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fu5j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:46:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso1386888a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277584; cv=none;
        d=google.com; s=arc-20260327;
        b=ku4c5ldWhJ2N1IDTgSNA6rq/P2uOcUJ0zu2M2rLJuCC+vbfiZ0k7bh/ryu8G6Z1STw
         ivG9DF+Qo6s84kco3iRffNws8E6aelKwd83p9OlY44fScqPtpBu19xMKGJk5gMOz8xl3
         pWd4Eyume4eNZ2iYYwM2I5kM6uoS4z0qx+d/ufxAsKlz04RQ4AeZjHGETn12UtKL4aD9
         D6tyCrqewpkoKVL7zbKH4+1ENsoYekHIj72j9Fzvkj7LiiCGbdWmSHdtw3EIEW0Y+uqs
         9yOtuQvJNQz8mcm2rIgsKNi1eVgAqOuZ6+h/Gex8spZlD87c3MpvtTaRQ9qB80HftuAm
         R3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        fh=tvoB+0kYIHGUT0LdJ9n+UciygbyTN5fTVUm0DDBmUGg=;
        b=TMtihK0KTEhauBqkViBWAAhnRycj/ZKSl2GXEtXUKRxDIpY89Z2Vhg8jm/r3xHYuXj
         7K9vJpC3h6E0gmIZWn2PS0OPOhFP8sfQM4ti0h2lVQ5SRumrnksrYoLBvoAKfhYxvjKk
         kbpiTg27FtZGFfq6QiWHL1A6zakjQmoLF2opuHg4zKIUzaCwWx1som4GxCa1uIArVpAx
         6yJHqhhxDouZ66urtMdR3NAlAVenwCjKAl55911msjK1dNO57TPLOmCnbUqL1KTGaQjW
         q8Jr50xENQDfWWsUdYVQbGOs9bCWwa3TYrXf+bCadnzCLkFR6eJfU1aWs9OkJ163EA6L
         RK7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277584; x=1788882384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=eVIgAbu4HFPHFu4TAvgA7+2S2sT3XmJdp2PwB5PpI7gzaogiPEi4A9BIjMD/RnIBLs
         CrLqEbFMs9/ZDXaJdlqPE07GWJOJZmeq1XAN/X2xWPIPF598hSWsqgvmZJi6SDgB3sRJ
         F9l3ne/kItqtbKhyrq+OnTsL0erdyT8QAjc7apisErp+QFJ9pvBGt1G4FD0dRRVLU+Vo
         DVpL73yMt2e70+d4kCIu8JfCxO2rRWMdvnMIUqDbCM6jH2prYoA+1TvmvBF96YVqvJvO
         7MkjEvOfNP+LxYue/UwbnLBkWH1tMFA+MnDbQmJrZvxJRdcOXIdMGKNXGUoqCtzHC52b
         YoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277584; x=1788882384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=UhtxhaqSDES7dJglnXXoRNGRR18r0X2jtb5lQeV5UKKtN4+71p/csEPuysNCyEPjgT
         8AFYIeAqzl5nZQMQIWrCQIfoAGDUyvoWIDLW+bag0ll6GdMrSlTAnQqqRNV1OvX6QKhq
         skZMuba8JMvGUTTZimajRwiacYKdvVDvjs/PSX5qVtPEj0dGntb9Neb20pqn6zo/+qI4
         ThnZ5NN1Up8I6YMN4Lp0ATz8+iCzOKf8wwqOQQW7chf+c5gsOr+PFU4xutq1XkSLsFvu
         FJ4/H7fJ0vlyF/NxwcMrtmQaQSY3pb2FsqoZwQMn6d1T7hFhD9GOcdhMEB4Cdbt1L6iq
         trnA==
X-Forwarded-Encrypted: i=1; AKwUvBxDcStZ2xZ92J931ZomghQZGAKf7gUO6tg/evjfnqzRJ3DvVmOtj+9GuphqnbuzUl3jgpffh+1Jc71mGNU=@vger.kernel.org
X-Gm-Message-State: AFuF++kK5E3XO9vFME8A79E/LIR7sFk2BVsq/8iZH9tI8SDTGnpoB3pW
	adJIMwJA5czyXorZPSOgCKhTcK4WDdr12zGDyX9yPYk7Dv/pBYC4dpZViIt1ZNkdll+37WUp1s2
	sFf7iad3gIid5juG+Rygli2g3OMn5mrMuyuagsnM1vVwRDrvuSo00JijYNFcKE0SON85OYv6uCT
	zWoInW2TpkQAzAbBOhMfvC3sB5jB3GdWG0MPbfi5m/UQ==
X-Gm-Gg: AYBFou301C6rJxloeForfMlmihqHEWYa77jpzwRRNry/HUjyQlqEi4Tiai0L41sjNq9
	ezuLNlq8rOVHgvLX8wblnf2OCNfC5cUJBSyS+iuhKOLnjRosdSUFuXyNnxFkQy7DfuZ9TZQGQtK
	+7s+Yh2Cb2g1Mf0Au96wP/1M6BiXmIc+gA5dySeZYIW7V74nEqvZuYZW68gw==
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-3990f79ddfcmr3891984a91.5.1788277583834;
        Tue, 01 Sep 2026 08:46:23 -0700 (PDT)
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id
 98e67ed59e1d1-3990f79ddfcmr3891921a91.5.1788277583296; Tue, 01 Sep 2026
 08:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:11 +0200
X-Gm-Features: AcwNN1UOgtX_S0RX4JszYubxSoHCtUSFoVM1QL-GMxkUwhBphaMhOq7ZdQsciOw
Message-ID: <CAPx+jO8u_w417z-z_2fkQcody_sYbijHWTowZ-RsKH4Yw3xW5g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: mPl888kBx8jjR2Rvnr4cbBqjq-XEFon_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfXwa447AQL0JI7
 jYhWQJw5owkcrfaGmsb7+bpswLwflrH7ZIebEXqW/Rt74sZtG0Ht+/A+kx/81bdzwmLSc82vtG0
 jk5fdIz9GrmNVk6Nto8+S1TBx/vkEsw=
X-Proofpoint-ORIG-GUID: mPl888kBx8jjR2Rvnr4cbBqjq-XEFon_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX1pfDm2nc8R6W
 nXaK5kxqk+CEcP/OUsHSv/e44UVmFwXzH+zqDbYkwTZwxvltzflX7Zdh7RQiGw9pEJf1m94tSzG
 MaqOOxfiCGFQkAd/AbTUlH5BnptaMP9VyDRe0rDqPuScHufX/rksrnsFa+O2T9EIpVcgbx2JnCz
 qybKR7JXSFA+gkoY2i06xjwyE6VwTlHM41HlbRD6dnuWoPdNQEws1nqg4qrraSks3v+jGVLM9Rw
 hIolH4M8TwZzeaRMkpdoAH/KjeD2pgzYDfEHYYIEIKsyyK8qpwVBjNGUJakf8erHMKiNUDxPdJd
 Ph5sLReW7p24gV2AuNhNLgrPVdX/iVRLtfWxJm05wu3P7ZTu3+rjlZc/Lrlv1l5ela6ERRi9CBT
 LO/rl5v233qv9saIHpuUxyf9mMnuBx08CLUalydxz9zns7cbxuu1WAVhx/BRB7rT9vKrw13GPlf
 Xhft5XubETk0w2VzuTQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96f350 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_uS-18hJZPm8K8KRSTQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139

On Thu, Aug 27, 2026 at 7:51=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:
>
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
>
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
>
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>   (added in v4), so like the other Qualcomm GCC drivers it must select
>   QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>   (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() retur=
ns
>   -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-=
dd34f235fc1a@oss.qualcomm.com/
>

Patch 2 and 3 applied for next, thanks!

[...]

Kind regards
Uffe
