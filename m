Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898288;
	b=uBjLm5pgwkv8Q+Aj1KvHpnuQl6nOsCy1KlcWrcqafoj/vqQwSYhUf6spyjSNGflTruOS
	 6Dk+t6wTO2t4f5bAU/vvjrj7YNwNZGKnSe6QlDipzGa/n283g8/4ZCsTPJ+KhUitPHfv7
	 WWaDdV823psp3mkr6ZtaLwvj+wJHYHWNl1W7vpGGOvrzqZz11N1ph5mWQ8x+IW7MU9jKw
	 TZW8H4EZghBmJvSQQHTq3QITeONQsQIg5S40+REtf0vyKPIl7fppcYYo5uuCSun7nNcvY
	 qyiwDioMqHyzRndci8vNRHkOvNyfb1vjbcZwJ+IKVxJhQHgwY5Aka9KmvCb9zc7ultg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rk1FeQzJrhht2X1kLFkG63MCPIDEd8l5/+J4eSp8hlg=;
	b=UFaLjq3GExW8JH7hRdNB0GPC7y5/xG4JisIsZqVWciVbzCzQgCzhMHV3xRpmVoKxNqEf
	 1WmPUBaA9lBNmJJw0pu/vaE290SUlQGJLtZbf/eS0+E3zV2j8qUgdAj4s4MjJn/9bYH8e
	 f2ejaEImStRkmInmZdo0K1bDIkdfUFJfZzXtn6GuRs2JOaZ/0WtG0tO7QBgkUvMd89GD2
	 dprP9tSfUc94og8peLOSNX9tetn54E/hA9H2r1fLPjYu6E2Co/+1bXGKi4ht68uvNjfLD
	 JAROAVJSays0knPVlI/Y1wRzJQ6dRoE+UTkAP0tIioII+pc5wxxEbmsyLIbBQLjRuKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHLcVAlc;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FAA606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHLcVAlc
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so5995042c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898287; x=1795503087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rk1FeQzJrhht2X1kLFkG63MCPIDEd8l5/+J4eSp8hlg=;
        b=rHLcVAlcz5VgIGeYPUZoTWIp0lXLEtc+z7YYIHJuJNRv0h3y9ODnxzr8NlSqrpUmIp
         JGVZnYMxTKCfBv9PcoP6cmGRv3q+fPfFtld5dkyb5pB24UbwWSroisGfsBQkN9b7JpDv
         vTOfJhZhPJtvgqwrd1Gpv18b4C+iqjsPNGBzFnZQ0ItBF0sgDE0CNMX0jJ0V/3IN8RVF
         ABaqw/CAyBLKvQqFbXyYnmOAZk2L+E4BuABEwWnQtsZt183dsQ8A5ZU8tizZSOrjb5ov
         /D8IoZiF+sxdXBFm93yFZ/BS/zncAPC2A40AOoE/RBIuDDhJObs6gNN5lWDAaGxMr6Al
         hdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898287; x=1795503087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rk1FeQzJrhht2X1kLFkG63MCPIDEd8l5/+J4eSp8hlg=;
        b=PM89PCGt/sYrABt1e3w8EOHSnHNkM9GldLfnDsqjcwi7bYU5k6VU3bIOloJi3B+bHA
         yRWcqCUQZXy/qohyrLCGVI7xKLVCvJbpkANs5r/9uKKip1k58RuJf/pSmwpmgPFNULYd
         u1S6rliBh6LKCi0XHPZMiYaBljoMuJABClwxwfu0NbLjxN0o2RsHMXwLF512QWv3A8qi
         AQaVkXNkHxqkYf4LZG1R03fxpQlSdNartvN+bet3hiF92JDmLljsZ9377iImYLCF0Sb4
         tTsCpxHefTTbXyIElXoRRgL/0slvQp6OiS7z6Bnn7q3cke4y0AXBja4JrgLjBMaNhe5U
         usPw==
X-Forwarded-Encrypted: i=1; AL+hErHeBpVoX0HKZDNcwfbLb3y/jkfTuzW+ms5hvNQEiZvhFiRxyvHmPQKxlmEzv2x9O24zR5DoC+w2z0JfoM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z85Qke867N3r6z6JHeSFVXqSIkYFITcAZ54hdC3rAkgWGi1FZUJ
	4n0dK6GMRRjidvyd2JM4K1GSyZxP6HFXa9MjigErkx/1uxUluR+bPsKE
X-Gm-Gg: AYBFou1imLHnZiMEQS9sTGutZC2DDjq+BWyXQRKOxcBo9PigUBQtjFRNsa9CvU9GZ/b
	IgIkdEcZbPBLjHikzfH3rROPeXyUzFOX2AbqOfAgfSC1atvjuHwGoQZLz9i0U7n5RgrxE9wAH0H
	8BZp8yF1xJjd120//GYr2vGw3uh1VkPH3kPbqh+AX8PEZfvymraew+LaRbnl4C0EyISnYzi9Qzm
	o53GR7KTEOYI6yl5zvYkWsVHdByf5XTW3GWs4D2eRPD9YvSg+J3umGLCUosI8FGx5Dw266O9EQ5
	2akZuS/SRRzRgBI7j1FXJbvFwwQiMmr26JjEB5xkf1B4g2FNvYQKhQge3QCWqgzcjt9rym1XclM
	0LsoJbEUNU0Sf6blwcWv0uy0z0iJFfHHu769NXrL/JiELdM91nrz+qtjGF7pzftu6vLlOShyJXc
	Mf/3hEjQx3kQlFdNqMffE1ZGMSfvYqxm6eIDQrOSQIKKgFpIgm6Ebw1XzTA1zPzZNOfg9kJFd4c
	JENwiehlwct+NNWnvDbvydvxixE+16DD2N82CKuyF2PBnv0gLSX7Eh2/GoIT5h3iXJV9o5k7Iy4
	W4r4aQw+9CHBoqfmoVYZRfsZGco5jGOTgK20VLjYpZhqWkoNEr694pW96dUBTelQ
X-Received: by 2002:a05:7022:3a87:b0:1b2:5884:a020 with SMTP id a92af1059eb24-1b50302ac09mr12374737c88.6.1794898286701;
        Mon, 16 Nov 2026 22:51:26 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm44099255eec.23.2026.11.16.22.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:51:24 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian0@foxmail.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] nilfs2: atime support
Date: Tue, 17 Nov 2026 15:47:46 +0900
Message-ID: <20261117065122.41553-1-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Viacheslav,

Please queue the following two patches for persistent atime support in
nilfs2 for the next merge window.

This series builds upon your original patch [1], which Wang Jianjian
followed up on to address review comments and add compat_ro feature flag
support [2][3].  I have made minor modifications to those patches,
including filling in missing kernel-doc comments and adjusting the
commit messages (such as fixing the Co-developed-by tags).

To use this feature, install the updated nilfs-utils from the
'atime-support' branch of the development repository [4] (which will be
merged into the master branch once this patchset is queued), and either
format a new filesystem with the atime feature enabled:

  $ sudo mkfs -t nilfs2 -O atime /dev/<device>

or enable the feature flag on an existing filesystem image using
nilfs-tune:

  $ sudo nilfs-tune -O atime /dev/<device>

Once the atime feature flag is set, the filesystem can only be mounted
read-only on currently deployed kernels that lack support for it (until
the flag is cleared with "nilfs-tune -O ^atime /dev/<device>").  To
avoid confusing users, this feature will remain optional in mkfs.nilfs2
for the time being, though I plan to enable it by default in a future
release of nilfs-utils.

Note that when enabling the feature on an existing filesystem, inodes
written by older mkfs or kernels have their on-disk atime fields
initialized to 0, which will expose the epoch date (1970-01-01).
nilfs-tune warns about this when setting the flag, and image conversion
(such as copying mtime to atime) is not supported.

The series consists of two patches:

- Patch 1/2 introduces the read-only compat feature flag
  (NILFS_FEATURE_COMPAT_RO_ATIME) to manage on-disk format compatibility
  for atime support.
- Patch 2/2 reads atime from on-disk inodes when the compat_ro flag is
  enabled and stops unconditionally setting SB_NOATIME on the superblock,
  switching VFS behavior accordingly.

[1] https://lore.kernel.org/all/20260219204343.70117-1-slava@dubeyko.com
[2] https://lore.kernel.org/all/tencent_E3847A19056D4E914FACD269A3C77BAF0905@qq.com
[3] https://lore.kernel.org/all/tencent_F3CAF2061A8AE294D88513588FD3DE1F4806@qq.com
[4] https://github.com/nilfs-dev/nilfs-utils.git

Thanks,
Ryusuke Konishi


Viacheslav Dubeyko (1):
  nilfs2: introduce atime support

Wang Jianjian (1):
  nilfs2: add atime compat_ro feature

 fs/nilfs2/Kconfig                  |  2 +-
 fs/nilfs2/inode.c                  | 11 +++++++++--
 fs/nilfs2/nilfs.h                  |  4 ----
 fs/nilfs2/segment.c                |  2 --
 fs/nilfs2/super.c                  | 11 ++++++-----
 fs/nilfs2/the_nilfs.h              |  6 ++++++
 include/uapi/linux/nilfs2_ondisk.h | 12 +++++++-----
 7 files changed, 29 insertions(+), 19 deletions(-)

-- 
2.53.0

