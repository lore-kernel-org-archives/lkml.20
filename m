Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67D31E106
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959093; cv=none; b=PglFH9J82h15zKt+NHIow4RS1ux8dqWZ0EJmJ6ePzTdAGY/2Jwb+NvsbL18V6NB8VONLJos6/geeerOJskN9MmNS6TeockzaMj/XMgkk1iScfFq4txrR/BUt8fchT9wJUj7TMsm6nYHtRsSQKSjVz1wQcuXQBzvNHi5Rxh464Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959093; c=relaxed/simple;
	bh=MlAsrFDxIio94Vdqusa9O1JK3xxR9DUssXgflYDQyYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJAHrLhzvTijHSmnlY8MtAex5NU53QGWzckDqm3vjuIE7Ae6PsoZyvePXsPIVQZbnKrHeClD8w3kNfnNX0ScN9VqPNK0PLg0Jrhd47Z+wPRyvqWAyxMLbpwcVjZg44SLjvHayOa5nrQ9w6RiSIw3FI1VUitq0DjGYgK/3I9tiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXs7Llvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4wOEMZ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXs7Llvg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4wOEMZ4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FH6pR2121180
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 16:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HsZcy7a9Otoosd4ozeXc9gj+pTu1VbaEtDu
	qjGWoYGo=; b=TXs7LlvgmvzWhXVx4prUXYbLtMmu6SEFeo8H8Lo48xzmMSs5kMg
	4DJN0uFP6x39mZ9lNDbjJ+kFiqyYfHi5w7risJ8Zc9u3/Wd9zX9MfyCLuUYUgq3J
	VnCdU3uD2051mQWn/30vesW0o29cBMwWR8MuvScWc3eYIr2w5bFBEeahYSMUaYJ3
	9PO2YvkVXORmATNro0Ia6tygRHhn+IwkqcFjz5IYOiKKOjlka8mRH2iwWn82s1fl
	6ywEJCybXF7OUiFrcPv585CLOfEJr7SU8GYA6G/Luipz/Hb6fHRKQ0ve2IpJ2V6F
	ZLdUW7GuFB+rN92ACTtlQq4VyLflqU4/OZA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh36fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:38:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34e676375d9so1596357eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790959089; x=1791563889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsZcy7a9Otoosd4ozeXc9gj+pTu1VbaEtDuqjGWoYGo=;
        b=G4wOEMZ4l9vyBUEk8XeoHSs1i2AeUZhUmfNQiJs815ZEOvxGQh5J5gbSqyGD/bgyqI
         AxO9KjiYgcqFCX/4kQHFXh1ucmU2xXARRqfOgFhv9TiVGLlEaIP2sFL72dtXkLBIYEQF
         M3fqZbADMXMWqfumUd44gWeZShzl3TkuxsW2vmFH7xlL1848VzrFV/F75YNrXm40cq2/
         EDu0FcbWrSn6UGpO7Njgz8qxpJRshWFm/P+sOFK7Z6ROiVdMffcSUD6h7vgJl/L3yZzT
         UCZh+i5o5IMX0iuuBXjK1MpgGJEtLYOgON3A5FHSN7f7kVr6f4Ayzo4YRA5CHJ58USKW
         DlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959089; x=1791563889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsZcy7a9Otoosd4ozeXc9gj+pTu1VbaEtDuqjGWoYGo=;
        b=IUovOX5K0ZV8E8irky0Q2atkaom+OlRBbVi95B5ELQLj62hlbIs/Q1QBY7Wc3fP9ab
         d8r3DOumd9j2bcL6iQTHkCAR3TcIOCW2Ti+5zbViipcuwJHXzebXZTJExu+EKgkL/SzO
         PX5Jv7vRIP6hQ2RjIff5XDgx9OiIWYxKp5jnXkDTMSwZTLeGxAsWonBh0r68Tz5SDenG
         JasebtmATegoyGJxaY3Xq1J0MA/VLlnM7pifPju8srGxg2enzrd7rx9ZVyui9dUcdk2w
         bMl5XDxKcl4yZUsScpdLGIg7l3RJDAbPAVl+mJEtMWUQFqXeS2Ih41ab5kjqoPMnC0YB
         mdBg==
X-Forwarded-Encrypted: i=1; AKwUvBxUme1iELVRBwWwNQ/b6IQp05FyCfQCPhrF5E8DjuqeXG2KL8/0Zt54MiuKgqFGVJX6bmHcPwQd5OjXXU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+5iT7gB3xnGJuuJdnixUSvF/qTcsb7w+wMTjHqT5Fp8JYYMz+
	s14OcL4cdqgTIz+D305MhOuZEhpymcS84tOka7TyjuyzH968qmoIR7c/Ln/IeATlDpymp5/XvAO
	2aDWTjgeBPZFpq2WBxo7Wg5kFyxDHt/46Z3mnoEuwcmDkwm2yF8BNylFWX/0SKGF2EC8=
X-Gm-Gg: AYBFou30CCchJiyzpgOdd7PbPDwWiZob/bzW98NATPu7g6FO/epo+WqY4kUQM68gt2I
	YQtLEWpB3IJkHfjQecMYVoyY9GZcOz4mU/DI9R0nmSQ2R/hxUHIO5heneXqMGNKQQ49Pn4O0nDh
	pNeKEsTmADnw1p1MUju71Os6Pxs5gUJOpp5lmkDVBk0i30UNKkfkhQbJwaWftZIeHw317ADXlOj
	/EY/hzbD5vWqInV5Eemu+zE4lvDya9Enn6v0rj8l3F7gtl/67Nek0XH9bK8kY1f9hgkc6jIjBG1
	AMGuJ4Qh7nbMiLGWf/GYCTvNIUDlnwNihiqG9m4mE19W3vcnQZsoF4fK55h4GemsfP44EpzPCLd
	KUDIvT5+uLzUGT/afa0IW/3uvQpcU1AnOfpKhSjR4h19m/EnvDOvI6mAT13RFkfYQEkR6wguoAu
	5ID0SdHI8rGaL6
X-Received: by 2002:a05:7301:23af:b0:348:201a:6c88 with SMTP id 5a478bee46e88-34db6605d44mr6538955eec.13.1790959089090;
        Fri, 02 Oct 2026 09:38:09 -0700 (PDT)
X-Received: by 2002:a05:7301:23af:b0:348:201a:6c88 with SMTP id 5a478bee46e88-34db6605d44mr6538916eec.13.1790959088429;
        Fri, 02 Oct 2026 09:38:08 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fd5620sm7756398eec.21.2026.10.02.09.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:38:08 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net, anup@brainfault.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH 0/2] Add RISC-V SBI watchdog driver
Date: Fri,  2 Oct 2026 22:07:56 +0530
Message-ID: <20261002163758.2919372-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX38i2/Z5gRGh8
 x58TsqCx72VTpNO06G5aCrBlIDywwlpYcT0e/aab89jY7DJXwexWxjw6QzZHETQ54Le3UspGHUg
 OzerkHJFFf3AX9roWZkFQ46ZXR6IaPY=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abfddf2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZbvlEdOQB2PwL-2qBAUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX7c9m9yKcoJqr
 HUsmu2W2WAz18deFznXeXZLTHCZvXgqnQ0j7PupxquFNhs4PvcoHGYciguuH3qUIM7byRwjn1Rp
 bHT/ZHX5LXLXILottt+g+J/1aWumSXSe9Lz3g3FryUg6l596fmY0i1uom1SYrdo90689BdrTF3T
 13BS8O6dRyF+LDKxsArxks4EmMmYf6bwSmBYT9qsPm9uMd5CorJBDlkFX+ka0sA14nQjwX2uvx2
 z33rM/u0LYQlFjeCpAkEUQfRqoV8Vr2PdFFPwt1V7yyRY2K78Q2aVGQ2nwkyflv9ZUbLylhI1RY
 09ZcGtwh6bA/yl4g32LPwXQIS4r35nkLtzCrFfdZkb55vaPsBKHYTVfRZD0QQSmpKy0Gv69E2Ie
 4EZ5ROtpi33M4J7G5InGOGvq4D0530L4TaLfzoYZ6aq44nGSvTMsoYUqC9zIl79uysTRqj/sDe/
 y7ab3zo+W0VbrEuPNqw==
X-Proofpoint-GUID: 8oaW0-qB3km5nSbOXQ3ALc6t5nIlvT99
X-Proofpoint-ORIG-GUID: 8oaW0-qB3km5nSbOXQ3ALc6t5nIlvT99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020066

This series adds a driver for RISC-V SBI watchdog extension.

The SBI watchdog extension exposes watchdog including start,
stop, pat, read and write attributes to the S-mode software.
The kernel driver uses the standard SBI calls to interact and
configure the attributes. The driver integrates with the
kernel watchdog framework (/dev/watchdog) to ease user-space
implementations.

The driver currently subscribes to the Message Signaled
Interrupts (MSI) for watchdog pretimeout events.

The series consists of following changes:

- Patch 1 adds the definition for SBI watchdog extension ID,
  function IDs, and various attributes that are supported by
  the extension

- Patch 2 implements the kernel driver that utilizes standard
  SBI calls to interact and configure the attributes.

This is based on the OpenSBI watchdog extension implementation
patch series available at:
Link: https://lore.kernel.org/opensbi/20261002083040.2533097-1-prajwal.n@oss.qualcomm.com

Steps to test the SBI watchdog extension
1) Compile the kernel along with watchdog kselftest for RISC-V.
2) Compile OpenSBI patch series mentioned earlier to generate fw_dynamic.bin
3) Launch QEMU virt machine with IMSIC support enabled.
   Note: The following command requires a rootfs.cpio packed in Image. It can
   be modified to use rootfs.ext2
   $ qemu-system-riscv64 -M virt,aia=aplic-imsic -m 2G -smp 4 -nographic \
     -bios fw_dynamic.bin -kernel Image -append "root=/dev/vda rw console=ttyS0"
4) On kernel boot-up, the /dev/watchdog entry should be available and the
   kselftest binary (watchdog-test) can be used to test the functionality.
   Following are some sample test cases,
   
   - Dumps all the supported options.
     ./watchdog-test -h

   - Starts the watchdog, configures the timeout to 8s, ping interval to 2s,
     and disables the pretimeout.
     ./watchdog-test -t 8 -p 2 -n 0
     
   - Starts the watchdog, configures the timeout to 8s, ping interval to 9s,
     and disables the pretimeout.
     ./watchdog-test -t 8 -p 9 -n 0

   - Starts the watchdog, configures the timeout to 8s, ping interval to 2s,
     and configures the pretimeout to 6s before the timeout.
     ./watchdog-test -t 8 -p 3 -n 6

Changes in v1:
- Initial RFC submission

Prajwal N (2):
  include: sbi_ecall_interface: Add defines for the RISC-V SBI watchdog
    extension
  drivers/watchdog: Add RISC-V SBI watchdog driver

 arch/riscv/include/asm/sbi.h     |  26 ++
 drivers/watchdog/Kconfig         |   9 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/riscv_sbi_wdt.c | 406 +++++++++++++++++++++++++++++++
 4 files changed, 442 insertions(+)
 create mode 100644 drivers/watchdog/riscv_sbi_wdt.c

-- 
2.43.0

