Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335350;
	b=0O8Ik0qPq3qbKC4Cki+7xZ3nMDpV8pHgA4YyAu+F2SMlD8UB+dEH76Wnr8n+uR6i0Co5
	 RD3iCdFBk6r55YQF800vB+PSXPQMiMLbpqnDscE9FbQkbM2g7IGw8JmqMGgc3Jhto6o6U
	 ffiXSFVm6kbr6rr0rQoWsE9o+Ut3NEBcdBBIxUypkRK14+XeKLOwxhD/xQAirzKwgpWKW
	 36iSPWkEU8IsOSPPDga3TUJ4b+wYKCrkUzUemfT1ZMxyiD71xp99OYDeBEZDKu8125WRs
	 Zl6SAlcjGqe2P18IE54nzagpsmstLM4slUN9h9atAEkEXyb7kk+2ErfJefMs/l+yCBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3UYXTzqIc3GD2d/Uqq3rz/uW6FuUwJLzJRVH+aEvPnA=;
	b=BNovHG1Pnwbm457vrk02rT3oA56SkDn+mZ0bk/6LU3LwgJZAPVCM4IDkv/fHxsKtw+Fd
	 rtwl6KvPJnTCPBmGqQ9GLTVQQWm0sTyHRPfRg2e6pK4mRQsQ2I4HsiFlAfnxPqk0u5Pes
	 ezUHJSamVuKVtBzj+Rakv+Bmtz+P0qMQOvsAEbURQeHpiE2f7W7bIfCxQQd/ObJ+oinkt
	 hDGEZD+TpJT5WjmNznGjvAdJX3pRhjL14h4fv5vnlprMEk6lcI2bVtGInhFZzBec4qL5L
	 lhiJaRfIxGU0WQwqrRCeSejjRiWdPfTrBsZkorweA+k9cUIzj945Wsc4mIpxYugQu1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HjeJLOat;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=MmL4Wvwb;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B382560A2615
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B382560A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HjeJLOat;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=MmL4Wvwb
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAHYvnv2980241
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3UYX
	TzqIc3GD2d/Uqq3rz/uW6FuUwJLzJRVH+aEvPnA=; b=HjeJLOatnmYaeJ0SFCWS
	k7yCPs4c8+/Yqp/QeItdP2SbzFpJVT9IoZwfSFL4aWzoxZFLR57tf2ejPztkODN3
	8ZMMRdZpp4/wxlEIyxdPAsGdZLzjNM2fP0TzbPg3I27Pi1373c0Zc68B2emzHcfz
	NtDVybcHdhzqf3O3Y4ki1ppX1/KU+97ntbLHe5gkoa17D+lrwbIluS1a2XPBuXxA
	rtVaOjam27Z5UgFEurPVhL/lnN6iIyDjYyZxh9ukzhKYttQ94Dli78uKdp15SUld
	E4WpYFGFwdpHvSqjD+1pVFK59Q01pHwFhC5nPpdkC/RHVbnzFhhSZZRXaiNaOIud
	Zw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hv2xebc13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:03 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7bf2d734so50322966d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794335343; x=1794940143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UYXTzqIc3GD2d/Uqq3rz/uW6FuUwJLzJRVH+aEvPnA=;
        b=MmL4Wvwbem8qMyPkfxM6bTIvZqV2VnPol0LvgHLJs7wtVFoW1qQI7kd01k7o9piJqz
         RvOGUggDxGIRqtTNCE1U9K6zHpn/bk/9EI70S1VhpeVoIaEM4+IOvIeAcGQmHVlDySNf
         R764a/yLe4f1MaN3A0OVWW85TUAqmgQnvJSCs7RxVQ5pOb498D0VXChyjJ7HCg07N1v7
         MUtA8l+g1JM3Y9what65VKOG+455f5aLU4dysSrfPq+0SVgDwmC3pcqs/a1lPvD5ccnj
         TTFmtatNG/lsvMCXtQU/2y+KHk8WN9WRgZxmFXD/7oELANDuPtCpc7wPs8+0qYO/1/TV
         pf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335343; x=1794940143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UYXTzqIc3GD2d/Uqq3rz/uW6FuUwJLzJRVH+aEvPnA=;
        b=WWZGdR/Dn9ZddWNug6hZOKLS9KyPLiPswSIdsBeUbyc4I4ZM8mEpDymdhe5PDaGv7N
         DIKuCBHpbwtpuio22iHEfMKNApfRB3G/9VO5RgmIDbYfsyq7c0a4n+XM/4moYyfDCkp6
         lwWHPRGzWB+yT550DSym8h2cHtrh0ww8W9Nf7h1iaM8BiyvYEXtvCVXlGT1/ly9FT7M4
         PLpfnQs1MUZqNvrwkNZzhGnl+QY/DgPzzcJA5cVMgoQUKX0RbYmNC8WWXzk0xGHWABoC
         jchmQsuk7Fc5ycySFw/i90drn/ojUYEQPGoT6Eyj9Dz25zURAUAd+/hPqucY5nWJtJza
         aErw==
X-Forwarded-Encrypted: i=1; AL+hErHZRlSFIpgUsjamJPVcL2pJxJaTmPsaubYXUEo2dEa4tP++x9ciQG+i+zFPwQwCCSuxTgSnQRxVh+Vjdd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zAmTilL/Z8R3cZ0hPKn7d+JaKo3Qr3vcX3rJDMRqXJoGsV4ZZ
	RCot3NUj0nxXHf9wjhasxUhjj48u9av+f9hXmmIpWO7nxuTVMJvHp/klnMooJfeNjO+HGgY0DUG
	mdZ1HUhGgGuev5c677db7tHWpao/jnK+QJrwdQTmZ7uxUv+i+i/QAkwxm71TQ5g==
X-Gm-Gg: AYBFou0NmqDhY4YTupqKgkR/eIS7PIjLJO4MXnBfZnWS4m+BCoTZB7qOQiaDZ+upEWc
	f7FQYXItDI6ped/MBJLhr0l+XQQGPfePRDzj83CU1esOLqjegSz8Pqd0APm6/+Is9gWbjn/nQlO
	cfWggP098Kov5IyHuF+z9SiVEP1ZeKMHeHXfR8c8bvslfLs3qbL+v2iK5ybgQutf5qLefAO945u
	3fYwvmt7WG4Af1cLFg3TXBj32gyg1/p80yh25rTLGz25KI7XG77+b6d7V2gzjBgOqjgXF6YIYaG
	8G2TwGHcrQ0B+Z+eXlrF8IEgMCmGmn2VlqCoGlUo5OyA29HEVE4xvP9RY1MKvSEFNXgXQNDnXg1
	WoN0CeepcG0jWUYozCrN+UVDtQqWqv6iX5Lpj4W7zRVO8nx4vxd3wKMBACYs4oul20a3KWrrJc5
	0PaqFH/Gc1VPipNgBGe6z+
X-Received: by 2002:a05:6214:2485:b0:91e:7d96:9632 with SMTP id 6a1803df08f44-91f0429420bmr1450196d6.56.1794335343036;
        Tue, 10 Nov 2026 10:29:03 -0800 (PST)
X-Received: by 2002:a05:6214:2485:b0:91e:7d96:9632 with SMTP id 6a1803df08f44-91f0429420bmr1449646d6.56.1794335342497;
        Tue, 10 Nov 2026 10:29:02 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-177-200.net.columbia.edu. [128.59.177.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef05493desm26986666d6.45.2026.11.10.10.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:29:02 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 10 Nov 2026 13:28:54 -0500
Subject: [PATCH 1/2] scsi: scsi_debug: handle protection information for
 WRITE ATOMIC(16)
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
Message-Id: <20261110-scsi-debug-pi-v1-1-539829902b3a@columbia.edu>
References: <20261110-scsi-debug-pi-v1-0-539829902b3a@columbia.edu>
In-Reply-To: <20261110-scsi-debug-pi-v1-0-539829902b3a@columbia.edu>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>,
        John Garry <john.garry@linux.dev>,
        Luis Chamberlain <mcgrof@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Douglas Gilbert <dgilbert@interlog.com>
Cc: Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794335340; l=3366;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=G/bbWxpGviLlwTMdwEiGkliKHWlbGYslJddQeD+jnZo=;
 b=YzxMox06LGmkgoN+c84gR8ekjPKLyYGlxdJhzDl0xiNVztUrnIZgic+qtpJEQEL1kRtLCNq1l
 fsgsMX7KSg5DLI6iuSknGtPR3NbJ3Ouujk6aFcwUGZd4/4Mf5b8YBD8
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX+aXvC22AR8rU
 XVctKtbx46OX28xGvX04Ed6cKD81Daf/LgHypRFQsFxYjmNT+VskGIAN+QsKHZn2ZS0ZyuE6VP9
 MBom/0GlOisOa97xPADQstX0CJoD232Hsyx0RXtj8P7b9oo98MvCZPOW39897Ta4M3MVQSHF3RA
 e2kJln3pWE272yN9lFROJwtPrYSiA+6tH9uRcTAFvzyg/3o/zGjJM8QqcfhjDTm2eKf1rq5lQ5G
 Yolw+LCLgJ5MgUfeZkoNTFdmPMrloldLPGvTiJvaPgpGNQ1BVeCqfYMIACgzKxOxVWRURW/lNtH
 tVa8YDvmSOGbgAhTQwXoaeR9FZOqavzv0QmUSCFS/JDIk3h/B//FrXnIqnI7xPGRFJsZ48jf1zT
 0AjAlJj7J1JI4PAOMw++LcY/a4mR6wYzANWqTwyHsscXyaZFrrKXEpF2pUNqfMfVMbZ24u/LU4A
 fBaRR5Ga8Iud488vRqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX+RPpwXVSH11r
 VwhfhjwrDo5zEf+Cy7sVLlQpMDBl5vUBJLaeBJk/PGsQY0kSrYB4ALgrWeI+qmyRBE/TQ8nx8Lk
 vQJzApavxFNYGQc2TFHauizqN1e7lJpNM8SOje2uXKVqk3AikU/y
X-Authority-Analysis: v=2.4 cv=cvcOAF4i c=1 sm=1 tr=0 ts=6af3626f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=OksKZPe/0gFw8ujXGPm25g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=iw3vLhpcp_TJ7pi4OOcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: a74Az0tYLfgvHZmdVCPqEwux6tOP8QjG
X-Proofpoint-GUID: a74Az0tYLfgvHZmdVCPqEwux6tOP8QjG
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11962
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=10 suspectscore=0 priorityscore=1501
 lowpriorityscore=10 impostorscore=10 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100073

resp_atomic_write() writes the data but ignores the protection
information sent with the command, so the blocks keep the tags of their
previous contents and reading them back fails the guard check.

With scsi_debug loaded with dif=1 dix=1 atomic_wr=1, every RWF_ATOMIC
write that overwrites a block makes it unreadable, so xfstests
generic/770 fails on XFS.

Make resp_atomic_write() write through __resp_write_dt0() like WRITE
does, passing a new atomic argument down to do_device_access(). The
protection information is then verified and stored under the meta write
lock before the data is copied, as it is for WRITE.

Fixes: 84f3a3c01d70 ("scsi: scsi_debug: Atomic write support")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/scsi/scsi_debug.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index a922c8318a2f..7d5065039637 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -5175,7 +5175,8 @@ static int __resp_write_dt0_dix(struct scsi_cmnd *scp,
 static int __resp_write_dt0(struct scsi_cmnd *scp,
 			    struct sdebug_dev_info *devip,
 			    struct sdeb_store_info *sip, u64 lba, u32 num,
-			    u32 ei_lba, u8 group, bool lbp, int *scsi_status)
+			    u32 ei_lba, u8 group, bool lbp, bool atomic,
+			    int *scsi_status)
 {
 	int ret;
 
@@ -5191,7 +5192,7 @@ static int __resp_write_dt0(struct scsi_cmnd *scp,
 			return ret;
 	}
 
-	ret = do_device_access(sip, scp, 0, lba, num, group, true, false);
+	ret = do_device_access(sip, scp, 0, lba, num, group, true, atomic);
 	if (ret < 0)
 		*scsi_status = DID_ERROR << 16;
 
@@ -5286,11 +5287,11 @@ static int resp_write_dt0(struct scsi_cmnd *scp, struct sdebug_dev_info *devip)
 	    (sdebug_dix && scsi_prot_sg_count(scp)) || lbp) {
 		sdeb_meta_write_lock(sip);
 		ret = __resp_write_dt0(scp, devip, sip, lba, num, ei_lba, group,
-				       lbp, &scsi_status);
+				       lbp, false, &scsi_status);
 		sdeb_meta_write_unlock(sip);
 	} else {
 		ret = __resp_write_dt0(scp, devip, sip, lba, num, ei_lba, group,
-				       lbp, &scsi_status);
+				       lbp, false, &scsi_status);
 	}
 
 	if (unlikely(-1 == ret))
@@ -6328,6 +6329,7 @@ static int resp_atomic_write(struct scsi_cmnd *scp,
 	u16 boundary, len;
 	u64 lba, lba_tmp;
 	bool lbp = scsi_debug_lbp();
+	int scsi_status = DID_ERROR << 16;
 	int ret;
 
 	if (!scsi_debug_atomic_write()) {
@@ -6384,17 +6386,18 @@ static int resp_atomic_write(struct scsi_cmnd *scp,
 	if (scsi_bufflen(scp) < len * sdebug_sector_size)
 		return DID_ERROR << 16;
 
-	if (lbp) {
+	if ((sdebug_dix && scsi_prot_sg_count(scp)) || lbp) {
 		sdeb_meta_write_lock(sip);
-		ret = do_device_access(sip, scp, 0, lba, len, 0, true, true);
-		map_region(sip, lba, len);
+		ret = __resp_write_dt0(scp, devip, sip, lba, len, 0, 0, lbp,
+				       true, &scsi_status);
 		sdeb_meta_write_unlock(sip);
 	} else {
-		ret = do_device_access(sip, scp, 0, lba, len, 0, true, true);
+		ret = __resp_write_dt0(scp, devip, sip, lba, len, 0, 0, lbp,
+				       true, &scsi_status);
 	}
 
 	if (unlikely(ret < 0))
-		return DID_ERROR << 16;
+		return scsi_status;
 	if (unlikely(ret != len * sdebug_sector_size))
 		return DID_ERROR << 16;
 

-- 
2.39.5

