Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFDB347FC0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449718; cv=none; b=C/T/5pEsGxx1Q49yk4c62tqX1V6OTz5JE+eENpSd2Rn97ZMSrTFzS2ShBhQ9oIgRaEyQbK78uegBlHp4/wJTAKbr4uxTqsS4t+0boiPZjC3j9WyxU4l4Ny+ml9NRASpJLKf9QQNH30pm+lFRhseeSM06ZsZMYr9jcuUoZOPP1Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449718; c=relaxed/simple;
	bh=s3gC6gsgYrRYCi7vlJQcmCDW/z3riFeIcysrnzUXaVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCsiBd7ew38EQFCiqrUdY7oZsfNFJ1YnWxPXji/TvbtRFSzDr9gL1jNXfLLoXzNbCL3gHdmJV6JpraZ/+yYDz8aGhagdRhhqOKtweeDbxsjXFfLp59wnQhA9MHmht3Fh1XGzJF03aJRnEAGAcH8d3SzN0bhE61gzMfNFQ9t2Aug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVYKGVqx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aivxqoaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVYKGVqx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aivxqoaI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KBGL1574597
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FEjS5FEZuwM3ZCGKpsUAP1vOhfvNdfePeWt
	JrPWwgQM=; b=cVYKGVqxKMSJTxFSbKsk6A/2goRNqzVdoaAzG6Gj4wMlsGLvlc/
	jgnuwnBgblUcCzYRoAe0L5d+tfdIeeT6h3gFzA/LO5Gm9umulIAs2XWlZQrBgPDr
	z+uKZAHSh4zIRc8kpxa/MmFcZi6l8xgnyiMfZ784d5YR6c7Br5Ywxzm+MXEivBdh
	TB1aauxSFWn3aa4i923ewQBJDnkKlX+Bv4hbQkkLj8njnHU3C+4dseoZrhYogTc8
	18M9q6dzayfqFaeZjyJPxJ5ClFCpyns1q/wGKTNmEq+rlHrdaK7U65Env+PDsiVg
	/mGTIqdXXLhxhhrxaVWFCye7s8ZfV6F6AMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe521wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:55:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so970366085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791449714; x=1792054514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEjS5FEZuwM3ZCGKpsUAP1vOhfvNdfePeWtJrPWwgQM=;
        b=aivxqoaI6nwPVnuIjzheu8hkR6uAEswzEeU84zRVRFPUBhnc5k0pzaz/jOhG+eoSrV
         7GT90RdaoTywfioKU3u13zDvFw2Q1rASMwAD/cs4x/+1T9qALBBY1jsqNEs39UxB8Z+m
         /7gHv/Bw+9JRgLTzRCgFHcmcoI0U+zWuuK5z5+amdV1TWNyOOjlMi9M4WMmqsuhczZvL
         xSVA7V1df1nFOVFi15JKvNI94fbPjxL0rsbxNfOvmHesJP1YKjaxRswpCHa6Wedh0Ito
         WPzyrk+5fUMW/bv8QeXmVOERcWFw4MBATSzPDzAZP0KFSPTYPicP4LCDnhZZQduApGW8
         dvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449714; x=1792054514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEjS5FEZuwM3ZCGKpsUAP1vOhfvNdfePeWtJrPWwgQM=;
        b=LCZwonHLhbzmbhCjyFK8qv9bkP0JPVcFowl40jeqjLeNrq9wmhbuCSsFg49ULuX/Fv
         4TYhiodoXFCdlPBYGKfjIf5l+6VlYG8zUy9+khCqklCyCIp2waS4uYrYuLuDAhx2cMsK
         pQeiOqS7KtQFF0UrN9eRLCz3ZnQSk80J9Ib6svKq8L0V7fuK2Vm0feRNh7XzaNxwcc3G
         aiE7hiOg3QFbgv/k0uJKk1ipMk31ntqPINNRL6JEABvazhpSbDmruDJH2LRLSoGm5Qjq
         lbAS/KC5ASbjPJKMElaN0mg+JW28ww05HTCIC4QdFDv4k/eoXF9BQBe0osY8Cx8Fav3W
         G/cA==
X-Forwarded-Encrypted: i=1; AKwUvByP2MlSr2o/GFiD6mmXYu7k1mAnudqoMmvcNI4akyWbO0piiZU/+Hj5s8MUD+1wbrf0AFK5iv5h/7lPLLM=@vger.kernel.org
X-Gm-Message-State: AFuF++lwqdS1wFDlq558jWLvY3lqTDe4brBcQ7F79LCvsQEV2lDYvaf+
	Bina930TMaYRJRHV+yr+WtTDEYkqlIuo3AWyTQ9UKonm+oZNN504wZ/SFIncUIiunzT3NA9zMhQ
	K0X/KycoXL5ehtTfUVQxdEdmcxOJYxz9f+xgDaNOfid6rSGPdr9dxdMqRMm6AafkTNNg=
X-Gm-Gg: AYBFou2kLejw7EoasJSulR2pKp+v8kIc3fq9uHKszBPtuWa9sXoFmjEGfWOMhQG556C
	1VZM+dkR1zEOT3BtJPe+I7rXm9SnuGhUmjtCKM10ame3auYg1RrVLyCo74t0OGf2Gz8BkKQmePR
	fRCca91a47MKX3hghV5bu6lqRwvZYdQudtQGk9hmj0goBzSKEdq8IP7MJKmjnaHdcDU/cwZNMIN
	7TKeD6hkdwomaNtJsitpCo2D1J+MeB31oveWY8cE9XFtNsc9Hqa8NfDhFi/F3OxCiiR7YugDi7m
	DCRosfrydRiD3AWvYybm+l6gggYEZhF26PDf09ZTeMPoLU9Umqt/uvH0D1qZjQiqNIQ1IW/37I8
	pWmh6RaorHpS0V9uIB5SK5g/uHGJYkC3q+BUOljpEr+4L9Q==
X-Received: by 2002:a05:620a:3726:b0:93e:9809:3366 with SMTP id af79cd13be357-93e9b839816mr943851885a.71.1791449714251;
        Thu, 08 Oct 2026 01:55:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:93e:9809:3366 with SMTP id af79cd13be357-93e9b839816mr943847985a.71.1791449713708;
        Thu, 08 Oct 2026 01:55:13 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b65fsm9772393f8f.16.2026.10.08.01.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:55:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.3-rc7
Date: Thu,  8 Oct 2026 10:55:08 +0200
Message-ID: <20261008085508.4815-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ozv8fnTeCw11NMJFB9VFANInBRRgiCrL
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac75a73 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=Rr7pUO09KOWNFGsOlfYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfXz4Byl4l3/h6c
 D5E5VGze9L6x+V5eG9RgFhSEyh7wfV5oRq2x+MfRF3VKG6r+sqNwY+L6rdgBFemSQXnaupvwPrf
 dgi6Vzy8Q/8mxZ8cHaNVxj0UpWOdaLg=
X-Proofpoint-GUID: ozv8fnTeCw11NMJFB9VFANInBRRgiCrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfXyhGwxk2qcNlF
 vov8nppWWygogbJKRIPmZH3Gfvyi8xbq+TDRLzGJXZmii/Je3sjaUzjHzqDsTAX9vgZgYNNHUqe
 rZGWvLTZceZtFGN1XeriuUS/TVsKXIipsuxlnXOJbNJ8C7XK3TtxtMUeqfaptZGNJ6de0uJACdC
 JlLOlLDZwaxQOTsWgt1d0HKERvk6fqC0k1MgsYwNv8y6dE2PzvPmkzbVwFLE0WZzC8MsCny3zZs
 EW+NBvX6f9IvQrBKZzEtmZB6WjZEtMom2SIXh1ShxTBOcfoH/YWXjpDRncbi+EPt6wRqwv2ZRIF
 S1xVJBXRdnhxeSGQew8BAHIA/qVMZ2EfbJe4aU67ACcN7e/CZzzRN1Hkg9wdu2FiaXslZ8JZ9I8
 +uhoEOWPyT5aXWepFNJ9s4BR4+NK3XOhcNFrHUBDAVTwyzqFvWS8BkOlaYQUYIIc/d2OWAmQfCo
 rKbDI9FiWPMiyciJj/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080035

Linus,

Please pull the following set of GPIO driver fixes for the upcoming RC.

Thanks,
Bartosz

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.3-rc7

for you to fetch changes up to 7efa1a1953cd6b20b23a3524d5b4b81789c6ef25:

  gpio: mpsse: fix race when arming the IRQ poll worker (2026-10-01 14:28:45 +0200)

----------------------------------------------------------------
gpio fixes for v7.3-rc7

- fix runtime PM leak in error path in gpio-xilinx
- fix race when arming the IRQ poll worker in gpio-mpsse
- fix devres cleanup path on probe error in gpio-exar

----------------------------------------------------------------
Fan Wu (1):
      gpio: mpsse: fix race when arming the IRQ poll worker

Ridham Khurana (1):
      gpio: xilinx: fix runtime PM leak on request error path

Sang-Hoon Choi (1):
      gpio: exar: initialize the ID before registering its cleanup

 drivers/gpio/gpio-exar.c   |  2 +-
 drivers/gpio/gpio-mpsse.c  | 24 ++++++++++++++++++++++--
 drivers/gpio/gpio-xilinx.c |  9 +--------
 3 files changed, 24 insertions(+), 11 deletions(-)
