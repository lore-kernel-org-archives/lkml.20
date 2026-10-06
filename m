Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A11938E8D0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263794; cv=none; b=aoEVjI9ZvDaMSgrI+SFGAArCDqubRudL8Px0Gz8qrcJUmk1rDnHc5412J7bGdjhNILbVimPR24/RNzd35tAI2p9ZtUfTpQnThVg0vXGPMq4j97+0Dcn8u7HpMebtGYZDLCYVqFWseyOJw744FiJiAAk+5BKTX8MBfl7XMntIAXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263794; c=relaxed/simple;
	bh=ySsNflPIiVU4e/VJAHgT4i2UWfIvcR8w6R5BsUuP8Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FptfNsIklLYVr8N3p5ekTU/QGGpHYxVHuPGH1UlfsI937CyyAn+HiYnlsOJlRx3HqheFLCAe3ae3o1Kwi0X9+bUlH8bJi7eMg7SyYyuW8tH2VgHi1i8yQf/QzNvJvV0zOAU8JDjk5Vy2faqGP6OvI0jgnYXTaHoocW1cR56Hsxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=G/zP6Qsc; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="G/zP6Qsc"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-81ba09a5d23so2613424a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791263791; x=1791868591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aSQ/O3PgDhZ9woaoobq33A5AiSuAlUPvQPd+XWa5fU=;
        b=G/zP6QscprRwchv8Fm5FJu9YQeilgUg6NfiX3JQ9w1p5NdA1eo5dfEwLHKREqpWA0d
         KgpFrJokUaRD1WzwampmmDkB/rsKq6fVdx14LY2bSf1G+4usPp+Tf2jElDYkbOXdTD4X
         Ll6RMeXyMabb2+45+PxQzef68Md4cx9Jym2Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791263791; x=1791868591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8aSQ/O3PgDhZ9woaoobq33A5AiSuAlUPvQPd+XWa5fU=;
        b=Ksyo29cLjWnRlzY/yJuZpPTA2T1HNjuoaQ4P9rbMGBoCdLbBuA1XfMw2uMlxggeOac
         xz709W5Nu/Fh7EujMIoNYEPpFKWwkg1XxJhJwIWeJCm4DoK29wgUGVHr0WNeuLmuUFsn
         dhCjbVok1+1ldD4uxLexelEaJJIWtV2Wz0cJPn3tml+hwoiOUYncso/ksb/o3ASjnwfa
         YJ1bmM3M628ee9j7rq1URlPJ9eIv8ev2DmCFcjjBh2MaIw8hDzbgPRn3atJeM83XcNKd
         imXGISDZ2iDtDwxV/wcwYLX1o8hT62HZqBazFFy05Q/+zeTJHE+HkUzvPqY7OciyDHkw
         GHAg==
X-Forwarded-Encrypted: i=1; AKwUvBzxHUKxRbwN1tzzjso2v1zZ0n1Ik7C+oxYcoNPhynLgeHcFq8vcwooanpeW9WFLEUiWqK09TnnJ4uZTJWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m23Uc+wRwA+RQpWVwpt6Z+ZaPCiRaoQGkDvlNXCIAK6BltW8+z
	m03B1tJ6zP18XeHGZNNvn//1Bawct7HG7f14c8BgY/wwrnBZwGX6Oeay6oWGVZH6syg=
X-Gm-Gg: AYBFou2U8+C7X6S6PYfOkCkrcbH1bwy5rvWXRO54XITgflHPU3RXbQ9o7xmAyTykBIg
	utk2hhc1F8M60Bobazuqs0BMnRb8A069vXIPNI6CuTBfIutkbxHzEJMXokINxeDJlzQ0ozZsq3x
	bjz+ZkU1pAUIGoFWQLJisY9+T3uMqi/jR3Q+l7EGAmf9CEiPk9r1pN8/idRs+jG2vkW2WybiSM+
	b01NsZhZJeMmFAKTIw2k8hsA4CczrTTnYEPiKVZVwtHobzR8ppLXzLGWp0x6lno1+kCmGDgzumF
	m+rAi9WRo2yKF/nBW87ZHIjIK6nhYh2HwVBknmUb2HGrj7r9e8eLr+9BjCXEzkWBOVWYPNhya3X
	D8z6uu/6mx1oloStisTLxbhnS+d7F46eQ9ITQzYkrD+vz0l2NGDlFbg2PsITKxPuitmGdWOhThx
	3hCMoJHV57fyD4K1eEsH3e/Igwqnn6TjZb7JWDL00JeOnoOrl7Ty1YF3cQKDPpvYQ8HV7MHa+Oa
	SONBGLiaAUBRKlsu3wwLhBtrOl/zzVCyD84JKTU7WPl8eLFJEnZOzNcIqHLTnlkZSx/ou27C/XE
	C7M=
X-Received: by 2002:a05:6830:6d2d:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-828a264ee0fmr220570a34.21.1791263791527;
        Mon, 05 Oct 2026 22:16:31 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8281fcce238sm1622898a34.6.2026.10.05.22.16.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 22:16:31 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: net: packetdrill: test RACK after partial undo
Date: Mon,  5 Oct 2026 22:15:27 -0700
Message-ID: <79f83ccbd303db0a3d7c7afa5c94c7817549bd9c.1791248202.git.nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791248202.git.nramaswamy@openai.com>
References: <cover.1791248202.git.nramaswamy@openai.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Reproduces a partial undo bug where a segment is unmarked as lost but is
never returned to RACK's timestamp sorted list, which makes it ineligible
for future fast retransmission.

Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
Assisted-by: LLM sparse
---
 ...tcp_partial_undo-restores-to-rack-list.pkt | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt b/tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt
new file mode 100644
index 000000000000..c07a2f8a5cbd
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Test that a segment unmarked as lost during partial undo is eligible
+// for future fast retransmission.
+
+`./defaults.sh`
+
+// Establish a connection with a 100 ms RTT and a 1000-byte payload MSS.
+// Linux subtracts the 12-byte timestamp options from the advertised MSS.
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+  +.1 < S 0:0(0) win 20000 <mss 1012,sackOK,TS val 1000 ecr 0>
+   +0 > S. 0:0(0) ack 1 <mss 1460,sackOK,TS val 100 ecr 1000>
+  +.1 < . 1:1(0) ack 1 win 20000 <nop,nop,TS val 1100 ecr 100>
+   +0 accept(3, ..., ...) = 4
+
+// Send A, B, C and D, then E 47 ms after D.
+ +.01 write(4, ..., 1000) = 1000
+   +0 > P. 1:1001(1000) ack 1 <nop,nop,TS val 210 ecr 1100>
++.001 write(4, ..., 1000) = 1000
+   +0 > P. 1001:2001(1000) ack 1 <...>
++.001 write(4, ..., 1000) = 1000
+   +0 > P. 2001:3001(1000) ack 1 <...>
++.001 write(4, ..., 1000) = 1000
+   +0 > P. 3001:4001(1000) ack 1 <...>
++.047 write(4, ..., 1000) = 1000
+   +0 > P. 4001:5001(1000) ack 1 <...>
+
+// SACK C and E together. RACK marks A, B and D lost. D is old enough
+// to be retransmitted, but this ACK reports only two newly delivered
+// segments, allowing A and B to be retransmitted while D waits.
+ +.12 < . 1:1(0) ack 1 win 20000 <TS val 1280 ecr 100,sack 4001:5001 2001:3001>
+   +0 > P. 1:1001(1000) ack 1 <...>
+   +0 > P. 1001:2001(1000) ack 1 <...>
+   +0 %{
+assert tcpi_ca_state == TCP_CA_Recovery, tcpi_ca_state
+assert tcpi_lost == 3, tcpi_lost
+assert tcpi_retrans == 2, tcpi_retrans
+}%
+
+// Deliver retransmitted B and then the original A. D stays missing,
+// and we ACK through C with A's original timestamp, which is before
+// retransmission started. This triggers partial undo, but D should
+// remain eligible for fast retransmission (critically, the timeout
+// retransmission counter should be 0).
+ +.07 < . 1:1(0) ack 3001 win 20000 <TS val 1350 ecr 210,sack 4001:5001>
+ +0~+.05 > P. 3001:4001(1000) ack 1 <nop,nop,TS val 450 ecr 1350>
+   +0 %{ assert tcpi_retransmits == 0, tcpi_retransmits }%
+
+// Acknowledge all five segments.
+ +.01 < . 1:1(0) ack 5001 win 20000 <nop,nop,TS val 1360 ecr 450>
-- 
2.55.0

