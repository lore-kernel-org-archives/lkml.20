Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505244;
	b=mYziIlrS9nm8JzIusvu/QFUxaIuUOBMEEGkHC8cNE0ea6JqY2kvSY4fBEhseeM2emXZB
	 eHVHBcXL5wc8arck51pTH4hLnS7+0VwaBrISj90uoJkuCC6Tm0chGaLSC4ee2D6umd7Eo
	 QyW/ZNW5qbSxU0GX/SyKxf/xr+WBUBqEkbZuBKCDZhd6tpyhfqSX/x0GBY7lFOM3Le8WV
	 sA64dPoFLjZ2lS6KOvVqnudIwgq8JpEKdYbrrO7812eZqmFLhLeV9teaHKa3SYbqZcuQm
	 r4n0RJZ+tEgJy3rypjfj/SqseNF+3hsYjxBjlIXetJenxX32tTvU9mjGqLr3KkzYg3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yqzr7T74YopIyEsmLhSJLIYifVJNuH0p+OusXcMit/E=;
	b=uSdDthW1PzDFiByw5w/WMXH/Ahr+cBbrWXDmsVLlkOsDyDeDAAy9dW2E73cImOmQg/Zf
	 C+ixaTj+pNToDH8T/UI9PvxlETneqlAQkkhCRDz1+UWbG2Hr5aQRFHp9pqvma3dkxnhww
	 jTVWK8RAu/LSz0F8Y/R6QCoWfSS44j3qqAOKdneZURv754elm8jtSZQzDC3CXHR2NjX+D
	 0nfmOF/Hiy7Pd5acT3CS2oSVzmeqEJfCyHg4ZM9YrdnhdF7uNiH9aaQV48UjZrOuIbuHj
	 Bx7YQkOehHCGqaYG8qm8mKdXSN74DT7e+oS5aGSmpZWj1qj931LE3GOJKHpSGZ47p2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="H/DcupzG";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB2606A334
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBB2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H/DcupzG
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2553715f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792505242; x=1793110042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqzr7T74YopIyEsmLhSJLIYifVJNuH0p+OusXcMit/E=;
        b=H/DcupzGIPy2rKq5ryf1glRSjAMq3FJyCOsCh7jelGCke0rWrLJdyeWq8w+1Czdjgz
         w04NTWX3yamH+rVRLOWQuq7Fqmr2JwBY/PgaEXOteldXrMri1yI2Xpe9meckMNOvho0E
         iU7an/A5HtlfJNwVITksCfhWj61kYX5yRJ8/Z5DC6yEprPSXs8slCjq/UtJOFM4onqNH
         /E1Rv7meEsLn6Zr7iKGAtjWvMaSKRNFAZccAEmGQGbWL4CwxsDQE9Su0gzg0UQ9/Ud06
         or8a9BIWR606p9ee/G6TgQBFCJWARiyLykGHceQJeKn68aT3tNhYD526jkLFR/yAgmyZ
         jhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505242; x=1793110042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqzr7T74YopIyEsmLhSJLIYifVJNuH0p+OusXcMit/E=;
        b=LIuFmaxXfrZhbbq3R97FMTPxshiD3KRgB9h+mBGiNCkwf9YHQPq86ZNwzP+KGsyZqW
         LTcPm8DYr60WJFYTZAwjxZKC/EOpDyPpeQJUoUUOSreu3QQFgYGSlBfq9+OzUBDwEw2+
         cgpnsw1zu3Nb3qOZ07grDbH3XphPm8on6USeJeej+kcu/l255T25E2wsR6XyAbK+2AM0
         pcZNnx92UCDdJFwtAPJ3cELMNCguh7okgafds9yUYJunDOvEvq5d4vFwfMOmsk8UqyYl
         dhEeqPugANn/904gN+hCKN8urY6BGop/sQZxm0kIeXXWNZjrYyQAiOH0joPcwIc55OFy
         Lk+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzciS3Xh3jcxaWsvrshHLrdISuQLpgtSVFitOb6ZRLaeOnysoKA3pvTGsHB0iTyytecFEnTjeiwzDWCnD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD6gfNmOFHeHVevRjF17BihviNrke0S5eFkKcWGfHaIkeCLOqn
	UpWyQjp+WPJQg1UXNtumdlL2zEJhO/ktPOkXz75V4mhuJkr5S/FYod04iNhHV9f+l+Y=
X-Gm-Gg: AYBFou3trfuQ4Q3SqldAG0rVtTYEf56nlRWfKtfNfVcvs0CJfcB2i8XuHWuLE2qjyra
	R8BcprNRTpp23Nvh/s0uL3mnWXLU/FvVpcKCcvAFnXJR+G/co/oJmfHxDaARmioN7qsm+lhFHxj
	7/tK3Al+XNFRW9KHEsZd5PD/9MAzHIj2GEnnwdhtqYT2VCVSW/2tBVR/R2MOx9fWL2LlSfrFW7s
	mh1M1Dh11ulEvBjnJbojlcMHjr1Jd4GUlKt8J7QKo3+c4p/wk/zVrCoezINipbpLLu7qGyHjT7h
	5GfdQsiq/fqlsf4KHDKuE7IVdr8Akpf5jrnfJjD4KH92nbe+n7U0NTm9j5cfb0LePpssBfeCYQD
	wgZsN1amqYY6SbaNz4laGZaqVx5DJHpWZYN1/NCFFGHUfBQPNrtPK/kfwWSXWPqkWRUYjHIQluh
	fyZtFN6+t/ic0MZzRut3Mk/SY7hpuy6xpsBETUlMbcK1xnKz3N2l/ZvvYAiD/9O3Xt+O8+q3/LM
	Oy3BX4VFGjfKRac
X-Received: by 2002:a05:600c:3b1e:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a1d75f9341mr256235205e9.12.1792505242418;
        Tue, 20 Oct 2026 07:07:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce1479sm75602805e9.14.2026.10.20.07.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:21 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] module: Fix missing taint flags for unloaded modules
Date: Tue, 20 Oct 2026 16:05:19 +0200
Message-ID: <20261020-taint-unload-v1-1-d1c764889afc@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
References: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
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

When recording taint flags for an unloaded module, try_add_tainted_module()
can fail to record some of the module's flags if a record for a module with
the same name already exists and the two have at least one flag in common.
This happens because the function uses 'mod_taint->taints & mod->taints' to
determine whether to merge the new module with the existing record. As
a result, the final report may not provide accurate information about the
taint flags of unloaded modules.

Fix the duplicate check by using the stricter equality comparison.

Fixes: 99bd9956551b ("module: Introduce module unload taint tracking")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/tracking.c b/kernel/module/tracking.c
index 9033ff54c4e2..5bcd1c2701f0 100644
--- a/kernel/module/tracking.c
+++ b/kernel/module/tracking.c
@@ -27,7 +27,7 @@ int try_add_tainted_module(struct module *mod)
 	list_for_each_entry_rcu(mod_taint, &unloaded_tainted_modules, list,
 				lockdep_is_held(&module_mutex)) {
 		if (!strcmp(mod_taint->name, mod->name) &&
-		    mod_taint->taints & mod->taints) {
+		    mod_taint->taints == mod->taints) {
 			mod_taint->count++;
 			goto out;
 		}

-- 
2.55.0
