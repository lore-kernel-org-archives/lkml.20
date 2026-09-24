Received: from mail-qv2-f29.google.com (mail-qv2-f29.google.com [74.125.230.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDAE3BCD21
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289911; cv=none; b=dAa7Pg/xXAptfYYX0cycUNqcxfyxT8zyeTG4ouzbVspovDbyUQoUT7cTvYtRsBi3DkeZEd1xQQkYe7mRE5ETNVWJMV41TUcX8LYDGymkki73a1FX4GFfxqDZ7jV+YhFjsOjp/mmX6phf3MZOgMkNdpTok9UsDmI65amhauSQHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289911; c=relaxed/simple;
	bh=hjUuHWkkBcYRtfj/XtAswF0PfuEY03oLAlu5g9qB+GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFWUoeIvPbrEuzDzxS0gUYrsIMw00KZbYhmXfM1nYzqnFea6dc5SRAuxLs+Vi3vHfz7Lc4Hqo+GfD3pf12iqOoGnKrcGVuRHHzR/n89cUlWEOffbhGFTPROcAkr4FnmSjV/oZYjkiyAEQw1KL+hg72agm3NaoVUzXohmNJw6F0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=TWfkoWeO; arc=none smtp.client-ip=74.125.230.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="TWfkoWeO"
Received: by mail-qv2-f29.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso3413426d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790289908; x=1790894708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UeaKDhJpyMQmGlCLxLleOZeyoqvTmWi5brFDgwZJN0=;
        b=TWfkoWeODGWLYkRNAN6xOpdrfsSt0yHNoJKnFOwYZ0TgBj9w6CFnHOAo8HRl4UAFi6
         m0sLB/dpT+uSyZcqR6OwqEXzUUZh/1HvqEzDFAf9ybHpmeM2okge86CnMP9vrQ310jPm
         avpZlJT4S4NdwmQfZYlbs5yfZ6Rn3PpZcVGk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289908; x=1790894708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UeaKDhJpyMQmGlCLxLleOZeyoqvTmWi5brFDgwZJN0=;
        b=S15bPj72kXdJy9afNkrgyQ6Zr3OTv6Xm4nkXzGLemksceBv+MV4mx3lqSgt0TacSzW
         QNzviYvBlpTBnY3ICFLOS1eScMz417KnQSBfJun9ucqI24kcrQZGP7WSAa+YDqVBVrwI
         KVoWh9vdzNmXh0hTHTo6rgzMOjfXKs0uQzOzvrduFptXxogOpoRUJ6MYGIBZMGYiYCEv
         aZ1zDQFVS6Svs8B0XiL7T7LXXjX3sHCACsNQiu35aECSRxG4TELUU5/a/2tXtVDRaBNh
         9FxUIiB1aVoCY1AGRLlqNfrwg9tdi3WGY/rwKP9EptIqFE2tNbtN2VhFcunsdYI2phzD
         D+Rg==
X-Forwarded-Encrypted: i=1; AKwUvByuxafE3vkZJZ72Xj9Seio2QJT1hcdpEukAcwALZMek8ISXx65rZlucuSPUx+XrnDbXhtujfH2J+4HvNGg=@vger.kernel.org
X-Gm-Message-State: AFuF++ldqAs0xSTEN/mAAKl8S0cuqi2vG9A+3xRgnamqqJMTOlbPAC+d
	FvBGdX1CowDbvsbmC7g2mgwmtQdNCQh8TJAp/ZWmPCoGk1KmLP5HMaRNP0Q+zJalXbo=
X-Gm-Gg: AYBFou0yBmH9ApsqwQn8PLP7/PZR39c8NH7Ux3LPZBG0pdr5NDsEqwHumo+4XtyqvfP
	/1rXcHi2WLJNF6lFN/qxjbna2nVSwJsYfL+WTAbrluL2iCLn1bvsEhpqg+dbuBSEVlP/ltcqQLn
	zGBGaX/w46+fLmGhD7wf/z0XVwOJg+1aKPZeAgeCfShs9XJtv2rADDwsffBnGmz5klRNDOeOsB5
	9NvwdFo/mI8TYVtTwC29TqgLxNC86ifhubtuyEiAc+mP1veI7oBv5jp89Rh1YyrhEkSjnP40qTF
	D8mJGBDM5gI+2UgCpvr0ihjAgqMlgpfFpsS6IITCIZwjGgItJ3QzHhfjKNkKNrwM1OPE9eKehVb
	zqWPNcD41Hrr/dJMfBwikj4qkH63rQRuIkgFPAY2nlRa5gxtML0X2nKzns5gT2CpC5pX2nT31cY
	QHURL+RWJ+mxUD4DZ4WUTh2I22MjMZ5dEfBcniROIol9yQwTPhAIeXp7UHl2YcUxOSU/Dqdz7qk
	uPMCCwLFQHXKLLyz0RqGOsnyqtd29nNECbOY2MlnRNI83IcSDEyUVv9QLMGm+J3Cs12BVW/ZOg=
X-Received: by 2002:a05:620a:2720:b0:93a:83d:1d26 with SMTP id af79cd13be357-93c43ca007emr138624185a.32.1790289908561;
        Thu, 24 Sep 2026 15:45:08 -0700 (PDT)
Received: from com-94485.corp.openai.org ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e09ce4sm3858566d6.28.2026.09.24.15.45.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 15:45:08 -0700 (PDT)
From: Jeff Jo <jeffjo@openai.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 1/2] tcp: refresh TS.Recent for accepted old ACKs
Date: Thu, 24 Sep 2026 15:44:58 -0700
Message-ID: <20260924224456.55690-5-jeffjo@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924224456.55690-4-jeffjo@openai.com>
References: <20260924224456.55690-4-jeffjo@openai.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A TCP packet can carry new data while acknowledging traffic in the
opposite direction. With overlapping traffic in both directions, a
delayed packet's acknowledgment can be older than one Linux has already
accepted, even when that packet fills a gap in the received data.

Linux accepts the data, but tcp_ack() takes the old_ack path and skips
updating TS.Recent, the timestamp saved for outgoing acknowledgments.
The reply therefore echoes an older timestamp. If the sender uses this
echo to measure round-trip time after a long idle period, its estimate
includes the idle time and can reduce its sending rate.

Update TS.Recent in old_ack using tcp_replace_ts_recent(), before SACK
processing can trigger a transmission. This reuses the existing timestamp
and sequence checks, including PAWS protection against old duplicate
packets. ACK validation already rejects old ACKs in SYN_RECV before this
path, so no additional state check is needed.

Echoing the timestamp of the packet that fills the receive gap follows
RFC 7323 section 4.3. In a socket reproduction with 300 seconds idle,
controlled reordering and retransmission to exercise timestamp-based RTT
sampling, the sender's smoothed round-trip time was 37.5 seconds without
the fix and 15.5 ms with it.

Fixes: 12fb3dd9dc3c ("tcp: call tcp_replace_ts_recent() from tcp_ack()")
Assisted-by: LLM sparse
Signed-off-by: Jeff Jo <jeffjo@openai.com>
---
 net/ipv4/tcp_input.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 92bc60716f33..99baf14afdfd 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -4465,6 +4465,12 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
 	return 1;
 
 old_ack:
+	/* An old ACK can carry new data. Update TS.Recent before SACK
+	 * processing can trigger a retransmission.
+	 */
+	if (flag & FLAG_UPDATE_TS_RECENT)
+		tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq);
+
 	/* If data was SACKed, tag it and see if we should send more data.
 	 * If data was DSACKed, see if we can undo a cwnd reduction.
 	 */
-- 
2.55.0

