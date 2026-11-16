Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822187;
	b=lDLNx7GHGUfknfP5422I3pZf2rORdO4k2FxAkC2B4aMlLFFS/N/JRg0KqmmPRrDWq7Tz
	 t/ehoKk066+Zzhz9vNibBv0xaiqINqapIFaBbiTozsx6Z50M9o9XqMG8TRcrPIwHmC7By
	 W1cdtilVwOvfBBfn9HvetN4nJbtVaV5IM/PSjCdvUgye/FklZfsZhkLXGA0D5ZhvaI76S
	 NVFr7Nzb2rZIWtMCRRAiDdUjs6GJSuqFO5cBj/YbNazGUY/hcTj9jpu24eLpNALC2C2Fz
	 PKhuAid1qnmVyWMTfdOpUARtGfnPoBjUYzWuCkaaxD6dmItreielYqQSg6JcQzOkvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vmKj9J6/J/x0oEsZvbHBsUQKkmVzTWMXODXbHwKBqy8=;
	b=47eOcGQY1mmn6LoZwiAIktx/FgoPGfW4M9GeelKI+eyNzbOLrmuQTX37ezAr81mWd0GO
	 6RD/l7Guy++orGjoibW2+0zCaRRNn2N8Dn69qrk4r6mm3AN0TaTIl9/qYSUqqrC9HVHvn
	 2+aBypW2/aT1Yn/TNt8LGkE+rRgoJ4nn4aAnlh3ogvgAR95WF1dBK01ZjZHtjy4MNrNLn
	 S0y3GM3H1ibc7gT17993JY8lyebsfeSC2I8+x6pHsW32o0A/JZHNNE6GEfxqvjLy6D5rL
	 XqeCLI+O7jGbC0t8fpkVINwt/WIq7Op1Bw52hNUOGWP7FisTUejr5MO86ZGkPzhbQ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wwXLA4Xs;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A83606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A83606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wwXLA4Xs
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1062313b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822187; x=1795426987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmKj9J6/J/x0oEsZvbHBsUQKkmVzTWMXODXbHwKBqy8=;
        b=wwXLA4XskinKh44tCU1POrx+zQjVhpn6RHSzAp3vMuCuU18A8Q2IS0DtM4D+Aw1VCc
         zhAJWcDJMswELR+KS3bCHozicWzoK2WZOkQgM2YEnrnb4YYUgM/yUVOX/GcAQixbGVi+
         bNVRpj9XN6VQwlmg6s0rSGl7vDSiy/F0NeIHNQ1Tui5qkNY90PlBYjjtRlrULok5n0wJ
         NjQuXiXow1Fz2CyU+5CtScrEZY7LycYMX1fL5M7UNWsR7dh8z10NSCw4GebhskI6ghEU
         9azK3t2vzX6du63OWbp/cXS94xW3ZAebb3h2FEr+/IlAOKKFt24eLWfmB4ygkMS3jLnO
         RVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822187; x=1795426987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmKj9J6/J/x0oEsZvbHBsUQKkmVzTWMXODXbHwKBqy8=;
        b=vZ3B1zHtTOx/fAPDIGuz7IStvores60yCp84rQdRzV7ldrBavk/kxJHAJqrJQ9vRHv
         eYx8Kwe6DALudqMiXw192Qo9WsPdvFx42ebwhVPdPLdhbsyJuxszXH11ileYzoIjZNPa
         8IM/Ro60nqYNi83OaDIWjlDwchve4ZfDHRfJKjNhdZRuaRI1KM/5/6RCiXSJcwSfq45I
         IG/Uru/2skYkubXmiUtZRpsMGRh6fwEtaDGfp7IYofybZE0sed6XlDuNgSVU+VKpxvDj
         bmmUmQ8JmnRBiYAeAxGO3doOTme4rAvmKGnWXLSNXJ6sF6Lc537l/1bjQp/nSMCi7atd
         T2YA==
X-Forwarded-Encrypted: i=1; AL+hErFUogtDVD7mpIdfuYZdxMbnsKJkqAX3Bd7sknDBIDFLc9PsfY9g5632V0sHlJwFm+T8TdjGZFUgM5sGiBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zpudej4JXG0yZQKaSNH6zp7vY6ZKRConKuyFT37OaW2S0Wni1
	JgKKGvuDvntJBSO8alJVgV3BuCfafYcFyzuOW3gpHt+BW8JXlTij0icf
X-Gm-Gg: AYBFou0wFQHKOQ10+zyBTVI0lNTf0PRieAL2CGuHUk+6kUsaw2jQtOd+KUMjBbuXl+Z
	+WKjU1pD5M/7C/fKkyujwqg35LPOHEimsUapAse2SskE9HHtVstPyCTd7mdNGzVHCUhCSq5Wsqw
	Po+cTNkEY1zVsE/ABxYWzHP0uaozS4RJ7fP3pMVA+fkB4kI4+ooibGggd55Q6X+eLEWe97NEppq
	qXSDEknpC7cZiDVZFk4F1vxzYTkcnqtERkgSBElyvr8CIVDo4kAT/t0Y/tDqCUbj4L8bOI7KkCg
	rPBZAH8LrcXhnmCWPOdkSOavZs+fySSDmYnTSO35RxdgXOjXNI0uCznHRpJwgzzZlrk+Go81imd
	dLsjFmGMpER5IBTSbOW9ihEimdGlQdDYD+GQ0CKPea65oRHD3eIMtOhuW8g0WXl98yGKzYDTXUJ
	NFWZym4ZwXOILLJtoUAT+XwpFYyG4siS7JKVBg3FSKyuw5tI+sJ+j3jumKg1HgEbX0Lk9zN+mtB
	0/53UnPab1RLgtnMKjQi7LTz1Nb9EQeQldxn6r7cx0zdGlmx70/UjOqHscyBgF2u7cXygiQ7W2a
	K43iB5G4mURiCqehMb/Hw1XK45dQyis3pl7jyzrBxjLP67+8RukxDMJzkd4WkZ9UNmOk1yyFpWQ
	M0FqB94ZHzmR2F+9Kag==
X-Received: by 2002:a05:6a00:1989:b0:89e:b12e:7eda with SMTP id d2e1a72fcca58-8beb21cd892mr8957701b3a.7.1794822186847;
        Mon, 16 Nov 2026 01:43:06 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 16 Nov 2026 01:42:56 -0800
Subject: [PATCH 4/4] sysfs: simplify error handling in create_files()
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
Message-Id: <20261116-sysfs-group-invisible-v1-4-94cd173a7d9a@gmail.com>
References: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
In-Reply-To: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Both attribute creation loops in create_files() duplicate the same error
cleanup pattern by breaking out of the loop and checking the error
status afterward to remove created files.

Consolidate error cleanup into a single exit path that removes the
group's files and returns the error, returning 0 directly on success.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 fs/sysfs/group.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 699c2f9e8926..b90ba546dcda 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -51,10 +51,10 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 {
 	struct attribute *const *attr;
 	const struct bin_attribute *const *bin_attr;
-	int error = 0, i;
+	int error, i;
 
 	if (grp->attrs) {
-		for (i = 0, attr = grp->attrs; *attr && !error; i++, attr++) {
+		for (i = 0, attr = grp->attrs; *attr; i++, attr++) {
 			umode_t mode = (*attr)->mode;
 
 			/*
@@ -81,11 +81,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 			error = sysfs_add_file_mode_ns(parent, *attr, mode, uid,
 						       gid, NULL);
 			if (unlikely(error))
-				break;
-		}
-		if (error) {
-			remove_files(parent, grp);
-			goto exit;
+				goto err_remove_files;
 		}
 	}
 
@@ -113,13 +109,15 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 			error = sysfs_add_bin_file_mode_ns(parent, *bin_attr,
 							   mode, size, uid, gid,
 							   NULL);
-			if (error)
-				break;
+			if (unlikely(error))
+				goto err_remove_files;
 		}
-		if (error)
-			remove_files(parent, grp);
 	}
-exit:
+
+	return 0;
+
+err_remove_files:
+	remove_files(parent, grp);
 	return error;
 }
 

-- 
2.56.0.679.gc527c65306-goog

