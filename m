Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793752346;
	b=hPHV7ROHoZEvfqwyhNYMTDK7FR03I4SzrxiF50RKfux467V/rq2fxYp7N4bFBwpuKEkr
	 hX1tVBwcajqf/t0HSkMo7BD8i5vPmexAqKNj+DrBLh40Y/3Wl7dUlfGX9oYSUdjgu7dRY
	 /tPyDxT1mNgJ28FOyoljlm/7mXRyPXyYbd6uQYXVKPDy2E6gt8skqy5coDVe580ZFV7Qa
	 bpniMHjJSSD6mIJaPRAHsKBgTigxfMECFZh/SbJr+b8h8RtHkU+R5KK6jMA26hcJ5dKil
	 U3IHirdIty1MNZqNm2GimseskkBwMer/TvT3GU/0gB8pHvyw4EhQc2URR7ZNNAh2GXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E3LEqmXFvCMbyxfxq/JJyPbTV3zJ6Nq1u+0O1KDxtrs=;
	b=VPFFj4ax2RFG1OBPWHnLkt46LYThBXZPq/m18Yp8eDmEGHI+dekkJET9wDm9SevsoNAu
	 sFUtFlAKeLhiDxgnxTD5EcLL+fRFF+wdkmtyFH3Hl8afamjk1uvjlhbx54tu1aBFuIGKh
	 JtGrPvngOsOURHizGjmAAFakkZGUwNF1SdNNGVX2b8MCUIZ24hC7ZT5T+BxVkVXgatziI
	 iv6ZNID2Bui6W+DMBwfG7eoANg3jsQsQZke2Pcf2YTvgA91dJ1h4KZzVQ0/JoM780uxxO
	 Y6fLf6T8bCsFhzaxNDy65xIfsYLxFzM9iYL4mh5PHkPgV0kw8SbWEGlO4pdXtgPOWog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=paiI94ky;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQYs9AZx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE881606A324
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE881606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=paiI94ky;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQYs9AZx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R7Su193444
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 00:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3LEqmXFvCMbyxfxq/JJyPbTV3zJ6Nq1u+0O1KDxtrs=; b=paiI94ky07z36C9R
	BtdvPo084taLci37jZ/cv/Fv+bqQY1xY8PlFhH6tigp16aICkFdPaWXfy+U/jMfR
	akbJ0N8AoAhHPBl8+9GqFTDfm1xmfoPmcnLULxly/FO2YMN7hO/h0632CQ+XCJFu
	9zyLNGvLA8Fo4IiV7O16a8UWwj8kAdE8djso/2/gYMNWwM8Ip05fi8s729SQLPzj
	vzkoAxXHDYMrcti/uBaJsFyL39EXJi7kA3kvUW6kEkdSXljydXDiOvKb4bwKjxMZ
	ffxpScMbmBARv+lADcOX86zuUrSPCk5uliWos+/GRoe0/hGCUnDZtsjOeRs2oTYz
	eev0Fg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nh4f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:32:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94f72fb9fso1327625ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793752344; cv=none;
        d=google.com; s=arc-20260327;
        b=R0FP2phw0sdp7VmkIZvADzyjUxihLxS9nsTTf+q+g/s7BOpRQ+UbA/+/4TiQBxNO3u
         yi0x1atA7REHNPCSG8jLchemgq5sKC+T/EqX4j0jnYZ+YVL2v6p2VnhrYg+PnPCCUGt3
         b3iCTfJ3GayqR3+wC/Lfh3TZoIMfcu6FJetsmXBP+S0cQoW3Suxf416V3XZuH86RNvzi
         N6IEIUCR/qOzPC7soNbfmczput+3ngHwlbaQe7xdd10+u0QuX+7Tz0R+SnpnKmNinsfg
         ei8Lghs4TE8goTOO++ixfpnZysj4Rvupv7LwtxlaBzvalY53a8hsF2ZKDQgG/eR3o7A2
         kCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E3LEqmXFvCMbyxfxq/JJyPbTV3zJ6Nq1u+0O1KDxtrs=;
        fh=6lRHXuZXXydUz7bamr24GxuoZOi3MFeW5bNivgrwzks=;
        b=huRDSGhm+LexpFJTP77ASjraB/Yp7vV6cOaB5Gxzi3K1ifLW5S8RHEFFf9mGTUBTpq
         HMEvqAwHxl9ywLTETdHb4l/FjQ6zJBUAXjKeSiJDsBF9kfO6FOTUqLT89Xb5yURaE1jZ
         BRysFhY348cY3x1dgxbQEz6OuQhoLS5WBfeFyTVSTqvuKZp5+RyFs+rA0fb3NbAJmbs7
         rmbwSK4ZCxe8qgg0oM8dKQZJn/nQsCqJ9xcDyKQbvmEiMBAgBLpA6JGrV0Q1UqtT3CdO
         g+j2Xr28P8ApR/UpKAx5JpHw579M/ABQd151a4jQ9WlsMGuEnj4m8vlRSKJkP5ubvTM3
         jQog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793752344; x=1794357144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3LEqmXFvCMbyxfxq/JJyPbTV3zJ6Nq1u+0O1KDxtrs=;
        b=TQYs9AZx3UZffDbI7HR50AL5laQngj0Tr/BhplqwFL5UTFBS7Ut4wtdNcwR7xxxMUA
         hTHBXUo9Qc4JxyHaKxdQffADLJMAPkr53MDJEOcAUOpnLp2X+82DHArJVcetDruBrgff
         0xxmv/44/weCM3dcqD93qLH8ogjEyt0jxJ7ATO65lUtQSactrdbMyiSwxLs8wFXBBLU8
         +Flr5nLkyWHCSlndHK4Jbbkhk1J1z9cTVcznCcyP1tWDk6qM4h86p9g9rbs3OQhFQUrx
         5rJuCylBQbmXshxbv0HFZvqH+HlUjHQH0DiJJFEm60CGiLzkeqeK1TWqncgkQQLj5nKg
         YAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752344; x=1794357144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3LEqmXFvCMbyxfxq/JJyPbTV3zJ6Nq1u+0O1KDxtrs=;
        b=0bETZxF5UFygh2GbB6R4coQNGoYB7d3wSca9jcCEIU/VXB5loFin/Nc2SCwFqgw7Kp
         Lr2PIXxjp4ltB/ZAbN7uk2tU7/OzBqVk5vS2z5ByQj2AHF3s7AULc9YzYh6PgWvLTujz
         gQTl4On9l1OMqaDRoaG4v8WUty+K38Y7bqxOdtt+l7qm/Ulg37rNiFS7PT59/4nh0yAc
         bwJpOTlhcdOv+rizld/iFoGhV09cUR257CoedfAlxuwYEwWayiafd+3DPlkoqa53Z7YS
         oGLNgNDukWuNJe3pzjnFvLP+KfaYdZprFDau7l/ZVf/+3EU8ESBsDISth7wUflrbFJkK
         nRXA==
X-Forwarded-Encrypted: i=1; AKwUvBwqbDJFh5muCwKwjGDNfM7Xm//jV76dROLdvTNqH7f6Q9HnMmQKNk+IYPivQHebzI+tvtrzVJrpgmbKfFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QVI4GNpKkCjWLlsA8U8FPJ6mu65UBfxi839xiMPXk/hAOCLvr
	ulo/D8eB/3xx78qpskPgyjNL1IPnsXllGMUiRiLivgeTOO4q/ghuWLJSNFMKp2h7l9apOeYrkOd
	4Bzu0qTJQ8RDSvxdX/5vGlkp7QVRkWnVVGCTJaTgcKUWeCseuNQ7aKZ9lD5qEGq7KDU9wiKF9Bq
	NUm7Vxb+hDhdFj7ASA3Przq2cnbS1A4D3WHAn5+ETm3Q==
X-Gm-Gg: AYBFou3AQlQgbcG1VLNbMXgv3LArszcbvmN2sH8gFWpgOMFnsfvN3csS54u3/hnmtz3
	eqT+DYGoqimX4eiA2mwEzcYxn8DHw8ibIN9YRKjqjMY5M2ygPAT95Ju5ics87zT/LzsKW1jua7F
	ii6Z4tnhuyzIn6Wk8MXV0hDkkv2bvlvBBBFouxGYIu+gKmlMb+to5Rvr4eHBY=
X-Received: by 2002:a17:902:da4b:b0:2ed:e0d:dbb2 with SMTP id d9443c01a7336-2ed0e0de332mr151335ad.36.1793752344423;
        Tue, 03 Nov 2026 16:32:24 -0800 (PST)
X-Received: by 2002:a17:902:da4b:b0:2ed:e0d:dbb2 with SMTP id
 d9443c01a7336-2ed0e0de332mr151045ad.36.1793752343938; Tue, 03 Nov 2026
 16:32:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924-add-pmdomain-tracepoints-v1-1-d89f3f0a6998@oss.qualcomm.com>
In-Reply-To: <20260924-add-pmdomain-tracepoints-v1-1-d89f3f0a6998@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 01:32:11 +0100
X-Gm-Features: AclHuK_yJ0UFNaHojG-mXEOXNFQIByshULBfM9QEn2cdyRS_Or0qUUS8_D9tVQw
Message-ID: <CAPx+jO97Af9xvSigY71U65GozKRCpuCjU=7DBEqBXMbN-fRcQA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Add tracepoints for domain state changes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfX1rZD9GppceE4
 OX4M7Ry4eIXijggQjEHN1EALHbTHO7+ruC2hNyVjE/1uFP6BRUF9oxg8FMsREXCnMhXHEaGpEKE
 DhBC8TnCX+kvEVVjNIAz43suO7V2MKq/KeMdle+IB1oZKOTpJtoUoBzRcmaGUxVRj6pP6toKT7/
 61X8P771osvI0/wP7dT9TIEi2LP3fUiHc8f3Mpcv+x6CcE2D+waFkWUHRoF25sGm9JquDAiwmzs
 Ppc4CWvFRfIBzntkAhpokOnT71b78m8tMTCIzyXICzoNj8FR5VxjLUaE9LYEM2p5047iGHH7FZv
 mbSqh7NxmedfryXbUFTWlJETiaSTK9/9MACrjemDX8FfVnaYt1E/nvRTIMY+t05PjE6mnPdMM/q
 PR6qENTXtiRo5iME0nGU5HkPrDQZG6czY2ciVwJOHC419K1qDiZgGJUJA2FBSPv1Eu6hgqm/uav
 LKV7iLECYJFvDhfo6HA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfX1I+jqAA3nGNq
 owbYQ5kRCoIIKLSwJ84bTyBui4aCNfPbHFyfdWDp6FfdPl68vMRyd9mSKwp0UwGTpcS5Mi1Hh80
 BhK4AXqs2wOgbJrQotJmOlE6vLmd4qU=
X-Proofpoint-GUID: lOwg7Oab5qPuzyiz9sIpw4DPDYZuKVOT
X-Proofpoint-ORIG-GUID: lOwg7Oab5qPuzyiz9sIpw4DPDYZuKVOT
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea7d19 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=a0ICRLMdHAicX5uOO4UA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040001

On Thu, Sep 24, 2026 at 5:07=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Power domain state changes are difficult to correlate with device activit=
y
> using snapshots of the genpd debugfs state alone.
>
> Add tracepoints for domain initialization, power-on and power-off
> operations, and performance-state changes. Record the domain name and
> initial power and performance states at initialization. For power
> operations, record the idle-state index and return value, and for
> performance-state changes, record the requested state and return value.
>
> Emit the operation tracepoints on both success and failure paths,
> including power notifier failures and performance-state rollback paths,
> to make failed transitions visible alongside successful ones.
>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/pmdomain/core.c      | 27 +++++++++----
>  include/trace/events/genpd.h | 94 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 114 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index b99c2dcf3d8f..62bd29e5918d 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -28,6 +28,9 @@
>
>  #include <trace/events/ipi.h>
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/genpd.h>
> +
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>
> @@ -485,7 +488,7 @@ static int _genpd_set_performance_state(struct generi=
c_pm_domain *genpd,
>                 if (ret) {
>                         if (link)
>                                 goto rollback_parents_up;
> -                       return ret;
> +                       goto out;
>                 }
>         }
>
> @@ -499,15 +502,18 @@ static int _genpd_set_performance_state(struct gene=
ric_pm_domain *genpd,
>         }
>
>         genpd->performance_state =3D state;
> -       return 0;
> +       ret =3D 0;

Nitpick, probably nicer to initialize ret to 0 while declaring it.

> +       goto out;
>
>  rollback_parents_up:
>         list_for_each_entry_continue_reverse(link, &genpd->child_links, c=
hild_node)
>                 _genpd_rollback_parent_state(link, depth);
> -       return ret;
> +       goto out;
>  rollback_parents_down:
>         list_for_each_entry_continue(link, &genpd->child_links, child_nod=
e)
>                 _genpd_rollback_parent_state(link, depth);
> +out:
> +       trace_genpd_set_performance_state(dev_name(&genpd->dev), state, r=
et);
>         return ret;
>  }
>
> @@ -842,7 +848,7 @@ static int _genpd_power_on(struct generic_pm_domain *=
genpd, bool timed)
>                                              GENPD_NOTIFY_OFF, NULL);
>         ret =3D notifier_to_errno(ret);
>         if (ret)
> -               return ret;
> +               goto trace;
>
>         if (!genpd->power_on)
>                 goto out;
> @@ -873,10 +879,13 @@ static int _genpd_power_on(struct generic_pm_domain=
 *genpd, bool timed)
>  out:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON,=
 NULL);
>         genpd->synced_poweroff =3D false;
> -       return 0;
> +       ret =3D 0;

Ditto.

> +       goto trace;
>  err:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF=
,
>                                 NULL);
> +trace:
> +       trace_genpd_power_on(dev_name(&genpd->dev), state_idx, ret);
>         return ret;
>  }
>
> @@ -893,7 +902,7 @@ static int _genpd_power_off(struct generic_pm_domain =
*genpd, bool timed)
>                                              GENPD_NOTIFY_ON, NULL);
>         ret =3D notifier_to_errno(ret);
>         if (ret)
> -               return ret;
> +               goto trace;
>
>         if (!genpd->power_off)
>                 goto out;
> @@ -924,9 +933,12 @@ static int _genpd_power_off(struct generic_pm_domain=
 *genpd, bool timed)
>  out:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF=
,
>                                 NULL);
> -       return 0;
> +       ret =3D 0;

Ditto.

> +       goto trace;
>  busy:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON,=
 NULL);
> +trace:
> +       trace_genpd_power_off(dev_name(&genpd->dev), state_idx, ret);
>         return ret;
>  }

[...]

Kind regards
Uffe
