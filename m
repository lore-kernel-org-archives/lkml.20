Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153D437455
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390075; cv=none; b=EPJ0cIoObNWQSbi4x6XgN+R2VhwS8JSGohfkR5KeBroOoLv8MamxMLr8c6lb8kZkWm/7f7ZPhpgntaqE/F7CUdjM1fVMmrZ+tX555Khg9yCeHy986s32harhd5QzSV1J2eAsqPkG+vMOKTL9RzwSm/RIybFDDRTgAA13o7U6QgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390075; c=relaxed/simple;
	bh=S/34GgnpIisKNAJazB6aS6c0H4pLuTB5PSuj71c9luE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pMtcMJ6I+zPbp/zovdkU2OSkRlo3jkc+ix9LMRLjQKEGO78wBdzH1xz3Hhan3aSpKRorMlqkge78lFqjNQMArxNOQcW4sn6dbv1xD70PJAqaxtsvLs3oqKuGR5KrXws58qYg+3mpfhc9fQyUXCQg56m9jdqj4owJjAfnO4tZ7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgOBW8jj; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgOBW8jj"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4679f619d3bso1194109fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788390067; x=1788994867; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2/4BUiYwhmx8BTSrnAZKpKB6tkHSRMMIf9FbGNEl8BU=;
        b=fgOBW8jjg76UuyelSrqyD4H08vG0+FQAbIjEB+fpjLGKwtJJ8/QQ4NQzwSqlDovnI/
         jtTiHh1sU4A6WTPsVcwaefFfQlHoK4kj6ycZYD9YN3m62JsHBYql+J4bQxlec1AY9ps1
         nyaQxMfmR+82JzhpcUUJXsWnD4siJLTQCZfAN6ZV5OzxKQkwMVWnGEyS9n7mDGWjJOzF
         8A4XSu26eJbe2WnU1hEdwwOK0TJJ9dyAxqmK8LUhGROCwukdpSnwEuiEWgr4d+MBCT1r
         N07j6g4KfJ7ap6MBfoUk7cnKmhE5cy66lOLZsDKW7dS4tHVKkoSbdnj3ACmlkxc3DDmm
         YNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390067; x=1788994867;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/4BUiYwhmx8BTSrnAZKpKB6tkHSRMMIf9FbGNEl8BU=;
        b=hqZASkBcn2XPDvscJNa+Bcoz5/2yWGH/9CVobdCzqpFXwF2DP0+7bnVTqgJeG/Wy82
         dGZjunIvLW68aJjuQSpgu7iV5qimKURcb6wX6STEdJmNaKtN8tVHuYjAaghC4/bMk9p+
         WyStvj6smzTOuVTEXXRwh7lt1U+yauQk5ntsCgrlUXKuqkYZdvWSr/TznzKbyqC5Sd1w
         W5flspeJdn5zsLab/PPk7cvUFO7MOWvmNgzhomIPVC3HLbUTizgLyTC1iCTDMWhX4gK/
         ziNSxZY+E40QLA9HPFYGeBtybzEvvqbvz89Tse2XHvceg/gg7G6nkH+dwn+UGQ/quFWc
         3BYw==
X-Forwarded-Encrypted: i=1; AKwUvBw/xGXiCEHM77Br3J57QKkMQo+oJqIju0eig4Rhnb1CXJ/LUB9vVh5WSfRIIOOV9qmAch1bCXyMxEPqgEY=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ/J2/p/Y3gb450oRt6CVdgq7wXxwPKb5oIAgVa5lcGk6v4SXj
	J5K/UlVC2Un/2LmWmSGIDPVhAn56MPMtsgaGnDmnz5CoAdGKa9M65UY8
X-Gm-Gg: AYBFou393LPhA6Ss8u1BBiU4O7i35bt52N19APHzHuqcXJDIJ+a66cNG/KVX6TA5qzs
	wfR/ukspSpl9iV714eAcYHXTxdhZp/u1OHydVgwRc3lQC+gML8V0oQ9KnaSAgS1CmLv+8fmDlsA
	ScuU/l6YbAEzz54YL8YBwAtm89Ru1ab7VsKYtUw/U0sVHDctUJ2PbOP3bgyeJGXyyRucFXnKDbu
	Rd5L0/mrMnX8pSIQTuEgj43ZXPsFlY4+Ys53H0lWm809QQAAuJUh1w5yPlGAhzDnCdHCVGlqgFz
	4wN3YRGj/AazFbIlaW5o4dbS8ELB7LyMynFH8epr8HXrBk94FI4yQXwG0i/Sk0XpVjUh3SrpHFy
	wt43EfvEtygDwiPCwsWn9sevrbxY/SeWepEOcETwmC9q3qvhV9dlPzkEeAQR4Xw1cV26l3FSscz
	5OnJYHyEkO0pmMVxIPfhdwgIzON2Z/m7x1mBIJCjNPuPQLZtrPvk0p+LoD
X-Received: by 2002:a05:6871:368b:b0:456:4c3f:7e03 with SMTP id 586e51a60fabf-46f87b8e5c6mr7802048fac.18.1788390067079;
        Wed, 02 Sep 2026 16:01:07 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f32f87146sm5619656fac.13.2026.09.02.16.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:01:06 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next 0/6] vsock: assign the guest vsock device to a
 network namespace
Date: Wed, 02 Sep 2026 16:00:46 -0700
Message-Id: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGqmGoC/x3MQQqDMBAF0KsMf+1AYtu05Cqli2BGGwpjyUQRx
 LsLvgO8HSa1iCHSjiprsTIrIvmOMHyTTsIlIxJ61wf3unlebR5+PC1ijdU4u5DG+8PnFJ7oCP8
 qY9mu8A2Vxipbw+c4TlagUtRqAAAA
X-Change-ID: 20260831-vsock-guest-ns-d06af451da67
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, sargun@sargun.me, 
 jlinbox@meta.com, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

vsock network namespaces let a host put each VM in a namespace of its
own. A guest has no equivalent yet. It has a single G2H device that
cannot be assigned to a network namespace.

This series lets a guest move that device into a network namespace. A
new ioctl on /dev/vsock, IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS, assigns the
device to the namespace of the calling process. The namespace's existing
ns_mode then decides who may use it: a "global" namespace shares the
device with every other global namespace, and a "local" namespace keeps
the host connection to itself. The device starts out in the initial
namespace, so until the ioctl is issued nothing has moved and no mode
has changed. There is no explicit unassign as assigning the device back
to the initial namespace is equivalent.

The ioctl requires CAP_NET_ADMIN in the initial user namespace.

Connections that can no longer reach the device after a move are reset,
so that a namespace which has lost access cannot keep using a socket it
opened while it still had access. Following netdevs, the device returns
to the initial namespace when the namespace it was moved to is deleted.

Transports opt in through a new netns_assign_allow callback. Only
virtio-vsock implements it here.

Patch 1 is just a const cleanup that patch 2 needs. The remaining
patches are actual implementation and tests.

Based off of Stefano's original series:
https://lore.kernel.org/all/20200116172428.311437-1-sgarzare@redhat.com/

Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
Link: https://lore.kernel.org/all/20200427142518.uwssa6dtasrp3bfc@steredhat/

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Bobby Eshleman (6):
      vsock: constify the transport in vsock_for_each_connected_socket()
      vsock: add IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS
      vsock/virtio: support guest device network namespace
      selftests/vsock: add a helper to assign the g2h device to a netns
      selftests/vsock: test the guest vsock device network namespace
      selftests/vsock: test the assign ioctl privilege checks

 Documentation/admin-guide/sysctl/net.rst           |  18 +
 include/linux/virtio_vsock.h                       |   2 +
 include/net/af_vsock.h                             |   9 +-
 include/uapi/linux/vm_sockets.h                    |   6 +
 net/vmw_vsock/af_vsock.c                           | 200 ++++++++-
 net/vmw_vsock/virtio_transport.c                   |  28 +-
 net/vmw_vsock/virtio_transport_common.c            |  28 +-
 tools/testing/selftests/vsock/.gitignore           |   1 +
 tools/testing/selftests/vsock/Makefile             |   3 +-
 tools/testing/selftests/vsock/config               |   1 +
 tools/testing/selftests/vsock/vmtest.sh            | 461 ++++++++++++++++++++-
 .../selftests/vsock/vsock_assign_g2h_netns.c       |  45 ++
 12 files changed, 774 insertions(+), 28 deletions(-)
---
base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
change-id: 20260831-vsock-guest-ns-d06af451da67

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

