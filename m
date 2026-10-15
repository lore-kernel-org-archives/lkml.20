Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09528FFF6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035316; cv=none; b=MWZCDWwYIugPxMd3KH46hgvfSgbivX8ujlFNseYZEWjKHl8lfF/glVDNamXuPA7EkTB8v+IN+mrHxGJNROK8pfWiC9hk+2+PMB4u6L09641c8WPLN3BfWktDnicSRQt4AHdBorFUqaKXXyuZnrEbNYcT1yRE6lIBJ9eEIPC/Mrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035316; c=relaxed/simple;
	bh=hOCqmxgVk/qTa3lsW2aUFBSKne7SOjI/m0q3TykeKXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u2tasdRZttOzTF0VMSnlP5u+MQ9yLJeS7MrwFWu0J/srE2U/88Sf+KNB/L/S+ZNxRhmUhnhklG/gYFTDETV0A4Wm5s3WfbwZitS8L6acezJoWJoXK5Mb382r+z7aPjHZFTiTmqlFGle6IXNZF53kQi/0wkpeZY3rDDHwzR+YtzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=iIu/Vv1y; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=0EkaaZTE; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="iIu/Vv1y";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="0EkaaZTE"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3YX1n3562635
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=f88LSk6Ne+o+/j4cy/0ocdwBNO
	BIL2DgvapGrRJzlgU=; b=iIu/Vv1yZp6ayMTYpb+LNeooVU+gYR3PROSpOtGd5R
	/b3Asl1J5S6KUuEq0gsNdpVQqAWI6zAmXgPkufERhvHcs9gMkYeYzetYKBZZ/8g6
	hZKOvFODsFkXZYjMgguHwaFLvHEwFStzwZkRuTu4n1r8P7Lw13jykFg/QNFtgv1W
	VDKz06FKFyAPgm/T6gviaIejTw+gQKu1Q6/dgplKiX9n+v2hDCnP1bcPILMZBbeI
	kvTDKNV3QtYTnqCcX61SMQHX/Cody+4c+iQHdOn3Lm1TNE16vX9V73Mv/kUQLl3P
	VQWNLjsiMYot2bbb8Km3tA9X6iaq5eBEXuQU3RgNvuSg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hah571w41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:13 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a7c17166so92144336d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792035313; x=1792640113; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f88LSk6Ne+o+/j4cy/0ocdwBNOBIL2DgvapGrRJzlgU=;
        b=0EkaaZTEConKo66JurDq52zpVxICyX6KoUThe22NDDQs6wOLjMHOcv0KQ8o0UXLJ9c
         3QM4NRWv2cRriAIn8dokUiHUGoDVXVj22Yn0EtEE7sx9GQcgHWJHjaRYRrqzzd7PX1DL
         x4/bJPRyAFs7iASfz7ICqoI0uIwOLDH5bnTet1R222hGFLrqyP8DDv3+Lq0e69G6M0ix
         ksUhe66nPY3nmgHYwjOkrJJOTe3rQj3ZaUEePV543uzabDpagela7DSh7zv24Z9OdEKR
         Fp6OE8hRVTieJT5lxEAAFK8hEnWTyW3lNesiu4dbpa5PNgs/90aGAyZlBr27jlTLDlY1
         Bexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035313; x=1792640113;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f88LSk6Ne+o+/j4cy/0ocdwBNOBIL2DgvapGrRJzlgU=;
        b=kQswfjoazYC+/kgT8pWzuFDm/feK60VpqHa81+M3elhPaCVmQfZ1iMqLBbou+C9bzX
         7Mbjk9tKf+qjjklrxadGHLMcuAuSw0zTJi/1RZCvC6TOsrQoaZdBAMPNo6wJjqzWdmjB
         wMOP9xf2f/NfFynrmSxm9yP9WTKJuzlDoM2OZYQFo980kJtw/Tgw50+A6QspWAQRi5iE
         vdcxNgpspZfExR1WeMer2jspjN7fVIuP+9DAOPYLmCSQNkO1QKcq1P+D53ecOI/3nNzj
         yhC/xZQn6zs5Zi8NEdyQ2HsM32O+X5zC4FZThCxtVCfTFVVFWZxDD27uhEBH70cC1bGH
         5ZPA==
X-Forwarded-Encrypted: i=1; AKwUvBwr/+s/j0FyZNkEnaJY3LA4JbrDrJOWthtr3mOHO8u9iVDMnMHQ09K7WjgCn6CUJh5EYixz5Z5aILAVTZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBK8nbT9VD5zRSW8+MQP5o0brleKcdPKfZSSxEpPAHhgJg4h/f
	VPJI+afgPG1H52ksj3xafbXSmPd8GPftHgR/ffWhk2qU+xpwT+kDPA2aCdeqan5nIgO/4/7ZViT
	szfVIfFBuRugOcRYe1BC17s9Dc6s4N2knVV4KBQ4ZL0sqpwxh4pvYhpppJvf/2w==
X-Gm-Gg: AYBFou2u3Wl7e3C/jGOiyFOPvxUM97ex6/k+iU3qm1V9q6PZhePXIAPnbGoL6hODQzo
	Gto+lbJstU93XY/ICfc6EM6JGFr4NTSODXx+42ZmFgGAeJKgoTXnNjjGFO6c4emNJ6Emg45wC90
	nHnGeoC8fUYf+RTh6UayIfdWpmbNL33m/aXCvFLZeKQd8yhfwuHUcATs20ZgG8fAV+tGc1SzVBO
	AtuD+KB3wDWVjjOOmdpZsze4XXqDCxV8URKTeLrUcA43ANZHkoPrpsGWL8fpmjSsC9r+T6Cl1Ow
	xWFkVOc0toPpUGF70N9+zqB6+lSLS+KxikNUY1cco+ctxyIJX4TqveypSSRaxnyyZVgAkbDZgKY
	evXJ5ivAbE3GHUP5CbQ8vJBVwLUIQg7iS5K4swjr74ysK
X-Received: by 2002:a05:6214:5712:b0:912:517b:84a with SMTP id 6a1803df08f44-91b55775e42mr292933946d6.46.1792035312845;
        Wed, 14 Oct 2026 20:35:12 -0700 (PDT)
X-Received: by 2002:a05:6214:5712:b0:912:517b:84a with SMTP id 6a1803df08f44-91b55775e42mr292933726d6.46.1792035312438;
        Wed, 14 Oct 2026 20:35:12 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm70645846d6.8.2026.10.14.20.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:35:11 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/3] mtd: block2mtd: convert to folios
Date: Wed, 14 Oct 2026 23:34:53 -0400
Message-Id: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1J0GoC/yXMQQ7CIBBA0auQWUsCmJLgVYyLMh10FMEANSYNd
 5fq8i3+36BSYapwEhsUenPlnAb0QQDe5nQlycswGGWsVtpIHzM+zLMtMuTIWTpEb+3RoZpmGNW
 rUODP73i+/F1Xfyds+wZ6/wI1l6s2cwAAAA==
X-Change-ID: 20261012-block2mtd-folio-9ccb6639c05a
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792035311; l=3557;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hOCqmxgVk/qTa3lsW2aUFBSKne7SOjI/m0q3TykeKXg=;
 b=QgOlFYCVeis+h80kVC3YvfC9ICKVogqhiAwYEf500tCClHwQXEH/lkoQHs8PArRfMhrNajxlN
 kYla1X2eMuRCCMopzqMdrT3iASum04zmr5AQJ3ipHMgwi7R/oKzrTll
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX/HtgXG9cKV01
 eQlfAc4IixNyWpmPeEPrg/OAQgqUDlQ69eRReBaJsboY/g7nzb74Bfop/36/s2nLR05BcQo0SVo
 qxR160ZLU+VyvRCfvw4jkgPI5cGPY1yZQMCZbPceLD1APehfpbiep8z2X8xU0dxLATfN82By8bW
 sTDnWrkLlBsMHsWC84qke0Mym1MgSHmxlRCQ87yM8KkEqrP9XQk+khsyE+Y3P5pwg4LAdSMm7Cp
 ApJzxuvIMaTOTf3RmyQpQhtL4zt8IV+dZSfH0GgV6JNYIsUUAOXTwalWYmKCpiL1gZH7MCWzlWW
 BsbISXt55+hbRn2HFVMDqWUKdgyLoplGkQj1cOtBZaejiBOhVPY3pAbf4aGw0un9uHQ/+82jG33
 CQj+AXyf7ESbdXN4XWN0YTnLJyvMIcvcEQnvIva9AVfeONG5HcXvtNeffIzRLw3UHYiu5k1Jzwm
 g9HFFYoar1ElJViTNLA==
X-Authority-Analysis: v=2.4 cv=ZMJCCn7b c=1 sm=1 tr=0 ts=6ad049f1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=YYjpweBLZ1UDfrqZPjIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 1iWgJLoIPCrnge9oGm2dckBp8nBVcAQ1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX/6kNpf4fAj5k
 WcU5+6vsLXHFvxPVsLsNWsHxWld3cnDHjNy/nZDglbd7ch7pYj+gTOgwBpoyDshX0cDgnJssURx
 ppXSdctkoQNeSv2KRKuAIFZesjF/ikVK4/UL3AxNOTUopAm3lN3e
X-Proofpoint-ORIG-GUID: 1iWgJLoIPCrnge9oGm2dckBp8nBVcAQ1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=10 impostorscore=10 lowpriorityscore=10 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150014

block2mtd still goes through the page wrappers around the folio page
cache API, each of which hides a compound_head() call. Convert the read,
write and erase paths to use folios directly. This removes a
compound_head() call per page in the read path and four per page in the
write and erase paths, and leaves the driver with no struct page usage.

Tested on KVM with the MTD test modules and fsx/fsstress on UBIFS with
no errors.

The numbers below are from mtd_speedtest, in MiB/s, by folio size,
except the last row, which is from the MEMERASE ioctl:

+------------------------------+-------+--------+---------+---------+
| Test                         | Folio |   Base | Patched |  Change |
+------------------------------+-------+--------+---------+---------+
| Eraseblock read (128 KiB)    |   4K  |  12545 |   12863 |   +2.5% |
|                              |  16K  |  12998 |   17229 |  +32.6% |
|                              |  64K  |  13009 |   19135 |  +47.1% |
+------------------------------+-------+--------+---------+---------+
| Eraseblock write (128 KiB)   |   4K  |   8773 |    8063 |  noisy* |
|                              |  16K  |   9529 |   13448 |  +41.1% |
|                              |  64K  |   9636 |   15934 |  +65.4% |
+------------------------------+-------+--------+---------+---------+
| Page read (512 B)            |   4K  |   3332 |    3501 |   +5.1% |
|                              |  16K  |   3332 |    3462 |   +3.9% |
|                              |  64K  |   3330 |    3479 |   +4.5% |
+------------------------------+-------+--------+---------+---------+
| Page write (512 B)           |   4K  |   2001 |    2054 |   +2.6% |
|                              |  16K  |   2000 |    2059 |   +3.0% |
|                              |  64K  |   2001 |    2064 |   +3.1% |
+------------------------------+-------+--------+---------+---------+
| 2-page read (1 KiB)          |   4K  |   5262 |    5436 |   +3.3% |
|                              |  16K  |   5292 |    5327 |   +0.7% |
|                              |  64K  |   5312 |    5385 |   +1.4% |
+------------------------------+-------+--------+---------+---------+
| 2-page write (1 KiB)         |   4K  |   3635 |    3712 |   +2.1% |
|                              |  16K  |   3650 |    3725 |   +2.1% |
|                              |  64K  |   3665 |    3768 |   +2.8% |
+------------------------------+-------+--------+---------+---------+
| Erase, blocks hold data      |   4K  |  15013 |  ~15900 |   ~+6%* |
| (mtd_speedtest)              |  16K  |  15222 |   22849 |  +50.1% |
|                              |  64K  |  15280 |   24233 |  +58.6% |
+------------------------------+-------+--------+---------+---------+
| Erase, already erased        |   4K  |   9558 |   13727 |  +43.6% |
| (MEMERASE ioctl)             |  16K  |   9558 |   16580 |  +73.5% |
|                              |  64K  |   9626 |   17754 |  +84.4% |
+------------------------------+-------+--------+---------+---------+

---
Tal Zussman (3):
      mtd: block2mtd: convert block2mtd_read() to folios
      mtd: block2mtd: convert _block2mtd_write() to folios
      mtd: block2mtd: convert _block2mtd_erase() to folios

 drivers/mtd/devices/block2mtd.c | 120 +++++++++++++++++-----------------------
 1 file changed, 51 insertions(+), 69 deletions(-)
---
base-commit: 2f7fa8d90694d21dce68ceabd8383252b111cfea
change-id: 20261012-block2mtd-folio-9ccb6639c05a

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

