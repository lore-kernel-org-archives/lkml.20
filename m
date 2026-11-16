Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804339;
	b=KOugOdl8dbNHYbM4iHnX8gofzAGnysh2XlbPO5hEZpMwwxSWO+lRNVERjf29C+jwwwb8
	 HT0dgf9JiSOzkY5T6Zy64iIjROomoUxVNjBtVJ75hEMhr2Hrvj8eMIDLwmjc4yEDHgRKe
	 w0kRL1uTdwlSW809cHcMH8SeMC4VKYQGiRHdWXvxxkc64pdNAV67s/foHSaeYb1eCu28e
	 uCgJEtUFdMH9Wn34rtfAQ1Gq/y1gBUiuZEcjag/iamh25zSwkz0KpPfxW2Ay4GUojmnUP
	 AdqEjeoovkh3i4NbF4DMn80wwKvRBJAffM8RQ68580uW3IoEQwGgolU55Ztvk6JfM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ec+zOuX2/4uGXoYQx4K6Gp4ALgZ8Wm0wKK8/NlJwSAY=;
	b=wsRLG3rgz1ufU8/mUbdKajtomoUPvQU9wa7U08/9Q1FdVp62NCiNShIbx5UmWqz8AWq6
	 ZGGg8a720onmsZmZ0NfHXAAc0Zd94S7lNDM3wfRz7/SEU1MqZ4TDONfhRv5roc2V9VTfy
	 glXJtGknKx5COw5nD8xmC1HmKWNZKO3PeFg5klBdAPnP5OFEqdLnU2ycLO6wg360fz8NL
	 XRyf7sBuUUsO2FOPAzPm+mNc+Jblppu+NKwzq1ncdVVYop0e+JptL6jfge+zOwhqRFaw2
	 gIwXHmOXHrL52wQuSRDqXVkRcuMm6VRwY7vvf9tvFFXIaYmiE3r9NLzVsR24yZBk12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNoqf9wz;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF78606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF78606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNoqf9wz
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2708018c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804337; x=1795409137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec+zOuX2/4uGXoYQx4K6Gp4ALgZ8Wm0wKK8/NlJwSAY=;
        b=TNoqf9wz05Lzm3aTExLxVhy6/mWh3w7aFIgKXYAVle50jREqrlZ9rKJnj+KQc1UVI6
         hHp+jmF40HuTPbK3eQEio/MnXRFMKVurvVp6wP+S+tIJc+mOb3X4iMuU1RJefJVKnteq
         fPycibbhRaZL2OUNxlyDWp5dqkj9IgX3jtRnWTzQNTGp4Besc9LR10pOXI6BmQXfT/NF
         u8E21BBGPHAew8raNRK7dwVdmv+ZTaPVBZhY8XSQP+rtM2DnF1+BTew+wa5G2jy4siOw
         N6mY6DqM1/+TmaqcAe49dEKMd5LjBtHeHvRfXdYoAst2c/w0Atjgda2yvioXloFwrONb
         3cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804337; x=1795409137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec+zOuX2/4uGXoYQx4K6Gp4ALgZ8Wm0wKK8/NlJwSAY=;
        b=Ys5g7FGHGYGpMOSIDXH3er3iE5IkdLg0GsjKGLP1yV5xQNdSlK1yg9XoVJ0tqNI+Az
         2waafTwf305NFI5RQsPVZcOQQJW2gtDHljkqsOisOvzkpIOOGaNo7NDwrMU/smNrGMV8
         R87ysNjd7TQ3PW1kAIDiWYRI1Cze6hnHWS0T3OQ+3oHXf5MX81tClYYzWX2euFAf2YJe
         yclkpGYyFw7AAkRUyOVBIiB09iRiN4w1j5f/PMxIw4QjxM/z7WPrUl99JV3cXyadfAUD
         wr+2d3wVHYtY1hvyC6kxyYLIghjDRw6azH+sTNZGQrJ+u4p42Jir2Gf2Fux+7PZuAGEC
         R/Vg==
X-Forwarded-Encrypted: i=1; AL+hErE3Rw9k0oJnbdGdvlvp7MsNL2t0IEQKqbVKtvg4LZ3o3pBfu0t3SS4DN198TC5gW/ZhbSS9Wp3eKYI26/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zWrNmBQNn/ub9pxTDq2Oj9LUxInNcMCnVfsNfUn9C03mwehBB
	YK+fxFlo5jO11N4aJp9rnuU0F2euZ4OlGwCOthUHepcEozZ4tq2lrgZH
X-Gm-Gg: AYBFou2M16FLwUH7VwsDRKFI+a9UYn/A9MtnUT030NSRw81MVjKNqao00YKbQI6pS2b
	LxXPGX440M9ujP9m5ncFDGseJiPvSanNvHeOOGW53K88JSMGSXHLes6mhQ8IcuWYOO0SOqaTGRU
	U9ZmuqSPwl7JtRINfyFcUiZMzm2v4whoypOkvDvEoOmLtXuEOBGiIOynTffy9wopLJl+7lmyMQp
	OLReHqHVc50UH1KL633x+Xwil209YHH5fZ3cPRHozlfgVKTb+l5aE9TRoC+aVYr+W4I6vXv7m+1
	FVuPpNIj/ECPjowncbFaAXK9fCjrYZ8rtaAbGrK5zq4pQ9uNl72YAdKkuIRa9JLG5jUCzCQXDFp
	9NW+vIhD982k9LVXR01OvBWG29NZN5buwX4CpFyZWUkRwdMpCs8+CakkRnYrDPg95X3uNCuRK5Z
	dmQKrnIu1tjbjLjsn4DMU+eGyXtzGcQnIovDyNQxXb95Ne+h1yDg4+8+yUHHOv3nPjLuPcX0BKs
	mNEou+SoPzhDIsy5pipXk/guT4zvQjc8oFMGsMtTZmMsIUlAFe9Wcdvn0jYTZgNxDOiui1ibPra
	BlElNayTBxhzW905H/dOdgVZzW18bsij02er15RhyKQkADZSKfrP6lBYW05qv+pT1I6v
X-Received: by 2002:a05:701b:4250:20b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b50312e4e7mr9645077c88.34.1794804337463;
        Sun, 15 Nov 2026 20:45:37 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm28011373c88.11.2026.11.15.20.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:45:36 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jeff Moyer <jmoyer@redhat.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/rsrc: keep the old file when a file update fails
Date: Sun, 15 Nov 2026 20:45:31 -0800
Message-Id: <20261116044531.281978-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

__io_sqe_files_update() resets the slot before it calls fget() on the
new fd. If fget() fails, the fd is an io_uring file, or the node
allocation fails, the update stops and reports that entry as not done,
but the old file has already been removed. Later requests that use the
slot fail with -EBADF, and if the old file was registered with a tag,
its tag CQE is posted as if it had been removed on purpose.

Reset the slot only after the new file has been checked and its node
allocated, as io_install_fixed_file() does. Removal with fd == -1 still
resets the slot right away.

Fixes: c3a31e605620 ("io_uring: add support for IORING_REGISTER_FILES_UPDATE")
Cc: stable@vger.kernel.org
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Report: https://lore.kernel.org/io-uring/20261115163612.225619-1-teel4res@gmail.com/

Runtime-tested on v7.3 with the closed-fd update from the report.
__io_sqe_files_update() is the same in io_uring-7.4, where it is only
build-tested.

 io_uring/rsrc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 8de5737d223e..0b811d3c9c0e 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -363,8 +363,6 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
 		if (i >= ctx->file_table.data.nr)
 			break;
 		i = array_index_nospec(i, ctx->file_table.data.nr);
-		if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
-			io_file_bitmap_clear(&ctx->file_table, i);
 
 		if (fd != -1) {
 			struct file *file = fget(fd);
@@ -388,11 +386,15 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
 				fput(file);
 				break;
 			}
+			if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
+				io_file_bitmap_clear(&ctx->file_table, i);
 			ctx->file_table.data.nodes[i] = node;
 			if (tag)
 				node->tag = tag;
 			io_fixed_file_set(node, file);
 			io_file_bitmap_set(&ctx->file_table, i);
+		} else if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i)) {
+			io_file_bitmap_clear(&ctx->file_table, i);
 		}
 	}
 	return done ? done : err;
-- 
2.34.1

