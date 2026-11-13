Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574187;
	b=1sZc7TtAffgNx1dcfTXszKl57d0PEyVZL6etqPBfOPtP2XY5NI9w2++xhtffIbvhafYz
	 KLu2op47UOhI+sBd/XOw69hDfn9BEC4knNrBF5dIiJlfK1RPFaUDhDo7Vt8amJ8HpiVug
	 /A2fPad2XvWURBOZJGqI3ef/2PM3kLT9wDlfeWlwSYbvpL0axr8Kkvz4bPVTbOzOWMk/b
	 G9qtA22rmOtWQlAI1acVQ7DOJgSDw7x6vYShqkHbA0l6YNhRWZvrTiMQquuUi+5gtFJkQ
	 2u17Ii5pDI0WDZ/lPKvS4z+kVsIkKuHOwWUYWnupb1rhN2fNfjZ4cnUz3SDqZIMsM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574187;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xuGzZpBSWxAktfUn8GwyedRb2Dbl/HlSNSopw3gGgAg=;
	b=Dy5Gy3Mh9MSQ1iHbD2eIPVFW32Kx9EErZ8u3kTVwY0RqScVd2g+gzkt709/jvPbS4Leb
	 rQbbpXrnjMyTpx62aYTCNlpajch/xDftq5xGMV3EqyD7ZpVGgQ5cHAdbXyn2VO8hiuxhq
	 na1HubZMp3g3P1pKDoTXBabQS7F/RNBm3yiTrdcCUURbHgGcII+BFm2rPlf+cfxAkLWgf
	 OxqSR0fuTykyDCXIs7cy7Bp0vuA1zyuvCbvASstJXBvQXvn7Go1oveqGAJmVLOzr+0iVU
	 DZody40iBZrZUESD4IdeR0duWpXC7N+G6ns6fe8ujx2TJJ4+KJdMMi1Eizz0Pr51pyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c1RuGly2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TrD2iIah;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393AA606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393AA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c1RuGly2;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TrD2iIah
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794574185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xuGzZpBSWxAktfUn8GwyedRb2Dbl/HlSNSopw3gGgAg=;
	b=c1RuGly2r6b3DWolS3M8Yc5S8lYilkRXGyjrGT4hXX0stJaNayTo2bM1G/UDrHWfrgjgGT
	8oj8O/utLd1zYxYD0dS529ZT2EF/zYreBgoS8E/uT655CgRDeuDVXDck4PnLadoyBdwR9V
	GzSwm7mSBGijZ/SuL0SC4ThF25RdZBA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-AaY202WWO6a7MtK-rNhPpg-1; Fri, 13 Nov 2026 07:49:43 -0500
X-MC-Unique: AaY202WWO6a7MtK-rNhPpg-1
X-Mimecast-MFC-AGG-ID: AaY202WWO6a7MtK-rNhPpg_1794574183
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so609243f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794574182; x=1795178982; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xuGzZpBSWxAktfUn8GwyedRb2Dbl/HlSNSopw3gGgAg=;
        b=TrD2iIahOZz/OmwOoZ5Mayv5YrQcn0q5dyd1ikejK4rZsAvxCe3rjC5OCaXyyz8hF2
         F4unhc8bbDKo/ZK/J6s0xzjYretxanCKHdbpwYw5rfPA/5amjnzJpQ4LkKZuK+FKYbw6
         cFMQdTgHPveiXvgMYxa89A/aWnSglaAtBnNS5B98fOdPJKjlmAp0Vr08xch/74VYHf7S
         mZVD698Pj8no9vnQsw0KoVQAGQ5LYTiXIqTXarveSIqg159FkLci3z4+v1fmAf+CmIip
         8XjJZMLZYxKBQB8k7aALT+zbPKJNv6bWyKeIBbJFMh2b2eqBS7ksI13aDE45Ewv0YB/p
         +BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574182; x=1795178982;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xuGzZpBSWxAktfUn8GwyedRb2Dbl/HlSNSopw3gGgAg=;
        b=j7f8a6XQF31X+eC5rWd1dBSGlanhTkItR7K96KE/4WTmWP9hUWrVlV47j1/Hy/JVLm
         pva9NIG1EIImqCDa7zENZ5ETjmPlOdNVP8BecbhOgBFl5NgjvdiS3TuI3468Eh01DTMD
         9Jgul5zcGNwGuAZnsWaAhNkjpyPv6s03fVjVw0G7/TfPpcTxcLglcMGJJ9c87rlVY6yD
         AHWjLejC9hmfUGUMsttd++RH/5kgnza42q33dt8zgVRLmtZizhd7wju8BdSQDNvqulb6
         /HiOFXGtOm/jU6tl7vUbCj+5ueCwV5SRjMIaJz91KRgJXHxBSOMQK49LvbAUl9Uuam47
         O3Ng==
X-Forwarded-Encrypted: i=1; AL+hErGbaLxfH1IPugB5ivXds/2ZfF18kJEdJLL9JpCik2LHpxt+CWsyDGpD16z0CxLyg1uHdM+atv+UmtTWyto=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GEMq2qrul2jAsL4io06y0itw8IJnL8fSS1cdFQEx73Jt1pxdm
	XwvhE1eBSURc2zjSoVaRQZydANU0BPv40Aqg68nkjupf2YNT9i4lv6/KluBhigummR9/KlcphK6
	Wueh67spDfcuTPqeI+Jqe8h9woNXEjmAd3z4CZ9gcuMA6GZkMGbZ6aSxIuqRl7OJqFA==
X-Gm-Gg: AYBFou0dVHtjl7Rse5VCFD5nGxIjWSaopD5n9cID5TT2VpRcKCN2PuQoh7dN7b5Uuie
	+OYsG9+5zI9axQhRk5pLmiVEMCPZUr1B1g62AVfCKO1IoXH/U5q6YX8WJZyQfyzv8StYKZ4uyf6
	04URbjFBmRkeOiRjFMN9S5mGSBpXIjZ524Fs96OcBt6SEL5MUV3fAIA3HEDhUCYGGbYCM9WPsD5
	vzM4qEZz0LPzyRClW+wkIoHEQfCj7wLNdqvKYnmfqCvG2ZkSBxqVCT0Ov3vZJRIZGrbb4KEBmCl
	yQgCJmqKqYsgjvzwSkrnMSUe24Ck5bvkNZoYxv6Q6sbcRlgB0DlPXM7mOZglXjXDd9HGIz/7zym
	xMpDfOOKNO95pvErnaclHhLpH2RjxVAOubHYpaDncw4Nf3FkwfXYnec0V9x70d00mluOOqgmBip
	8Q5G9Bwgo+2mg=
X-Received: by 2002:a05:600c:3b91:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb55a3e29cmr53767715e9.7.1794574182386;
        Fri, 13 Nov 2026 04:49:42 -0800 (PST)
X-Received: by 2002:a05:600c:3b91:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb55a3e29cmr53766935e9.7.1794574181890;
        Fri, 13 Nov 2026 04:49:41 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm151135805e9.15.2026.11.13.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:49:40 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Subject: [PATCH RFC v2 0/8] vsock: add datagram support to virtio and vhost
Date: Fri, 13 Nov 2026 13:47:33 +0100
Message-Id: <20261113-vsock-dgram-support-v2-0-bacfc85b71ce@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQrCMBBEf0X27Eoaa1M8CYIf4FV6iOk2DWJTd
 mtQSv/dUDx6fDPMmxmEOJDAcTMDUwoS4pBBbzfgejt4wtBmBq10VShtMEl0D2w92yfKaxwjT1j
 Ve1uSsnQnA3k5MnXhvVpvcL2coclhH2SK/FmfUrFWP2n9V5oKVEjlwbjOOCJTnyQMTN7uIntol
 mX5AsLE5oG9AAAA
X-Change-ID: 20261027-vsock-dgram-support-683a4e0aebe7
To: Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org, Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6171; i=slp@redhat.com;
 h=from:subject:message-id; bh=ky1aXYvyF1guKqM4c6+Bd9gJT95CCp8BgqXs0H6uWDk=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBq9wdYvNEPhbQZpSreuD768+vZB/evKyKThMruj
 3GQGZIenCqJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCavcHWAAKCRD0aSeNLwwC
 NQZoEAC0NUajSl5WwiI1RBq2VAObU5vpb2jsW2vCn0sHxLYw5IsOYg71SQmBRpIHD5N/xRD+zrv
 S3kXHYETZS+/IcfcpF8buUnB3PKsJ0+FMbP8Cwy5L/WmLnjeDfhoyUsPppTPBU6WH88FufbBNgs
 vvPUGmD30HFAJs1NqOWb0yb0leWLP5NjWHdrIorX+LmhGwjSlFE6Wx05A8sXeHgXGANhqFEHd62
 29HxwUaNA+t83v/OOkhbJWpucTmrkx8KNQVEtYUttOG81unRaQh1Ln/JQHTtGP/H2xpVAxDLU5G
 Gxgi4lAdnP/nxPzQCy43Or7f8T0MKyJIOe/snOsqdngGxLML+rOSMi1ojKk7m6/rFvS1blulGXV
 dsCNg3vjG6kUKk9u1lFwtU1xPPbJsRAWSgiZpvctfLJCfM+csO7+VrCetvsyEtcdKnz3YQ9D65n
 NdxXoFS9NoxUgUrmOHtGcpZdTZg3AWeG0zFw1ZMjWOdFMwnmNWKmcG1G4vKTUf12ML3eaiRRwi+
 EeuiKdlUePfQVqk5cu9F0PLorRr/qgky62Kqq7loPYgFwD5cediDgx51ZYMiiHFJJ/udb0PGZc1
 g1+bH3NmC57nLLdBzzQVEMCZtHzFd44xnd+yRMX8YVH1Jm6a+1CKyW+j2ExRpKb0McAFwJAsi39
 8K9ABE3kpr35RJg==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

This RFC adds SOCK_DGRAM support to virtio-vsock and vhost-vsock through
the existing AF_VSOCK API. It is intended for guest and host services
that exchange independent requests, responses, or events and need message
boundaries and sender addresses without a stream connection or application
framing.

VIRTIO_VSOCK_F_DGRAM gates virtio traffic in both directions. Each virtio
send carries zero to 64 KiB of payload in one VIRTIO_VSOCK_TYPE_DGRAM
packet. On the RX virtqueue, the device may split a datagram across
page-sized guest buffers.
START and EOM delimit the message; the guest reassembles at most 64
fragments and 64 KiB before delivering it to a socket. Invalid or
incomplete messages are discarded. Datagram delivery is best effort:
there are no peer credits, acknowledgements, or retransmissions. Send
admission uses the socket send-memory limit, and SIOCOUTQ reports charged
send memory.

Datagram sockets have a separate port space from stream and seqpacket
sockets. The latter two continue to share their port space. Datagram
routes are chosen per destination among guest-to-host, host-to-guest, and
loopback transports, with VMCI as a fallback. VMCI still owns its socket
handle when it is present; loopback works without a directional transport.
Hyper-V continues to reject datagram sockets.

Bobby Eshleman and Amery Hung explored this feature in their v6 series
and v7 work-in-progress branch. This series is a fresh implementation
against the current vsock code. It follows the separate datagram port
space, per-destination routing, and VMCI fallback requirements discussed
there. For guest receive buffers, it uses bounded fragmentation and
reassembly rather than full-message buffers or the earlier drop/error
queue approach:

https://lore.kernel.org/r/20240710212555.1617795-1-amery.hung@bytedance.com
https://github.com/ameryhung/linux/tree/vsock-dgram-v7

A corresponding virtio specification update has been drafted separately.
The wire format and feature negotiation still need specification review
before this series can be considered for merging.

The first patches expose the core port allocator and add datagram queue
reporting, then implement the common data path, guest and host feature
negotiation, routing, and RX fragmentation. The last patch extends
vsock_test with local and peer tests for message boundaries, routing,
connected peers, port sharing, queue accounting, and delayed reads.

Testing used QEMU with the F_DGRAM property patch below, an x86-64
KASAN/lockdep kernel, paired guest tests, and a nested Linux vhost-vsock
backend. The tested paths include 64 KiB messages, delayed-read bursts,
feature-disabled ingress, stream and seqpacket controls, and header-only
guest RX buffers. A temporary userspace backend still fails stream test
21 on both the series base and tip; that case passes with Linux vhost.
Real VMCI and Hyper-V hardware were not exercised.

https://lists.gnu.org/archive/html/qemu-devel/2026-10/msg08074.html

Code was written and reviewed both manually and assisted by Codex
(GPT-6.1-Sol) and Claude (Opus 4.6).

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
Changes in v2:
- Keep guest RX buffers page-sized; add START/EOM framing and bounded
  datagram reassembly (thanks to Alexei Starovoitov and Bobby Eshleman).
- Preserve stream and seqpacket data when an RX buffer has no payload
  room.
- Separate datagram and connection-oriented port spaces, and share
  receive metadata and queueing (thanks to Alexei Starovoitov).
- Check negotiated support and destination CID on ingress, and require
  an exact connected peer CID and port (thanks to Sashiko AI bot).
- Select a capable route for each destination, retain VMCI as fallback,
  and support loopback-only sockets (thanks to Alexei Starovoitov).
- Preserve the connected peer address across temporary parent fallback
  (thanks to Sashiko AI bot).
- Use socket write-memory accounting for datagram SIOCOUTQ instead of
  separate transport counters (thanks to Alexei Starovoitov).
- Extend selftests for fragmentation, delayed reads, port sharing,
  connected peers, and capability-based skips; fix the test build and
  README entries (thanks to Alexei Starovoitov, Bobby Eshleman,
  and Sashiko AI bot).
- Link to v1: https://lore.kernel.org/r/20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org

---
Sergio Lopez (8):
      vsock: expose the core port allocator to transports
      vsock: report datagram receive and send queue state
      vsock/virtio: implement the datagram data path
      vsock/virtio: negotiate datagram support on the guest
      vhost/vsock: negotiate datagram support with guests
      vsock: allow datagrams to use directional transports
      vsock: fragment datagrams across receive buffers
      vsock: add datagram tests to vsock_test

 Documentation/admin-guide/sysctl/net.rst |    8 +-
 drivers/vhost/vsock.c                    |   51 +-
 include/linux/virtio_vsock.h             |    9 +-
 include/net/af_vsock.h                   |   30 +-
 include/uapi/linux/virtio_vsock.h        |   10 +
 net/vmw_vsock/af_vsock.c                 |  459 +++++++++++---
 net/vmw_vsock/hyperv_transport.c         |   11 +-
 net/vmw_vsock/virtio_transport.c         |  167 ++++-
 net/vmw_vsock/virtio_transport_common.c  |  164 ++++-
 net/vmw_vsock/vmci_transport.c           |  115 ++--
 net/vmw_vsock/vsock_bpf.c                |    3 +-
 net/vmw_vsock/vsock_loopback.c           |    2 +-
 tools/testing/vsock/Makefile             |    3 +-
 tools/testing/vsock/README               |   31 +-
 tools/testing/vsock/util.c               |   62 +-
 tools/testing/vsock/util.h               |   10 +
 tools/testing/vsock/vsock_test.c         |  175 +++++-
 tools/testing/vsock/vsock_test_dgram.c   | 1000 ++++++++++++++++++++++++++++++
 tools/testing/vsock/vsock_test_dgram.h   |   29 +
 19 files changed, 2066 insertions(+), 273 deletions(-)
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261027-vsock-dgram-support-683a4e0aebe7

Best regards,
-- 
Sergio Lopez <slp@redhat.com>

