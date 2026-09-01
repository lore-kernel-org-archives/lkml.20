Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0157F399372
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245946; cv=none; b=g3PriHrnAYH6hQnpySmLWnEnTlryVCrqwGMJaq8lqxyQaTbX5qcEeYAiIT4UC8LNYsBzjZ0hUf5JghvazhOBEVZdneV7CzhG/hzFBxMdwur3bA4jwx6sHrb5ROjZyf39H/IvXetnW0RlWLw7QSjCPzk18ytMOKMw6QGOTyh2l4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245946; c=relaxed/simple;
	bh=eEVjBTDGcUqOSoW7qxv3YzMVl7VsyN7YGKisMqsnOuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kL1XxjQ49aif4sSkMul3w7bFswMIzOCogVgBunK86Qd6mOdpB/0pifqQ19/JZu0A9ALtbQbtfyhgHqhEurHxQPD69+E8D06ybN4lfhkJimPqQlM8NDenTKCELQukj167IjwQaFuJPW6D3XMCwrPCum9uaT2HC1u8NW3EZRyYvBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net; spf=pass smtp.mailfrom=arkamondal.net; dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b=UUo3ffy2; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=dWNwo0HM; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b="UUo3ffy2";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="dWNwo0HM"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=UUo3ffy2Gjq70HVHshDzrrS3mpjTm1siq+Bu8caeukLvRxwBigR3TmLXhzFsXPWgScHEFcxb7KRVqwOGQtUndxYUg6PVdIVDi7r25jHCnuK13kUc37BnMVWr/T0FhCMLgpGSl4P8p8hbXfm1RsGy1bh4NurWcfmiWoaabQHqgrsTJ2/d9PuVmIxrb/CSQZjbCeAvBN/9VAot6pqX2Mm/Lwg5rXbmaWjfx3oTQ8hqlyH3mpg8XPYU4e/XhhnAloz8tjlHktZOd/gxgYJe30KhdWQymcOU1Ccv6/zTWO7oJNowO51gFBIDhGb7/Y93nMX3bBc5x8et/xJ03ANdr9zsGw==; s=purelymail2; d=arkamondal.net; v=1; bh=eEVjBTDGcUqOSoW7qxv3YzMVl7VsyN7YGKisMqsnOuc=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=dWNwo0HM8zapEvDDZMrR5G+235gSTOXxqYwjOf/8zN//6DoOwkg4X1lSrkCLv3y+Afia3UG01IdD/GEGh0Hrj3SVEUgqRgmft/ypilH+9irHcMwm+V6TUE0QOymJfsOqoNBEJIuP3Z1ITXP4fg1ZJDCQ675U8u7iqdHtYD/eImG0ZxxYOTMLFJQXZ7sZbpWjd8e01jLaxzBvKr84cajVDzu+KttHaB1zU0/V7P3ZQP7FT6VHfaRzFQaCKGJmjh7PfSI52pBp/cUswv/Bwn1jrMCrczoUqEE5E6DTcbMe6cF1qa7S6O+om4maLoeHvHsMXozIWjobNjHuryns7fuPqA==; s=purelymail2; d=purelymail.com; v=1; bh=eEVjBTDGcUqOSoW7qxv3YzMVl7VsyN7YGKisMqsnOuc=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1246644:48769:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1191725007;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 01 Sep 2026 06:58:55 +0000 (UTC)
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
Subject: [PATCH 3/3] usb-storage: alauda: fix out-of-bounds zone index
Date: Tue,  1 Sep 2026 15:58:31 +0900
Message-ID: <20260901065831.43567-4-arka@arkamondal.net>
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

MEDIA_INFO(us).lba_to_pba and .pba_to_lba are arrays of num_zones
pointers, allocated by kcalloc() in alauda_init_media().
alauda_ensure_map_for_zone() reads lba_to_pba[zone] and
pba_to_lba[zone], and when either is NULL alauda_read_map() writes a
pointer back to both. Two separate errors let zone reach num_zones, one
element past the end.

max_lba is capacity >> (blockshift + pageshift), which counts physical
blocks, but zone is lba / uzonesize and uzonesize is 125/128 of
zonesize. On a 16 MB card (alauda_card_ids id 0x73) num_zones is 1 and
uzonesize is 1000, so lba 1000 to 1023 pass the bounds check and index
element 1 of a one-element array.

alauda_read_data() also calls alauda_ensure_map_for_zone() before it
compares lba against max_lba, so any larger lba is used as an index
before the check rejects it. alauda_write_data() already checks first.

Bound lba by num_zones * uzonesize on both paths and move the read
side's call below the check. alauda_transport() reports
num_zones * uzonesize * blocksize for READ_CAPACITY, so the new bound is
exactly the range the device advertises and no block becomes
unreachable.

sd never issues an lba past the reported capacity; an SG_IO READ_10 can.

Fixes: e80b0fade09e ("[PATCH] USB Storage: add alauda support")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Arka Mondal <arka@arkamondal.net>
---
 drivers/usb/storage/alauda.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
index d47ce01d519a..5e7f99ba8ac0 100644
--- a/drivers/usb/storage/alauda.c
+++ b/drivers/usb/storage/alauda.c
@@ -949,6 +949,7 @@ static int alauda_read_data(struct us_data *us, unsigne=
d long address,
 =09unsigned char *buffer;
 =09u16 lba, max_lba;
 =09unsigned int page, len, offset;
+=09unsigned int num_zones;
 =09unsigned int blockshift =3D MEDIA_INFO(us).blockshift;
 =09unsigned int pageshift =3D MEDIA_INFO(us).pageshift;
 =09unsigned int blocksize =3D MEDIA_INFO(us).blocksize;
@@ -973,7 +974,9 @@ static int alauda_read_data(struct us_data *us, unsigne=
d long address,
 =09/* Figure out the initial LBA and page */
 =09lba =3D address >> blockshift;
 =09page =3D (address & MEDIA_INFO(us).blockmask);
-=09max_lba =3D MEDIA_INFO(us).capacity >> (blockshift + pageshift);
+=09num_zones =3D MEDIA_INFO(us).capacity >> (MEDIA_INFO(us).zoneshift
+=09=09+ blockshift + pageshift);
+=09max_lba =3D num_zones * uzonesize;
=20
 =09result =3D USB_STOR_TRANSPORT_GOOD;
 =09offset =3D 0;
@@ -985,10 +988,6 @@ static int alauda_read_data(struct us_data *us, unsign=
ed long address,
 =09=09unsigned int pages;
 =09=09u16 pba;
=20
-=09=09result =3D alauda_ensure_map_for_zone(us, zone);
-=09=09if (result !=3D USB_STOR_TRANSPORT_GOOD)
-=09=09=09break;
-
 =09=09/* Not overflowing capacity? */
 =09=09if (lba >=3D max_lba) {
 =09=09=09usb_stor_dbg(us, "Error: Requested lba %u exceeds maximum %u\n",
@@ -997,6 +996,10 @@ static int alauda_read_data(struct us_data *us, unsign=
ed long address,
 =09=09=09break;
 =09=09}
=20
+=09=09result =3D alauda_ensure_map_for_zone(us, zone);
+=09=09if (result !=3D USB_STOR_TRANSPORT_GOOD)
+=09=09=09break;
+
 =09=09/* Find number of pages we can read in this block */
 =09=09pages =3D min(sectors, blocksize - page);
 =09=09len =3D pages << pageshift;
@@ -1052,6 +1055,7 @@ static int alauda_write_data(struct us_data *us, unsi=
gned long address,
 =09unsigned int pagesize =3D MEDIA_INFO(us).pagesize;
 =09struct scatterlist *sg;
 =09u16 lba, max_lba;
+=09unsigned int num_zones;
 =09int result;
=20
 =09/*
@@ -1078,7 +1082,9 @@ static int alauda_write_data(struct us_data *us, unsi=
gned long address,
 =09/* Figure out the initial LBA and page */
 =09lba =3D address >> blockshift;
 =09page =3D (address & MEDIA_INFO(us).blockmask);
-=09max_lba =3D MEDIA_INFO(us).capacity >> (pageshift + blockshift);
+=09num_zones =3D MEDIA_INFO(us).capacity >> (MEDIA_INFO(us).zoneshift
+=09=09+ blockshift + pageshift);
+=09max_lba =3D num_zones * MEDIA_INFO(us).uzonesize;
=20
 =09result =3D USB_STOR_TRANSPORT_GOOD;
 =09offset =3D 0;
--=20
2.55.0

