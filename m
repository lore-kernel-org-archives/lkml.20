Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009543D75C2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872915; cv=none; b=VWjqGufwpvdy7omQ8M6+2RBTinN8Z/YzpaZXZwKjxGjgZNUbHkA50mYVYyMafqfwb4h2h84et8IQ+PDb04mRmlJBStt0DzmFKEO+MbrLPvbNMSxf5YRWAzK3rszjNcdFZMo3/FkSXmrtgkiG3bj3TClY684ymh6Bq1vGFtl56Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872915; c=relaxed/simple;
	bh=OLkbXGYyZcNfD8UAT3yY0FeWpmQA9tPNWZT8QqXTR5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n90BQBVRxC1kFff50E3XryuTwGJvSGZhC8+arLEffoepUmGXLlul0zYvYtdO90sSjCCQOCj0V4KL7ULwSuJTEX0Vkk/gA5Ir5WeI7wFl2uMRPd96S5p37JH/x0JN6JPIzL8KEF0E0xcIbW+S0Qn/7U2Nadfgduq3FDvilZEKfEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsxmOnSU; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsxmOnSU"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b1ba286f6bso1453259b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872913; x=1788477713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJk/diW7vSdlaTCy9g9nUpmvVfpgQ3VliAsH0dOI4Qc=;
        b=qsxmOnSUKgj3p72MdbZKM3WmK2fGmksvR6rrlVv+ZqGNQzxBsKrkFsyrSDFmuaDbGs
         8qLIMLNuwWWwzFT6kRLMMY818j5rrvX+PJsYctEHcG0MDCDA7jdHRHyr0luD42qQRLz8
         C4CZffChCTb5zW+2yDu7i9i/PaTVgRJHKdU/3kVa+OPHicxDFsuMZ/5oF/f04LsDmh64
         Bgc7npDvO+8ZF/V8vPMw4DLkbnSV3sOTdly0LufwQyJvzqCAkNLJymPuKvMbTAAWRl5y
         5EdfYhcknwDTqSph8ZkU2vWuHyAasQ70ChWws5nHFlzWFDa6cc6wzoQqy9R0yJILPOFK
         3nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872913; x=1788477713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJk/diW7vSdlaTCy9g9nUpmvVfpgQ3VliAsH0dOI4Qc=;
        b=qIYWxCSNlLM/bEi4lKO/z4CbMzx3a/5Xf2CTkYYXHHlj0Gw/2c4A3zVHraIqaMzAbX
         +SLJs2mupqS6P7Ux97jTk7jYXDNHeN4fIaKfQ8no9QtLH7vhsh89SK8Aj6p+Drp//opF
         ZbVtHySaUzkOhOm5cWsw5hPk680Kkqzp8Fjd9X3ke0/RDhSbCqec2Gwaw48QvIrzrfy/
         ADitsgFX2szalZCcbDYx5k+O99FXQKGOM1rEV0+rEd555V8JwYa9uzS7m+uH8q1rTmfu
         xapX6Aow9sm6wCXPHgxL8E1+6YW1udCxbkLsZgkbXkuoVMW1pXEdTpjzLSH308pOmM7R
         GBrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJlO+4yeAeYbAq4/1YQPJhid9qodWdT89RBnKT392lD0LXehdtjzG+yIBEBFjVcDTsC0ARUCCGxpgyub4=@vger.kernel.org
X-Gm-Message-State: AFuF++lzHM5rDpPe7d8RS7zzh687MxveX2F92nxNlP+GzSxQRhlsFJ2N
	5qA3IKukjtvvsWCFSnliqhhako+2AU6CBGBhz1nH/c2je5Qcpz17isTm
X-Gm-Gg: AR+sD10Y0FpYt28MoiemXUAhuPdNrvbk0SM/54zDmXV+plRnR0+snbJsPKrr/+hXMnV
	ZtUVbBTsIVDlm/9yQv9s1tza/qT8AG01YA1JSOImQIr4bM9UQN/Vdpo9Rg46VAI9RxADTSu8u9/
	k3wogOa6lx81h/N/1po8f1bKFXcLAefSQQkgL8KdsTux7BEMLYbt1jgF2tW295x6/HbqDO9tPNx
	NVJRgdtvMn0kVVQeCESEKqC55kNVZCXWRJDwQFV4iVm/5KJsyqqBVE9yIP7Q4nKJRqgnz4MGXiq
	ALHeoxi6pWcjIhPFpyECLohcxHznNHI7HJfpXwroxxgqpHvxwh9igKOlVWOtLnszXRIE5t+yxjy
	GWmrsdzr3xwvbyupJFvCnBKFmHzjmZ1u03EsBdwo6Bnu3VzXdz3DchTz0GQ9CBvdoWhi1jJyCGK
	4gxEUuDgZgQxQ2dGW1dJVWZgTAZgHCnQ5xx+uQGKoLkFCCAK+bMGkqTap31KbH+m7cU9Wa2tv9V
	Ek9t2Kh0va+BNcl
X-Received: by 2002:a05:6808:10d2:b0:495:f697:92d9 with SMTP id 5614622812f47-4b37c88e895mr9695964b6e.7.1787872912836;
        Thu, 27 Aug 2026 16:21:52 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:21:52 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 2/6] ALSA: usb-audio: Add PM guards to US-16x08 transfers
Date: Thu, 27 Aug 2026 18:21:39 -0500
Message-ID: <20260827232143.149197-3-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TASCAM control helpers submit vendor requests without preventing
runtime suspend or disconnect. This affects mixer writes and the
volatile meter path.

Protect both send and receive helpers with snd_usb_lock. Acquire the PM
guard before chip->mutex in the receive path so autoresume cannot invert
the mutex order.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_us16x08.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index ebff185cbd2c..14fb1ad764a7 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -151,6 +151,9 @@ static const char *const route_names[] = {
 static int snd_us16x08_recv_urb(struct snd_usb_audio *chip,
 	unsigned char *buf, int size)
 {
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
 
 	guard(mutex)(&chip->mutex);
 	snd_usb_ctl_msg(chip->dev,
@@ -165,6 +168,10 @@ static int snd_us16x08_recv_urb(struct snd_usb_audio *chip,
  */
 static int snd_us16x08_send_urb(struct snd_usb_audio *chip, char *buf, int size)
 {
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	return snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
 			SND_US16X08_URB_REQUEST, SND_US16X08_URB_REQUESTTYPE,
 			0, 0, buf, size);
-- 
2.47.3

