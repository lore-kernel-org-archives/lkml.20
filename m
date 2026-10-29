Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283158;
	b=K/0IlEabiN2CvkvMD9cV9LwputCXYr2ppR6i6hlb5LQmkWVxaK8VfHU6Bz08LuwiehBb
	 B4Baw3JKQ2vUpZZDatt6s96gejCmOY8Bn8RL26H3nBDoiOMz4uWwjeGLMSmixfrhOcAMf
	 cFU6DRfpC52JV4KRYtYF0quHBN7cM2+sT8Is3dqKaVryNamENqq9dEnRycBt2MADmBAlV
	 9OAxbh7GxEy9IEYFARNxBdgpZ03yAK1E7VEAQUlwKOaTdWJXaIhG28RBFz2u7KxUsK3Nt
	 VnKZm1KC5lkCPxZXCAAG/XClYoEjC6n3dzGxJ7Df9wYR2lylFURLfAX55/Pjx8GmlaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7A/hGTgPYtJhS8Ny/Fs+sia52LCj5jd5ywQ/PUXMFFs=;
	b=nMIB/nvbk6ysHApMHTyv4ht5GeMxGfz/QGO3gKPdjKeo9aZh8V7e9qlwtVZ6Yeg/jcGD
	 RwgK5VyHzRA4Id0V9zt5g099UgBte1V+Zd++MEWFGnq2ciHpzVTPWxAh+JFepTpAG5WO+
	 WHtveMVda+OMpyHzsR8Ptw3oT9xMd8su7xjie57ChfQUntpXj5l2hEPE3qQWtguaVJCkz
	 rZAVWRXdpbvuis0E60l//MsTQWlweizJCOD5a9vtEWpweCYcwqNHZQej59ZuYIHiIpsSo
	 qPeBSw4nCfzlhhb6RtYcK13yGKVqZgrRWLnYPx/wCSH9jJUtNhbg/0/9HhcjVr5qYIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xe7+SWT5;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC2606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xe7+SWT5
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35829219da8so987160eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283157; x=1793887957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7A/hGTgPYtJhS8Ny/Fs+sia52LCj5jd5ywQ/PUXMFFs=;
        b=Xe7+SWT5tfrlKsRrCvZzEKfxhCIwpN/yTj1CGCcO3Dhgh0MLSw9vfHqCmNTTqO+Iux
         75J+xPdizO50EtT5cuoIddBw3horBV6ZC5ThhibSmGyHraUhvjlAl2lyQBJBQsLF/0Up
         jYu/DDGy0gwGXdkvIkRXB+lt8vzmIDpUvBDn8nP2AQRAwGs0tOIgxcXwANMnC2bBqGZO
         ctp/ckACdoxkKAnIQuUL9AZ6Z+Pzx4QyWvHns+K6INNrm+d0LqhP51W5YaOS8EOc2PSF
         I2IGqs61eyhdM6RCTiMyiAZ1FAsRHU1MmWNuZkf1uZ6DnC+dYKbctZRuKw8+PYQqV9Iv
         wErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283157; x=1793887957;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7A/hGTgPYtJhS8Ny/Fs+sia52LCj5jd5ywQ/PUXMFFs=;
        b=DYc4PMhD+WJ/wjg0Yrg2B0IXMfP57RBMJzSDTt7WTvMKu0md1cCLFBdf7OY27J6hqY
         WFAUlMvrzvr/5Qf9qK1LguUR47WlcES2cU3dP9iOorG1r4y0ARS0uMS4H5J8cW62aoT3
         FSAhdC35flMe4k2wZ1pSlsTDfo5YL9lVCPSzRx8wng2qzdq3iHim+P5oczBjOD+yeSHq
         4b/wDJNtqlGMMtMYYzJTkwmmU0Iiqla4Xh0LfaomZawYX2Hx/hW3fBe3JJIx7GALpQuY
         qrFfiowgKzamJTf6VyNCGxVE/HEgMLGlEba6oAgWdfXH0JoQsandZCDeJpcR45+qTj28
         Ztkw==
X-Forwarded-Encrypted: i=1; AKwUvBwwgmuwM/9CyMwOLAzk9ZDeYyr2YxN3SZGWX9b9IV6P/WGkE7LJwmXhi5kUk+CUGarHKVievIywUMqcy7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5XYxToga76FbjhwSyXqi7eBDbSpANOMwue43m5VyMs5i/zunU
	8NValKvydNxYLVlBZ3zrKJ26O5/9qeLBMKiWS1DPEiGznSPMthZ1PaJ6
X-Gm-Gg: AYBFou30FPnXmTXppjBNIXnoxioDGTAWm4yFv6e5W+HR7PFLtN1KlBHIJvD1PsGdO93
	WZjhYfwV7/U8WkNVQku/5XuxXbT4s3DI2mwK3lxL6QVvAHiNGSU0KybLK5+FDhTdcKiFDiPVFH0
	eOxWZrxhdVBx8ZayNgxXnw5SmdMg4XLzc99OIAGim4nEYlU2DtcdUkOl3DzFhGE1whCLhSpnJAo
	oQ5YRJI4CVG6GLceT7IM1vAe54cDRubJgmZgJmUcoN8FfFrYNB0I6LKwRlqGoi/30CGMSOsilq6
	yesOyMO6YUb8iyzKYwj0Py1s2NkA8AYD8HVrDzEhnYvs0UP4Euko3OczDBh4QHyuWsDsit/19iq
	aXdkEknhcTZeleIc9tAGpaaqUg2VrKjG0v5Ms/ppGvUMVFOOKWwfA4ILMW1bDJ0noB5kKV67Aaf
	4eycSNaZKeRv4dcTXs2pEaQgaAr9SPQd060B2JKfFkSxaCzMBZx4WFPhPEwMDJbvUipt3S73yOC
	ZyBENkyBDq5blm0KXqpCLJPUUo9vOXDnybEiondPRSeJR5z54slVnkbgyfiSFMvIcikyMt3mBfB
	9zt/DO5ErFo8ZDYJM9pDazk5Lad+mrk2U0hrROQ9/zcRbwTjIci4Mg==
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr3835499c88.14.1793283155089;
        Thu, 29 Oct 2026 07:12:35 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:12:34 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fs/splice: clamp an over-reported write_iter result
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314072.648427.13388575162083843840@gmail.com>
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

iter_file_splice_write() builds a bvec iterator of at most
sd.total_len - left bytes and passes it to ->write_iter().  It then
subtracts the returned length from sd.total_len and walks the pipe
buffers by that length.  A ->write_iter() implementation that reports
more bytes than the iterator held makes sd.total_len underflow and the
dismissal loop advance pipe->tail past pipe->head, releasing a zeroed
pipe buffer:

  Splice Exceeded! ret=7 tot=1 left=0
  Oops: general protection fault
  RIP: 0010:iter_file_splice_write+0xb6f/0x1170

Commit a3de58b12ce0 ("netfs: Fix unbuffered write error handling")
added the warning for this condition but only reports it.  Clamp the
return value to the size of the iterator that was actually handed to
->write_iter(), so the pipe accounting stays consistent even when a
producer violates the iterator contract.

Fixes: 8d0207652cbe ("->splice_write() via ->write_iter()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/splice.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/splice.c b/fs/splice.c
index bc243ab..3ac1d4d 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -737,9 +737,12 @@ iter_file_splice_write(struct pipe_inode_info *pipe, struct file *out,
 		sd.pos = kiocb.ki_pos;
 		if (ret <= 0)
 			break;
-		WARN_ONCE(ret > sd.total_len - left,
-			  "Splice Exceeded! ret=%zd tot=%zu left=%zu\n",
-			  ret, sd.total_len, left);
+		if (unlikely(ret > sd.total_len - left)) {
+			WARN_ONCE(1,
+				  "Splice Exceeded! ret=%zd tot=%zu left=%zu\n",
+				  ret, sd.total_len, left);
+			ret = sd.total_len - left;
+		}
 
 		sd.num_spliced += ret;
 		sd.total_len -= ret;
-- 
2.34.1

