Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345830;
	b=GmV0uz6qzVhvGma8Q7Dzkf+KygQ8ADCLAQQkn6Hf1LoSUM/mrL6ZIppeGT9guXHgf8m2
	 /dMARc5sTEIj9HBY6VBJRXb61+/TITX/Sgl0Mzcr5HF1iR8x7feTUtlw6pYOnyB0zNcNi
	 9Hn/Aw/MhiSZ/ds+JqGY2h1iDErMNnPRby2e9l8tcLyZKmERfRr+swz3Ui397XKVctFto
	 gAs9Niw5fPWRyfA4CvJkETO+SUfU4vRPHNo+VptKW9RC9e4YAgLwiSRaVhWsbfruQ0WPo
	 rz/2t/4fLadbJDHVgtSdd3GpZcmxztfPwnh2eQOz0+JtJu0oiTRglGWyKOHjIdlNUoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HLb61peR27MkY2qCBFOd5z+gHtFg3eAJpgTGyWlH/SI=;
	b=AAkE5vfkCVOx9EHfjCce6LlLDwTJWvCipWzY5oFkSj49jannnqjv+vpLJkQva8PUyeHz
	 pBfSJugcAdFi3UxOm/2y0/azIqct2Vsx9DiU5yRcLzS9RkKwDPoezBj+jyRUBeCIHeh1G
	 veQvvfrOo9YrdPUOSDfn/D9zi1zhKDqFzL5aSK3hd2XdJTAOt1u9uL1lQ4UH1ZGr+gYm+
	 OgWadz9l+X7ZKvFmmaSxto4UIkwAjr7Zu9WgJVEholeFzzuzPHAY9BvWNgESHVYXiuUGN
	 c0JKTwd6uu5KF+kyl+uOwY0x9z+9Jz3Arw/ErFDdOXA/jCmTCexMInRXd2QlpcnNQew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qEHHdNGm;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=2jXrm+PA;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A705960A2617
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A705960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qEHHdNGm;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=2jXrm+PA
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAKRsjE1716114
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HLb6
	1peR27MkY2qCBFOd5z+gHtFg3eAJpgTGyWlH/SI=; b=qEHHdNGmVxzJYizHcgl+
	OBICv6oBfreg1xs1v5biIqk+cRY5uyai1cGwUVuPkFqFSJbIutQPGJFs6bE/C1Y1
	8MT+i1LdOcLo1vo3CxtPurZYZDuMi1nf+PvdjFlAKMmv+Q9K1NEp8mkupU8JLfoB
	JL4gvdYtGn70NAhpvE3graaPoWQPSuyF6x08kvU74I2hbiRQ1PjoweNv4hYHqXRk
	lsFKVP1Q0wcZMB3znHBLnNelAHwCV19fVlRWVwopigNYZBosqrjIEkFca/f/xEFC
	y7VLk2mJ5GZYMPavFIwzS2Dg62OCgsrcME2cYX4qnU6HDvONdO3QJzXCjpCrKHJc
	4w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hv4nj4c1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:23:42 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f01fccd3fso5601826d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794345822; x=1794950622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLb61peR27MkY2qCBFOd5z+gHtFg3eAJpgTGyWlH/SI=;
        b=2jXrm+PAcBHEV1FvVUMzZSLW6A+k0QEH0YUiZfz9YKbEMCOJbZzQIolI8M2Eqok8xm
         iZhuI0t5to+M7PCz7JEgHq29xxSTSqRGa8kVMTsy9B6IgByBvWEThtT0K8K/vpoXYtHM
         NmuBb+NBGctauhtMJx0OTLKsJmF/KXmlMXZxLzg/q05YGzdPNdqn56v4CEi2clwBc8IU
         1nBH4ag9Dy4fgmwKnZBJrNLlKnZ6gcQmSoLyDVQUk9cGIAINqGFCiWHEauTL9FZTuxBj
         BuNX7fc9bN6M1prTWIGhl/3cI6TiHxUvwYUksidydX3bopQjTp2LM02otRE+gl7zn1Fm
         07Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345822; x=1794950622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLb61peR27MkY2qCBFOd5z+gHtFg3eAJpgTGyWlH/SI=;
        b=hRgPuw0Ozxx+xKHtvRH+PKUkElpa/kIqfN+x2wo/WHdSmXdPLZq7g5Sppx5cv1QrUl
         iixulhyY5edBZ7XNlHQ2jvi7aaow6R8GQGCaOWQ9vU2XzJImJP4L0F/HUoKrqJKEs5JM
         vvDDsKI9SN2nosxCXp8NTR0fwJBi9Z724nfGc8M6ORC/0v7l3zHsH7sM3HVT0FgKNLQQ
         q2FY1eUXKaWGA5+trT5q8q3o07Pvg3PaD3J7FVtHp6DJgKHTgX0HfSRJmVEVBdn/hQvS
         NsHUK2GtNg7rgFLG3lTdNUFBrvCfj/rI6pZPUV27HY5Qc/H7MfDZivJu9Ku9238dPjph
         eYNw==
X-Forwarded-Encrypted: i=1; AL+hErEKoiDeYsL4A5XxNoA1b1TPa5kQCFcT2rEAymu4VcyEcIdS5opHBgwI83/RTn9D4GsEfTEuR4hpIDI5qzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w634fltvQ4KERO7RHpOgJeoESuKlI3Gbfk5DDl3i2IYs+hsNv
	WxaWhV4VQ8XsGDEzcPmHe1JDBCRPAmX1FJyCDcQXK3RGLyv1PSa04FX72VeEYA2VnHchQ+aPeWT
	KIrSbjZXJ6R9iF+SDeV4Mrki5b8DogA+xPtrkUmKEd6Y8EglXmHbpqfVBegyZaQ==
X-Gm-Gg: AYBFou0QQ24M2oYQs+c6ii2vHUasgM2B0MnaXvQky0NVjEfhUUc2ROcLeM+IT+JvuoP
	G5WQGlahYj7KtAiLmyIrq8aTRySgwcgmCkDUsbuDrAPOz7hB6j7ty9ypZroMSIcJiBzfssUEDan
	HXAm9OZPvb393ah1J5sBE67hEBt4B5ZHKqBNNj5NpyH6N4hiCmM9EeeO0tmH4YHot+XqoROfU7W
	A/OFygVtuPNyA3SOgE1lzaTsr5eJIRmEgdw8j5T2PuC9ea6IZ5idhfAkqjdNOmZS7pg1YScRJWh
	L07Cnn27GZkGTbLWVzoTxKsllUj+YaDlgXw64GlXjiNwtNvOeJtxkUibhP6w0zYuRqE1IIHXg9o
	9YV3QeQfs1HDDrBr1hqBkK+khnqQvJe/+ai+h1hrsul2KX5YPPLEXspXV4pE=
X-Received: by 2002:a05:6214:411e:b0:91e:972b:ad99 with SMTP id 6a1803df08f44-91ef027a678mr59494716d6.25.1794345821700;
        Tue, 10 Nov 2026 13:23:41 -0800 (PST)
X-Received: by 2002:a05:6214:411e:b0:91e:972b:ad99 with SMTP id 6a1803df08f44-91ef027a678mr59494376d6.25.1794345821302;
        Tue, 10 Nov 2026 13:23:41 -0800 (PST)
Received: from [127.0.1.1] ([129.236.231.168])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f00f6eb88sm10024766d6.39.2026.11.10.13.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:23:40 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 10 Nov 2026 16:23:31 -0500
Subject: [PATCH 2/2] scsi: scsi_debug: reset protection information on zone
 reset
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
Message-Id: <20261110-scsi-debug-zone-reset-v1-2-28cb9184b5ea@columbia.edu>
References: <20261110-scsi-debug-zone-reset-v1-0-28cb9184b5ea@columbia.edu>
In-Reply-To: <20261110-scsi-debug-zone-reset-v1-0-28cb9184b5ea@columbia.edu>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Douglas Gilbert <dgilbert@interlog.com>,
        Damien Le Moal <dlemoal@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794345818; l=2529;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=fmP65CUlyZGB3m4UhIjwsXB6SABvsQU/J6EW3xnTXUQ=;
 b=Kya6PTUYQvqO0V7q31L4vBI1/QyWKy/Hm1eSUFBhGu6gd3clU6R/bDSyUR8sR66tvQSamWhue
 sB+5NRL7/47D1lj5bE5bURDkUSXUkoiqk9RQmHN87IoMctRnk1CsXOQ
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: fTo5x61UfGbQFl0h__BGv8cLBbLgGp5g
X-Authority-Analysis: v=2.4 cv=I8fw19gg c=1 sm=1 tr=0 ts=6af38b5e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=lHGGv15rhlN7Yv6qcqrt9g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=t5kXCcw8_YMdeodUEPQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: fTo5x61UfGbQFl0h__BGv8cLBbLgGp5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4NSBTYWx0ZWRfX3xur9MoURZp7
 qG2dA+tMuIl2AYN6/rkmJQJuOuBWkxs5Jdfiq1Qtr4ECdF2s13GIUJmum6el+fpGgL3mO0DUTO9
 8dZ6fxmsd78ekzm+H6Fu2aRrM3eaDhLcSX7xCQcT4ut0ftqlstkurvbQWvYZzpWmyRQzZ3ckOB1
 NsWEdHF/ff45UVQTATEfetBKGL0zpB9bSMmtzMUCRJ91VAY9cl+JtUBBSdcb+wkOAkGXH9EyfbJ
 7sKLYPIYlAhYJR7l3lrJD2VsaW7bPrupM0BLhKj0zk+ucFNm/aQqSFbSXgSlhDmVtMHxKlTb0T9
 FMyoC8+4yIADLZfQeTyNxsP+tE9izAeXI09Aea6RPJnLX43dTNTIvtho9+FxRu0W+rkRUSyT2hZ
 Oe4PjEbAyEtnTOhgH71JTAKrPZn89RP8oLsZkvWH7545G6X1taniC8cYHBVODIyvMyX8JOfhvsc
 nHcnW4IUZPw1EYfml6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4NSBTYWx0ZWRfXyWi8IwLWkB9I
 QvuR0xSo/5DvlicA06KtwGU9ERlrg3OaokH9nvnei2B2wpQLaf0xj68l/Dnu4z7pWc+56uNTUeG
 Al9AmSIy8HjCC0WJ1kkeWDl5TxTYiZSanivjmngaZm9IW4+3QZEh
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11962
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=10 phishscore=0 lowpriorityscore=10
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100085

zbc_rwp_zone() zeroes the data of a zone that is reset, but leaves the
protection information of its previous contents in place. Reads of a
zoned device are not limited to the blocks below the write pointer, so
with DIX enabled reading those blocks back fails the guard check.

Write to a zone, reset it and read it back:

  # modprobe scsi_debug zbc=managed sector_size=4096 dev_size_mb=64 \
        zone_size_mb=4 dif=1 dix=1
  # dd if=/dev/urandom of=/dev/sda bs=1M count=1 seek=8 oflag=direct
  # blkzone reset -o 16384 -c 1 /dev/sda
  # dd if=/dev/sda of=/dev/null bs=1M count=1 skip=8 iflag=direct
  dd: error reading '/dev/sda': Invalid or incomplete multibyte or wide character

The read fails with EILSEQ, and the guard tag that the device reports
is still that of the data that was written, while the block now holds
zeroes:

scsi_debug:dif_verify: GUARD check failed on sector 2048 rcvd 0x288f, data 0x0000
protection error, dev sda, sector 16384 op 0x0:(READ) flags 0x10800 phys_seg 256 prio class 2

Reset the protection information of the zeroed blocks to 0xff, as
unmap_region() does, so that they are not checked until they are
written again.

Fixes: f0d1cf9378bd ("scsi: scsi_debug: Add ZBC zone commands")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/scsi/scsi_debug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 1c27ea0f9b69..9eb64caebdf9 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -6613,8 +6613,9 @@ static int resp_finish_zone(struct scsi_cmnd *scp,
 }
 
 /*
- * Zero the blocks of a zone that is being reset. The store can be smaller
- * than the device, so wrap around at its end like do_device_access() does.
+ * Zero the blocks of a zone that is being reset, and reset their protection
+ * information. The store can be smaller than the device, so wrap around at
+ * its end like do_device_access() does.
  */
 static void zbc_zero_blocks(struct sdeb_store_info *sip, sector_t lba,
 			    sector_t num)
@@ -6630,6 +6631,9 @@ static void zbc_zero_blocks(struct sdeb_store_info *sip, sector_t lba,
 		n = min_t(sector_t, num, sdebug_store_sectors - block);
 		memset(sip->storep + block * sdebug_sector_size, 0,
 		       (size_t)n * sdebug_sector_size);
+		if (sip->dif_storep)
+			memset(sip->dif_storep + block, 0xff,
+			       n * sizeof(*sip->dif_storep));
 		lba += n;
 		num -= n;
 	}

-- 
2.39.5

