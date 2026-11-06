Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793931855;
	b=LfvaAFSORVEKwRHnzS776SSFdtrHNcny1+PZYhiO5tFb4u/GTqI/SPlF2FXja6Uj/T+L
	 KbCnaudesY9h//6bW8KniM9gCY4SwdujK+5WAskwzq/WugexcImEsdAZeISPRh511UR2C
	 plRw9I5n/K/78B41m3aPYCkwEBPFny2JFrhzpCSTPyWEfv94lJUrKni3Z4byEka13y2w5
	 HNgVeDtdfAJUT6cwqX0LA3oH1fjL4FMM2iIBVfopQYK0DpGVfQ4gLthi+LvJu9hVzTcp0
	 BfWxonjF/rhFSLZVQYss+Uu86qj9gnb4eepUkk8VPZHMWk67iUPGJbz13gsx8uy9iZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=;
	b=j1jc+qNB6MzM1u4L/JQ6j7aNX8ab9lUPK+OaRsbHHF+jBuwYz6zShzOgcvyg0FD6lfeY
	 QX9YaMUpgXyP61baz8ghmEER91Fq3FWZK+Sw/hUGxgAvr58qb8seM8GrgHMNQe+ZskiHV
	 QjQXGL79knE+NZAj8UwkzjAE5z3zASOQriZCAEsAM5+se88mDHSrJJ/S3H4wCHLsFsUE1
	 o/ljkRNosA/KPUkji3M2kEZISO2HhqjjNgsGCTggTib0jfZk10z4USSaEbbqvEsmrKLM3
	 TVu76Sfo0xo7CZZUo2DieL9el8104B94e9cqaQLAQb17ekHcwG82BaiX8PoPM8+sNCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YTHsjCBr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LY11YBYC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D262D606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D262D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YTHsjCBr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LY11YBYC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NetY02880989
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 02:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=; b=YTHsjCBrSkDAcgcz
	EA2Jc5n25P1pHJr7+FSsz6LnY1GHZChUM6w2OtsA9L9MfpNBl0FvmxzSn0LwHDyC
	9D7b9+2IYUQKzj31PnBpFAdSd1LOaZeyBjlmtHw36CnDpyUVDY1Ein/UQD6l6okn
	9scx2PwUm5n3FofiGdPhTBBDpGCQRZiAt4mt8oiPNLj3kemen9w4gMzitZ8OLWgT
	DZlzmCq9ioddFakz7nigf5kScGHe9R3cjYbu3XFMEOGVgDOtZTRfXXKNmEATZ9Od
	zu+zH1xy9kUe1f/c4b5oNPumIc4dpML4PfzgSuXsFsiqzTzFdsAbsgFIt3Zg8one
	T2OmGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pargku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:24:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so296826a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793931853; cv=none;
        d=google.com; s=arc-20260327;
        b=Yc4OnBeY5QAzRS10Ahc4E1JB641+tmJieGD+tbD3/t+xrlh/HKlI8XGxUwbts77siC
         5iPnAxZpIx/Hrbdjm/+hp9sEwRRznfMhZI0OM8XHuimFR/K3Jrt6qt/m4PJ49lUdn9Hl
         Y1YWJGHwcULwUBdOYVqGN3fO3Ro0R9xEb28koJ24kI0pDJVjzbtIb1KaL4o+/8YrC8ZD
         2WeZfF49C9Ve/AW1O1kTNviswyADQndUClEYIujRtU4i2A+EGfDPQFM4GYyQZfN+C4F8
         QOdVIL//abQgEpnUhjeUf4PEz5uS2sZPnSkMDit/HVNSFjit2XEXzLrlPAjrlFEWC0Z8
         RVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=;
        fh=xW744MPFiqH/0GRwMB367rnxcHdOQJd3W8scwbnVKA8=;
        b=rLxE37p4FXUL2A4vjGj1h/UpFDxEIyUpypftFZb0MMxBCWPDxNauhg6Sb+7X/upYDb
         thmUL5taVji76zv41fvWJ9e0ZIO99ntMhZ4NcMSNDxiq2nuOcEoxnjLVx7WCS5EsU6V3
         Ya/UFRK2wjiVMIh/0Y/7pV1ecR+rj6kmG4GNQem9k/xFgv7K/6VJkuC2+RdaUl5w1of6
         KSjSjqP1dJJfVIHY9x/vCRwN5H2e2nk68aCVtPa2Zittz92YEsx3GSqEGlTgcyG8/rX/
         6a9/bs7MGbOO2GBVO9A7VDJ304QNDf5oPvnBnXdNcEp/lCf6x6wZ6gngx/lV2bRvXf7V
         T90g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793931853; x=1794536653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=;
        b=LY11YBYCeWWof1YFWAWAzfGu+sKDz+EoowTfBNUiGpU2YsdcEom9EPD279Dbyvqkfb
         JD9Qq+f8dgUeSIAkqPWkuCpHeFxA72pOMfrkHrQly3o3LiPge26ao2tWa5+4WBFyZz8J
         CUo+BSF2EfABPozK/IWqWtGf7CUKO+PkGYnrh9hPoM1LJiH/CgCOtRW9OakPGTsyR4WJ
         jTk9wWQ3wp2kFA48sNm3Vz+gwepvaihLkE6f214tDoqWfQnDmGlcKWG+9rHcZZAyZZ1/
         4NtbtZT2qUFo5GNd6JaHUWvjLkxxT3Vcgq+uuAk8j2XUw0sFCZKqrGjXSoMP8hLlQqfM
         A1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931853; x=1794536653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=;
        b=RIWjUcEc6DMpPTr0PFPiYUzQs8scwKxkvQGszeLwsTpiPVqBZPSbwDMpR2p+T1A+qC
         HGMSbNieRv13pL4Kzb1UImV9i7EMydNFt25Gfts1elagYrLpw04jMqk/CwabBhmdc/dF
         Sn5lUHpOW6PYymLRNuDGgTZ0eV8e2LJix1gIXuNB+iwF2I5gtoqIIqIIaKYVbx62VKi0
         jqJUy2ih9771mvkWxBefgTSGuXIMD/lNIVxv4380w4tWb6Aqi1XcY8ZSRq+ZWpOfnB/h
         BQIZ5c6xWCBcxHEbwBtH52wy32kX/XIVwbeccf5jN1KlGCAd7YDkNtYKdYkEfovNcKu7
         K5Dw==
X-Forwarded-Encrypted: i=1; AL+hErG45zfkf5mRpMWs6TiXCkOoEF6/2Qr6osCPMSwI+X1Fl8A1SkixR2S9OM3kU8tal1iBRinQji268D1G5KI=@vger.kernel.org
X-Gm-Message-State: APuU4Z++j5EEKj5J6o8OF/Du5f9oobeMbm6QyYqlvJVk0OpvcU13u8eu
	kNxuYNu4ZAqya/mBbI0U+4ggHHOF1LtuHvpNARu6ysbGohDu2r68aQ8BE9jkFzHK9tdKFZv1uwY
	q5rEm6LEa+MH25YWKO3KQ6woJhuspL/2g1crQrNLwQvPna4TaTbSlZJGFDDtUWKaQDVr/xsDDNx
	vuZzRx24Vwuu3LCWJBYtRjtXQuNeEt62Fy+2uhcfWQyQ==
X-Gm-Gg: AYBFou3JpZwWNysa+N8uuhq6vRC132jAt+YKXvprzMN2QmWH8nRXvHRHQUWhye2pAar
	wsxPAZD98UFNLch4qdk+rUXqKYJsWrGSWQBXS7mviuRsxWjJfjh/ONU1Fz8vr02e6Hfrwap2e40
	SY7hECpuYf5lNd4NYb/DywRCZNWVNrDdhYzjU7u4zG9YLTj3G1BU77aXLz6A==
X-Received: by 2002:a17:90b:5410:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3b0db6e7fa8mr1028649a91.35.1793931852749;
        Thu, 05 Nov 2026 18:24:12 -0800 (PST)
X-Received: by 2002:a17:90b:5410:b0:3ab:5832:727d with SMTP id
 98e67ed59e1d1-3b0db6e7fa8mr1028623a91.35.1793931852347; Thu, 05 Nov 2026
 18:24:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105101521.434361-1-zhangfei.gao@oss.qualcomm.com> <auyUXp1Fgk2yC7fZ@debian>
In-Reply-To: <auyUXp1Fgk2yC7fZ@debian>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:24:00 +0800
X-Gm-Features: AclHuK9Rpj-OrZYtfA6ZG0BJAkiaIq_2tj00BWz8R6NqylmkPXjbVoBwgnAlwNc
Message-ID: <CAFkd8hu2aLp_MGbT3Lt0wv96sUQ705fBsaa_sn3P1_XUuruKYw@mail.gmail.com>
Subject: Re: [PATCH] PCI: qcom: Power on pwrctrl devices for firmware-managed hosts
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, bhelgaas@google.com, krishna.chundru@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, deepti.jaggi@oss.qualcomm.com,
        yadu.mg@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAwOSBTYWx0ZWRfX83x4YPad7+z9
 7jfH6dt+tPD6mKQMuQ0NjoPYV7vebD0EhegfNc3mqqpQomO4ncyVaHsOCwdla0tQJkiSX4VJeXw
 DHKnPVFDeCI8K4DRwNPjf+ZARfxXUXU0saE95d79C3NPLghn6T/YX9eq9lOvO+V5tU7g7HV3q/W
 WVOiI/UPO26g1Yjc73WM+0wPi/+okQf7iMkXJEpumVIM6KICSV/xorxfGi5l8G0HP5MSnC+LTuy
 6KbyihfGpYOasdqQ3oau1H7t8McOLIdOHGL+NV3T44KpS4bYPfkGxpNmKAwk4bjZMipnf2PuZW+
 Rlglife4i6+W/x+qQcpyC/Oe9LONX3uL2h72JSvmEA1JZ9d7ne95H5xP58rE9xu/Tl0qGB4ZDAy
 dD4oBARilPH4NfxFmkeyYTKIrCAQp1GowTA7CagnMvhhrh/5dqGeCwheqYqFOeYc//VjOmb9dPo
 H9fMtsbioPeGzyTc2OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAwOSBTYWx0ZWRfXwMYDPNpd5TpT
 S4tZl58eb/bMMmD0RScqMyQHpg58NFJbnwK5H4+h10RtqcvhFX/fD6zx5a+kS8Ei7xaLSa9F3fa
 vK8gvZloLFTKUiRbRTnPjSfV0uwZuZw=
X-Proofpoint-GUID: MSzIOBoX1DnEn0SLuCNwF_nhmdvsJGr6
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed3a4d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=zdetyYl-RAO8K0uE0e8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: MSzIOBoX1DnEn0SLuCNwF_nhmdvsJGr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060009

On Thu, Nov 5, 2026 at 10:37=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Thu, Nov 05, 2026 at 06:15:21PM +0800, Zhangfei Gao wrote:
> > commit b921aa3f8dec ("PCI/pwrctrl: Switch to pwrctrl create, power
> > on/off, destroy APIs") switched PCI pwrctrl users to explicit create an=
d
> > power control APIs, but only added the calls to the regular DesignWare
> > host initialization path.
> >
> > Firmware-managed hosts bypass that path and probe the ECAM host bridge
> > directly. Endpoints already powered by firmware, such as NVMe devices,
> > remain discoverable. Endpoints that rely on Linux pwrctrl and pwrseq,
> > such as WCN7850, remain powered off and cannot be discovered.
> >
>
> NACK. For FW initialized platforms, FW should power on the Endpoints befo=
re
> booting Linux.

Thanks Mani for the clarification.

  To confirm, for a firmware-initialized PCIe host, is the platform
  firmware expected to perform the complete board-level Endpoint power
  sequence as well, rather than only initializing the PCIe controller?

  On this platform, WCN7850 requires PMAU0102-E GPIOs 6/7/8 to enable its
  power rails and GPIO10 for WLAN_EN. Should firmware assert these GPIOs
  before Linux probes the ECAM host bridge and keep the Endpoint powered,
  including across suspend/resume as appropriate?

  If so, we will drop this driver change and coordinate the required
  platform firmware update.

Thanks
