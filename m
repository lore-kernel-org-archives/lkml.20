Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C83260A5BEB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C83260A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HVuGw24O
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4e814214aso1885571a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1793700898; x=1794305698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKdtG2s6IZ3j7IH/DuwyQ1OpXzzjxl5BXBKUm8dGf6U=;
        b=HVuGw24OF5tV7lS/rJdR15vv8N8owU7Y6aySKXgwyKVOX0chnZXa1Em8+abbAgaekg
         QRGVIf3yUhXI1k6qsWBCyUPwQvq0uVayHZQctHuBqxMcxaTgyfS7odtiM0wb1FrMaxjl
         d29hktLGSKd+nCBvW8Ec60IlmX3fhev7eMo7F2Kkea1rquHKqmI374G7WX58q3xVO+A2
         XZsrA6urKO6PZFd56Sdksv3Ma7JhQYqt/WvxLbVDVotWE5IMvZ1BITOlIcSh0AXfX7lN
         khcexoOY4YghEzIuLoeevP+ARZxwpdanTTYqLgRtMua7EgfPxK8eQKJVJbEvqy1SYsHu
         WkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700898; x=1794305698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKdtG2s6IZ3j7IH/DuwyQ1OpXzzjxl5BXBKUm8dGf6U=;
        b=dZA+AQoxI56EbTvidPSM2XAohbO0hZcX9nn8HWcyqtNEL4sLH1/CvCpXhPNQ4Qf0Ms
         K/h3bjDKJkfYmx/l+ceeLRib//MSMPN9KZQ1jzNpb38acIHbmCmJYrz/Iikqwdc5r3NQ
         hqHn1hf1a4hJGU9S3tnuGSuKR2/2Hxawo11P74m6w+RE3Yn605pwAuyCbeiEISfF8a2m
         25zKjgfrJHaPbEzHtloFxO9sYS4RyfoJPoJE9hOOGbn12TdQhGIz0xWGKKwLCu4YTfzH
         pHXnh1oc98yO/ZnHcU1x8Urhlk4oUsxWyQYsLHaDSPXaIqIAZWuiqqP+VDEa84IGlub0
         s16Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3x/gaZFaduU7fgP0JRgMjyazv+fczskEnQ7sqQt/2SJR1wZfbFH8+ZMlUZjdNtrjZBpnaRUQmf43qBvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u/+wu6Lea3lcykw+BCP0JxnXXjJx9PjJh53vbglMs8GWRvasH
	WbYIQrJJe3yc3TKLwXC70iQ8bNrMQ80BKYdaAbLag7sHE/KMSRPs2Ail10EXrFSi/TIe
X-Gm-Gg: AYBFou3De6mgPDl2iywae2t20JjbzqlaCNKjhZLfYoPamWf9LzT5fJvUlx4BT8HtHoW
	D8Eh45Gc22xcgWD5FdGJ5d6/kYsMf29UiAwgtmU+ME2poPxv42PeO7vHDcq8mCYf65EvP/xz+FV
	8QimOiOsLHLEtZvYWeS7MCqLuJrhOVzfx1YdjACHQCMy2uqRo4DamE3JUBKOhwKSZt/9Yc6r0Mb
	XU5RAUbcosioBk66ntaRMwbwV5ru6qDV1i3ZgyiXkmbMFJm0A4HlWc7R3F3UshyAv/q963Zy9Ea
	pZulrZdSAR7yqQpuifNP2BBLEoLsD6PypAOn2lr68P0TjAlrJQjUksKmfYVj3F/bPvTMd60YUVR
	rdXJcMMHQBZIYNilRpktm0mofJo90didDrV1bqlJP6Fpk6vFVZZjkiWBoHEG9VjARG+xjM3ES3S
	GNQrN9JQ8bFVC3/aMPTn90Ks8epcZh/i5JQq0Uqhwy95yby2EfE5bBD+1vg9v5cDZxOkyAKEMez
	RV0TiOh+FCTNDNodrOiklmGyzgIF9Em0CFasrw3zkRZMjwxAJBU66CtstDE8t73nW8UrczdhJkX
	UaQkpOUzf3IANphX9+l/h1hvTrp98+d1yBfHeA8/5N6fPNfYs4GmGeLxXqXKv2ySdEtNMQw1onR
	9hlgUkgkLpMj0Hsj+9hJe
X-Received: by 2002:a17:907:3f88:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c4ca7a4e638mr1198543066b.21.1793700898407;
        Tue, 03 Nov 2026 02:14:58 -0800 (PST)
Received: from alex-t14g7.localdomain (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cec189195sm69976366b.86.2026.11.03.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:14:57 -0800 (PST)
From: Alexander Mikhalitsyn <alex@amutable.com>
To: ast@kernel.org
Cc: brauner@kernel.org,
	jlayton@kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] bpf: use FS_USERNS_DELEGATABLE for bpffs
Date: Tue,  3 Nov 2026 11:14:05 +0100
Message-ID: <20261103101405.70180-1-alex@amutable.com>
X-Mailer: git-send-email 2.47.3
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

Instead of FS_USERNS_MOUNT we should use recently introduced [1]
FS_USERNS_DELEGATABLE cause it better expresses what we
really want to get there. Filesystem should not be allowed
to be mounted by an unprivileged user, but at the same time
we want to have sb->s_user_ns to point to the container's
user namespace, at the same time superblock should be allowed
be created only if capable(CAP_SYS_ADMIN) check is successful.

Tested and no regressions noticed.

No functional change intended.

Link: https://lore.kernel.org/all/20260129-twmount-v1-1-4874ed2a15c4@kernel.org/ [1]
Signed-off-by: Alexander Mikhalitsyn <alex@amutable.com>
---
 kernel/bpf/inode.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index c6f328e4752e..e8ec41f095fd 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -1188,10 +1188,6 @@ static int bpf_fill_super(struct super_block *sb, struct fs_context *fc)
 	struct bpf_mount_opts *opts = sb->s_fs_info;
 	struct inode *inode;
 
-	/* Mounting an instance of BPF FS requires privileges */
-	if (fc->user_ns != &init_user_ns && !capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
 	sb->s_blocksize = PAGE_SIZE;
 	sb->s_blocksize_bits = PAGE_SHIFT;
 	sb->s_magic = BPF_FS_MAGIC;
@@ -1280,7 +1276,7 @@ static struct file_system_type bpf_fs_type = {
 	.init_fs_context = bpf_init_fs_context,
 	.parameters	= bpf_fs_parameters,
 	.kill_sb	= bpf_kill_super,
-	.fs_flags	= FS_USERNS_MOUNT,
+	.fs_flags	= FS_USERNS_DELEGATABLE,
 };
 
 static void bpf_fs_inode_init_once(void *foo)
-- 
2.47.3

