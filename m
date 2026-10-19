Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8450484891
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401753; cv=none; b=bWe7df70Xtb5bNJuFkBGRHr7XTwvVG2jKEF154MRCvUu4SzGGUVTwaKhQadl8oxldmFnCUlmUGfTAhsGWPF2Xs9wrOxMwJOV2ghwYReDsRp9rqIviGnUkgphyJV0ppu5FzEd85Wbbz70vThBSBiN0ka0w/9QdcRLocBRRirZNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401753; c=relaxed/simple;
	bh=YSCzLQSB16uKcbe3+cGF2KdfW35CZ03t502Q8V6q/LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgXgIV47ZlRknK/VKoFg3dbnA9YMy+xHDRUsXTFC948nO44vLfEBo0jJp1DnJeF+9SSpdPmsz5HRq1n06Fx62wFhHX6muAudUgxCxmZ7YfrxuOfGrRvH1VE/cpKy85NVsf3UsHqrkF/E/PiS5ht0152swVMS+2er232SYFL/8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8KQYvfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZhrvBbMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8KQYvfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZhrvBbMZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtCm2752271
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPhY8yd7nilzGQLPZJehSpMwbHwaeWfXH6IGdZHCFa0=; b=D8KQYvfUiGomP2vh
	1E77fvOYjhjovo6v7Bq98ClXgB4uOqnjTsPDOdrHftph6UYBzuPUPD6cker2nYcH
	sZK1qQMPRxWJ8xLeCHgs2qZ/YYCReKRggLsnwxL8QJ/L4NsgBBGDtvYa0REueiEY
	M4tp6vNPPrASIuFcvB08XU1frJyDqYdqOjBQivvdDpTIVCc8LyZMdz51LLdF9RaT
	570etR8Ruyq8diobA+wKbzaXeu6/Xx3DVhcT6rek/nM5C5qiZ83MyyXVCYaELnIF
	ZN8l/qkKU8Wv26frf1wboAcmCupB98O1HA4Fp8YqGZ5Rb6Eygy0NkT54KWYyRY4B
	ZXpV1Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gbs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:22:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso3033139eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401749; x=1793006549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPhY8yd7nilzGQLPZJehSpMwbHwaeWfXH6IGdZHCFa0=;
        b=ZhrvBbMZs9Ohv/ZhZRqyMGSK2y6DvHZ3gSB77Z/CR0L4Ua/Dj58vP9mES9UK6TM1/f
         WwyKzUPZyqnQ8PfNRLFhpHp5nMnOeJTWSmUGf4S9kIMylx5BxA+h4/kvapeZt+ccg8d6
         iY/mqzkCihPxlJnUPcEsglbxnqqusfDTlwXM8sfc6wvsVbBqTyjSyUMqk4T/fbDD4Yv+
         gbuJ6IPlKQlLmJWTQlnAvTOeSiu0VFJ8TLODk4iWLLwwkUwZwscIToelKb3SnggJdl7O
         atXiIrTqKOM88tSkCYww4pOXq7QEHh1/5wZwrlZaRV07txci5m2RC1Y8eHZEtr3PuTby
         VgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401749; x=1793006549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPhY8yd7nilzGQLPZJehSpMwbHwaeWfXH6IGdZHCFa0=;
        b=ucfyJt+yZ6idkKLNbgZwBGQuFes+mTeSto3kbee7SCbDB9nYOKaDhDK/ux9n9SMvnu
         CgvYqRf+6MIaKCaybQ1Xl9hlCM6vYCdFdbIqBEfv3EJi+eRujf0nni/dcIz/ZOhVytSH
         C+Yvap8Fk8n5E6TsJUZO6qTfp6z65+RGZu46woyNRT+kYS9prlqA+47o9a99cmNk4QLO
         9T5MLz2B2m9PGwHZEq84+MGo/kAhAPHKuu1zS0ufsKd4yleTC2VWEcL+ZILMvVxnN8bB
         uznr/RDyYJMvxG9fUW2rynb00IPy91LQAn85ibKVi6EfaJktcj7b89suL+nZBk/DiREN
         2giQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSLkcOEazZdns+0eDYkFidAkeMoQUYd2B+Ldf4pJ4kBs/Wo374MU4yrKipcujPcWxAE5ofxe8mLWmlnSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXmynrY3fkej1jlSsxpU3u3lYd0MESTr0HOoCVRYn9ccE7L1RN
	Cb/aODKd+SxiZ/iL52wBas0w+drHR7ZuE8oFgy821eHeUkzGw4Gf0NN1AKXNp7neAaB4+TcCEJW
	mNvsQsxTuoCqu9YJegXuddicvGYvpwFdYvi89jmW4vPqCcgMYOEqnbcV73n49CfAMkug=
X-Gm-Gg: AYBFou1Pe4npFxUjsEpBeoEf/reJey5vqS0qxPJpLnAggUkmOL0iwdgrrPtyHxAWwqa
	37CVaEp2zBCx4ZqlS2PKFZfYuCcUhTeTqZ6yUW5cKnRA0fzn8ebrbRbERWT4o72ZHJWIP9Gh/Ke
	+jXUK8WeLHS3bYGvCQ/aZtt4LdlJzifOU90087vI7n6mh7Sd0LOLGPOOKycuLn0xXIN+JohPCpS
	JV6LmKAtnBXnxR8PBBTwMXYrByFEY2DtNdKgr0CPtxsUTId3AwlAf/HoKhlXmmjCN1FTHhy/X5/
	jy9KlGUn2xjcE8h01UTI3EJ9saJzzz/6GdP14MLi10ETN2tgtn1W1+HSEf8NwGst77uMgO8a+l0
	CUoMVdVGtHUyPFIq5yNwg+PtvZcdb/9bo
X-Received: by 2002:a05:693c:6395:10b0:35d:b44:a52 with SMTP id 5a478bee46e88-361a23528d5mr10797495eec.24.1792401748822;
        Mon, 19 Oct 2026 02:22:28 -0700 (PDT)
X-Received: by 2002:a05:693c:6395:10b0:35d:b44:a52 with SMTP id 5a478bee46e88-361a23528d5mr10797467eec.24.1792401748285;
        Mon, 19 Oct 2026 02:22:28 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm56225094eec.24.2026.10.19.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:22:27 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:51:48 +0530
Subject: [PATCH v4 3/3] MAINTAINERS: Add Qualcomm TPM driver entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-tpm_qcom_driver-v4-3-6889b9804ba7@oss.qualcomm.com>
References: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
In-Reply-To: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX9s/o6aiOhuOx
 iMeTIsMla7jedDX+jtyFvM3l22COQfXDuriaJ8R3OTtkq0ZLqlEyZtWrbx9xw5RJPGxC7U/Bvt4
 emFEO4OcnDDG7dSOJAOTN4FIRoNSihWpqrdWtI+hG11hFmgJxSGM7NGMp5soh546XexwwRsaruP
 MTcDICiLmHGdaXrUHP2hwLRuCxhoQsJt3CHDrWvBgVCnjc14F9w0hCmez+A54Qts5cVEXLbjwgN
 HwcmD+ipRXD92wAKrFYnDqaDKNf7nloSJsWtnWfVk/tNuleC6srEiD0eAsIsaD9No6oxTY+UZl5
 MCyjWQeukibYoDCwVRxWr2TDueO5JD1yaJTCPGeVP6RCQtnK5PNSeb07tEd1Vh0SO3OZ1BIeTLf
 InM76019MbZ3nySIXteUeJtdlwZy6QNq65NZ36yPa6aLFuLuT64WIYjp+SWyyEl7Dtrn5MIJSY4
 K9FZAYAl2rVz7JVQn0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXyrd7tl3C3P10
 5NceNkBvcKi2g29ZGykbAhTqR8ZYJjrGzwso412OD6LPuqNvrsDVlxWG5dLEoZSjCsmmGCF+/3y
 h7SH/IXLiVPGg2xRrrveXTv1F+iW9TE=
X-Proofpoint-ORIG-GUID: 0n5YyZ_Znt3C_M7fwEo45iyd9w2I5cm3
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5e155 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tHMf5gnvwFDjO4kcr9MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 0n5YyZ_Znt3C_M7fwEo45iyd9w2I5cm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

Add a dedicated MAINTAINERS entry for the Qualcomm TPM driver, which
uses the Qualcomm TEE interface (qcomtee) to communicate with a TPM
Trusted Application running in TrustZone.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb43b8e46158..bb86a7c024e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23160,6 +23160,12 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM TPM DRIVER
+M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/char/tpm/tpm_qcom.c
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1

