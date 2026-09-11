Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1EF3EC810
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115635; cv=none; b=ED6WdyxGuaBLKgm6TjcGToAZkydCOrR+KHn0HxlKV6u14cEZXqTY39QWGuqQxBTwh+yq+j/Q6JBU+Z5RmijhIhISEJchbwZZzjfh4B7GQYWknPWk6Yyl9dS9iEDjQfjU1j7CoWyTn5VIED929rWubqPfrijZEQF3J9Tie4RsRI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115635; c=relaxed/simple;
	bh=HGKhaoZaWNhzHqAOBnUZoKE7Fx3fCqI+Ye/JrK/9WtY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=ghPfPr1LIfvO2T4ZGZ7H/om22PJWCUxiMKDLS1zfUbYcUc4ZUkeupo7Gu2VH0ACN3mZJGjMYb7UpEapBAU+en207RhyqWO40JB4pMIXZwlrDBGGLFeYVeZIT1Cx6EQAl5rVtg9tCbFWJ7nzIJ01shrC+3K1JYE7mJTQVhNgj9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHe9Nkzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRNMgukr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHe9Nkzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRNMgukr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kp7h2311438
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:subject:to; s=qcppdkim1; bh=H9L3Cj/P6SD
	A1IrJ+9yQeaGiza1a6AR+tRIbA3GQ42k=; b=JHe9NkzmJKeU0fLCLlcxsnBFRdO
	xl0ooUJaEKGmTDsyzp7s4Fq7XjuVpgki1Z97wonE/5CHgd9WH9ozgr8k82puhCdg
	8V2SjYOzOaVa0Vu7DpZ98l+o+F1+IP3yX1FpWTIz6/l085zPIuDwny4ve1MPw4MQ
	yY4fJi2u0Cyy1iPY8JrRVwwdhiTqOMBN6y09WCMAyzdUD/7kKk4LE0lgvX7uWjTS
	0BlMKItF0/wz08mWP9+MmwfdRXSpUMMOSAQovCZaaTjE1xfDz0bH270QVAWkpX+O
	314IeLHZEfDi4L0H+9f1qP9+DQZ5cTrNsAyn/b7KD3a2KZE7pcaR38zqNMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchgr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:33:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so124614285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789115632; x=1789720432; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9L3Cj/P6SDA1IrJ+9yQeaGiza1a6AR+tRIbA3GQ42k=;
        b=dRNMgukrDT+XxW23dBmLNf0/X4mFik4rnaCIuDuoz1b+mJlezCq8o3ehIw63vGBtwT
         LrmObz7FP3eVBH1E2Xve2A2xAStlHZDoMeJepy+BApwhBOpzqpu8gnTI/c196So+fo7w
         gMFwFOLRClgD5qxKBQHQEQMrVaMceKT5SkAmiDOTvTHRYqb4qP9xsAxikq5wEF17lYUD
         0CpvQGWUyYiXMb+acqwmkPIlj1QjR1JRT9vZ9zfrcoWkGApQuW9RjNZuEPt+1xn9bFPT
         HlQ3Kf9HfHCI78Uwdrbel1rN+otzNv/QwwVpwRZP/rqUfTLfcOEQZEu4TeBmtJ2/7k79
         gG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115632; x=1789720432;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9L3Cj/P6SDA1IrJ+9yQeaGiza1a6AR+tRIbA3GQ42k=;
        b=sFurDNc+dTzX2ge/mR/rbMBv7q3i45Goby9XI5LQGhlx3OEK9FcB+Tg2UrTP6Zv44C
         YSwoDowIJcc+LLpFHkLXBduKfrLDiFHQ+PhZn57uoRdkZK5EtMvtSCsmw9GfXj9CuEsN
         AQzI2Dl8Q6I3fOexU7h9T5b7Mowd948UcXbzpG8o9ukR879Am0Hnhlhi3ADDviMvmDgm
         Mi8IGLUaoEbfLI+yfvHK5cEiycL6uNVQD9w+dKkK9kgOA2++rbBJQnIgY1tniJwoY/EZ
         44iyWyedD/BUqjc+RZCkiYrEA/Xvxq84w8KZKAq8btCz3WCmB9wRTv0zkyyOVXOx/RRb
         2ytw==
X-Forwarded-Encrypted: i=1; AKwUvBz6SDHXF8wmAoOwI3MOkDh2/D39aM7tlTHyHdKCN+hEEY7Ks9bqeHhZI3SO7Ocya4k6UKniaTExe4JMgo0=@vger.kernel.org
X-Gm-Message-State: AFuF++mZxZAbfCv92D6/PMvx4BVMVt6INV9AfBhylMJgLfoidE9A3HE+
	9I4QYNz8Pd3VCpr6Ne7M4SGdEt5jHxKFLCumYrIAlR7wblATrHEoy5bv5yrWinVBZn7RQQ9FBE8
	MoVuuqeD/xab10WMgKIzOFUKD/NaJqjeFzMT775vYFn6LwZaGAGbOB60/CLhy6bm5m/8=
X-Gm-Gg: AYBFou24vsX0j1dE/mw35Iejk+MwSDVr3gGYoOGEoT9fW9wXIq5I8TpQU6Ahse/cD3L
	7qG29uUVYLeKxDgaXCxhsFSFBPiT445zDIQBDKh8qzWZGbBtXQZWexZ1mbz9UWEw2YYER1oatj3
	X26jaKXOZ+JjEE0fK2H73HXz2jGXjw92/VSNfsXqwf4VTAnbbiIpRblBFdS5h0ewfvqO2KDlnCu
	UOWj6cedNX2DTsa/nHOFRQAWfP/fB9Rv3dDNEDA+ZG/hBkyeVJixuU3bSFhOTDeb26IFxvqX500
	BrINXVGqTgRjPXpTGVINEyrz8QydaM8wYhVOCdOaUPXnTxEpGYuxTllxDwr2/xTyU3gm1XemxJT
	yXqoWzy2Xho+BQtkByPUgHSiH2JNahOCZqaFSb+npiwE+ER3oPZ2MrH/oxU4IPd3auw/Q4az9EQ
	==
X-Received: by 2002:a05:620a:4150:b0:936:af9f:4c30 with SMTP id af79cd13be357-939ea16abecmr350861685a.25.1789115632051;
        Fri, 11 Sep 2026 01:33:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:936:af9f:4c30 with SMTP id af79cd13be357-939ea16abecmr350859885a.25.1789115631561;
        Fri, 11 Sep 2026 01:33:51 -0700 (PDT)
Received: from [192.168.16.154] (host86-149-41-185.range86-149.btcentralplus.com. [86.149.41.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4560214f8f.23.2026.09.11.01.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:33:50 -0700 (PDT)
Message-ID: <0b06e405f03ff521efc55ef1964726c8d8a11476.camel@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] Register MPM under CPU cluster power domain to
 manage RPM notification
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: sneh.mankad@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        maz@kernel.org, robh@kernel.org, shawn.guo@linaro.org, tglx@kernel.org,
        Dmitry Baryshkov
	 <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:33:49 +0100
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3bcf1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=1ZqYAqmp+mGnO5v9BrvPnw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hY6swonQLBBWNHD_PR8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExOSBTYWx0ZWRfX6S/5WnRB5sSb
 oRSSMm0G5bOSlYdZXzeFEidjBlB5HLQ4yAn8NNS+R7pK3Ty9rSnG9OqJoZHpOuuP5DDM052b8AI
 kdgWTrTvEYbb7dAQuus7BY3QTD6KKmMSs9EXMhT4YCcA6y5PNi439qvn6jduiGNC4RcxjbfhOBb
 sMKAoyD2fjcKjPrmSbGKNehkmBp/0AtijzPQUXLfQq9a5J9vnZO9wWpLKfqB2FMn45wCMwqxlKW
 uXonrdvVlniXINkaJRNrjNnZXRqDMixyikEr6t5BRI9etmbkyB0GgK05DLUGqYb0ROm5aVk15T1
 flXtceBDp1WoW2VszcqdzkCKTUsL8ifOxQK0xhnu5bg6oBCcJc3lPnPB568BHcEFEqAjg4D9ieL
 IE2ShFqMvoAynP0650QRyWfVsLNAa+E50JrLa0qh9XOmFXJSoioIfkctgGkWc6n3o9pxdneghIa
 bcmUccHYIjW9hbjQbSw==
X-Proofpoint-GUID: 4hU2FsiQYLPE8Gi8vq2N46l-Foqx5v8L
X-Proofpoint-ORIG-GUID: 4hU2FsiQYLPE8Gi8vq2N46l-Foqx5v8L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExOSBTYWx0ZWRfX9Ii6VWHWHa96
 SpmsL62/E+iDoHuBTzjm62Aosk6ftZzt+iKapbmjHOaZ4uHBSVuY4b7e9YZ+HZ0IfagVQNSkP7W
 dl/GVShPLY8B9eTuLvti9p0L8FCtk5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110119

Hi Sneh,


> MPM irqchip needs to notify RPM (Resource Power Manager) processor to rea=
d
> the latest wake up capable interrupts when the CPU cluster is entering th=
e
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.
>=20
> Such implementation introduces a hard probe dependency between MPM irqchi=
p
> and CPU cluster power domains. That is MPM irqchip needs to finish probe
> before PSCI power domains are probed. MPM irqchip can be build as module
> and can get later inserted where as PSCI power domains is not a module.
>=20
> For in-built driver cases too PSCI domain gets probed first and later MPM
> irqchip leading to failure of CPUidle states.

..snip..


> commit af5376a77e87 ("cpuidle: psci: Transition to the faux device
> interface") transitioned cpuidle-psci to a faux device interface.
>=20
> faux_device_create() calls faux_device_create_with_groups(), which ignore=
s
> the probe return value, and destroys the device if dev->driver is not set=
.

This is no longer true, see Commit 0606f2114e2d ("cpuidle: psci: Fix
support for probe deferral by dropping the faux device").


..snip..


> Currently only 2 SoCs follow this method - Agatti and sm6375. Agatti has
> CPU cluster power domain disabled, which is why idle-states are allowed t=
o
> function there.

Please don't forget about the devices which use the SoC: For Agatti, the
RB1 (qrb2210-rb1) and Arduino UnoQ (qrb2210-arduino-imola) are both
setup
with different power domains (off-topic: I believe this is something
which can be reworked soon as the mpm driver could be in a better place
than before? Didn't check.).


> Move the RPM notification handling to the GENPD_NOTIFY_PRE_OFF callback a=
nd
> register MPM under the CPU cluster power domain.  Use runtime PM to repor=
t
> the default RPM_SUSPENDED state to genPD so that the CPU cluster power
> domain can enter low power mode.
>=20
> This will remove the dependency on probe ordering and allow individual CP=
U
> idle states, CPU cluster idle states and RPM notification to function
> properly.
>=20
> Also enable CPU and CPU cluster LPMs for Shikra.
>=20
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
> Sneh Mankad (7):
>       dt-bindings: interrupt-controller: mpm: Document power-domains prop=
erty
>       irqchip/irq-qcom-mpm: Register MPM under CPU cluster power domain
>       irqchip/irq-qcom-mpm: Prepare common access path for timer and pin =
regs
>       irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to=
 LPM
>       arm64: dts: qcom: sm6375: Make MPM device as part of CPU cluster do=
main
>       arm64: dts: qcom: agatti: Do not mark MPM as power domain
>       arm64: dts: qcom: shikra: Add CPU idle states



I also noticed that patches 2 and 6 are a matched pair but sit four
patches apart. Every commit in between leaves Agatti device with no
working CPU idle and e.g. a bisect can land inside that window. Can you
move the DTS changes first?


Cheers!

Chris
