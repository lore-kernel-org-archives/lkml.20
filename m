Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843942;
	b=o75S1I2SWVQa7KcppH9mfd+ZxwcFBe9GguZIEyQKFPaTelvnVK6NvOl1hD2RjKsxoZLZ
	 Yyk4DkiJ4Ks9zih1LgGsvwGqFx7Bp13Nv+BcCViBlKE/pkbtkeQcQzF5IS6Hs2PtKA3P0
	 ++Rch3u0FekhSHNz5C6m/bUc5FLxEAgR658FVCtSvcvtJLQisr5eb1QJSCPncu4GSdKZ4
	 MzR+q5tW3pLKkT6yeXCO0wTdQWy+wPMXBReLpZvV/CqAoXVcIzF0LwcHCF0dJXqJCTAuV
	 VEPVloZcOuAF2UyM6jc3v7ZiRF0drOmF/TqJyJQjSrQ+Tu0UQfvweFESQzTaR0t1IyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YrQg8b1HMQfdVG/FMxGjW2qYHjNymOxo+4+eTQKFo2U=;
	b=snTgJcEnmgzAUCmN4YGhdomqsCYBoocyp+kgq3POwtq9Wdua7fX3IUVqNLVovqYnKczk
	 caRnj/cbN0me1glhoXQxCFCxxytObiiToiGSRn4njRnGgB7BqSgworW+zEtkSgbff/YqF
	 ezFvrpZ8bNoqQIHca/Fkh8CUSAHvzLbjIA8km5jJq0TkkEcQ2q9uVylPbnrEkQbQyaqxB
	 5KTnWuX3Rl1ADGZHCl9hFLVE0SeWW3i2UDma1of+FDZrhH9M7/m2atnVKgIE0fo3qi9q5
	 IJ3NjcCAFUFwutEi5J3Z0p0yLxH8UFD/sC+dcDxbwFH95cNCML5GtNz6xQLdwK3BIOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oi14qhen;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C478606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C478606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oi14qhen
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so38282895e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843940; x=1795448740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrQg8b1HMQfdVG/FMxGjW2qYHjNymOxo+4+eTQKFo2U=;
        b=oi14qhenTRx25hlwwDKhZ/LWV/uSlT2RNCHeTID3Dz65o3FX3regIYGRq4ugzgS1uB
         peO8I4FuTjCyiDAE2cipjJM6tIM6etkZZLDY5ujAaGpdR6fBlx1sDLhX42U6n+SvTsDG
         DhiL9/tiMX1cTyS4BDTxZmbMgw6iQi4h5zsFoC6FsEqPgk2vb+tefD3V5q2KGmyqC7NB
         Mff6X/6u7EDkfBJo1CR/d68zN9Yp1/E74o13bpic+jGaCJrSrZT0jz5YwZZBRZ6Gd3bn
         WYWflAMGWHGL79DZX44rHvPl/CnGEb7d8BbOr45PDDSEZQIpTwp+bAIIyu8UoeTC3L1U
         AUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843940; x=1795448740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrQg8b1HMQfdVG/FMxGjW2qYHjNymOxo+4+eTQKFo2U=;
        b=Z9KLZJf4q6/dMWZcxt4YqXf9ht5CdG/IB7XL7ecnEru0WexHMT1IDvbB7de+//uTJK
         QyjwhWhh35alFFpgV7aZ8UPIyyZkdxEsFMzO0fh2inhAGCixjX1FfhyqybTIIAd9Jtsq
         GPyQnLKSs0jxMy0gb/Y9ax92OISla9APyH75Bn2B00G3Iyq5wkvIRZtaoOUXq32HxJCw
         1QVS3HxSLT8GlZzu1QQGoe2nerqbTj9CYZtAcMCn2eEsDBGq0Qa7xs1y/d484ICGIWDM
         0GazFS4xeGzb13nOAp3mQQsIg2FkOEHgf3lB0Cbs0fXtD0oTI83YBGQPdnT1WzIVzGNC
         +zcQ==
X-Forwarded-Encrypted: i=1; AL+hErEQyh7NhkCZGvTVGGxg+1kJT/NgZubTDc71ssJXmqj85zXyxrWwPP94UTAkx7qlh0F3vGVMgip5leJKA/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SjIjpYHO37BLKsAyOjN5k6/oiWNuEQEZ/IUo5iieVh6MED+Gh
	3X7FdFg0GJeQgkW9ivAxw/THO4KGc9LXYiVx/c3q7tWeRLqpCkvDtMybqHywDlX9oyY=
X-Gm-Gg: AYBFou3vwZn2qOx58PM3MvRzeyB11cWJ0jnYFdoumwxW7n+m5fzj8vQj/HHsGGNG1uW
	Fwn2njXHxmiW/0DpaDi+c6CXneLYYe8L5l/D9hmrZAkxJvtAXBEjjOXO5SJgouM950BCpqZobF+
	XoMFHpaxvE3pGD7iohFOx2VsRg/8Pp/Ej6xQ/O8N5HCodltjOtd5HkQ6YlzGdxEtCSougm4qwdh
	tvmBUmq+6/X1woPi2WPnbpDaWpWakPdow2eQPBvbgU3uI4qd80qsaeS3gdImJCr6/L8ueDKOJ4g
	W53OvoaRcZuwAr+hO7uRnvjtLAybhZVFBz7s/DTKkEA8wXNhgGe8PdUFNz/i+5Tlff8Pfv7br/y
	mfEzUMZGtVCVgTXivSSuDSQRlAIuX+RlDH0XGP8KfTmhJUV9CGfjsPhOU8Awl02ga4PAVrUPSrO
	WcGP78ZyyDA6ku7YB3h2A/AtNEtod+F+NAndSsN0cw8YXUSYSAIWMD/nV+5K7LAIwMeXXfd69fF
	eJAqgL+QtbEO4uvpzHyiKrmeYf5KPw7JKdjdf/n+AdKtI8G1O/sMNcK0hlRdIgEMZvd1k4L8TXp
	1oeo7B0KJ07nvrBrJ4+fu1s5
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr244233205e9.17.1794843940079;
        Mon, 16 Nov 2026 07:45:40 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm395008555e9.8.2026.11.16.07.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:45:39 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Aurelien Aptel <aaptel@suse.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] cifs: fix times assignments in cifs_posix_to_fattr()
Date: Mon, 16 Nov 2026 16:45:26 +0100
Message-ID: <20261116154526.429315-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Currently cifs_posix_to_fattr() wrongly sets SMB's CreationTime to
fattr->cf_ctime.

Fix this by setting fattr->cf_createtime to SMB's CreationTime and
fattr->cf_ctime to SMB's ChangeTime, matching the behaviour of
__dir_info_to_fattr().

This patch also fixes a few related issues reported by sashiko on
another patch (see Sashiko Link tag).

Reproducers for these bugs, with /tmp as the local filesystem folder
exported as [test] in ksmbd.conf and /mnt as the smb folder mounted with
mount -t cifs:

  mount -t cifs //127.0.0.1/test /mnt -o username=ciao,password=c,posix

Issue 1: ctime clobbered by CreationTime during readdir

  mkdir -p /mnt/dir
  touch /mnt/dir/file
  sleep 4
  chmod 644 /mnt/dir/file
  stat -c "ctime and btime before readdir: %Z %W" /mnt/dir/file
  ls -lc /mnt/dir > /dev/null
  stat -c "ctime and btime after readdir:  %Z %W" /mnt/dir/file
  stat -c "ctime and btime on disk:        %Z %W" /tmp/dir/file

output before the fix, notice how ctime is the same as btime after the
readdir, while it's 4 seconds ahead (because of the sleep 4) before the
readdir (on disk timestamps are not touched):

  ctime and btime before readdir: 1794842068 1794842064
  ctime and btime after readdir:  1794842064 1794842064

  ctime and btime on disk:        1794842068 1794842064

output after the fix:

  ctime and btime before readdir: 1794842908 1794842904
  ctime and btime after readdir:  1794842908 1794842904

  ctime and btime on disk:        1794842908 1794842904

Issue 2: btime and ptime wiped out by readdir

[ no reproducer as it only happens after the linked patch series is
  applied, since it needs cifs_i->createtime = fattr->cf_createtime in
  cifs_fattr_to_inode() ]

Issue 3: in-memory inode aliasing (flock bypass on hardlink via readdir)

  mkdir -p /mnt/dir1 /mnt/dir2
  echo "test" > /mnt/dir1/h1
  ln /mnt/dir1/h1 /mnt/dir2/h2
  exec 3< /mnt/dir1/h1
  flock -x -n 3 # get exclusive lock
  ls /mnt/dir2 > /dev/null
  exec 4< /mnt/dir2/h2
  flock -x -n 4
  if [ $? -eq 0 ];then
  	echo "acquired: duplicate in-memory inode"
  else
  	echo "blocked: same inode"
  fi

output before the fix:

  acquired: duplicate in-memory inode

output after the fix:

  blocked: same inode

Fixes: 3d519bd1269f ("cifs: plumb smb2 POSIX dir enumeration")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261115180343.576773-1-koray.fra%40gmail.com?part=10
Link: https://lore.kernel.org/all/20261115180343.576773-11-koray.fra@gmail.com/
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Thanks,
koraynilay

 fs/smb/client/readdir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
index 525f99181485..5d335f12eb24 100644
--- a/fs/smb/client/readdir.c
+++ b/fs/smb/client/readdir.c
@@ -253,9 +253,10 @@ cifs_posix_to_fattr(struct cifs_fattr *fattr, struct smb2_posix_info *info,
 	fattr->cf_bytes = le64_to_cpu(info->AllocationSize);
 	fattr->cf_eof = le64_to_cpu(info->EndOfFile);
 
+	fattr->cf_createtime = le64_to_cpu(info->CreationTime);
 	fattr->cf_atime = cifs_NTtimeToUnix(info->LastAccessTime);
 	fattr->cf_mtime = cifs_NTtimeToUnix(info->LastWriteTime);
-	fattr->cf_ctime = cifs_NTtimeToUnix(info->CreationTime);
+	fattr->cf_ctime = cifs_NTtimeToUnix(info->ChangeTime);
 
 	fattr->cf_nlink = le32_to_cpu(info->HardLinks);
 	fattr->cf_cifsattrs = le32_to_cpu(info->DosAttributes);

base-commit: 9928f403dfafd17dfe45678bbc6f623f72528744
prerequisite-patch-id: 049ae0eba275b5be35a238833107e0b251a55aa2
-- 
2.56.0

