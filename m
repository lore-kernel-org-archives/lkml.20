Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4AB453A29
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390080; cv=none; b=JAMCAzTLPduWyny0qVrpCvQKXtxLPXJz4NdNBA6AYgt0BYQ5d2FgbG4xygtqOoTymTXOxzq1DQ0eVNGkoTOOQE1NXyziQUtH41ZdA4VNqC3msQ6miT9mYIGRs4/3gUbd+2kNuoyhPpPwfchx7OyoHwR5UAPx+frv3GhLyQoF9i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390080; c=relaxed/simple;
	bh=dqBzikGa14hqqrjBAPe6y9B3zxWzEgOKtDsMRinPnZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSA9WcJkA6FcN+DKD4iUqSobFuagsxYxjbBrXiUews+ru1DZK0MAWFstohieP3BlXGqL2s0Uu1YEwebRc22NS9mcu6KYVPQVEY8877JZlTAq8fdz4KHUmd4GhFFCvrcpbK8gCgqgau1uam02CHrnFt4kfDldKNS1JQigCkdLdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS/oc9Hs; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS/oc9Hs"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b145a9623fso681510eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788390071; x=1788994871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMJ26BWtmMrRnikBYx5aKuMSmpbwrNZ5wPGOE3sWg+I=;
        b=NS/oc9Hs/kVwiejmZ7MPNrn6+wn+zRHOWaT93IT2LjLmJ+RO0MmW77B7NylKm0NVkt
         YagYJoRDEQxQxwoHPluJ3u1ibpr7/CQXyfoymvj4rnDBjNTEsN3ehMjTVnzKDLVicAqU
         Ik9SMedEsF/hVxj5knJ8kTChfDbSnZKdf9EIs03LmDZ4swRlJZRQMe19iULPOArImK23
         h2tTXXM0k84o5RUa0YitPwSz/udjr/wTvdE31p0X60UdHj+8yZ4u+xao8fDgi3vxX7m2
         3O6lWpzLFLuVsrT//36AjsL0vg9UZ8iBt+lTAy0iZlcDbHfbYWk4eAXWm8+ioPHtBF2m
         J1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390071; x=1788994871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMJ26BWtmMrRnikBYx5aKuMSmpbwrNZ5wPGOE3sWg+I=;
        b=dg6xWQU5H/xemLCU27on6YPjpHjCkM1+JHEbdv2W0nFjAjRn+7ZPQX48T8FKGo2GMR
         pAMA2yNVQG0eq8JpsjpqaLuYBRl6p4qtDS8vRpvByoBDNeR0ysh1x+6C0W+6abFJfwl/
         RIbhmFrOkT1X8vHfX0ltmSVxTjptaP7TbfWAaK1swUKX3vSRRq7VzuQqJJ4HHAKJgZ+J
         0G7eH5gunWrFdSs2w8R2W7Ihe12Fm8F4qDAHthBNEEsQ7YttVcj7DXO6wGe2Q7d7S/V1
         Kupd/JDUgiAEK9ajMQXX1LisU/Ximmowjz0hoyIxMkwq6w0AR/tQ3D/dcdBcESXV2pmk
         a25g==
X-Forwarded-Encrypted: i=1; AKwUvBxYYrkGeBe9RV0emMKobOkU+FOFvbTx5Laj1aAcLxlZQNXnT8IySlmUVRhQaT/+ao3MBhonAwKx32fmnes=@vger.kernel.org
X-Gm-Message-State: AFuF++nK5+/uElTI2kfAEKtcKwga+cTyoRHohitADQXZup4QMw5LHeCK
	BZ5nUbtfboS0OwDLnN4BqLw4sMPRF4XU5YYzkK5/LEoGVhaadZgeb7TQ
X-Gm-Gg: AYBFou0LjgcjaZllxlQRB9WrvAAjjSJVqohmSf3NnUi5pMc+th4yo9+5vi4t+/gkoQj
	dKByVsmA7kChK4rJco9Q5Qb4w4kpoenLZGUbtiimSvnN6MCa9xniJ7gYLFnumZkC1Dxd0H/hH8F
	GLahtJKhIRhlQQ+UKAgtNzDjoexxeuS/RhBzl26/sbQrwDGaPWNOItlWW3zI8CZ3XOSGj0k275D
	mtk45NCWc0od884X8/DmzqJfkSId5fo8SM+XgnPhzzOdyDg9/m5u2OYJ42H5Y8vpxlgPvnNjlW4
	bqD81Rp2DqOfvqxkbFxEhUaf9xK2RhlDE311uKxyDKz1qILEg2lmtUxtAlTERlxjlAf53sX+5SE
	BjllSL5QE33VFkTFGPpg+/uSGFUudJwYu7KHJOzv34esu2FK0tYMHdGTm5+Kt7koYJbOSXnyrsi
	GYgMnCrxjlRUamRfRC8ro6Q3Ru11DgV3gi3VHQL13C0Ae7QV7qt0LO8zQUG5qv1oy9A10=
X-Received: by 2002:a05:6820:1898:b0:6ae:4131:98c6 with SMTP id 006d021491bc7-6b47ecdabc4mr6868224eaf.2.1788390070886;
        Wed, 02 Sep 2026 16:01:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:1d::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40f92004fsm3807143eaf.15.2026.09.02.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:01:09 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 02 Sep 2026 16:00:47 -0700
Subject: [PATCH net-next 1/6] vsock: constify the transport in
 vsock_for_each_connected_socket()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-vsock-guest-ns-v1-1-9995383e9a8b@meta.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
In-Reply-To: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
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

From: Bobby Eshleman <bobbyeshleman@meta.com>

Allow const transports to be passed too. The function only compares the
pointer against vsk->transport, which is itself const, and never writes
through it.

No functional change.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 include/net/af_vsock.h   | 2 +-
 net/vmw_vsock/af_vsock.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 3357ee62d10b..87fdec60ba45 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -230,7 +230,7 @@ struct sock *vsock_find_connected_socket_net(struct sockaddr_vm *src,
 					     struct sockaddr_vm *dst,
 					     struct net *net);
 void vsock_remove_sock(struct vsock_sock *vsk);
-void vsock_for_each_connected_socket(struct vsock_transport *transport,
+void vsock_for_each_connected_socket(const struct vsock_transport *transport,
 				     void (*fn)(struct sock *sk));
 int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk);
 bool vsock_find_cid(unsigned int cid);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index a33b2a2d381d..29cde17e08f3 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -448,7 +448,7 @@ void vsock_remove_sock(struct vsock_sock *vsk)
 }
 EXPORT_SYMBOL_GPL(vsock_remove_sock);
 
-void vsock_for_each_connected_socket(struct vsock_transport *transport,
+void vsock_for_each_connected_socket(const struct vsock_transport *transport,
 				     void (*fn)(struct sock *sk))
 {
 	int i;

-- 
2.53.0-Meta

