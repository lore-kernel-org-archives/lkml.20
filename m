Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793875453;
	b=yxK5pPnO08VTOWug3aY6+riwq53Dc9a+enSudGH7EZT8/+GyujL3v2fX4yC+jHb1VVzR
	 r1mSx9+7L7a7vF3sHMX8gv++a6pOa8L3lg9GGr7qYqWIkcxaj2iYK3+s+ArNZj5TL7nGG
	 bzvA8c6k7pzoa1QYsqNvebSxyunrJ/BVYskUxd/JoZcU4/DE046eqP1UlB9njR46CXn+e
	 S1OVYH6AsdDo9+iIFsvN9g4P4Vf3yAEeIpDherc+mKxydZTS435Ef0/bSty6uXEqMaiL4
	 7ZhEBWXH36laq15iZIgfYHaVGk27ji5Baijw1De3PXdubhEjxBYc8Fk6/W/FWRlr23A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=;
	b=KVFAmX7rjqaiun4KhtVoXilJ5t+ypUof6vFaYfx++szaIbzgFa7xVqvVU2uaVHQxYRnZ
	 ZfQ1z5y2zrF6u71ywp9XkdjVCtF5KoeJcJWXuXm7fSNReT7H+/kuTYc0H2gzyIF6lr59B
	 5rGpTkfkKzgdTsg9cT2Y0qokNiMXQItZS1hL87EB8vD4BlRqug+MRdSB59nwcwzUY2LyQ
	 JLYEijVOTqfPvSymE4FjRlRBkiCqZe7/Trjl1YmZZPL3hJ2/sYRsnDBPtbVW+Snnu1uKa
	 SQl19kGlnjBiw5LOF6aLw377IQ9kcFXljulmu8wr3oGtJba/KUD//De10qULmAtJ8vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPGeVb7B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gG1PvT2i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7B606D821
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF7B606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPGeVb7B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gG1PvT2i
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ai3gp1583132
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=; b=iPGeVb7BdAkbKkml
	kucWy2KtJOwJtWPRILOKbGgMeGzqd7HZsNS7MqkLvb2XsSsEh5l6QFeHhUO1H2qo
	DCqD41pSkVqlIdMB/ugOpvmTaC73582Qlc+J8uDncjYQrFnlibWZ8vYtZAixYRGJ
	ckEr+dBbOO+R8H30dJr7socVsuVNfG/+C33m/+OapZ+5P9NWsFO1SXrb6zyWliQw
	iXPyFoJxtpL7TKgpSV5Cq1dG454acXFP/Or7Un3hgN169Gaez6j4gZmKmskQo2uC
	ZahDH46LOf7UtvzGMFfG8pwTr2Ib3qzv10GHAdm4dpocvfUSFoKyVE4bYGnVr5Bb
	WOAygA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraar01c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:44:12 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67be4f2f42eso2866848d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:44:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793875452; cv=none;
        d=google.com; s=arc-20260327;
        b=DDOLzKAE+CKK6cUl2CO3kEECZATg82VSuC0vtL3zrNOGcuNPKJU7iWjLrPk7lY3fH+
         llOGbMayq4gwTLTJ0erStZWChoBH7KP3rmZVcTrQe3ufFERvc9dAtgmOoIX2l3hnbIDH
         q8lCA4UNvyQUh/cD1tI3BBsJF6yoXCIcuXzMybq1Kj5AtNO/NySJP+izb9JGEVaMtUJU
         91iO+iXV397ME53mm4begTo1kXEHtBEHt/Nt+57+synXbhBnwgUU5SYvY8e2Xk2/IIT/
         IMpXrLtxbaVIuwTnbl+PIL93r2Gyq72sqL/UbVsaUP7B5RqgkaAzEKMr82uuzMOMkOTm
         a1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=;
        fh=cQL/5LLe+mdui6pJVr7RR4hjoqVOVeF5BO2AjZkgOcU=;
        b=Nh9y3lf3ZDdEQWDaD7uWDMR4VTIiomHn5BTVVAGHnb3doxEnrsfcWzhscC0ENobWTd
         KJmjyt018pZGkTPodxU4VKOhBpBtKhuQH2cFYOkq8FLnGvN5r2qetatwHQ7lZBgqIUD/
         W+xF3fcrxJSFnFmO0zTd8CUOrFySHkpGnQuwQxAmKaztes/X5K6o4Ixd1f+Xf+7ksxwi
         R5tL1cqWyB7QtjWG5+FP+EycW+C6w1gfEKZoc3XbX38yBTYeYBnQZjPcfzJef43JuLby
         koSlA3K1r5Xwbnf705576rtKb2GwJ3uuX7csYXC8PMjiiJeEy/N+6qOO5uvJBo5BHpAJ
         19fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793875452; x=1794480252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=;
        b=gG1PvT2ituBZDAgVvKFjCqgSy4ef3Qck55pb9CBqcFUjmGh/m+Bav2UnfWCtlNu0uj
         NfnsQ8q4rQRQ2jjhCR4pZJ7GYhc0HJo4ccGz5lKNMCbscMZNUU7BvPH6/nQfTmMkLPgp
         ijhkFrmmfXy+5SNElFq82x/04W7whFmcq5J1Awk4IhpK46gMuM0WeOJnt7LLCFfBSJud
         zuFTeHrKtZKhMrzuhcyS8g9qaKVoxMVcqI5SXO/1tpKhsKVZfmZI1eg/T0OI0cd8695a
         GMoFiY1vDScmGV2wnpBY2JkIdolmyYmSVyGm4HC77Ca1R7GH3F2svavKRuASj+K6M+W+
         ahug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875452; x=1794480252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=;
        b=dtTBucea/FliHlMIGMXB25Rq5WZE1qrkUi+Qwiq2nioIOdSlA8nNCxJ8H/kns4VjSz
         SWNJwiiN4mpaBZ4qU59h0cV3WJK8PKssOmaMC47ZDS0DIKiTJlqfdUCmKjUux7icX7vL
         BhbAvP1DjRTwT/4p1oaLE1K26hRunNsZ+zB1gxnURhi7n0rgzp5O5W7Ag91YwZIyFz8A
         I0l3tYvUG2nRoAv/cv/IH2v2hvqGfPwARIxnxPLZnE1eRfu12PdS5qdlYNZ3+v3cHnzy
         UTci2zirf9iqhwpFFD0THQ3hAv0HFsdfCxJ/6wuVWMc5GqSmX1K7RjzPHl2ngoEJW69L
         W5cw==
X-Forwarded-Encrypted: i=1; AKwUvBxCjL3n36eXee8e0PWozaoWQbORJTnkSvRyrqgH40g67O7CGgVDqrFCAUJEY85FQmkkkAU8v3TeKvTdbLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wTQNMqSnsQ7Nj/QBnz3aDJBzghcOfSFGKUwKQbKaHj9uURz/W
	NOuHdc+3+hZJQE0JMqU5V0ZPlnhpumlDeGJaZVOKI9OWJCM+nC6GYau+R14IwRke7d4kLSe5tqe
	O2GigTgD1l34N9JqdTYICqCybhjHsxiinLSxGNOwaUD0YJBPmaSMzRdCE2U/LCtwfiZAHXG+aJe
	M3D2X/MgWDpT51HiKQe+H5yjX3IpndYGaoqcowKgqcJQ==
X-Gm-Gg: AYBFou23tQK3iPRDUJq9ERtHsrwFUpc7AggcgdBAcwBr/JKBy6NT0bOVwvQudl4cTZX
	IDnmXz4NYV2DGF9wZkzesSwvxwnLUJ/dhSWVCYntocB0JqAWoeJLg77qu7OV9U9HequoW9pV9Fr
	66kn+u0wcPiOS8aLGdR4/6nlWSWbelpq8iOxwDAgCceYIQkhI7j/UvE2par7EtyXK9BrPcRU51Q
	WUQ9UFUDfYfCr6eVptUU8xzW39sYhvw5Za3NDQ5
X-Received: by 2002:a05:690e:4145:b0:67c:a2c:8240 with SMTP id 956f58d0204a3-67c0a2c8545mr466488d50.78.1793875451492;
        Thu, 05 Nov 2026 02:44:11 -0800 (PST)
X-Received: by 2002:a05:690e:4145:b0:67c:a2c:8240 with SMTP id
 956f58d0204a3-67c0a2c8545mr466481d50.78.1793875451076; Thu, 05 Nov 2026
 02:44:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com> <atYDodGDc3z6Qv4f@sumit-xelite>
In-Reply-To: <atYDodGDc3z6Qv4f@sumit-xelite>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:43:59 +0100
X-Gm-Features: AclHuK82I7GOQ461EBrvJUf4LJ_kffL5_IxDC54rT4pmONT0rZ70Os06qoD-B9o
Message-ID: <CAGgiveW5pqputgg6EcOCEGEVcBhyjrPUZ_8WKD656tWnw9sMcg@mail.gmail.com>
Subject: Re: [PATCH] tee: optee: allocate a bitmap for all valid notification keys
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX7V+I3j4/XglU
 pu/wx8a4n+/yju4kYId6U1jnmYuzPmiPMjNwOE54LHoEOv2sqmTZIOUGXvh9Awk1rAJJeNgVYtV
 ARlq47mls8jaNliwfkejKMa1a1BJ4ZI=
X-Proofpoint-ORIG-GUID: eSyVDH6zdH6nqsVKaa6EyoWFAXFdmPFP
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec5dfc cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VaSOubSYdYwWsDXPSwkA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX99L5s3llb2mZ
 rAxAC50o/kAZPgkIiBWijF4Itv1/etSUOhuYVEXpbUoVaQtTTERT+QkyQpakCDCrqrgltKnQRLl
 Zns3uN0wN08jHl6RSwbSnU3K1YSe3Q2uGFdOivx5eWtwf1F/rrVxJ8qtp3IdCeB1nNgGnI09atC
 3Utu+e0/39G9ESmCsQWa1nVVMyAcxMLi/LtBhyJjcVochhaLj1b8t+NV7/fUL1qJHTNTakhA735
 FOGMxHiARq6Pd4/ldXdo8+W4ACOy14vgf00clIqrszCRVVtYDykXrL73rcu5k1LYyeERviRcWMb
 S/SaEPsi/jdbwYkrxB0yDn81t3JUIX8YzDwbuxat7MNfBpt+I1If6YflPUjKdaI5DKpZtLlmVN3
 FMuXZkBf6yFcyo0LZNGepgBgnUSLg2hIVYIyDmClYbbZEkFY8BS8CEd9xrzT9ap3t6RYZp0khf6
 5IXQrvAT7nyN1hbUWRg==
X-Proofpoint-GUID: eSyVDH6zdH6nqsVKaa6EyoWFAXFdmPFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050042

Hi,

On Mon, Oct 19, 2026 at 1:48=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Fri, 09 Oct 2026 at 20:19:48 -0700, Amirreza Zarrabi wrote:
> >Notification keys are checked against an inclusive maximum, but
> >optee_notif_init() passes that maximum to bitmap_zalloc() as the number =
of
> >bits. The bitmap is therefore one bit short. When the maximum key is a
> >multiple of BITS_PER_LONG, accessing that key reads or writes beyond the
> >allocated bitmap. Word rounding masks the problem.
> >
> >Allocate max_key + 1 bits so that the highest valid key has storage.
> >
> >Fixes: 787c80cc7b22 ("optee: separate notification functions")
> >Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >---
> > drivers/tee/optee/notif.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking this up.

Cheers,
Jens
