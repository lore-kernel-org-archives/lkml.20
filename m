Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139194;
	b=PSJOebXKhy5OGfWCzDPzH+4ZM9WFB5vDTpM8SV/4ZARltfqzhHTzAslSPHLn2xfH5/cb
	 71/waaNXeLqne1I8R2yjfoNyv+Ugz6jH6wLfdxFrg2Mf00xeF9pd+sNOIYssZXErHV06N
	 3L32xdRPAkB640kJ7vt/4NtZwnc7Jq3Gg+T7rIlMqF6EYcpsiE6cFrCdRg3BxxMNpSXjx
	 150sjuSt4kh6H6jaLnEdqoidQ6IjjZjBRj/AQpdtMuVyXR/auOtzbuCbm+pTyq239i+jn
	 ugg9KT/Fi5ijTftm8G55iSyuzteW9rUfAxh26xgl58kzlRgoaSTHh5trjl7SNyBh1zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SF/2BCZg0521GRG2+QySkfLq2PA18MozDs+RfXA8UmI=;
	b=xdE1Ib7FWixaxzFpyCzj/8iZgYvKG2iXKEOmcgYBrULXL/Okh40UyCYk74SQgYRJ4IcM
	 L00eks1ssij56rESvKRD7qYT5ky04K4b4R4Jt9BopLBjVB8PJrt/bICeiG0uUBo06H7Nv
	 1w7DEoYlw8v2HD0U0RxCAn4mAKZjis5V/7Efb7+mqRn5Q/6tpf94FY/zzBrRM4UhWKLpi
	 ZTbcsCoR4P5CAqoL5Z/ksNL5nVcFvULRGyR84VPnn2x1oVvz0TC+9xbSUt2nwpSraSXWB
	 Ca2R7hWVAEbzq5pBgurwipzb0Yqo9gk4q/OR6Ez6wULXqNrPfw2E3Mu4SA/jbcakymw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0szYlizp;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F687606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F687606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0szYlizp
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a9841363b5so2686451fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139193; x=1793743993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF/2BCZg0521GRG2+QySkfLq2PA18MozDs+RfXA8UmI=;
        b=0szYlizpuqRBOChI8ZqX81upTdzV1Ljy6famKg5P0YB8f7/En7yQYA665tspTNTqMx
         Dh+GL+hrzs+mXZNSNHl+MbYnrPy9uoZPkNmC6cMYtsYD5hyd7MsOkFM94K1efULYpVFk
         1mhsKXBN7p4fTy0d2irwNQLwltMB8cnF/sNYo9O0/dPEBwz0wXO4XI/mjvYpz6rX72H2
         lb554H3rV2uSGnCQcYXYkPMhYOZJMQ9fprlryA171FgXyGybSh+8bPXA+MiEHwc+R7+A
         /y9wHKIpzGiqoV9GyoQRA+ZNqOuQyz3vM2dnKMdrDlCnNnVYstL9aFxyv/XNNuU6Gk5l
         XB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139193; x=1793743993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF/2BCZg0521GRG2+QySkfLq2PA18MozDs+RfXA8UmI=;
        b=yqNASbmZtWx+hieGBeKZ7GLycXu2vmKgGLLeBNIiH9ZFCbdLuo6f0wDRDsxvntYa8F
         nMsPCTxcj6SaA27AqJoRmOimYGvFUE1Ic/Vt/m66yCYQqMr36idle5vAOjpMK9XxpHgp
         EjxH7emj54sw3FHVRYFW/60DfSBq4AFuawIUpK0/eEpvlROKta3nATZmsmAQmUCfjw30
         +uRf3dGt0oOqsowiwFnLjs042RwQn9Fl+5XHYTtJ+LdMVP4zXARbl01gHgQrHgDOUqkt
         HWmitkUG4MAINCp11an35gc9m2pOq5+xwhIqnOv3U2+z81Dm0umq3BIeQadq3q5U4F/1
         4haQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9A+j9pxztSbfsJzbPMciNpHqjThVOFa/qNBR0fCHzsX5w8TAHzz9eIx/Onaa0w9IPLyunxcrGMU5c5LA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPlFWH9xrZZ3XOQWyd8RbG+8rG7VpzrU1Y3d1WLq8i5a6sF7QR
	eYtJDvyL8UiXEY+i5MLkAs8IP5JIqoqN7VuR5Fy+k42/qLSXPMnXFO2I
X-Gm-Gg: AYBFou29IwN6Tk1bvW5w0DBCvCb/nOITKQQqGlFuuRvOn3jkEwjczG/BAGucEeJbaoM
	MeSEWGjdOyte0ZA0N3JrusiyPRWu2qVTMeW1pzT3eGpNxGkaFonzmwVvFuT3ewvsBYdGPrEFaRV
	WZV3isGsyUpM+RC+LQgOlLbxODqs8G6hCVGseq9Lv9KhsoYogNGSxZ+UAxO2GmuWEHV00VLQuuz
	75Nqv8cVDHBSsCUzLzOg3H02Wodgjr597sV7Jgymc/nVBn8EXmqTPiJYTXcvOFSgnAhNwIMCw9+
	zYZMYQmzisAKUkr4Sc+vh8Q+G8ggfcGI7yUnKLdBYTRUfherHR283aVK3WSRb+BnFRuM0MGOCO1
	Ud6D1hjRg1C9aF6Pv+9ui+1h6XsBba/zEzZBRiD8Ej7Jc++79xUuHvcCq/8mbAMCyZWvOsHDnAx
	p/P8jwwPv+FPft9cK/dxH2DjgI1/UeQ8XULSLNC1h28QOROhUBNCUO12eyaDXHpb9pV1wkOlHxM
	HfGMDu6LkA4azuEGvilmtrgqaze1ymKQMKCusGjvVZkDP1giD3/tXVqDVGrJOXnFQDB151/n2C5
	y326RDZr5jo4s9dhI7kwFNxlfBJRXPdV6yuHx/bFLKTtcseJKJkz
X-Received: by 2002:a05:6512:39d1:b0:5b7:f75a:ea68 with SMTP id 2adb3069b0e04-5bfcadc7276mr209189e87.35.1793139192453;
        Tue, 27 Oct 2026 15:13:12 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993a57sm27289281fa.12.2026.10.27.15.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:13:10 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] HID: apple: Map Fn+Esc to SysRq
Date: Wed, 28 Oct 2026 03:13:01 +0500
Message-ID: <20261027221301.296198-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Apple keyboards have no SysRq/Print Screen key, so nothing on them
reports KEY_SYSRQ and the magic SysRq key cannot be used from them
without a keymap change.

The documented way for keyboards without SysRq is to remap another key
to KEY_SYSRQ through the keymap (setkeycodes, EVIOCSKEYCODE, a udev
hwdb entry). Compact Apple keyboards have no unused key for that, so
the remap gives up a key. The free combinations are in the Fn layer,
which the keymap cannot reach: it is indexed by scancode, and Fn does
not change the scancode of the key pressed with it. Esc reports usage
0x70029 with and without Fn, so a keymap entry cannot tell Fn+Esc from
Esc.

hid-apple already implements the Fn layer and uses it to provide PC
keys that Apple keyboards lack: Fn+Backspace is Delete, Fn+Enter is
Insert, and Fn+arrow keys are Page Up, Page Down, Home and End. Add
SysRq to it as Fn+Esc, in the table used by the Magic Keyboard 2021 and
2024 models. No table in hid-apple translates Esc, so today Fn+Esc is
just a second Esc key.

The new entry has no flags, so like Fn+Enter it is translated only
while Fn is held, whether the top row defaults to media keys or to
function keys. Fn+Esc then reports KEY_SYSRQ, and the magic SysRq key
is Alt + Fn+Esc + command key.

Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
Tested on the internal keyboard of a MacBook Pro 16" (M1 Max) with the
Fedora Asahi Remix 7.1.13 kernel, where hid-apple handles that keyboard
with the same magic_keyboard_2021_and_2024_fn_keys table; the table is
identical to the one in mainline. In evtest, Esc alone still reports
KEY_ESC, and Fn+Esc reports KEY_SYSRQ on press and release, with the
Esc scancode 0x70029. Alt + Fn+Esc + H prints the SysRq help to the
kernel log. In mainline this table serves the Magic Keyboard 2021 and
2024 models over USB and Bluetooth; that path has not been tested on
hardware.

Background: this came up on linux-input in 2007 for an Apple USB
keyboard. A configurable SysRq keycode was proposed, and the advice was
to remap a key of that keyboard to KEY_SYSRQ instead, so that SysRq
keeps working with other keyboards [1]; that keyboard had a spare F13.
A generic alternative SysRq key was proposed again in 2021 and was not
merged; the objection was to adding a new SysRq key regardless of the
keyboard [2]. This patch leaves the sysrq code alone and makes the
keyboard itself report KEY_SYSRQ, on a Fn combination that has no other
function; Apple's list of macOS Fn shortcuts has none with Esc either
[3].

The same entry could also go into the other Apple tables for keyboards
with a physical Esc, for example older Magic Keyboards and the T2
MacBook Pro models with a dedicated Esc key. I kept this patch to the
table I could test.

If this is accepted, I will follow up with a line in
Documentation/admin-guide/sysrq.rst describing the combination.

[1] https://lore.kernel.org/linux-input/d120d5000707160541k64c40d0dgf661226806fd98c8@mail.gmail.com/
[2] https://lore.kernel.org/lkml/YYUxNaDG0DquQvke@kroah.com/T/
[3] https://support.apple.com/en-us/102650

 drivers/hid/hid-apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 5b32fb8c77f3..b37964451a43 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -173,6 +173,7 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
+	{ KEY_ESC,	KEY_SYSRQ },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
 	{ KEY_F2,	KEY_BRIGHTNESSUP,   APPLE_FLAG_FKEY },
 	{ KEY_F3,	KEY_SCALE,          APPLE_FLAG_FKEY },
-- 
2.56.0

