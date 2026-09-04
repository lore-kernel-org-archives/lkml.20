Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B8B3C4575
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506262; cv=pass; b=ObHquSVIGO/hjopIQc0oOJvbpVwCOUFoWWykih7R8rIt7s0OXcb9VCdrYN4PDjpkcazndSuGZOAPh9Hx7hsACWXcrKrA1xLZq/9PWmY5n1WKzi/0XAT/jHMBsf3wmd5TciNTDE8GkbblR3xu0Od3PLg2U65eUOpaoupjOkh+6sM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506262; c=relaxed/simple;
	bh=J8dsPnAWdboF1yFvJDLhBeE5gRfGXjP3682VM1Iqx2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoMTY1dWYVH+2gWRmfkPljKw0PmtekNcXn6Jh1JkeLknk5WS1cdWRsbgWtdvk5BGfR8i1fSjKCko9C0ITCcbUKx7Zy/cb4ijtohLY5U8E9eNyMMuvmxl3iVErbUohRmhbGnMMa3oPIcyk6jJXdln2aREd0z+1s4JwfiU0smLNDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OI8FT8Wh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBU6TwfX; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OI8FT8Wh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBU6TwfX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684638lL2125698
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 07:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=; b=OI8FT8WhAfwVk+ZZ
	8T5wxyqpe708tolnXc/VTkesfR67qqX1vGQ9RxJyEyTCl2T5XFfW8RIeogaCL5Zt
	4E/omkikXWrxxm+RLQRXjGY0OlJQ2lKWJX0g7LtAZgVjohNaB92hYZsfdUHcte/P
	SBndiqT6076Ry6JMFdRQyA+2Yf7A2Xx9N0ugFAnnXxcUTJ91+wZlVx8as/ZggFZl
	TmagoMORfsZZj+pAc6bU0p25PSM7HrrM0tq/Hyx/iBXiNcsc5oY0K9+La/nYnu39
	XHaTGr8kOkiuMF9F3RftxWTB2ENwvtQAqCyEA0/kgNGd5Ouwb+M10AzzU4CyC56j
	k3HbZQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fgp3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:17:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso973495a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788506259; cv=none;
        d=google.com; s=arc-20260327;
        b=S+X13UwfU9DiHUJ+EvpVgu6bbqeVMeJ6IyOw8bHYbKldluJ91oWSFAVivFuzCKM5kx
         VHTmayMqKxWSs2wV0Hzah40c+F9+MyYhW9SGeS7v6OkHC2txuI+x9NL+KHMcyzLF6IKj
         TLlb95dVyYck0KA+BGMUUajI5a9Xw8S0RAmYqKpABP+KBjjNrZTX6AmTIrW7l58BSd6I
         KLzbjQKiP9argfneLaCAulV9OAW5jKi7fdgDKIKi7JB/GN/dE+ywekWzvDwsgmk0jH1+
         N81KwCXWWDpn4bfZHhInGOKGNS4s6TqrF4El6CS68PTPYqvbD3Q1ZhW7ZRgK0OjsKkwz
         An5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        fh=8dU2rCNDCmDxN3xvrypnd+MgQxW8MPNhYohxW09O1y4=;
        b=FKa1uGIQRVr6m3QIMdWFGT56V3Pz3WRjgoLfg6+MhPpLxmh6mWyFf4fS+W7w4soxc4
         ynkS8bBP0q4AEdID3LZFw6GZDjKcs/y9X++oek5WeucjjHq2z4gclouSsHGMX/SfGEwt
         rVTe4WUKTu4gVQdBLsvs1AL1RkwA/EqYYlCyahCWHLodu6G1oGKR+NbPFLyepyxmmPJC
         bn7Ek7+aW3y6aHV2teqpoxv3jJso+Db4KisDypqb7G1Ye0Kz2hP30ZQzr9YmHzkZqcAs
         IiE5dJZO4FputBy/JJOdmgMZxg7aDGMNxPDwrGrT1BPkDblhORcNcQNVbB9IdDUtsuZE
         9CZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788506259; x=1789111059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=RBU6TwfXHXEf0ViP1/vW8nLVlhvd5ncNWxGvYvaloSHaaUQ86p7AbM/HkFV/cIe/Zp
         5CdCAc3IfDHvXFvj/T21hFdpkDDCjUIdL7nQXguS19kokTgxZuSdKKvHZTb4fAMPGRab
         4fRF9COHX8Q0l2UY2N52d4YJGPbJ42csIOFT0mKCFDMGD4pfX6m+3vuQJT2tzZCZiv4j
         /Av5uJgUmvJ5fppY4W12hTJYkYovF5tmOY6MmG+LWDO320zwJqOOP3vtZVNZ40Eu5S0b
         NYCiibzxZGT/2l7QxyTus6R//8GqL7/8K/NAEcp9vcNi8bMbdo4gcAs/1XXpdHkKUDEb
         GcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788506259; x=1789111059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=sqZjfS6yvQowuYwLju3wcWK7PeYPZ9121zvhq7nIeoSbe5ZxQvnGNG8IBTd8oXYwmV
         ZmoOx5Rr2LYRfq4H+PafMTLknMObwCNPXv2Q/w1FlvnGrnTGq20uAyy7SoxA/Yp/7Tai
         zEc8U2Mahg5M2BPr99gqRd7sAXQDJpT3jplO0L34BU3jRT14w4vZsvU0aExMxCznGXpX
         pOaeG1YSequ0sixyKdlrhnjuL6WtOQrGhP10O3USK0RTtyibnrp8JijCXdpeNgCPfrbc
         o8HnhFXyuEbNMmUkEoFCEC03PQ+LN9IK+itxS1O+X/IkVaFEq1lWb0Fp1D3mbg1ZRLo3
         444g==
X-Forwarded-Encrypted: i=1; AKwUvBxOCVx2c25bZbdK7xATsg7qUxLGXJLp9fpqLfAPHUm6VzionU6jVPZFmWKj/pIrh/+R6rP20ueEdGzHmkw=@vger.kernel.org
X-Gm-Message-State: AFuF++mQayN6jMd5brIprI0BhkTCa8YvRg+PiuEQZAnbYhmDWYoIMGIi
	RLGpA1g9mtUPaWnG3CGXq2TFKyoK3p96vmI248l4poew37rPOTC0cmpm1zATX3vonAADzTNF/9A
	UOmh3bPUO8qj44x21Y5MDtP5AOBsG9H4MhWnMuHbEJRvFjxCE6eW101ughr2n9EQWwmG36Q6u0S
	g+PI/YZPsohaNoBngiPnY0RzwK3cgU5HFV3FPxSTGlVQ==
X-Gm-Gg: AYBFou2Lfqno5wnEyRKAMdtyoRPThhVlvw8VcWb6rGTz6zInb4I1Z0KugJ53V1/xssf
	TBx/PBOqsxpXe6K5tf/r7QhmZzLa+YPteDUKisUWHNIatkvXJGlhg77Gr5nA2tq1DFbgSUaPYmS
	R7Ti9zuqrqyhYl1nZ3zFEseB2S18AET8hUgXt/Qn0GklpARGYh5g0y5LPMMQ==
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr5927942637.0.1788506258741;
        Fri, 04 Sep 2026 00:17:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id
 adf61e73a8af0-3da39878551mr5927876637.0.1788506258295; Fri, 04 Sep 2026
 00:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
In-Reply-To: <20260903160401.GV2133376@google.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:17:25 +0200
X-Gm-Features: AcwNN1XLgC_UnHcC1VgAAx4Zjez2ZZ2qUdiBHVeX_BYEXGU9Ghy4hb4yt4Luazs
Message-ID: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI resets
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a7093 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=RfyTg-q-OfOJAL476ygA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: F8oBKfYnN-omyp3NVUspg_KT6qLXzUT2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfX0LLK+7hq9dag
 Yn5dPqnAgOYvtDOCjci3os4pbxCbXVNYYKVhdFT9oB4ESmxYgBX8rWYGKuRww7ofFhB/Fo4dsnH
 laLNkQejvLZFn6+38RjttRMOt1k15GE=
X-Proofpoint-GUID: F8oBKfYnN-omyp3NVUspg_KT6qLXzUT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfXwrTKkyYmEbYA
 5hCwqHaiEFVCPyoVAG9xXNb/uc1OodVi1jNJFSDvr5MxulGfiJSNkBY8OEGeSlPdJyQSgYTAh86
 WMoUiKmGghyulivRYgfdWzAH6off6ILegUfBUraSJ0IHsfZjlnCaWZ+rQawMsS423KnjM6xhRPp
 w10TBlkqfbfClA/HS5En7CGv2ZRq6VRDLpkUMro5IINOcAylY6vDbdDY5y32rx3vEx2H7sp+rja
 TSuQEUuFOs1aUutNhctHpwbBo4mP/6ZqL1eqLcOHUwSJ0cpq5MaYKnr/HIzknSKyjnWbxHl8C+M
 06sINay0+ehJwBHJPU+nW/uau6/At1BmPRNY3thJuBh2x0V7AKfVxfaeoYND8jSTamwGmQn17un
 2eITUcgay+fl2oSmeINbQIUIunREeBn6VO70wlBVwXEWM0PjwUTqPOCkOrJaj8BxfcgZUmZjTN6
 2vUwZiC/LlV2201yJ/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040066

On Thu, Sep 3, 2026 at 6:04=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
> > Userspace should be able to initiate device reboots using the various
> > PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> > patch series introduces psci-reboot-mode driver that will induce
> > command-based resets to psci driver for executing the device reset.
>
> The more I read through this submission, the more convinced I get that
> it does not belong in MFD.  This is a potentially nice "architectural
> workaround" if it a) didn't break some of MFD's fundamental "real
> devices only" rules, of which cpuidle and reboot-mode certainly are not
> and b) didn't require a massive expansion of what the MFD core is
> designed to do.  I am more that a little uncomfortable with the 150
> lines being added to MFD core support this workaround.
>
> My best suggestion so far would be to base these changes inside
> drivers/firmware/psci and use the aux bus to communicate with the
> various components.

We had some off list discussions about this as well and it seems like
we are in agreement. What you are suggesting makes perfect sense to
me.

Kind regards
Uffe
