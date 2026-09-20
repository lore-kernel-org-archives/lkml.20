Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710253DDDAF
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888513; cv=none; b=UTGuDVJAd+z8ysvI80bnokqcXusJVMTTpbf2G7M88SU2bgFZme0xjMutMeGrvncyvrlSb9KWmPyktlAFJG6woPfKwv2yvorftaMJB4wEDlbgYEhCEHHjSMJv5VGuygITCtf73Auxq2rhKBjLA0yULd5gPQ3Q3z49I3dDQVQYqg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888513; c=relaxed/simple;
	bh=40rlKOgfgYV0dDT+vCxjxoB+YCsrHOW8CY9MyyoFfqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0DLkaEFGMwy8r8eu1Rtle7lKI/3uBb5X0DCeJ2PPohAJ6VyDky3YZJmxuWm8g8qKdl+/k8n6mgBMOvCZLaSuuIRcXYK/b0uuX+gWTDC3qf0KJ6+M+AwdrBNGvpalzOwQQo/LyOxdq+mpWxCfsqiKc3D1AuFNSNQOTbJzeWN4H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=qsw9Lxq0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eoUTapFh; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="qsw9Lxq0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eoUTapFh"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9AB6B1D0016A;
	Sun, 20 Sep 2026 03:15:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 20 Sep 2026 03:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789888510; x=
	1789974910; bh=7rwET8xn9DtwjdIjkAbpf+WcWyXALAWfahZ44Reyg8g=; b=q
	sw9Lxq0eWp7e24BzdDHfJ3Goue3dUb12QLrqlpDB2Nv1P4Bw4tOzbUdQtOe/0Jm2
	wNx9nzYMqJDRfvKH0WeXuA+TrJW6AkogPFRKIAuU/0t8sBveFo97WaXkPzq/WaDo
	cD+2QT0HGvC3Zd3rWlZOt6AI29OgIAKoLVWwqxSiEV4Nuevbt0x6rBDoM2sa7WRP
	952msPL5vNpRh6FRB+5LKdLT9RJ9dtI0ctkb73Z5/LWnntOKaVnFtGknsyPT3BD+
	oomTxtscwAoHT6NzIl7hjimQByxqEQacmxOnhk5gIHKV3gsjsNSGoGeqykndNa3W
	qpOtphSmijN+R+q9Bb5Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789888510; x=1789974910; bh=7
	rwET8xn9DtwjdIjkAbpf+WcWyXALAWfahZ44Reyg8g=; b=eoUTapFhKaeaZXCLX
	m7m2iND3RndZWlFbAztMHklcd59Sre699PrOcmMnumARc/uNUAFejGAFj5x6pzxX
	LwqmEMck3ZsMRDynyQLmIwhO0V+sDGTFGaWO1bHSjY27zVKWpQPoabrcMkO0lxgq
	OrTpa7OrVNya+bW2qZNt83jRzn1DTTa1kVEldYVKNeaCaMvV28Dz7hQVh7jypqqn
	+HRfvSKnZKEsnLWDXh74qwczrtjJkVWAg2IqkioY/eC7R6D23X7N5a4M1iJ1Vhgp
	Sdx4iROA+kcL4zPzrfYIoaPcdsyy+4az72P4CryR3sVOEQfv9Pbb483oelBwVnkz
	zfwhg==
X-ME-Sender: <xms:_oevapl3D453_pE0fYRat5DDVfYauAOaQn_3BOoIAXCdjgV-UiHDJg>
    <xme:_oevaiyr73i-Qo_YS16LQDfNvhw2RmhWlVrjYgxD7-slT5EnQclDrJ3c36RItuuon
    rdlnOdvd2c5v-Dd-I3q-ppfTYCXFXI99gy05QWCAKSxZLwEBhwaN2M>
X-ME-Received: <xmr:_oevanPnK7AJa3FJKbCzRI5a_U9tx7_ihQQqXXoJATnBD6uuA5n1G7T8l6mAPN_j3xQJi85xvKH0tHKHXlhXJ3elK5QU58ZUvkJSV-ebofv0Ng>
X-ME-Proxy-Cause: dmFkZTGyn/xqJvXtDE0aXPg7VTWwa6ZytMhAGR7nxGfLocNGHdWz0wX8vkRz8WdekLHOxF
    ueygXEtIzUz+6+8Nu5jOylzMouJEEmUtyHAiF3hAv/PQOii+fQIaA16F9rGbK5eIj+gHX2
    7oWQRylPS9prm6P0pulDgCxjr7FHQNIloAyG1sC2/WA+6SlZoZfvrwyAbbTgLETU6XAsrH
    oSG/gVQ4B96IyAbe0lc8e/7OyBZYZjJJI2xl3NT5AIvarGgLVxYLAZiD4NlCbAozg+Dur+
    szvikqwlwyyPnE8AnV3AbHNmxlz1ORsNjtHjAvxgWdsXLx1vkCYM0HOOrP6u1ZYIqTWEjA
    L/JwAairObteiKSqg55yM37AQyrdYrGBXsW6cJGL+94XKVPxOsqFupNa3IwvPlMfRpsDE5
    4RTRESl+eq/k8O4NWPG2o7rU9JSsOEuUoUN/wUGBz0dCoC1q+0jkZLrO5BXLS+cO1HBEQF
    4LSrA5BOuHs4pfPkBw7SL0REkgj4h+FOcUTlh1cQF0G4pYysFT7VyTdQ27uXuBe+f4ukKb
    QnQdQjVEFJfilDUU2C4sj2nLZPYaPrhLZIlOamSuzRgWGipvHykbs9h7B7R9a+cCnUqsv/
    8IM1OVT4kUN01fakDXdXcHjVxipvEGCRgQTXYFYinTcofIKuI5Zoh6QjRPKg
X-ME-Proxy: <xmx:_oevamTJPioHA8E6SBc3rtS3jzDW-of9UssZm2LEwzTuh25h2h0rYQ>
    <xmx:_oevalZKcKHXldZn91YC8oyWjGDP_Wq-WeqXD7hQjjAaGlGLB9u-5g>
    <xmx:_oevaj3ismyeufxbFQlWYBYRcK8PgQmoTMxTQpg9CixJHvFU623OFQ>
    <xmx:_oevalUqJ6pLGhUgE8SOJB0eQTAlzaopJLw8z7BEy2tQkuikMcHFzQ>
    <xmx:_oevar5RNloyZWhSb93rV0qGYATXPqQkNc3bkkY4n754HKc_eDSyiYKw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 03:15:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] firewire: cdev: refactor copy_to_user() in get_info ioctl call
Date: Sun, 20 Sep 2026 16:14:59 +0900
Message-ID: <20260920071501.77785-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920071501.77785-1-o-takashi@sakamocchi.jp>
References: <20260920071501.77785-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A non-zero return value from copy_to_user() is handled by returning
-EFAULT. Using scoped_guard() simplifies this handling, since it
eliminates the need for a local variable to store the return value and
check it after the locking primitive is released.

Refactor the code to remove the local variable.
---
 drivers/firewire/core-cdev.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index bdc16207d743..25590580b993 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -491,7 +491,6 @@ union ioctl_arg {
 static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_get_info *a = &arg->get_info;
-	unsigned long ret = 0;
 
 	client->version = a->version;
 	a->version = FW_CDEV_KERNEL_VERSION;
@@ -499,12 +498,10 @@ static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 
 	scoped_guard(rwsem_read, &fw_device_rwsem) {
 		if (a->rom != 0) {
-			size_t want = a->rom_length;
-			size_t have = client->device->config_rom_length * 4;
+			size_t length = min_t(size_t, a->rom_length,
+					      client->device->config_rom_length * 4);
 
-			ret = copy_to_user(u64_to_uptr(a->rom), client->device->config_rom,
-					   min(want, have));
-			if (ret != 0)
+			if (copy_to_user(u64_to_uptr(a->rom), client->device->config_rom, length))
 				return -EFAULT;
 		}
 		a->rom_length = client->device->config_rom_length * 4;
@@ -520,13 +517,15 @@ static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 			fill_bus_reset_event(&bus_reset, client);
 
 			/* unaligned size of bus_reset is 36 bytes */
-			ret = copy_to_user(u64_to_uptr(a->bus_reset), &bus_reset, 36);
+			if (copy_to_user(u64_to_uptr(a->bus_reset), &bus_reset, 36))
+				return -EFAULT;
 		}
-		if (ret == 0 && list_empty(&client->link))
+
+		if (list_empty(&client->link))
 			list_add_tail(&client->link, &client->device->client_list);
 	}
 
-	return ret ? -EFAULT : 0;
+	return 0;
 }
 
 static int add_client_resource(struct client *client, struct client_resource *resource,
-- 
2.53.0

