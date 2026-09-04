Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46346519906
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542996; cv=none; b=pNE5psips/iNkA2k6N23YwReXmQ8pfFNeW8G1XyJW8mTFlPUYw6p7kHiqOJ9hwrqWxNz4G8gqOY0nlmu58c6uyPlbcDygIo7xIqDU8zl0+kpAlvv4z5trTPgbyBvE/h51FWkh1ourgBGdKJX3yGupRgYVPVYo60xv4hKgeT/8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542996; c=relaxed/simple;
	bh=y/U7lI8WnnU1KnwvHBw077ZL1vJVeKUb+XM4rIteV8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZVkuJPqZrIRlGnpWffBSXLbVDIfacA1+wlxWU9o27igvrm3yrXL3kYoZC7yCnuN9gOXY2Ccwd75iIy8Su/YdZPDUiTLro/cqRIpNgxVJqnscyuUpNmzmhOn/BLYkv9IiCHUsSU8CaqPt9tial8vTrfAB7dQ52ZR/QKK+J0HAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3GVoOIz; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3GVoOIz"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90e7c71f86eso8749736d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788542990; x=1789147790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6jALHeVsBRq8RHBq3ibhbiHxBjg74BRHeDZvOic9v4=;
        b=o3GVoOIzRKBeQfeetK0yrUXvj8lwAJ40b8jK3SUogyZblLzD6kyA/AdUT21NDMCw3z
         jtWT7bzWWaFBb4mDR4mXDobBHRoGXOA93Xz/SHDHWv+qF00QTPeaWekr8QDa2Sm77esM
         dDmr887Clz/om+0YtEZlac5TIPANpL7NEHnuZLgAvWYyxUzciBz4BY81WLQHXqRDxLBx
         n4WV0vWNptGer9FyQ678mh8EXIgBJo6ZcWT/HxYSgE9gv2T3dZ6fpzADvMGjXjLIJUfF
         wrYzxDXdPOmnOW7XIFSr96jWmkORlccTt7Syw/e2R7+cQR6h9VsnYuJM4AN5d/VFum0n
         ihtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542990; x=1789147790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6jALHeVsBRq8RHBq3ibhbiHxBjg74BRHeDZvOic9v4=;
        b=exouvsGCqAtphmQtyMTj7Na6rtDNxTp0vFah7yi/vG8tLbxvo4V0viwZ8VITmIYvvG
         EAc+4gV3wakkDtoMCzAZEmNut2LZPzggVImADGprvJF3ZFXB1FELmTOhR5QGb8C5dOey
         OVNAfFcgntVnmrU/dlzmE1bIsWPv6Tqb/I0AwkxjcEBK2K2NvLopmbZvdnFSJ0SZOU6m
         art6io/C3qOcUPL5ilspGXYV7hi5HjAtwa9pnf96hdSrGqekusYcgWps2/EKCgEI+XvX
         DWWWhtdVhz1wDdB0o5eYMxT7KT/8nhKqEsGPR46tsCEiD59WUxur/Kq92iLho8LvcgHd
         u2aA==
X-Forwarded-Encrypted: i=1; AKwUvBz1lkIg2EnRcbBvvHl6GP0qWDgOZequMaEgZOigcHQDiQBPalbSfyNRnBOGS7Ek65Jlv2ABvpfjmta/0EY=@vger.kernel.org
X-Gm-Message-State: AFuF++kzsu2Q6e3IqQXhS4NiFjg2tHnt/fnSrXzwRRI4GeX1UCEs0Mvr
	NLPsv3TOu1TOPg4iTyiKWtpgHhQnFQJGwVpptcei2ygv+kNqRFNOA/NJ
X-Gm-Gg: AYBFou1LgcNGN9uNzy6xY9G0nRDHi/3IltKL8IIN648bC60JicEBWE3Eq387ZyhNCMO
	h2rpk6IX08XIdeCUamdDr5ex0C9r+0yz2C8KhiwtQlZOnYgi/efRhCTuteDw/qGW9YOVxHJdW0M
	KtoXSmfuCl+4f5SJmb9kL+WA32C+lY9sSUBNSEA1/Iu9H3zywU95cizPiqk6ZChrh+nTzTWvXUw
	5rsE587MSCf0AAq6F8beLMkya/J4rSxaJUDL2AL3K3K6pjQ8D2tGeSoYXUlFbe+nB16cHtgKblU
	Zy0eHMioiqLMXY4mshBqoPZuYq8+gG/otdSU5dIz7qPUc3FeRqhe0XwO3nS3f3eJKdGewLIuUHB
	EdNKhJ2kiQdOUdROTKN8kirM8SvDfsC+n7HkuGTO4haBy5FXc1wA7UeUhpU3VAaoXkitW2qSe1s
	ZmZyhBPa1Rk0iszGdJ/pfDYyUY43tplcMZzmM1h7k+rIc5tiMRe3eORVw=
X-Received: by 2002:a05:622a:14c:b0:52d:ea18:a9c with SMTP id d75a77b69052e-5305499a4a5mr72353451cf.34.1788542989154;
        Fri, 04 Sep 2026 10:29:49 -0700 (PDT)
Received: from zambezi ([2a02:8308:b10e:9400:faf:460b:2f23:8f6f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305418950fsm25000631cf.20.2026.09.04.10.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:29:48 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Ceph fixes for 7.3-rc2
Date: Fri,  4 Sep 2026 19:29:38 +0200
Message-ID: <20260904172941.1970111-1-idryomov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/ceph/ceph-client.git tags/ceph-for-7.3-rc2

for you to fetch changes up to dc173b37415e8f738fc4de477490056b479ddc9f:

  ceph: apply nearfull_sync option on remount (2026-09-02 12:23:05 +0200)

----------------------------------------------------------------
A small fixup for the new nearfull_sync mount option, a potential
use-after-free fix (marked for stable) and a patch that eliminates
the last use of PageWriteback macro in the tree.

----------------------------------------------------------------
Alex Markuze (1):
      ceph: apply nearfull_sync option on remount

Max Kellermann (1):
      ceph: lock mutex in ceph_mds_check_access()

Tal Zussman (1):
      libceph: remove pinning assertion in ceph_msg_data_iter_next()

 fs/ceph/mds_client.c | 4 ++++
 fs/ceph/mds_client.h | 1 +
 fs/ceph/super.c      | 5 +++++
 net/ceph/messenger.c | 1 -
 4 files changed, 10 insertions(+), 1 deletion(-)
