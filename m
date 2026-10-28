Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208941;
	b=IucR4tmPwVrK+UVXn7gm59yvFBsy0Bc8DgpbXepz9kgicQ0DFJvht0OPTLrzPw4eGFoP
	 qVryLyBe4b5rPdnMPdrWsrVTgGVXT9sCiAMq5Uh26+Cam1rY1Ef5u2CxBQSbMOQLwNXAR
	 A2svBp+xG+0XH24bU0SSwpm+POgot+xeO81cc8JGLcN8XT6e08OEnxSwXWVtAj+jEgoME
	 BQCayMJ83GSuB/Q9JN4GtNsRp+HEoGE2H+vMI4i09XOQnrhY962eTmrasuGFDo/bsHB97
	 mskuiJ8wGUCYZQ62TOif4dTBP1PPeUNW5HyKrLjUsPW4aKpnCcrhMHjxzfmUkzwXyfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=thT5Xtaus5EICeFAYB7pJ3vHm1y5bAGqDGmf0Zh/xxY=;
	b=zRFS+zJC0G9mIJA+hjdP5kimrtNnoq/TNxvVJaH53SkW5qsIbZT60rlat6qW80AWq0cJ
	 hXlKQP9Mlpa2pMtpte0cMUik9fbT3EzRidutWJrMzkE5xiwgPH8o7T53KeMNPJJnrslmG
	 Nt8O/1p5zgB+IM4C/WjYDOK/gLjxv9rZi6w/ojC+wwRm4zi25tILY6F1kZAw4G2hYj2FG
	 O4BAUfGpzGr1hPfJzKuuTKgXaS3r8c23HVZYtOMQSCQORtbRmwSnjRiYO51IUSSWZSYS/
	 GJzKjCTkgrsktJ1K9viMJw23r/bk5Vowp34/uhR/4OQAJx71fLuXkc2O5+QMbOGY6YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=WAOIWW6l;
	arc=none smtp.remote-ip=209.85.128.225
Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5160A2608
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA5160A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=WAOIWW6l
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso10719017b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793208940; x=1793813740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thT5Xtaus5EICeFAYB7pJ3vHm1y5bAGqDGmf0Zh/xxY=;
        b=WAOIWW6lfDwCIoiqc6s/VoqLDHYzsaNX+n2lESUYltp+53j+QJWOB3gxwxt9OIqEBv
         Va2R0GH1X9wBbhXeLs7wCc6hZnPqgNhDk+OnDz+ie1IrdLGQI66Tw839jFXjWhXlAok2
         5unTU1EC/VLeBVEJZVTs5p3bzRPKzSZepevG2Pn2RssIyXtMDpEiSX0Z8UFpiVlT+6I8
         UqRB9+LIBw5bBGsfgN6zNsGBbNvp5f6lIt6pizwa9Dry7pxHejhlIVZ04pOPBZsOp9Cg
         hxegkGCbGBSyUFYezKW8l0bfPcSvrpmM8ZfqRUSds5a7RtOqr2mZBdIE7NpbssqCyF7W
         ZaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208940; x=1793813740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thT5Xtaus5EICeFAYB7pJ3vHm1y5bAGqDGmf0Zh/xxY=;
        b=CUMCAI601vCLyZWsOqYhW9f5hx8erXOx10s0As5/ojfKiS6+R+TiKwAOfYy4lnc7qs
         /QNduFuXg/fZB4lFsVlutgvkrGuP5ApJ5kh5m+9o6vEjAgcXLJJlpZEXQ2rlQ4nD17/0
         NAQKtFMM8fbG0sKouzF8N6RVKTQSuvwGcd3F9CsnSEFpkzQx+QyZwRuiTDq19akSJa+x
         jL4VpNHcwcTuf4GrzyEJPo+5si2AGK8ZkalJSBYXfYL7wVddkUirKJMN3Wst0kcYdcY1
         OrPSo6HRyF87WSgnXjpxXzwQM5WzZaHgpcUwsthmBtSH5XVVv25FkM0GlAPRsGT6G7km
         C/jg==
X-Forwarded-Encrypted: i=1; AKwUvBwoq2e1ZoeySq3Dwo5lMJ2tObaC3CbrqsF2G+VOxTgtxZTBNDfuf63NW+QYthKBTW+P9YgmLJ9D7lj5sSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfXEiqU7c2G/euDcaEU0G/M0s/bxfMJes4R85iFx3EPZkGFwkk
	cUbe8+u3RB41x7xeFWVE+QBKlNQU15DffR1ZGsWzrnphT3ri4YmBjQScbHEb8rEFJuz/T5fAtoY
	Wj19e6ekE77frD13AgRvpcK5i7lnJWxw3OybXJH7QILqhEFW5fyTP
X-Gm-Gg: AYBFou3WHk0GLIfF7CDLUTJMUod+JZIhV6ha5WwCxo8ZKXG0kkQeh55v6nnlRDRmchI
	5uyeuG6wBa23Y70+MCPd2nkXo31/N4JeJ7sO2hT5YM0HfSLOF4Wc1DTMOVaCYWt4TbnYM43y/iU
	AHdz0b9jluGBdx1BK6ioFLesjLbFKrj/SoizEZqg4gQYJI7KXPHaTlRnt7uPRf9eij2874Zr3qM
	engJk7AciM9kSymF+iCOuG/wJwMzFAQsDjIvDm1J8MQpzZnOnSXiRuJKrSVILG7/sTQtZlNoraO
	WWTzwizn6GXO1NCmBw8V/+weHmh/s1e1IgjI9/49GzIakcE9IlxqsBOVyW4z/JtXV82yTHWNwIs
	+UK2fPxycEgqiRnOVuDjS
X-Received: by 2002:a05:690c:9990:b0:8a0:76e8:c738 with SMTP id 00721157ae682-8b1b55b2713mr22626297b3.0.1793208940193;
        Wed, 28 Oct 2026 10:35:40 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b19e5b7755sm756027b3.14.2026.10.28.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:35:40 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 498D54030B;
	Wed, 28 Oct 2026 11:35:39 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 46F51DCDF71; Wed, 28 Oct 2026 11:35:39 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishikesh Jethwani <rjethwani@purestorage.com>
Subject: [PATCH net v3 2/2] selftests: tls: test that TLS and KCM are mutually exclusive
Date: Wed, 28 Oct 2026 11:35:33 -0600
Message-ID: <20261028173533.2658096-3-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261028173533.2658096-1-rjethwani@purestorage.com>
References: <20261028173533.2658096-1-rjethwani@purestorage.com>
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

Cover both orders, with TLS RX and TLS TX on the attach side, and check
that a socket detached from KCM with SIOCKCMUNATTACH can still be
upgraded to TLS.

KCM needs a BPF parser program, so the tests are skipped without
AF_KCM or when the program can't be loaded. Add CONFIG_AF_KCM to the
net selftest config.

Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 tools/testing/selftests/net/config |   1 +
 tools/testing/selftests/net/tls.c  | 144 +++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index cb8cb4696df7..1619478fffc4 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -1,3 +1,4 @@
+CONFIG_AF_KCM=m
 CONFIG_AMT=m
 CONFIG_BAREUDP=m
 CONFIG_BONDING=m
diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 9d3cd4fff062..2e4128e0676a 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -7,19 +7,24 @@
 #include <error.h>
 #include <fcntl.h>
 #include <poll.h>
+#include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
 
+#include <linux/bpf.h>
+#include <linux/kcm.h>
 #include <linux/tls.h>
 #include <linux/tcp.h>
 #include <linux/socket.h>
 
 #include <sys/epoll.h>
+#include <sys/ioctl.h>
 #include <sys/types.h>
 #include <sys/sendfile.h>
 #include <sys/socket.h>
 #include <sys/stat.h>
+#include <sys/syscall.h>
 
 #include "kselftest_harness.h"
 
@@ -3492,6 +3497,145 @@ TEST(data_steal) {
 	close(cfd);
 }
 
+#ifndef AF_KCM
+#define AF_KCM 41
+#endif
+
+/* KCM and TLS are mutually exclusive, in either order. */
+FIXTURE(kcm)
+{
+	int fd, cfd, kcm, bpf;
+};
+
+FIXTURE_SETUP(kcm)
+{
+	/* KCM parser: each message is everything queued (skb->len) */
+	struct bpf_insn insns[] = {
+		{ .code = BPF_LDX | BPF_MEM | BPF_W, .dst_reg = BPF_REG_0,
+		  .src_reg = BPF_REG_1,
+		  .off = offsetof(struct __sk_buff, len) },
+		{ .code = BPF_JMP | BPF_EXIT },
+	};
+	union bpf_attr attr = {};
+	struct sockaddr_in addr;
+	socklen_t len;
+	int sfd, ret;
+
+	self->fd = -1;
+	self->cfd = -1;
+	self->bpf = -1;
+
+	self->kcm = socket(AF_KCM, SOCK_DGRAM, KCMPROTO_CONNECTED);
+	if (self->kcm < 0)
+		SKIP(return, "no KCM support");
+
+	attr.prog_type = BPF_PROG_TYPE_SOCKET_FILTER;
+	attr.insns = (unsigned long)insns;
+	attr.insn_cnt = ARRAY_SIZE(insns);
+	attr.license = (unsigned long)"GPL";
+	self->bpf = syscall(__NR_bpf, BPF_PROG_LOAD, &attr, sizeof(attr));
+	if (self->bpf < 0)
+		SKIP(return, "can't load KCM parser BPF program");
+
+	len = sizeof(addr);
+	addr.sin_family = AF_INET;
+	addr.sin_addr.s_addr = htonl(INADDR_ANY);
+	addr.sin_port = 0;
+
+	self->fd = socket(AF_INET, SOCK_STREAM, 0);
+	sfd = socket(AF_INET, SOCK_STREAM, 0);
+
+	ret = bind(sfd, &addr, sizeof(addr));
+	ASSERT_EQ(ret, 0);
+	ret = listen(sfd, 10);
+	ASSERT_EQ(ret, 0);
+	ret = getsockname(sfd, &addr, &len);
+	ASSERT_EQ(ret, 0);
+	ret = connect(self->fd, &addr, sizeof(addr));
+	ASSERT_EQ(ret, 0);
+	self->cfd = accept(sfd, &addr, &len);
+	ASSERT_GE(self->cfd, 0);
+
+	close(sfd);
+}
+
+FIXTURE_TEARDOWN(kcm)
+{
+	close(self->kcm);
+	close(self->bpf);
+	close(self->fd);
+	close(self->cfd);
+}
+
+static int kcm_attach(struct _test_data_kcm *self)
+{
+	struct kcm_attach attach = { .fd = self->cfd, .bpf_fd = self->bpf };
+
+	return ioctl(self->kcm, SIOCKCMATTACH, &attach);
+}
+
+static int kcm_unattach(struct _test_data_kcm *self)
+{
+	struct kcm_unattach unattach = { .fd = self->cfd };
+
+	return ioctl(self->kcm, SIOCKCMUNATTACH, &unattach);
+}
+
+static void kcm_tls_then_attach(struct __test_metadata *_metadata,
+				struct _test_data_kcm *self, int optname)
+{
+	struct tls_crypto_info_keys tls;
+	int ret;
+
+	ret = setsockopt(self->cfd, IPPROTO_TCP, TCP_ULP, "tls", sizeof("tls"));
+	if (ret && errno == ENOENT)
+		SKIP(return, "no TLS support");
+	ASSERT_EQ(ret, 0);
+
+	tls_crypto_info_init(TLS_1_2_VERSION, TLS_CIPHER_AES_GCM_128, &tls, 0);
+	ret = setsockopt(self->cfd, SOL_TLS, optname, &tls, tls.len);
+	ASSERT_EQ(ret, 0);
+
+	EXPECT_EQ(kcm_attach(self), -1);
+	EXPECT_EQ(errno, EOPNOTSUPP);
+}
+
+TEST_F(kcm, tls_rx_then_attach)
+{
+	kcm_tls_then_attach(_metadata, self, TLS_RX);
+}
+
+TEST_F(kcm, tls_tx_then_attach)
+{
+	kcm_tls_then_attach(_metadata, self, TLS_TX);
+}
+
+TEST_F(kcm, attach_then_tls)
+{
+	int ret;
+
+	ASSERT_EQ(kcm_attach(self), 0);
+
+	ret = setsockopt(self->cfd, IPPROTO_TCP, TCP_ULP, "tls", sizeof("tls"));
+	if (ret && errno == ENOENT)
+		SKIP(return, "no TLS support");
+	EXPECT_EQ(ret, -1);
+	EXPECT_EQ(errno, EINVAL);
+}
+
+TEST_F(kcm, tls_after_unattach)
+{
+	int ret;
+
+	ASSERT_EQ(kcm_attach(self), 0);
+	ASSERT_EQ(kcm_unattach(self), 0);
+
+	ret = setsockopt(self->cfd, IPPROTO_TCP, TCP_ULP, "tls", sizeof("tls"));
+	if (ret && errno == ENOENT)
+		SKIP(return, "no TLS support");
+	EXPECT_EQ(ret, 0);
+}
+
 static void __attribute__((constructor)) fips_check(void) {
 	int res;
 	FILE *f;
-- 
2.50.1

