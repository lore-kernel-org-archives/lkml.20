Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35405395273
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959666; cv=pass; b=ZK+lE2a6taztKZoeQJw/NfiSiFGDhm7IuScKN1enSO3YeAJz94s4NxzPnetrMSvDbftyACpMDujvVSn4B6b1FXdpvwIiTDrzqb5APgkYKX+r0xFv1Wi/4sQmIppUHzDnSdKyACX273VV+8fLfw28ZuW1Ci8q3SugvUoXomFY6Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959666; c=relaxed/simple;
	bh=90oYzEcfAGhlmbIytB6ZBVErZRVadMV+TuB9PDBwSvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvl8ePr1E+9Q7ZIBIhodOHF6uhy7ChK919YDgo2jyqOhdPvFyHDekJ4B2QUoR48mbnJavnPscmAsMuOz4UeIzGqsSUgPbMdAxtmUZPnn7S4p2hxDA2T1XwlYXCyGB1k8N+CuPSs/SM6CUxkeLvL7mct4MR1ecrmKbLzDGdEl4ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tcv2LSmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuMyyxic; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tcv2LSmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuMyyxic"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1jBV71592131
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=; b=Tcv2LSmE+Uo4D/De
	cYTg7jlnL9VqM3B4x3nE49YQaxwbtXhAFy9Z5pkCtPgCmm0iOmdEogPUEgiuPBzh
	ulVVE7BaMLkYa8eh4tPciZAovtmhzNBjo9Y9r66cTbH1FQ/CibXYXA66mX09F3Zw
	s7Lo5KniZ2UFpLbKGKjZEnvYdVSHoBMtse22R0fiQVqOB7H6AMiX+2gJjTZeEVfg
	Qi6W1riHkLeKN92xbqCxZUUrGviqUzQ+/GTqSJaksLg69SOETvnqd2mbKtHdMIOz
	0Zr5KTMsGwuQbldSLRwazEJfmuIeyrGtkWJVfxE+Ao4NgmD78xGvHRGR6sCWfHwX
	rYyn9Q==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tjrjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:34:23 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66ce3040ea9so3790883d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791959658; cv=none;
        d=google.com; s=arc-20260327;
        b=cbjBjTcMlr47i+SbCd9RHB0nNR+1uvrt6lEJAexgg6IW16vaXKxro+fVLloQYj4hJr
         jKyVDPjVfPM5Z/SDu0waEYMyjqYnWrwONQwc9WJS9tUX30nHIOh7/0+EG1/C2tNI7auf
         GAzNOLL+Wx5ac89Fz+kEPTwjF7DNf/QkF2DtLv7zoMzVrpJvEg3dW5qb73s1FhiWSmf5
         qiOq+xGGjNTPVQCjeCqgjJF0qbIQpykuyMhOQdDk0DumwlzjytZTTx2dcsd/en0Qidbo
         X8bZkYRpMszQHE+NpM8e+0XYOGuS2x39czAgKgZzcJ706OU+4ERRhSSChY02ApE4pONj
         kC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=;
        fh=t1frsmnXO0x8IOWzdf0ezYKLIomCZxjbckGZwfTNtPg=;
        b=J9Z9qgi0ea40rm7ouJ1LVEaIUiWMtxfDmnY75Vp0z+muhHjrfEsdvjADbQpVJilBMV
         A8FB9+5POZxzg9Be8HrFTH/7dvHTWLlVxNQXi6jRBOj9Qn1Orrkw7h/ys4VfnfVfPRhA
         xcRFHqsX1rxhK/9/RUGtZnnHC4MPKbkDzXBjrh6gRTtu2D/TDZLw6dfUOxAd0zKP2agC
         82ixnMkV6aqr8YdoFuwkCzqGnlwKAHh6Pgka+KwwdiOUCsXvec7Yma3Oz+aFvfAAVWL4
         WH2gExRMkLbM4IoKM6BEgN6iqCV1ojchb8CnutIapZxB1Z86YzLLHpNDRLvagQ1CCLVe
         38IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791959658; x=1792564458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=;
        b=BuMyyxicqwHw/16uNeGb3ApXCCcomZ3ItIDeHd4KNsqR9S/bf82LCG8q3PFqwtnHy3
         iNrYg5KgDHa85JDNYuacPLrYKuQOcg91F8kg+UoZJIhdIsdRNxXQjaGG9urmDT76MQZ1
         n2gh1QDfrsY8gaAJLiPtSvAty3I3ZbKJrgdGi7vB9lYc7OUidYwkwkjnxGa4TkxpyTJF
         jAMkULzTkxZyBeklMHEpaOngTEqeQxCxq8NITG9ajpD5L+vnEK7Q75URTjylLbY6g9xF
         JFyB0veMZioHLon5eaaXlRTcMtuSQOmU28fCuiiGwMadoCeJ24WbgsMxFusbpY5jRSbi
         Sq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959658; x=1792564458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=;
        b=B9jM6hvQ/zAGl7MK2XZltFczkvDt6zsbbvLglPrS9W0WzosfEvXSZ1/kCZeamLjazu
         NyNhUTOYd/rOZXFrk2qatTDh+7uXFcUk8W0ToAHN6ikcQCvqyoYSqSz8j+69ojjxivDR
         RrjFApl7xlbi8nelCelIhaelO4/41vb4k5cdNCB0PbpOSUgrtXT0pmaB7T/KjRx+kAb8
         logn10gdVA2bcdJ2wFx5I4IqaJPyDzZqLfPJOaQN/ZaF9X1JZTzXUNN16gnI8HzhmC+d
         YVU3x0ziqAyM6enGG5Kv8qE0Wa8PO0rcM1OJ4gmQ7f6GUylPNrDrmsry7L3jS7LaMu0v
         Wqfw==
X-Forwarded-Encrypted: i=1; AKwUvBwl2id3Gjec3aODB9KrvS2WeIh7LLJQiq+dZ1RWgOkaZA61Ou1VSb4zp3cOUgaGev31Qm+G5DNkDKzX418=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXajkqKNFupPSbZEpfUSgCGem9od9OdAsb2lpl3gc+Eiot8LU4
	0XmwRy2oQekE9nTTABlPVwpVz8pmMYnxpEXJNS0DDrwMspiTHA9YukMFy1v25Ts0OZVanTZHCgg
	8AHjm6tMMw8XAErrh8jDF4+HEwYChSYNSraKoeZEDQqaDIBlA1bs1leXW02sCWVECI8P4U6AzR/
	MjCBqKP/CrvmaVB61yBHkmXguoyouidIjZKbUkv4oNmg==
X-Gm-Gg: AYBFou3z5EVYxcNBExyEeG8cFnBgnpgbRuhosSZJdpLjrPWGXZiwogkW7bDkfJhjsl8
	W3ju453f/wM/A/K5c+dK2R08pvZF+XkUWgHWQRW9kEG2RjEsiuwXNdN9y8k3fDYDFMoFdO7CBnb
	6sY1bV/26Uq4knCmYoYQ7jb37ZZoRunY+ShavDHa0FGXtgf3B6PLhJM8c=
X-Received: by 2002:a05:690e:4803:b0:672:ef08:585d with SMTP id 956f58d0204a3-679362ee333mr2258547d50.103.1791959658417;
        Tue, 13 Oct 2026 23:34:18 -0700 (PDT)
X-Received: by 2002:a05:690e:4803:b0:672:ef08:585d with SMTP id
 956f58d0204a3-679362ee333mr2258539d50.103.1791959657987; Tue, 13 Oct 2026
 23:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002145140.GA784348@rayden> <522a2d28-2ac9-4a56-8a61-477be3dfbbd9@app.fastmail.com>
In-Reply-To: <522a2d28-2ac9-4a56-8a61-477be3dfbbd9@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 08:34:06 +0200
X-Gm-Features: AclHuK8XdmPpo9UIpob-_3ameuxmUseYqHMzPH8-H_6Hf9QmLj-76Kiarg5W4no
Message-ID: <CAGgiveUDQvqpJKo4XuboP_46t7DPSBT1jdaTafROvobk2V5mwQ@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE update for v7.4
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf226f cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=SNq30pm9LGA7DVCV1CQA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNSBTYWx0ZWRfX4g+n9kJiTk0y
 WkPw3dSGfWNC8ac0WtUO2fs1yCJotxh/fIc5hOmU3TcD59S2R/3x6jUkJdZLMbWvINuMh01c7Ip
 ibYJmWeJzGiwHZLbnv6qji0TRmriqp9wNnIF/NinNr5xgg/OV1TEqJTjd8trlUAs8bIH4AY48zu
 Iw9BcECVUwgjYESSafIXFnS5xaAq6klg0ZLOfKFq7bW8JJ5qGlLSQaNa8CubZ5N+dfiOeVrFKX1
 dn4CjYFRFZhLY9Y9CZ3fJu0KiMfk112eSlpPbKFe/G8GZrZOgFOVPkGPeyvlSIJ705rwfpaS+VH
 TF8iAf6yIFD3+6zseNiqoGzk4iDw/7RgnRyO259f8UymJZWWI3EMWjTYGstMY0QdcYDyYJ9cz0U
 XJ5M+N+A7a1eHcRKdHYiaiWXmPUGJrg30mGRi0QLqVKQvFoLtZSW3MfSJQhJUUWChMsaMZ2+uvb
 oSg6U39rU8dt0OsyQOQ==
X-Proofpoint-ORIG-GUID: _3qHJzPHyz3l_c7cnexoSvx8HqQsX7b8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNSBTYWx0ZWRfX+Zha2Qkvp9oG
 TaykRGG093hlTr45UO9wAjxXklGPDStwSLlvJT7c8WzivuRb61FJEzm1IYJB2wKBxEi8rnwPeXe
 lRemFOoJw2zSxAcdqLw6wUmuKbVcnYw=
X-Proofpoint-GUID: _3qHJzPHyz3l_c7cnexoSvx8HqQsX7b8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140025

Hi Arnd,

On Tue, Oct 13, 2026 at 4:53=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Oct 2, 2026, at 16:51, Jens Wiklander wrote:
> > for you to fetch changes up to ccd4b23398acaf2139cf04f1ba0a66150cbf2663=
:
> >
> >   tee: optee: build the Arm-specific code only on Arm (2026-10-02
> > 16:28:41 +0200)
> >
> > ----------------------------------------------------------------
> > Build the OP-TEE driver's SMC and FF-A code only where supported
> >
> > ----------------------------------------------------------------
> > Marouene Boubakri (1):
> >       tee: optee: build the Arm-specific code only on Arm
>
> I had a look at the contents and saw that it keeps the
> IS_REACHABLE() checks that are notoriously error-prone.
> E.g. this part just looks broken:
>
> @@ -257,8 +266,12 @@ struct optee {
>         const struct optee_ops *ops;
>         struct tee_context *ctx;
>         union {
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>                 struct optee_smc smc;
> +#endif
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>                 struct optee_ffa ffa;
> +#endif
>         };
>         struct optee_shm_arg_cache shm_arg_cache;
>         struct optee_call_queue call_queue;
>
> The presence of the 'ffa' member in the union is conditional
> on whether the driver that includes the header is a loadable
> module or built-in, and this changes the entire structure
> layout if both types of users are present.
>
> The intention of the patch does make a lot of sense,
> but as far as I can tell, only the Kconfig change is
> actually required, while the added preprocessor checks
> only make it harder to read and it should have been
> sufficient to change the existing IS_REACHABLE() to
> IS_ENABLED() for consistency.
>
> Sorry I did not notice this one earlier as I was travelling,
> but I think I can't pull this version, please respin.

Thanks for catching this. We'll repin.

Cheers,
Jens
