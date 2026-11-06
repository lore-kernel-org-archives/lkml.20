Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968770;
	b=xZGtLTOWsNhkSAmCAheflyRhhtIDYHjREguDtUsYEl3XUVFWS21GhNiWUlj7TiE963O8
	 R/lxZD1uMcENCSw7c3Cm9rPNw6wFjxzNMb4clb47DlBb8kQ2p6yTo3JggjZ3qBqbZOutI
	 a8kkpph1izxYJYgJIkT1o5gIO5fOdhFi7onb3Q58xK+KqkVwW9IYQXLMVUGTNVUS3it5A
	 UHfM4nKa5HiPYnN2xWNySH619aGWzFyr17udK8gnLOTdHhpP9Me6fV1Q7nlCKvgSC9d6c
	 cFmoyIwNzCYBptk8SgPVsXonmXhtPiQsQEZf9nOnazvgzg4NcfFymSrNjtVmt3oAE8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V/kcDgdJ3DHGubMyO4u6UCH7vslZXXrvBf4tKHWtNGM=;
	b=qxwuIO7mMJd38TYG28eQh8wVb68orXu+CrGmZVMxnLjTZYobi0k9/iZQSCrPh2Wthzw2
	 XxvRSJXunFDdGEnDD4Rq3/owFfhE9UhgxG/TFA+QSnSP5ywEMN20wWzI12MGt3Y0dcLiH
	 3WGzomDrwShcOxpRlOOqpWOGCYRoJv99gmyczuPWt/YirnUGSK6eypWn02cQewLVU72Am
	 xBwmVi7BtdylaLJLaqstD2OGUrgmVpwko9Wyl9+eGs2vJTHC1Mt9nWXjsYFRjsp4Z1tSQ
	 hJjbGL7inxu0E5IHK1JpZi0ORYh6i605j8Vi3U2lIxApHhOgvVbj+5RQJw1PI+XwbTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVGE5zOO;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08734606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08734606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVGE5zOO
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so469167f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793968767; x=1794573567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/kcDgdJ3DHGubMyO4u6UCH7vslZXXrvBf4tKHWtNGM=;
        b=JVGE5zOOaEbByQQGxTsCgkBcDpIMcDkVsz3ghCKe7umPhL/lyJaKBzWW1nwTf6Eb6m
         jjSJvEW40hyae6cFqUnsV4Vo5dk2Tl4gNQaK7GriRjkdT++TwgmvWYFHpTxmz7aj5f3R
         Ep82Pk+GfGvCGJ0r7mz4fwcigklpdpSq0MINTv3vxhrDLbfrYOvKwTsIdMbHB4B4h3eY
         RNN7ajH95YjGwhf1wlivpaTlYy3/pqe+QJC5hQDUAfN/uaUJLef/vrmRan5VyIWO5Ue9
         ZA9RhzjNvOB0/wvp3NEKC7Fb3Tk/qjSqBWhmobAUeGybhl5RD/P3UOWvJiFch14OyJd5
         cwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968767; x=1794573567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/kcDgdJ3DHGubMyO4u6UCH7vslZXXrvBf4tKHWtNGM=;
        b=KRZvG+k2GOvTNozqJuxU+5ljVouwH+D1oBdMad3vXZS/jgW0PT/96Vxt6p7bxYJdtL
         uNELGSFASvlYy17jRNyAJwisPV4YDTOuiJqPzYAuy38MQ7ew+I7NfbrjMl/hgis4UJEL
         6Al5NkUiyijBioQ4NOOYyqzgtZ3WbxD5YlPk4YytMD3xMmYOz3Q6h/ij9IBoXM2nus1v
         bvFTA4hwji8iX/Vb09uqFjCpDrhi393QyeAwmU4jtUBppfORTxC40tTcvz/IynOwPA6e
         pz2hWT/vydqtM+ndThM33qmUH+00OFxCniUapLYUGfHyivkLywDXgRJ1SfqO9jIczMc5
         F3DQ==
X-Forwarded-Encrypted: i=1; AL+hErETA6Hlb64Zvsm2F8pBeAPG0uAygZAngqp/B5phl8Ka1dceyagrdHT8akeQMYvC6wJLecEahwDXlgMDSZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+75XLJDkis+3m16PhF6XwaiDKIhcZ4Udc0vuICTh0kWqVabbkD
	U7tjywsf+q2l2L9dQZ/wyen6XSOCMmz5SsWAFyIGVdQ6lTA1/aS4h2zd
X-Gm-Gg: AYBFou2snB1EeV2lZSjd+FzYf6unAc/hn7glJJg/P5sVOnG0TMnqSOz9EvqrIFbIben
	eKGBQVVhyZJWsFiP7lf84Di322OXg2zwqW/CiAXnbHQ3ZPkxfoMVtOeKlXsHy9oX6czWAnkPTXo
	QeiZXvO3onY2QqFNu0GR30c0tzfz5SqSKdoArigoItkUeiqBmsXrjIT0X7jNzfIebX3lYcBd8d8
	87TAH8MJZgJxvTpm6elcV/izFuJzahbCrxU+s1JwYdfF8E42+OoIdXh8h1RKm3C+GP/K761F24K
	56oiZxnbREK0zoEYVm25vQUo2Yt9nE/2jVBc1IY0pGzplmf8ijqq80QzynQ8OjZUhRtMrUq9/qO
	0nQNTWWpNwSFg1desiaUhSGDRtDD3ujNwAtzAsAz590LUe9PFaeHfNeY7osTf3K3xnK8dAUW7uo
	AtxH6khpDSBFXWoOkeY0fokdfYIfu+58svEHmMY6n3CujiVxcaLY/0SxxRmXkXU2G+45zpPhqKR
	0zAIS6FnJgra/zGAqgtihe8acoPALWAp5ZW8IfWhkKbinTBuF/pX+j0f1FqNPjCl0qgUepX8nBS
	4DuJzj9Zla5ipxhj/oCDUQtYn2xGQk72XtDdiL2y9nK/OsteHWuIHIiFtj5oIRMBel0yZtNWwsK
	5ULvpxlU/P7hrQEDs7gds4jHztvdb
X-Received: by 2002:a5d:59c1:0:b0:48e:3df8:74cb with SMTP id ffacd0b85a97d-49273e5b29fmr5340663f8f.6.1793968767067;
        Fri, 06 Nov 2026 04:39:27 -0800 (PST)
Received: from andreayoga.localdomain ([151.37.255.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63ae2sm3776938f8f.11.2026.11.06.04.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:39:26 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Simon Horman <horms@kernel.org>,
	Luigi Leonardi <leonardi@redhat.com>,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] hv_sock: Report no unread data before a channel is available
Date: Fri,  6 Nov 2026 13:39:18 +0100
Message-ID: <20261106123920.162131-1-parri.andrea@gmail.com>
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

The Hyper-V transport is assigned before the asynchronous VMBus channel
offer completes.  Its zero-initialized hvsock therefore has a NULL chan
until hvs_open_connection() associates the channel with the socket.

SIOCINQ can query the assigned transport while the socket is connecting,
or after connect() fails once the transport has been assigned.  Unlike
poll(), that path does not check stream_is_active() before calling the
transport's stream_has_data callback.  hvs_stream_has_data() then passes
the NULL channel to hvs_channel_readable_payload(), and any user in the
guest can trigger an oops:

  BUG: kernel NULL pointer dereference, address: 0000000000000178
  RIP: 0010:hvs_stream_has_data+0x23/0x120
  Call Trace:
   <TASK>
   ? vsock_ioctl+0x74/0xf0
   sock_do_ioctl+0x42/0xf0
   sock_ioctl+0x27d/0x310
   do_vfs_ioctl+0x700/0x810
   __x64_sys_ioctl+0x7d/0xf0

Return zero unread bytes when no channel is available, before accessing
the receive state or ring.  Leave the existing channel-backed receive
handling unchanged.

The oops was reproduced on an unmodified v7.4-rc1 kernel in a WSL2
guest with a small user-space program, available on request.  With this
patch, the program reports zero unread bytes and the kernel logs nothing.
Other vsock_test cases were not run, as most of them need a host-side
peer.

AI assistance was used to identify the issue and develop the fix.

Fixes: f7c722659275 ("vsock: Add support for SIOCINQ ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
An alternative is to check stream_is_active() in vsock_do_ioctl(), as
vsock_poll() does.  That would also change SIOCINQ on VMCI sockets that
are not connected yet, from -ENOENT to 0.  I kept this fix in hv_sock to
limit it to the crash, and can send the generic check separately for
net-next.

The reproducer is a new vsock_test case.  I have not posted it, as
Documentation/process/security-bugs.rst asks for reproducers of bugs
found with AI assistance.  I can send it privately, and will post it
once this fix is merged.

 net/vmw_vsock/hyperv_transport.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
index 855b15971c359..551eabe690144 100644
--- a/net/vmw_vsock/hyperv_transport.c
+++ b/net/vmw_vsock/hyperv_transport.c
@@ -697,6 +697,9 @@ static s64 hvs_stream_has_data(struct vsock_sock *vsk)
 	struct hvsock *hvs = vsk->trans;
 	s64 ret;
 
+	if (!hvs->chan)
+		return 0;
+
 	if (hvs->recv_data_len > 0)
 		return hvs->recv_data_len;
 

base-commit: 475ff14ba558bb8857bca878f1d593784ccc4f0f
-- 
2.53.0

