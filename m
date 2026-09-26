Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E0A33262A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386102; cv=none; b=igOc76xtLlBkRmO8laHIpWKD4+peDMIw85T2W0po5wueKvU12VAYVKbhx+4K0XnUCBQSv7GUd+Z2TwbjFZ3qaNMQB9lXOmviFKwTr8WD7/QjkgTZmF3/0CUZbqotAFhxY+cYruOZGLxgOgaTjFPt194rFTIIoI49LF+rhRx32z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386102; c=relaxed/simple;
	bh=8f074t0PhW4bKYmSqUt9X0UaX6qttBGQDYhsJlTCgsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsH/U/JRoiRikKVJGl3jYTfFY536VgeI9Rb9B4SilMWZKi9SCdVZxUDiLzwTw4zZz6WXlBEXpMU7AYEBC1VXZLjIzV5p5NzHSAEde6t2EEC9yWxjt8dovr7S5W+P/OpX+UmG0pNH5m9SElrvMceXvE+QcxglYbgD6asLCsfadeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg50hycZ; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg50hycZ"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-8175f76732eso897350a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386099; x=1790990899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ceesP0p9wSFk3r7eOvCPcEnEaxwgQZImuOn8nzfUzVI=;
        b=Yg50hycZffOpgymx+oaSY4I4ygK9OwVQCjcJNRBj4JhEUcXMwyIyceQxh2/hXs0MuF
         bH4uwOVEG+lv31cUsUF82cDxVYC4GLtL7LTmKqhUG/RPrPIF+yXS4sP+wVm859Kn/Pw+
         Mqv2FB9w/Ok12hCiQYscB1MtLoJtH6L+oNXrkEh/N+cYu6pe9HYe0qzNb/dX2q9SI+XW
         kMG1e4ttOwgexa6st3D07KOKArt3KOVwfr9Jv0xZUTxSlubk1c0VK75qD/DuNBozRMYj
         1ctwIcqcAgjNjMw07ZDXgjsFXYph0Zy1re9mwF83KRvBYa/af1DK8L1kiGgh+PY/rx8i
         JdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386099; x=1790990899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceesP0p9wSFk3r7eOvCPcEnEaxwgQZImuOn8nzfUzVI=;
        b=u31+TxrfjP1u7oyaCaN8JHc1ByCtlt+PJhENaBN8cnUX4uCWlzxld1qxT2ZpH2xmCR
         a06xJPsxO3RkwPituTSnGRgUNJkREQjQq09lsuuccuD3tJUyoCrGftfVVygMG8rl2XuP
         LmeUQOlAy3oLd57oza6tYVsgVD1LqPjkYPG300UxnwRNlV3BydZRHFvQTijw/s8GaB9a
         nmVUaS2rQZEYzDzCmkhKBRDqK4KQokgnOU3oTLkvN1VF/W28nH+4j4JihjuWSmppvK4i
         M05+PwWDw2B9wses+eKe34BXR8WE0axqL3I1FVFmBMd0Fs/8eW929aTDhKgOZM8dq+G3
         5SSQ==
X-Forwarded-Encrypted: i=1; AKwUvBySh5+7XXYR4rIeT1E50n3lR2fCh/bbCam2yGEt2P62KUrdqftbuReVVJQxMrXM4CAMIG4Ir68hjPe1XZM=@vger.kernel.org
X-Gm-Message-State: AFuF++nlDQve9XhGIz8zefKP/sEfane3h3q41aDyWXckGvOOuSp9qevD
	7htx7fHa5vLxowvd4/P9y5Dk5HeYWczcdgoxg4MRNx5ghm9ba3KDKMhK
X-Gm-Gg: AYBFou1ADw2Y2NkdLTzJIVylitBdQ7lxQoBV+pS3pQ6fKnvWWWVUP3Tp2NdXtsI5D1m
	s4g2XNwIhO1KFLmdbVzpM0t1HO6Jd0JzkMBGmmoDLhIFDhGuv5FuLLXVFJl/dbVSshdSHuQiB/4
	rGLhKrEGxGGUkw4JNYB0EUDD02Aq94BAWkfRd62T4uZfcPiydJVmAbnk/t8Z9y757QKWLaFsNro
	FbRDQIJZHjOH3o0TWkmaNr3uztbXVpgk0WTjJSp2Furnqx0MDpDLvZIDUrCtQhUh02pPf8tCFMw
	VBK5OH3HiHBGwVQ5nfvbDjtvBkttFzPl07AXB3ESJVgPPi0nEVNgQ8fVORqEgKtb3J+kVIRTiuc
	V69uCITN2P4S4WInhwGAHjAiNPD2uBXndN7wzAsl2Qz/wbQTdybyl2z+je3JDVUiCVBaJS4gc0Y
	aRk7ICPYcRHhYLr8XARI3V7M1LSlPh/uy9SruEoyhlWT4u5m8n/2oRlPHXYZ0tIO2GVHiz
X-Received: by 2002:a05:6830:dc5:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-81782c8976amr9142398a34.11.1790386099697;
        Fri, 25 Sep 2026 18:28:19 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e814ac66sm4210989a34.5.2026.09.25.18.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:18 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 25 Sep 2026 18:27:59 -0700
Subject: [PATCH net-next 4/4] selftests: drv-net: psp: test that assocs
 require an established socket
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-psp-defeat-v1-4-9f0b430107aa@gmail.com>
References: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
In-Reply-To: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

Cover the three ways a PSP association could previously be installed on a
socket with no connection behind it: an unconnected socket, a listener,
and a socket whose connection has already started to go away.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/psp.py | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 0a2329f41431..6b761c981c6b 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -319,6 +319,49 @@ def assoc_sk_only_unconn(cfg):
         ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
 
 
+def assoc_rx_unconnected(cfg):
+    """ Test that an Rx assoc is rejected on an unconnected socket """
+    _init_psp_dev(cfg)
+
+    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+        ksft_eq(cm.exception.nl_msg.extack['bad-attr'], ".sock-fd")
+
+
+def assoc_rx_listener(cfg):
+    """ Test that an Rx assoc is rejected on a listening socket """
+    _init_psp_dev(cfg)
+
+    with socket.create_server(("localhost", 0)) as s:
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+        ksft_eq(cm.exception.nl_msg.extack['bad-attr'], ".sock-fd")
+
+
+def assoc_tx_non_established(cfg):
+    """ Test that a Tx assoc is rejected in a post established state after shutdown """
+    _init_psp_dev(cfg)
+
+    with _make_lo_conn() as s:
+        assoc = cfg.pspnl.rx_assoc({"version": 0,
+                                    "dev-id": cfg.psp_dev_id,
+                                    "sock-fd": s.fileno()})
+        s.shutdown(socket.SHUT_WR)
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                                "version": 0,
+                                "tx-key": assoc['rx-key'],
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+
+
 def assoc_version_mismatch(cfg):
     """ Test creating associations where Rx and Tx PSP versions do not match """
     _init_psp_dev(cfg)

-- 
2.52.0

