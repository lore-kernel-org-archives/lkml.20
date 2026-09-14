Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ACE3D566E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383520; cv=none; b=GCUdx4FWq3YixRye/3KPuYaxxlGwYaJEXDiN+/PVv3v0G7tvrowm/3czKz+5BhZMfSiAuZRJYhUr9fMtrCRnRKVSxGl8wVHjYENLPMpYBV5X0goWLqyiwdE0N14AYOzRjIuWB5yrlAe46a97YuZHzCoZTDYhodV4CdSNqC0uIJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383520; c=relaxed/simple;
	bh=tYs2cxRyTGdf410bulete8ziZ49L87S2sxxJrI5w/0A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=XYuVz0WW9lQc+c9KmFdTpY7MqvpbOjlAM3dNquLu8R35m5WJOhnFv5u4RSyk342zAAoyvyaJhzZ3gJuixrxEH/ZQSLISb3TGhLylWmXZmyRc9CjrAgjAVsa8KuvQZ+eJs+aOgvlu5aP1cSMsyIXpfOz793KtwDNu5iJdShDtxF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sne.moe; spf=none smtp.mailfrom=sne.moe; dkim=pass (2048-bit key) header.d=sne.moe header.i=@sne.moe header.b=cwiEbDwE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sne.moe
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sne.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sne.moe header.i=@sne.moe header.b="cwiEbDwE"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d82eso2943025ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sne.moe; s=google; t=1789383516; x=1789988316; darn=vger.kernel.org;
        h=content-type:cc:to:message-id:mime-version:subject:date:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/AypDIHXXi5CXKyq5GMLOTs6AUWRfjuea5A7khngbU=;
        b=cwiEbDwEGt5RKJjEal0rtGAk71kZow6MDcKbiPPOXGlnaGKVH23AWHh0K5D3yFwugq
         qDOzC8q0Et2gLhhEI+RIcTQLmgDdyzQMDAseAxI15ksTV1r4WpHfHQ1+ps1+T+5bkOym
         ibM5V0Qp5W9QLFsLQHrsdlisVRCAflN4bqkkhLUsVSZxnSxrs9WpKKgzlwZk0zw74Hh6
         U0cS7RSz+7ySDAOBy1SkYnwYAHTPE8t/NGCQBSBdHy7msYWoNdzJrAYZyiAEaHpYOqUL
         IF/YlvAKJp/uQsBOPIl/QL0goP3pOfeYuncdJIz3kwfTz1juDrbmaoaX124xXJ0Glryz
         cwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383516; x=1789988316;
        h=content-type:cc:to:message-id:mime-version:subject:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w/AypDIHXXi5CXKyq5GMLOTs6AUWRfjuea5A7khngbU=;
        b=f3a/YiWRPdmyMh3+q59disKaBKguSvxTDZwDtAm50FYyikzdGOohUOD34F+uZQYi93
         4O2diBHpJU2BTqOe7q15IWN2L5qj8YgJQVxq32dnnqrmry56ZuXeS+4tqVaGwt1r0UTZ
         dyFbPZx/rrKHVFG5WZLiSEQ4YbgG77hi5tGyhtim9u09efgaCsXC48mZyqOzUyXXPTYQ
         5x1aCnZSx60rZKMKhEyRyUQvCNhRlrbPpoExW8WTMpFWYcnzV4I4eF9StCbWlaxSWSKH
         GNOejaqWj63V6W/zZz6uw/w/ew2BNFNm+lcfoaLWKOr/b+fDmzjdRD7o4gEJrOJdVvnk
         0amQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkj2WL8PGxtSECkuoQ5GPkmQdz4vsEP+FQXxqhhjKhOHZAHYr6eS0HI1w8Ro3AxhCrmyRiUmhKqRjY6ic=@vger.kernel.org
X-Gm-Message-State: AFuF++myfwkJvrNtB5Tw5NP3tz66HTXnxCpxus6sgNhHEMYrYtf0VBJ5
	FzWNU8kV8/lBbLoHA1VIcH9t2i3jPAgHpdyvZZo9x7TPYhfeR4q3XGeUA2C/YafwssP0vGVu5gy
	pL3sAP/KnKL5IjsuzPUo3Ac4NxQEbEHw4Hxdqpt83oFnitxoVc88b0S7aOTqlpw==
X-Gm-Gg: AYBFou00DD7FUr/1XBTHN1J0WB3rfci++tQ01IeoUiaX9CSMofhVyUybLZ4O0fLg65M
	H9vNH5HO4xsm3Ch9bGQynswRjKQCM+OjdYRD9UTfgAZqJCT61A2ylEYEaZX4oCq6Opcm0FwamIJ
	NdrHerC8l0Bzn+Cqty+uukqmLaL5AUqYlJ6b0GpzHvpNd/xfm5TOnf6Ry8HtmdN6MyDXIIwecR2
	teASQyDas7GVjHdSTTvbD5+i/p4V3QOFWu9UdFhx3OFrcyLSpTONPldOdWqmGh58qkOu/r44Hgn
	i0+a/HB3GkO19jnQhyfVydUrOAGX7yteRrW8lPaxe6UZOaOwYt5h866M4PIaifU9XMKaMqfxyHh
	w1vjBnZvhMM3grzHlAf0CGFFkLbuggp/4Bs41NQyHlS+tiCbLyNu6mpSk9W3zv6NqpUzTgKgIik
	nIWhjlq7yQYJTGTiO9EiykSQA/a3w1zb13QOsI+Es2a7n4X2U+ybv6IA850IwpEpU=
X-Received: by 2002:a17:903:240c:b0:2d8:f4d4:7044 with SMTP id d9443c01a7336-2dd6c7ca8a6mr27428635ad.3.1789383516506;
        Mon, 14 Sep 2026 03:58:36 -0700 (PDT)
Received: from [127.0.0.2] ([2403:18c0:1001:3a:74ea:baff:fe97:d2e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652aa8dsm4687280a12.7.2026.09.14.03.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:58:35 -0700 (PDT)
From: Asai Neko <sugar@sne.moe>
Date: Mon, 14 Sep 2026 18:58:29 +0800
Subject: [PATCH] ALSA: usb-audio: skip the broken mute control on AVerMedia
 GC553Pro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260914-avermedia-gc553pro-alsa-v1-1-4c694e8b0cd5@sne.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0ygGDgKsZF6RSs4S+tEhPC3
 R11+S3e28HFVBzabAeTTV2XOSE/ZcB3mgdBjclQhKIOTX5G2sQmiUo4cFWVqy1IoxMyS9kHqmN
 3CZDq1aTX9+98vf3tr+4h/Pzu4Dg+5kyF4nsAAAA=
X-Change-ID: 20260914-avermedia-gc553pro-alsa-cce3f0a6db70
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Asai Neko <sugar@sne.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=sugar@sne.moe;
 h=from:subject:message-id; bh=KKQ65lm5gd4TGamF3O9BljYBBsGT+aIMb7Ndkequqlk=;
 b=owJ4nJvAy8zAJfZHZ3FlRAEbJ+NptSSGrOWXI7+8vyx82i/8ltrtSouc2Q+erSu/4/725jejm
 An1s7vunPrXUcrCIMbFICumyNJ5pKvwyet5Hw646PLBzGFlAhnCwMUpABMR28XIMG+7SpPmw2TZ
 o+tLZU+Ebjl02up5g0GymfiuE1ax8499fcfwz2D6piUHGzsd1m88NonzxAl9j9zHhh2803h29ik
 45NzbwwAAMNtOUg==
X-Developer-Key: i=sugar@sne.moe; a=openpgp;
 fpr=89C48A71E4EB9EF0C0442D0EFC2CA37958700609
Content-Type: text/plain; charset="UTF-8"

Skip the nonfunctional master mute control on the AVerMedia Live Gamer
ULTRA S GC553Pro (07ca:1553).

USB tracing shows that GET_CUR returns zero bytes instead of the required
one-byte value, both through usbfs and during ALSA initialization.
SET_CUR succeeds, but switching capture off does not mute HDMI audio.

Before the change, the driver exposed a misleading PCM Capture Switch
and logged: 3:2: failed to get current value for ch 0 (-22)

With the patch applied, the switch and warning are absent. A ten-second
sound recording through PipeWire confirmed that stereo 48 kHz, 16-bit
capture still works.

Tested on NixOS with the patched 7.3.0-rc3 kernel. The USB audio driver
object builds with Clang and W=1; sparse and strict checkpatch pass.

Signed-off-by: Asai Neko <sugar@sne.moe>
---
Skip the broken mute control on the AVerMedia Live Gamer ULTRA S GC553Pro.
Testing details and the rationale are included in the patch commit message.
---
 sound/usb/mixer_maps.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 69093c666282..41454cb403d0 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -531,6 +531,15 @@ static const struct usbmix_name_map audient_id24_map[] = {
 	{}
 };
 
+/*
+ * The GC553Pro returns no data for GET_CUR on its advertised mute control.
+ * SET_CUR succeeds but does not mute capture, so skip the control entirely.
+ */
+static const struct usbmix_name_map avermedia_gc553pro_map[] = {
+	{ 3, NULL, UAC_FU_MUTE },
+	{}
+};
+
 /*
  * Control map entries
  */
@@ -577,6 +586,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x0763, 0x2031),
 		.selector_map = c400_selectors,
 	},
+	{
+		.id = USB_ID(0x07ca, 0x1553),
+		.map = avermedia_gc553pro_map,
+	},
 	{
 		.id = USB_ID(0x08bb, 0x2702),
 		.map = linex_map,

---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
change-id: 20260914-avermedia-gc553pro-alsa-cce3f0a6db70

Best regards,
--  
Asai Neko <sugar@sne.moe>


-- 
Asai Neko


