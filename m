Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442609;
	b=wOs/lSAwQxTV/VPvoEavNngwHZTVho+C8xNrN5xak4Y4dUeBv8QxKXdTWJSPCsb2ehP4
	 R9sQoldh0cuqCE1VxmYLJ5M2lKi6nNk8GQiYhA37o0uR7YxsduV93cWWyx4zVFEy1gG3l
	 T56aQmyKoY43o70vdAbtA0AwMhI2VdXrpk2W6SA5ntUdkWgsOeNxRjaD/FfHIY6BsnlAt
	 +q9GIgTN7w0Mko7qJBHqDsIwG1SZpTBejSYL9xIZ4oSRvjx4qvITUJTC47fh1DqdsJ7U1
	 YKfCZXWJBfk1yyrTtumnAiKsRbx48qwztjH0Winc7RBTks0YrCfPgti/2ixEuf+LRew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGexwgK5GsfrYlYAzT+bpSfeXRNUax72AD2f2NRfT8M=;
	b=5eXmxcsD0FQVeHgcWpfLKxuzsNO30AEoV+SWufOHlVJMii5ciAp1ZlqQ5d+6pPQxh1SD
	 0+dkFLmAM6lW9GHrJv9MOYjH5ZOuOdQyD791JwmLmM+sAde/h6hP6Oves7Hictg5y2me2
	 AY+V7DNiBWsSnzGvom+oE6UkCxZezrfCwc7hdfMVMKuMWw+JXwn2wnTEiN9RPVCntI3nC
	 z9IVp00haTeoyLVm+elnK4CSeWlW38XIAidP6eGCqIGLMksrSQ532R0juyHbdKp/ylDOC
	 9oNj8kOtjFWMq5EQ3bqwqfa/hPZ7GAOdkpd1jXjnSFE2Ak+s89XadTqzV/IK3Shkmvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYsbeP7c;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F1D606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F1D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYsbeP7c
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso4766118eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794442608; x=1795047408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGexwgK5GsfrYlYAzT+bpSfeXRNUax72AD2f2NRfT8M=;
        b=oYsbeP7czHMN8STkrlG9EQASwg8LH9HR4yZ2fph1J+MVwj0VdxpbC030HkYSoHGdcv
         LrVHhmJ960HrTsEhYE7nZxQ6HZPTBX07IVdDx/nzgkntOiHig5/JwJFwXGWi49sBlWGv
         GEio3pcvQGErbq7nJI2niWk9wbuvLpW0vNB7H6lL4aSmAVm9/eaayucx3b8NS0k381ju
         PuX/mGJUqJathYlYtHcvMeYRHlTQYxqs52aoAGzlan4gDP1+eYHvZ9fzZHdLn5+kq1NG
         hUPRhaJeUto1AQmLisDwksEDttf6arV4JvwftiMOljF+zpf2ZXTD95TiLMZ1wxrs7sCf
         uRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442608; x=1795047408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGexwgK5GsfrYlYAzT+bpSfeXRNUax72AD2f2NRfT8M=;
        b=krh+Xm1NgPWsho0dzBhagrCcPTFMbxrrJNjUNqhS5OLDEAUn+p9L0qpHp2ExI25ZgD
         vN1h/UAD2Spa/7ED6K/IIX0NbPLLUkhur21algaOYINsUPi4MhaKExBhPQpvBYTbRST4
         wkSaOfSDCqMzow6QZgiJrJVqljK6y17ph2MCH3d1KAKaBBqBfWyVnUQMtXxlujaPmty7
         tfTROms5J0NvMyfjq4MZvV2WbU53egUDEHOFPEXYGsKWJtYnyCBQ0zhuhm3RyahAr4wD
         Zs1wIDnmXmAbg32bAfErdzRB4M+AcpjqnQV0uBcmagdpT4ki3g6C54bgGYP8VCZOQm9I
         xRYA==
X-Forwarded-Encrypted: i=1; AL+hErGrG6/F0MjJ0RDC3phkvut72QQNAa3IMSWJyRxrS4c3JXk0Oq1/fIGRRxsUp7hY+4vcqQL+kGZ3q5m0UIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IVRhfC9iwZDZlaVE82XBbDOWQb1D98FLWxm0VWRWl3IixZGqX
	OKlAGHgKg4pDJgvAazjVYTEa1yE9aaW1O9R7j8qd4kbObUxquyUJIk0w
X-Gm-Gg: AYBFou10pAzMV6LXBoZMpK1veOLjZD3bk0XOdCP4rETUxJCahpAHX5JQAUjHZ6OJki4
	s1ELJeNjz39DxrN/yTVa29BsXvAMUbTOVOJIB+rr1UOv4TtuqTVvv75Y2J+YTBx1B1DsSt9O2pL
	t15gjNUrBl32qefIL552UHBCF2q+XwRFCLahYka8v9i9WDeYixnaFk9/gZObBQQ6m6rN522X6aQ
	KIYfq8N6+xHae4WJk2xCZQrlLbm3BiFSQr3Zk/rvUSDN8aXnQWcgrh93LDvu5/wUQLkh7Vf08Uu
	7CLMvlXPSlz7nL8uLP96snnt7bBZFnXXlQWst6dv1ObXDsLUzvwIbXNuuXxxF0TfJvrIuLn/UXG
	8EaKRY+2j4LXaPEPnXSHHxGYKq++X1DofjJeLlS1lbIXPwI5UHsxFHbB41547gPUUdlFTmdAAsK
	a1a6/rUufvEEP9/GVK7XHOUTkniYnPTsuw3IamlLTBqPb7c1TP/oGTqczarh/Q93Nl4VQAHXHMG
	ea68RPuo/tJfMIEQ7t8fklqQyKcc3vlKq5YfJio2M19dY75Zs+erZmZYsbGHL7pd4Hd0IROOTRm
	Kv81qgXleAOKqNXBdLq09UQ7Sr1G3Pjhs5rIJ/qn8D/34559+meShTn0m6QZatBRV1wQf/AqmH/
	hPpHI8dt+8bbcJA/d
X-Received: by 2002:a05:7301:514a:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3768675676dmr4358326eec.24.1794442607773;
        Wed, 11 Nov 2026 16:16:47 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm40492697eec.16.2026.11.11.16.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:16:46 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Alfred E . Heggestad" <aeh@db.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Thomas Reitmayr <treitmayr@devbase.at>,
	Shaun Jackman <sjackman@gmail.com>,
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
	Florian Euchner <florian.euchner@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Xue Lei <Xue.Lei@windriver.com>,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: remove obsolete cm109 USB phone driver
Date: Wed, 11 Nov 2026 16:16:40 -0800
Message-ID: <20261112001642.243554-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This short series removes the obsolete cm109 driver for mid-2000s USB
VoIP/Skype handsets based on the C-Media CM109 USB audio and HID
controller (0x0d8c:0x000e) and drops its module selection from
ppc6xx_defconfig.

The driver was written in 2007-2008 (modeled after yealink) to poll a
4x4 phone keypad matrix and toggle a buzzer wired to the chip's GPIO
pins across four phone models (Komunikate KIP1000, Genius G-talk,
Allied-Telesis Corega USBPH01, and ATCom AU-100), relying on a module
parameter (phone=...) to choose the keymap. The mid-2000s userspace
VoIP/Skype bridge ecosystem for these handsets is long defunct, and the
driver has seen no new hardware support since 2008 while continuing to
attract syzbot crashes in its custom URB state machine.

Furthermore, because 0x0d8c:0x000e is the generic default C-Media CM109
VID:PID and was added to hid_ignore_list[] so cm109 could claim the USB
interface, cm109 actively interferes with non-phone CM109 devices still
in use today: amateur radio interfaces (Direwolf, AllStarLink, SVXLink,
UniPager, Hamlib) have to blacklist cm109 so usbhid can expose
/dev/hidraw* and so opening the input device does not pulse the GPIO
pins and key the radio transmitter's PTT line, while standard USB
headsets with 0x0d8c:0x000e can bind to usbhid directly via the chip's
standard HID Consumer Page volume and mute descriptors once the
hid_ignore_list[] entry is dropped.

Thanks.

Dmitry Torokhov (2):
  powerpc/configs: drop CONFIG_INPUT_CM109 from ppc6xx_defconfig
  Input: cm109 - remove driver

 arch/powerpc/configs/ppc6xx_defconfig |   1 -
 drivers/hid/hid-ids.h                 |   1 -
 drivers/hid/hid-quirks.c              |   1 -
 drivers/input/misc/Kconfig            |  12 -
 drivers/input/misc/Makefile           |   1 -
 drivers/input/misc/cm109.c            | 940 --------------------------
 6 files changed, 956 deletions(-)
 delete mode 100644 drivers/input/misc/cm109.c

-- 
2.56.0.567.gdb80ae8cd5-goog

