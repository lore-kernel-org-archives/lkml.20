Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335351;
	b=smZJ3GTcMyJKFqcWDaenn6aaXixhMF/jzfD+ZeBfjKkqY2LPPalnbAgjxLsSR/i5VFcM
	 aWoj9J0kljCUNumTW/eK6ol1Oc7GS5TUsAabyLSY9Xbfj6Zh3La4qndEtNf1UmMiJdMNl
	 SO65J39my+T+KqO8AY61WMaR38RG3OmS1CxG+yPjvnGuLFvh/YLIamVTdtd0PON9qFC9W
	 ekzeZ6s7oL4qHLyuC13ctdBc0+PvtzOi8n8gDtMVaSz79jj5PFPOqiYDjVKAjJAUUyTxF
	 xboZv1BomKeO7rsIvmBb2t9djBEhb8Y6nDwTSeeaXyxoZVxI3ZUYlTmbuHBhl6JBWdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9w1TbN1dvve0swdMnEQBNdtFLKErrDV4D/BBl+8lzPA=;
	b=JKSk/UlrBu59l8JNaQoLCUS61M+9bCPetBUhtAMThEJF02ekgdAnMW0/z8fiQ38O9eyz
	 glloyYQGstGwXZYoAM6iTN3ehWMQ+396bs0jvFoYLOFd0GmRyLHKmOrdkM7waG89fH84W
	 rnhlOJNavvrMGarqmUFHx0G3IGWxUt3Vmjccs+Igid8H5J7FneAUshN0Kb4rilAPD4J1/
	 /poca5VG9DwmJjeLXLZ+mw5WcAjTLRwZaOOnxo6btQ5mxqDu9I/Pf56NX3UgAE5Kaa1+e
	 djguuwPdXcQ/TylZv11LBWKgQkOF2Fs6toP6uet716a2ZkN6I7U7EK2csmvwSMMlQuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=pW17WZOI;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=z2eizeha;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F355606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F355606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=pW17WZOI;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=z2eizeha
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAHYqul1825187
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=9w1TbN1dvve0swdMnEQBNdtFLK
	ErrDV4D/BBl+8lzPA=; b=pW17WZOIAJDOkkRCu349/N41d5Lc822vyMbuu+6fWn
	5ewEeYbVwLKGA8aRWKufjAg8XaeecDUfw3fyTODwHfFxiEn5WJxmXuun07vl3GZM
	F4rTEngoXebZ2IBT8kEZXBDcJ7jbawltSb6zoEoKqgsOWhstcWaLH79gRhFKI1zO
	1le0pyYcSnHJ0TnXe4yGMiMFtsSCqskYMLEiNrT7iWFh6n9Pi2tCseuzaD69a/oM
	aXBwXHI9DITWYhOxAh9MqpITdFRWwQjoeopKh16NfkJV1XRvyQa5YAhGuENHqyQF
	VdxgAS/Af/lEtZ6mWPvpBkqZB/QwoXNZjkuD/OxFeK3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hv5j125dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:02 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea71789d8so62778046d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794335342; x=1794940142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9w1TbN1dvve0swdMnEQBNdtFLKErrDV4D/BBl+8lzPA=;
        b=z2eizehaGSXWA0nKtLIF6vnX2eQun9l7oJnukU7pPO+5NM93HSV2o+QipE78Lb2T7F
         iGmICx2b6aSWGe9ztnDmVqt5jtMETPu7cbIe0buWMUZBhj9ed1ohHBjqyQvbDE+GQ2kL
         9ggTcR6eCrMs+GG+jY/MVEKFNzYeYoL6AjX3W0/zYrfSZW0c5If3KIfP5eSX0MTluoy/
         CfYZCYtY5yZ5WWFsS5q1MU0ZyHWR/oEY4cmnEthdqMqcKszDjLHlrtFbAF+FglscLKrX
         ixrmqm9PYLtMShXqqrViSH9sqFH+0QljJEpVk/5kOA6siX1HyRJlipHUzfsXXMO5GkbC
         67LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335342; x=1794940142;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9w1TbN1dvve0swdMnEQBNdtFLKErrDV4D/BBl+8lzPA=;
        b=0cKsOerdAu+0hux//a/8WK4W3LKAwJdwywhE2xkrYrRvLnK/upfd6akVoieU5yy+//
         VZnIalIlwN88C5kzcq4aajeHaPZn65vj3AjnHmRuRlJfWDfyLGjVEShVDeG0hK0TVBUd
         Z/PMGO96qMDWSVupez2mE/Y3PXT+DKFebB2Gb+4JOQncHI2OsPNb9YuhjXxUhRpb8x22
         8L4lAI+YYuwhF/uUJmiwth9av33lyE/haGAUMRHq5dui84zvwnNJBxfANrZCvGI+shg2
         dBgTopGYPTA4kazEeD+ZPb5/Fk1ycpfqe8PG1yC1y40IehjEQuzzPplFlWkD3/qctLl6
         kEsg==
X-Forwarded-Encrypted: i=1; AL+hErGVtwxsVLuy+Xinr/vBGpOi/3cYKpwvKmiE7Rw2PofrYu5HGNaFAKAmyLyzCOeO31lcOuwzY5fti711dlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tBaIQ7OYpEsbv/fBjpP8D+W/+bHN1QseeeAYaAwht2ZYIYt6N
	vwT0L9F0KNSVnuUeyvB4TG5IkA7/zHfbm5/xy9n9hd+GSQ/iE4FpWqITRjj+KqG3YbsO87VAcBV
	cocEHqAE923q2C31JP5iVBz6zyofgd4j9bDO+y50IOYRLnqrNZ0NikFuI9q8AkK4m/rugSQ==
X-Gm-Gg: AYBFou2QTIfwWND9sV2Yvs7utTxQs6WXZ4B351tw45hrKxIAKj4ThoZ+SW0SVcX3gNc
	rU2e2Mil9hBDtiD697hcZDtplT84XPv41xFZtvvOy2o5nKfcyIVge+yHXbisZgHA1ELNdWZmK0z
	58BPlAc3lwYuJlIAMZnNVwHTxZ7a79KsHIfzX8qXSRevanXl/gbv94V3o7q+YJiw6Kks3ZTtzGO
	SKSICzoDe46BpGfewHRnbSj5B73ApAA8n2Q97VegBxsMF/7lm6C+mGYyd4espXkfR3hXi3XQ4lh
	cevReeQRMXz3Ti2G0MIDWzzAVNLy+fID98HyZsB08+gFlCKkLNaszAWwRSFlTWbt/aJ71C+fff8
	GcES8+dtgCz1iioaYv1qRGPquX22cxzthmE+bMH3lWbh65TDGom/7GwMpI5wIP0KXpm6/BmwqFI
	W1JggvzcyqiSJEMCwItoOh
X-Received: by 2002:a05:6214:62b:b0:91c:6701:161e with SMTP id 6a1803df08f44-91f04195981mr1970966d6.53.1794335342020;
        Tue, 10 Nov 2026 10:29:02 -0800 (PST)
X-Received: by 2002:a05:6214:62b:b0:91c:6701:161e with SMTP id 6a1803df08f44-91f04195981mr1970486d6.53.1794335341480;
        Tue, 10 Nov 2026 10:29:01 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-177-200.net.columbia.edu. [128.59.177.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef05493desm26986666d6.45.2026.11.10.10.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:29:01 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] scsi: scsi_debug: fix protection information for
 writes
Date: Tue, 10 Nov 2026 13:28:53 -0500
Message-Id: <20261110-scsi-debug-pi-v1-0-539829902b3a@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAGZi82oC/yXMTQ5AQAxA4atI15pMJX6vIhZjFLVApohE3N1g+
 S3eu0DZCytU0QWeD1FZ5gCKI3CjnQdG6YIhMUlGZHJUp4Idt/uAq2CfkqHSFWVhDYRm9dzL+f3
 q5rfu7cRueydw3w8/G3uhcQAAAA==
X-Change-ID: 20261107-scsi-debug-pi-f51019c898a0
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>,
        John Garry <john.garry@linux.dev>,
        Luis Chamberlain <mcgrof@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Douglas Gilbert <dgilbert@interlog.com>
Cc: Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794335340; l=1202;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=9b9GbfhcF9wn/lxnEZX2ahoKHWp6i22V5f6J5qILpZY=;
 b=VGKW5qZjJ/w1czSJV7zYJIKlmO9VoB351Y8x4uLA5/s94RM8BRq+lheeXPdXlZikdPeZDXniI
 9iK+Okgw1BsB79HRVj1fW6ltvrTusWYowHYzvoTAjdzGZnceF0/fwYp
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX733yuN4/53sq
 YBMDkE6czJ4AjUNfvwSDedP9kmhCJ7lDt4x2bk1mN9GYNJlTFcmtPd1uj7Qo0qQGKYJBgViCuEX
 l7ryFzbw6zrvGAoOKR+da64ZYP2uyG2CI+LeDJl2SnApnGvuWXYU
X-Proofpoint-ORIG-GUID: Ep9hVUEpl66LNrnjOyJ05YvpEgn6_ViR
X-Proofpoint-GUID: Ep9hVUEpl66LNrnjOyJ05YvpEgn6_ViR
X-Authority-Analysis: v=2.4 cv=NPdAaE6g c=1 sm=1 tr=0 ts=6af3626e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=OksKZPe/0gFw8ujXGPm25g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=VwQbUJbxAAAA:8 a=rWoZ2Wt58CihLohAb7IA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX7nRf3TPHRaQN
 nTq5bmoaGZn6cX0QxQZ4ahZ9DjQSOO4lnvUukIIfaDlqb/lDsyimMPb0SZSzZAaOhDrSjpz3k2i
 2YXvMnHFun9WwaZW/WEolQUih5RkxwfKddiL3xLImRrIu703JTmMdbSBvzTb6e8WfodxcwtEd1a
 l12719DcVufvxklWRZsqzDfTX5eiTCcLI8oWhWmrcrbFV5stQh1KKe8hw6efGmUn+BFBZEU1Dyz
 o7bRVrr7n6JpyWtk8jCwIKk45WWmMn+vEm418Lf1tdihS+8ountFwJULkP9vZM2DKkAxAS8RQE7
 hEvcVEGTG24R4rXNyUXQPXuTzicVMTQaenV1vrFJif1KrXgai7oa30pEgSLhzfoftkMQo86xoC7
 VshKuagT0hkoX61ClERUJ6kFngrGa1xBsKD+qUNPrmI+6YamUYc3hWN8mZGr17ezorR+yTi37AJ
 uiJOal5xj1nAQWnWnuA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11962
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=10 bulkscore=10 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=10 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100073

With DIX enabled, blocks written by WRITE SAME or WRITE ATOMIC(16) on
scsi_debug fail the guard check when they are read back. A filesystem
made by mkfs.xfs on a previously formatted device can't be mounted, and
xfstests generic/770 fails on XFS.

The first patch makes WRITE ATOMIC(16) verify and store the protection
information it is sent, like WRITE. The second patch generates
protection information for writes that come without it, such as WRITE
SAME, as a device formatted with protection information does.

This was found while testing the atomic write bounce series [1]. The
fixes were proposed by an LLM.

[1] https://lore.kernel.org/r/20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu

---
Tal Zussman (2):
      scsi: scsi_debug: handle protection information for WRITE ATOMIC(16)
      scsi: scsi_debug: generate protection information for writes without it

 drivers/scsi/scsi_debug.c | 61 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 12 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-scsi-debug-pi-f51019c898a0

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

