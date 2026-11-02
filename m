Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606320;
	b=4L1ASGbmb90xAIe6jujRTJBiZVBnbt9doz65Ya1PuqjFKuVG59+XM/P74E6cwtY1EsVD
	 Xp2SOvjG1BqhJ5PxM/9UZ+SJKUotju8sTeKH87TPzkmCeYZq9L/0n/u7bdKln36kuQPUI
	 xUnp5PShdi4Kno8bywDUDzCQokmkx4q4m1zMUckwz7lPSraTadtEYM8Wg004r1c7oVuPQ
	 bBr1/49Xcwf3polQiSgry8rUKU5P/dIh47MERKxFFz+UNHwPokJsIBN3bhUWKcV/B/6Mh
	 BT+31wZ/hecu+/vysOZ5Ff4rmMDuaeafrW0UcFF6RqzhYV8Ct7xy3pReNf1QwhuQZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ke6cgZpZBf+UCTrm1HAli9+h7m1fVngc1M0Sn68Rq0k=;
	b=vEimNIekTrh9STDHCxr91xhl0wd4PvjrnnMzEYX2RnMuN4gu3vUPWF8X7ObJ4sA/hC4U
	 HFjjedyUzkjS5jvibS+HyooLmwCKlhhcD2+GxS9V1/MOFnvAYNRB+53OArJtcLlc8HH0d
	 y2W++EpiI7oaLC4/UqF6dG9IN3xJdFo/OUBQiP54q3ZhF0pnIirmOua1JOJCsuJdMsd56
	 Nj8HXP3VugGQIFLT2fjUnhdr15h+xp+1yE8qrf3V0qP12Wel5kKIFIeKipMH3lINR1x9f
	 Wc/+Edu4NuA0yON0idoL7lXB59hiRRSz9PxSxTmOEUYcxiZ7W1t9zXZ7mFen2HpSBJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpLDqk12;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YtZlP7bP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4399D606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4399D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpLDqk12;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YtZlP7bP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A27qfTJ3862986
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ke6cgZpZBf+UCTrm1HAli9+h7m1fVngc1M0Sn68Rq0k=; b=MpLDqk12NgMkn1Lr
	JR/8RZRsJ5JkxjwIKXje8Fb+BhztJbp//r+MsCHnKPDTotO/jqlVQAeegxOgUbCM
	c0qklXSHDVwZDFVRTC5FAYo1a0Fq/ugRsjTGUs1FOFfiTTsqTh0N5gQpyfWI5baz
	wdpq/ziAFm2SzE6UUaiZpvRSCTk0ZHG4Su0DBysaoU644BnrFUm94kXEWP/rKD1D
	GKU6Z5LkYkmmtmibXyTiI24MqYXM03BZ6NLu/9jJFBF++oYZU7jlQhk2wdlrhzph
	AG5awQXIJlXAK7wncQvhxp6qHlLCBESLh8+eRXFsiELvSkBcK9XnYJKwaiVuvJhL
	ZXlz7A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph180tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:58:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso3191486a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793606318; x=1794211118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke6cgZpZBf+UCTrm1HAli9+h7m1fVngc1M0Sn68Rq0k=;
        b=YtZlP7bPY66PjG+Fp+ZqFV49ErJVVTsDc1hZv9GbbU7L/vF+X0+1SOH0Ad7iTiPl5n
         /4tCYej9FhqZnhxVgwohj2TITFiJ+O4zPrua9fnR65VjSfDreibew2FhCp/tj5QRiBD9
         vJig3sMTUjTuQXuTDvFhqK6G07ZE7psSVhukCMnhFcOHhDpvW0MBc5t2oaYjAFZON4/9
         HZQd7tiVaYGc21AVIk/j/cKPXuaNnu0dy/bfFWIbXJjMVm5oeCSAwGvGm/otEr3kcC5n
         LIH7NxuBDi4A4J9/nT0uY6QEmNh+9yQ2VbLl4+hMy5wa7OY6DLxXqHd6pHpZ+qjJ9Dji
         8M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606318; x=1794211118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ke6cgZpZBf+UCTrm1HAli9+h7m1fVngc1M0Sn68Rq0k=;
        b=paShi7LsnNRQZCbNh8vSwy5+ZdVZ6uA8KIItfuAtoHQT6jcj0Fzo6EAKKE0+qboWUx
         AczIpISLJyTs7vnBIE9r9HjZGLGMiLKgSq3/OA8dYpRmU0sYY5ZQHoQ9qWStvnFEYK+h
         SQ1h+o2BdxoL1/vPT4cjH7T+EumHJO9YQyAUukKv6TsNWYcLmA4lx7DIvZZHcXk/mQL2
         poHDylkuah+FgrKkeicbKu2PlibTaHqYF2QTdmPI7F8ytDDd+6cYV9gUw92fXfY7C2FM
         C6DIm4CZUFwJMq4vyOuKjAo1yJYJ/6nq0sWpHTE9mqJMPS0rG6TOw7CDuwXJqLIu6ptP
         rr8w==
X-Forwarded-Encrypted: i=1; AKwUvBx+mNhTgmOAapv8H1Im0vlWyxKr7YOGZ5yR/dKTgaRZbKzAhHc0ccDUefbueFLJri+ZA+lP73gLqaB8MHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+psl664+IVWaDI1tn3+mip99uABKm9/iYn8Lx0208sRA4qJPUj
	2mZBonQGr/6c85DdOuFm8Q7Teh8JpxPCWIi4fYdVdft/3NWTPgY8eiOCTjH2lW7mGgRTYfbRqGu
	WS4br4Kf8RD5imfLgwjmh67sFVMCJFCKE9M8xGngv6mHYlnkzpfIXr0W9ljOLRVLjaic=
X-Gm-Gg: AYBFou3A5GMfd3Y5sQz4xq1+nn5cejy3jjBsh7F6RHZ65mZFnuvHmSzVcU09vbuHtXB
	k8JOFgkMZAUn3Ti3kRRZOKUg7cpYA+SWouUyH1/0GWeu2d/aDzQe5dECKuK6NtqSVIYbVC8aU/n
	dcEctYt++pp+6laQhZCeegfYSFOS3ySzEWKLoylKE9mLKk1EnricUWBKkV1rVfD+IjcgNsrs568
	O8va5XFaOvLnedj3cZgS8HQjAvraJVU/9umXbHTWspGnE++CVhTFJi560hUj9NN8dbk9RXb7n33
	RVAY1O5piQTBgZ+swn/lGJ1aQvl11YKRdFvCbLoePsKHUSXf6OIg6doACvJFB8HAlS5B9JYA9xy
	LcFNKGlDnTYCHPwAWcKLDVYwq9Fyo1CV/J8Q4k3S13pW0LRgziy9wguPOyjHfwGu8f3hUuFbX0X
	Il8Ly19xZfgnrU+aZlZpY603JTqr3SnH+OQAAyymUv
X-Received: by 2002:a17:902:f548:b0:2e9:572a:7da7 with SMTP id d9443c01a7336-2eb364f1979mr89202295ad.49.1793606317778;
        Sun, 01 Nov 2026 23:58:37 -0800 (PST)
X-Received: by 2002:a17:902:f548:b0:2e9:572a:7da7 with SMTP id d9443c01a7336-2eb364f1979mr89202065ad.49.1793606317202;
        Sun, 01 Nov 2026 23:58:37 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm23694945ad.61.2026.11.01.23.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:58:36 -0800 (PST)
Message-ID: <90194df3-c05a-4e82-9f12-11f33b0374c0@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:28:32 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022224220.480-1-tvlad744@gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261022224220.480-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JUF4IzRgvvnn0MjQgnMaYdBuFBxHfRYf
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae842ae cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=QJlEbJcQkAJ0Kpe_DjEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JUF4IzRgvvnn0MjQgnMaYdBuFBxHfRYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX04RJc6G77qli
 ZRiTD31ROxLVFPFXLY25IGX7cEbrgzD0t/BS0gKAqT993lV56OyRIyYCxl2oTS+Eczz9Vm4ww1K
 cEkaiwxa+6yjPJngW4OFH1IYPPbazvqKV2jr7Ecd2W6j3QVFelRN+Ms7UH2bZaevnuIbzXt3AlV
 TZKpn2YK1h0STkdQzr5Ym6je36/D4bjvvl8wmO3kY4EpCbpKmRcocAzqkKCSOehzJlNxolmFUW0
 kIBCqIIzuGZ0dRVRmqZR+lHMEdFVoY3IaaasguqO7ThjuTw90oyqZfqOY4kM3IBCOqZ84Fh0mIc
 oFhdY9pmNnVps7OP4t9WhtcWZNVFJWxZ66iS4Yhx8uxQb5JTM8pV4Hx9E3DBkkpZGdy9+iiMhC7
 ikTCYE/thuAiaOm0B6lkwHyeHzbRTMBEctohHyGDZDvNoH0N/FC869N36gLTucb5FhyM86hPWED
 CHlMzayhcDersMtObtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX/IXjIrxvlkdU
 ubadg+TxpI0zvzoEn+AFQPy2GIAhz/C6NXL3LoxAMXoF+6cDOjQcG0NPMLJtOwbjkg1KX6Dnev4
 KKavKqZhLEMI+BRoQNr8EXYxbVxgLiw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020031



On 10/23/2026 4:12 AM, Vladyslav Tymoshchuk wrote:
> dwc3_qcom_set_role_notifier() updates the VBUS override in QSCRATCH
> synchronously, from the context of the usb_role_switch_set_role()
> caller. The glue assumes that role switches only happen from a
> freezable workqueue, but that holds for the dwc3 core's mode switch,
> not for this notifier: the UCSI connector work, for one, runs on the
> non-freezable system workqueue.
> 
> On SM8750, when the USB cable is unplugged while the system is in
> s2idle, the UCSI connector work for the change runs before the devices
> have resumed. It switches the role to USB_ROLE_NONE, and the notifier
> accesses QSCRATCH while the glue clocks are still off, before
> dwc3_qcom_pm_resume() turns them back on. The access does not complete
> and the SoC resets. pm_runtime_resume_and_get() does not prevent this:
> runtime PM is disabled at that point and the device is still marked
> active, so it returns success without resuming anything.
> 
> While the glue is suspended for system sleep, only record the VBUS
> override update and apply it from dwc3_qcom_pm_resume() once the
> clocks are on. Apply it after the core has resumed, since resuming the
> gadget enables the override and the role switch is the more recent
> event. Serialize the notifier against the system suspend and resume
> callbacks with a mutex, so that a role switch can't run while the
> core or the glue is being suspended or resumed.
> 
> Fixes: 21188e8d6d75 ("usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>

Tested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
> Changes in v2:
> - Hold role_lock across the whole of dwc3_qcom_pm_suspend() and
>    dwc3_qcom_pm_resume(). In v1 a role switch could still run during
>    dwc3_pm_suspend() or dwc3_pm_resume() and bypass the deferral, as
>    the Sashiko review pointed out [4].
> - Link to v1: https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/
> 
> The review also asked about the direct_complete path, which skips
> these callbacks. It is not taken for this driver: every
> qcom,snps-dwc3 node in the tree has a power domain, and
> genpd_prepare() never returns 1. Where it is taken, the role switch
> is dropped as it is without this patch, and the hardware is not
> touched.
> 
> Tested on SM8750 (OnePlus Pad 3; the board DT is not upstream yet),
> v7.3-rc5 plus board patches, with the UCSI connector work still on
> system_wq and without the pmic_glink RFC [5]. The test kernel also has
> local ucsi_glink and qcom_battmgr changes that make a cable plug or
> unplug wake the system from s2idle, similar to Jishnu Prakash's
> ucsi_glink patch [3]:
> - cable unplugged during s2idle: resumed in 2 of 2 runs; without this
>    patch the SoC reset in all 6 earlier runs. The switch to
>    USB_ROLE_NONE came 15 ms after the start of the resume, during the
>    noirq phase, and was only recorded; dwc3_qcom_pm_resume() cleared
>    the override about a second later.
> - cable plugged in during s2idle, s2idle with the cable connected,
>    and unplug/replug while awake: no change in behaviour.
> - with a test-only msleep() under role_lock, so that a role switch
>    comes in while the lock is held:
>    - 3 s in dwc3_qcom_pm_resume() after dwc3_pm_resume(): the switch
>      from a cable plug during s2idle waited for the lock and then set
>      the override directly;
>    - 20 s in dwc3_qcom_pm_suspend() before dwc3_pm_suspend(): the
>      switch from an unplug waited for the lock and was deferred. The
>      unplug aborted the suspend, and dwc3_qcom_pm_resume() applied the
>      update. No reset.
> 
> I have not tested this patch without the wakeup changes.
> 
> The UCSI side is discussed in Abel Vesa's RFC to queue the connector
> work on system_freezable_wq [1]. Since v1, I have also sent an RFC
> that holds back the PMIC GLINK notifications over system sleep [5].
> With it, an unplug during s2idle on SM8750 no longer reaches this
> notifier. This patch is needed either way: the RFC does not hold back
> a role switch that is already in flight when the system suspend
> starts, and callers of usb_role_switch_set_role() outside pmic_glink,
> TCPM's kthread worker for one, are not frozen.
> 
> Faisal Hassan's SA8255P series [2] also changes dwc3_qcom_pm_suspend()
> and dwc3_qcom_pm_resume() (the wakeup argument becomes a pm_message_t);
> whichever goes in second needs a small rebase.
> 
> I used an AI assistant (Claude) for the analysis and to draft this
> patch and its description; I reviewed the result and ran the tests on
> my device.
> 
> [1] https://lore.kernel.org/all/20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org/
> [2] https://lore.kernel.org/all/20261010053246.2991984-3-faisal.hassan@oss.qualcomm.com/
> [3] https://lore.kernel.org/all/20260722-ucsi_glink_wakeup-v2-1-b43dee56df24@oss.qualcomm.com/
> [4] https://lore.kernel.org/all/sashiko-outbox-176222@kernel.org/
> [5] https://lore.kernel.org/all/20261022164151.592-1-tvlad744@gmail.com/
> 
>   drivers/usb/dwc3/dwc3-qcom.c | 61 +++++++++++++++++++++++++++++-------
>   1 file changed, 50 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..b22a72e3c1b9 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -10,6 +10,7 @@
>   #include <linux/irq.h>
>   #include <linux/of_clk.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>
>   #include <linux/kernel.h>
>   #include <linux/interconnect.h>
>   #include <linux/platform_device.h>
> @@ -85,6 +86,11 @@ struct dwc3_qcom {
>   	struct icc_path		*icc_path_apps;
>   
>   	enum usb_role		current_role;
> +
> +	/* Serializes the role notifier against system suspend and resume */
> +	struct mutex		role_lock;
> +	bool			vbus_override_pending;
> +	bool			vbus_override;
>   };
>   
>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -561,27 +567,40 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>   static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>   {
>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +	bool enable;
> +
> +	guard(mutex)(&qcom->role_lock);
>   
>   	if (qcom->current_role == next_role)
>   		return;
>   
> +	enable = qcom->current_role != USB_ROLE_DEVICE;
> +
> +	/*
> +	 * Not every caller of usb_role_switch_set_role() is frozen during
> +	 * system sleep, e.g. the UCSI connector work can run in the noirq
> +	 * resume phase. The glue clocks are off then and runtime PM can't
> +	 * turn them on, so leave QSCRATCH alone and let
> +	 * dwc3_qcom_pm_resume() apply the update.
> +	 */
> +	if (qcom->pm_suspended) {
> +		qcom->vbus_override_pending = true;
> +		qcom->vbus_override = enable;
> +		qcom->current_role = next_role;
> +		return;
> +	}
> +
>   	if (pm_runtime_resume_and_get(qcom->dev)) {
>   		dev_dbg(qcom->dev, "Failed to resume device\n");
>   		return;
>   	}
>   
> -	if (qcom->current_role == USB_ROLE_DEVICE)
> -		dwc3_qcom_vbus_override_enable(qcom, false);
> -	else if (qcom->current_role != USB_ROLE_DEVICE)
> -		dwc3_qcom_vbus_override_enable(qcom, true);
> +	qcom->vbus_override_pending = false;
> +	dwc3_qcom_vbus_override_enable(qcom, enable);
>   
>   	pm_runtime_mark_last_busy(qcom->dev);
>   	pm_runtime_put_sync(qcom->dev);
>   
> -	/*
> -	 * Current role changes via usb_role_switch_set_role callback protected
> -	 * internally by mutex lock.
> -	 */
>   	qcom->current_role = next_role;
>   }
>   
> @@ -624,6 +643,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   
>   	qcom->dev = &pdev->dev;
>   
> +	ret = devm_mutex_init(dev, &qcom->role_lock);
> +	if (ret)
> +		return ret;
> +
>   	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>   	if (IS_ERR(qcom->resets)) {
>   		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> @@ -752,6 +775,12 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>   	bool wakeup = device_may_wakeup(dev);
>   	int ret;
>   
> +	/*
> +	 * A role switch that comes in now waits until the glue is suspended
> +	 * and is then deferred, see dwc3_qcom_set_role_notifier().
> +	 */
> +	guard(mutex)(&qcom->role_lock);
> +
>   	ret = dwc3_pm_suspend(&qcom->dwc);
>   	if (ret)
>   		return ret;
> @@ -772,6 +801,8 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>   	bool wakeup = device_may_wakeup(dev);
>   	int ret;
>   
> +	guard(mutex)(&qcom->role_lock);
> +
>   	ret = dwc3_qcom_resume(qcom, wakeup);
>   	if (ret)
>   		return ret;
> @@ -779,10 +810,18 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>   	qcom->pm_suspended = false;
>   
>   	ret = dwc3_pm_resume(&qcom->dwc);
> -	if (ret)
> -		return ret;
>   
> -	return 0;
> +	/*
> +	 * Apply a VBUS override update from a role switch that came in while
> +	 * suspended. Do it after the core has resumed, as resuming the gadget
> +	 * enables the override and the role switch is the more recent event.
> +	 */
> +	if (qcom->vbus_override_pending) {
> +		dwc3_qcom_vbus_override_enable(qcom, qcom->vbus_override);
> +		qcom->vbus_override_pending = false;
> +	}
> +
> +	return ret;
>   }
>   
>   static void dwc3_qcom_complete(struct device *dev)
> 
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a

