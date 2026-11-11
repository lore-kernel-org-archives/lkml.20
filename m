Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434392;
	b=kKpVk4rsQPO5uA89j2PZ9cKsDcQXZ9He5BFyWCn8tB3qf9Y/atKG5U/66xzIA/gy+EEv
	 tTsnmXf4gNn5+vvGNmBdFmcHCxOygco+yHJUeJ0lonIng3ipToxt9N1GL6zqsPDR8hk6x
	 8NAVkF585SjxlAyIlOsSZuYd7mmMqAbGQaP3N0dLQLvE7X2SRy8abAxjSDDRFtWkQz5ep
	 uad8NlQmFiIkRD1L8Qrf/7oI4t7qqF8BdsFGyCPbKCotOO1wzA8vqCPJD1tDoe7vVrlon
	 Dp6DaVDHfqr98H7gkbgEUczHbVlydD+dznDL0ItSdG8aUdZcFqE+vbBi1j2WJsZWrng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434392;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=90pSFmld/fR1eS3PIVathWYp/h+Eq2KImJhG7d+ZIhY=;
	b=DX3WMLQm1GP3ybssclgpahFpSh+EoCKK3lELtSykGw9o3X/sEGCLnQFUIEKywX4x2JsK
	 zdlntHoiRyGNCAm6iVF9bSNyxrc5v5bJYfjaUhwY6C2fpsDhSB5xu6k2DqlqU7heoL4R+
	 icUuA3pJWoqujLtpCjOKBkXMA7NMoWY4Yf266qGhaq0wOcDzttJ8zwWh4z/4d6qAU7mmu
	 Sr1ZBU6ldmSER7XVWbS0ApARzVKB5XyCx55CnZIJONgn+fnwlBjHIQ8q9Uthms03BeZAR
	 4VnpoicdBnkz+c9qOaxFT4O/HkGVTnd3ZSg4v6bOwmcfCi2dbF/WEumlpy9HYs7tLig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZppQVJt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHWtaqBG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801E0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 801E0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZppQVJt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHWtaqBG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIpCbq3186600
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=90pSFmld/fR1eS3PIVathWYp/h+Eq2KImJh
	G7d+ZIhY=; b=SZppQVJtZ6znTeobswqmlJMF487MG267OZ9DrVk2qcMkO3GL6B0
	eA66nStjKBw6Vd+zK3p4cjKpqwllJOfpu6/Pb70TpJexuMYygroIBhqSvODszARi
	Vga7S/9KkXC3akJ+NMVbNhMMCJZFQswtkf6TN+OFv2t4ukFG4zHYbiYxDzlhIK5k
	cBxAozDrEUq51JZwyWIDROA3AeElj+b9BYXtFDjOJvSN73ctEUostewqHL8DGZe+
	tbUR0M/h7h+nvlhwkx0glmsFfiGvAUjWYl4+JCvut03oafJlUNY6corbsP5Z6GeC
	HAL/3quAdVFDBl8MsbiOaVQR25KDq1cYDdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdm3t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:59:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so761734485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794434390; x=1795039190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=90pSFmld/fR1eS3PIVathWYp/h+Eq2KImJhG7d+ZIhY=;
        b=LHWtaqBGXNA4lgZB/xwqtJFpfgjvwFbhPoqWTMclGpPTgRUXfh76AF3m6ekqfBgkKZ
         EGs3fvdWIeU6Qhl9TxbS7GPBpzMJOx3LsJqTkWG+OvTQk4QxwTWTzdYejk0woNeREUY9
         kYKPMgliQqWK3nllWzlWml9CBqXk3GBa6ol2zxqcU13WV7JtKKQ3cwVsrPoU6UV3/dpz
         Ic+iamV57afrQf7hyQRXvXJUXnbdj5hlkt3IVuq129LRTVIWiR02aBPCNyLzNsinF4dJ
         wB5iZCcHQ8xjq+nZIYOm0JBg8KwljZtlUfYDiLi5KxNlMeFlDDT8/5jga8BvcwBHcEyt
         GgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434390; x=1795039190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90pSFmld/fR1eS3PIVathWYp/h+Eq2KImJhG7d+ZIhY=;
        b=OpvKDKuVy5YV8WTesvAGTR255yVInOhL4jv4hLuRqlvfJ98uPtbV4pnSwaR4FYtvh6
         PED9ixwBafWcuRLefdzONo/HEH+RR3Q5j0fpBfV0sSHmrjrkL5OXXpPhIEtK9Mteav4Q
         HsuA9w+SIDhcZWhNm3AAbYwaWW9czG/eWR7/PHE4ENrKocFeyA5IvQptHAUwrFTEUJTv
         qdn0XlzBAub6+bPiq0Ncno1wJJJzxfKFO8jbFstjYxQ/AZwjafVjEvfeduZV34oaKeQC
         mbwuLx160dq83IlIBimg5m1D0hygjkYc17T85gxbXIgctdLl+YvCMuseEK/9i6SCpEXV
         5Mmw==
X-Gm-Message-State: APuU4Z+5//xuu2hbbjv+fpbIZt1lsV7lAhpkkM/Y9aVkyuU7bVN4YycW
	qJymwgKZOEuzzgCXzYhMpyILRU4sY/Ls2C7KTuGxXOa/HtaYb0wjMvyQ0hr9P67O7itea+jPsnp
	/LfsMk60dOrssmUWIyyTBqG2HC/6+tfNQ1sLP1ezyrmQby2rQTxPxgcAO83RhMBxZBmE=
X-Gm-Gg: AYBFou1Aezgv3p+LqZkjI+V21eFApw2UxGcUmZ9fhaMKkxz/7LSKJ6phY4Iev69ok7g
	TCDL9L5H7gFH9aWl1MWAj/2VKlTo+weV/7rlVyKC/39zODOkZsyFxlXqut2Lk7Qb4oN1Q/Mza0f
	jYqjU46A9Tn/jFazFZRup1owepj413ewV4Gjubf/BbCX4YrsRuGnV5yb/xrndvdsZs1JH+yej26
	VcLU9SAVcmQCg4Ivh6wXnKdJUhsWfRTVV6or0TmmEvgWpgjjjF9IhB4v/Pr3QumWiWyzF6n1xuA
	FO7P5ujGLX5qX/Y2FNVTnWnhmX0/MBlH6O0JWvYfbTLoCOZL0H1eeBR8NGO3xkApxxrXM+GCQsl
	+5kTdMofHLuL+XMJhRsUeEjsencq5YXIi4VPGzhSXT4+lv47Coy9TO89ulXgFqifJZK6TS9ugdE
	Ly074zQkPe8pOZLG/s4Q==
X-Received: by 2002:a05:620a:6f01:b0:93c:5f3c:f485 with SMTP id af79cd13be357-947b005f191mr653305785a.53.1794434389589;
        Wed, 11 Nov 2026 13:59:49 -0800 (PST)
X-Received: by 2002:a05:620a:6f01:b0:93c:5f3c:f485 with SMTP id af79cd13be357-947b005f191mr653302685a.53.1794434389102;
        Wed, 11 Nov 2026 13:59:49 -0800 (PST)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm13244740f8f.0.2026.11.11.13.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:59:48 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, peterhuewe@gmx.de, jarkko@kernel.org,
        jgg@ziepe.ca, sumit.garg@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: [PATCH v3 0/2] tpm: OP-TEE transport core for discrete and firmware TPMs
Date: Wed, 11 Nov 2026 22:59:33 +0100
Message-ID: <20261111215940.3503287-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4e556 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=McN5tr3TAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9ZQdPFlokNCryPtFuLAA:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=IoWCM6iH3mJn3m4BftBB:22
 a=OiMWn5MEmObRqTLTTlUg:22
X-Proofpoint-ORIG-GUID: Q9ouVyUdbVjvXr6QVy-7ZH4XaXfL8ZP8
X-Proofpoint-GUID: Q9ouVyUdbVjvXr6QVy-7ZH4XaXfL8ZP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA4NyBTYWx0ZWRfX4ukkLp2cSmDT
 +HAm1J3Ej2V1+eZZq/IBvdE9WTJ5K4R0JbZnzjfhP06e/g55K2eAKFTHiIyfxtHj8b9gIf6dyyg
 f3mrmHlcthx9TbzAb1XtpOK5a87tO32zzWFWVYL7AOImxNrXnNHSPOTzsTgXcQm4t/Dbmn8znFB
 G2m11FOiZvklg419YUnDejeKFt8laKkRE2NxQLTJjG47UAj9g1pcmAWZvll/rBVAy8VL5YKAgBT
 C1mYHfAgbmPrLT4dcL36iUXdbQavvj9ng+WdNKSw/BBr8wjE5AwkzLe0RzgnqQAcjM5WG4/4fIg
 7DpRVKMvBCz6ntUqu1eQaIh5PMsO3K+SPLYTNDDR6piCKW4Ocgua+fwAVqN54CBdvXkGug+JoVE
 Zr7zV0aPkm5h7GybUO08+UXa4srMFoyRDYPxwEn69Ii3cSAi0oCf7Tu8xdIumwOTqp8hnBlh1yo
 5P11rxSRdU1csQj/xBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA4NyBTYWx0ZWRfX97dqghpbAk+l
 2FnDrAT4UKFTjgvLyKM99YLdDwKYz8xfdiwqRBLrQwKFPQrE0zM+3lNDwkRzn12F+fDsM+hEiAQ
 KazbYSdg+Ptf5Ndsshz4sIS734HQdGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110087

This adds a driver for a discrete TPM that OP-TEE owns and the normal
world cannot reach directly, and factors the shared OP-TEE TEE transport
into a small core so the existing fTPM driver uses it too:

  - a transport core shared by the OP-TEE TPM front-ends;
  - a new discrete TPM front-end;
  - the fTPM driver converted onto the core, keeping its name, its
    platform/OF binding and its shutdown path.

Patch 1 is the feature; patch 2 is the fTPM conversion that justifies the
core. Both front-ends were exercised on the Qualcomm Lemans EVK over the
shared core: the discrete ST33 TPM (patch 1) and the MS-TPM-20 firmware
TPM TA (patch 2), each presenting a working /dev/tpm0 (tpm2_getrandom,
PCR read). The fTPM TA is the same MS-TPM-20 reference the existing
tpm_ftpm_tee platforms use.

This is the normal-world half. The secure-world OP-TEE support it binds
to -- the in-core TPM2 SPI (TIS) driver and the mediator pseudo TA that
relays commands to it -- is under review separately:

  OP-TEE support: https://github.com/OP-TEE/optee_os/pull/8155
  locality 4:     https://github.com/OP-TEE/optee_os/issues/8160
                  (design follow-up: the secure world policing
                  normal-world locality access to the shared chip)

Build and test it on the Qualcomm Lemans EVK (a discrete ST33 TPM on
SPI, owned by OP-TEE):

  https://qualcomm-linux.github.io/qcom-buildroot/lemans/quick-start.html

v1: https://lore.kernel.org/linux-integrity/20261026163259.1900439-1-jorge.ramirez@oss.qualcomm.com/
v2: https://lore.kernel.org/linux-integrity/20261110141923.3100770-1-jorge.ramirez@oss.qualcomm.com/

Changes since v2:
 - tpm_optee_dtpm: give the discrete-TPM front-end a .shutdown callback so
   it releases its TEE session and dynamic shared memory on shutdown/kexec,
   as the fTPM front-end already did; without it the session and the
   normal-world pages stayed registered in OP-TEE across a kexec, which can
   stop the next kernel opening a session to the chip.
 - move the shared tpm_optee_shutdown() helper into the core patch so that
   patch builds on its own; the dTPM front-end no longer forward-references
   a symbol that was added in patch 2.

Changes since v1:
 - split the shared TEE transport into a core; the discrete chip is now a
   thin front-end, the tpm_tis_core-style solution that was asked for.
 - convert the fTPM driver onto the same core instead of duplicating it.
 - use an optee-prefixed name for the new modules; the fTPM driver keeps
   its name, no module rename.
 - rewrite the commit message with a plain description of the components
   and the rationale for a separate front-end.
 - drop the explicit zeroing in favour of initialisers, and reword the
   module description.

Jorge Ramirez-Ortiz (2):
  tpm: add OP-TEE transport core and a discrete TPM driver
  tpm_ftpm_tee: use the tpm_optee transport core

 MAINTAINERS                       |   8 +
 drivers/char/tpm/Kconfig          |  28 +++
 drivers/char/tpm/Makefile         |   2 +
 drivers/char/tpm/tpm_ftpm_tee.c   | 295 ++----------------------------
 drivers/char/tpm/tpm_ftpm_tee.h   |  35 ----
 drivers/char/tpm/tpm_optee.c      | 253 +++++++++++++++++++++++++
 drivers/char/tpm/tpm_optee.h      |  32 ++++
 drivers/char/tpm/tpm_optee_dtpm.c |  73 ++++++++
 8 files changed, 414 insertions(+), 312 deletions(-)
 delete mode 100644 drivers/char/tpm/tpm_ftpm_tee.h
 create mode 100644 drivers/char/tpm/tpm_optee.c
 create mode 100644 drivers/char/tpm/tpm_optee.h
 create mode 100644 drivers/char/tpm/tpm_optee_dtpm.c


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.55.0

