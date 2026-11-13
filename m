Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570277;
	b=Oi7uotN0Cv8VQvef2VQxnsdVSYpzlcvtEWrVjuTstXUOaUIHI5D4mSHptit65DKdDs71
	 TCE4CIMHJ/bHk+g+otCTJeDe2veVJVnYdZCR8Hs6oAEquXhog5JXouWIwdOkVYz9nnld5
	 jJMUdRvG3Yc/mm0bkHSjPp0xYzi7C5VpX+JAVJ8dKtjtuNTb4cG46jVur+CImIXeo+f6Z
	 bdRZK0BQt6DEkpwfhW63KbanihlrmCCOHX1NdKhxghHDzin/YdqdlDhCppEvS4tj3nteE
	 ewcS8sUGRPf9WYmGxBXsuWu6WjTu3R3L9lIgitIvDxjXjHYFz/dGDBbhuUvUF8GToJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6FQtbu1IeNWQL+nRxPR7Un1AFMuLEx5nRaWh0Cnhh7U=;
	b=xrDDIcKp5MNo3U9iFA9YcgBt91BDBJ39QKtIzZnyH/aqRG7aB7hNM8w3CoNjMoDNLShc
	 CbKvGFCqqbqoqafU9AauaNpYZtezfKAaqOiruuLSH4Ey9BKhXb/+eaGnvxgYAeGGMDzQo
	 K94dgGDGXDC4LqC60jRrw+K8nooxxwvyqlIgHwnogd7Fe/vEdk8ujXX+PkcK8q6tnYc1r
	 yKuDUItEZuPLIDB3LTmqBXiqr7Xj6nhMMdePI4NdEzJA9RdXlxDzHjLAlJP9xa/ijiN2k
	 iuWQdkXDXJimT48Dn1Urt2PlKhM/+dXK86VTtKDmhtGnkBH2zni7DrHnlfWSdlzQcbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=GwdwQBnK;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E8606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=GwdwQBnK
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so13010195e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794570274; x=1795175074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FQtbu1IeNWQL+nRxPR7Un1AFMuLEx5nRaWh0Cnhh7U=;
        b=GwdwQBnKqkp6TTNZ9OmiXiyE2jPX8cmna7duS+fz2q3bZliFxpVnGlm66PGJ9QENFh
         Usm6o+Xsyc7zAXRVHuERpqOj+/DtryKyrGooKt13RfSPlcNWF8IicTMcP7ycxDUjc3BX
         V0Jcc4l9My/LL2WmSI76jcYSb6GdhF3zMro+R8qQfoTTPf+AlHyl2kg2o9dsclj/A8Me
         1zp4aQ9l9n4HFtkKyiRgzF+TLT7o8eDHvSJM2dfXwnGspshgrV/WHz0Fx43A4/C3Ftub
         heuYTKscKK3WtwL6jWeiAu8wwApYDfgzPF8pYZRDBCbHP3vDE580IhT/08oj75jLCGYa
         RCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570274; x=1795175074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FQtbu1IeNWQL+nRxPR7Un1AFMuLEx5nRaWh0Cnhh7U=;
        b=MBvp5RrwLa82L8hJKn8dkSNR9zU2PVaWVWv06T7xB8VaEPWQZ3HF7RQTSwPhO+pzMX
         7yheYD3PEIEfdb9HaDkHhwtcDJdafuw4ggsMwcf55eViCRMSVHFHMw/deF0esKu0Vkvv
         J1Z9ZroxMcSYHVhsFLf6n3pF4W4RjhIdufDba50O1JLrML/s2iDkCjv+9LW8btkQHx6u
         kEcgWe+sspknrr2GFeV6CNdj4tBLabjYarNNwZmd8RBxWnR3K1wsRG84ZNxng5uNykUO
         mzS1mOuqfzfiFit8DzPaJDPd2e//96YgGjzC2tgBc9YfTiaSaR+JnYg96fBhzvGF3sY3
         0pjA==
X-Forwarded-Encrypted: i=1; AL+hErG6rJXp0izj5PKpKFUMCxvf5Dc+pQcIQHkEHS+dvq39j5PaMS8BBYXTvjeDvIK0e6ALijX0TOoH/eZb4EA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gewjAayqzGOG8Kf5j9sB2x2AJwpAC1W3qgvB23iRFWLdBSWzK
	f7WsVoEQHcBoVbeAx/w96kmy1slE9Wi31CJlDUI/uhb+d1lVHExNz0Xdvn3zh0rjdy4kMD75CR5
	fW29nK90=
X-Gm-Gg: AYBFou0uFgh54K9gLtLuW+y6UcFIo2a3/CFsncbFIzSPBaAbbqf/nOZsNgYXrRU1e8T
	1DpX2z37dRAuY0fpa0Wf3j4Izxxl+OvBUrmuy5UBtzR30h5a2+75DknUKBbgEvBFNfXZswcB/am
	UBeupIkWrT6cEan+E1EftAf5/PqVnOWkv3MjP2qbAK3bUK1ziUPig74BDrgAEpJM+QqhGo2FfOd
	es/IxtJI9rhgdka4IVaKdNJawJGNrgeVu0g4Kwq479jbw/05WcZP4EOYn1fDILQa/zgQk/55BYm
	JeTL3rmNPNbIaWhF8u3gqghZTRZKo/u0S6s7o12s8N9GIiqA8gYG82JV9OgaFFdswBw1cNMCDs2
	BgIkeJSXVSk84+beKJeyNyHU8yHTuHB9mvUnwKsYJxRoeKL1MA15IdnbRueJb+rN/kPeKinvgYJ
	y3nvlvlKvCO9hhp7qyAC5X0gjzWKbqc/h+6OuRHxJLkq877+1E2ZbHLMFd74CUPdpCfotBGVZgf
	hlDb0zi2LI6+r5Tp/wiA+FrK5ud9rnAwoM0qU44NMItruKS/yNZ4SY4xYD+02n0g5xa73WsP8++
	ZsHiDjMFDPVaM1jLs37JP6vumeuXuHZLM4UZeqnUKGxf5x74ge+TwpQRshD2hTNYs1c7h07Z285
	2Gbn19VV0TgobDtN2+V2Vvp5y+dOWpBYbjPdAOVFF5rD8bR49OTtc
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr33165155e9.19.1794570274477;
        Fri, 13 Nov 2026 03:44:34 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm5505806f8f.0.2026.11.13.03.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:44:34 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: Max Kellermann <max.kellermann@ionos.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] fs: pack fields `i_state` and `i_fsnotify_mask`
Date: Fri, 13 Nov 2026 12:44:26 +0100
Message-ID: <20261113114427.1845888-1-max.kellermann@ionos.com>
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

Both were 32 bit fields followed by a 32 bit hole.  This reduces size
of `struct inode` by 8 bytes.

Moving `i_fsnotify_marks` there as well so they can be in the same
cacheline.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
v1->v2: move `i_fsnotify_marks` up as well because "should better be
  in the same cacheline because these two are accessed on some
  performance sensitive paths" (Jan Kara)
---
 include/linux/fs.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5b3a100aba77..fec047cc3327 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -813,7 +813,13 @@ struct inode {
 
 	/* Misc */
 	struct inode_state_flags i_state;
-	/* 32-bit hole */
+
+#ifdef CONFIG_FSNOTIFY
+	__u32			i_fsnotify_mask; /* all events this inode cares about */
+
+	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
+#endif
+
 	struct rw_semaphore	i_rwsem;
 
 	/* Timestamp for writeback list ordering and age checks (jiffies). */
@@ -863,13 +869,6 @@ struct inode {
 		unsigned		i_dir_seq;
 	};
 
-
-#ifdef CONFIG_FSNOTIFY
-	__u32			i_fsnotify_mask; /* all events this inode cares about */
-	/* 32-bit hole reserved for expanding i_fsnotify_mask */
-	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
-#endif
-
 	void			*i_private; /* fs or device private pointer */
 } __randomize_layout;
 
-- 
2.53.0

