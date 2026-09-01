Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C036F419
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245948; cv=none; b=RccZPKqpUgPBJngl/qyD2GrkATT8XrBWbVop445yBQVXpC6tC7ctspxZUPo2mClDmDVcsOnr8tyOlp5y3kEUirCB13ffsWWJRAxj3sEKhQiNlJvacheo3t/9ALzVVJegZTi7oPiL0Do1z2LTK0n5uIOj5TXiPDlHt9Ki7sVxxdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245948; c=relaxed/simple;
	bh=auD0LBcyaasBTyONLGH17EGXcimgnRbD7L0mkVqBfhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jb3pp2pmGCbfvlYt0npvlS/K/YKX8aJ/KQg7ybDhMTucODj43kKYG4PQdXBw/0gUQB8sxpz6lNrPfJzh310CIIJUoAFTw3S12w745QbybbhRIgaJLgOyzH2nnOAkx1ILLsggJT56/i5dMLltQzH663vmQmsIRtXLgo+n93LEwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net; spf=pass smtp.mailfrom=arkamondal.net; dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b=HmsSuxY6; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Lthut8zt; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b="HmsSuxY6";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Lthut8zt"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=HmsSuxY6pJFa3Yu7S4e9ZtDrAo1lBEjP72Az/0FaFzpGxPX5q7o3/jnIseIYlJHwfIPx2X3nIaQvKnWO8ycrpaN0PNa1m5LwkY4vTivZz+Kij3qssxtZ8rY8i/kK6kqysIl9zvKG/VnZtxCXAnazI9fPb1eztW9LeoDS4EZgarafm3JJFrJxAhSfX533X5fmfIollBHU772jxMFvqx1Uav/UqVf+bLrRzFWPA2KZ0YZWtWbO3NbobwQEPa1AdGGNowsVrD34VKr+xDXKUs0Uati824DlcUdPKrMENn8x7dzdw7TrEGQX/XLw4gwz6JyCU4ZdE6JRK5+xMc2ciK/XOQ==; s=purelymail2; d=arkamondal.net; v=1; bh=auD0LBcyaasBTyONLGH17EGXcimgnRbD7L0mkVqBfhk=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=Lthut8zt00DIcSg2xGa1PPIa5fmmpzflHELXhKuxvuRqMy7BcQF4MpZbC6YX6ISwJZccLPbNe5ZONeu+9UCOitrZQR+7UgzTwbECznmcs7YEZziEqYlj0DkyVi9v3hv8iR3sY9Kcpa9DQIu/lDDgW2DMdYTrB2Tyf2vuZmlVSJaUTnZLakMLshuIeHaZ1ES6GhOkx4tH6BOidO0yBP0zWonAFk652ZCeaz5/h6AnkYWPTFBLMNBZeYq8eERgQWofpZDsgnGjp65JYAvThJUiAXJb3IZcpnvl6UpuI8D+dIegZfx+IVKoGbS8HeOnO5YEdx23qF90cK201J6NvKogWg==; s=purelymail2; d=purelymail.com; v=1; bh=auD0LBcyaasBTyONLGH17EGXcimgnRbD7L0mkVqBfhk=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1246644:48769:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -668540338;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 01 Sep 2026 06:58:52 +0000 (UTC)
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
Subject: [PATCH 2/3] usb-storage: alauda: check the return value of alauda_read_map()
Date: Tue,  1 Sep 2026 15:58:30 +0900
Message-ID: <20260901065831.43567-3-arka@arkamondal.net>
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

alauda_ensure_map_for_zone() ignores the value alauda_read_map()
returns. On failure lba_to_pba[zone] and pba_to_lba[zone] are left NULL,
and both callers dereference them immediately:

  pba =3D MEDIA_INFO(us).lba_to_pba[zone][lba_offset];

alauda_read_map() returns USB_STOR_TRANSPORT_ERROR when either kcalloc()
fails or an alauda_get_redu_data() transfer fails, so one failed bulk
transfer is enough to reach the NULL dereference.

Return that value from alauda_ensure_map_for_zone() and check it in
alauda_read_data() and alauda_write_lba().

Fixes: e80b0fade09e ("[PATCH] USB Storage: add alauda support")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217862
Signed-off-by: Arka Mondal <arka@arkamondal.net>
---
 drivers/usb/storage/alauda.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
index 878c404106c5..d47ce01d519a 100644
--- a/drivers/usb/storage/alauda.c
+++ b/drivers/usb/storage/alauda.c
@@ -697,11 +697,13 @@ static int alauda_read_map(struct us_data *us, unsign=
ed int zone)
  * Checks to see whether we have already mapped a certain zone
  * If we haven't, the map is generated
  */
-static void alauda_ensure_map_for_zone(struct us_data *us, unsigned int zo=
ne)
+static int alauda_ensure_map_for_zone(struct us_data *us, unsigned int zon=
e)
 {
 =09if (MEDIA_INFO(us).lba_to_pba[zone] =3D=3D NULL
 =09=09|| MEDIA_INFO(us).pba_to_lba[zone] =3D=3D NULL)
-=09=09alauda_read_map(us, zone);
+=09=09return alauda_read_map(us, zone);
+
+=09return 0;
 }
=20
 /*
@@ -849,7 +851,9 @@ static int alauda_write_lba(struct us_data *us, u16 lba=
,
 =09unsigned int new_pba_offset;
 =09unsigned int zone =3D lba / uzonesize;
=20
-=09alauda_ensure_map_for_zone(us, zone);
+=09result =3D alauda_ensure_map_for_zone(us, zone);
+=09if (result !=3D USB_STOR_TRANSPORT_GOOD)
+=09=09return result;
=20
 =09pba =3D MEDIA_INFO(us).lba_to_pba[zone][lba_offset];
 =09if (pba =3D=3D 1) {
@@ -980,7 +984,10 @@ static int alauda_read_data(struct us_data *us, unsign=
ed long address,
 =09=09unsigned int lba_offset =3D lba - (zone * uzonesize);
 =09=09unsigned int pages;
 =09=09u16 pba;
-=09=09alauda_ensure_map_for_zone(us, zone);
+
+=09=09result =3D alauda_ensure_map_for_zone(us, zone);
+=09=09if (result !=3D USB_STOR_TRANSPORT_GOOD)
+=09=09=09break;
=20
 =09=09/* Not overflowing capacity? */
 =09=09if (lba >=3D max_lba) {
--=20
2.55.0

