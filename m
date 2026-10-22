Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792673971;
	b=Y1bO4YPJW7aTKzL4gYk4ALEQrNK8dxTOAVrNtteyiXMSYC3+27HYn53FKsRY2Iv3XNJw
	 th4FnCjatF4K/ZiHhi56yTgqTGfa6RMogXu5N6t0EdbW+uedFeG4Y8prJv7CRouA5Yhso
	 xOj75yFH+zBoL8F9F7T8eyw6UphzkOPZMovk5wr5bn88efzUPlJUnCn72Z1Eu52fcwfpK
	 824hhHtRwE/uinMUFv7ybuUsDAmW0QNCEkoYb2SYTUzO8YCnGyfBlrctpyr61GXmWeFvZ
	 bsRxao0lNMynQ+IzH8lfBFylX9Ga5Tg2+AN70qaqohWTioyNPpGACNm8xJ5SgwKla9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=i3RrBZvafk7STshfEi/3/nHJ0vPIDyyjkQrU7+4cVYw=;
	b=M/fMUoHcbLRtv5j9rTbUKh+5CFd6jGIcM0LI8/4SLWhSBGQ1qweWByw7/ieWlGEmAyXs
	 5DVc7aZuMyE6GWhFmzbNSVDTqpLN4WUqImaoYSlF2w2KNpTleA0VuZ2L/oFPCJRjGjxnY
	 pU+wt/E6N5jzddfSJQ1EbfWqT1jam5ZiVcQhe9NAvWxEivq5k0vJ+T9tuSJ0v0cinLF4L
	 DzHT33vpD2e0L2wCz9PoXAAN1Bt4FRFX0eflBm2PYH2utpe/utAY91Ligo0C15d50uc3F
	 ppKggQxqcpRGX8plTGDoPd9rFekHwZRiIofbdUDDlwRa6hg1YvncHxytSvPlMopLqCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS1S4Rd7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=df0MR73q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61009606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61009606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS1S4Rd7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=df0MR73q
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xp7V346099
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=i3RrBZvafk7STshfEi/3/nHJ0vPIDyyjkQrU7+4cVYw=; b=iS
	1S4Rd701bwyU4eTACNij+pP3wVjPlQ0R5+icSy77zeHC84qAsQTtG1U8pry2bHZ/
	XWt/2cidffKKZrWVdifcNquWxa6HZwl3tQpCX3MWRXLi8cRbRmDidaeWEVChOWSr
	txaUojVK1GatN9k5JAf0ICAokaoupfiCpDDy710idEBGy39hTk+YrgxqgjLp8US6
	FBVs74bEFM4Dzb1rlxPQF/+BXS9FtkywDnuDnIUz1WAlzBvcpanJLvMvnVc8Jpd1
	PmxatxNWTp/VDwQkNmGoymiBxVSw0KhwYL1yUmrAqza3yp0Hzw/x92tp8AKpeoK5
	EpnzTFw1Dj6p9uAPg1Tw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93dbemw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:59:29 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46509ab0149so2309171fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792673969; cv=none;
        d=google.com; s=arc-20260327;
        b=A7wdLG8R3afATZ8rDEZ0OtyjGccU0woNH5bh4Yv/XwTeRSdX8yRizHdLGr0znuaIoK
         1/zgbGgkL4HIkm7k2aVqK5dwr2RJKWokd9HEElglOAwiNnhj+CSA0iOU2LeDQr44wPEP
         1iAYb830NVF41kFKyrV9UyTGagBqjhFIcoiVoSa7CDIYMHvQ6JAHdVNHUXtP7ldkxP0p
         fyKjSt5t9gwADhY35L7fdacWTYkwRfAbzs/5KhkObwPWf/pJSbZylI35DcAdcLscnlcn
         HL04thn5xRvaC4fHF5Vzy0xWyQ2CCbGcbHLG9VUxu36sYrBQFf/9INasGVDtpxIv0pUr
         +Xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=i3RrBZvafk7STshfEi/3/nHJ0vPIDyyjkQrU7+4cVYw=;
        fh=cA+rVbPECFtiCRLmx7xWnjL+Tp7gxP3uDj2C3yMBVg8=;
        b=JltL9JDB1Mj2PYRdOLwe53TwRLpUyEnDuw8AbhM3BF2r8cHJzOdMdaVEbm4Kkd9E9s
         scyYboK+ksYysf5hsU7YxFa1egpl/1ujVZbE4AXrsyAY15w7tTWRK7pamkYT2FEc6Q3b
         LWnMcHKSltF2w1shb7K5yvjYEDLrYl52nuczx30mG/Gc/YrPZzihtRvc70sChC2tUjTF
         cF1ryGNR8wbSquIv4Dt9IJNp4wH7toQYCdp5ZCtzoQr9zlA34vhybcjrf6HpqXkZzPwt
         0RvI+bRXU5fJmqah+D2mhIkyagORWBtp3GaWpOEb2HYjAysXireLcaVWSFuslo8cayal
         SXqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792673969; x=1793278769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i3RrBZvafk7STshfEi/3/nHJ0vPIDyyjkQrU7+4cVYw=;
        b=df0MR73qGVV9dStf2JlL8U1JoaL2sWUoh0J6CXM/YXjOuZ++MwgkMpiSZgK+TjWzZN
         iHQwDgJYrmw1Nvw1FKdH0RWRjRc1ZtwOJzrZBBgsKclICIk7Pmdg5BobTtc7z5DgaRsF
         D1M1GG7ycdPf5udax6EasqXf2TzgIf26gsKs77sZGeoGv0+26bRRkd5sHRRpDHScBdFx
         8vZ8+N295J0KCqTm1gou3lkmWM/2wKuiKWrQYRbw7hLYZnx88batqhq5rj7RbkuJ2H+0
         wdko595sKcHvdxCL3LD72B94UmFskqBoO1EbjRROprXBRC7zDTHx9m5YpGtN/MzQ7p/Y
         8VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673969; x=1793278769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3RrBZvafk7STshfEi/3/nHJ0vPIDyyjkQrU7+4cVYw=;
        b=d5B3i9UCpTBbcncbccLjwBZPAqcm3VVJ40YRZaFP8bnlRqjEq5NAOdP2M74sTNYJXu
         n3CpP7by+CQ0nOtm1/wNUzgTASLRu5ouAQ0F/4hiw1gzaXrQ3j21etxcYydZOVx0iHnG
         QG16V53gLzIGRbvmT2lyLx3fZVH1aQUA9A/ldb5Nzj6KHSuEHJtIsDIY0Y2ZaYjN/ptU
         BMpGcwqPvfiFrUC47Q5hkYndaklYL418FsgkHflc8P7N8QyUmo52RvXNs6wtfooWRtBI
         Xtetoovgs4y91VOfO56Z4Rf+lHpTI399cKX5ZanmAAdS//gz4A/yO5KHtv700Hwm1qW7
         bp1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+uPyjF2QoZCGzN347SDIVW+f+gYstvgG/hf3YMJRQJeeH9NPCMQIANMLaqyN/s7TZPop0Qzi58s3bxeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1ks9J9evl7qspeIxsipv4Lecri6GBxiXzT4eLVvcnMljwB1rC
	ymqAQ57VjIn83sPJ/pNW0u9Sdnp6QYYp8pQ7D401WW51l5RuwKSkJzdYFX7Y5F8RhYzkIDJwu8F
	PUz58YZURs5zV3CZY1kJMtnQj4k9fCA67MZ2fw+8rPcj8mFdcrvGhLr98BTUcelJ5AISS4/DXfv
	y+Ajz/rJY6dGQJlmeBOdJdhl4uqKuPKv5dEocz3j3qcA==
X-Gm-Gg: AYBFou0DBivo7nHJk7LX4ysqs3sW9KkCJoGu2ciVfjJCBDnWeZ/FRhhzAc+92UC0GME
	EpaUBGllRlZGNYf5VKnzgYi7X3yqCtuRg2sxgYaN/2K1KckDNEPGa26kb6/GPwyn5olkQgJCMdK
	K1Imv4FvkPx2g8Y5lKlanIkfoXco0v4Z5nZzsINCkDDTzhIRcyqUrZUMLuxA==
X-Received: by 2002:a05:6871:eb0f:b0:494:7af4:9556 with SMTP id 586e51a60fabf-4a7dbf46478mr3354757fac.6.1792673968645;
        Thu, 22 Oct 2026 05:59:28 -0700 (PDT)
X-Received: by 2002:a05:6871:eb0f:b0:494:7af4:9556 with SMTP id
 586e51a60fabf-4a7dbf46478mr3354750fac.6.1792673968289; Thu, 22 Oct 2026
 05:59:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-14-robin.clark@oss.qualcomm.com> <1c8f4222-e7e3-4b10-8826-60de6dd89a61@oss.qualcomm.com>
In-Reply-To: <1c8f4222-e7e3-4b10-8826-60de6dd89a61@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 05:59:17 -0700
X-Gm-Features: AclHuK_j2peSj2EEy0C9v3scBb9GJLWZ-SVmnhb2kk1zdZCUSfdubcX9VfE4n8g
Message-ID: <CACSVV021btWwF5a_S0YKs21uF53TZd9uMwuk5M-RQOm9JNmtrQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] drm/msm/a8xx: Switch to generated protect regs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MSBTYWx0ZWRfX3WAcbFdBTp7B
 Q7BZIrsJeK/P8X2xaJKYp9f7xV9/cpTPmGmj43SX8jN4KLLSHCGss5Pv4yqyzcRreOShZaiV8J+
 T+1x5gRtKDQHeySXHqhTDmLf82H47tc=
X-Proofpoint-ORIG-GUID: hgbwtBAmO7fhqI-k5Amzew4_sIePpWE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MSBTYWx0ZWRfX7sPt/lQJ27rW
 US0MpxZ4TrzYbT1zH1RcgEdSfAiXX9GSx4aYzNX5FQtKFwrRzzNmpzerruicNCZxCmI/J5ZS8CL
 JLX5cvQYcWcM1mTZGAbvk3bc5o7v4OAv2/8JW7I0QMRcdyY2dJsin182m3AF8JoBtUM+/Q04M3Y
 THcus3f7TbCzYEIhc5NGOrh8gcWYgl7SVFow57f1kwKFaVoqbkz+BGQGHtPJaKBvtu3YW+Zz5v0
 NsMSYu67mEXCOuTJYdSV+1R6kEC0jTbWRwEMMiScG8X08WB7Xq9RwzE17s3AofOPLEossuZ445k
 wLi/uojB71HaFmJsGXmUW2k0x+ECKMqdlQwiNkiQ5HKXWrQLwd1igp94dNOsVgCNDm/celGLOLq
 dz5pXGxPkkWTt/SXfwh/Ec5+9E4dINVaj5KtVBUTXy4rDm/qdZMfpqCdKyioAE50yu4j+CpCmPt
 BlhfbcjNEOgST7L2aJg==
X-Proofpoint-GUID: hgbwtBAmO7fhqI-k5Amzew4_sIePpWE7
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ada08b1 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=pqyDHntStqP5vayZH24A:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220051

On Thu, Oct 22, 2026 at 1:27=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/21/26 10:41 PM, Rob Clark wrote:
> > These also fix some perfcntr SEL regs which were mistakenly blocked
> > since we previously just copied the protect tables from downstream kgsl
> > (and only sometimes remembered to fix these).
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> LLM summary in case anyone is interested:
>
> - Almost nothing carries over unchanged. Only 22=E2=80=9334 entries per G=
PU match exactly, out of 47=E2=80=9364 in each table.
> - The generated tables use finer-grained ranges. For example, NORDWR 0x86=
00, 0x1ff becomes several smaller ranges (0x8600/0xf, 0x8700/0xf, 0x8740/0x=
bf, and so on).

Most of the change comes from exposing perfcntr SEL regs, which was a
bug that we hadn't noticed yet.  (Kgsl blocks these and requires ioctl
to configure counter... but upstream the kernel just reserves counters
and UMD configures them.. so we can use the same counter to measure
different things per subpass in vk)

That in turn required some optimizations, since otherwise we run out
of protect spans.  For example skipping a UMDRO range if it is only
protecting regs that are already RO at hw level.

> - Several ranges that were RDONLY before are now NORDWR, or the other way=
 round, and some change length. Some ranges appear only in the new tables, =
such as 0xd200/0x3ff and 0x20000=E2=80=930x27810 on maili.
> - The generated tables don't reproduce some old ranges exactly. 0xfc00/0x=
1fff and 0x3cc6/0x1fff, for example, are not in the new tables. I didn't ch=
eck whether the new tables still protect that address space.
> - count_max goes from 15 to 64 for x285, a840 and a850. The old 15 was al=
ready below the 47=E2=80=9357 entries those tables held. Patch 13 also adds=
 BUILD_BUG_ON checks for all six protect tables. Before, only a810 and a830=
 were checked, so the old mismatch went unnoticed.

yeah, 15 was a bug

> Also one robo-worry:
>
> Unexpected: on hawi, GRAS_PERFCTR_TSEFE_SEL at 0x8610 is still
> blocked, because the new NORDWR 0x8600, 0x10f entry covers it.

-ETOOFEWREGS but, since mesa isn't using these counters I had to skip
exposing them specifically on Hawi.  I have an idea to use
CP_PROTECT_PIPE to give us a few more ranges, but that would require
some more changes, so skipped for now

BR,
-R
