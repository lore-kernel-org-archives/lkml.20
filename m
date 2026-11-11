Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412193;
	b=337rxna26/x0f/6jTn0TemieINVmBicOEX1H1+NDtPpl3C5ATXGOVpKTJqsSI5XG+8Rv
	 h9l1LwAsTxhAkMmQkQLgWxGuBXEWpsnJ0Dg7HHag526Ejolqj3CEJKzZ0eNuIxjQICvMj
	 N9+esVKbRcorGkpZFqTQMON5vaUfQhd+9qJ1cCEyiS8qBFsuLrRagjjmNu/qJnfM4qIh4
	 D/8Y9oKkQKWNj5SpTAZsEm6LtcqojBaeLNP2e5kzHE4Nq51iY4F//dz76W/djvyU8GEXT
	 UyfB3mZSdO+3W3Wxc+3x3lluhRYfVTe79gBvNLkKDznvN6UvA2mZP6cY3/asK2JVO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Aig7S1zIbGsC+gFokDGEF4ZLsKvWTk7KGyKPmaUhUqM=;
	b=wLdGwJ44dN55wbAfMeys2ZuBWkmDw80Gu3yixwriqhgOv4fImb+AvXtPwWxetaUdvyBD
	 Yri7nwRJTx5U47vhuPbCqqQJRIY7uDhtiRlmubzGWTHA16HSj8zgAKzzlTT1aqWM9cqWa
	 1qZmX58fk2hvPs0TtKjQ8XT7ysRRYQM1A1Ne3M8tF8bkRmKl3eMZjhj1ePDC8MfrClsUs
	 3FJveYgp0AHIYY4gkogghN4X1DiVO7L/oKQZPp8WIoT3jchmO3VhZSIJuuOcO0tUv9fOp
	 8Bmn75YVMdMRzzml37u+sBNv59vQ5xD5AB/t7a/H+CLEQ1wzvycYhleYQfTsB0sQxbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NS59caAO;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E072606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E072606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NS59caAO
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1812079f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412192; x=1795016992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aig7S1zIbGsC+gFokDGEF4ZLsKvWTk7KGyKPmaUhUqM=;
        b=NS59caAOLEMivgpkg9ToPSbEXJpJ6T4FtMwjGYhMSDYJ9mpY/dcWL99l7tsZDBeIfL
         oYfRjYUnRIg74JTIxc30aZwpGY9MmWFeiNMI1kp46c/jfxQNBOKQH9Yk6VcbIotnESSy
         BBtawzwlLgIQXqZBFimDwwgTllknnsNa4fzuIVKFWXH23UOWOT6sEK0c5WvUyQ7wWCV2
         51O3XYhObsN5DsJFs3thB48QXOXdZDAQzHfubE+lGhyD43XSX+De6QskY7cCX5J74gf0
         KpkBjLSACGWJNScCZC1QCZvPTo506arbxH+sdK3zwWzxsz17ok39Be5ClnEZ6R+mNRfq
         QKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412192; x=1795016992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aig7S1zIbGsC+gFokDGEF4ZLsKvWTk7KGyKPmaUhUqM=;
        b=Pul3EtLRbYvyuysCY5FmYMhGnhXrJh8peRapxLvq2XsdfdJmbcDebQkBLsLfwRis2b
         XEUowXcUklgn/4DbArWVdYdO33jroqHw86MMQm16XrJ3yEnehK9FHwWVDLzIHU0c3jv7
         GpCIzUufrAe2HY40EvnQev2H+0F0X4n+YP5RYovJA91PASCaOhdi8Sx601Emourkxchj
         sE6pbp8/IGvOajXm0Zgj02mvgCs10+3BeIE5i5fwteh3G6pHGPYm7e7Jh/bheUWUWBub
         VKV4BZ9jLxcoimgcBoSFnoFS0m9NfLV0vDkUlfGdXZkYxJnaxttBy22zrVUIMmNhEmeY
         dlAw==
X-Forwarded-Encrypted: i=1; AL+hErHi/mFP9WPlaRvZGrTnMSvvVSgHSt5jcA8hlWusJ4tdFXPYr+IbxkNLQhFGf5P8Nu+aNG76z7tYT4dxUbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/p1ED4jbIISuidKkpqbdD6iUbupm0LIBmhUHCJsLYcAWaFxWy
	xq6v2I8FZSzXTOOCkqvHTg0X9A/AIV4aj6Du+9HGKZfIYaXWh/ZAagX9JjQpRH5lon8=
X-Gm-Gg: AYBFou2pQXatG6/xmBwLCbthXyxKe8e6TSg1tur0v+9l2BrckxhhyeajK3ohMBUCrlK
	EoNE3yPnFaZ3sAQP3qz9t976gc7LNycZaMlcvcu2noOqLvP14lrShgKfvPt7B0/khHFQ7VC+uKX
	CWe9vuvJrviRfgibhIpwuzW13QzTFNO2XxYfZs1fU4LK1e1LnYRG0N0qOR9PXMkpDOr1eMm439N
	oIIP5opEDGRjugFw/HQnfPXgd97LvPqsAWy/evh0BNLPJRqkztVKxTfS7e749ml+Bm14NeaC7Ns
	fh3CGI5Wz1tkxqmo2pzcTqlAkHyPtxzFyiStO7fRzcV8ff5GFQfeu7Nc7PaT/EIzLYSEA+KCwZw
	RC1xGv2IWGCgSfocJmWIJvKXkBS+n10hyuX0y4+MGmailjdTFs73WuV+H3sU7c0z67IJyP6sWUN
	BGZzpS4zq27a0V6uxJ8iYRVvcy/E2A7zeUIHFOf7+m+gB0uci5f/Pgxlj8dir6SAUntbKVcDiig
	4mpzBHunX0djPnVWDfFJQxPHAE1NVda/XSu64/36hLfDq6qSveSreakdJRfHkU9LOZM1/AlDBEH
	7w23Ssu9mNpU61lurSM1cxsh5VgVyvg=
X-Received: by 2002:a05:6000:2612:b0:490:2bd4:5c42 with SMTP id ffacd0b85a97d-499c86a110cmr4323289f8f.44.1794412191498;
        Wed, 11 Nov 2026 07:49:51 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm12358252f8f.51.2026.11.11.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:50 -0800 (PST)
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
Subject: [PATCH v7 07/17] printk: Check that index is not defined when a console is preferred via devname
Date: Wed, 11 Nov 2026 16:48:06 +0100
Message-ID: <20261111154816.71103-8-pmladek@suse.com>
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

The current code makes sure that a valid index is defined when a console
is preferred via a name.

On the contrary, the index must not be defined when the console is
defined via a devname. The index will be defined later when the device
matches and gets registered.

Enforce the 2nd rule. Make the checks symmetric in the code.
Do not ignore the errors quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b139314eda70..a76f37c1b431 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2562,7 +2562,7 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   1. Do not accept empty @name or @devname.
  *
- *   2. Either @name OR @devname are allowed. [*]
+ *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]
  *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
@@ -2595,23 +2595,33 @@ static int add_or_update_preferred_console(unsigned int i,
 		return -EINVAL;
 	}
 
-	/*
-	 * We use a signed short index for struct console for device drivers to
-	 * indicate a not yet assigned index or port. However, a negative index
-	 * value is not valid when the console name and index are defined on
-	 * the command line.
-	 */
-	if (name && idx < 0)
-		return -EINVAL;
-
 	if (!pc->name[0] && !pc->devname[0])
 		is_new_entry = true;
 
 	if (is_new_entry) {
-		if (name)
+		if (name) {
+			/* A console name must be defined with a valid index. */
+			if (idx < 0) {
+				pr_err("Adding a preferred console with an invalid index: %s, %d\n",
+				       name, idx);
+				return -EINVAL;
+			}
 			strscpy(pc->name, name);
-		if (devname)
+		}
+
+		if (devname) {
+			/*
+			 * A valid console name and index will get assigned when
+			 * a matching device gets registered.
+			 */
+			if (idx >= 0) {
+				pr_err("Adding a preferred console devname with a hard-coded index: %s, %d\n",
+				       devname, idx);
+				return -EINVAL;
+			}
 			strscpy(pc->devname, devname);
+		}
+
 		pc->index = idx;
 	}
 
-- 
2.56.0

