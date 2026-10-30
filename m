Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361224;
	b=AShyjXv+U44Nze6tWcZb/9v8NL127Zwe67SFF2lymE0AKNNJSoq4T8PieKt+VCswMNlO
	 frj4TMjzVSncIvaMEc6AGbfaqPg9h4MKIY2UZRXzW3H8VUz3wQkGcrQydV6gt6JgbV2tR
	 Vph5RWYXw3nEXQF4r3ENZnRkU4xh6e2UDLq4ekd6thBwxlKlWS8H595UoSMKAK6uHAu5X
	 UvpNdY0yR4DiTOh+UiaHB7LmEX+KYOnjYozCM/++CT/vaKYKtfx79rhHogO4NWU6KY3/P
	 SQbn3G6pjCjLQIrst85qXDdVPAxChbff/Ac7ll1QMggRrFuwgwCvmL9IcnLQw4WhuOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6ruo65qqTejJkM60HrkQCd1JUBkgnydByGT5wOincoQ=;
	b=ObB0XxKgBOkkSZAZXehYl9aIvAIZycnnrq5PrgqavoaLvPxz3o6snMmPgQ/ShU53W9kw
	 rg76mWdQz39JwBcXDXwmxc9+zirdQmLD7XiN+PLGSFq1kJ6S7NEiR1Dokr91eFnYAf4oM
	 sg2omSljfhLUJ5GYQh52cIv8tndhTFUSAZoU1/K5J4aino1XMAIKMvYYni050TEYSvVTK
	 lV0lzR3s7MtbFH+qfQkKfxOtSvl77pzRD+7MAlPSAPz31cRyEnSfncnXDJscb5SU2CS30
	 qWtPow6h/Dz55jkZVtgpUBhKOLXGh2+SDsyltwQkNOAqbOWL+sVjvC7XiDNf03Q4yaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F347P88d;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD9F607085B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD9F607085B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F347P88d
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so719813c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361223; x=1793966023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ruo65qqTejJkM60HrkQCd1JUBkgnydByGT5wOincoQ=;
        b=F347P88dkcNAwI/Py3aXKr3+GIgiMhP4IWCqBMWkNV7OXrzJ2M6pEPoVHM6sqTsaUm
         XD3pg/LaMNPZv3sPxiypCmqUB7mvFhieZnQ3uMqxCM04uVto9LUn58B1wIsAi9f5ETEI
         j/QbfrJeNkLI+V+SjFVhhufAkqxtCHXaHVMUvv/i4Tezyfe+uoFsXv4MGwcdObizxLZW
         xE9jFwFHDEE4lBlq0KV4ePg2oDqRbNpO4rQ3beNX2yPaOCWWKeDnS5gCLTaA9q4ql/v0
         euV+/1RoBqCqKFpGP2EJNp3zXpht0aB2Y5WecI6trv1GqOb9rj99mAvbV0gVgboQzIyh
         UWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361223; x=1793966023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ruo65qqTejJkM60HrkQCd1JUBkgnydByGT5wOincoQ=;
        b=QpCdks/La4SXlQSlBUctgULiN9sTjNGRLpYmjDqzfRh1XYY/n7t8EcuxZomksRGCUv
         vrQnsoJcywR5dKaOXqCrE/2sb2jp7+0ou8hnie3i10TmFQJ7tJfzHY7a85vuc4bHjzzE
         AabpYETB++sSV5oQMV9CPOI9UDkOUTRDWyv/s4k3dPUIxlYohvrmjDJZTQ3sA0Iyq2kq
         sh12OWZ2eqqkec5bhsL+sQCZFMDmIPIVoBOPp4UhP4g1SAkTyCC+/WL5om2IdzMq2DHy
         x1WsHIDiN4W/iXt+kJdIOc1nugay7df4OunyM0CWadlU+/i9QQ8Siy5rjco4LwiXttjT
         QVaA==
X-Forwarded-Encrypted: i=1; AKwUvBxKyGLs/cSLmwDEl8cxuNc6uYfDBZ5DWeGkxLcbiWHzMrnInBF3i2tojAuiWamOPI19p3s+JKnyn4QGGfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIww0hdWprv4jxibGcjimhzWaParhq/IUgysCZvS5AN2YgOSg03
	F8OoywNDVC8/izAAyAVeafPERoOzl5rM9NsDrEqhwqlIBbRzW0nulDbkrRatVJnI
X-Gm-Gg: AYBFou0MWc4VAVBBPybYkmI0zuCn5EcC99nx2qrAYCgPoKIEkuJmO4+S9BUXBWXPSVe
	WsTF0kTqtw6R2P/3Uva4Am0wu2Fxe9XFWDiuSdCkfx+7wv295tEqUnBquWur9bskG0+tskt4ir6
	pKFTOwpQOFcZEvjFcmGRdKNlKgGpGl5AzSa/Zl39urHCK1J93bInZzYFxhXxnalpBYiVXnk2H1E
	yy+MY1BY6ViV+n60SK17X1ZHtUdcgWaG7XSjVgCkMRWWv2a9k+ACbx4VSoEEMEpodSPhfQeVkBY
	HpPnx0pBcLzLBp6CHzMZYuoT1mEVhzSYS0DYT9ciZA7wTc2YsOFfAWemtGIm9cu4AQfCgEoZ7Z4
	o7T/FH3cMXTqLtH4X87joL5DDLHDIXOiiVXD78LwI334jeb/wiOqdibbvzn3Lh8ZcxQDPwFZyuX
	UbR0H6sdb1WlTMrzE8mmhXVP7zOUS3HawQYZf6z9rMi9bHwh107wG6lzboU8mUah+Tdi9en5nfR
	LiEihCZTWIDh6EIphNT2I90UH3DUv4/gQMQoYz+4RIJMfipg3pmDyOQVWLSgcqXBJA12m2E2t52
	FnCXxgGcORJgerwdMWXGk0XhcyPSnuFfVpMVRr6h9TNBOg==
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr3095742c88.46.1793361223437;
        Fri, 30 Oct 2026 04:53:43 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:42 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:03 -0400
Subject: [PATCH bpf-next v2 18/22] bpf: Apply the patch list without a
 verifier env
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-18-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Rewrites outside of the verifier, like the blinding of constants in
classic BPF programs, have no verifier env, and core.c is built without
the verifier as well.

bpf_patch_list_commit() needs the env for the aux data and the tables
of the verifier, so these rewrites can't use the patch list.

Add bpf_patch_list_apply(), which builds the new image of a program,
puts it in place and moves its poke descriptors and line info along.
Without the aux data and the tables of the verifier, it can't remove
instructions.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf_verifier.h |  1 +
 kernel/bpf/core.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 9562665757a79..b133bbaf614ac 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -1118,6 +1118,7 @@ int bpf_patch_list_build(const struct bpf_patch_list *pl, const struct bpf_prog
 			 struct bpf_patch_image *img);
 void bpf_patch_image_free(struct bpf_patch_image *img);
 void bpf_patch_image_install(struct bpf_prog *prog, const struct bpf_patch_image *img);
+struct bpf_prog *bpf_patch_list_apply(struct bpf_prog *prog, struct bpf_patch_list *pl);
 
 /* single container for all structs
  * one verifier_env per bpf_check() call
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 0447e3b4cfa48..10d2c37f81280 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -880,6 +880,37 @@ void bpf_patch_image_install(struct bpf_prog *prog, const struct bpf_patch_image
 					      prog->aux->linfo[i].insn_off);
 }
 
+/*
+ * Apply the patches queued for 'prog' without a verifier env, which can't
+ * remove insns. Return the patched program, which may have moved.
+ */
+struct bpf_prog *bpf_patch_list_apply(struct bpf_prog *prog, struct bpf_patch_list *pl)
+{
+	struct bpf_patch_image img;
+	struct bpf_prog *new;
+	int err;
+
+	if (!pl->cnt)
+		return prog;
+
+	err = bpf_patch_list_build(pl, prog, &img);
+	if (!err && WARN_ON_ONCE(img.del))
+		err = -EINVAL;
+	if (!err) {
+		new = bpf_prog_realloc(prog, bpf_prog_size(img.new_cnt), GFP_USER);
+		if (new) {
+			prog = new;
+			bpf_patch_image_install(prog, &img);
+		} else {
+			err = -ENOMEM;
+		}
+	}
+
+	bpf_patch_image_free(&img);
+	bpf_patch_list_release(pl);
+	return err ? ERR_PTR(err) : prog;
+}
+
 static void bpf_prog_kallsyms_del_subprogs(struct bpf_prog *fp)
 {
 	int i;

-- 
2.43.0

