Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9F483BEB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519401; cv=pass; b=DN7YsXDie2wqq+RaO3PZAGAV5UUvekopDfedlUXRI+sxLr0M4/iuSy90KwdktJLK1Y2PqAshqTyIvlg8K80tO2aUDNloRMXxGjI7w7Rl6UisnIR24urMTrvKBXjqetn1ShOq83QE8Mb4wVv3EhyM1k49UG70eqzQP+OvqxbcX1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519401; c=relaxed/simple;
	bh=+SmBCrEOOdHj03PtnD8KMDjAiP1JQQo5/089uZemCT0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TpC/EmKzDHMqRJMlRy+Df1uPcM1WV8Vh8vMBVVxyCk/NNBi24yU3A0oycednnkEl83dJjduHMBNduuvwwJHR0KiqjOfozrQH4kFJ2dFKsl0ftngVTcKmpp7y0J48URILxYT3GBXfwLwyLZmjkRNjqrBt7CRjd5+wwIXFfWvpoho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwpOxanm; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwpOxanm"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398a5aad413so650943a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788519400; cv=none;
        d=google.com; s=arc-20260327;
        b=KfTlzTtXlRt5+aZxULJObKkzTNodeYfAuQJYU/z+U6LbXfmtFOa3ooGLNOb1HAvYcz
         OiCcMpqkCXGsb0jq/QSaCamJkT5paxcMqOaQ70mxysJB5ZeVTntRZO711BXAi9WpdYKV
         0sACGVJxuQgrGasGa04goPaPafdv9AmbtK1//U8d9IaFktzgyiSBrZFF71ftkSHPh2cf
         Tyrk5z+1MbzTBS8GC3Inuc5Pt+Nys9v9494aFknO7QtFB8JlUOisof64h7du+Ib7Z5ts
         Fif7khTMlQChyPzr55IdYfcqRd0HnfS7AEpVeck9cMpiEDFMPC1TuOWA1hmrzqRhw8FF
         NdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3rbbU3f1EGMGd4b9gzwy5CKXVyVuPdXN5nzwTWhOpwY=;
        fh=0nwi9GUDgU9MwOitp6UZiNabdJ1sI3bnPeG1T7bLeoM=;
        b=CSSXxKSxImH3K+g8Py6FY+GRDYLjRDJYCRlbRqvzvgeONKsJXLNs/4RRDdGNjZZTn+
         W8kGiIieKyXsRi+BQYWJOOklSWCnYQ+Nt8+bZ+t2sqwqfGbz3532ozqXRk1uYo5ai1Pj
         PWTaC/v2qgUJmetwKrsPaQnl35pZsZDP3IySC/BBrejO5p4gevmviOd2SaI0lu5rf5UI
         167qZ0vecGnKwfDMju1B1NfrdqfZ9VsUbEybtVz0LMAcQ563IwM7kVVp/+DY8yKWoEZJ
         VvjGCHsXtIKsZWyWPTA/NGBFIaXy5OCKHZedkpNomIE1hpKhJmhZTgg3cMOYE4O4AORL
         OTNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519400; x=1789124200; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rbbU3f1EGMGd4b9gzwy5CKXVyVuPdXN5nzwTWhOpwY=;
        b=pwpOxanmeHuOdOzDQQ6RFX41S56yTuqMbtNo5Jj+R6nVozeN/mbzUwKveu7mRmwgae
         YwQJs/cuq9dZZNEnr6jCORMl2PVK/oXEBq1xpq9QMtvZSMeMopFZaRvSe4pZo2e7zZij
         7W3y2INHXBkuT6yWOzcXaWWzchBceY+4iM4vnD734faSIcvQjMse123KFFv0UiJY7jwL
         +fC+3aTqKQ5fxsY3dyKF7F+O6GTRrixOjl7XNu+rXri3bnE9yDgJmrHKLVbpMdHclQj8
         X5mWAwYGjvkjRKaivGv84umByMWaEJG5KPITMmE51nsnkRk0fmmub5ZVLigThC4hyrqm
         ckFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519400; x=1789124200;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3rbbU3f1EGMGd4b9gzwy5CKXVyVuPdXN5nzwTWhOpwY=;
        b=LD5WVSOYyU+6E7ATHgHuUad63BnE+Jx7RFjC6DhWBgJa5yZ90vuH/5m4I4QZahqsPO
         A3IC0U8+pRx0TZmihmv9mZXIUBbxWahwAVGfyuZJOUq3fGbDaK5+JZqFu8aJqujI/+VR
         j5LxTPucUN1GlKUxauYXNxr0RVDYKoICNz689w8wGVD8uP77Re9gnjhOYtR7HW0W1OBN
         u+3OOvDD3qLAXva58LhHJRJWhhXBRNH0qcYAzMqfO1iTvwRboWUuMixdqJDPbkng4wfw
         2UhL+UH+PRJhDoIjXMpRsETWHpi+E4TZhMPIkwpaeM4oFTsjw5/ecrple54hjPsqkTeX
         +PTg==
X-Forwarded-Encrypted: i=1; AKwUvByW1hREilLwbUcDrh1B1pRNkL45AFZXuB5vvFeUfQE4HjDn30UxwiQHCXg2TlCA45VUWIvYrHMMEEM7h3g=@vger.kernel.org
X-Gm-Message-State: AFuF++ll8N5FR+2HkANiokGExgjrvvh+eZRRbwykvZlHIyvz9gWCPPTL
	e/4pvVaPMFpSuOmITNiCC7XoSB/x7BdWodjRf0zSiOSpojsm1+j+dRIF0VBeAqBUjlP/l8vcnq9
	BoS8b0FZQCN3GAGd/Jy8cQNQ1tmkLou4=
X-Gm-Gg: AYBFou2fFm3S137PXyr9b+HmxbukofUeUz5cAGVyY97pMQcXYCeJA4QT5E5pc7vcAkZ
	5USbkANiSruN71CRPFs7UoJH/ihhZX0+Fadv+EeljibBU+iWPQ48gNZZmChFGN1QX2KigEVkyML
	nCZh2cYZ1VoT4Hw/Dqh3cDKKr0A6YfRUNPuowQvMCvJjM2OgEuvvAVjFu1b+WcS/7tApI79NJns
	8RLBLrIP8kQgfavIPdRxFe3oK86/cRBTQpzwiJyYK6i2DIt5SwjKRptCfyxyT419qnEouW5T6U+
	wnLivqYf3Vw3MMVWIDXNks6v3ICU65d3Qlrb3s+WN4Nwdr0qrRDYexioYYtLGEuRgxEkR1K6o7t
	W
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id
 98e67ed59e1d1-39b262aaf3dmr8860326a91.19.1788519399472; Fri, 04 Sep 2026
 03:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Haris Awan <harisawan5468@gmail.com>
Date: Fri, 4 Sep 2026 15:56:25 +0500
X-Gm-Features: AcwNN1XbTWM4JpFOIOHuHL3aeuQgYjvSzPcBRsbqj8ih8ilxaWhoAt4_-NlMhs4
Message-ID: <CACaF87XKQbdLEHTCLFZh=TAt__dZzWf_d1vneKU9Lnx8kAHEiA@mail.gmail.com>
Subject: [PATCH] media: cx25840: return -EOPNOTSUPP instead of WARN_ON in cx25840_init
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

From: Muhammad Haris Awan <m.harisawan@icloud.com>
Subject: [PATCH] media: cx25840: return -EOPNOTSUPP instead of WARN_ON
in cx25840_init

cx25840_init() implements generic mode video output configuration only
for cx2584x chips. For other chips, it triggers a WARN_ON(1) and returns
0, falsely indicating successful initialization while leaving the chip
unconfigured and marking generic_mode as true.

Using WARN_ON() for unsupported hardware variants is discouraged as it
triggers kernel warnings and syzbot alerts on faulty or unsupported
devices.

Return -EOPNOTSUPP early if the chip is not a cx2584x variant so callers
(such as cxusb_medion_register_analog_subdevs()) can handle the error
cleanly.

Reported-by: syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9123948aef13fe92d706
Tested-by: syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com
Signed-off-by: Muhammad Haris Awan <m.harisawan@icloud.com>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 28 +++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c
b/drivers/media/i2c/cx25840/cx25840-core.c
index a8e21a28174f..6df912c9381b 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -2298,28 +2298,26 @@ static int cx25840_init(struct v4l2_subdev *sd, u32 val)
  struct cx25840_state *state = to_state(sd);

+ if (!is_cx2584x(state))
+ return -EOPNOTSUPP;
+
  state->generic_mode = true;

- if (is_cx2584x(state)) {
- /* set datasheet video output defaults */
- state->vid_config = CX25840_VCONFIG_FMT_BT656 |
-    CX25840_VCONFIG_RES_8BIT |
-    CX25840_VCONFIG_VBIRAW_DISABLED |
-    CX25840_VCONFIG_ANCDATA_ENABLED |
-    CX25840_VCONFIG_TASKBIT_ONE |
-    CX25840_VCONFIG_ACTIVE_HORIZONTAL |
-    CX25840_VCONFIG_VALID_NORMAL |
-    CX25840_VCONFIG_HRESETW_NORMAL |
-    CX25840_VCONFIG_CLKGATE_NONE |
-    CX25840_VCONFIG_DCMODE_DWORDS |
-    CX25840_VCONFIG_IDID0S_NORMAL |
-    CX25840_VCONFIG_VIPCLAMP_DISABLED;
-
- /* add additional settings */
- cx25840_vconfig_add(state, val);
- } else {
- /* TODO: generic mode needs to be developed for other chips */
- WARN_ON(1);
- }
+ /* set datasheet video output defaults */
+ state->vid_config = CX25840_VCONFIG_FMT_BT656 |
+    CX25840_VCONFIG_RES_8BIT |
+    CX25840_VCONFIG_VBIRAW_DISABLED |
+    CX25840_VCONFIG_ANCDATA_ENABLED |
+    CX25840_VCONFIG_TASKBIT_ONE |
+    CX25840_VCONFIG_ACTIVE_HORIZONTAL |
+    CX25840_VCONFIG_VALID_NORMAL |
+    CX25840_VCONFIG_HRESETW_NORMAL |
+    CX25840_VCONFIG_CLKGATE_NONE |
+    CX25840_VCONFIG_DCMODE_DWORDS |
+    CX25840_VCONFIG_IDID0S_NORMAL |
+    CX25840_VCONFIG_VIPCLAMP_DISABLED;
+
+ /* add additional settings */
+ cx25840_vconfig_add(state, val);

  return 0;
 }
--
