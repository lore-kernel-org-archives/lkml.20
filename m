Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911473;
	b=G2qPG2UDbND2RpePRcsKwXIDyA7hWCm1bjWwdr7JShw8nBpGAfJzxnC87utypO+af8Zv
	 7PbDB0CSLu0BglBe1/AdhiNYwz9T0Be8c6hjUbzGSngw9yUdANrP3+wPSMIuyO/QEKJeh
	 dW10TCQLN6izCoFTu1+GAcDtdTQqAmp9QbibOszaZAuv6wueGnNfOxXgj2aHHa1WpQOGX
	 TeM1nPvLGtcERIKgyUzCZWUfdTNGNGgENMNCRniUeydwkr7+MrJTmvs18pOEpyMX5exwM
	 nLLPf8Y10ZmUC9PyLq9b7JYC6eA2d3NF+6M/r68MJqCp3Obxs7ShmTT0gANk4amd4Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=B8DzAG1W7QnI0kYpFrg3m+CAd4h8w0m8XB//rCcaTD8=;
	b=FxTt/Y8AYN7m6L2GY4QqlHw3GAUIf5m1RX//byWm1zqW8zMJwf7gnZt7FA2lSYegZ3bA
	 8lx07gktuoDuWw4t0YGFEnfOftVtRJQKLxn88g3Uq7mEMj+FK4NJTRU1HeU9WDzIhJfmC
	 +kKs3nxUko7tS/bJhMSm3llVS8aouXmcltu8JsqkNJirP9RzhA7+h6tDtI4YN7rzYxaUw
	 TzQfm2NfOyu5ApX++V08bssGmxrUAopIMS12rro7EkBEwVVqKkp3MhqmD90+MV5g1Rowq
	 3A6ky4cU2oBkr9fYqs6OY7spJlA8OvcXfBKBmpiomWJU62Ll77mmzIPF985lGxY7Usg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lciq8CFU;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C6606A887
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690C6606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lciq8CFU
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so36879165e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911471; x=1795516271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B8DzAG1W7QnI0kYpFrg3m+CAd4h8w0m8XB//rCcaTD8=;
        b=Lciq8CFUmsi0phFxpoNj/PDmR73W4oYMEkld19bInRXoTzN8yWNjupdmL+sei6lYdh
         NKIwMnml/mOY/eCl3/O85Fnk+H+PiugOpVZ9/Fit00nSMLWs3zbab696mF08xaWTmMMt
         xoy0YdEHQmLeO8pYtkxnOu9qp1u3KuuNhR5RJey0nLbokGFni6K0EaGtOq4kNkXtUnxG
         xM3VgCdIqts5ZIdDVYzDHiEf9kRj3di+kxX9rI5UMYAObj5ph/FvLDj9jn+aaqcDDgpK
         FuJ7lfhpN/QUWvap3foFKV80nNA8BO3gUzkeu/09pr1gRXqP4Lff+jw7IbxAYziKIyBT
         x6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911471; x=1795516271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B8DzAG1W7QnI0kYpFrg3m+CAd4h8w0m8XB//rCcaTD8=;
        b=icQ+LYNLwZyWorVXj8bDP6sNwN+z5N/76pyZ/cCqzwt7ER0Ki+GEF2JZqmfAOKGd/w
         t+sUH95APa4nCBHB50p5HdeV98EMjby/QiuEsJirHarOcMrSUMCcPT5FE3vX+CapZcfC
         XItmD9gitFNIZKaCguX+OWk4pnMHkwdnQMw6+X0dmpwnUppfO/trei88FLwCw9BAavOr
         1ob8lk6VoU2z9RsgNp73ry6mN27qHhHcdafJS9xxaYVFZp4vuKBz9YFSWaqSyibTwCKR
         tkH0hF88mmqcsGT8tjzULzRRkCJlWNbd+0FNBOCfi4o4jQiu3dJGJEnGu7S1VJDJ2nM6
         5HUg==
X-Forwarded-Encrypted: i=1; AL+hErFtNfrnvB0ecpnkchtxvWK4D2wFH9iIijUO7aeXrohPHydziGdK0kBstVLNC4XDnK/eoYDdxQh1Lj6yvTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7j6lwzLY1E8kmlaLa/N9oZ45MMA76jJK5L/Xt00BNVssZbkh/
	mAGJgnniKwqGvt2l6ydlOZL0AL0wIDFkX6RfJNCGOIoO7A0ku8nR5rIX
X-Gm-Gg: AYBFou21OkA/xOKlPo+1GOUTq0j24jTQ/i47J8OfhgA0QDHHRIZg7sEQpAdHfog2VVv
	mN8G5ztCH8Vto1LiwTiSQEoLGWqYUDJBvOkrh9TWlMT+TTXZo2RAKwxJX+H1xgQfvbNUHMMHDUK
	WNIsk6uj+e9Jl9R55mvvHdGDfDpG2AU/86P5rSiaXjiMkDINS90DHlRtaK24Torrtr8Ai63ko6U
	wZBuWTemTl3NkUTLX7v131RmVNb8iqG7dkk8S3HsOR+W67guyysHe8UyEChUEziAsX9x1SUZJ4o
	tMMj/KBWT8QSx1vCypCq3PpNu1mLSlnaD5RoCO0aT1Pj23mXVoDEasdLB0A12ABh0V3JsdADsLe
	IEbOPpYxr6tfTU/UQ6QwkuWOaTE5mKmmO+GAGn0Cyqw1kctHWGTfYyTY51kZAAsRP942/R5JHP2
	BJ7GJmGg+0j0JcePm1WPB210nWAzwD1ZptN2nZR1AFGKYlmgP7r0R26nYsnqI3zfZe67/9/y8kx
	yyG3HMMbOvbwm/1UB7NnSxYUGQRjiG6SY7LCvsVmH/cmbjk6vLxVmcN12dNonOhvpS3KC1gs0zZ
	xJbZgo4Rs2zCKRBHzsspn6i4G3KU
X-Received: by 2002:a05:600c:3551:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb55a99d21mr291016705e9.16.1794911470633;
        Tue, 17 Nov 2026 02:31:10 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm57712355e9.7.2026.11.17.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:31:10 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v5 0/3] platform/asus: asus-wmi: TUF keyboard RGB readback
Date: Tue, 17 Nov 2026 13:31:03 +0300
Message-Id: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Q3YrCMBCFX0Vy7ZTJND+NV76HeJG0sUbUStKGX
 aTvvk0Xll4sMlcHzvcNnDdLPgaf2GH3ZtHnkMLwXILc71h7tc/eQ+iWzAhJcSQDNk0JxukCsXe
 QBaCynamtQoWOLdQr+kv4Wo2n829Ok7v5diya0riGNA7xe32ZeemtdjQkCVELUXEymgvg4GwcJ
 3v3+dg/bLhX7fBgRZppiylEqUhWXHOp8BNW/2Ec11PIq6ZpNJpPmNhg/0xQVgDsatdo3VFb45a
 f5/kH8xXn92UBAAA=
X-Change-ID: 20261029-asus-tuf-rgb-v4-06ad93a6060b
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>, 
 Bartu Alev <bartualev@gmail.com>, Daniel Pereira <danielmaraboo@gmail.com>
X-Mailer: b4 0.15.2

Patches 1-3 of v3 are in review-ilpo-next already; this reroll carries
the remaining two patches plus a new prep patch hardening
asus_wmi_evaluate_method_buf(), as discussed in the v4 thread, and is
rebased on the current review-ilpo-next tip.

DSTS device 0x0010005B evaluates the DSDT method EC0.KBLS(), which
snapshots the EC's host-visible keyboard state into a 16-byte buffer:
lighting mode, red, green and blue levels, animation speed, and the
four power flags.  kbd_rgb_mode and kbd_rgb_state become readable and
report the write format with n/a in the command position, because the
command word belongs to the write verb and has no state equivalent.

Changes in v5:
- new prep patch: asus_wmi_evaluate_method_buf() decodes integer
  replies through a u32, mapping ASUS_WMI_UNSUPPORTED_METHOD
  (0xfffffffe) and 0xffffffff to -ENODEV and any other integer to
  -ENODATA so bit-31 status words cannot alias negative errnos, adds a
  missing NULL check on the ACPI output object, and adds kernel-doc
  for its parameters and error returns (suggested by Ilpo Järvinen's
  sashiko question and Denis Benato)
- kbd_rgb_read_status() uses asus->dsts_id (matching the existing buffer
  helper caller and probe) and translates -ENODATA to -ENODEV so
  firmware that answers 0 for 0x0010005B while reporting 0x00100056/57
  present (e.g. FX505DT) fails with the errno the ABI documents
- Documentation/ABI: carry Daniel Pereira's Reviewed-by, fix ReST
  literal block markers, and bump Date/KernelVersion to Nov 2026 / 7.5
- rebased on the current review-ilpo-next tip, where the driver moved
  under drivers/platform/asus/
- Link to v4: https://patch.msgid.link/20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com

Changes in v4:
- report n/a in the command position on read instead of a synthetic 1,
  as discussed in the v2 thread: the command word belongs to the write
  verb, so there is no state to report there
- ABI documentation: describe the n/a command word, state the mode
  clamping exactly (mode 9 and modes 12 and above are sent as 10), and
  note that reads fail with -ENODEV on hardware without readback
  support

Provenance: the KBLS buffer layout and the speed-code semantics were
recovered by static analysis of the EC firmware (ITE IT5570VG), with
the help of an LLM-driven toolchain.  Tested on a TUF Gaming A15
(FA507NV): the v2 readback on kernel 7.2.6, and the S5 behaviour of
the shutdown flag by A/B testing both values.

v4: https://lore.kernel.org/all/20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com/
v3: https://lore.kernel.org/all/20261010101601.888709-1-bartualev@gmail.com/
v2: https://lore.kernel.org/all/20260926005625.171560-1-bartualev@gmail.com/
v1: https://lore.kernel.org/all/20260925200744.129714-1-bartualev@gmail.com/

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
Bartu Alev (3):
      platform/asus: asus-wmi: decode integer replies in buffer helper
      platform/asus: asus-wmi: add TUF keyboard RGB readback support
      Documentation/ABI: asus-wmi: document TUF keyboard RGB attributes

 Documentation/ABI/testing/sysfs-platform-asus-wmi |  46 ++++++++
 drivers/platform/asus/asus-wmi.c                  | 134 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h        |   3 +
 3 files changed, 172 insertions(+), 11 deletions(-)
---
base-commit: 9c82959c37bf69c2ace8a0f975cf2129ec1fd982
change-id: 20261029-asus-tuf-rgb-v4-06ad93a6060b

Best regards,
--  
Bartu Alev <bartualev@gmail.com>

