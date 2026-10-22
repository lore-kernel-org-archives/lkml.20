Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792642370;
	b=VEAvG9K2DdI5o8pOxiqAz5KeSiTafuKbCSmJ6YgTlj1iQZ703lPhZ1KP1qc+hmtqLuh+
	 RBRiYzSAqpk0JXoFudbXCZ9uoKrPuCjedzGL/6cvxJpxN5/iKYyaStZh+8gSDhxiaU9Hg
	 8Izif+5s0vzZp/us+oyaTiI0HN+79+HPTS6glzWG5KAb/Nlko4IcwZjTqh2ZN/+wQkG3S
	 LZY1i47+5YkZ79377zAoCko0rvDGn5F4z6nY38pPkeHwImHDTlMMqhQ73pwD3y9x3mmQL
	 vRVuIaJRotxhC4rMM/kQ4rAI3ma2PWgsv97MzwLjqLyicktTTMJy7SLHy+hBX1aUJXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792642370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
	b=QBf/HNU9oB3q//TgSGFVMlKKh0MkE+Sxry6NDzmSs6K9RPKSk5RxpL9uuz/59+qaLkOZ
	 c8mhe3d3+F9Udh3Y9Wu5KxdeNHDtz8WLq3J+1Z8nKiwJIChSD4ZVthTcYTK6BLT3RpLGE
	 FfXAmR1zFQ3/3hP3NOkh6lybqQD/qZvEaWYym4/EDCzVhTMZFDM+Ogrhs2+jIpm2Xl2qW
	 fb+t8/Et2ZLBhH/3DmPWwcKR+jJ2pSViZkNjmSnONtAxzBZYMKjgti4lBGPze8o6PxM7G
	 pgCxNOjQ/GstEz1qViJ3TAO4yEUTBMKEezHa4zpvP9SK9JTA6R1t/CNpoT8g+qjBuog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kp3I4RPG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YOHBzGIn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B844606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B844606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kp3I4RPG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YOHBzGIn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3jjS42297002
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=; b=kp
	3I4RPGst1xBcpDpOejvDpwFc90UDpg/3VqfDe3C7cVxEJGZyCP9uP3FMgVMCJloy
	rcJJ9LyxLzNbey5T5ScvLurlEQvD6f9tYaGyEcxGoPkDLjoJMlQIDz/XtiDvKRIB
	djn9MFbd7owI6BYVETwxlQzyw6c+dzM67HcwIZFch/xPw2kWs0xFAd83hX6E2GE7
	yotQ9smROW6iN0tue04HmyDnMQaDNFJca/ANOeAVm8Rja3J8/9+A7rIZJNIn7fJT
	gbfwVY1wiKaT2UEA7FSIBNDxCWGulzxAeqt9DOs3LqaNt4di+uyTlpUMgpvKL6cg
	fgf+C1KINGYLMm7cXrMQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93brkn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:12:48 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679c17e5084so2404733d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792642368; cv=none;
        d=google.com; s=arc-20260327;
        b=KK+P8DD/b7WIc8emO3tj2LVYEnAPewcXfsC+DSkn8C12StNBuJ8T3lFcQZTk6zcsVD
         C5XexyPe7crpY2uiGm7zxpBfFLkFkBzaEc1/AZ8c8tTdWSK7Mldsckm4i+CDPpqND1o6
         olCSk1vgiMwhdoZBShuxhWbkAZNgc+CNkhwWAowFqi6LMVSweuoe3b063GcaWnhNkukK
         l3FxMtZts0Gcc6hhoMPgJrLBEEu3PRF6fkplHfQz/6cj/LD0y794FwnsHZS+gvwjxuyY
         HLcTUsPLPI0zaUBO9S8vFWsmvBWG2xwIfA7y8SEd4IYlUOsJ8LdEuuYc6C8arYcjZXYC
         /z3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        fh=t8AwOucfLy1K9/BCl3MFLfX4UEiqwYMnZaTF3Tf0SCM=;
        b=Mtyr5BO6BZkVQq5xJbD4JKPp+DEVRJHfZH/8EwPDXu29Y8NZHLouVEHP+AokmbVUXB
         qFu+YzMcd3yDVBN2oG0hB7yKRGY4gINiCFbGOzTYSYgpQKIfqL/xWuspAlhuSbDXXUht
         /TvuhmFDGWjDZbHyASdjNBXwdOMU1+AvzvzZcDwWOZTIqai00bT6tvz+dXkkidjjuuE+
         cI+2BPd8+6WtpIcC0Sny4tKDjTyb4u0l0DjNS/VHEFzFCATLsLcuqKRslZ7Z7wzYeBl9
         n27x1C8DA49S7OIcByCasPZ5RknQJtfzS71eYjybqRknHvQDBCpSkwAMMji85IwwXBtS
         T1LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792642368; x=1793247168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        b=YOHBzGInnaCAvYtChxCfj6xySPTBfbuVVZtAHnG8I8xlVrHpdksMHxIfK5HHKhCgMI
         Kpkw+8kyJHxEK1Y+7PcmC9h2qGZNuc/bUYDWwrxUO34j2am6lrsUGGwphjcPSRznAyBO
         9cdGW0Bzxg1ucHIaaKKDLKbTtPXdGFfYlFFCrI9IaagbRlYoklAVwYVwDyQD9g/Ri6Hl
         jhksmRVsJg7WeahvVYoOTQQbNsRaB2+QRa7OmoRsx6lJugDSJ/jJGiDpFjX0kQU4x/tR
         63zMdDyCnFvAGpZH5Q63BaEexS5yI3gOL2bQO9OYzN7aBT7kGtQPbuPyYkP4ZyX3cEUC
         EzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792642368; x=1793247168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        b=0kVChfXbWDE2o6pZkigHkzoS0xfWB8FB0EEUDzj1XIjBM1v51QsF5zqMh0SvkrEGev
         F6TCBh4lxGyjTKQB27r84Jpu15IefoBmpCfbJA7LDpzlyPP89SBGnWxJYRgaINPdnwPD
         5Ox2dohGVWyxWV3+aCQnfvZNtgJ0x3GZrgMNHhYCXPmoAsXFMn3bNDuOf6lQlL0obfqH
         FYkZO3fQGm6JY6gT+0/xcJiRCWu17VLzZ5SxyFFugtmT4A6+SVc+bW39tjMpf3vO56CI
         g54mLuEySaWOTbpM3t+1G5CwT7iwtyWLs3Br6kcnFobp4dH+uX5nHmW2pLP+xuezTt4S
         NeOw==
X-Forwarded-Encrypted: i=1; AKwUvBz42vuEy4mmsZ+sdFZrcZUaJY93a1KLqBYmnXgcjtEVD6mbjZ1xyziRcz5VQjhfJ7qJkpj5lh7hoMjIJHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTZtDHbmYwv6YFpSDnc5yK7B471O8NAezkCQO9Blid+5WJaGea
	aF1xIDx8jlLJhnJ0YoWrTvb+7y4NCxkW/nkQ/PMS+ls+/OPcyKYMScNxVjAesG5TqLqham7OgBn
	jPyHD7pa4ZQATP3oksNSn6wRZ7XQGt1eNn0pqgD6ABZ6n0dQl1YqbO2xzpFOW8ske/EMs6FJVZ/
	RlP055mJdGTBFlTjoKtZv9p1ZdPCFNir5m38Lk/ALzvA==
X-Gm-Gg: AYBFou0xdBD5oEJ16MFhi7xSfks5q/SPaU+HI/Qv6wrvF645AjAYYmRrFVtQLRKMrh9
	lOr2T7CIr7lCiRKjfoOpUqbFjFvlRaUFL4rCsDRbohrppKxMwQBgaRlGX8Vsz12K1gA8PeZaeE6
	0QJxw491dG/QgIw1PvHzaH+RbBmdpzBOgZqyiGyXPREtY1Lu6S0OMCLi/JfNs=
X-Received: by 2002:a05:690e:488d:10b0:679:a898:7d8b with SMTP id 956f58d0204a3-67a0e4bbf6emr1062069d50.35.1792642367575;
        Wed, 21 Oct 2026 21:12:47 -0700 (PDT)
X-Received: by 2002:a05:690e:488d:10b0:679:a898:7d8b with SMTP id
 956f58d0204a3-67a0e4bbf6emr1062061d50.35.1792642367081; Wed, 21 Oct 2026
 21:12:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-2-52fd8be98dcf@kernel.org>
 <CAB19ukEkAOMnPpi2jVFz68GZ_7cwYmNtrBkxnfEJtFcPb7PJ5Q@mail.gmail.com> <atPhE6rF0Uz93qF2@thelio>
In-Reply-To: <atPhE6rF0Uz93qF2@thelio>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:42:35 +0530
X-Gm-Features: AclHuK_KjNarSdeGtOiebAPfz9T-Tt_QOkpNIpxbMPcQ9dxWkRZQBbqOt91xNeM
Message-ID: <CAB19ukGGcDgbewvdMf-TBCYSpN3ksvbU_tJSJdRx0-EKb4Ze_A@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>,
        Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
        James Morse <james.morse@arm.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Peter Newman <peternewman@google.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: EIC6lkoDWimoFt1SWzJuwws5O3PO36zQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxNiBTYWx0ZWRfX0cJMsg/ZjIdQ
 mETjsAny9omnzES4O+ALR3OgKBPl8+jchsQSAi55JjPI+0s9jITO4aN6w6Wynz7DrEWlhf6Qx6o
 WyouVY9K+Eb9X0r41GlVq9NXZypTehgchaToBSGWss5A56yQwpTy9K+J5mAmLQSp+10L2OL2nvX
 4dmVc7YH/dpDcXkeLHlm6ZWkt6OTuPhJElaC/McWWBQGeozYOuNEzeS8vSUSof8NhJGKxB6b+N0
 +MZ/s+5syWT+MWYY2o8pRHjtM2A4jyH5B2gMfVOsaCFkJsgHZ98b2iujDa60VvAiIH4wlcAEyCz
 bezFyIruyhaUimGUB/2+ISpEWjXAEVbPfI7pTTZwvYjnj1lFHOt4U3GM8ofvWUjrlU7wJHET1ow
 miKY7kBJHyGq/Vn60wiaubKbehjp91gKVv0l75/j6/b0A6KeIPXdyWZYPojamrNJMdzJ+nkYC6P
 hLRSiI6xfwYZztKtdSA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad98d40 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=IpJZQVW2AAAA:8
 a=jDNYHvWEAysQCaIWslsA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxNiBTYWx0ZWRfX4qAzItEk/kV1
 LWLzTtUtffqW+EYs1ygXeRFEihAAdNT3qIPc1GcyE7jDAccS9HknOM/Ok5Ntl2aAMKnPCYXVX7p
 afKGMGQp+WZS2gLkSvoKdfE535BLbh4=
X-Proofpoint-ORIG-GUID: EIC6lkoDWimoFt1SWzJuwws5O3PO36zQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220016

On Sun, Oct 18, 2026 at 2:26=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Mon, Oct 12, 2026 at 10:23:57PM +0530, Sunil V L wrote:
> > On Sat, Oct 3, 2026 at 12:45=E2=80=AFPM Drew Fustini <fustini@kernel.or=
g> wrote:
> > >
> > > Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
> > > RDT_RESOURCE_L3 schemata.
> > >
> > > resctrl exposes a single capacity mask per resource, so when more tha=
n
> > > one capacity controller backs a cache level they must report the same
> > > number of capacity blocks. The same holds for the other capabilities
> > > resctrl exposes once per resource. A level whose controllers disagree
> > > is left unexposed. Other levels are unaffected.
> > >
> > > The set of controllers backing each level is fixed when resctrl is se=
t
> > > up at late_initcall. Control domains are created in the cpuhp online
> > > callback and keyed on the onlining CPU's cache id from cacheinfo, so =
a
> > > CPU that is offline at probe time still joins its domain once it come=
s
> > > online, provided a controller for its cache is in that set. A CPU who=
se
> > > cache has no controller is left out of that level and a warning is
> > > logged once. A domain is published on the ctrl_domains RCU list only
> > > after it is fully initialized and brought online, and removed from th=
e
> > > list before it is taken offline, following the documented safe
> > > traversal rules.
> > >
> > > Assisted-by: LLM
> > > Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > >  MAINTAINERS                      |   2 +
> > >  arch/riscv/include/asm/resctrl.h | 147 +++++++
> > >  drivers/resctrl/Kconfig          |   4 +
> > >  drivers/resctrl/Makefile         |   1 +
> > >  drivers/resctrl/cbqri_resctrl.c  | 831 +++++++++++++++++++++++++++++=
++++++++++
> > >  5 files changed, 985 insertions(+)
> [..]
> > > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_=
resctrl.c
> > > new file mode 100644
> > > index 000000000000..f10a24761b25
> > > --- /dev/null
> > > +++ b/drivers/resctrl/cbqri_resctrl.c
> [..]
> > > +static int cbqri_resctrl_setup(void)
> > > +{
> > > +       int rid;
> > > +       int err;
> > > +
> > > +       for (rid =3D 0; rid < RDT_NUM_RESOURCES; rid++)
> > > +               cbqri_resctrl_resources[rid].resctrl_res.rid =3D rid;
> > > +
> > Why can't cbqri_resctrl_control_init directly use
> > cbqri_resctrl_resources? I feel this initialization is redundant.
>
> This is similar to what x86 and arm mpam also do since it is important
> before any resctrl code is called. for_each_rdt_resource() will get
> stuck in a loop if the rid values are not initialized. In contrast,
> cbqri_resctrl_control_init() only handles the resources for which
> cbqri_resctrl_pick_caches() found a controller.
>
> The initialization could be moved into cbqri_resctrl_control_init()
> before any early return paths but it does introduce the possibility that
> rid initialization could be missed if cbqri_resctrl_control_init() is
> ever refactored. Given that, I'm inclined to keep the current structure.
>
Sure. Thanks for the explanation.

Thanks,
Sunil
