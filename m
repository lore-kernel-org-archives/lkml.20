Received: from mail-pj2-f17.google.com (mail-pj2-f17.google.com [74.125.227.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E83C9888
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929072; cv=none; b=Te3P8hO8cctVYLzKmIiXrlmbYpCT8IKXlxfE+tQM2oGc1h2HpaLN+dZAKruUtODy3ZuJmFP77FhW2M5AXW53bD2rd6NBT9jKK5p6sQK0j8Uh1cW5j0fF5U4RIUdySfGBqCibmnDXzrxcxg3qodyzcO6p1Cs6DZB2T+2ch0yTUig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929072; c=relaxed/simple;
	bh=HZQaFK2Zua2AWNp7kCv0PnK6xeLcfpKRjtXC5jqIVv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soKW/ZOlo2bNvt/olb3w+bq59PXerrdTMy6vFsIZPmcSQDHpGHmscJedDUgH3x4JapcsNWpixXLTG0r6Ic8dZ3W4lcY2GDvA8VTkKFczAiTKFdBOmGmUDWGLmaVvK5oWsafJEr46ruuZ412ZihSHutrwyWEJE50nFu2wnc0w+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKNVm6Bb; arc=none smtp.client-ip=74.125.227.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKNVm6Bb"
Received: by mail-pj2-f17.google.com with SMTP id d9443c01a7336-2db1ca06a25so15107355ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789929071; x=1790533871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tk72gKrfIRDNOeRHSLcFym2Jrz9jdSnywQNEhtH2BqI=;
        b=dKNVm6BbaU/pqfqLQKktHmDbeep4KEkmwLWw4pJtwTlfhR7uuKRkyMk907CwN/ERCb
         OJDeh6ggEPjzZ/adGranXYEeCoqu0cgnzUuclh97BwQ1M7j2O4RYL8mNHIb05mVs/7Cr
         d7ahTuWQOD8cHhp4o0xAzTsbBgLQcLHY7+Bb4PP06s6BruzyA8d53ziks9EPdbb5+WJb
         ChTskaMsxVxC7c54iZ5SjlpgA7tXPulaguDLUu8DCgnnklEV+GSU1ZvAhD3RTuWboA+I
         ZG3fcc88dto9J++NFrdG/G5pUWhg+SvUDY+sYBszAAprlgoJH73HIpJApwd88pQndGur
         6tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929071; x=1790533871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tk72gKrfIRDNOeRHSLcFym2Jrz9jdSnywQNEhtH2BqI=;
        b=rLWJJ2EQL2VCxb0GIoXA0O4uitr/fUcMUHj6RvRD9f3rcunOmt0LcpO0y9yRuUHjpL
         x3rw2tqKiiRjusMNO2tacTuTcCKvJBGlm82hMS/Shi4XjfiSn0DLZ562MPC/Re2uga2n
         3zlpk9BQe3ybAACTPPcbNpydE2lc85GeMs4So/GgxzAEWjMuel3oUD4FG5hv1nvrKXg/
         n11Fo5PGiCr+b8zxsuhDqHLoxLSRjiTihsSyK9KuhOctNc5mznDSGSF06D+UjszNU2U5
         /4/QNRZVoDg3KR92Ih9g88phIVgagdTwtV78szngQmpnrd+KYIrnVgA8M1/JGe7Tf0Yj
         Zmaw==
X-Forwarded-Encrypted: i=1; AKwUvBztWRMun1zNG/AvSVdqucgVdhr20hNYd72bm9fz75VYiOeu2UaqAmeKo6BxCFaaEp88SmrPqTUwmJ/YVYk=@vger.kernel.org
X-Gm-Message-State: AFuF++mUJJPoDyr676WHbIG1yW8XK9P+F/sffxry3CY/kR7sa1AeLnsN
	xPT/suu+7EQzTN1xn8X1BOoHGSH0Yq6bxptoTfBVh1ZCGAfNGAMUyV4C
X-Gm-Gg: AYBFou0w+lVyITgFK42/1zvOw9ZeCYq7WVD7wuKQ0zUcyCl68XfvDv97D+dBWgP3hrU
	uJn6BGFOk500ZqlJnR+K2RLQNkOiJxDDXbof14iALYCH45zxeT5R9dL25TI49//6wSMbb15RJqf
	f+k3thJQ0NdGQUmo6guP8qYjerZOneVfPQ5wjpvVbXl5pUBPeIxfrVTia8XtdfTiAL9Fqwb2OBQ
	4JHKqDDjbbPFTdhiTBl+5SeA8bNwhbKDMXby438i3qIxzNY31a7uqOLMUSGRQBVzfGAjn4v25eS
	3PF3bFP1NxIMvWUkCWS/PQJUdGwxVxS/2NvgnP93n/srhko1gFx7AFky26nwUiVXeD0exl5Jy7y
	n3rZP2aIfntNoqA0SNrf9lVVCWlDvj0PTM+93ccwq2PIX5fhse6Nr9Jay3l1bkNL68jOSWocHpd
	c2UEZci+iK6klcGvqFDmzeYSXzSGWqPGvAdEfJPFTMPWne3pBCdiH85/vGX8cKuErVSJbM2npmV
	PoDRiuZI8MWWE/+PxQQeA0o3ojWYDBrAJo=
X-Received: by 2002:a17:902:ce03:b0:2dd:ad74:ac25 with SMTP id d9443c01a7336-2ddb1b989d4mr130378985ad.23.1789929070521;
        Sun, 20 Sep 2026 11:31:10 -0700 (PDT)
Received: from eggarch ([2409:40c4:136:c0b:7911:68d7:f26b:cf67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331ad266sm12840860eec.23.2026.09.20.11.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:31:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 00:01:03 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Roman Stingler <roman.stingler@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Erik Hakansson <erikhakan@gmail.com>, 
	Filipe Lains <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3-rc1] HID: logitech-hidpp: hi-res scroll mode
 forcibly re-enabled on every reconnect for Bolt devices, overriding
 userspace
Message-ID: <arAe2iRkYh9p98Rf@eggarch>
References: <20260920094508.39682-1-roman.stingler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920094508.39682-1-roman.stingler@gmail.com>

Hi thanks for the report,

On Sun, Sep 20, 2026 at 11:44:39AM +0200, Roman Stingler wrote:
> I have not bisected this, but I believe the cause is clear from inspection.
> 
> Before 022eb347ff3a4 ("HID: logitech: add Bolt receiver support for Logitech
> HID++ devices"), USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER was not present in
> logi_dj_receivers[] -- it appeared only in hid-quirks.c and hid-multitouch.c.
> So a Bolt-connected mouse never became a HID_GROUP_LOGITECH_DJ_DEVICE child,
> hid-logitech-hidpp never bound to it, and the kernel never touched HID++
> feature 0x2121. The device was driven by hid-generic and userspace was the
> only writer of the wheel mode, so the setting stuck.
> 
> With Bolt support in place the mouse is now a hid-logitech-hidpp device:
> 
>   logitech-djreceiver 0003:046D:C548.0007: device of type Bolt (0x10) connected on slot 2
>   input: Logitech Wireless Mouse PID:b042 Mouse as /devices/.../0003:046D:C548.0007/0003:046D:B042.0009/input/input22
>   logitech-hidpp-device 0003:046D:B042.0009: input,hidraw7: USB HID v1.11 Mouse [Logitech Wireless Mouse PID:b042] on usb-0000:c5:00.4-1.3.2.4/input2:2
>   logitech-hidpp-device 0003:046D:B042.0009: HID++ 4.5 device connected.
> 
> and every reconnect now runs hidpp_connect_event(), which unconditionally
> does:
> 
> 	if (hidpp->capabilities & HIDPP_CAPABILITY_HI_RES_SCROLL)
> 		hi_res_scroll_enable(hidpp);
> 
> and hi_res_scroll_enable() in turn does:
> 
> 	ret = hidpp_hrw_set_wheel_mode(hidpp, false, true, false);
> 	                            /* invert ^     ^ high_resolution */
> 
> with high_resolution hard-coded to true. There is no record of a user
> preference and nothing consults the device's current mode, so any userspace
> choice is discarded at connect time.
I think this does look like the issue.

We could store this info in hidpp_device struct and use in hi_res_scroll_enable().
I'm pasting a patch below, could you give it a go?

> 
> Possibly related
> ================
> 
> On this same Bolt topology the wheel also scrolls far too far per detent,
> apparently because hid-logitech-dj does not forward the hi-res wheel reports
> to hid-logitech-hidpp, so the multiplier-15 steps reach userspace unscaled.
> There is an out-of-tree DKMS workaround for exactly this WPID:
> 
>   https://github.com/Magnetar-OS/logitech-bolt-hidpp-dkms
> 
> I am reporting only the mode-reset problem here, but the two look like
> neighbouring consequences of the same commit and may be worth considering
> together.
They do, but I think this should be treated as a seperate bug. The author of
those patches hasn't sent them upstream.. hopefully they do.

Thanks,
Lovekesh

---------patch here---------

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 1504de32b1c8..6e3d717827ea 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -8,6 +8,7 @@
  */
 
 
+#include "linux/stddef.h"
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/device.h>
@@ -213,6 +214,8 @@ struct hidpp_device {
 
 	int hires_wheel_multiplier;
 	u8 hires_wheel_feature_index;
+	u8 hires_wheel_mode;
+	bool hires_wheel_mode_seen;
 
 	bool connected_once;
 };
@@ -3910,9 +3913,24 @@ static int hi_res_scroll_enable(struct hidpp_device *hidpp)
 	u8 multiplier = 1;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_HI_RES_WHEEL) {
-		ret = hidpp_hrw_set_wheel_mode(hidpp, false, true, false);
-		if (ret == 0)
-			ret = hidpp_hrw_get_wheel_capability(hidpp, &multiplier);
+		bool invert = false;
+		bool high_resolution = true;
+
+		if(hidpp->hires_wheel_mode_seen){
+			invert = hidpp->hires_wheel_mode & BIT(2);
+			high_resolution = hidpp->hires_wheel_mode & BIT(1);
+		}
+
+		ret = hidpp_hrw_set_wheel_mode(hidpp, invert, high_resolution, false);
+		if (ret == 0) {
+			if(high_resolution){
+				ret = hidpp_hrw_get_wheel_capability(hidpp, &multiplier);
+			}
+			else {
+				multiplier = 1;
+			}
+		}
+
 	} else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_HI_RES_SCROLL) {
 		ret = hidpp_hrs_set_highres_scrolling_mode(hidpp, true,
 							   &multiplier);
@@ -3992,6 +4010,8 @@ static int hidpp20_hires_wheel_raw_event(struct hidpp_device *hidpp,
 	if ((data[3] & 0xf0) == CMD_HIRES_WHEEL_SET_WHEEL_MODE) {
 		u8 mode = data[4];
 		bool hires = (mode & 0x02) != 0;
+		hidpp->hires_wheel_mode = mode;
+		hidpp->hires_wheel_mode_seen = true;
 		int new_multiplier = (hires && hidpp->hires_wheel_multiplier > 0)
 			? hidpp->hires_wheel_multiplier : 1;
 		hidpp->vertical_wheel_counter.wheel_multiplier = new_multiplier;
