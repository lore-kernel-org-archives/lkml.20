Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C563FA5E9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850969; cv=none; b=GU9XKVmYIEQRJ9K/RW1C1UMmvyXdlahOCvSal+q+7Qs/mERxC42BRUY7OkNwZcm3Se2KKnyBsniojxa9L1+4RH//C30T6CdB5cVvc6SrlQ9X4Ppy/HpoPJ9ltpilFFgNaC/EUk+KQKyjh1TWf+IhGSQv0DLYVZL9kK+cwbkg/gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850969; c=relaxed/simple;
	bh=HhCxkhHC80M83iFDtddgusy89CkLNEEIkWSg3w+KLHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pluun/50nIUO6VULFErTrudIF+DDZw1WXLKdYek5BagGImfcIC520aTg50h13s6yDl9ASTERa4K5RA7Z0TKPcdbdIuAI/7l4IQaDukaqF1rhstU4+SzzqOJbnBKzq6TNKPWwBunhqt2GAqtqKHi7SCRh4wtLnaEPSXgmiCq2d04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jiihi2mc; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jiihi2mc"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso2536405a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790850965; x=1791455765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYIBt1hk8tdANPvKjF+MKq4E4FKuwQRW+z3jTE+Vt3E=;
        b=Jiihi2mceTR9jsExdS5YvR60BvW/6LTjPaSCWPyeJkoVqqiI1h/JsnOjrpBIkRA2ML
         QHWSmIH6hmc38yIcSGhIXwFcRqmnZWduD7YxPe1uGcyJh+4p9xeFErj04mP+/zoONNGL
         4ZjLgvgUgu09H/YRlq/eZDljnLBeEDiNw1QwfPnLgUHpWeeUCrGAcMyzHDXcTMAzpTuL
         mRIE//6+DRO4ZiUvf6k+hIk4EIDCDdD3I2fQRFdx+yV1QRQAWtBzm+dwGG0TlnTPHP/H
         jQ36vlohfuCflETrlgTM/fw4/bYO2pRJchn4TdY3eWOIGfi/Sam4q6iQuu0b6eV831HQ
         0lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850965; x=1791455765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYIBt1hk8tdANPvKjF+MKq4E4FKuwQRW+z3jTE+Vt3E=;
        b=rAKGbXqxAnfbHbun1juHEIHoNMNLN5CscAnuGQpW2XSxRc41UCQzCF3G2UKcoh6rFc
         kuGCesjTYTBCoQuDdLvUia5LwSIeLohtK73EIwq6/uNy7OnoWIKkaWnb8YCyYM0bnjCD
         TyKUC8ARmtsM0Zt9gsEK3jY2D68OjtcCcA/AqOlll/GTKmR/rwYb6Q/i89wV1WsYK0Dv
         yrxveEg+ad/N7GLvzHY+r7jDiI3NpjHKWjcSGTwIxm9UV8avCNekWIr6vx0TzxTlGQpk
         LWnwZ0lTLdcll6bZRPU4+NaDUEyYfB1yhc9wYtDTyDMe+6HgfVjZy67GBa/vaBugIIgG
         HBYg==
X-Forwarded-Encrypted: i=1; AKwUvBxRc6aowy+jfwcPJHNZVv+S2nrHep3p5Oy/qRQ+EBNcmMMukUCIUVCDzCeGtuW+cXIZE+XR7q7/od/9CZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2k87rhd7nAh60DTNPT5rLknY9BN80pTU2n2DEIvAWLwKqlysY
	luAaeLj98bnmJrwO+DtV2t7Krrts96V9Qco8YcknRGtDc3x9V9y8V6n964FBQT2i2gA=
X-Gm-Gg: AYBFou1f8qjTA6uZcgVgBZ+gNDumdXj9KdctvjDq5+KlG0eyLqoPxUbL6tV1l+bLHSG
	cpKziH5Ppt3i5lQXzLyW8rm50Zym64HC6yTEA4C45C7QsH5ryj8D5enuQ0wtLe2eSs0Bdd1EZnB
	fIrC/6b26ZpRnQ0G5zc7Yr5pHjsRBXkDLxPe3c+cKRyjCg+qX8IGKHqOlcMQQ7NuTupvl7L3W3U
	w9LJV2JTy6Hia8yvhIS275ALdSErKLBqOjXS0aDZZ9b+qfppB6dpkDUqRwcpQcFwzWOrNgO9oSj
	J7S38czRBFjpNcb0hn1H6RmXXISC/Vr8pumHDo7zRASVpc96VbneLrjODG15JwIxrIbqgQW8lxT
	1A4sLlo6xPMb4mfNoKGHKfoIqXrjeBNkrhNPYPIPekXzvg7ZzMQxDzCKZusG30L5tpoOTc1xsvA
	dsco4F86LsJFYtkJ11hLw2EegyzqQkif4BqjfSY7rX9prGu+xvGpIBWAmmedfNIyvJtgq5Rhk=
X-Received: by 2002:a17:90b:2803:b0:3a0:c621:74a with SMTP id 98e67ed59e1d1-3a4d1aff7f9mr3329053a91.35.1790850964653;
        Thu, 01 Oct 2026 03:36:04 -0700 (PDT)
Received: from ssakura ([133.86.250.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bc6sm3882215a91.6.2026.10.01.03.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:36:04 -0700 (PDT)
From: Sentaro Sakura <s.sakura11500920@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Antti Palosaari <crope@iki.fi>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com,
	Sentaro Sakura <s.sakura11500920@gmail.com>
Subject: [PATCH] media: dvb-usb-v2: initialize active_fe before registering the demux
Date: Thu,  1 Oct 2026 19:35:41 +0900
Message-ID: <20261001103541.177073-1-s.sakura11500920@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_usbv2_adapter_init() registers the DVB adapter and demux in
dvb_usbv2_adapter_dvb_init() before dvb_usbv2_adapter_frontend_init()
sets adap->active_fe to -1. Until then active_fe is still 0 from the
zeroed allocation, while adap->fe[] is still empty.

If userspace starts a demux feed in this window, dvb_usb_start_feed()
passes the active_fe == -1 check and calls streaming_ctrl() with
adap->fe[0] == NULL, which crashes in mxl111sf_ep4_streaming_ctrl():

  KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
  RIP: 0010:mxl111sf_ep4_streaming_ctrl+0x2c/0x1a0
  Call Trace:
   dvb_usb_start_feed+0x57a/0xc70
   dmx_ts_feed_start_filtering+0x129/0x220
   dvb_dmxdev_filter_start+0x434/0x10d0
   dvb_demux_do_ioctl+0x48b/0x540

Before commit e48b2a68617c ("[media] dvb_usb_v2: frontend switching
changes"), start_feed() also rejected feeds when active_fe >=
num_frontends_initialized, which covered this window. That check was
replaced by a plain "active_fe < 0" test, while the -1 initialization
stayed in frontend_init().

Initialize active_fe to -1 when the adapter is set up, before the demux
is registered, so that start_feed() rejects feeds until a frontend is
actually initialized.

Fixes: e48b2a68617c ("[media] dvb_usb_v2: frontend switching changes")
Reported-by: syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3df044e20e6ff1fb3cf5
Signed-off-by: Sentaro Sakura <s.sakura11500920@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..b77406a649ec 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -760,6 +760,7 @@ static int dvb_usbv2_adapter_init(struct dvb_usb_device *d)
 		adap = &d->adapter[i];
 		adap->id = i;
 		adap->props = &d->props->adapter[i];
+		adap->active_fe = -1;
 
 		/* speed - when running at FULL speed we need a HW PID filter */
 		if (d->udev->speed == USB_SPEED_FULL &&
-- 
2.53.0

