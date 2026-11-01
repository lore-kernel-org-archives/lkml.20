Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530019;
	b=sm/z122UsuhTqd+bSNZyUuPVuSDfJ4kO2XfstcSRydB1NwPvU9d38jDJVET8kUS8fpL6
	 Sg9zqdAGY1KEU2Y1qMnvkDzfjpgO7OhongSEA1NBDrfJqcY2cQvE/z2qyNSwxpBo87FWe
	 QufmetY8rqMEgdiUbqy7nJcujsLqKnLJhX6tQP6n89kjLrUoJG5FyhPGUcuL9lLHuYzjB
	 vmnzJEQU2JyyJMrpB4DSziYEJ5osjh/XUStWHhO45RVrBjXoxnoO4gp05oWmdMHUZ/4ZH
	 UFP1pfrreTD28o3LoXVHdkgDRL5mF0DFGNmhcv8qN8EjJHgfbA8hPCiMCqRjndQvgbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7G9vF9OS16E0g31UX34geJPbbud9xS33YqrpYdPUMwo=;
	b=I7ZOG7tNsxxlgewzVaNTGlipVxb1DwewfcVPGUIAlmz7AyF4laYxGlxhqFQBjI7u4xOF
	 nZJdYJR+wGL6uFW3RAXIy5b1M0abC+gTYlJXl5SL/vxu74F4zFTx1kNw90EVc++pUzZ+F
	 Wul8iHf7zft8+WDVL7gQs9QOkVthNZ9KzEmsF5Vh/nqL+e25dQP6M2nitiLL2MjLwpgOk
	 xIq3OOtO6Mp0dnThZ+Qq1ubq46ZFfhGlSNJ7mWPTByBPd95pd9CMxkS+3S9yXYgWB9Pyt
	 z0lUYNrbbX0ymXUk+wHOvQmHfootFL1s9EQMEGOF8C2ZIMsEIfqyNI8mcMpsAzqu5rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5NoKQzc;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8167606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8167606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5NoKQzc
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1795023f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530017; x=1794134817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7G9vF9OS16E0g31UX34geJPbbud9xS33YqrpYdPUMwo=;
        b=D5NoKQzcOhGbdR3DBrqW2mnxCLFInSyDjJH/+62YKTx0X38vQhc0vCYMBkzpHK6ymy
         ojU36Lg0xAj5NCCRLOLESGFqMcgx3+01OGf9fHep8bcKrI0/XANmkKByV4QuqjtGZBM+
         7vqshWMC8YbcujGmfcvqq6kI0L5EusmF8CfkQicmO/0vuyhAVoiCIo9170VnG0tWkyYS
         0z5dMP7QJKk0Ylbu6Wo04qPRi/l/f+1VYSgr49ZS60iRBTt6btidI0JBWNWQ0NrfBKpl
         jyI0O4p6VYliMAfJtARMbVyi2ggH6S8I8qE/omv1YL4NqENqwIEOn/dbWDS5jHItVOdF
         Mxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530017; x=1794134817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7G9vF9OS16E0g31UX34geJPbbud9xS33YqrpYdPUMwo=;
        b=R8IFbv8WkZsy00O70yKZepLe4KmuLljRqHjI2L9Gz+rOZLLrIsu1UQrCBCWS6ecEgm
         uac1lAuhWaRrpyKLMMJZfvAqqkEOo/D5IpfYf6CtgNGs7A9zrGZkhOr5apSMik2LX+ia
         TlaKSQsQNZkjFyEYHbF+Toaxym3snKJRM+OTrNRsTRhpvC491LDJilAzNoGNhdTNtaDB
         LwBvRyfGpY2qJ+Hx5EmBvw5ylvKACvoQ6trUfS2Bm8vPPFd1MXi2zRFIwKMOFCBrMtFZ
         0aqbuKR2ZOMecvM9rCn6TBInHqQlD2bE2b4CTaEyTyP0/WpMsEZ3b7yx1DF5dSV6lPUa
         N/9A==
X-Forwarded-Encrypted: i=1; AKwUvBwC9VnU7QILyv3Jkvgq9bfuLMimVy0lTvv+0/7PIe5j9bVjTi3HK43Q5w4l9d+tDkhaWLnSOw5SzPMie7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrI0RQ/aZbjSsphQUSIXeassRMC+/X2o4YPK6WgzRA/8xYTQs+
	4O6g0bOR96SMVemJGlkki4ckDbDykNzGw993u5Y6POidbZ7B4JlH591I
X-Gm-Gg: AYBFou1c0K1tJ9FiK/aVK1lE5TRSJFe7hYzGaqP+G0Ou3ch2IDnkLWvrgiOpINpyvN0
	truEnzlNY/7Dc6oB0fxEAvvcWqdXlt9s8ysBYviYkaq5n8Wp7Yqp3D1gPCTXeadfWqHpJxIeYj1
	jZ+MySakgwooldXcmk2dkSHG7H61RDs+pTbL3uY5QmVSmIk1fQM/dgcD//Q+wgW0exD3t5IcjnA
	Hr/z17zV24GLNbAy3a3CQJ2YqJUYyK/hHmSo+a/fJ4BboMz7/stsNBIl2IlJPmEB1OEuCy/9qY3
	H2HtrxK0x0uBfMiA/og0kQPiUjO/PjOHG/f61US6nRMDHZ6xs64Ybh0JaqBQVGXP6v7h+Ns4mI2
	fXqVhRYOhc5ihq+RQnRGxF0cVQpje2qASya+puX9PKADqciBPhdxFIYPMGLSLADB7xmzFkthRRW
	yhmDvwBwX8huXVrMGpzEgdEknM8/ISDAYOwMuM79QAkCuEiR6rmTHcKqFDQcOY+1XRWpqTBoOzx
	njMuj5yYQOQSK+LHeH3Q12j6uAAelWR2vd5aebM5cEMNWx85eE9V4xhSFIa07Cu4nKG4x3sHcpV
	cpjvNPb6fJ+SVMglgix5LN6vauA=
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr168860485e9.16.1793530017002;
        Sun, 01 Nov 2026 02:46:57 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:46:56 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:41 +0300
Subject: [PATCH 1/7] platform/x86: asus-wmi: dump buffer replies in the
 debugfs dsts file
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-asus-fan-floors-v4-v1-1-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

Reading dsts calls asus_wmi_get_devstate(), which uses
asus_wmi_evaluate_method().  Because that helper handles only
ACPI_TYPE_INTEGER and leaves other return types zeroed, methods
returning an ACPI buffer read as 0x0.  This affects fan floor tables
(0x00110026, 0x00110027, 0x00110033), fan curve getters (0x00110024,
0x00110025), and TUF RGB readback (0x0010005B).

Evaluate the method through asus_wmi_evaluate_method_locked() directly,
matching the call node, which keeps execution serialized against other
WMI operations.  Format integer replies as before, dump buffer
contents with their byte length, and print any other type as t:<type>:

  DSTS(0x110026) = 16 bytes:
    00000000: 00 00 00 00 19 30 3a 4a 00 00 00 00 00 00 00 00

The sentinels 0xfffffffe and 0xffffffff continue to return -ENODEV.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 46 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b33ebdb21aa21..c55f469cb03dc 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5038,16 +5038,48 @@ struct asus_wmi_debugfs_node {
 static int show_dsts(struct seq_file *m, void *data)
 {
 	struct asus_wmi *asus = m->private;
-	int err;
-	u32 retval = -1;
+	struct bios_args args = {
+		.arg0 = asus->debug.dev_id,
+	};
+	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	u32 retval;
+	int err = 0;
 
-	err = asus_wmi_get_devstate(asus, asus->debug.dev_id, &retval);
-	if (err < 0)
-		return err;
+	status = asus_wmi_evaluate_method_locked(asus->dsts_id, &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
 
-	seq_printf(m, "DSTS(%#x) = %#x\n", asus->debug.dev_id, retval);
+	obj = (union acpi_object *)output.pointer;
+	if (!obj)
+		return -ENODATA;
 
-	return 0;
+	switch (obj->type) {
+	case ACPI_TYPE_BUFFER:
+		seq_printf(m, "DSTS(%#x) = %u bytes:\n", asus->debug.dev_id,
+			   obj->buffer.length);
+		seq_hex_dump(m, "  ", DUMP_PREFIX_OFFSET, 16, 1,
+			     obj->buffer.pointer, obj->buffer.length, false);
+		break;
+	case ACPI_TYPE_INTEGER:
+		retval = (u32)obj->integer.value;
+		if (retval == ASUS_WMI_UNSUPPORTED_METHOD || retval == (u32)~0)
+			err = -ENODEV;
+		else
+			seq_printf(m, "DSTS(%#x) = %#x\n", asus->debug.dev_id,
+				   retval);
+		break;
+	default:
+		seq_printf(m, "DSTS(%#x) = t:%d\n", asus->debug.dev_id,
+			   obj->type);
+		break;
+	}
+
+	kfree(obj);
+
+	return err;
 }
 
 static int show_devs(struct seq_file *m, void *data)

-- 
2.56.0

