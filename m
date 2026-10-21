Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601241;
	b=v+5Bkn87YhrnktMC+wkljqkPTeM4SzYt0YvEryJrMyEiHkR/Xj60p6agZ4gRlPv7GVMX
	 JJS37koOr71XoX1YRjja66PkVKqKuWH8nHi2EVSHpFRcoMpB7n5guYkZMa56AZshMq6nv
	 zy1KXbBRcpLu8QoHzEIHnQxUpIJ3TMpCgPiawyZhHxBWDuLZAOVa3ZVnS1vBfKguYwTpT
	 Tb+cKKf56vCFFWRiit+/kF9RiVdIv1ZtbwkWhgIKwv7NWDxzI28eA/h53P1K4qzcgqUoc
	 vsX9lAdTEYmESxb8/9soGdO5ObtMjFpM89+z6aWY5wXDBaMZZjVYNd5OMtJSy4Yf3zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PpQrV3M75vRIpsbPYF6CDFPX8mxlW9t3FWzswyav9Hw=;
	b=mZR85Ww5vFFPkbNjDmZhuZhoXSRJ3EYuA+HWiJ8Sx0hEMI920xhNjcOzfSzIp+fjxqLW
	 p+seUJkcne8uie5kwaj7CRprXBll1Qzj6BlOTOf6bTWnDsYHoAEnNBBPuOUC6MUcSt2UK
	 W0QL2FgEDsaqojfi25kwOnuYeRlxIGjnvjIfi2t//hI/lxvdHNFtAkkZ47xorkXaSt2h7
	 cQSnt4lOlXNZ7GIYeCP0MYmq7SZDog0f1XGqPzK8Xk7ynMdxuaUmQnXL5qLiHdHdRjUnq
	 X7Sk3pMq96gQ2UDCVogO1kydOo8m7EKe+lH8BDtX9Fld89Wvqrt7YuZFtEdOaASCCNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=AYx2MVsE;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B39606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B39606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=AYx2MVsE
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f20b304c0so107094185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792601240; x=1793206040; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpQrV3M75vRIpsbPYF6CDFPX8mxlW9t3FWzswyav9Hw=;
        b=AYx2MVsEh9qn4oCcn+W2RaEHXX4/smyiVa0wet41zN2cdCN99EBGIabOrxKA7hSA/5
         VGmWS3/bhWN6UgbVwtLbN4UKxSYW006aHt00WD6cB13aANST2Zmh2kYf1hkgCqyN0ump
         Exe18KZ8csWenZAtZIE3sAchegzWVmjBVqtxZZ6zToJmy9HfTpSoNC275mR/6/e9SE9Y
         mIBqATCW1iZIgRau9U6PlvynyWE6ORfGFKpWP+FST13RgK6SMc3J8z4UWD5NiPgENt9O
         5jd4s/PTtU+OKySFVwy5IG3HGsuROKh0uTRA+O5ecrKoIIZ5Ta9JIM5nAptyhLhTEqx5
         WKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601240; x=1793206040;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PpQrV3M75vRIpsbPYF6CDFPX8mxlW9t3FWzswyav9Hw=;
        b=xmXijut5VxPXGsg6TD/lcLt7zQM5dnxqq83yt7E1ubjh8PGE+vaQtuuG47h8S0Mpzp
         esgo/5EChhxoxwW9XnxBJ9vqtk6MBe7GheJiIfVX1Egbl7koT9u2pEK0NC5k0V9gxPH9
         MmrtbCsHLEiujwTdFsobYJKy6niiWkT7he4cXlkfyB+wYph5Ns9crgExlFZE8yqfmtUB
         MJJNYYkh5woVxXjCtTLJtrEa94BXauhbx3vBxQ2cqDe0tuvM/bsMgUm0oTcDJiU7sBPf
         Jrp5lLDE5vQQJnVzVFdjInxL064QnwWSqbbM3MYHx40LDe8eHsdMwIZtOvK71c6FS5aY
         PuNA==
X-Forwarded-Encrypted: i=1; AKwUvBya6F3W4ohyu7X0I7enVJ7nWghWdm8nkeVKc7aUDDaPYNI6TK/kTUi8/bqZS0qPM8Xob9pjZYjxY6ik3r4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKltEv+0HCHopZqjII9Uddu6Icbijf2l+jW9JoyzLCGFQyGrrJ3
	JN7uP8Mkh1jcuCUxRzuz2efIHXNSUqeUIM3iP9cXOJjWCbrxmX3RZs8l7GkUYOj9G133WgtR3cC
	w2JsM
X-Gm-Gg: AYBFou0fznCyK1fcTPqmZFV77Z9VQ5MnKr+VnhpKXwY+DHZwaTKkgM/vXEc5l9rewO8
	MWjVXYa0CzqqUVt0Ri70bCZ8XHMS4ymJxQYbwziu2Eh+rHsSDT4Xl++yvOvREpia2C7UQLdieYS
	TVCiTIhY9u1MqbG5uOAwJQ68R5AAkCr7uhOTT5yLcz4Rr/2PbaPzzQpfQL2xQO70zvphYe14sBi
	XbNS7EE5hCT5cp5Ky8YaJ5ypd90/GhrXslMyhTd5q0Vdks1bk0EeNzr3gTq8Flz/uGRJxszQDBm
	4X9PMT5eGWP3XiSBYet6QmrDXGjh3L3MvMO1jig2Cj7wdYXKC8JrESobtiUmrgUUos/TlZGCezl
	0l9SlR80+gRePbwNqKa+93BnflLdDJ6bSaTusnTB+VpPWU3yEE/MBmth0lQbhYF0CE3ZuAWwmNO
	X3vzeWH8v5J0ukW5RAbEzwDMYEUEwcXEL5jWJDzwRo4TTvxaaJWWoMkax30j7zT0qKFGibLUL+v
	0WrO1Iagqgmfgc4DJURf6jJCSqb41i0yofo8BfOZTXItfYcduPh84rac80+N8VwW+enw6IQ
X-Received: by 2002:a05:620a:1a04:b0:93e:5cf8:e5a4 with SMTP id af79cd13be357-93f57f4bd48mr519682685a.58.1792601239600;
        Wed, 21 Oct 2026 09:47:19 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56de57e8sm298585185a.25.2026.10.21.09.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:47:17 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 0/5] fs: don't let a stuck mount take everybody else with
 it
Date: Wed, 21 Oct 2026 16:46:56 +0000
Message-Id: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
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
X-B4-Tracking: v=1; b=H4sIAIHs2GoC/2XMQQ7CIBCF4as0s3ZioYSKV2lcAI4WNdAwYkya3
 l3QpctvMu9fgSkHYjh2K2R6BQ4pVohdB3628UoYztUge6lFLwU6hVwWyvhI/o4lupQjjoMZtBn
 VQRkNdbpkuoT3NzudfubibuSfrdU+nGVCl230czs17v+6sG0f6+PwsqEAAAA=
X-Change-ID: 20261021-b4-super-lock-unborn-739369748496
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792601235; l=2988;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Mx6rWSe3d/zke3tB+djYDVv1P3RSX1m2KKj6LL9ZFS4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCJgiYVmhIVrdKsE6sgihLKqrt7bPKUKWGTkFSZFBvwqN8o5jUlgDtT49Urz5o+Id4oCaVC+jRp
 HnmWz5oLIpAA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Hello,

This is the follow up to the stuck unmount series, and it applies on top
of it (vfs-7.5.super).

The same thing happens at the other end of a super block's life. We put
the super block on the lists in sget_fc(), but it isn't usable until
vfs_get_tree() sets SB_BORN, and super_lock() waits for that
uninterruptibly. If the mount is stuck reading from a dead device or
waiting on a server that went away, everything that walks the super
blocks backs up behind it, and there's no way to kill those things.

This isn't quite the mirror image of the unmount case. A dying super
block is going away, so skipping it loses nothing. An unborn one is
about to be in use, so anybody who has to get at every super block still
has to wait for it.

The things that only flush, sync(), drop_caches and Q_SYNC, skip it.
Nobody can have written to a file system that isn't mounted yet.

The things that are after that particular super block, a second mount of
the same device, ustat(), quotactl() and BLKFLSBUF, still wait for it,
but they can be killed now.

Everything else is left alone. SELinux in particular has to wait, NFS
sets up its security options before SB_BORN, and without a policy loaded
that gets deferred to the walk in selinux_complete_init(). The freeze,
thaw, emergency remount and device removal paths are unchanged as well.

For testing I put ext4 on a dm-linear device, dropped all the caches,
suspended the device underneath it and mounted, which leaves the mount
sitting in ext4_fill_super().  Without the series drop_caches,
quotactl(Q_SYNC), sync, ustat(), BLKFLSBUF and a second mount of the
device all end up in super_lock() and ignore SIGKILL, and the emergency
sync doesn't finish.  With it the first three come straight back and the
emergency sync completes, the other three wait but go away on SIGKILL.
Freezing the device waits for the mount with and without the series,
SIGKILL or not.  On both kernels the mount finishes once the device is
resumed, the data is there and nothing is left frozen, and 200 rounds of
mounting with sync, drop_caches, ustat() and Q_SYNC running against it
are fine.  This was with KASAN and lockdep on, neither had anything to
say.

fstests on ext4, xfs and btrfs gives the same results with and without
the series. Thanks,

Josef

---
Josef Bacik (5):
      fs: make a mount waiting on another mount killable
      fs: make ustat() and quotactl() killable in lookup
      fs: make BLKFLSBUF's wait for a superblock killable
      fs: don't make sync(2) wait for unborn superblocks
      fs: skip unborn superblocks in drop_caches and Q_SYNC

 fs/drop_caches.c |   2 +-
 fs/internal.h    |   1 +
 fs/quota/quota.c |   2 +-
 fs/super.c       | 168 +++++++++++++++++++++++++++++++++++++++++--------------
 4 files changed, 129 insertions(+), 44 deletions(-)
---
base-commit: b4b5957dcf76c676f8a21b24588667731e97bbbc
change-id: 20261021-b4-super-lock-unborn-739369748496

