Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794319421;
	b=udglcP/l8XF5IT1RYTrSOYfMWuqNIogx+XicdWR2sMr2pGV6N2rs7+x7a27vjMsDCaNp
	 tDOZB/yq8AI0eYagsex7LurSIOsxc/dOWNLB7X7GCRB3pVi8BEBOuqCpA4PgNtjxJFBUS
	 yhyvVS9HbkH0/DemraXQxixunRj4b96d/U44FkE/Wpj17fN2e6gxOXvy90YjjjFxfKO+U
	 72rI4dDJsNk0MDNFRu8TxpgdnoL9FWU4Yt/P+jEvfFVMUxcXdJ6UrokL9cpLgaKt73nOC
	 /jdJHlry1NVdHqghZTpvGm/4za9A4HdQq9/6cWUc3xafifRQVqA/2/Kr+x73kRYkVdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dDX5RY4IsH57J/4XqqE9KKM+HkzFDQFjq5zuAjcxbQI=;
	b=JQ/fEnSOdF3hiqHFW4JAu0CHDI7AI1r8uUr+/BkbpNzGyWzYiIw3g1S8qwxL7c3RWD3y
	 6RrgPA6m2NiYUG9xS0dAOJsfxX/qvnmzM8Rk5z8fmY5IeWbzhNHEBwJTsGtO8T2owYG8T
	 RqgeGJk+yxFT1o4N1H2u4NlJ6Z9abDz7sNxDCyEereDN6qxdEaY8hgdbsGpP32e7fVogs
	 yLPOUL42gKCYvwBFLhLpGohxQn/Vj+r464mmtMEN2pfHi0ZiaaVvEpm5jhBk0aL25KOJp
	 FAroEyLR3xYpe2F4H7v+63MQKx8sw3QehkAAlSoz9CtsPdZgREhu0bdKpt0caLpl+Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgXOUwrI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRgeo6Rw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1085460A2620
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1085460A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgXOUwrI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRgeo6Rw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAVaA3840129
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDX5RY4IsH57J/4XqqE9KKM+HkzFDQFjq5zuAjcxbQI=; b=KgXOUwrITrNNU6Dj
	/Yvq+TrAEK8YKXw+BevwJlstrdE99zvrKFLzDpy8CbkA1NX7B+2G91rwfRmXqPQL
	JnBY8RsWq4K2koAAMPHerYnf59uXqkU9f5ir7uppKQ66lXEGzJrw1JGH/rtBU0LM
	oliZwED9/Gtpe5El2/JmNAaoMIY/sXP396QBPsZloSRMy9p45P6ECsV4OYXTCZSv
	xURwlcr3ghHSjdIST4UWCGmoK8aXG1QqJFKHZDMd5SK+iti6+FHzKJZKVY4N8hzS
	+1Ezy93APlrNaAC7yJ89394ZUMtu2pD7mIi6JhPFfvxTO06zg5K5+B/lSa/nUhIZ
	+g0mMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg3pck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaf3f829b3so17181515ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794319419; cv=none;
        d=google.com; s=arc-20260327;
        b=hDm2HXPNTXXZr98Eu8yUe2xHjcCoyvqltvC7o2FQTDHdVjlRTC4BEGGXauVBjCM2WJ
         36u85hJkGozZ7Zc5+mELn+jG+mvaGae6QDj/IjDp9ceZgXVkAzi/qHrYFoxvaKa7Wapg
         yoQWhgN3gXivvatGypTUMzIa0EZ1LyXB6EMCuOx3XRFyU9tQr/Sh/Umc7vgsnlKu8pxu
         KmV4OReib6VDOiPM/uA3uPhSQ5s9/8ZD8e2qFfIyrT2v+pREHHJfajAODxXKRFaGx+Us
         2oFHU7p0JO/43sLYzs5RfJb7BPnb1nV+tb4jofc+b5nPiJ4OJq7WWQNaRJeFglJYeF1E
         kiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dDX5RY4IsH57J/4XqqE9KKM+HkzFDQFjq5zuAjcxbQI=;
        fh=bRbyXhzagXuUTofdJvCuuoBJHpzRSv9oHJPSDTCXb6U=;
        b=c/r8oCO8GlJYJRbjBWo5sbXiF4lM+mMGv4Un093ZaU9aRPjKY2FuEaIQJl76wkq9c3
         OLI2z669tuz/uiU+rut7a0XMMvQEH9kXWDpYpFejoZFkYEkTqyNTvHWVMl9E1YnJ8PIq
         XP7GG612zOCYTvfp4PgO0qO0seLyPZnVos5SxzZ1Y8YW9qVAJ0/tLxwBmyXWHplvfSno
         s/m9tmgPcIlu2OqUzC26gq5jK9kUxNHrhGUnfd+0Hbh1NH1UfHFUgBEG5Ikb7oMfUf4R
         TPgTaoaDDlnYFypl8osyNoGISF/GUumYFkJRVYPegj7BdfpJNMfJ4nUaeCW6z9eg30E/
         kcqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319419; x=1794924219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dDX5RY4IsH57J/4XqqE9KKM+HkzFDQFjq5zuAjcxbQI=;
        b=TRgeo6RwEHSsA2/xwLMsO8yEk6Vm/2bcK5XT3poRWGF+sKb6KRfMm5tAg90mxLiJ4Z
         +CS+Ku+3CUnLMopKYwyxdXUu8jl7K2cJ/aytHhu6XEPN2OnZxGvqO135FE2VeFB7jacg
         qlXyI4T11RbFO4M8BQQFCzT2SQ4gd7sl2PaRXFMrtg4R7Q8OeEIKKVmiXV7JonctTC50
         ljsFCBPgYvggl2jHRGTgT9aBxAHfoq2nmH+b2hzZwAZHP0h03T90l6GedY/C8pxEScgU
         OG5XoTQM5HRu9S4/dvq+LxyfsjbHoMMIf7+mXH1FnOwwenCoOVjir/gcsW/HCo78UUYw
         kfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319419; x=1794924219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDX5RY4IsH57J/4XqqE9KKM+HkzFDQFjq5zuAjcxbQI=;
        b=UK050+hc6cs/iOagKbBhAY1awSKz4afZpsBM/c0/YRl8mmcm+aUu4xZiowJHgS0vIJ
         AYql5rz3v0gfJqyWjL8+t10dPsWQxfjY1ygekVtnhxHKZyrK7ZN/Y4f81fI3UB+R4Bue
         +BagEQzZQx9j2VV3duFPzmyLpuRedoDe7oY65Vr8wwnQFCiI24JDqa4VLLmFPjaFS/K+
         CUR74EDGCcbqsrhB14retLmisxRcNzADGSDfbZTOVLX4CdBBItyjLp3QVZe3q2M1qH46
         VvBaFb+yqgbktMN+pBbxl4eui6Rkbts7J79Iib7NpMJmCELsaKjJQ/DQSDVpJ9Nrf00e
         npbQ==
X-Forwarded-Encrypted: i=1; AL+hErELL9uJPqTL/tqB2/zKfZiA3Hkc7MNmz1LfvlgZmgBcSerA8wGQooywUszcw+g03IvDQyigKWhpO1CT6OU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M44n62Djuo+wZ3GNB2dJ56QSNLoAYYspHNX3CetDbBoBRZi5j
	Z8V9AwJOf3YuAs4yLl/iU4BSs0bHlrHuyu642dEv7o57r+Vlap+vzDoXrV6N2WDLSAi+2I6trI1
	pRvJQ/nS38TEEBQGyuesd2jCaRNPneCh8cVDXquvWpSurcM2BGtJgCyoBXdwhDKkMq5c0SgFAG3
	VEjPhLMTd7qhLAcdbdiSdx0gXERmCKI/tIGxia6et5Fw==
X-Gm-Gg: AYBFou3J5khnI9VCUcGJ7BhHnaYWuJMTkxve7ZEhhlwOlT3FecYjodyJdcCiA0UHDHL
	PI7lo9/T6Vo7lEZIKHjHsgeZJ1J7Yk3odRT4t5Ido97iVW+dvIKjcySw0EMS8tUhVguoxMxb33Q
	o8G31XcVZUKx/Gv6CD+WssdLE/OATH/Kjf9PePBNIpzSj4BBm5lkCeEzinfQ==
X-Received: by 2002:a17:902:d547:b0:2ed:218:6043 with SMTP id d9443c01a7336-2edb93052e6mr21107285ad.59.1794319418785;
        Tue, 10 Nov 2026 06:03:38 -0800 (PST)
X-Received: by 2002:a17:902:d547:b0:2ed:218:6043 with SMTP id
 d9443c01a7336-2edb93052e6mr21107095ad.59.1794319418328; Tue, 10 Nov 2026
 06:03:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101063719.88570-1-0xbeac@gmail.com> <20261102022924.51343-1-0xbeac@gmail.com>
 <20261102022924.51343-2-0xbeac@gmail.com>
In-Reply-To: <20261102022924.51343-2-0xbeac@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:03:26 +0100
X-Gm-Features: AclHuK_Jj5PX-_n156Je1b1cz-aHL6EQj5fE_4gj1noerQIcKZbFTd5LaBqKoz8
Message-ID: <CAPx+jO_-6R2N_Mf0AjsqVa==4fQAf2hoveOsR6RyY8zVxrPbSg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] mmc: dw_mmc: drain bh_work on host removal
To: BeaCox <0xbeac@gmail.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
        Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfXwMfE5LNZxn9M
 +MxGTYhuEhXhfErTDjfzYx5cNPBNPYjf3KIXPSEUDnN1D/0Wvg94QzdSf5Fl+Ir8KJRf4wnqxS1
 GITaHx8hx3V+XmnySt2sDkvDT70SK8u8OVzVLqcwFynDoQbx9UrTsQ/RsSLjtEFEqoW2xQx01Id
 9A6lrZbmV1ehqSvjDytcXyiXMCaR1FlDk80ikEZ4/yaJcN0vjX+5ZUPL3Sx4xPWQFwyTRWd2LZX
 qUxH62CgEQDWG+NRwXiWrb82m8wxSAB6IqQ71bQRKjs650N8oEtkaanVls5XYgIaJ5XxwhXZt1o
 GHfrwhHdbafIl48sQJsYk0ZvVcEKwvo4JhShb1XuZ4z/xexuyktmOfkDxJjZksT/eD2/QS9GkRC
 Koyc20qAqgWfT5AdtGI+Ff68woYnQa7wHm2PTf5mVYYBTsXQlnpy074lmEoQQoBOr0L0S6iGHDH
 8AJoLMT7JdcpRKhL9Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX+g9tNDCcGXlH
 X5/XMvE+w1Eia8ajKkvFBxBw5B1MhmzhKG2Bi1mhehnEUqvBlvGdN2nW8pX6gzeFjkYKt0cCO2Y
 ZHhAhuaKQk16JUuWDdsz6J0otGPeKnQ=
X-Proofpoint-GUID: mjdsRDNAlTsX1mMzY2CDkBNp7MNjCBBV
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af3243b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=J95AHcnkyf1SBl47ZhgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mjdsRDNAlTsX1mMzY2CDkBNp7MNjCBBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100055

On Mon, Nov 2, 2026 at 3:29=E2=80=AFAM BeaCox <0xbeac@gmail.com> wrote:
>
> dw_mci_remove() does not drain bh_work before the driver core releases
> the devm-managed host.  The interrupt handler, the fault-injection timer
> and the DMA completion path can queue that work, and its callback
> accesses the host and MMC request state.  A work item that is still
> pending or running after remove returns dereferences freed memory.
>
> This is not a regression from the tasklet-to-BH-workqueue conversion.
> The tasklet that bh_work replaced was never killed in dw_mci_remove()
> either, going back to the original driver.  Commit 921c87ba3893
> ("mmc: Convert from tasklet to BH workqueue") only replaced
> tasklet_schedule() with queue_work().
>
> After removing the MMC host and masking controller interrupts, drain
> the interrupt handler and disable the work synchronously.  Disabling
> the work also rejects later queue attempts, unlike cancellation alone.
> Stop the fault-injection timer after the work callback has finished so
> that it cannot rearm the timer after teardown has cancelled it.
>
> Fixes: f95f3850f7a9 ("mmc: dw_mmc: Add Synopsys DesignWare mmc host drive=
r")
> Cc: stable@vger.kernel.org # 6.11+
> Signed-off-by: BeaCox <0xbeac@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index ff0b25d..5b47643 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -3406,6 +3406,11 @@ void dw_mci_remove(struct dw_mci *host)
>         mci_writel(host, RINTSTS, 0xFFFFFFFF);
>         mci_writel(host, INTMASK, 0); /* disable all mmc interrupt first =
*/
>
> +       synchronize_irq(host->irq);
> +       /* Stop the work before the timer that it can rearm. */
> +       disable_work_sync(&host->bh_work);
> +       dw_mci_stop_fault_timer(host);
> +
>         /* disable clock to CIU */
>         mci_writel(host, CLKENA, 0);
>         mci_writel(host, CLKSRC, 0);
> --
> 2.43.0
>
