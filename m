Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793013949;
	b=sf78uiqxpcdipg0QR9y7iYI9Xaz+2Ir3yEXwl4shECUC5PiVN2P5qbhK9cV9ERZFw0Ac
	 LjbNu0QZr6hEXeHxlbqfYHz+sXsHu2xkyBePulCv3ncB4dbeRlF/qHpek1ktoA/571Liu
	 yTtxgma+WVN407UeddOMTujUaWCfDemU+Sj7cE4FA7E0HwgHDBIlUysqlPf1NAGVh3W8I
	 ymWO9Ia8H1PFTBxujxiTla6PYqyGrhphbBr7jSL70kd2jJ+kpvCWXfDg0+w9KV1z+DkaG
	 3ch2xPnQoXWx6mK+NcxYLMBll8xKiZ22N9q013txB3UQqgXm+OWFdB/IJlnjv1wncwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
	b=Sfn182CnMHWxDDBJCwgha9/whEI9SE6dHbOsY5cD97mRECFzacBpo+m/hVxyAjd+o03t
	 e9UurOeMWgPu/Fa0zGPGH//C8bJfOYg2unx5t+cPLhQv8/fR+OIo5au+zcc3kRVtDrlKe
	 BjQl60C5v88Fpz0xGlJw7WtHtHizs/NahNoOHWZlsA4ooflL5HZL5+Fc0kTAmaFxeFmL5
	 P2vRpwX2BQI8VV1d+5ZJFxyx5CKJgdjfclw1jLbJYntbHtOfdhEu4WQ1LRK3LyIfSpcly
	 fBVG9hiaYxnIfUBPhGxDM13Lmhwl5sZfV2TbY+p4D9zrp/NLp8wjLFmkUZFO3etSXEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnEBl84P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOUsYe6B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365F1606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 365F1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnEBl84P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOUsYe6B
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1CC2732889
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=; b=dnEBl84PS75rsH+m
	t8WJ81u2wB65Nq2f6dOZLiSzrRzUKj9Pyzz3f2MND7GXZofF94QSfPq6MViMHQBq
	bSksoKo1Y38NbJHZz1v6vnCKdVCH70IYmaV0Umc8+BS+KcjIdEcJfBQ+4MEMozog
	o+2Ym5XwBrdsZDjk/RqWosjsWX5+LEAvltQ8WhhU5dARfQE23oIebl5uYuWOWQTA
	em6gk0bD2HUH9s1AEODOEAXwpQeH600P0hHKdXLJEuXnKFdhGr3hHruBA9KPExlr
	TdUGU4BwIYnoJZYFsYqTPOXVafySOKY3NF+LOeofxcYziPiLyE4e4WNY0W/SMTdy
	RXQfVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8d5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so368387385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793013946; cv=none;
        d=google.com; s=arc-20260327;
        b=ZfT3FSlj5z+zkT/hTRs2UgbL4Q/WQzbas4BaMfUMDWir7fDW9SnVMiU8XjdSPfdxoR
         HvRpbA5YZlLcZQM7ocnRJz3r39z+52G39vLYWBT80fLukiQ44dRrmW0WIo1wpXJCuhno
         BOlBIHJ4rb4oPwX7FWuQETfJ5psULCxA1g8e5dIL3NgolSX5V9et1zh1jS/rrh/minH2
         NL9TrW4n+3zWqV2YSoYsZz4RTUEOENdNPtZKoDaetAw6wf+azrH/Uf1cJuUd1VM8/Hfs
         BpxoJCtpw1WxSIbV17PwzWnf4hszHlC3UiPqXXDxVWm1t1L+UKFAdbH6jix6zyrgMJFv
         gEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        fh=TDT69AFnJcAVtJZvnsOisiIqgj7wlsHmHme5hvxBUCE=;
        b=eaq0G9GE8oQsnGs6C3Xmt0p3hIAHK7kp1WzzUV2zHPxKxyZVRjPxbXi4l2B5jBnRAu
         x4C3RSG2L38GSYcAYaGN2Ff7M3VWjF4OvhAnHyNxaLwPTnhAoMjt53TnANjkMkIudEI9
         +3GJB62/3XvFaaWXlSBBE2e34H+f9v+F26KVgi8xADXdMJAGB+cF53Fc5beW9bCw0pNM
         h+i7DDehzb3mKxVWcR7GmWDsJcwJwOkKBmAopZm7fYJ6PAxb4Pp0613KdCcdJ77Yo90z
         aI5Nh3TbsNBaGpGbfXtZcsRQmlEpKhkv2fkafjA8BYsEluq48a5eEL/zXHng/XhXcpWY
         ELHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013946; x=1793618746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        b=AOUsYe6B+tr9jcb3Y3bSQ5SEIWG76vCozA59tpwZxg092fJzIqAxkcCUSVlDqSYdCO
         3Le7sTlWyrekQILLlyBHm293aJJPUOsYXa5GN68/u3NMlHiz72LGybgN0HCXolEyTGyc
         p7d4AoArT92bflVqszORm8S9ZRun6tLHK6068JH77owtZRnU+/OnIbXv5Ffcb+3EOepp
         p8lwoK5E5XDSzbFqwIMP2S1IRRCwfO9TRCXW/CN354BYSeFB5Gjqo2CLgCoVEnl0TOMw
         1CoibTH/0+emlPhAqjdlgPH5TDlAuAx8am3rdm+OhbUjDQFSpYM+6VzfuNJj3VxUhuy9
         cJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013946; x=1793618746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        b=O1hXtGD99jm2Dt/JS1a1zKWiXHed9HsIjmF6jzT20rMojRbKrWdG2i305BBs9VIajR
         VZmQN37TBs9yKF9P/xIcOb7wauabhjyRQ4iKs9p7Yur1A2e3Z/u9L+2UXFxcMcEnt/Wn
         QfqtVabdEF9akGL3rg3/KE2/Zeq86Dgc5copFZo9FOY1/gTGlyk+BX6Bn3kXfjzoiZ+y
         5T2K7J9yt/kebVh2a6ryVDeniOX/IQpwYWzLE/6cQImwZTsOqZDNgILm9LTUbQwbb6dX
         NUJjoaEMWUThoXOdYH08G68byzsW7Iuu9XI73+eUopejqwjJZJQ1m9qUxEgkHL2Vh50J
         Eu2w==
X-Forwarded-Encrypted: i=1; AKwUvBzWjB4/FvXiOpsym4jCNuXyFlLl+lNoHqPrGWtgB6+Aw/l4rWYTZ5w42vH6O59AwZvE4hNmjNoBhjRbxhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyTjuLNJi3XXF8VwiuhhIPp3gL51qs00B37+TbhSAeEO6rX6Sc
	+La7QazQwc6Vvl5fu4J1ZCjKMFNH/66TyNuHuy0BF/KiC5BQTPD/72QLzHx+lViLGK8dPxEkF0v
	uctYuJTCeJUIwhxzF4gcFBNk9JIfK+2WrjmeF5ptUc1+xCb7WZugwqds2M6qPH2dnvLDEEtI2kF
	WFtKYoN1JSFZPkh2p8RVrktlWCh8BiGzx/cVx8Gr0VCw==
X-Gm-Gg: AYBFou2Pgr7zcxEKI5pNcq0YbELtC/jWNOIb6WuafYEXvzt8sLi5yePxNyywS9jIrHN
	qpEC8N29otlyQbOOcneVu0E1FJSgBkgtX4OtASMb4jqC4LqpoB1jXHHSRR5aiNCQxSU/8PX7U87
	CIdtJEEBQLnwijFXyTsTisCa2AShDjMU1XqVSUilBhJ3jdbNsXsAW+jzVMvaUk6RxaVa00osXIO
	DqmCTp27Xaj6t4O2J6OK0i+ltLk9BWydEuGcn/tlM0qTzodeHPBcktLOHyQR5x/XMb3DzkWr4bZ
X-Received: by 2002:a05:620a:178b:b0:93f:26d6:d70b with SMTP id af79cd13be357-940ef8af1a0mr924705985a.29.1793013946389;
        Mon, 26 Oct 2026 04:25:46 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:93f:26d6:d70b with SMTP id
 af79cd13be357-940ef8af1a0mr924701085a.29.1793013945915; Mon, 26 Oct 2026
 04:25:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:25:34 +0100
X-Gm-Features: AclHuK_V9TSwenazx_QbQTVJlNkn-z_z7PltZHh3vUhKfg_kBmr_W8aabFtQzwU
Message-ID: <CAFEp6-2akDevVekLozzaH1e7rNuqqfpHjQiQvSkwuv_4zLucjw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] Bluetooth: hci_qca: Support BD address from an
 nvmem cell
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXxsZ6fyZdWBjl
 GckJbkcA/0ZjRE0RgfskEGHJRxJr2AOxdpejxm+Q4BMoUZmpiFbcUD7fbJDBRiCrEyS6cxXNoK4
 pIUzQ5+oOaXktNZJgzHV7zdWrcg6GYz5YIoRwBUO00+Ha7m+YKbZsk3Vpu8gz3+mSp72DRABD9i
 ILYGXoOREoUJvSawhDC+8KA43KshoKxP/dWKjPLF55J8NpNGNc+oxm5/Z+u83bcHOiPXH3vnlKU
 0+6wC8yPULlhSokqWqYvQCNcG5uckGKH0KxVnNi3akHlbE/7ntZlMY6rK0YeL2O0jKWmgPM0Dnc
 iiQ+lO5PNBlag8VdKaOvLDADs+COJ/OzFH2Jw00ezKoFKRmLaz1oWE5RyAXAbxKhH/JEH+iJWAC
 ET0GcIGFNZ0KPw5hG6reFVbJCVJ0EHw7EYFgPsbgPYkr9XZWe3zWwz1sGomJygr9SO7X9PetGY9
 uLblhWq2XVjtEPZyvtQ==
X-Proofpoint-GUID: MO_9VvWO9fnWAWLU82JfvoJHlxfg07oy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX/IWUYiFVEXth
 ROt9fl3ZSv5yRjtpncprljMsRFU3IL4fmxH/yhy5gjrpm4/foeQklkBh2MDLskhMCo6raNdeCsw
 QKfcL2BPV5Abvqv8BY/Bawi77LWBdrY=
X-Proofpoint-ORIG-GUID: MO_9VvWO9fnWAWLU82JfvoJHlxfg07oy
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf38bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=v5oHNKCaMdnEZ5eDWvYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Hi Abel,

On Wed, Oct 14, 2026 at 3:05=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Read an optional Bluetooth device address from an nvmem cell named
> "bd-address" (as already supported by hci_ll), and program it into the
> controller during setup. This lets QCA controllers source their BD_ADDR
> from firmware-provisioned storage such as a UEFI variable exposed via
> nvmem. An all-zero value is ignored, so unprovisioned storage leaves
> the controller default address untouched.

I proposed a similar solution here, at bluetooth core level:
https://lore.kernel.org/all/20261015-block-as-nvmem-v11-5-f890ac74f87d@oss.=
qualcomm.com/

Regards,
Loic


>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 48 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7089e9b639b2..b704f4c3e1a4 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -25,6 +25,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/acpi.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwrseq/consumer.h>
> @@ -230,6 +231,8 @@ struct qca_serdev {
>         bool bdaddr_property_broken;
>         bool support_hfp_hw_offload;
>         const char *firmware_name[2];
> +       bdaddr_t bdaddr;
> +       bool bdaddr_valid;
>  };
>
>  static int qca_regulator_enable(struct qca_serdev *qcadev);
> @@ -2079,6 +2082,16 @@ static int qca_setup(struct hci_uart *hu)
>         else
>                 hu->hdev->set_bdaddr =3D qca_set_bdaddr;
>
> +       /* Program a BD address sourced from an nvmem cell, if provided. =
*/
> +       if (qcadev && qcadev->bdaddr_valid) {
> +               int berr =3D hu->hdev->set_bdaddr(hdev, &qcadev->bdaddr);
> +
> +               if (berr)
> +                       bt_dev_warn(hdev, "Failed to set nvmem bd-address=
: %d", berr);
> +               else
> +                       bt_dev_info(hdev, "Set bd-address %pMR from nvmem=
", &qcadev->bdaddr);
> +       }
> +
>         if (qcadev && qcadev->support_hfp_hw_offload)
>                 qca_configure_hfp_offload(hdev);
>
> @@ -2420,6 +2433,41 @@ static int qca_serdev_probe(struct serdev_device *=
serdev)
>         qcadev->bdaddr_property_broken =3D device_property_read_bool(&ser=
dev->dev,
>                         "qcom,local-bd-address-broken");
>
> +       /* Optional BD address from an nvmem cell (e.g. a UEFI variable).=
 */
> +       {
> +               struct nvmem_cell *cell;
> +
> +               cell =3D nvmem_cell_get(&serdev->dev, "bd-address");
> +               if (IS_ERR(cell)) {
> +                       err =3D PTR_ERR(cell);
> +                       if (err =3D=3D -EPROBE_DEFER)
> +                               return err;
> +                       /* -ENOENT/-ENOSYS: no cell configured, ignore. *=
/
> +               } else {
> +                       size_t clen;
> +                       void *cdata =3D nvmem_cell_read(cell, &clen);
> +
> +                       nvmem_cell_put(cell);
> +                       if (!IS_ERR(cdata)) {
> +                               /*
> +                                * Ignore an all-zero address: the backin=
g
> +                                * storage has not been provisioned.
> +                                */
> +                               if (clen =3D=3D sizeof(bdaddr_t) &&
> +                                   bacmp(cdata, BDADDR_ANY)) {
> +                                       /*
> +                                        * Per the device tree bindings t=
he nvmem
> +                                        * value is MSB first, while bdad=
dr_t is
> +                                        * LSB first.
> +                                        */
> +                                       baswap(&qcadev->bdaddr, cdata);
> +                                       qcadev->bdaddr_valid =3D true;
> +                               }
> +                               kfree(cdata);
> +                       }
> +               }
> +       }
> +
>         if (data)
>                 qcadev->btsoc_type =3D data->soc_type;
>         else
>
> --
> 2.54.0
>
>
