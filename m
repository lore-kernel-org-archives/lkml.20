Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320371;
	b=L37n/+YpS1vWex8Jf7/yRGiGq5LAyC7VYjzCjyV1xdiLrpdP+nQIBr4HzMcbuvIbsSsq
	 uiabYljBH2d9DC2Mzn0onw0eEZ0VAbhw/o/syAnExKHEhHwoF+96FstgsEya7xmkpl0O2
	 Ch/LWIqsmuUb4Yc7b5ZSgL2JozOJmLyXSN1nE8fR7bL4gxALdvOTXZbv0GESYt7qSHz6P
	 y6BHFHrX9DnHb15OFMEGyv9YajPy42qNqKQ9dq5R3qnNXQewzPhx96gxbQpJFIl3v27Bw
	 as7c+cyMYpKXJvv67Xja+q9RGPz16l6nf/v4gEZPCwn+uAbKnUWIAbljGgttNcu3NLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SOmC8+52QuEKRXpTW+Je0JIByHwi7+mD7gdJtxS54hM=;
	b=HLDv/nmgbRigLWah52HHctgeQ2rWBfcbq0Ce9KCd6HwXJQe8HP4opiGv7rPXacM8QCbP
	 XmyR4R9JrafA14BC9+AX0hvFqpAM8zD/ECsN+Zu/0HqbgnkCUQwJjCU9tsosmUP8barUo
	 pYLr8UFGLUmD1KzaK4V71IfxA9Q8I+ulNib7G3G+rnSgPgIxqfX0AOub20Ax8bXlTcGQR
	 +DpxXl5daoaSHYRTzJagyuUi4G/IT1Sn1ulI8NsTTeO8KKqRG4oy+i+MaUvxFiaTYqchs
	 7h4QReOu8qcrDTWGPNYu1FqrCkpsVHgjbg4RvQ5SlgDOIyaz8IoZAvcu2Ok8vJYCVuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f97xuXUw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drjGgTmD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4DA606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF4DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f97xuXUw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drjGgTmD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAOXN1599667
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SOmC8+52QuEKRXpTW+Je0JIByHwi7+mD7gd
	JtxS54hM=; b=f97xuXUw0RkSxkuNBi6U2xV8L7mlCxLZaKuO9w9he6slJvkZiEV
	S1Nb/I4AQgbENcVYeeqpOV+oMF+7LRlHCdJxayxAKO7r71Jrczn7jHkNTiKZQKhg
	RVEfqT6NAJhQ7MNV7OCYycqmM2vWQW5D6ufKywUglSetoH48XV+uLX5i9GXNY5CY
	xQc7hs60lBItKFq/tU95NyrCDIg8ST9tY7MEf/HcpQYwNjIksmOb8GwqIKZC79cz
	wkq94Mv+GfsmYdQi0VmgXxcoxuRwGASPgIC2PE1mPih9pqateO1mfmsYE1/ad0iT
	PGBFSHhi1PQ+XL+pl6fm6AWt+2Ooe2uyC5g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4ae2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:19:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99082f450bfso1633741241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794320369; x=1794925169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOmC8+52QuEKRXpTW+Je0JIByHwi7+mD7gdJtxS54hM=;
        b=drjGgTmDh9I5RvLGuzoKzO6cyOfc40Y4J78qi/N3bFDcGcKOm1wV6Vf9BiSBlh47uH
         byK76KgICLRDfOnXm5G7WZUv9G+zccQlQ75lodTVZDcRzmgfaqlpI7JF+847CY7RGT0U
         vlQaj6ks4NqUKNhqq+zn11fEjV/tv6KcqpnvKVBflLM5/gixJsEzbrRzfv9eE2tw8Iq0
         pyXQV7AG3tn7zOreq6jgcJz86jDTq0jHD42fCSxY6aqSskidOGQSc+L0At8Yb1YP6zcH
         3ELX0YQHsqDZ6+d+qJLPTQovh0diQWNDVC/7bY7eUU0DzAvYtpKl+ftZ0pnW5C0KHcMh
         MFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320369; x=1794925169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOmC8+52QuEKRXpTW+Je0JIByHwi7+mD7gdJtxS54hM=;
        b=ALvdko79mEc+fU4ckrPyvqvokA51rJ4iEsvdBfthElFREOu6Km/Bu/05FCb3pfrcum
         vusgIg8BecmBWAjfPdpZYDsiKvbwQ8nfskISVFp6sujuf79mzpdyIiHAjAltmM5JoNyd
         ZGCG4tAPoOpaQcQ9Scc60UQZZWjuDJq5/rx72T25TFrlWZsAPTkcNZEtG9shcdPPePzu
         L0Uskcki3rBQJBasJTtfJAMTA/0Un6+1xZswa49J2VH9GJ6+Kf8XVusegfxx0ECw493J
         tIruKUBMv7DHXOzUVkAOstIYFFXE8tGwtA3LmZ/UKIv9eDKIVvebaRAcDHIXmjBjMldS
         EYdg==
X-Gm-Message-State: APuU4Z8sWWMeuANuhDjPpsH8+SaEvdzaFC/dQtDrBc1/5XF4xMzgAGB7
	xbKo7FIr+dE015KEw4svvscDx9et+VRVKDjya3EAMAiCOcjuJXMMrxZd0J3GavU2UmITpX0ZZQo
	TZjfJqoZFCy2O9aa0EakPCzPMn27v/GusPL9+hTpy69SYnSSGiFY2Fk+V1xR4IHwHkjY=
X-Gm-Gg: AYBFou0+Aa1yEjIYzdyaOgSBzYvBWaZ7SH1/munZI9A9IFIMo01ckfgC4hSB0rXVqK3
	5ht343g4afpa1OIWGKOl6UhpRPUqFj608ng2ABcWArOdcUAFF3WMaUeqGW+gc9cEAGr/6rfIbgx
	s9z+NOHDXt3UXvuT1Z1bgrAA6jvnXiEtyQUvyTTyl3xsZXOfD0AwfE9/KC61vC6SKX7psni7VdP
	8GEgMWBCFzdEiLaBCltwkdaCzquqoduWnNH4xW3A8mAbUAX07eopP0P6oyqTmwF0QLo0+ioHneN
	m9noRffPg48hgpiR9Qqv0D7vZ5L18zIHJ29n6ho6w9DURIBmQLn7yIbj0Wra75vW867cXQF6qfD
	VNtgVr0sf6XHq54gRKN6U3Iw444iUUsRVRiU+YOs7Qd/wVv+603rfDSlRzJ+IEUYM1CumXkb5Tw
	i0dyPN2QPuOnetg1t7PQ==
X-Received: by 2002:a05:6102:418f:b0:7b3:32fe:77b6 with SMTP id ada2fe7eead31-7d301ab6ca3mr1046753137.3.1794320368768;
        Tue, 10 Nov 2026 06:19:28 -0800 (PST)
X-Received: by 2002:a05:6102:418f:b0:7b3:32fe:77b6 with SMTP id ada2fe7eead31-7d301ab6ca3mr1046715137.3.1794320368239;
        Tue, 10 Nov 2026 06:19:28 -0800 (PST)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c99bsm5418133f8f.7.2026.11.10.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:19:27 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, peterhuewe@gmx.de, jarkko@kernel.org,
        jgg@ziepe.ca, sumit.garg@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: [PATCH v2 0/2] tpm: OP-TEE transport core for discrete and firmware TPMs
Date: Tue, 10 Nov 2026 15:19:07 +0100
Message-ID: <20261110141923.3100770-1-jorge.ramirez@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX4xwNGoPUvnsL
 ZxQ9xLCPuPkr3s/wikekk8v3GgI2ur/ZI725hvSWShDVshF2LMdJS6ZasJG4a6uMiwc41QeLVSs
 eaD+RjfseLiOjVDD/fArRiOPtOyPnhQ=
X-Proofpoint-ORIG-GUID: aTsVQp2r5dk8BI9I88NjNi5CFm2DtmCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX6aYqX/nbamcz
 72rJMQ5NPx3KjdC/QvHTZRhTZlXzZaEHqVrXSxKdZZJ8sAUaEElmHWcCZaKwCWupihCj4wvndcI
 TUb2LTEWybRcsv1apoTycDeKzCv8PA2zzqsRRbghk12/TPBO/EJff4RAl1waa/qHosmWWGt9w8S
 yDdtaiNB0O4bXHXOnkbquKN1vEO3hu3DGNhNzGlFxzimwHtYCm78Vu+TGm+uaL5cvm6Z3Jau24W
 dYr7YgwR+rUgz95FHVqYdTSYlEXFUkG7F7RvFNYPyN5MGz+4BaLjZWtUIWrJB5xiedixMHVhZyu
 Bh2kFMkA04TUkiSP79L5oMay60xYXkZhuuBCERC2/jXSeilK5y05sSbi4zSQOZoMqsPX2JvYrHm
 35CTMch4LbRGvZ80mSw2D+wRJPnzv4+R9kgDR2DuyMMohnxCovZxSReFH9+AjH2VOngzLf5hL7h
 gkDgqdapmMDkWo4BISQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af327f1 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=McN5tr3TAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OUebXRtQ7c3ikY1XWJ0A:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=TD8TdBvy0hsOASGTdmB-:22
 a=OiMWn5MEmObRqTLTTlUg:22
X-Proofpoint-GUID: aTsVQp2r5dk8BI9I88NjNi5CFm2DtmCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

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
 drivers/char/tpm/tpm_optee_dtpm.c |  67 +++++++
 8 files changed, 408 insertions(+), 312 deletions(-)
 delete mode 100644 drivers/char/tpm/tpm_ftpm_tee.h
 create mode 100644 drivers/char/tpm/tpm_optee.c
 create mode 100644 drivers/char/tpm/tpm_optee.h
 create mode 100644 drivers/char/tpm/tpm_optee_dtpm.c


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.55.0

