Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590956;
	b=YAI/SxGU94LFLdTp82bXTrVv/gV2P8C691akXtukcckPPLabkI7Dv4x6CmDgd8WCqQ8O
	 rkMkQuHJkVkOzBgBrnU8hxSnkG7QAJbB9RPTRkwQlCyTRJYTwJy7lLBOBcUNZmuSVNRDN
	 zFskdYhvvfW4cdY6meXtDxV3bk82B1ESIw3qbvnT/KQwi3sTMaTM0U6ZMSJxyPuIUNqnS
	 ZBSrAGLPpjAEc8TfGiabNTYws/Hu4EENF2rMo+NV8x9wg8Khs4knCuxZDd0rsZxFEyf7i
	 ndKsDV2T9wYeV1OhSoKGX+4xEhqEY0BLpPfSnodLKwxHiMZblphU4W8OPhFjPca4cMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oqO07NhLTdzxWqunxJseQ1MRQIDCj/OeQS+fIjl94C4=;
	b=ScSBP40BEA5BX1yAKpOxq09JzbxYRdlwXRnWHb8f6UFeUgBubCOfSZSWXWkvmlcRWkFa
	 qfG/1vrgjD+d7gX04er3CtiRPSd87f4pFGWA7vQz5kwvq/PZIJ+Yjfaabm1mC3jEwVxxl
	 PgoGE2ysLZJN6vrKG5TAb1R1ohdIr7+jxa75ygGU9o4wzWxie25LvnF9PyPtvhmV8+HoD
	 xkkB9Vy7jFv6oxlk1yC8awQsGk7Ya6qKa1R3YYH4ghPrc2fZ1LbYJbAs4SE92NE+sNFQg
	 4VcOvsR/wV3EcFhwUdcIGyOA/ZCaEi0yoTMwpm0iPhngbj3OgkP36mUogp4V9XnA95Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF3HrjXF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKptEdwi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D67606F718
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D67606F718
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF3HrjXF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKptEdwi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQxpL1075701
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oqO07NhLTdzxWqunxJseQ1MR
	QIDCj/OeQS+fIjl94C4=; b=ZF3HrjXFxvBahlFkLVOo5iOLaa7fRxyb1e4ITp+W
	uQ9ugQkncZxoT5DeIa3KY7D9ZfT1fF3avUkjNpDacB4at6BsMJ4efxLuo08aPCYP
	zDx+wLjb47rchtJv/34lTqkg2rCQTixrWezSm49ORtnG81lBS0QcA7qjHA6P1XVk
	TxkCTmk4vAR8T5AMebS2OBqTVMNH0bHarstPW+MEHjdIyTdYDXh5UIk/A+ES4BZX
	diehGKA4gpPmQJ4VXV3xZ1hRd0ayrw7Ut+b+9KPka/9IZfViQpoiJLj9dcLoMd4s
	IvZJp/eN5SjXgTIlhIKlnhKEKcZytR0WAqibAvhly+a40w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0amtnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:29:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso460233685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794590953; x=1795195753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqO07NhLTdzxWqunxJseQ1MRQIDCj/OeQS+fIjl94C4=;
        b=FKptEdwic02kZaz2nm5G2HCJX1fuMyNxYsZYR4e6tJEeZ84A63LiorKhIefUXS4aa+
         7d6GqK3jCbKkx9Br+VXjXk/zSGiu3mBlWdIi7Az0773LqZvdir3ZnX8X2ti0H5c+7yto
         vsK8ktunJm+i4KkCPimA/inxX3hjCO8ZOP7NWuLejpxvxTyDRIDHWcFrrAGARgpzD9cP
         h3QWwKdrcuwvOxHOACOLGOr2zYb8PpEK+ssd282NDsHxG8rQ5tpOmCCwil7pCrGJWPZH
         o65/3qCKE69Di0+pF7HdPtKaW3IZ9mDlyhj0sAaJ+g9Zf8ou/wDzM0RGTm5qspz7DZhD
         p6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590953; x=1795195753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqO07NhLTdzxWqunxJseQ1MRQIDCj/OeQS+fIjl94C4=;
        b=b7bmepSUOapSbnrb6OIL71jvxK68+4uawjmizYCwNwZ7h32wBCfzt0cmdpg4ckxcUO
         dte9khN7W4q/LE6En5IbiNCYWvIHLi+l/S+Df0cEqABOIgQ+Mj24/fBRZWb+RyQ+LrBc
         2uqaODChd2UxagvEKuvr6qNk1hXQ3YIN9FP3Ov0hBj3TwslxMe/7r8IwZO1/gH2Te8gN
         cg7jay9uHeUQX3BGlgWOJSDbUh9M57vZwBtvyR0+MHhnB6+cxmpgQeRXT+iP3MdH1Rlq
         AxGJq3l6+viF8Ar2oWlAMWiN+V9GNcp8832YB8uobWpXMC54IJK6EIXesN9QVSoPHbYs
         fZ/w==
X-Forwarded-Encrypted: i=1; AL+hErFNTvQFKfV+vnrgxC2Svzkc70s0bQ6kGQOti2feD+19hNevHvg/1Ln5njgtmWEOyE/E2hGbpt9LOyez5zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R/XSwgAjcvsV0eQWhKAcGcuKLQ8LWL84vWfXydhKDuWvmZTCQ
	J4kKNS7B2Dut0/IEdfM31nawsCJYJQq36nNHw3OQvFh0KlGgAjWoe2+ZdJoof340TNtzTUIlc5e
	ERQDLQDa4RfyXBAb0RrzQ3PyU/0QN+ZEwt0n9L33pVNdbMdph38xQhEtcYzRsyYgEN4Q=
X-Gm-Gg: AYBFou0bJEtq+nI0WsEtvvU8tE5gwbyLCnzxTDQG1XwxnKj7k4J2japkULqgSyo86AU
	tOkOoePqfclzsyiBmaWs75b2gETeiL1+zWg0eFhHL4nu67KJODg3HkVSS81C19O4itx7Upf3Gc3
	lDsaT/Gf+f/kUGC7WgqQhP+goD1wvAGuPLJ+IZWLAS/zmRnmhpKnyWBtXrqrV4VLEd6Bx7uF0aa
	8X4N0UMfzHl2JIckU9Ypx8WMfJsysuE4Q0KE/NFkuEpSE0K9PFN/q6gjnNqx2CXuDz5kBiv5v5n
	7c3545Sc50b/E2yh+t3F7FqrgtjIBmfSZAIrB8M3PSiydpYPoXJb99w3729z6P6EQFcg3U3KAjA
	MCJA4k4npkgKwyKJGoJMxe7LBgf9qjGGdCgM+17HYzPlyhTSchj8Q6IAyMIDefFb8JJ9DuHOQ2e
	rgdQ==
X-Received: by 2002:a05:620a:29c5:b0:93f:2e81:2217 with SMTP id af79cd13be357-94933140dd8mr1066099785a.36.1794590953195;
        Fri, 13 Nov 2026 09:29:13 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:93f:2e81:2217 with SMTP id af79cd13be357-94933140dd8mr1066090185a.36.1794590952162;
        Fri, 13 Nov 2026 09:29:12 -0800 (PST)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm5993662f8f.10.2026.11.13.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:29:11 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 13 Nov 2026 18:29:10 +0100
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, peterhuewe@gmx.de,
        jgg@ziepe.ca, sumit.garg@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3 0/2] tpm: OP-TEE transport core for discrete and
 firmware TPMs
Message-ID: <avdI5vZCobTmpIuM@trex>
References: <20261111215940.3503287-1-jorge.ramirez@oss.qualcomm.com>
 <avciKM_pGW6hs_so@kernel.org>
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
In-Reply-To: <avciKM_pGW6hs_so@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2OSBTYWx0ZWRfX3lbLPaiX5YRJ
 kzZunXGntei3u7a3UgPCjWmqMwS/dPJ6Po9iwqNJGU7wPy2j3cN/2ZVGfTBUbmcTIXfzMPr02en
 AhaBflbugqqXqOJRGtXKXWZM3eClBno=
X-Proofpoint-GUID: FiQtt8YLvobreWNM7MCblMhjrbIMIP0p
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af748e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=McN5tr3TAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FuZrFBbP_L4GtrPzmhMA:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=OiMWn5MEmObRqTLTTlUg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2OSBTYWx0ZWRfX2GzJ2DV9Fv4d
 Y/jkF5xnCN+p/E7XdbLkRwAlluKND5uzJKK4zwTTvMws9Xhe5APV06FgwdxPH0ObtsdGQF5fk0h
 HUgC4NqmBtGRQ44uUswubJp7ksXqgCDrSU23gRBY+HUe3SxaZnzZSczygtDhYVDN0Ktz0/Ke3z3
 iwatkvGqpGlgtmeYCgesZcCKnbxTfB7+oOXeh0ajicT1KcYlYV+6b3nUMn6GW2PZ0DsjA19BQEg
 DD+/LjwVtG+z8+HSa5sQEgbcOFbiu//9ObslnrxzUqA9FXbCVpIu5Tqi3jr/B5jQGncsvFSX7+P
 X3RxsRmZk0TpvcCMSKVuZWyjGCKIatplCM1Uy9hcml/qlKoWhXFPr+oK/etYEfZQD5i482ND5yK
 /LcEabfy7kwoCgDW9rMfTVL5z6/4PAqo/fszvPm+J0bavYKNky3vnuF+s4D5J8wOr5ZYsTyeIFM
 hTXiPnnJRuJIvpTvzKg==
X-Proofpoint-ORIG-GUID: FiQtt8YLvobreWNM7MCblMhjrbIMIP0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130069

On 13/11/26 16:43:52, Jarkko Sakkinen wrote:
> On Wed, Nov 11, 2026 at 10:59:33PM +0100, Jorge Ramirez-Ortiz wrote:
> > This adds a driver for a discrete TPM that OP-TEE owns and the normal
> > world cannot reach directly, and factors the shared OP-TEE TEE transport
> > into a small core so the existing fTPM driver uses it too:
> > 
> >   - a transport core shared by the OP-TEE TPM front-ends;
> >   - a new discrete TPM front-end;
> >   - the fTPM driver converted onto the core, keeping its name, its
> >     platform/OF binding and its shutdown path.
> > 
> > Patch 1 is the feature; patch 2 is the fTPM conversion that justifies the
> > core. Both front-ends were exercised on the Qualcomm Lemans EVK over the
> > shared core: the discrete ST33 TPM (patch 1) and the MS-TPM-20 firmware
> > TPM TA (patch 2), each presenting a working /dev/tpm0 (tpm2_getrandom,
> > PCR read). The fTPM TA is the same MS-TPM-20 reference the existing
> > tpm_ftpm_tee platforms use.
> > 
> > This is the normal-world half. The secure-world OP-TEE support it binds
> > to -- the in-core TPM2 SPI (TIS) driver and the mediator pseudo TA that
> > relays commands to it -- is under review separately:
> > 
> >   OP-TEE support: https://github.com/OP-TEE/optee_os/pull/8155
> >   locality 4:     https://github.com/OP-TEE/optee_os/issues/8160
> >                   (design follow-up: the secure world policing
> >                   normal-world locality access to the shared chip)
> > 
> > Build and test it on the Qualcomm Lemans EVK (a discrete ST33 TPM on
> > SPI, owned by OP-TEE):
> > 
> >   https://qualcomm-linux.github.io/qcom-buildroot/lemans/quick-start.html
> > 
> > v1: https://lore.kernel.org/linux-integrity/20261026163259.1900439-1-jorge.ramirez@oss.qualcomm.com/
> > v2: https://lore.kernel.org/linux-integrity/20261110141923.3100770-1-jorge.ramirez@oss.qualcomm.com/
> > 
> > Changes since v2:
> >  - tpm_optee_dtpm: give the discrete-TPM front-end a .shutdown callback so
> >    it releases its TEE session and dynamic shared memory on shutdown/kexec,
> >    as the fTPM front-end already did; without it the session and the
> >    normal-world pages stayed registered in OP-TEE across a kexec, which can
> >    stop the next kernel opening a session to the chip.
> >  - move the shared tpm_optee_shutdown() helper into the core patch so that
> >    patch builds on its own; the dTPM front-end no longer forward-references
> >    a symbol that was added in patch 2.
> > 
> > Changes since v1:
> >  - split the shared TEE transport into a core; the discrete chip is now a
> >    thin front-end, the tpm_tis_core-style solution that was asked for.
> >  - convert the fTPM driver onto the same core instead of duplicating it.
> >  - use an optee-prefixed name for the new modules; the fTPM driver keeps
> >    its name, no module rename.
> >  - rewrite the commit message with a plain description of the components
> >    and the rationale for a separate front-end.
> >  - drop the explicit zeroing in favour of initialisers, and reword the
> >    module description.
> > 
> > Jorge Ramirez-Ortiz (2):
> >   tpm: add OP-TEE transport core and a discrete TPM driver
> >   tpm_ftpm_tee: use the tpm_optee transport core
> > 
> >  MAINTAINERS                       |   8 +
> >  drivers/char/tpm/Kconfig          |  28 +++
> >  drivers/char/tpm/Makefile         |   2 +
> >  drivers/char/tpm/tpm_ftpm_tee.c   | 295 ++----------------------------
> >  drivers/char/tpm/tpm_ftpm_tee.h   |  35 ----
> >  drivers/char/tpm/tpm_optee.c      | 253 +++++++++++++++++++++++++
> >  drivers/char/tpm/tpm_optee.h      |  32 ++++
> >  drivers/char/tpm/tpm_optee_dtpm.c |  73 ++++++++
> >  8 files changed, 414 insertions(+), 312 deletions(-)
> >  delete mode 100644 drivers/char/tpm/tpm_ftpm_tee.h
> >  create mode 100644 drivers/char/tpm/tpm_optee.c
> >  create mode 100644 drivers/char/tpm/tpm_optee.h
> >  create mode 100644 drivers/char/tpm/tpm_optee_dtpm.c
> > 
> > 
> > base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> > -- 
> > 2.55.0
> > 
> 
> I applied but had to fix some merge conflicts so check up my tree.
> 
> Br, Jarkko

thanks and sorry about it.

I had a look to your tree and it looks good. But I think we could
perhaps add the following to the new file (see the patch below)

Not sure how to do it thought- shall I send it standalone?

 drivers/char/tpm/tpm_optee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_optee.c b/drivers/char/tpm/tpm_optee.c
index e2223242327e..3c17de1306a1 100644
--- a/drivers/char/tpm/tpm_optee.c
+++ b/drivers/char/tpm/tpm_optee.c
@@ -166,7 +166,7 @@ int tpm_optee_probe(struct device *dev, const struct tpm_optee_config *cfg)
        struct tpm_chip *chip;
        int rc;
 
-       pvt_data = devm_kzalloc(dev, sizeof(*pvt_data), GFP_KERNEL);
+       pvt_data = devm_kzalloc_obj(dev, struct tpm_optee_private);
        if (!pvt_data)
                return -ENOMEM;
 
-- 
