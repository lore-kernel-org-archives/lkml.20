Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106230;
	b=e9r1QRU1XpYg4pZzO1vng1y11NG2YcMRjSy/CwKd2MDab4DoiMUruKimz1s4V8otxl3M
	 jbEWPxVHZyEMhtN2wwYzWdmb9gWNB3D7A2PwK0lMeQAKNSEkastyRmcZzaPEQx0B3IGBc
	 nMWEXQGDpgSvv/k/SB5d/xVzpZxVYQEb7EKwIiqoNvGwF3YVdAxPRz/yVRrTDK341asGo
	 9GAaeU4NVkTAYAQ4awQiROk0leFGech1X83gepPFVoGuwHkbmWtMZsncJYwTbV3JY0YYJ
	 RO+VorNlnPw0DVqKqzDGstU54VBEhip1G7mr01XqDDEStiNqAdU3XxDLApn4StdzM3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+XgAKvL9Yz88WJI2U+RHkRWBYREJXUrZL2P4iN0ZY3c=;
	b=ec6rIpiZ1EXW+QF4ii2pE53EmPKQZhfVPMzZjvs28qRmFuV50wvK9SjzydK6gjCu17aP
	 VJqFZCKg+HCCJ9z8DwD5TCm9ZlpFBu6XzwL2ex4j7Aka9I3tY4UHvEzNmRa7o2QKwZPJq
	 5VKsYmHGVsye8kWyO8xMtldPq8gNg5Xam5lH984XsStNTt2mzpzvgKLL2oPzM+ZHcFvIN
	 cOUAF2j9teuINF712JGnoutp/r7Fq6S7w1+tO4lU7MhLW0ozYhKvh5AbLaHIECTEWo6Vz
	 Qa9dZfxPD5oA5uZd5d/5JcB2Gc3oA32HZz9B/dd2Mii4wgyPEqG65uLZu+YszjwZw7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rV9OCWC5;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0243C606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0243C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rV9OCWC5
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so1229135e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794106227; x=1794711027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+XgAKvL9Yz88WJI2U+RHkRWBYREJXUrZL2P4iN0ZY3c=;
        b=rV9OCWC54JHnc2+elgYOl3F1cX5u5r2YX4E36xLsQbCNz+QaH6o10fMNpaqruDMCjU
         7w1i3BzMQXB8vvFjokaJEQ+5iD0QCIYQGOm+wQWv04cnUESwY9YB1o6wqFrTQqetE4Gn
         7JEzOWyLwbZ852yIybo/pV7ZqesvThY8h2zZUxyqg2yDLpT6TYzBhleGvnzCA4btnOYk
         PTCGmzKgjmyhhcK/qJPYdhjx7gbUJjiNo92kXyH8esiEcEoTZ+Nob2yGg6yC0c58/Eeu
         KdX2qoR5gl/FnwNco4JDmIheY3c/oC1rF4lbZmbKmJ76yV/x7wbLlDq4XJOrTY1Ml278
         fZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106227; x=1794711027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+XgAKvL9Yz88WJI2U+RHkRWBYREJXUrZL2P4iN0ZY3c=;
        b=RP59TzX09Fv2JWQav5UAS3JFMCW0DTjtNgiJsa4dvnvPMeC4hmOakDVTd6Gv4jgX0K
         I+XRLCawz8E6my+0Ak0XmibqE8rvBLc+mNLAYKGyexWRtZyUjWFUpH4+5XmtApPTJtdF
         szk/weeEIukO4SABNXiG8DDwDcrEDqKw+UGbSeHEvsltPnbz7uxAUyxUhnIxaWkrpDd9
         KgbqgJa+KqXOH214IC4SPGCr46ZNUFdZyHS7K6XF7VFJZcQgrj05hNrBhzm2rmSRsn6Y
         RpLIwiyRZawyGu/8OeSvHtlCHOioPWte/7QjFKJj/MCXveHAGqbtqJcHE92ybQjS6q9y
         HdIw==
X-Forwarded-Encrypted: i=1; AKwUvBzNQHyrccNxwnRwYmRkvv1aGI2Y3EeFiHw84ZYaBnAqPcc+aPAK5W9YisYv0gI/DgMRG5TAaQ18JbP7Qg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z4Xlk3f5tp4Lp80+6VmAVaNvtVQCoPU08oPxV2q7OmuIIgJp+
	Gm+uslC9VmWIQkzJY/M9uVFABB+mzLgX9NP+ZBJCIM34AZCYmmbEY9oZ
X-Gm-Gg: AYBFou3oHJsuWFlYc27Nv+PrC8eQpP5q6bLE/LrAi9xFqV678je7s/I7eZTY4+08bMl
	dclZui3YOFNRpZXLKMC3xeUN86uShccPWp2gCJfL38bC7aszgcqz8eI497iKeK+cejrDGIh+faI
	tulteooztms/oRT237Miq50PdhvBIWWSi6qEo1y7oAcrilV68eSvOtQF2Akd8ifT/LukcWLERqX
	XRVuMBXHnyTOq19sTEI9xLS8Z6ysvhx+SzPD2x5rcsjh61ziwV3db/olEGcvbGC2KXkhPCyTVkT
	mun/TFVDcXioEwGBiMvekgNUSbUxzkkPFraOHgbnU+IQJbhP1Jdj//RMIYEeMpJbyah6GkoLKRw
	Zy2g544VaLCwQXLX4I4KbTDnfsV/Bftxt0t/7OIViaBckBVsEzsVGSALFZZl62eBQMLtINMFncg
	uFGmkeVBhKgjycauxk3on0sKUxq6hHPnyg7QmAsMMznORvBBAmKQaSNPDSdGK2ymzyfmZXWNel+
	INZ/fUKgnSBJpOq0DRFZU6MTaSR7ClqeltJfJjN8ev+FimngbERkwoxMTFgOHvzZX47NXJk2TPx
	N42bJbxETRJNTVFcJcF+Xwz22mau0O8SuTpeMgqPLYVdmLmeehooV8f0jvNqDEBJZ+5YdnCjaMg
	JNtcFK+u6DKvyh6l5i8/f0N36WMX8i6/PrvSgxY5dDYkN+GWNVrhmStNQWu7ypqxVsw==
X-Received: by 2002:a05:600c:190e:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4b960d9c5f8mr7744875e9.5.1794106227158;
        Sat, 07 Nov 2026 18:50:27 -0800 (PST)
Received: from maria-VMware-Virtual-Platform ([187.55.90.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f10c681sm22969665e9.10.2026.11.07.18.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:50:25 -0800 (PST)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: cel@kernel.org,
	jlayton@kernel.org,
	neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	trond.myklebust@primarydata.com,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev,
	julianbraha@gmail.com,
	Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] sunrpc: Remove unused rpc_socket_reset_connection tracepoint
Date: Sun,  8 Nov 2026 07:49:42 +0500
Message-ID: <20261108024943.8130-2-mariasheikh812@gmail.com>
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

Tracepoint definitions consume kernel memory even when they are not
used. The rpc_socket_reset_connection tracepoint has had no callers
since commit 4efdd92c9211 ("SUNRPC: Remove TCP client connection reset
hack") removed the code that used it, but its definition was left
behind.
Remove unused definition. This reduces the size of sunrpc.ko by 628
bytes.

Fixes: 4efdd92c9211 ("SUNRPC: Remove TCP client connection reset hack")
Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
 include/trace/events/sunrpc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/trace/events/sunrpc.h b/include/trace/events/sunrpc.h
index ff855197880d..a0d02d735a7c 100644
--- a/include/trace/events/sunrpc.h
+++ b/include/trace/events/sunrpc.h
@@ -950,7 +950,6 @@ DECLARE_EVENT_CLASS(xs_socket_event_done,
 DEFINE_RPC_SOCKET_EVENT(rpc_socket_state_change);
 DEFINE_RPC_SOCKET_EVENT_DONE(rpc_socket_connect);
 DEFINE_RPC_SOCKET_EVENT_DONE(rpc_socket_error);
-DEFINE_RPC_SOCKET_EVENT_DONE(rpc_socket_reset_connection);
 DEFINE_RPC_SOCKET_EVENT(rpc_socket_close);
 DEFINE_RPC_SOCKET_EVENT(rpc_socket_shutdown);
 
-- 
2.53.0

