Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333271;
	b=s/euV5z7wW06dsHAZXn9RHe8YICvxJ/vAqswjWAI6U0r00q6vJFZEARds4PQhbfrpgDE
	 eYaa+2SpVwlZ/vlxLgNQFTX6aWc8NYCZq8qfeI9s+UG8EHOCdcLyfRYuGha+FB2qqtEia
	 3jk7mfoLVwf2REdfRY0aUGLi2rTDkLTR2OCbFqxcdMrGqXlVFBSD5lASdc0HN4Wo3MzVh
	 FeYihQ05VtvKpD1VT8O0FgyrbEWVJzRc2rwaDf6fMlGe3+SHu5alF8dkOjFr/36+Zgddz
	 pEev8NpAwG+e5ap9LkzdZcoy035MoIzbfPzPSEEkJU+e2QzJAZYeJsTY4esN5HS7mlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t2nLJymu4EkFJDulA4/AXf+g10MhbzHY/rhNcJujC+0=;
	b=xsvTRw/HGmWw+wHF5ZS+n9rjyq8A0fsE24Piu6cEmYmRKGNTXI5sUFrceAIrDVShS/ir
	 0p/kohUjgBxMTdmTkIz8OP2phegbuWxiv9FfuDKDNTz4Un+wY8WR7mJqsxZrDLRs+c1kg
	 YpoD0hlxDwI8CJon624LO9+jcdepjEmR6ap3pnQTONMOGuyqjE3CPeH9Mw5vti4sW5HcT
	 rOavIZTwKomEVItTdSd/xNKOePDhs7rxz1hpUzeEVICDYlGAkeKtr1jtlEvmsMSV33joc
	 pcJi4w0Km/i4qL5NpVbw4MvWxvt0OW7mxTlXcVUwbbMXtchCtOD/aArH5eKn0UctHEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APFPFUzO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWAfBZRb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0DE606A236
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0DE606A236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APFPFUzO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWAfBZRb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0160484447
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t2nLJymu4EkFJDulA4/AXf
	+g10MhbzHY/rhNcJujC+0=; b=APFPFUzOwb2uLowjiToz1MIzBLb5XfiVxms36p
	gNjRMif7LCeG8iYyrqfULSu6yPQtbcoMAU9i0YsxTr0+uGTXYEe+lh9RAtuPKyNx
	kb8Ogm/oIEv2FYSrztX/QgkwFGjp9Anu65acbRkRsHTNx/dhN7aVUDkKtXU7+Vaz
	LHIJDUPe4raS2sKLdE4ZQdIpmzYazYAWUixCdF16E6OS6qtXB+bcolI2yach6D5f
	KAxglQyTmHySzasdid3VHCgKYTKn79wSb2hbWOtc/uc+dyZF8Y37NYuCoXq9F0pa
	7AASF5W/ZzzYVs6IN43nItGZ0FRetSa5qmtAXZKMoch5xrrQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwj33m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99be6943b20so1888232241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333269; x=1794938069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2nLJymu4EkFJDulA4/AXf+g10MhbzHY/rhNcJujC+0=;
        b=BWAfBZRb9HfpEP7eEk4HI76NMkz1GjIt+CCjzyM73NBZUG+ciJ1/QaS4mAnuKsM96o
         56M98lWZOvhOok6gxV4W4j4G2JuZuN4yiuzaklPGOv/E+m82beDyxT6iCO/mcPYSDytu
         4H9a29Zvu+G6SFpok2wBqF/93FJFCxXA0BmUUN/rlHG8GB/Z9aFTlEXEk9g2LU/RH4+x
         /F06CDjMfYKdwzIS6tXhpevYTpjD4UjNNyDrkCQqO8UgKOi56b4ybxD2vhyH0HRv1Mzm
         fC0slgxmmHray4D/46ima7wfUMPYVqCGSi/RXYcsNPtlzcZL3qprIrZE7uc4MHyyJYNK
         csOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333269; x=1794938069;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2nLJymu4EkFJDulA4/AXf+g10MhbzHY/rhNcJujC+0=;
        b=DwbPex5vvD3/GncmCP1RbivhpdBXoKu7FotpyDI/YyRrzNp/HuyFByNwXL9zudcOG+
         YwThz+NBW4k7zEG7qKjHjpxA+Y+YD4E3JHv5PFnkXDoz/mXk8iKsEtf0tUVgHH+5mu4G
         /oyYrSOGcfcxrE2NjXcl6DSCPv/4ksihHXr/gHT032cMOUZjiVo1kUAZaSeMprkSR/ZE
         jQtBiRBmdQALQ5svAf2espg335A/2F9I/CulOmKBpJQJaYLG+pWzPX8bkJG+60lLADTW
         bmGC2/XtadfByYzPa08Lirb8otf0X3HvJb8AtRkcRy5c47On+SkNyie6BS7A8SCSOOA+
         aAIg==
X-Gm-Message-State: APuU4Z8dpG4C19MZycKv86AvLzsw5D12fYNQwcDaOIhK7zxsQRNvo5rn
	da0ZDlm5/WjhRf1DqpaHiQ9kwV+FF6l+VHf/Yr2zD/XVFZ4eC42xWih0oIOSNJZmcgyw9fXan5/
	Ou+PpKrA3Qcau0yMpfq4BtJ0TpfRXYucE4X9qRd38r33RPowCUi+Ba1+hH8JAG8gB9ws=
X-Gm-Gg: AYBFou3QBPIrPj/Je8ksF22fg2EVT+f6FYeQvXrNipl1YMW3RXdLGyJYk/VB3cA1Ii/
	IxDGSUXW23Zqc1MN8biEtGJtkXxWj9CMshwx7Af98niCJ7Dt+Zb3fmx86nrG42ZcuCnZXIIreL+
	yzoTmsIpXga1lV2gk7mTjQC6E1XsiuA+VwufxINM1WnvuK6FlYF/QR7HpipkizK0Vqu2oidhoFW
	ozT2+C1v4gohJoU/i32lkGSaW9/qALI66YdawRCEQyIW7RnAcxgYWA/xXt5qmqgAubTxiQZ9hev
	Hez/kuCh28qKlYjJ53XkGhG8BJGin2X/H7Zc0C4NXZql7QfusjG/OntIeIuxh3BRNkN7MTVLi8S
	9HWTrupBUD//L7PRiPqhRWd+H9J1+WdLLdngInHm1Zbe5AlnwbApPlme7nP65XekkKWOOqeqtcO
	YPy3PPyE6yFns=
X-Received: by 2002:a05:6102:41a0:b0:7d2:8529:6892 with SMTP id ada2fe7eead31-7d301bac900mr1524364137.11.1794333269143;
        Tue, 10 Nov 2026 09:54:29 -0800 (PST)
X-Received: by 2002:a05:6102:41a0:b0:7d2:8529:6892 with SMTP id ada2fe7eead31-7d301bac900mr1524355137.11.1794333268703;
        Tue, 10 Nov 2026 09:54:28 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005762sm79712705e9.2.2026.11.10.09.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:27 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v2 0/6] riscv: hwprobe: do not report disabled extensions
Date: Tue, 10 Nov 2026 18:50:42 +0100
Message-ID: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jdp-w_lyPsTx2cA0G46qobbtX86pnwmA
X-Proofpoint-ORIG-GUID: jdp-w_lyPsTx2cA0G46qobbtX86pnwmA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX4029+nhRjWQu
 MDvHGnoLauH4kVETs979UMuu9GSOVegvmhEHcD0/nrpO1FJfU8jydH6/1msOENW0s+5bFxoJjDs
 k0pxoVpmfX4/fRltdC4RTdAdDrFr+9U=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af35a56 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TFIeobte5ycoxvPPQQgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX9lSjW1sqXHrh
 hxdoUI4u632YIILJlErkoUHOjyXKmLZT+gLReBjr2KtBEXoLwXuwc3N0iP9R2jgkkLNNiz7D0mk
 B80Eg3zEWKrFhZzO4fk6Oli29vU1HWVtZ7eQshmYycIfHueYEu5js70iISN8WQ+SuiFrJSipuEf
 ur2kq7yt72LsZuBp3ymKfONzOnG/ZWfyJETnL9kvC9ddh7y/cs2uzjVt8gSLrnC90eu+/uuqUX6
 Zpe/Q+2tmlDP4AbmT35BUXqRgRJfZXMYMcnlGWTDqzWE6CoBsuFbB0+jxf59R4YisMZnu1EEVt6
 8HCJJOhbk6oQs56msAQQ3CPdRrB+zj/FstD1j0kq7n++wFF24k9jZ/Wt6o6PQo2A7Xg4G0l0osd
 oWmPLg/wK4QGDvJ6BsDpsypRhp14KqSLRIXKGVv9X0cK+JvmkjCGgvtA60gNl4ncDGPozUSh2LV
 luqB9kLEJ4VxkvhQJ7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071

Hello,

hwprobe currently looks at the hart's ISA when it reports RISC-V
extensions, but some of these extensions might be present in hart's ISA,
yet still disabled on that hart.
This series improves the situation by only reporting extensions that the
hwprobe caller can actually use on all queried harts.

v1: https://lore.kernel.org/linux-riscv/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/
v2:
 * [4/6] Used pmlen helpers from v7.4-rc1 [Guodong]
 * (hopefully) improved commit messages
 * r-b

The series changed mainly in the commit messages.
A small semantic change in [4/6] makes us only report Supm when
userspace can choose non-zero PMLEN.

Based on v7.4-rc1 and even through there are a lot of Fixes: tags, there
isn't any rush to get this into 7.4, since the problems can only appear
in awkward/heterogenous platforms.


Radim Krčmář (6):
  riscv: hwprobe: Report FP extensions only when available
  riscv: hwprobe: Report Zicbom and Zicboz only when available
  riscv: hwprobe: Report Zicfilp and Zicfiss only when available
  riscv: hwprobe: Report Supm only when available
  riscv: hwprobe: Report XTheadVector only when available
  riscv: hwprobe: Report SiFive vector extensions only when available

 arch/riscv/include/asm/usercfi.h              |  9 ++--
 arch/riscv/kernel/sys_hwprobe.c               | 54 ++++++++++++-------
 .../kernel/vendor_extensions/sifive_hwprobe.c | 14 +++--
 .../kernel/vendor_extensions/thead_hwprobe.c  |  5 +-
 4 files changed, 54 insertions(+), 28 deletions(-)

-- 
2.55.0

