Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135054CF468
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177887; cv=none; b=cZyG/lxIIsQ/sYzv2xLRJPr6So/EwoHMSRNJlj6GM7Ja7rvopBCP2lIYwfloGkABeA69UIIR86Tk59xf0kabHEAnpe9SRBXNUz6c6+AvH2j3VJr17aeU+cYqWOSNEF3kZyPZYyOuQDPmDDD9Er/mooXbnai6gjiaEZOycucZLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177887; c=relaxed/simple;
	bh=MegzC1CcFvU7ToREYLrsCq2shNb+UO9ZT2fmALBkktM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CkRZVs5Pgnd6vO7dw8IHJpTnHRGtzzvq/bEl/WVvhqQgHSslJqUs+MvqhbZp4Pig3MGoENZ5JKfMrwJYTSvrXSge0Ml+shTibt+sWwA4HaQm8GO7V/x4I4JNj2QIsD2rNhzcGtaCUOuV5isOUozXHy3cnR57gzgEKfUa5+EyEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KFGv+QkL; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=mQ5wTz3X; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KFGv+QkL";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="mQ5wTz3X"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIc3An1763351
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=cwcorJm8DJY7Y3KikDHPzRYSai
	n4E2CH+UQE6qVHh6g=; b=KFGv+QkLbf/Axt96k19E4KjS0+09zaBXmTmaRwMI3b
	1zXKVwP2lVkrqbH7AbJppr8reYdinOLlsLBx9FSCE38hlkRUhLWxpyV/9KZNWwss
	Aw49NamhFFQgyd3GWjayYOb3jSx3ll6ajZ+f2IHch9ppA6vOzHah+2WKfc82FYuD
	FF1M6ukHBqeROfpcCFDBvc0n5lEMD23QcwFmOBefiW76nDIhRuy1lfTTSgXgU0Ax
	taOZUV0KtsOlBSd5DL6U9qAwfs982jerAQrwK2yL29NwGf207wwnkgS0alWhTmAg
	tDC67y/SinXkD9ij7lfEcf3P/1ir3u9Cz4BfV7IHYSRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbg72mgad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:25 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53635e21ddaso3180111cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177884; x=1792782684; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwcorJm8DJY7Y3KikDHPzRYSain4E2CH+UQE6qVHh6g=;
        b=mQ5wTz3XlLmM761RYPmTBRVdb7x/0X+a7dUrw8ZB7QmfDnyRq/88OJzMwYdP1qQiLD
         3TqAMdB8CRgF7J1MDkD+rtxoc4OxjE0QZqj4OzzNnq9v2zywRQ+IxNyxaYPaCTiYTctE
         kSF5Qn7TR0WXxvRskZvMvNrVpCv61ksEByX+YqRxbwn3vU53AZXu7ffPXZ/UEdWCWkKa
         /PINjtLkmZdmxP9hfA2FzaQtn8IDLqamKfAD4YqNHF5tjOWc1ytGWTzKJy75A4EvhMbD
         v00O7Gv781DtCEdPx+RLPV4kDM2JmIEgnaaShYtHQCYv4fYsjSzNTuhajxjErX9R4Bqu
         mKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177884; x=1792782684;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwcorJm8DJY7Y3KikDHPzRYSain4E2CH+UQE6qVHh6g=;
        b=ViPXXq23asprcPC0SRZrr2Nw6E37ztGUN29tbIwHrlBh+pf4lLAFlVcFrx08Ysof5O
         TKsX1gxcVQPVHxpNH0fexPod1kOlEvq9fIqWEdaw3PIPJZArdIiB2eExn3Z0Bo/ZwRtT
         XenHxbOJCSbAILKiQtxzpSDvAZNHCCtkWbFtYjp23xM4rp1WryVQcLaoK53FUIRV4LPQ
         O1VQ1XsqVV2Vp4i0iJhFN8peSJ4xIFDqYf1+zbxcEvUUHrZDrFYgIZV482+O3WtqelWl
         7r/ChrZgWa+7Ggji/iVNWECe+/Jcw8EvlVki3Rg3MydJ0r3OV6l5Tr24xbhzaEpFJoWh
         SBog==
X-Forwarded-Encrypted: i=1; AKwUvBzLfMYSPacgajjOF4qp19dE4Q2BLjpaTMuf2+agwtUv2vluC7xxy6CZZVshQlzPcsrEzFU8kAi8kYf+QgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0DOCd+XBQO7Ue66NKkgb8aH6Qj+CscMDyp96583KsB5kqckW4
	ThP0QeIBAXu13ZkGM3EfeCZUWmCY4q/dgfRF77f6OU+gRNP/W/vbylN6iVOSpCj2d+/UKORRrcI
	3zV5Xv8Yc35sq6qQWQCHRG8HZtyyebD6UCFOrmrEAlCGCC1Z6dw3oaihTgEpy7Q==
X-Gm-Gg: AYBFou3hE2yjeA60gSN9BufE238LVfUzGi5/pRki+ymKphPO0LC+lH7voWxBLHibjz4
	HthtOnyoi4BQwN4Y3mLoF+AMhT3H1GTOkLgBY72YZPXZHR6Ucz9XnIl/EsqByPKClsFRm6aFVRa
	DaTJ8VtxWObKb+hH0TMcbWqRJJ7QJcDCR6eYXqfc6EO5vb3SacsiK4kdVSG5WoFKitGInDDgYxs
	HPSxVzKGBL/xVNGd+HSr4pRSIEG5n9wqwkcya+DEUcpRNL9D5ErojuhghZH3+VRO2zQzQhRdJwT
	mQH6CJ9XV+z0gXVhiaWlehwQ1jjIpNSHHZ/s/EF7T+aDLMCMybsqtRSUg1UB4sXcgoHXEQt+Kj3
	EmagVde3sshd1A1u/Rc5Zjvb4IhJNxVGPi9LEwliweLnoC1c=
X-Received: by 2002:ac8:5e0d:0:b0:535:a5fa:edff with SMTP id d75a77b69052e-536460ef954mr6757041cf.63.1792177883986;
        Fri, 16 Oct 2026 12:11:23 -0700 (PDT)
X-Received: by 2002:ac8:5e0d:0:b0:535:a5fa:edff with SMTP id d75a77b69052e-536460ef954mr6756491cf.63.1792177883313;
        Fri, 16 Oct 2026 12:11:23 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:22 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/4] mtd: block2mtd: convert to folios
Date: Fri, 16 Oct 2026 15:11:06 -0400
Message-Id: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMp20moC/2WNQQ6CMBBFr0JmbU1bsQZX3sOwaKeDjAI1LRAN4
 e4CxpXLl7z//gSJIlOCczZBpJETh24BvcsAa9vdSLBfGLTURkmlhWsCPnTbe1GFhoMoEJ0xhwL
 l0cKyekaq+LUVr+WX0+DuhP2aWY2aUx/ie7sc1er96vlffVRCClV4nVsyJ0N0wdAMrWO7Jz9AO
 c/zB5bHpm3DAAAA
X-Change-ID: 20261012-block2mtd-folio-9ccb6639c05a
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=4232;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=MegzC1CcFvU7ToREYLrsCq2shNb+UO9ZT2fmALBkktM=;
 b=K6bz/hUvXvQ8M5Cpz1AwTfjBFQ/z6M6fSKI0SR3VjxUDliiyo9izScd2roWE0iGzsc8KiSaaI
 R7F1aTVGpt5CRl1qkUc2LXFGcGuxA/XEPiofjQCd+ql/bNp0dqdxi17
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: vAe_tmImOXQcUPAiJSH77ZtBtxv_rqbY
X-Authority-Analysis: v=2.4 cv=W/StxhWk c=1 sm=1 tr=0 ts=6ad276dd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=bC-a23v3AAAA:8 a=hYzvmxoKW4JbWu-oBV8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: vAe_tmImOXQcUPAiJSH77ZtBtxv_rqbY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX9qqoE1B4J32T
 Xa160XuZtFaq+lD/2W5w6nY/wiHAgCup8svdmBozKdR/guPSrAPycwb2UPzBudDYeS49gvSIL9P
 o9aU/P1Q2lPglOWAdkT5yrCkO9uZ5QPOevuRGD65hPFyGRfHcC6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX+14EaNGaFst/
 1OJlMDtVEnAJjjSJZXTeWcJO8tAIMpSkTdAtGVwPqEO9ot0DkVUK1poL9/l4z/7LkZbmvkNbJpu
 zcaAT1TOIo8vHKx9av4mOeqLwlH7PuKM18MUmh5dbpeyjHv492/qCKmhFbOaPR3hoCXM7BvENzn
 yhr69LdGSzdu4nXPVPg47sXkVZsqDmLwqoPuusxFF6n8ppZDvsnTm0lBVCjlcmOAumRsgvvVEWv
 k8Z0S8DzAgWBecsaof53S6NDVxgL6tDMxY9EJMOxVcuoCBX+Mv9/GnUAWY4bORGMPA1XGbDk8F6
 L49cGSs3cOjjhRD2M+TRiT2ZevmKb34iHos1LG5ktkscuzecz1rxQjZitgKjnto2oP14C5vPHSz
 K1d+JbRMO9ylAmxJBIwNSVKyCPj1oOMPYiso2CiUK/fBH+BHSvmf2/UZ/kNzp/I8f78E+sJjDQD
 1BQ8g4J7FEiqDQrjyEw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 phishscore=0 spamscore=0 bulkscore=10 adultscore=0
 lowpriorityscore=10 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160076

block2mtd still goes through the page wrappers around the folio page
cache API, each of which hides a compound_head() call. Convert the read,
write and erase paths to use folios directly. This removes a
compound_head() call per page in the read path and four per page in the
write and erase paths, and leaves the driver with no struct page usage.

The first patch fixes a pre-existing race in the write and erase paths,
which could modify a page that invalidate_bdev() had already dropped
from the page cache.

Tested on KVM with the MTD test modules and fsx/fsstress on UBIFS with
no errors.

The numbers below are the time in ms for one pass over a 256 MiB
device, by folio size, from mtd_speedtest except the last row, which
is from the MEMERASE ioctl:

+------------------------------+-------+--------+---------+---------+
| Test                         | Folio |   Base | Patched |  Change |
+------------------------------+-------+--------+---------+---------+
| Eraseblock read (128 KiB)    |   4K  |  20.25 |   19.55 |   -3.4% |
|                              |  16K  |  20.19 |   14.55 |  -27.9% |
|                              |  64K  |  20.21 |   13.24 |  -34.5% |
+------------------------------+-------+--------+---------+---------+
| Eraseblock write (128 KiB)   |   4K  |  26.37 |   25.01 |   -5.1% |
|                              |  16K  |  26.10 |   17.62 |  -32.5% |
|                              |  64K  |  25.69 |   15.45 |  -39.8% |
+------------------------------+-------+--------+---------+---------+
| Page read (512 B)            |   4K  |  75.70 |   72.02 |   -4.9% |
|                              |  16K  |  76.50 |   73.00 |   -4.6% |
|                              |  64K  |  76.44 |   72.96 |   -4.5% |
+------------------------------+-------+--------+---------+---------+
| Page write (512 B)           |   4K  | 113.57 |  109.59 |   -3.5% |
|                              |  16K  | 114.42 |  109.73 |   -4.1% |
|                              |  64K  | 114.39 |  109.57 |   -4.2% |
+------------------------------+-------+--------+---------+---------+
| 2-page read (1 KiB)          |   4K  |  48.42 |   46.40 |   -4.2% |
|                              |  16K  |  48.96 |   47.07 |   -3.9% |
|                              |  64K  |  48.59 |   47.07 |   -3.1% |
+------------------------------+-------+--------+---------+---------+
| 2-page write (1 KiB)         |   4K  |  63.61 |   61.28 |   -3.7% |
|                              |  16K  |  63.96 |   61.20 |   -4.3% |
|                              |  64K  |  63.82 |   60.85 |   -4.6% |
+------------------------------+-------+--------+---------+---------+
| Erase, blocks hold data      |   4K  |  15.40 |   14.13 |   -8.3% |
| (mtd_speedtest)              |  16K  |  15.28 |   10.48 |  -31.4% |
|                              |  64K  |  15.22 |   10.13 |  -33.4% |
+------------------------------+-------+--------+---------+---------+
| Erase, already erased        |   4K  |  26.60 |   18.30 |  -31.2% |
| (MEMERASE ioctl)             |  16K  |  26.70 |   15.10 |  -43.4% |
|                              |  64K  |  26.50 |   14.40 |  -45.7% |
+------------------------------+-------+--------+---------+---------+

---
Changes in v2:
- Patch 1 (new): Retry if the page was dropped from the page cache
  between the lookup and the lock, per Sashiko.
- Patches 3 and 4: Carry that retry over to the folio loops.
- Cover: Report the benchmark as time per pass over a 256 MiB device
  instead of throughput.
- Link to v1: https://patch.msgid.link/20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu

---
Tal Zussman (4):
      mtd: block2mtd: retry if the page was dropped from the page cache
      mtd: block2mtd: convert block2mtd_read() to folios
      mtd: block2mtd: convert _block2mtd_write() to folios
      mtd: block2mtd: convert _block2mtd_erase() to folios

 drivers/mtd/devices/block2mtd.c | 128 +++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 68 deletions(-)
---
base-commit: 2f7fa8d90694d21dce68ceabd8383252b111cfea
change-id: 20261012-block2mtd-folio-9ccb6639c05a

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

