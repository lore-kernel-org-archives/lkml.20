Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089487;
	b=Tbs8n8zI3PeMCxzc0vXM+XZQGiNvRPT8XJlRxb0LDrIP8MMHwIZYewtTlxnQdapTVpfi
	 KVK4HxiEbiZPLslpqolZRE5FZjPdwnusDJ19nNRNTmvxPso6MgugtbsqzmQ3S4h3B3cgX
	 0pRfiipyufK6OvHpHAufIA76PBVFbgDO31s+L+APKbcQugEtcV5n6DS/3s7Ki6AX9uysP
	 yMhVRz8v1Rwjq6yCom3QIcso/2ni3TvcZZhv9l7qYkGnPbBd78g8oM+qCdXfEnZ7aTzO0
	 bwH9FQ53HXS3KT5Yb9G1WaqdByL/h3ZFOZyMmoitW4mqRQzLDr9nNYE1aUFynTOgi0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CvepuuK0gAaEvpLBJ4Cf86p7o1uPMZuJuRF3Ujh14sI=;
	b=oFmdoc6f8esxj7deOSzzOenXUqBCFeCHatHqWFCtW4vH8sBkJIGgrq8iGRBI2j3LmDje
	 i2bVvTGJlZXg22BeshvV4/VB+EwsicczO6kn08EaPnpTItQ9nKG7tRlNWE0SMxBoOwRxr
	 PJrGE08MrcsPToiylKIHppwiVM+ekqsRwravCHpUc1zZf2G5q/SAGz13gG5N0KR+HkQac
	 oxswjvkqQWLwCmcMs+HbwSHtjlW6x/BBMV4LNnst2wokSsySBnKNrAXESXw8m6dLI1een
	 ITgnNM9p2bJA+L3quZC2tZrFeBQJmfeW3ytpsWntoakexFQZZQO+YYulQJ4aRs1PvOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACuDC3vq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TINqEZGC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B46C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACuDC3vq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TINqEZGC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJjl3950140
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CvepuuK0gAaEvpLBJ4Cf86p7
	o1uPMZuJuRF3Ujh14sI=; b=ACuDC3vqat8VvwXekIFu45xF+7k4NpDy1rtAc3YU
	niAvcU7IDpDWj/tyjh/55PfzavZgy/cxZ5duJBGCFQcEysiSBZPfL4hLWvkmiGKl
	2pIFBbC4G06TAbJ8Kz2XJP/5pwCZaSe6wywfQPlnbcPs/In38nsuoNGDm0nSUpgj
	2RbE9Zl8CwYet4ut0GkL6O1V/v16VN7ChZXt8Gy4k2UUpiK9o61NX0t3sWl2JTJU
	ujcs+on3QxYGhsEMkdZNe/auE+OeJzNybq01RT0/hAF/ze3U/xhKag+bp45M32hb
	yUpc2BCbDSqcoKmLiBI2Yhi9QaCPba9tolg/9XQudDR+Jw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54ju4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so940593485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089485; x=1793694285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CvepuuK0gAaEvpLBJ4Cf86p7o1uPMZuJuRF3Ujh14sI=;
        b=TINqEZGCowDbKzzBL3Km6agfWMR0Fk3JpJtAILlzc2yd3IvwX6UJ20H4Af0pfGVjT5
         eW0SOCDGUXq3Yc0JvwwEDsZHfFha2ghOcPMGv+otmBCETQWaSafThkhYxSuEL4h6gIJX
         OV7S22DPDMBy6StCU6WwFdFFmSNk0cEeZTWuuc71pKARdJpLMDPsJQF/wXZRabvXlpAJ
         ACfwJqEhNuClT/9hMtSt9b2zKN9W7f4GsbU0nhmG+T3Svi1BHfTQqATmozKRJsmu21t6
         sxqJdIZjTv3GTlXeDvFf73VdLlKrzmXDo/yynjFDzSVZCfARVsk4C2HD7V+c0R9WrEDX
         ITvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089485; x=1793694285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvepuuK0gAaEvpLBJ4Cf86p7o1uPMZuJuRF3Ujh14sI=;
        b=kWYZ6kYUNNtFm0Vcu5lY+VOb2vxrQV4R5bQISW5+adNWtaMVz4A4+LSJyympK681UP
         paWRG250ip4DeHDywbiVAQKUSwjzimBF4ovmyD53S/SY1MeclmclBRTytbxeGKiqtZmU
         evlBfjAZvc/OZHulZljx64nQeff078QTt9053GlOXzb2agoIfGlNqUogzBk84dLOoQg/
         Mkr0mwA3CXCzZXFMuihUoGN2YOyydr/zHFwgTdn7H4xAP5/ZDkAhdqTsY/MB1lScbwh2
         /oLJPgjHMhEk09IYhxK68+ELRTkm8ktlPo+VgVUZS4uKk0ocqsYgurpUnsCggT+hZzKD
         UhDg==
X-Forwarded-Encrypted: i=1; AKwUvBzgXKLsjPu3vMSY8fTKQeDmtoQBKV9c/1esQej+ZYoEkHH1eB2xFY2Phnt2A4CRvwjjRWSD/KwCECHP2Es=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3RbKyWE4hk2KMuxzJdnc2Cyah5C7D4WB9OZqg7T25IP7wMheg
	/cSRlJiqj7pC2j+n06rOCoAZZz8f5/rTb6WeB2Jw/llVOzd6jAtMs9iZ/Z4yr87XjZ/0huPrU6/
	DEdM3NSTdGCI5DcjY1QDWke1k0IrjysENS6zhXnh+pQ7amH91gsw3bm3eg2Smt42t/Mg=
X-Gm-Gg: AYBFou3QG7QO5OUyvsvAB5UAEP5PuE9wBOlgRDMBTUU+JssVEVPfaDmRwqifN1MoVnv
	2hvmE9S+YncE6ebLmfZcIbr60oWTEy4sdV4516xoei/Y2oW/piVJT1C7DC5lGhnvzoD8a9/bVFK
	rN683FcoFKa9bkiBxAvmOkC2jeG9TAcSdMsEpgHFfUqOU4Tvv/K7iode9Lhc2bJ2WJANUKmVeUx
	SGCgC/I0UlvepteTKGQpqh4wDTlKGTP4YEtz+B8AiYbNLefg9mQEoS3wjdTuZbQG3FIiM7B+Nny
	1Qcyty3NLzgf65laXYZphlFUlw1sT1KPXoa4IqW8iGHH7YXi+qhkjipOBXvNhhEoFRFqotgODhG
	QI/Oj4B+RWV62Enwyq3eFea1rCu2UdhUHRkaRtwq6JkZdWUHCdyM3PVTwaak7NZE0zjN3UrEKsH
	gVNA==
X-Received: by 2002:a05:620a:838e:b0:93f:1dbf:6cfc with SMTP id af79cd13be357-940ef93997bmr1516404885a.36.1793089485533;
        Tue, 27 Oct 2026 01:24:45 -0700 (PDT)
X-Received: by 2002:a05:620a:838e:b0:93f:1dbf:6cfc with SMTP id af79cd13be357-940ef93997bmr1516402885a.36.1793089484989;
        Tue, 27 Oct 2026 01:24:44 -0700 (PDT)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm22476897f8f.51.2026.10.27.01.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:24:44 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 27 Oct 2026 09:24:42 +0100
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, peterhuewe@gmx.de,
        jgg@ziepe.ca, sumit.garg@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH 1/1] tpm: add TEE driver for a discrete TPM behind OP-TEE
Message-ID: <auBfyueV3s_XUS97@trex>
References: <20261026163259.1900439-1-jorge.ramirez@oss.qualcomm.com>
 <20261026163259.1900439-2-jorge.ramirez@oss.qualcomm.com>
 <at-y-BtnXX-u67hv@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at-y-BtnXX-u67hv@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX7ZBCrg0Xu8Hv
 0pG6Zx00bq+OhOLjTv5WYF6pJdWLxKcTHB1e8hkncgM2e85OC2ytRoA97iThtzEa9YRJGANpD3x
 4/IoRWma6UkrLwDKD3Sw4tQduFMBohg=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae05fce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=DybJpyO7BEJrc7p_h3oA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZhO2NJKseVihQOTFy-z3xujKgDfzOil3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXx9iER3HNY91d
 0Dovu/uZ8VZOSUOEne3Be/hR3ZlzyAHWtDUrx+BEpYwaf9sliabkmtVNtRsAi9gFquZRcfN3nw0
 9Oss6oVMO7rkQtcLJEZ8GNfF7Oio1QOr1upekhjIWDaerECkBco6zw4Pq5wRcNJsA7xWOOySw7e
 nbC9JnfZZs0jxjz4kTghKNiQWzuj06dt4Qlo0mG+NexJC1mS2G0bXXi2iVKOuKo2VEn5cHTvLaU
 h2ZbRk87KWDYOhhB54NWc4sc8WDty9i3Hs7ZUtNFh9xfcXn12TflrnxyHnQu6xrWdzilXUbSt5z
 JX8ly7XB+TD5ikwIesFQkmSYN+GEq9NOEKqZVa1cB8lpdK1GYA/VnBCJQeuyvX6WdbMuMQ/ph2Z
 KBBZ/Nou7OcXdgCf1fgTXD0FGVhZWsKPGUh9XgSqGNJreUkf1JAOXS0kX89hK9qxKj8XwxX5RZC
 SP0U8tdx1zM2q8W16LA==
X-Proofpoint-GUID: ZhO2NJKseVihQOTFy-z3xujKgDfzOil3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033

On 26/10/26 22:07:20, Jarkko Sakkinen wrote:
> On Mon, Oct 26, 2026 at 05:32:48PM +0100, Jorge Ramirez-Ortiz wrote:
> > Add tpm_dtpm_tee for a discrete TPM that OP-TEE owns and the normal world
> > cannot reach directly (e.g. an SPI TPM on a bus driven by OP-TEE). The
> > driver binds to OP-TEE's passthrough pseudo TA by UUID and forwards TPM2
> > commands through it, presenting a standard TPM2 character device.
> 
> "OP-TEE hosts" would be more understandable.
> 
> I have trouble following the hops you are doing by speaking about normal
> world and then jumping into SPI bus. Please try to somehow make this
> more rigid and less terminology decorated.

I'd rather keep "owns", not "hosts": OP-TEE does not host this TPM (that
is the fTPM case, where the TPM runs inside the TEE). Here OP-TEE owns
the bus controller the chip is wired to, so Linux cannot drive the
chip.

That distinction is the reason this is not an fTPM.

> 
> > 
> > It is a separate driver rather than a reuse of tpm_ftpm_tee: the TEE
> > transport is the same, but that driver is tied to the Microsoft fTPM TA
> > and opens a public-login session, whereas this is a distinct TA for a real
> > chip, gated to REE-kernel access so that user space and other TAs cannot
> > reach the TPM. Sharing the fTPM identity would conflate two different
> > devices and collide on a platform that has both.
> 
> And they don't share any of the same DNA?

Sure, they do. The TEE transport is effectively identical: the
shared-memory, the invoke and the response validation, plus the
probe/teardown sequence.

What differs is the device identity: TA UUID, login (REE-kernel vs
public), and bind method (ftpm also binds via platform/OF and has a
shutdown path).

> 
> Two other options:
> 
> 1. tpm_tis_core type of solution.
> 2. Implement the feature as part of tpm_ftpm_tee.c.

I'd rather do (1). The shared transport goes into a small core; the
per-device identity stays in thin front-ends.

Something along these lines:

  /* tpm_tee.h */
  struct tpm_tee_config {
          uuid_t  ta_uuid;
          u32     login;          /* TEE_IOCTL_LOGIN_* */
          u32     cmd_id;         /* SUBMIT_COMMAND function ID */
  };

  int  tpm_tee_core_probe(struct device *dev,
                          const struct tpm_tee_config *cfg);
  void tpm_tee_core_remove(struct device *dev);


tpm_tee_core.c would own everything that is common today:
 - open context
 - open session
 - shm allocation,
 - chip alloc/register
 - teardown and so forth

The front-ends collapse to config plus their own bus binding, e.g.:

  /* tpm_dtpm_tee.c */
  static const struct tpm_tee_config dtpm_cfg = {
          .ta_uuid = UUID_INIT(0x50568cd9, 0x370a, 0x46b8,
                               0x9f, 0x2c, 0x6f, 0xd9,
                               0x06, 0x64, 0xd2, 0xee),
          .login   = TEE_IOCTL_LOGIN_REE_KERNEL,
          .cmd_id  = 0,
  };

  static int dtpm_tee_probe(struct tee_client_device *tcdev)
  {
          return tpm_tee_core_probe(&tcdev->dev, &dtpm_cfg);
  }

  static void dtpm_tee_remove(struct tee_client_device *tcdev)
  {
          tpm_tee_core_remove(&tcdev->dev);
  }
  /* id_table + tee_client_driver unchanged */


I'd push back on (2): one file would carry a public-login firmware TPM
and a REE-kernel discrete chip, plus it breaks on a platform with both.

The core split removes the duplication and avoids that coupling.

Questions:
- Is the core in tpm_tee.c / tpm_tee.h acceptable, or do you want a
  different split.

> 
> I don't think tpm_ftpm_tee was that great name choice [1] but we have
> to live with it. 
> 
> So more logical name as per taxonomy would be probably
> tpm_ftpm_tee_dtpm.

tpm_ftpm_tee_dtpm reads as "firmware TPM ... discrete TPM", which is a
contradiction (this device is _not_ a firmware TPM)

Per your own note in [1], the ftpm prefix was a mistake, so extending it
seems worse than leaving it.

With the core split this seems clean to me:

  tpm_tee.c         transport core
  tpm_ftpm_tee.c    firmware TPM front-end
  tpm_dtpm_tee.c    discrete TPM front-end

Does that work? I'm open to another name, as long as firmware vs
discrete stays visible.

The rest I'll take: = {} initalizers (drop the memsets), module name as
the function prefix, and the MODULE_DESCRIPTION reworded once the layout
is settled.

TIA
jorge

