Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412181;
	b=eO5foneHcIpMWLpj6LEyvzgLeNVedwoaKp8x53bJqWEoWuQqrd3h0afnQ9Dgv7YG2cVI
	 MoyWIeZyU5rqiLZZj3BsxSriKy/rF72oepW0FIBdKV+0YTA6dvuqS2RO/ajQmD+KnYuAV
	 UeOFL8vVHtcuJwlN/P88LbBSTYIeBFdOjylfO4nAjn+LSYMYjRqKsNMNpFsci3G5A3190
	 CsaMJ4bll9x9ytrC59nomdtoZapV2bDUiL++/u9BNoOdGPn4KAsIgFqJ7Fygv4PTlaDI8
	 nU+oUZJpRVpqnE33foSm+ZVTqJyf+K1QkJYocojmxoGYPulJPh7JxW9MdtfAZVQanBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zY/MYfFEjw2YFz6ONFSXVTOnks+S+fKlmAWumtYd/lg=;
	b=SknGdn+r3LxpGUVT/PUXiQskl4meg35uDL7UOJGqRlYRmTSY+f49o8BSdXg75MiKH6Zm
	 pGPeHif84cOOFMJXbTQovO3VF+l1vhpNAjid4iBRs77ZL0DY42x3MkRvBYDLdtgW8q25T
	 a8151BkJV/gT5JhEePs211zWy/p8vrNJ8FIC4UOn2idho4lczp6AImDbdQYuXBk7kw7KJ
	 7+gZGeA/mZAr+/OngJ9m5ShKkKRvi2Cb6cJff6E5WM/DTRGcwHf+WXBd1I9jdLKcMPhrz
	 Xj5ftO+mcCHP6C6TZjXb6qU9VIAzJhhl1smhsjx9nz8WihPg1Vr0x1Mx4KmYBEOjL0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ao8uIWZg;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EA606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94EA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ao8uIWZg
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso31815665e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412179; x=1795016979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zY/MYfFEjw2YFz6ONFSXVTOnks+S+fKlmAWumtYd/lg=;
        b=ao8uIWZgGcDb2X4MziopFf5Jdp5RnxXHpH/Xd8AE9L3CUeDWciFGYapE87041Zgemv
         tqXbXYB+Wyqz8me1f4umKsAAoPqgmJSmdTP6twXLMH4rmmb0bNy+i/+JU0+OrNKnOkA4
         jBgkImmju6SsVHo8/1cN4awN8DMg2e8uL6V3LYYtcidnT7IP8j18STh70r4Q5Vs97ag6
         B8bMbbya5y5WCfWYnXp1z7yvPAsgUPb0r0OqmgJHKktd9fOu1wsRmwAOwx7RGWSxiR9S
         ZMyp279uXINWg0wb0gDvwC8DLcpv9mqKOqs1aN3jRAQUrJb0SeevPzZCS6BUu3KJLmIb
         zU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412179; x=1795016979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zY/MYfFEjw2YFz6ONFSXVTOnks+S+fKlmAWumtYd/lg=;
        b=TpURHQqCZUZkqhtgcizCykYyBeWjzml4bpjMH/LHrRsfHxhqT7PeiAOxl9sBGMoScQ
         n7Q8f8kvyUNAJBqxEYH2/ngJoXhoxY2YGd+BsU+woWTZOKGKnNgGJNQUPdCqbn3mFUte
         ADhBNpfiuqMUmWxjG3vAkwjhHN8qf4OyDJ4yVBprw7EADBKuRoVpMgWLb/VORfcvSY0Y
         jyMh3ojMwKoRTV8925HHD4a5oO444pffetYugdEtoph/kSMRhInmHM2MHlxUHqMYBhgI
         FWdjYwBB8Kh5Ui0+gRZBFbXsJTAbPJL8sNFlI80ag7bimpHsj3Lw9ATAVHdXzn0UHO0F
         A/xg==
X-Forwarded-Encrypted: i=1; AL+hErH1iRbUaZ7xnYKzIC5JV827qVteZkf+Sp28HThiMIVuUDoe2OMyKUZRhjehVmG2awzoFjrSufn34ewdj9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bx0EVxH3Fwm4482CGIxfQ2IbS4fRYo8TBmNQ15J8Pk61M1vOn
	3UA0p3WzRxuu7jQxb91lwm3klIpTN84FGQKkvu5ybBu6TummqKn3+VzFrXvIeg2nIT8=
X-Gm-Gg: AYBFou1fd8oM0pheW0jiEFDRwllHVGU/0IniuJNorGwtPKEYRBol5QLX0DmWQmNfHwk
	SExwsM3Y+fy0j+wu2FCLc+EKAKYgbxeLBVJkwgPwKTst4yjljKsLacY1NJU9Ni3dC6TRlBGwrHF
	XDBYhJeAcWpjqHvUhJP1aRFbr3AlMCEcjZA9RlSi+Jwb52ouPw8ITEDhbgkKytyPxseW/CJ1Tox
	DLX2LOvGkQZqbJtO6svFoNSgNcmueTyLCiVHtC1E8qH2ONLTE86QEzYr4A8fWx/tRgRN6oB/cIr
	EroOLS9nyxitVv3vLsXLGObgSXjs/YOFyBZV63JVRk9n8taOUvBgKcGnEid1miStkeBfPjScp+v
	k3Dkn3n7hWHtWKQXGDO5JGPO4yHd8f3SDrIv/lspur/dlsZ1VDuK+8yMv3rFiVL72rRUgchVQNK
	MQ6dnD+rL4r/kIYqDxUi2T+jfVR5RRzYyxb2hstiy9rNWZQjjFO5KrUexrzEcpelraI0eEcpdV0
	rBzRZVKggM0JP4Y3KBw4Tm+jYGEkmpJ4ow3/oEMi/8mrJ8MbUvuXPYtfjykPo+MguWFqYlexlY8
	ivG8hVYx4nVKiUFeK19G3zSae475r5E=
X-Received: by 2002:a05:6000:2411:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-499c7dfca0cmr4870811f8f.51.1794412179165;
        Wed, 11 Nov 2026 07:49:39 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm11265007f8f.39.2026.11.11.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:38 -0800 (PST)
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
Subject: [PATCH v7 06/17] printk: Prefer the console either via name or devname exclusively
Date: Wed, 11 Nov 2026 16:48:05 +0100
Message-ID: <20261111154816.71103-7-pmladek@suse.com>
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

The commit 7640f1a44eba ("printk: Add
match_devname_and_update_preferred_console()") added the possibility
to prefer a console driver via device name. The name of the console driver
gets assigned when the device gets initialized and it tries whether
it is eligible for a console.

The above mentioned commit ensures that __add_preferred_console() is called
at least with name or devname value. But it does not check whether
both are defined which is a nonsense.

Add the check and do not fail quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3ddbde5326d9..b139314eda70 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2561,6 +2561,12 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  * in register_console(). Finally, it enforces some rules:
  *
  *   1. Do not accept empty @name or @devname.
+ *
+ *   2. Either @name OR @devname are allowed. [*]
+ *
+ *  [*] A valid @name and @idx will get assigned for a devname later when
+ *	@devname matches during the device initialization, see
+ *	match_devname_and_update_preferred_console().
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2583,6 +2589,12 @@ static int add_or_update_preferred_console(unsigned int i,
 		return -EINVAL;
 	}
 
+	if (name && devname) {
+		pr_err("Adding a preferred console devname with a hard-coded console name: %s, %s\n",
+		       devname, name);
+		return -EINVAL;
+	}
+
 	/*
 	 * We use a signed short index for struct console for device drivers to
 	 * indicate a not yet assigned index or port. However, a negative index
-- 
2.56.0

