Received: from outbound.mr.icloud.com (mr-2006k-snip4-2.eps.apple.com [57.103.70.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E2423A85
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505028; cv=none; b=folqP2RgetU76BBc8TM3q8WPhDymCwUbbfXmkJNZFVBVwrOkAXjNYRmpRCaRsHcbEeaOD+ZAKL0r3s+Kg02JK3E5NDrH9RZVEFe/57ABG3RpUdrXWBVUt38qNmi7NclLPDX432m7uZ0DtImz8+s61PuL0wfOJJe3iaDXtXTIA0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505028; c=relaxed/simple;
	bh=F+svzLYHQqMe+JIs3TCyXCjOxWcQ2y7g+Fopq/PDfeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQOJ5vtHH/vH/zW9mqFRutmCSWkzbwUyZQMBCp8qfsjQ/f3yHdRNLO3BnZa4yuJpIgrQqrrwC2HkQk2U6zh6IDH1HvQrlkPwbnMzlIt3wweT9Hig9s8t5YeTAPXarJ57Qi5PpcvVTdQ7zeHbViQW2nD5T8AhllnlaeRyeuAT87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr; spf=pass smtp.mailfrom=pinon1.fr; dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b=bNW60aW/; arc=none smtp.client-ip=57.103.70.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b="bNW60aW/"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-2 (Postfix) with ESMTPS id A2AD718000B2;
	Fri, 04 Sep 2026 06:57:01 +0000 (UTC)
X-ICL-RepId: 01a06b34-dc0a-7950-9498-83cfa9f954d9
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQBKHVwPXxxBDUwdXwZcEhVdRUMEUhlAFXkIWgNYBQNeXwoTC1NWQhlXF11cGQ1AUEsbDloXA1ccVkVcGEMJXQVXHB0ARUVbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BHAlwfV0kdC0VLXxldRQ9fB1kEQABIB10BXgRFClYFXQFSH0EUCFoIRRlXMEkRXQJZWhwWS0YTGU4bV01aDUAZWAZtFFYVUgRZ
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pinon1.fr; s=sig1; t=1788505024; x=1791097024; bh=uJL3FePFId7Z+1JFVTIx4BDzbsE2Z3Mv5eiTZ6r5SpI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=bNW60aW/rsvFr7E38w2eHG7T4vPekq08Rn7bMgFWMOL2d7A5JyRHeO4JVX/ZtOsJNRqBUJTky4gD4fmTOZYwE5M1z6g6f/y+0UE9TBDl80J9JK+7zM9DBSqjUaCJHZXbWEBa9Jbq5TB1rkmcRKLL80xiI47EXLHgYnTyu4H7udF2QZ/Vnd8wKhmfJUoBk6sVpHHFlxKw/s+FKn6ETWzMzPCfQxn3fc77vzUap3ToLhENQ1syvSIHoCgaHauHM4T4OsncZePETNii65uKbL4f6ifqATSIUxh05U2coOmDQKS3ODtVjsWXiBfYLdpHtvR8T3sDo//cJl1RPWwu0mJl2Q==
mail-alias-created-date: 1575045973000
Received: from 2a01cb0a80256b8bfbb9c8b6ea0a448d.ipv6.abo.wanadoo.fr (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-2 (Postfix) with ESMTPSA id 019D31800118;
	Fri, 04 Sep 2026 06:56:58 +0000 (UTC)
From: Pierre Pinon <pierre@pinon1.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Pierre Pinon <pierre@pinon1.fr>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Samuele Angioli <samuele.angioli@inspect.it>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: Add upside-down quirk for Dell Pro 14 Premium PA14260
Date: Fri,  4 Sep 2026 08:56:51 +0200
Message-ID: <20260904065653.6069-1-pierre@pinon1.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Vnzf4xmJzSS3IinWs3IIJWcodIWXsnQ6
X-Authority-Info-Out: v=2.4 cv=VYf6/Vp9 c=1 sm=1 tr=0 ts=6a9a6bbe
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=boi_gUL6bhiNLq70S3UA:9
X-Proofpoint-GUID: Vnzf4xmJzSS3IinWs3IIJWcodIWXsnQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX5OXaDGROG1KM
 FmGCEFgEhvHV/TqM1sV9PhFhwGV+H8uhjQ3jRMez1S59XYpBdF/F8jvHcZDWqMDUfFP+FqHPOO0
 ECi6LZCH9CdbzOfuXRNO7gAhXHEBAq/4CXaQCErWFczlCz2J3rLSjj1+tbZwuNTLY2MDHNRdYXj
 L2/Q37dhB/qD2AFj56yj0WenWA45/xkzvh8+YzMHF22MiKFwImUqV80hYYfCtzzvLlxHk1hinqy
 bhhYiIfPFeWI2I75ta6ZyVwM5m/nB+5glXRggKPGNlOrQkQ5OuVzigwFK2zzIcnOjXXpCNZWsEH
 LeiYZQqW5pzpCNb5g2a+OYL9SCsCmP76HFmvtSbmOi4braQ7sA7aaXGQ2eOlX4=
X-JNJ: AAAAAAABT1jCJHPBtufIwJwbB63JdZ/Dqx75IDwQVrbD1GKna5P/b3e6gTCu/MxyzQZ5FhS15xlb7zvGwWydfAUda0K3R8tFCErOy2txVsgcBhV3EST7phnSi/Qlb8mxsTSQLFFpa+6Y9gB/Cyp1KjbzAdGcIoZbz4qfrjWxc+TwNKH68Skz6kqpQBW0LnkvffGqQqsu5RHrDSaUEopYnVjn3lQoc7YU3BorE3yLxQ+kCHGhO0zo7/oDql9NoEXPpj4EifvIW9UUvP/aj4k7ncsYqepEtBZQFeARudRSf4TgIscWX+uY1ao+Kivb5V0O/ALyxsqHbv+tPu1p+1+ub83NmZTa3awYMehgSR0Dg8lMFoJlkRvYAC2ljDjdjimrb9hRJdLvH8uGH5yJqrngVIcBw94cPLvuxDikbXKv3kEli82v2RsgytYeJOnVqML7PUt2KlFxuhFNEoAC7Rob7v47VS9QCLMQ938xdcfQ8RX8NZAO7+yVX0VIt1ZzmbcdYXkJsLKSfBt7DrXGnghU0rxpLlEGpswSSZcsaO5FHTXiqJEEcnWN0HEp0kz8UG3XZR8pzx5qqNGBM2xXYBhWyavw2C9MaGNXthl2HjC7TUDCFZdxEyinIXhPf2vxaIFymWwMTYVX5ALlhp3XIYUo5+KsigNVzqhbsEuEoL07iXbs8iAcTLKilV0R+5AHZ7aoCQi/6+UH1EKNOHoJLgkxOAeFYtMPng4AOKtLi+hFuOKb/lsZVqBMvNcKYd1FxwhUpd5HjbU1crUVCmlC6caYFnOu+Nfyv/AGZcWeRVUd4ELXqKgAeDgn0kY6SdhQhAcbNVthNqxpsWmGcymPmR9VZztp3ivsJvXgZw8Sw2toHZhqK/CwMPFQYo0QEx49StgUGCMT+iu8dC+3qZ0/0u3llbBcKzNzcdtDqvdy/hssh4Ptgx7l0gK1J7cqjmN/OHhRXBzkgC65VhXlUWUrhnV3PhbRMWdQ+em
 SxKZRTXsrznujzPDtrqOKIAe8Zzg9AZLjxzYfH707att/6sTvutG8zU8UPC61D517jo6jm6f8N3Y9agWLukuFnMFMnAVWBhrGJ7tAoEvvVKfkycYBgbhG8AeUDvNDpAUt/sWt1/5BEzdLu9GGeVmiQeaoljGzHVCjXu5lQjCc/r/4a3ui3k7ed+ozVksb2AZnPqymYjYiQZjGV8YxbyEZtfFgbsvsJJ69wYdjvC/gg/U/cZQPu38k2shqsAdM9uy3Z+SoBWRtlV7LMMQRcp6As7MnP/o2VoWNU2Ot8KdWKzdgH2lZciU8J1sCC+Ox0/KiCqE2UWc=

The Dell Pro 14 Premium PA14260 (Panther Lake, IPU7 + Intel CVS) has its
OV08X40 front sensor mounted upside down, but reports a rotation of 0 in
its SSDB, so without a DMI quirk the image is presented upside down.

Add a DMI quirk entry for this model so that a rotation of 180 degrees is
reported for its OVTI08F4 sensor.

Tested on the affected machine: with the quirk applied,
camera_sensor_rotation reads 180 and the captured image is the right way
up.

Signed-off-by: Pierre Pinon <pierre@pinon1.fr>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..b0a66b40873f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -145,6 +145,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro 14 Premium PA14260"),
+		},
+		.driver_data = "OVTI08F4",
+	},
 	/*
 	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
 	 * machine type/model. For example, a DMI_BOARD_NAME starting with

base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.55.0

