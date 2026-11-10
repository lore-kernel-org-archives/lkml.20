Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335351;
	b=KQYMuHYCMCCt9eRZUSDLdYAHvwx4hd4OUo/s+J8y5K6DPYTz0jdHBKWUXmm0r8qROlE5
	 OQEucvMWmxtgvflJJxIFm2qcV1d0mxKR+f1bNhkwKH7zb4loc5zyK32bAIMi6YMOoEvoK
	 yXvJ9CLbS57AU96Rm0gPgXkZBo4qCFi4ice+VcmBGZi62uEWmzi3tmGUGiKpbqrJgf0vS
	 gEkC6oUubG95K4VyQ882Ndkw710qKG2nmPKVdfVosSba90u9FCNlwZeZfBC8ditlv9P4G
	 Q48AOMKbzGhU3/QThLZpQYAJdTUXy3OXmyUTlj7QpBMtYmthxKUW6EDRE3zY/IHXwnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nOvo/M04E2I6xkzAUOHPFcPB0rs6jwLGU2nA3+JtmUc=;
	b=3WLdxVsRgNOsAH9H1y3F5E7A1JBYnhoS5CVwC/Am6OrmKPj1LnGcIW8LwiWNnCykPg++
	 KCfougAPLAAZF7yAYrbKBAZ+PIDKcbMoUPVASAzwTXcVVb4/4OV0IfWA5MhMoFw2q16dj
	 ReMrI4VmV2sjYpECqsFX4K00sRtrOUF93t1bwzyYJIztqZB5OdlQyMZmLZU+XiiVtoJWW
	 Ur8LCAQoslLSAyXuSVjjyaee1xvY1BVv12CJI/eFZdp1alOdVzq7RiE4WLLmTPfdAvg6G
	 U1pr4yjGFeE4re04ovSvbadOeh3bWKZT3ydm9SlgIr4Q3rPD7AN/6Kvzm5L0KL05P5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ilehM0CG;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=C96d0oEA;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EEB606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EEB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ilehM0CG;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=C96d0oEA
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAHYqgp1873588
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=nOvo
	/M04E2I6xkzAUOHPFcPB0rs6jwLGU2nA3+JtmUc=; b=ilehM0CGRfTOU9vGCzjQ
	m95IRNQXDmJnGlFjejrk1u2gRirLYm2cY7dy61M/hgWlaibYTORfQN5XvtnbwN3J
	kvMl5nTDPiClv3bMAC9c/dqv7ol+0KWVW4p9uNqSF3Wu0OSOBT/+ijFC8ZUYkscy
	nUE7HdhEaDufVt5a9qRQpLClhx9ervurGywYEyJJf4oCY6Kcg35tj0M3RMraPKoE
	y4dVv6b6i7crkI/NXMJIiDxuWAgkvV9hrdVUaC+Y+WyXBRv9Chpr902CV+L7v/Gj
	mrn0HSx30uf+6HsZjjPbItEg6KmItpF4qtVzvRTUM0HAvxicG+PgJsGpEDyWNURX
	IA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hv4u7tgjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:04 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-542fc61841eso51326781cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794335344; x=1794940144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOvo/M04E2I6xkzAUOHPFcPB0rs6jwLGU2nA3+JtmUc=;
        b=C96d0oEAnMkE8Hw0jhWqyZP70E4jI47QGWY4+pA6K/iHQOpMgaFcLyg+9Pld2pITX2
         MOil4C+Yp9GPAchUT8752g/3Jp+yz+PnRDH+tTZ5DeVgvvOsc5Ub4D68bBUlbTizfsYw
         u0deJHiUYzA7bxEBJ4rlAyNoN9hRqpMaBzxWGfofU7NRlKlcFrvl8kejqdCdHz9dCutJ
         NU+EnookF/N8JDbxNB8yHFXTRb3Hgcz6tMlP1wRKA5+5mMUkfnoyg8fbXSPNwKHF4OrA
         hwdO+P5/USWwVrErdiSwBcWIR5R4O83JnJqJGBvuV0jVsbMtbbz2uvUHRqPgWvoam7fR
         4tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335344; x=1794940144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOvo/M04E2I6xkzAUOHPFcPB0rs6jwLGU2nA3+JtmUc=;
        b=LRHO9s0Q5zlukqy6PPE5A67lTD8o8dOxVQL4vLIUSC/lcX0hDcMGjwkDr2sTWc2Qdv
         3DV07InyvFLw1jb0tDzcdVSVdUyUDgCU7OMdBSpPRKycoy9xF+7thYlMWtS88zj9VMNN
         OptODE8sIO2HXxgheF+hQXFI2bsQIV2OgT1d/Xa5au0z/Bf/pk4XZrdZWmDicGgvEDcA
         o0B8r2jhdGfrrZauOvoqcSQoTFHt8qFR6Jt8mPMwUwpVZlW7GY2Jl222xSxRigPl8PtW
         8GVx/PJuLZOZy8Q3EgPKIsChyciFMGf4HkB34Cp+fEuYMMj3TVsA24InEAcsh/YZwJEP
         cJ2A==
X-Forwarded-Encrypted: i=1; AL+hErEXQrsWuCpce00G8/VjYj8oVFpLj7Fyly4xG6YC+M+QgJF2fL4OSMXySpcALGG2wSx3Qc2W/rAxlQxVqtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7Y71mg7B4VgLZIyX3MNLH/kUnOy+y9F+xFU/GpysaaGJll770
	TVBV2hmW9GWMRQ1TzI99a8VcOfDDX9F7QRFfdsbZzO2CkZlK71QVfFYLk6D25WPL5VxBy8ujM7T
	w9lp2SEH1fcHLPbMU1yiJ7+vvz15oJCsoXk5nLxfHd3pyn/cqbPn7QT7qC0rvCw==
X-Gm-Gg: AYBFou1Bcz+LtAc9P008DkRBgMXtDKF4yZrNDAVJkcMLV2dBNiiqp5jUU/ijGFyaSUe
	7tyUbz2drFZbhmCGyfjTNOvK1L8yBSipUk1B1cTm2U8TB2YQCfA/1uVnB5zqHG//Y2Gl5zDnSGe
	youZcEjPrJ0QuIUC9/SKWHvx+eY2eSyoNV/ZrI6kMDwxCnODfRy1p4ib3o+bHf6wQ4+kdMg7GWR
	VvsHkVka+4OJi8vT6yZqFCT7HqTpuxT3JwzvVAXaJG8/z5EkCJncX9VTlQt903V0UU1gsT2Mw0i
	BbAnXB7UYwxgA21qO5oLBP55cGRGu7GQrNLv6qsufigPgO74wdwKIBjQIauumiod6VZbBhKXc5Y
	CClTdgxMoDAV7L5iY2xygedFflQCaDzXmyzXo6gIFXCXZF3/TuNTBJ5716L9Uq0RXMUKXCcJ/xS
	iyAMCyLNlypZCxPfL3eOeE
X-Received: by 2002:a05:622a:5e0d:b0:536:719d:7974 with SMTP id d75a77b69052e-555283f3c18mr53051931cf.55.1794335343895;
        Tue, 10 Nov 2026 10:29:03 -0800 (PST)
X-Received: by 2002:a05:622a:5e0d:b0:536:719d:7974 with SMTP id d75a77b69052e-555283f3c18mr53051681cf.55.1794335343498;
        Tue, 10 Nov 2026 10:29:03 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-177-200.net.columbia.edu. [128.59.177.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef05493desm26986666d6.45.2026.11.10.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:29:02 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 10 Nov 2026 13:28:55 -0500
Subject: [PATCH 2/2] scsi: scsi_debug: generate protection information for
 writes without it
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
Message-Id: <20261110-scsi-debug-pi-v1-2-539829902b3a@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794335340; l=5749;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=VgRQqft2zbITDi2ZsgnRKYYve9Lrz8zjT/nqRz1KLos=;
 b=njvoi41HfYrlp7Ui/zKsZ12J/XPShGBhooy2lqbImM53+QcyI85oyztIBStwTFX+reZvxSOC3
 Q+aF2hmbSp8D5qoR4hG9TpTxGm727wDFpsP7XOmO3rGO0lHy+/d4ZdB
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=T8UZ3PKQ c=1 sm=1 tr=0 ts=6af36270 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=OksKZPe/0gFw8ujXGPm25g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=VFRM4yhJdAcL9415qCAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfXxxHddUIqSCxl
 UNAWRYrWsjTbGaas8VjQNz00F8btAeJMrJA/FKLRwChkmI/vq7idqvFsFDLJeMsmHSyOkYJ3n9X
 3VCqa9gshJKkhtgseVz9hD6gEez3KxaB+iII83o6rZ7PHroGLR9LvY6bZC3EpQTMMxEdIPOnMOC
 PfGSuxkf7xKLmJsWfVhCia2Of8wVh92Tx5NDmEgU4CSWZe3UuHII2lTa/xoHO0EQxQlHlyReGl+
 kAr1u7lw5BbePnQyzBfQEMnc9c0N6OXmeYRUwxk0sKpI3W35aJk/f7X5GK6iTNny+4jGhvTlpp9
 kGm50KPKeQtD4Bziyk4VhvgLvrm3RUPegs133zbcC2iX9iapU6BGYwMJWgu4J2RSHDJTYzvuJTe
 dkN0SoaIRaJXx+JCbX5tOVDzzUGAvTpJ64MbNGVDJZ7Ct6Omgu4fJKcTfx8dgzUBCe0jlGkERgU
 4CGj4Z+Nwp0tLTtmn8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX0QWSDdAkaXdr
 xAiAh7wEQErIuZ1GpwfidREJK+KNX7Taz5aYwDiqWVirL7NLoqN44eDmyr8dP1llW3R8Aw8nvUY
 LQJjDyRf1pVI9485K/xM8kY2ljmBLMNnUngmCKuhEdsryrsCygns
X-Proofpoint-GUID: bV_xEp4xpxGtX__AlN1Sv33Prvyh1mOd
X-Proofpoint-ORIG-GUID: bV_xEp4xpxGtX__AlN1Sv33Prvyh1mOd
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11962
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=10 suspectscore=0 impostorscore=10 malwarescore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100073

With DIX enabled, scsi_debug only updates the protection information of
blocks written by a command that carries it. Any other write leaves the
tags of the blocks' previous contents in place, so reading them back
fails the guard check. A real device formatted with protection
information generates it for such writes.

sd never sends protection information with WRITE SAME, so a BLKZEROOUT
over previously written blocks makes them unreadable. mkfs.xfs zeroes
the log this way, so formatting a device a second time leaves a
filesystem that can't be mounted:

  # modprobe scsi_debug sector_size=4096 dev_size_mb=1024 dif=1 dix=1
  # mkfs.xfs -f /dev/sda && mount /dev/sda /mnt && umount /mnt
  # mkfs.xfs -f /dev/sda && mount /dev/sda /mnt
  mount: /mnt: mount(2) system call failed: Invalid or incomplete multibyte or wide character.

The guard tag is still that of the log the first filesystem wrote,
while the block now holds zeroes:

scsi_debug:dif_verify: GUARD check failed on sector 131593 rcvd 0xe313, data 0x0000
XFS (sda): log recovery read I/O error at daddr 0xff8 len 8 error -84
XFS (sda): log mount failed

COMPARE AND WRITE has the same problem, as do WRITE, WRITE SCATTERED
and WRITE ATOMIC(16) when they are sent without protection
information.

Generate the protection information for these writes: the guard tag
from the data, the LBA as the reference tag and an application tag of
FFFFh. scsi_debug does not check a block with that application tag when
it is read back.

WRITE SAME writes the same data to every block, so compute its guard
tag only once. Take the meta write lock whenever DIX is enabled, so
generating the tags is serialized with the reads that verify and return
them.

Fixes: c6a44287417d ("[SCSI] scsi_debug: DIF/DIX support")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/scsi/scsi_debug.c | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 7d5065039637..2c7afdd2846b 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -4434,6 +4434,32 @@ static __be16 dif_compute_csum(const void *buf, int len)
 	return csum;
 }
 
+/*
+ * Generate the protection information for blocks written without any, as a
+ * device formatted with protection information does. The guard tag is only
+ * computed once if @same says that the blocks all hold the same data.
+ */
+static void dif_generate(struct sdeb_store_info *sip, u64 lba, u32 num,
+			 bool same)
+{
+	__be16 guard = 0;
+	u32 i;
+
+	if (!sip->dif_storep)
+		return;
+
+	for (i = 0; i < num; i++) {
+		struct t10_pi_tuple *sdt = dif_store(sip, lba + i);
+
+		if (!same || !i)
+			guard = dif_compute_csum(lba2fake_store(sip, lba + i),
+						 sdebug_sector_size);
+		sdt->guard_tag = guard;
+		sdt->app_tag = T10_PI_APP_ESCAPE;
+		sdt->ref_tag = cpu_to_be32(lower_32_bits(lba + i));
+	}
+}
+
 static int dif_verify(struct t10_pi_tuple *sdt, const void *data,
 		      sector_t sector, u32 ei_lba)
 {
@@ -5195,6 +5221,9 @@ static int __resp_write_dt0(struct scsi_cmnd *scp,
 	ret = do_device_access(sip, scp, 0, lba, num, group, true, atomic);
 	if (ret < 0)
 		*scsi_status = DID_ERROR << 16;
+	else if (!scsi_prot_sg_count(scp))
+		dif_generate(sip, lba, DIV_ROUND_UP(ret, sdebug_sector_size),
+			     false);
 
 	if (unlikely(lbp))
 		map_region(sip, lba, num);
@@ -5283,8 +5312,7 @@ static int resp_write_dt0(struct scsi_cmnd *scp, struct sdebug_dev_info *devip)
 				    "to DIF device\n");
 	}
 
-	if (sdebug_dev_is_zoned(devip) ||
-	    (sdebug_dix && scsi_prot_sg_count(scp)) || lbp) {
+	if (sdebug_dev_is_zoned(devip) || sdebug_dix || lbp) {
 		sdeb_meta_write_lock(sip);
 		ret = __resp_write_dt0(scp, devip, sip, lba, num, ei_lba, group,
 				       lbp, false, &scsi_status);
@@ -5473,6 +5501,10 @@ static int resp_write_scat(struct scsi_cmnd *scp,
 			sdev_printk(KERN_INFO, scp->device,
 			    "%s: write: cdb indicated=%llu, IO sent=%d bytes\n",
 			    my_name, num_by, ret);
+		if (!scsi_prot_sg_count(scp))
+			dif_generate(sip, lba,
+				     DIV_ROUND_UP(ret, sdebug_sector_size),
+				     false);
 
 		if (unlikely((sdebug_opts & SDEBUG_OPT_RECOV_DIF_DIX) &&
 			     atomic_read(&sdeb_inject_pending))) {
@@ -5564,6 +5596,7 @@ static int __resp_write_same(struct scsi_cmnd *scp, u64 lba, u32 num,
 		block = do_div(lbaa, sdebug_store_sectors);
 		memmove(fsp + (block * lb_size), fs1p, lb_size);
 	}
+	dif_generate(sip, lba, num, true);
 	if (lbp)
 		map_region(sip, lba, num);
 	/* If ZBC zone then bump its write pointer */
@@ -5584,7 +5617,7 @@ static int resp_write_same(struct scsi_cmnd *scp, u64 lba, u32 num, u32 ei_lba,
 	const bool lbp = scsi_debug_lbp();
 	int ret;
 
-	if (sdebug_dev_is_zoned(devip) || lbp) {
+	if (sdebug_dev_is_zoned(devip) || sdebug_dix || lbp) {
 		sdeb_meta_write_lock(sip);
 		ret = __resp_write_same(scp, lba, num, ei_lba, unmap, ndob,
 					lbp);
@@ -5753,6 +5786,7 @@ static int resp_comp_write(struct scsi_cmnd *scp,
 		retval = check_condition_result;
 		goto cleanup_unlock;
 	}
+	dif_generate(sip, lba, num, false);
 
 	/* Cover sip->map_storep (which map_region() sets) with the meta lock */
 	if (scsi_debug_lbp())
@@ -6386,7 +6420,7 @@ static int resp_atomic_write(struct scsi_cmnd *scp,
 	if (scsi_bufflen(scp) < len * sdebug_sector_size)
 		return DID_ERROR << 16;
 
-	if ((sdebug_dix && scsi_prot_sg_count(scp)) || lbp) {
+	if (sdebug_dix || lbp) {
 		sdeb_meta_write_lock(sip);
 		ret = __resp_write_dt0(scp, devip, sip, lba, len, 0, 0, lbp,
 				       true, &scsi_status);

-- 
2.39.5

