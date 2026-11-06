Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985705;
	b=5GURTLi8tqpJQvpP1Ib7sBsm2IMfWSvR4ysiQ7XRnavlifBbJWZ+sAd55RB4+FvkjGjo
	 mh3ELGQctrurNQRkKHmp1ojueZVwTJ6h5HUNJlPeOMpclzsRC8eAVhKgxK3UpRH3ezxX1
	 utXaEXqrwmHXFcjX26FszvggALf5BiXR/+rQlyuiA/d5JUGTsEp4zJvJjmCLrhmtdATNc
	 qHTZoVlz59pALt50YSY08HbRFk050htfC4Fo3XVXCYIHvvi9DS4gouFx4PB5AAtTJkQO4
	 jKU9s8/7HtLoNJuyoU206+PoJg+Ug+3Ume0PNKegc9nKRpUCV7/WoXpwQdmZ/5kcudA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NlzrlyRl0YzBfNfAvNCQM9oSO8T32UYnCjBHGgv1B6g=;
	b=RyhqI4RGVXgyjjr72srYRbD+9JGGmNwHAoTEnFV7TG9/nvGEdE68t7QarRtOMcqwvPTU
	 0fg4SHeE4CukZz6ZaLHZKMZty2nNMBJgefuuOIdRMbVQIggWmjKAK1aH1cCGICCYF1rtV
	 xPZMgHkLqy1dbM8tAnH7Je5QnXKoy3ek+GTuvEi/3D/vK5VONTsosfZE09pTdXyVbDuw2
	 Fm3YSBbe4+MLdVKbidWvALdgJw/itId21G2aNKa4FLf1N2IngJ7e/VaBjeuugGnn02C32
	 NBJqGp0Qfcm5Wk60VrAFNjKjYf10yybLKLK48XXmpAGsjK+gamNvJXy2Ib4rUYAvk3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FoEVM2xB;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98362606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98362606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FoEVM2xB
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e46e449e8so574806f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985703; x=1794590503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlzrlyRl0YzBfNfAvNCQM9oSO8T32UYnCjBHGgv1B6g=;
        b=FoEVM2xBqNxg43KIRR/FwOThaR+gvRxi4VKP5axJcQfLleOUXpEBmoSRfWNNxv7ccf
         MD35S5bCNODOFuEp3tNxq4ydAYqn0RKWK9FVl5HwB4TsfceOFfXDWsiWRR9jgMez6HbY
         sBZ4Ui2+72HaUHFbnuF+aUubNYgRGZ7wMQnQI+K1w1e2rE+f/MN5dFRyqWFfWuKq8iwg
         Y8gJAtV3r9/S01ErsuH+nzY90C8VAHV5Ky88ACu6wu3dpExCAFN6nzzE4+309Pa5qxlb
         5QxXSpah4nWel+dmTnq8DAN35zUzvhEgHO9/ow/VH11BQKj6Q0+Nbs42TCXjvjhijSes
         ay/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985703; x=1794590503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NlzrlyRl0YzBfNfAvNCQM9oSO8T32UYnCjBHGgv1B6g=;
        b=GF43KZ97nDErx7+BSHkcCq49wcQf8nLElgnMhgDWKXalpDrvSJjnbKxrBQdsDRIv1d
         CO7/+2PVI9C3fj6qYYBco6CUoNXRAquEUjpF4mlv08e1UolCaeaByYtJ930WUGBw01zq
         53TWmkbXOCaGceqQVzSBHtcwDETTK4QNvp0cxzNGj+2mT6ewWkecFRbpzsZCYGlhUbmh
         mT1ApE1osYSSKv6L7fthjdASg7rBZjZyCpzcY5TK2kkn9qiwkOu6L5pBSivwHhraTwlU
         poxykSzaJ9LxBgX3Ef1AJfUMasab03Bi4r/upqqq8wf1a4eFdflfm5Ybgsg0uzyPXpST
         Rgiw==
X-Forwarded-Encrypted: i=1; AKwUvBwQsoTLazPzLUiXJrIpPoxA/FdVU6snKdJB/QYEJoFEcVfdMDZDEGLee0EEBUJnZBmyz1s3JNTLgEsX+zI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NSPMtx68DWm5iPFi6w5hiSasLq4D4qTx/KbteQoQPxwt3YFur
	vqfGsFN27cpnEkqnZzGVeId+cDYU/43K/YPu3nTvQcGDUh4apEHRFto5nGl5vtbgqcI=
X-Gm-Gg: AYBFou3L0TLXlqpLWIQbpDBT+pw+2a438M/4sQ5nuVH+QBYvWZfppQ+aHURnLmLBTIl
	vEYuPgUiZlslXg2k16PlnXqcJAB53ysvR9eYKhG9YWnaYHDmQqgw46sSaQIxVNVbPKkQOvjYsul
	BbhwiTeypTBBxS/HTtwWmqg1/1pAyV94yYLP+LA2o54e+MOBO1VpZz1hZqKHLEF7+3NbuxMmL6N
	NVeNsoWrocmaUtkkeQR43g6hUxDHD663cNxDHUarLjUrkquHxGjUivWQGiTwlaIL3TKqO8KASzB
	oSsZ8/ebkUBMKYHBOA46VCqNeDXb7io4p20UFaM3vI5ER3mzA6FyfvScSsPD/ELrFfKDv2YU4wl
	IhpeJefAaYo6TrsH0sWDjK7sYBUsKTsEpV3TOwxu05sdtIE89e26E982GHOk2efZOAhP4bMNW96
	hZ+N4zmbjawsaRAeVm/nt0VBsReQZgDAJKRK/Mt+VNVRcu+4tl+Fce+eLvnrgzoiamTYm8JaqVW
	z4NTfs6TvdpzvnzcskAYXYaG+Z1R+my3CEeMiEiQeG8AxhV+gaPw9I8oiqhHcIuk1B5nqb3Osmu
	ROPPqOdGu3OQ3vYOrArC0E2DTeXwVs3UIi8p8sIgdrmTTqTVU7g8
X-Received: by 2002:a05:600c:1d0c:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4b6df9beb91mr57513245e9.34.1793985702968;
        Fri, 06 Nov 2026 09:21:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76d83e539sm6714725e9.1.2026.11.06.09.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:42 -0800 (PST)
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
Subject: [PATCH v6 07/16] printk: Check that index is not defined when a console is preferred via devname
Date: Fri,  6 Nov 2026 18:19:43 +0100
Message-ID: <20261106171952.207909-8-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
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
Reviewed-by: John Ogness <john.ogness@linutronix.de>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index d082169a8615..2c205c454321 100644
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
@@ -2589,15 +2589,6 @@ static int add_or_update_preferred_console(unsigned int i,
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
 
@@ -2611,12 +2602,24 @@ static int add_or_update_preferred_console(unsigned int i,
 			       devname, name);
 			return -EINVAL;
 		}
+		if (idx != -1) {
+			pr_err("Adding a preferred console devname with a hard-coded index: %s, %d\n",
+			       devname, idx);
+			return -EINVAL;
+		}
 
 		strscpy(pc->devname, devname);
 		pc->index = idx;
 	}
 
 	if (is_new_entry && name) {
+		/* A console name must be defined with a valid index. */
+		if (idx < 0) {
+			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
+			       name, idx);
+			return -EINVAL;
+		}
+
 		strscpy(pc->name, name);
 		pc->index = idx;
 	}
-- 
2.56.0

