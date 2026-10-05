Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C64C2279
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214147; cv=none; b=JpuKQaA4AXjNyYMUF11E3iIAPU9T7loz97J4QQ0EhKBBx7La6/+kqHYkfE9cNFnJS12VuJGehiUdCDtG4EHc33droZj4PjgcfxEYU9Qy0PZtoY094VjQ4Vv08oRmZ2V0WBZ6gWghdt76MlRYQwEbJcA+B16zof+TG1K4SRzTPJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214147; c=relaxed/simple;
	bh=XUkqfCwSdokMBSaYM8CnAm/LMcz5dJg/PFsQuhlJmYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9mWbZkCrZBPspfGnuAXW4L+20Lz5bsWWc/b65QTsQhuPR0LM7U4/wgySEI7ZzlAHgh7kdOFit2+ifkjam3JvscTwIVX8mkkqnbnRAaywRS5VZVYvGiPkOqiIsUa9FhWlcn9omROWqEIlcykCv0YSpTopI8WoFvR+R6uhaq8xFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5U11PYe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5U11PYe"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1310979a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214145; x=1791818945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PeiJh6Zig4NlFkymAEvPsUAFttXevwdW8KgW69tmIc=;
        b=i5U11PYeZsso+AjCpA0QJ3etDsvmfV6xEaVmvgD/qVccrt3Hxf1SqDzlzlyv9MYxLl
         S1XLjcoiNDwPMguNtJmqKgXvPHC606QWOf9r8lIdNVLS+7VFE2l++eB17HApPToDhzwO
         EKxaJw57xeZoUcqXzrOmWh90cQOaeX7DZxTNgC6dgkyohZpeEgEW6a8hNkTSO3l7jI4Y
         M5uw+Zw/A22NlgL+v1oV2iWQyIPqv3511bstbxe64HAyXDLNfrIZNzpAf2zlYIL4IzIv
         ufrNraWw+7lwDkVqfGzAnN6kTQFCkdb1y4IYIRCkdjlWYjLKCZ3Sz9pOiOpCvRxRcgsx
         V9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214145; x=1791818945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PeiJh6Zig4NlFkymAEvPsUAFttXevwdW8KgW69tmIc=;
        b=t0Q71zuuXDleBzDXOpV014q4vVToI+zd+i+9oA8uxuN0tUGY8My4kjYK1M63K30J8x
         4vhrlXunDaI8tyKaM8Q94Kutg8t743SddqoHTZvgENggeQlY9b0IeDT+Z+2k2ksU/0YS
         boQWCxEfDQ+UqreLq2BL48vy7Nq/GZN/UI3/I/Kfh5SrtUV4b/0KLTSo5Ur0Hw615qfW
         7m/uatte0q5Hn4AuWaTsHyLTEFnBvKO/l+v4ZniAIBGpPZlDMNUXH1GJBgxQvsMjuzHI
         g+t75W8J/ZSdegkK4tBGv8JxEJo7aaIvf9yp8Rl9Z9pEE2wVwm3Y0GovioG9bgWKsW6N
         toMQ==
X-Forwarded-Encrypted: i=1; AKwUvByVyl1yllqA8fi2PT8Pc2KkjXKfPw/SVsu8KyYS+P8CoLsoOyeSa+0Pgiv+/mrADgFxsEIyTj7Qa859qfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWe2D3fnj/8fmctGb/jIwi1/j80YJ8BnN29myP8gXoAfgRkwX6
	CzwaJBbftUITJnIstDsfRZ8gCtKl6OB61x0PuF/+yxstCvwIOXjn9AC0
X-Gm-Gg: AYBFou1gCCUXzQlGO6QHhVp9e5FdO/f4NM5w4ltlUXk5Zj7UvXKnpSg8lxsYNa09r7d
	/zW6+lJj1Qwk1FLEAfv40Rw5N3mFW+cbgQk0EcIe4O5q7cnlYsov3YxR45fzBRwLDlVFJLnoOLX
	cSF9eWkabLRgroJSlonrzRY1OquAeXs+vQaBXdn6Mfuk8f3IvP5a3Pv1tn+s3B2ULMDoG8S7+Lk
	RVZyDItRPUUra5E8jMu9TderWW61kDXHc8YAtSQ8/fbJ66cFeMdfeKT2rWksq+VRjEwJz+9Jr0P
	hV2NJp+hCQWo1/bvUlRYedIiCW0gdqUqj1QJsyl/Uw7HmfNsr0oKgrOUnLmG0KsLB+rGFZKp6NH
	P1V/OZRvTbDIY+jAy9B6Aebu8qUCgP1Lc+HqaUs5i0u9KmEHOMO3sW6NNXG5wpv3zs8itoQ9fhR
	pR6PBkqZ4VGcpxxCJN5WbfePUQ3m3JdWB+xKCJb36x/tzley5WC5Sqd73NJmH36Y3EneDf9hcsg
	NRdqC38hLtIMEn6Xu+PyRakRZplMrFxfvJ5R0qsACAEYB9v7VE5FcUH2opIViGgMjH89RjmRUm3
	iMNAl8wP1hfrVnGymJVhv5RDXK6ycES2
X-Received: by 2002:a17:90b:5102:b0:39e:4d7b:b247 with SMTP id 98e67ed59e1d1-3a787182b4bmr6453862a91.19.1791214144714;
        Mon, 05 Oct 2026 08:29:04 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([119.14.238.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm29127a91.0.2026.10.05.08.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:04 -0700 (PDT)
From: Wayne Ho <wayneho219@gmail.com>
Date: Mon, 05 Oct 2026 23:27:47 +0800
Subject: [PATCH v2 2/2] Documentation: ABI: leds: Document timer, heartbeat
 and activity attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-docs-leds-abi-trigger-attrs-v2-2-c5f8970b1b42@gmail.com>
References: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
In-Reply-To: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214138; l=5409;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=XUkqfCwSdokMBSaYM8CnAm/LMcz5dJg/PFsQuhlJmYg=;
 b=e7z+y75PaaD3ANyhQrgG0ZutXrGru1x94Pho9l1p9MA9XpgQVSsRN3/B3BKXBbLkqvB9lng5A
 j+NHK7+XcQcD2zrUH9FPy2eygDr1r4vyTd9zBISyMQpruNRNCOdmg7K
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=

The delay_on and delay_off attributes created by the timer trigger and
the invert attribute created by the heartbeat and activity triggers
are not documented. They share their sysfs paths with the oneshot
trigger attributes, so adding a separate entry per trigger would make
get_abi.py warn about the same path being defined more than once.

Move the delay_on, delay_off and invert entries from
sysfs-class-led-trigger-oneshot to sysfs-class-led and describe the
behaviour of each trigger that creates them.

Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-led          | 68 ++++++++++++++++++++++
 .../ABI/testing/sysfs-class-led-trigger-oneshot    | 29 ---------
 2 files changed, 68 insertions(+), 29 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index c72cb1e0..f438fb83 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -86,3 +86,71 @@ Description:
 		Invert the LED on/off state. This parameter is specific to
 		the backlight trigger. It is useful when driving a LED which
 		is intended to indicate a device in a standby like state.
+
+What:		/sys/class/leds/<led>/delay_on
+Date:		March 2006
+KernelVersion:	2.6.17
+Contact:	linux-leds@vger.kernel.org
+Description:
+		This attribute is only present when the LED's trigger is
+		set to "timer" or "oneshot".
+
+		For the "timer" trigger, specifies for how many milliseconds
+		the LED has to stay on in each cycle of a repeating on/off
+		blink. Writing a new value restarts the blink immediately.
+		Defaults to 500 ms.
+
+		For the "oneshot" trigger, specifies for how many
+		milliseconds the LED has to stay at LED_FULL brightness
+		after it has been armed. Defaults to 100 ms.
+
+What:		/sys/class/leds/<led>/delay_off
+Date:		March 2006
+KernelVersion:	2.6.17
+Contact:	linux-leds@vger.kernel.org
+Description:
+		This attribute is only present when the LED's trigger is
+		set to "timer" or "oneshot".
+
+		For the "timer" trigger, specifies for how many milliseconds
+		the LED has to stay off in each cycle of a repeating on/off
+		blink. Writing a new value restarts the blink immediately.
+		Defaults to 500 ms; together with the default delay_on this
+		gives a 1 Hz blink.
+
+		For the "oneshot" trigger, specifies for how many
+		milliseconds the LED has to stay at LED_OFF brightness
+		after it has been armed. Defaults to 100 ms.
+
+What:		/sys/class/leds/<led>/invert
+Date:		Jun 2012
+KernelVersion:	3.6
+Contact:	linux-leds@vger.kernel.org
+Description:
+		This attribute is only present when the LED's trigger is
+		set to "oneshot", "heartbeat" or "activity". Any non-zero
+		value written is stored as 1, so reading it back returns
+		0 or 1.
+
+		For the "oneshot" trigger, reverses the blink logic. If set
+		to 0 (default) blink on for delay_on ms, then blink off for
+		delay_off ms, leaving the LED normally off. If set to 1,
+		blink off for delay_off ms, then blink on for delay_on ms,
+		leaving the LED normally on. Setting this value also
+		immediately changes the LED state.
+
+		For the "heartbeat" trigger, inverts the heartbeat pattern.
+		If set to 0 (default) the LED stays off most of the time and
+		blinks briefly on. If set to 1 the LED stays on most of the
+		time and blinks briefly off. Unlike "oneshot", the new value
+		only takes effect at the next phase of the pattern.
+
+		For the "activity" trigger, inverts the on/off states of the
+		CPU activity blink. If set to 0 (default) the LED is mostly
+		off when the system is idle and stays on longer as CPU usage
+		grows. If set to 1 the LED is mostly on when idle and stays
+		off longer as CPU usage grows. The new value only takes
+		effect at the next on/off transition.
+
+		This is unrelated to the /sys/class/leds/<led>/inverted
+		attribute, which is specific to the backlight trigger.
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-oneshot b/Documentation/ABI/testing/sysfs-class-led-trigger-oneshot
index 378a3a4d..3532f13d 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-oneshot
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-oneshot
@@ -1,32 +1,3 @@
-What:		/sys/class/leds/<led>/delay_on
-Date:		Jun 2012
-KernelVersion:	3.6
-Contact:	linux-leds@vger.kernel.org
-Description:
-		Specifies for how many milliseconds the LED has to stay at
-		LED_FULL brightness after it has been armed.
-		Defaults to 100 ms.
-
-What:		/sys/class/leds/<led>/delay_off
-Date:		Jun 2012
-KernelVersion:	3.6
-Contact:	linux-leds@vger.kernel.org
-Description:
-		Specifies for how many milliseconds the LED has to stay at
-		LED_OFF brightness after it has been armed.
-		Defaults to 100 ms.
-
-What:		/sys/class/leds/<led>/invert
-Date:		Jun 2012
-KernelVersion:	3.6
-Contact:	linux-leds@vger.kernel.org
-Description:
-		Reverse the blink logic. If set to 0 (default) blink on for
-		delay_on ms, then blink off for delay_off ms, leaving the LED
-		normally off. If set to 1, blink off for delay_off ms, then
-		blink on for delay_on ms, leaving the LED normally on.
-		Setting this value also immediately changes the LED state.
-
 What:		/sys/class/leds/<led>/shot
 Date:		Jun 2012
 KernelVersion:	3.6

-- 
Git-155)

