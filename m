Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406659;
	b=kGfCwge5FLamnYEwt4jnOhiGRKu6d7gSAov7UlucqAd5tW2TipqmZaIk09Y/fIWpNqGY
	 j5xKXRwRhbwJaoiat/pf84VfDwBojewRNh5nI5lwzLkmarm0EV0sKLITtblwXbIf9BTku
	 QwhyXpG9E/jR9nFJQJ2XBFfovS0P1GF/6M/ZVPCnRkSnvL5EI1cCxh/RbXE43TtHScxT0
	 N7XAOV3HrP2EBuIBuDo55e/IzVRblX1WQPjM/z6lHAz32GaGkixPaGfUWsOdkNfZTRMK6
	 kNAwvIgUG1tU5CZdzEGodTB4PZWKinCTArHbfilpAadxrmyD7edW9eIyu7Yn+pGg2rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eW2UhyRiYSQk7BrcYmKzFS/v8E8s6f8Ay7GtoS+hhwU=;
	b=FBeKmXjjEaReztNSC8gXzudBwFmLh5N+PA+/ZvtAhuaZFBVayLtaCqAz29Y2+wtxhAxo
	 InVWckDUQxB1O2hJdOwS02TcOi+MqpLwvqayKKJbfE1ZPWDdL8Zj/F3C2I08FNu/Qj0eX
	 FXZT7O8UsdXcBJrzA4kNRmIgsbwltWgSaw0ES7P1lzMy5cGlwcbZ761+IbWgooTPTXS9I
	 YIj0XuRn2knvUba84OyU4f9HgkqbeP/KQnwtOEN+PWv690eWHodTg15MVSANuTQ7iTcWw
	 g41gVhVxtDw8HF13Bz4H7b3K30VcenxppmxtNdz6egQn8mkB4HsoVPgpnozuCo3shiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKFpuinj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGkqqwyg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C783B606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C783B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKFpuinj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGkqqwyg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZIqF2975696
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eW2UhyRiYSQk7BrcYmKzFS
	/v8E8s6f8Ay7GtoS+hhwU=; b=jKFpuinjau1zLYnX5zUchqtM3aZ6lC8IQXIAtV
	eyh/DxW9o2cfReyRrOJMmXrjbpvx9zA9yp/cT2fPo4290pTbJ/sF+DdH1atkrE9Z
	T9KwMi39K/CfdWgEjHmpWA02DI+lUSvCbi3f2F82GR4sH1j1b4aj0AEkRMEbgGOP
	leACprW7BtwR73xSGOtzjG2mWM77Dv/eBqQphtsSZr79BBmgybqKCTKzXDnCf+z5
	/PXdRoBfjJfxzVWRpYjtUPN3Sc62iuM0otkOIvbxT28qfRWf+927XkrSKgCDommW
	vZOdPjZK5wr64vPIJbiEPkAAq8bNqC9frQ2SMkK9SFBFIkWg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cc6h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so4238456c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406641; x=1795011441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eW2UhyRiYSQk7BrcYmKzFS/v8E8s6f8Ay7GtoS+hhwU=;
        b=CGkqqwygIBIMCyOf+eJlxTdMmBsxjwE2G42yybuF1qcHvvGp8KvfjIFiC2vvnjGC+M
         1S3RxvSmYYGhVrhU44l8hEjIPkdd0AoXcLC6n4BQgdwQtMqYRCc1QdkLxfeAaHcLNXSc
         JvVnnkQiY8RO3mt+ovTra6vLDtz/lyL4q8Ea1c2RPH4JTDZ9D1KboiB7WBDbDr7c4FF8
         htKWVLlVI/wNIhUgCtIn3z3zebTCf5JTifZIEpuCZS36TyodUQBfaEP4KAF9K3L6D8t2
         wkeFq5I9w2KzRLWfBIZ4I2EKu5Y9KiQdz0vkHAoOdHphbpYeqgYAAlGoJoKMXbjj6723
         B8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406641; x=1795011441;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eW2UhyRiYSQk7BrcYmKzFS/v8E8s6f8Ay7GtoS+hhwU=;
        b=ul5iq0P3XoHrRwyczmNrYixHnhdNVx1Vvqbw/6GhtJJA/UKSc/hbXYnhhKYkIsbaCe
         01DPYLx3zSkPtjmGXPiCDdBcVbF6BJraS4wnK5/RiWu6/wI066cL4aMgD4v6Z6KmCvg9
         6sPpv+4jkDfsPoMLXWovNJTh9HEVMz1S5+eCmRke/Nsn1o2rgTx9IYhfT1rMBNXWC2Jq
         qPNV+t8hG4D3YRZWZn5UJko69TaUmI7IMXid66eUY+TBXCRY9r0yFtwklW2RTqKdTewe
         Xc+83CANGze00Xiko2UyuP4P+QlZQL0tSgv8XZKBLEroZfD/mMUq0wdIy9cOG2SkuqGB
         N1/Q==
X-Forwarded-Encrypted: i=1; AL+hErHVQwOS3pX3h9TuQSCFV12xSpRWdVpexUZfEWwBBcBLsD5wsxirfX2qURj4FX0UATC9nOougonbpSsfnRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SAnw2ROheiw7L4HSIDmnaWDPMiBvKICkrVHL4aL8CxcsOouo6
	VG83agXtGsXh2gz2a2N/j0ukdMX8r28yT3OXZuWxe2JDkSmmzYOTU3RoHCvb/VSOnRHLO3Zo6FF
	IEESWEY/4EgvfNuEhE4w+bsIm0qNyJrT1paOTe8v4orLFaCQ3hwol6WroYl7yxz2su7I=
X-Gm-Gg: AYBFou1ocuRxKqzAbCuzOiSlGH73zMEc4HOsd/pPpUxqMuedD30JUHJnjRehRmgYiBE
	/REH0rv99o49YtIAPbywP1zuFZcucnNqPBDUoPOkrwti0IVGsDpzCVoCkR1qMr6u2Q5XugjbvzI
	l02/tOukHsZADFWX175I/T9lH2A5b799EzytZdV8OcQuVWKstf8cM/l/dKmu2qTw4QgwE83RTpP
	DsAOiyqu8uwIsztpFJKC3os7kR+GQX1QsrXUD26eo1AjEYglOJSzz+9JsK8w0C0vaMGdFq1bnYj
	8keXGV+0UQlC3ZHm78dDVL0jxpOPUNodbAb7AIfRj+VhE1OqcicRAJSNV7DVdgcpZowB3Xn7639
	Y1PB1J+Msw6Az47kJxDjGWXnmHG7lPs6BawTaAtbu3VDg7ypkOrZxb3mETPEu1GEoyAXZDIC9bA
	==
X-Received: by 2002:a05:7022:ec04:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1b3c02f12demr2549969c88.8.1794406640731;
        Wed, 11 Nov 2026 06:17:20 -0800 (PST)
X-Received: by 2002:a05:7022:ec04:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1b3c02f12demr2549910c88.8.1794406639438;
        Wed, 11 Nov 2026 06:17:19 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33747063c88.10.2026.11.11.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:17:19 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add support for a TEE agnostic Inline Crypto Engine
 service
Date: Wed, 11 Nov 2026 19:47:00 +0530
Message-Id: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANx49GoC/32NQQ6CMBBFr2Jm7ZC2BAyuvIdhMZQRJhGqHWw0h
 LtbOYCbn7yf/PdXUI7CCufDCpGTqIQ5gzsewI80D4zSZwZnXG2NsyiecZIh0sK4MKMmj1T5vm6
 qhrisIS8fkW/y3q3XNvMouoT42U+S/bX/fcmiwc6UVccnos7QJagWzxfdfZimIge027Z9AUUog
 ti9AAAA
X-Change-ID: 20261021-ice-migrate-tee-svc-a5cd6959ae36
To: Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794406634; l=5437;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=x2E2YNTKZj3RAxxnbF3g6SwjXlGHcONpTaIQkMBGS/8=;
 b=64OiN5sq39/G16H5ou1+rLokpwVcvzrkH0yaWTd8gn/Ai1zOhL8xzA2W3pLJfDv644uNNdwMG
 1/80Bm4d5mJAbnTJpH7f57ohtu6p4Vn+HnsoA+f+UjMIwlzUsxVELm0
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX7USUknzjWFqC
 oq3c8mcfq0LqMp2VwN96teRjd0pBY9mQzyT+nZEh593g5jb4lV3SEgO9ZESoMzlAY1bnCrZLds7
 GuAi6gTubbzyXhHZIOAbMyxCTAV5a1z+6p4hM1MmeZIIyzRNfN0HZKSnKmqHs9aHpHGZWQgIksz
 fnNFGWYFfs6snfJcoTzLSHQjEk3c0HEb44hndqpbCrOCEEgZbyCZOFCQ0t7e0sOTYRHDF4naI/U
 YGDIkm81Gt4xMrjO1sdeugQGU42wRfCH43QM7vx+c9WXItqTnnvptunlSu2mDSVKdWYJ4Idc/kH
 Ty0YR5E2kgVKWOQ6ebYM3qBeLYBFUCU60WivtmYfPwnN9YH7jzSD2lF/+hMcQMlECRte75oIq7f
 dpvUL2vmj8K7y+rYQfn9pXQO2JSN4cigJ6MbZDtpFqKsMEVThgNKLIMc2daHVSHxStLFe5cr8iZ
 +SSCvAI07kvmaKZXDkw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af478fc cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_EMmJvYMAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZDveMJu3P3cY9s7oh3gA:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=emCv1hD2LFd8cNRmW21v:22
X-Proofpoint-GUID: lSTgAmUxAWHSyaiOB4q498JypsycEL63
X-Proofpoint-ORIG-GUID: lSTgAmUxAWHSyaiOB4q498JypsycEL63
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX2Wwi0GicMb4l
 iZYzNh0/fmceaYeAXIl6epevL8q/ens5hviodLWzMbNyZLdEeI/bWH96lINYhg41McEbKoiiCZx
 tMTA9pnOImlk2H9XV6wv4TnDAhMVoH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

Qualcomm platforms such as the IQ-9075 EVK now boot with both Qualcomm
Trusted Execution Environment (QTEE) and OP-TEE [1]. However, the Qualcomm
Inline Crypto Engine (ICE) driver currently only makes SCM calls into QTEE.
With the arrival of ICE support on OPTEE [2,3] for Qualcomm platforms,
there is a need for TrustZone (TZ) agnostic APIs which re-direct the call
to the correct TZ at runtime to request programming of the secure interfaces
on the ICE hardware block.
    
This patch series adds such TZ agnostic APIs to the ICE driver for
requesting secure services from either QTEE or OP-TEE depending on whether
an SCM driver back-end or a TEE client driver back-end is registered with
it at runtime. This series is logically similar to the one introduced for
Peripheral Authentication Service (PAS) [3] which was recently merged to
provide a generic PAS service for both QTEE and OP-TEE.

Apart from introducing a TEE bus based client driver for ICE, this series
also adds support for optionally registering a TEE device which represents
a particular TEE (QTEE or OPTEE) on the platform bus to enable drivers such
as ICE which poll on the availability of a TEE interface to be notified.

The ICE driver is an independent platform driver which polls on the
availability of a TEE interface (SCM driver) before checking if the ICE
secure service is supported by QTEE by querying qcom_scm_is_available().
The TEE subsystem currently does not provide any mechanism to notify the
availability of a TEE interface, i.e. whether QCOMTEE or OPTEE have probed.
Without the introduction of such a notification mechanism the ICE driver
would indefinitely defer probe until the OPTEE ICE Pseudo TA becomes available
on the TEE bus implying that for OPTEE builds without the ICE PTA enabled,
the dependent UFS/SDHC storage driver will fail to come online.

The TEE bus based client driver introduced in this series which registers
with the ICE driver has an ABI with OP-TEE that is 1-1 identical with the
SCM driver's ICE ABI with QTEE. This is because both TEEs implement logically
similar drivers with the exception that OP-TEE currently does not have
Hardware Key Manager v2 support and so the inline encryption functionality
with OP-TEE is currently limited to Qualcomm platforms with only Hardware
Key Manager v1.

Validation:
This series has been validated on a LeMans IQ-9075 EVK device by attempting
file system encryption via the fscrypt tool.

Merge Strategy:
All patches in this series except one touch Qualcomm firmware and soc drivers.
Hence, it should go via the QCOM-SoC tree. Request the TEE subsystem maintainers
to provide an Acknowledgement for this.

[1] https://ldts.github.io/qcom-buildroot/index.html
[2] https://github.com/OP-TEE/optee_os/pull/7906 (In review)
[3] https://github.com/OP-TEE/optee_os/pull/8137 (Draft, depends on PR#7906)
[4] https://lore.kernel.org/all/20260702115835.167602-1-sumit.garg@kernel.org/

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v2:
- Merged the furnctionality of the middleware ICE service into the ICE
  driver as requested by Eric.
- Introduced tee_platform_device_register() to fix the issue of indefinite
  probe defer in the ICE driver when ICE PTA is not enabled in OPTEE as
  pointed out by Eric.
- Fixed type "Psuedo" in ICE TEE back-end commit.
- Fixed space based indentation with tab in ICE back-end Kconfig.
- Ensure tee_shm_get_va() failure is checked and ERR_PTR() returned.
- Validate out_shm size everywhere in qcom_ice_tee.c
- Zero the memory holding the key when TEE invoke call fails.
- Check failure from qcom_ice_tz_ops_register() during probe.
- Cross-check out_size and lt_key_size in qcom_ice_tee_generate_key().
- Always return 0 when qcom_ice_tee_probe() is success.
- Did not collect tags from Abel since significant rework undertaken.
- Link to v1: https://lore.kernel.org/r/20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com

---
Harshal Dev (6):
      soc: qcom: ice: Add TZ agnostic re-direction functions
      firmware: qcom_scm: Transition to ICE TZ agnostic operations
      firmware: qcom: Add a TEE bus based ICE back-end
      tee: optee: Register TEE devices on the platform bus
      soc: qcom: ice: Migrate to the TZ agnostic ICE APIs
      firmware: qcom: scm: Drop exported ICE wrapper functions

 MAINTAINERS                                |   8 +
 drivers/firmware/qcom/Kconfig              |   9 +
 drivers/firmware/qcom/Makefile             |   1 +
 drivers/firmware/qcom/qcom_ice_tee.c       | 443 +++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c           |  90 +++---
 drivers/soc/qcom/Kconfig                   |   1 +
 drivers/soc/qcom/ice.c                     | 173 +++++++++--
 drivers/tee/optee/ffa_abi.c                |   8 +
 drivers/tee/optee/smc_abi.c                |   8 +
 drivers/tee/tee_core.c                     |  21 ++
 include/linux/firmware/qcom/qcom_ice_tee.h |  10 +
 include/linux/firmware/qcom/qcom_scm.h     |  20 --
 include/linux/tee_core.h                   |   9 +
 include/soc/qcom/ice.h                     |  56 ++++
 14 files changed, 784 insertions(+), 73 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-ice-migrate-tee-svc-a5cd6959ae36

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>

