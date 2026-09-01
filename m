Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3196396585
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245946; cv=none; b=ugrHhI9enLQSmy+w0uSdOkNXu56j0ljKWBBVJ4S0otgNSfZNWsSt+6S/e2u3GIEFIPc3EhCyaohjUuiX3qpY4/FHHImnRGVKA8J4RQ0MkY5HgWW6GaDs9tnkcWYqDAaqLdC54XnAh7xlf23cI+2BJAhZIJcWjkjynivnYpSbrc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245946; c=relaxed/simple;
	bh=3t+MtCAfVpQXcSeX3z4rRQhTgH7K8MTTiQmLOB6AIr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hMmfrACGrhKL1wLuG9xfAJxSMOi6ffSw4qv59sA8a9c9h7g55a9P4nuIOB14zA9aO+Fab59JUvOeZGg0s5+Yi4A8r85ZEinO+cP9CXES5mRDVSYkZlOx5jA9WOebGzNfKfcGjyHaPserTdB6u9FNtGyGJis63hnX/LVsuw16HsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net; spf=pass smtp.mailfrom=arkamondal.net; dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b=Ibg8Jevv; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ebg3Jy21; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b="Ibg8Jevv";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ebg3Jy21"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Ibg8JevvFVejrp1C4qOK6J8CXtrrK4ntaNNrPIBdaPC0v/2RM5uqV+RLWUC/omFli7jeiufkdzytR+VyKpLZIP1nczfq05IRXXnEo8vzujd8XELx3Rg4xEL+Gu9EcvF2RvfWuUVjKRN6R8n+MJFdM3xLQDrm9OSoedHYEVTdGdK0AZs98x/LH8n8hAFLe4vTsbeMPiL5SNRgXE2AqnShMUV17Rzj17Zl+ozcb1OVj9Xo7r9vwRrOtdCUP6AfUxPU9D7EtKAFJUNLqmHOIIgREJfWBRKL80As7+ppMJtbATHCuGcQXEbpsSN8dMEb6kLM8UOMt4dal1G7jRCHDQOlmw==; s=purelymail2; d=arkamondal.net; v=1; bh=3t+MtCAfVpQXcSeX3z4rRQhTgH7K8MTTiQmLOB6AIr0=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=ebg3Jy21Bv6VcVhMPBGezUXwjqH/A5R7k5ZPHYvQ4bnna7xziRrd25YInMVlQxJf6G3hUmljI91AePve8VIte50w/hIVo5V2U1mFJrq9FJ63Qc764SidF27eOeWgA3I2Q/3KtqnDheu0fCRVN1gIhK8Q6FcvUb6dL6xdLz6aotrRtNMRjOEHNnVDBDUC1YaOMaOSVCmyXSjOH/3P7S+brQcTQqK8NeI5evtFcvwo23tueEwUOq2mPMveJ7dBtNe8GhH2M/XjyQIk+K+XzFziZYyHoX1q9MuTg2OD7A0tVEJn2oEKmSNje3AfTjFaBoQRyCg+u0Ri+1YHAsmPmNv7Bg==; s=purelymail2; d=purelymail.com; v=1; bh=3t+MtCAfVpQXcSeX3z4rRQhTgH7K8MTTiQmLOB6AIr0=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1246644:48769:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -91630660;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 01 Sep 2026 06:58:50 +0000 (UTC)
From: Arka Mondal <arka@arkamondal.net>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
	Daniel Drake <dsd@gentoo.org>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	arkamondalofficial@gmail.com,
	Arka Mondal <arka@arkamondal.net>
Subject: [PATCH 1/3] usb-storage: alauda: do not do DMA from the stack
Date: Tue,  1 Sep 2026 15:58:29 +0900
Message-ID: <20260901065831.43567-2-arka@arkamondal.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901065831.43567-1-arka@arkamondal.net>
References: <20260901065831.43567-1-arka@arkamondal.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

alauda_check_status2(), alauda_get_redu_data(), alauda_erase_block(),
alauda_read_block_raw() and alauda_write_block() build their commands in
stack arrays and pass them to usb_stor_bulk_transfer_buf().
alauda_check_status2() and alauda_erase_block() also read the reply back
into a stack array.

usb_stor_msg_common() sets URB_NO_TRANSFER_DMA_MAP only when the buffer
is us->iobuf. Every other buffer reaches usb_hcd_map_urb_for_dma(),
which has warned and returned -EAGAIN for a buffer on the stack since
commit 4568136620c6 ("usb: core: Check URB setup_packet and
transfer_buffer sanity"). On a host controller that uses DMA, all of
these commands fail.

Use us->iobuf, as alauda_reset_media() in this driver and the other
usb-storage subdrivers already do. The command is sent before the reply
is read, so both can use it; sddr09_read_status() does the same.

Fixes: e80b0fade09e ("[PATCH] USB Storage: add alauda support")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217862
Signed-off-by: Arka Mondal <arka@arkamondal.net>
---
 drivers/usb/storage/alauda.c | 70 ++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
index 691fe47009cf..878c404106c5 100644
--- a/drivers/usb/storage/alauda.c
+++ b/drivers/usb/storage/alauda.c
@@ -500,11 +500,14 @@ static int alauda_check_media(struct us_data *us)
 static int alauda_check_status2(struct us_data *us)
 {
 =09int rc;
-=09unsigned char command[] =3D {
-=09=09ALAUDA_BULK_CMD, ALAUDA_BULK_GET_STATUS2,
-=09=090, 0, 0, 0, 3, 0, MEDIA_PORT(us)
-=09};
-=09unsigned char data[3];
+=09unsigned char *command =3D us->iobuf;
+=09unsigned char *data =3D us->iobuf;
+
+=09memset(command, 0, 9);
+=09command[0] =3D ALAUDA_BULK_CMD;
+=09command[1] =3D ALAUDA_BULK_GET_STATUS2;
+=09command[6] =3D 3;
+=09command[8] =3D MEDIA_PORT(us);
=20
 =09rc =3D usb_stor_bulk_transfer_buf(us, us->send_bulk_pipe,
 =09=09command, 9, NULL);
@@ -530,10 +533,15 @@ static int alauda_check_status2(struct us_data *us)
 static int alauda_get_redu_data(struct us_data *us, u16 pba, unsigned char=
 *data)
 {
 =09int rc;
-=09unsigned char command[] =3D {
-=09=09ALAUDA_BULK_CMD, ALAUDA_BULK_GET_REDU_DATA,
-=09=09PBA_HI(pba), PBA_ZONE(pba), 0, PBA_LO(pba), 0, 0, MEDIA_PORT(us)
-=09};
+=09unsigned char *command =3D us->iobuf;
+
+=09memset(command, 0, 9);
+=09command[0] =3D ALAUDA_BULK_CMD;
+=09command[1] =3D ALAUDA_BULK_GET_REDU_DATA;
+=09command[2] =3D PBA_HI(pba);
+=09command[3] =3D PBA_ZONE(pba);
+=09command[5] =3D PBA_LO(pba);
+=09command[8] =3D MEDIA_PORT(us);
=20
 =09rc =3D usb_stor_bulk_transfer_buf(us, us->send_bulk_pipe,
 =09=09command, 9, NULL);
@@ -702,14 +710,20 @@ static void alauda_ensure_map_for_zone(struct us_data=
 *us, unsigned int zone)
 static int alauda_erase_block(struct us_data *us, u16 pba)
 {
 =09int rc;
-=09unsigned char command[] =3D {
-=09=09ALAUDA_BULK_CMD, ALAUDA_BULK_ERASE_BLOCK, PBA_HI(pba),
-=09=09PBA_ZONE(pba), 0, PBA_LO(pba), 0x02, 0, MEDIA_PORT(us)
-=09};
-=09unsigned char buf[2];
+=09unsigned char *command =3D us->iobuf;
+=09unsigned char *buf =3D us->iobuf;
=20
 =09usb_stor_dbg(us, "Erasing PBA %d\n", pba);
=20
+=09memset(command, 0, 9);
+=09command[0] =3D ALAUDA_BULK_CMD;
+=09command[1] =3D ALAUDA_BULK_ERASE_BLOCK;
+=09command[2] =3D PBA_HI(pba);
+=09command[3] =3D PBA_ZONE(pba);
+=09command[5] =3D PBA_LO(pba);
+=09command[6] =3D 0x02;
+=09command[8] =3D MEDIA_PORT(us);
+
 =09rc =3D usb_stor_bulk_transfer_buf(us, us->send_bulk_pipe,
 =09=09command, 9, NULL);
 =09if (rc !=3D USB_STOR_XFER_GOOD)
@@ -732,13 +746,19 @@ static int alauda_read_block_raw(struct us_data *us, =
u16 pba,
 =09=09unsigned int page, unsigned int pages, unsigned char *data)
 {
 =09int rc;
-=09unsigned char command[] =3D {
-=09=09ALAUDA_BULK_CMD, ALAUDA_BULK_READ_BLOCK, PBA_HI(pba),
-=09=09PBA_ZONE(pba), 0, PBA_LO(pba) + page, pages, 0, MEDIA_PORT(us)
-=09};
+=09unsigned char *command =3D us->iobuf;
=20
 =09usb_stor_dbg(us, "pba %d page %d count %d\n", pba, page, pages);
=20
+=09memset(command, 0, 9);
+=09command[0] =3D ALAUDA_BULK_CMD;
+=09command[1] =3D ALAUDA_BULK_READ_BLOCK;
+=09command[2] =3D PBA_HI(pba);
+=09command[3] =3D PBA_ZONE(pba);
+=09command[5] =3D PBA_LO(pba) + page;
+=09command[6] =3D pages;
+=09command[8] =3D MEDIA_PORT(us);
+
 =09rc =3D usb_stor_bulk_transfer_buf(us, us->send_bulk_pipe,
 =09=09command, 9, NULL);
 =09if (rc !=3D USB_STOR_XFER_GOOD)
@@ -783,13 +803,19 @@ static int alauda_write_block(struct us_data *us, u16=
 pba, unsigned char *data)
 {
 =09int rc;
 =09struct alauda_info *info =3D (struct alauda_info *) us->extra;
-=09unsigned char command[] =3D {
-=09=09ALAUDA_BULK_CMD, ALAUDA_BULK_WRITE_BLOCK, PBA_HI(pba),
-=09=09PBA_ZONE(pba), 0, PBA_LO(pba), 32, 0, MEDIA_PORT(us)
-=09};
+=09unsigned char *command =3D us->iobuf;
=20
 =09usb_stor_dbg(us, "pba %d\n", pba);
=20
+=09memset(command, 0, 9);
+=09command[0] =3D ALAUDA_BULK_CMD;
+=09command[1] =3D ALAUDA_BULK_WRITE_BLOCK;
+=09command[2] =3D PBA_HI(pba);
+=09command[3] =3D PBA_ZONE(pba);
+=09command[5] =3D PBA_LO(pba);
+=09command[6] =3D 32;
+=09command[8] =3D MEDIA_PORT(us);
+
 =09rc =3D usb_stor_bulk_transfer_buf(us, us->send_bulk_pipe,
 =09=09command, 9, NULL);
 =09if (rc !=3D USB_STOR_XFER_GOOD)
--=20
2.55.0

