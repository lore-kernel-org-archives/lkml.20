Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412205;
	b=kg+o2NPdCgsXf0yILYPnEy6Zqu0bqR4BvIy3twuPsWNbV0W7q+fYu9aw7H+4bYTZillx
	 Em/o4JaE1VxuZiJsObH3qhHlFKaYmOXw0qN/KdV5GScon53sq6SP3caHsadI+31IGLZcZ
	 KGoFTnQZvtrXgqoSQfw7kGZh/uqJaxeFYSC6G9e/VP/RDX+4BUEVYdX3iHGKvrdxtI/9v
	 3AcmK5JkXHBrMQhqdXFHnlR/BeK0LX+pzrc7p/va5PK8U67VJewhjAnMXXrZx+SWsOFg0
	 8GLDmMqJ3V7Atg3QQwFEDY26P0yPwDLrDJMpAWJiGBWjIGDhx0xc3yOTou7hGoDZKqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LjprsTIjzsSPfIO3HONHEzJmWX4QP7RVrqKdoKbxbaA=;
	b=BUcr4sZcD+1bmooZdd6LRDuyIETjBHq37zFJgghUu4LeDxBeLaEZp2LT3gcnX+l+mpkV
	 g6YGbd+YVhzDQWGqf6JhlNw+8ZIDNRPsAC/VXkOqlm71WFg4ijKaLL21971rUA5brR2mN
	 ieiTuS6/wgMbtTym9WJsQiH22VxK0o5jjG8jJnN3beiv4ojgSz5XtU8RvLyFFK5Pazwbd
	 tdjDnw0k3HdVpSnmlbd5qhxiYaJwqPVsR2D1c/RGBcrKhJyEeCA4EArGGUeUPIqSkLGJ3
	 WH1Rf/KKM+o8b5t++eCHGqRIBZwggNh6HRWw4gMz8V5Ttknh/LBsqbph82xnewMM/lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AcZsTLz4;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165BE606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AcZsTLz4
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso2413572f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412203; x=1795017003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjprsTIjzsSPfIO3HONHEzJmWX4QP7RVrqKdoKbxbaA=;
        b=AcZsTLz49qlLwKISngXQoiQx2+jlx1wiL2ha0laH2dwUWoS+xpSsV2oFQh2ytpYoOl
         6BZsZeFtPTyHuYf5e1CoYHDMz+gZECYG6FykriYWp1mtGqWLjOnBdQFCg1+sQcllb+gV
         T911hXCBpGr2SSSA2igMFrfnZoo7Fv7Ew92CZ0x7L9jqh8pFVf/AAEyWDZhbMra9+35v
         UEkL4ZLfoTS1mO4SLNtkmrcuU2T7DFKWof96k2hgTYCkdM+inKM9Q2vOlvqVXdANaj1N
         t8OlpSl5Y7VrEhuHLqvE+OluenmZtfhGCJ11J/SY7Ik9mCu5MO+3JhOdycSnT/fGgbIk
         kVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412203; x=1795017003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjprsTIjzsSPfIO3HONHEzJmWX4QP7RVrqKdoKbxbaA=;
        b=jv3K/jb4yfRva6t1bRqZvH1+ZyAs8SlI/1rD/We8ZFjmRaSxv/xxobZ+reAaigRVN9
         8/fWTIUpzWa+rdaEWizwCVGQ2N7A6JpwokOWuHLC037X725+Bio4l+GrJr1v/grDkDiW
         YDRFkkQSG+weZr67kOUgYS3TTLr6b+ZQtfFacyWHA2kh/xzKhpAve8mODOSiFdZc43eP
         IpRqLsw4DIiaOb76Qwyx+uywrvk4Hbdp46qU8UdoZIXQQdPkthFheqHxp1/kiWNt3C4m
         cA/3nO2TvsbvFzSKnSYE41VTlGjPICHK0xj1AUAhuEnA4bIzjFaZx3eTPXGMMLqxfsQP
         3WbQ==
X-Forwarded-Encrypted: i=1; AL+hErE/V1L8sezrcQR1sSf8ltWoiW/u8ttceLHHcvk5NCXr3DtZ925RYR/hkB6DMnaFNRRUN+oiT8W8gsOFqQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z85kIb9mgg9yMRcWXVN3KucGA8K5caTWhDXdZCMqu5WtaNg5rIL
	qUBpotS2BJDKNOsY+unI26Dbl4ZDMamNPJArloJpfgOawqlxdTdjai851L6yXiCy/1s=
X-Gm-Gg: AYBFou0NjF06D925WKQd/oHIhrPJckaJ341ioqcy++SgwIbpYxJaEcyE/Hj9g2Tc22r
	ybHpeOSG9XnWMezcCuztEEItfsCPmBXtLmGK6zsjO9qmFZux7y2YySob/bR9gnxiftvtQDexhcX
	twb+iQaIUO1TE68tiBqXq9hZq597lRLm42dkDRus1qLvb0V9VAND4gsgQ/XHA+ETe3qNeblFTHE
	ie1rLPoMgcDjrRDMD8ytYBh79u17tRPSF0psK9y2FPfxwPnW1SgCv6AvN3C4+W26w9wz+EsJ/87
	Dbu1MwfLjlNVDmH9DMexbKInsrACC7BtFszSRQws6ePqItSjn4svtrrDWZ3fIdPGTYqemE0ntt/
	BL414PHTsqqUEpSQfjzQSUmcrgEVskUVPfkLi3i+4Oj/9zUtV9WNM/XfoMColhwbVzpbmf1aHxC
	INCLKalnpYsGbhz9vjeFnta5jmLNU1qVLnJGGlWk7gg/tTd/JeLjW+Siz0jRUvXipmEMMAlcblF
	x/fJBVlYf4bj4Txx/mBECaK+8wRO9kgVVLfc/vD1+e1aUCIYq42EW79cL9wRXky0psQ5HZRw3NY
	SrmbgA5BVSxaC0cKljL5aoWgqhuD024=
X-Received: by 2002:a05:6000:2c0b:b0:498:42e3:3f6f with SMTP id ffacd0b85a97d-499c38bcf11mr5126601f8f.5.1794412203238;
        Wed, 11 Nov 2026 07:50:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm12466493f8f.52.2026.11.11.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:02 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v7 08/17] printk: Ensure consistent name and devname when updating preferred console
Date: Wed, 11 Nov 2026 16:48:07 +0100
Message-ID: <20261111154816.71103-9-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
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

Make sure that add_or_update_preferred_console() updates the right entry.

The current caller does the right thing. The new paranoid checks prevent
a potential misuse of the API in the future.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a76f37c1b431..e9b189eae548 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2564,6 +2564,8 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]
  *
+ *   3. Only matching entries can be updated.
+ *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
  *	match_devname_and_update_preferred_console().
@@ -2623,6 +2625,19 @@ static int add_or_update_preferred_console(unsigned int i,
 		}
 
 		pc->index = idx;
+	} else {
+		/* Make sure that only matching entries are updated. */
+		if (name && (strcmp(pc->name, name) || (pc->index != idx))) {
+			pr_err("Updating a preferred console with an invalid name or index: %s%d vs. %s%d\n",
+			       pc->name, pc->index, name, idx);
+			return -EINVAL;
+		}
+
+		if (devname && strcmp(pc->devname, devname)) {
+			pr_err("Updating a preferred console with an invalid devname: %s vs. %s\n",
+			       pc->devname, devname);
+			return -EINVAL;
+		}
 	}
 
 	/*
-- 
2.56.0

