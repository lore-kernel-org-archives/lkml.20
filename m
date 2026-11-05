Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892487;
	b=UnULytLTVWLjs7nVj0TmcbpUFPx2ZimlNGrq4H7Nua/l3kKik3eU//eUAU7j/c/jIjoZ
	 8y7+iqf1TI5EuyMIAGW+Tbq6k77Zjb6XFnMsFYt5Rx11+w8Pq+Kz9pqX694uZf6j3VlME
	 5Zo8WtGIT0TF62tP1EZ8B7eHZ6grHZeDfu5eio0TQAI475dXEXradJnd8u3xKi2NcOck5
	 YZRQU9ekVeSekGFiXvTOwqEMVtCajSvC8+Nu0S6xmQSoxgANr3MC2EIOPlZqxwEgEMAQi
	 nuzIg6XHNUZ7vEQhUhCWOAIruDCxuKMn+mx2ldJ+BW6d2kWSQXnnA+phhB8yTBrPMaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Jpc3SZnRBCGFVTrfa/OmpovyQbm7JH9w6IeqIWcWtE=;
	b=WgTTSuy8MyPxCXBShexKDrdgh7vEo6U8Z6400z3eC3mrBj9p9mtl61Y1jbpmnW3n3AVX
	 biMIsbWkBoAr/bk10yR0gxZZuQmYiisHbKae3uaUNUqv38bSL+JMjw+o8UP5HpeH7WS4x
	 VpMN9kGTijsQRAFfpN3OyMIB4lWqkO6iIjBzumMjPtbugOL6Em7kXQvMyIXmka6YATpW9
	 ar7TrLLrlS5yKFRVJYjWo5uDd0CZlVl3JF12SKYVe+55aeIN+ksUiLb8D3JiPC2qrnFMe
	 N/n9gMDEb92qA6cp++Alt0sfBbW8Cj2X04s9eYhttGzzx6TWg9aaaANwUMzPQKb0Qhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erN7RJQY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfHpVfGQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21891606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21891606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erN7RJQY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfHpVfGQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ8LJ094492
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Jpc3SZnRBCGFVTrfa/OmpovyQbm7JH9w6IeqIWcWtE=; b=erN7RJQYI30JCmNw
	9Fl6qoz02sF069X1xe6XsfuVz4oD9WJ9GXDu9NPfm4LmrJFqKCa2Xbr467Ag4EG1
	EqA2aE9m9F/OUXqV2Xa2TsJc2D5NQjBWnBFrX73Ew3vmKrT2QWQ9HoS9PHKxCy/j
	CE2sR2fR2cE5HFWGsWzFFg2bhGOoCvSmgk1GJ3QhbA2YyQRO/zrBHjywndpsqlOQ
	gANEbxGT0c7fwDpQch0+Jc0PoP6nFly4TGr0JFaRhSzEZWhDT1p18OldDpCLvhH9
	f1sQWaHgDSoAkbc2jwGPMpAT2nrj1CttILQFRnmT93JJf7SolyiKwPZh8/N6fxNa
	j7Nisw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43jt6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:28:05 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67a4d0ad629so1837406d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:28:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793892484; cv=none;
        d=google.com; s=arc-20260327;
        b=Kj7soVc5PwhpqVbTqzKnHRRhVl5ZtstSSFkr8TJ7rRKBq6GXFmr1+mg2MNJE40CPIS
         FB6StpET7jgQoX1ypcC2swXXPOSUqpIYpRo1CWS62W88i5/zUILjwZXbpy5D2LKgs48s
         WE2pGmDp4n0XSssh2+xvWhtexKP/Zsq/Gsa/Mz6skj8gbTnTNXNRI6Sckjif5r9mjPRl
         YhKw9jFxisyVBuOStwddCCg6cJuKsgLTmMlckPkd2bOtUVZ042ow1rkwxU8RUibzIgKu
         EMxpUgt7p/ST4vuTzAEGCSqvjhcMNn7z/FaNu5cX7H27II+/u4R6PVQ5TxrE5gbOP027
         QKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Jpc3SZnRBCGFVTrfa/OmpovyQbm7JH9w6IeqIWcWtE=;
        fh=9Tm/iwq66gj53IoLFNNgom6jnN1RHrcl23McI3dRdus=;
        b=Kl9amsf5129OAWUbJyenvxTCdzw+FUv0jzw4ibewsBkvOgeme9SnkjFMBiDNqqEPTp
         mU4S197aUPMcn6KUsqY6gk79FJBygab1/c1oWsqukVjtVbYJWWa4P4Z4kAH5G99F2gU5
         sOIF9IZHD0ipZZDQyO0Hw2C0qk7oa4adRMFqu8v46QTJP7Dc5czqwizAAs6NZzrizPX7
         Jg2944gZEQW8ELX3C0oQqyj/K5TaFW7uKY+XL1PAFRN2f0/rBhXzINrDUV+RS+WZhLoi
         O3f6j39X9PWKoMsqYw8jDh7mldnbrNtC8/x/nLgsmbJyaH0nJYLgc1iYWvBfB8t0Pqxl
         rb2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892484; x=1794497284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Jpc3SZnRBCGFVTrfa/OmpovyQbm7JH9w6IeqIWcWtE=;
        b=UfHpVfGQYNqmwq28QWzKWpOH/WcE5LUBAPWfvy7nIkmCqJ6jCYJ8jyw5tIbRWeps7M
         q+dVCr4vFysPXwAKFxdryVNOejxrNi05XPerWRE89qcz2UJYsjRP70ymIvG0LhnGV1v8
         1efYNlDnmC/i0W3gdbyKszaSB6yKPvt5uU5HtjHKauX1D8GpyAMnApfxZIsa26mUQkEF
         CxUPqA+RajCoLoQLl0m3odxT9xYWMxqcmX6wRfX/51jJvXH7TY8bopdoNU2k+ooq1w3j
         +GT/KO4xQOJER9wuIZOTBlD98c0HfdUkK6zpRtx2tW5bwXNI1jYq7jAqPErtlIC5keXw
         nSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892484; x=1794497284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Jpc3SZnRBCGFVTrfa/OmpovyQbm7JH9w6IeqIWcWtE=;
        b=vGwwTdlon8Kg4kqka5L8rszPNscl8U6Ck051b9+zelojd5x7KX2ChT0VIUvuG3Cbdm
         vJFhtFEyWnl7EmO5+zwRBqlsDYMEmjr+BjJry5BtAkDR/ssyQgWcVm/ndUdcLMwkiGu8
         /3Lypg0H3TY9tRG862/CoJzLe6FnLYyUrUsGTHvrId7y5UNRLfRb5UyK5MNnSiK8vIZ1
         F7IKWvyA0ThDLt1mcQYYnXcisqSm+3GWyNRgvW/2TKnLqdX+TgNbCcLWN1eXGlfkV2G0
         K7Ijo24H+I37OmKlW/o0lDbJv6Myx0QzF2FSQAIvDrpvJy0z26MVjRR1cbszIhxYgTZi
         /9lg==
X-Forwarded-Encrypted: i=1; AKwUvBxXkKs36hSpp6mXvH5aPbldX7gWjb6gGU78ycegRSL33Dyvqgvf+1hgfahQQ4CabaTFiAqHrjd70yd7064=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TU4gA98Hy6qb8E5HQvFZdvy8Xir1S96pQQKU6JR52yFYo8pxd
	uQHoxqcX+QiiPyh6o7mPTeyR8LV2Lv52xm/zebdEiipxG7+qxEwwSJaX1WpDspaD9b82fdIsYWv
	2aqyquszbVKCofWd51vJ3Y5BM2QVcJJemScIMO2b5AJxd0C6aT3lCvQac08vSaUXyCjHtOrTuih
	ogANyZgG9365kq69o2odvNTIR/UUFSBPJMlw4mSFil6A==
X-Gm-Gg: AYBFou2To1CFQ8feVvpt6yEpEW5aeV7e+C7H3fOEGg8gpOn9ZDO1ixGM2jtrlGpKrcL
	fYgOqNV2KIZkgfw6kKI6vRAf/Rnrv17WvFN0AYYai65iRyvHZLyjG8heS9GBmiV1lMuxNRirLFo
	fGSJdTK1JbSfcpB6SP9Ji3w+np8BNEj2+Wgy2t7flfBXZSZ2SXv3ZXoxHBKPTMMPP4BI77EbIvH
	oWPXpC40lwJ8QPh+Qweg3gyJULw2FnKnFScPMxk
X-Received: by 2002:a05:690e:12ca:b0:67b:f91c:10ac with SMTP id 956f58d0204a3-67bf91c25ebmr2670865d50.38.1793892483929;
        Thu, 05 Nov 2026 07:28:03 -0800 (PST)
X-Received: by 2002:a05:690e:12ca:b0:67b:f91c:10ac with SMTP id
 956f58d0204a3-67bf91c25ebmr2670835d50.38.1793892483108; Thu, 05 Nov 2026
 07:28:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103171504.910646-1-marouene.boubakri@oss.nxp.com>
In-Reply-To: <20261103171504.910646-1-marouene.boubakri@oss.nxp.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:27:51 +0100
X-Gm-Features: AclHuK-V6NedIsLJGXklLwOUQ4WpAnW5H1oe6zWfRV0ROVyeYZzKMtvDZEcttHo
Message-ID: <CAGgiveV2+Vc_b7s0OF5naUNXzDzEtiTUgtoAz1B9zCFOJS6oFw@mail.gmail.com>
Subject: Re: [PATCH v5] tee: optee: build the Arm-specific code only on Arm
To: marouene.boubakri@oss.nxp.com
Cc: jenswi@kernel.org, sumit.garg@kernel.org, arnd@arndb.de,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, amirreza.zarrabi@oss.qualcomm.com,
        peter.lin@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 0dS2qLEmw1nQScyeRrDnO2sWVj2gkUXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX3dx3Dl/GUhKt
 8CjjhDQyYuEFVs1T/G/ydUC0UazN4sx/Upi+76e7TMYnT08lLxFOx2knhqlHuj6wPJiW1DZSNQ7
 7OZMtZ79kCGWQ+XzBfXf90bTwMz22p9Wu2Ai2P5vcNa16DCwOow8Yt5HgfyvxqFcFwFZzkhy2Lc
 Ljf4YPFQR+RaN0pzyqCtqiFgDFhRUq9cfZ5QhjF/PU5eXaVjJhfLVJ0aEjhazAvDIhRG6e/vOjR
 llNrY1b91Ot3U6t2mdisSiLz0YbW7QO+ipgIPDYx1lFkWmGc55fDAdyJT+8/Va3AyQZbj73Wb1E
 5EE5O8gFq+L0hA6y5cC5YLtZqGxL5/lnIR6ybprsSMqY/nOcnkmVp8Mh3OPv722yZCLS1X9++0q
 3JXONkZhArVKMYHTABDKomFWX6f1Pkqqc2rYfVMKwFzx3b4ksU4L5gJicIoOeXkjgzDgoY6IPbU
 bYbBbjqtzfUdn8XlL7Q==
X-Proofpoint-GUID: 0dS2qLEmw1nQScyeRrDnO2sWVj2gkUXo
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aeca085 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=QSRX11TqfzdV6SOrKsoA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX1K+SckFdOtwE
 Zy7BxOx9vKZkSVxfHFSToIenzUqdgJParjH0T8ET/9nU9b+f2YozJgvjkDme30dNZZTrE2rWoy7
 C1A2xwmXVtYQ7WeGlceSiX44CTQpyrY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050061

On Tue, Nov 3, 2026 at 6:01=E2=80=AFPM <marouene.boubakri@oss.nxp.com> wrot=
e:
>
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>
> The OP-TEE driver reaches OP-TEE through the SMC ABI or the FF-A ABI,
> both specific to Arm, yet builds both unconditionally together with the
> SMC Calling Convention definitions they rely on: ffa_abi.c is always
> compiled and only its registration is conditioned on
> IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT), and optee_private.h includes
> <linux/arm-smccc.h> and defines the SMC and FF-A specific types for
> every file of the driver. This is fine as long as the driver depends on
> HAVE_ARM_SMCCC, but it keeps the driver from being built for an
> architecture without SMCCC, such as RISC-V.
>
> Build smc_abi.c only when HAVE_ARM_SMCCC is set and ffa_abi.c only when
> the FF-A transport is enabled, and provide stubs for their registration
> otherwise, so that it fails with -EOPNOTSUPP as the FF-A ABI already
> does when the FF-A transport is not reachable. Keep the SMCCC header,
> the SMC invoke function type, the SMC and FF-A specific structures and
> the SMC RPC register parameters in optee_private.h under the same
> conditions, and drop the unused <linux/arm-smccc.h> include from
> notif.c.
>
> Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT, as it
> already does for RPMB, so that the driver is limited to a module when
> the FF-A transport is one, rather than built in without FF-A support.
> ffa_abi.c is thus built exactly when the FF-A transport is enabled,
> and the FF-A transport is then always reachable from the driver: key
> the FF-A parts of optee_private.h on IS_ENABLED(), so that the layout
> of struct optee does not depend on whether the including code is built
> in or modular, and drop the now always true IS_REACHABLE() checks in
> optee_ffa_abi_register() and optee_ffa_abi_unregister().
>
> OPTEE still depends on HAVE_ARM_SMCCC, so smc_abi.c is still always
> built. The only visible change is that OPTEE=3Dy can no longer be
> combined with ARM_FFA_TRANSPORT=3Dm: such a configuration now resolves to
> OPTEE=3Dm, with the FF-A ABI available.
>
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
> Changes in v5:
> - Replace IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT) with
>   IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT) in optee_private.h: with OPTEE
>   depending on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT the FF-A
>   transport is always reachable when enabled, and IS_REACHABLE() made
>   the presence of the 'ffa' member of struct optee depend on whether
>   the includer is built in or modular (Arnd, Jens).
> - Update the commit message accordingly.
> v4: https://lore.kernel.org/all/20260924105145.532787-1-marouene.boubakri=
@oss.nxp.com/
>
> Changes in v4:
> - Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT so that
>   the driver is limited to =3Dm when the FF-A transport is =3Dm (Jens).
> - Update the commit message accordingly.
> v3: https://lore.kernel.org/all/20260922131735.524635-1-marouene.boubakri=
@oss.nxp.com/
>
> Changes in v3:
> - Dropped the RPMI ABI placeholder and the RISC-V enablement patches,
>   this is now a single patch (Jens).
> - Key the FF-A parts of optee_private.h on IS_REACHABLE() instead of
>   IS_ENABLED(): with OPTEE=3Dy and ARM_FFA_TRANSPORT=3Dm kbuild drops
>   ffa_abi.o from the built-in optee.o while optee_ffa_abi_register()
>   was still declared, which does not link.
> - Drop the now always true IS_REACHABLE() checks in
>   optee_ffa_abi_register() and optee_ffa_abi_unregister().
> - Describe the current FF-A conditional compilation accurately in the
>   commit message.
> - Posted as a new thread with a proper subject prefix.
> v2: https://lore.kernel.org/op-tee/20260915020235.507302-2-marouene.bouba=
kri@oss.nxp.com/
>
> Changes in v2:
> - No code change, the testing section of the cover letter was completed.
> v1: https://lore.kernel.org/op-tee/20260914175435.118303-2-marouene.bouba=
kri@oss.nxp.com/
>  drivers/tee/optee/Kconfig         |  1 +
>  drivers/tee/optee/Makefile        |  4 ++--
>  drivers/tee/optee/ffa_abi.c       |  8 ++-----
>  drivers/tee/optee/notif.c         |  1 -
>  drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++-
>  5 files changed, 43 insertions(+), 10 deletions(-)

Looks good. I'm picking this up.

Cheers,
Jens

>
> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> index 50d2051..891dac6 100644
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -5,6 +5,7 @@ config OPTEE
>         depends on HAVE_ARM_SMCCC
>         depends on MMU
>         depends on RPMB || !RPMB
> +       depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
>         help
>           This implements the OP-TEE Trusted Execution Environment (TEE)
>           driver.
> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index ad7049c..183cdde 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -7,8 +7,8 @@ optee-objs +=3D rpc.o
>  optee-objs +=3D protmem.o
>  optee-objs +=3D supp.o
>  optee-objs +=3D device.o
> -optee-objs +=3D smc_abi.o
> -optee-objs +=3D ffa_abi.o
> +optee-$(CONFIG_HAVE_ARM_SMCCC) +=3D smc_abi.o
> +optee-$(CONFIG_ARM_FFA_TRANSPORT) +=3D ffa_abi.o
>
>  # for tracing framework to find optee_trace.h
>  CFLAGS_smc_abi.o :=3D -I$(src)
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index 633715b..08236d8 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -1212,14 +1212,10 @@ static struct ffa_driver optee_ffa_driver =3D {
>
>  int optee_ffa_abi_register(void)
>  {
> -       if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
> -               return ffa_register(&optee_ffa_driver);
> -       else
> -               return -EOPNOTSUPP;
> +       return ffa_register(&optee_ffa_driver);
>  }
>
>  void optee_ffa_abi_unregister(void)
>  {
> -       if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
> -               ffa_unregister(&optee_ffa_driver);
> +       ffa_unregister(&optee_ffa_driver);
>  }
> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> index 6e85f2f..6801422 100644
> --- a/drivers/tee/optee/notif.c
> +++ b/drivers/tee/optee/notif.c
> @@ -5,7 +5,6 @@
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> -#include <linux/arm-smccc.h>
>  #include <linux/errno.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_=
private.h
> index aefe1e6..02d6f79 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -6,7 +6,6 @@
>  #ifndef OPTEE_PRIVATE_H
>  #define OPTEE_PRIVATE_H
>
> -#include <linux/arm-smccc.h>
>  #include <linux/notifier.h>
>  #include <linux/rhashtable.h>
>  #include <linux/rpmb.h>
> @@ -15,6 +14,10 @@
>  #include <linux/types.h>
>  #include "optee_msg.h"
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
> +#include <linux/arm-smccc.h>
> +#endif
> +
>  #define DRIVER_NAME "optee"
>
>  #define OPTEE_MAX_ARG_SIZE     1024
> @@ -42,10 +45,12 @@
>   */
>  #define OPTEE_DEFAULT_MAX_NOTIF_VALUE  255
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  typedef void (optee_invoke_fn)(unsigned long, unsigned long, unsigned lo=
ng,
>                                 unsigned long, unsigned long, unsigned lo=
ng,
>                                 unsigned long, unsigned long,
>                                 struct arm_smccc_res *);
> +#endif
>
>  /**
>   * struct optee_call_waiter - TEE entry may need to wait for a free TEE =
thread
> @@ -119,6 +124,7 @@ struct optee_supp {
>         struct completion reqs_c;
>  };
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  /**
>   * struct optee_pcpu - per cpu notif private struct passed to work funct=
ions
>   * @optee:     optee device reference
> @@ -149,7 +155,9 @@ struct optee_smc {
>         struct work_struct notif_pcpu_work;
>         unsigned int notif_cpuhp_state;
>  };
> +#endif
>
> +#if IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT)
>  /**
>   * struct optee_ffa -  FFA communication struct
>   * @ffa_dev:           FFA device, contains the destination id, the id o=
f
> @@ -170,6 +178,7 @@ struct optee_ffa {
>         struct workqueue_struct *notif_wq;
>         struct work_struct notif_work;
>  };
> +#endif
>
>  struct optee;
>
> @@ -257,8 +266,12 @@ struct optee {
>         const struct optee_ops *ops;
>         struct tee_context *ctx;
>         union {
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>                 struct optee_smc smc;
> +#endif
> +#if IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT)
>                 struct optee_ffa ffa;
> +#endif
>         };
>         struct optee_shm_arg_cache shm_arg_cache;
>         struct optee_call_queue call_queue;
> @@ -290,6 +303,7 @@ struct optee_context_data {
>         struct list_head sess_list;
>  };
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  struct optee_rpc_param {
>         u32     a0;
>         u32     a1;
> @@ -300,6 +314,7 @@ struct optee_rpc_param {
>         u32     a6;
>         u32     a7;
>  };
> +#endif
>
>  /* Holds context that is preserved during one STD call */
>  struct optee_call_ctx {
> @@ -422,9 +437,31 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *=
reg1, u64 val)
>  }
>
>  /* Registration of the ABIs */
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  int optee_smc_abi_register(void);
>  void optee_smc_abi_unregister(void);
> +#else
> +static inline int optee_smc_abi_register(void)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_smc_abi_unregister(void)
> +{
> +}
> +#endif
> +#if IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT)
>  int optee_ffa_abi_register(void);
>  void optee_ffa_abi_unregister(void);
> +#else
> +static inline int optee_ffa_abi_register(void)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_ffa_abi_unregister(void)
> +{
> +}
> +#endif
>
>  #endif /*OPTEE_PRIVATE_H*/
>
> base-commit: 827751b699b79a6e569983359c02dce67f81b94c
> --
> 2.43.0
>
