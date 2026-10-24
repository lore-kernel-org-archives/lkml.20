Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879476;
	b=PsVhNi0HtihfBFpfQdkY8Bia+UVDL+QSSD0H5Fzy+OOyBUz5KCgxBveIR38m8NmecDA/
	 1qDo7ZXy62ZyGQyTvbmo91SNJMqC/vD9kVyhqv7PsBwUjpqIpPMPiy+LhOUX6t6Ad8fqS
	 KT5dp9X4BC4dez7ow2dcbAs6pCPmA2CXhUDGkHnKqRYrOCXmnRvl8INRgBt+hIsX0Kudi
	 WGjSEZjTkyamkOQtMgNiPWsmURnrLPN8Ad9xZLWdQ6XvnqdFwOWASC/GNfAFLk7UWc0Cw
	 rsi9leH+yKa8bCirSeWLm4EZj+Lvk2Tb542UIeA+VgJCqed1dsink7thfh72cF3CaAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hHtZ/a9O0SltqM8PiDX8PaUv7RpZyX8CwA6SIrBRmdo=;
	b=ZJ5omjKVMvxg034MTXgUteaaYIUq+pDf36aXdhP4ghPmusb99CWskgpMVF+5ndMrvVey
	 3wgdCuntxBnL0XJo+npOxF0MCLTDUUkQJLyPV+mzjnvS6X61CYzzbhnMz8VYcl/SWf7sK
	 6Xt3t9x/wVIhST0jpxliyG5uujY2ZdmdnBoIvzaadXvV/Pg04JO3cxWCKc81MzVVaidg6
	 20LTVmTCIODMOsbQvsLf1N+sMWtS4R2gPi620PldGNhsCe2/JPwibJFl0RcHDNCDATph5
	 qWuF8W6+VATyV9UzkP+QkHeRWc8FD7NLHagqGl6XIuqc8yaqlgRTkAHmROA9x9t49BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AX3pI8ze;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10020606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10020606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AX3pI8ze
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc91ddf447so564828137.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792879475; x=1793484275; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHtZ/a9O0SltqM8PiDX8PaUv7RpZyX8CwA6SIrBRmdo=;
        b=AX3pI8zey3LHSIUBTOLj/bayKWdBhrcacs8xqYDR/8q0fMK5lajH+2IXNfErO44yVE
         +Xa08g+SMFrYhq1PKA7KkEFhDHO9QCR18i2fcK/vOlBDtqyaDeaNxnjavaQgAN2q1CMH
         /TAMii9WeqxRXKDsV4gkzGAa2v7lDXmsqV//k64l6ylWtlmdy9iPsTxMoOxO9vLjOOkO
         QccnkwilMEcwjiXFxrXJ1kzrjF+Si5sNowYavmnQ/hHq6GqmXt78TtchwEhkSiv9EvPU
         u7i+RoT7VuPfYZzsiqmmlW5MSlk4dclmJgH8/dVilX1T4iPG0aVvzfWswrj30SdBe+MF
         zwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879475; x=1793484275;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hHtZ/a9O0SltqM8PiDX8PaUv7RpZyX8CwA6SIrBRmdo=;
        b=kJ5JXxuVohnZHbFUEUjUt2zl/8MB9/HcN1cFFFFF6oprSfQ/z9csKU6aXN2NN3ihED
         u6lHH+V8a9NDV5a2XOJ8eLGqVCx8CJ1zEiqGKItFpr9lp2YFxsu1PgCFFF/Yyoh2G8/k
         /hRPNxiT2AokFtwWc1ODDeqjDe28U71X6OnnLnwQMPbxLZs3RhuzLEWnspg0gI3P6QtK
         adr4e4y+KJU86SAWBGqvf3kqZX3Rdbvhi6A1ifDz2iY2OAy6r4QdV4AmKn8MQ+mr3BL5
         N4gYchm95nD/Mmy1D7Z/i4U/4FvacUyTqe+t9A22tgQXdRXNLCqxOWwVxwJR51cznb6B
         oI/g==
X-Forwarded-Encrypted: i=1; AKwUvByCUVvS/hSbaa+PnJoPNfq0em2l4oQRvVSUAAaXIukEq/6hCmPHoPVUBVrmh/utiZI19kRJ20J+jWBXpiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEgpeHJdwoUwJV0yHfF8Iz4zP+z8j1of5wGSwUbCpvQ3IBYFhG
	QsUOWDeESgPcXQhOtXi+J6IvZr8OxpuAJx18Oyi/3c7tuOvmAgLbq4/Y
X-Gm-Gg: AYBFou1OmIcl0BsCuNtCUZfgMlaRQQ/bjxamyixnBgVFvUSVozMhl1ScoT8dcRP2c/1
	o4MT+DhbW78OFP52htP/AG1mYLgL0NWF13maP/6kyjgSmYrT+bw7AeRWtn1LCMx2fnBeCNgvlSD
	EA4LA09FkJFcJftr4qRNwqMghJVEFqkQu2nN3WtgnnfsryJ3cBEy7QfuptxHTr90ysEn5SBFNui
	WIOTy68iTfeOtvTQNDLlRb1ycfGuVqxUsItjweVfLq1jDIm+8tGxlYPyhNGL7mr4lOfR0nebedN
	RIjl4JVqXlFZPr6k4ZcJXa32If3FPaPgSIkwStghEAQSFM8cefU0BJ+ai/VeFoWlCdzo666vbHv
	pa4jZffZEor42IWcNOh6BlmrHp232b4zgQCI9Y480HSBjquDu7N9an3GOYvVbV8UvTfvjQVwQmJ
	8gztfpE+Y3xCfywlVceGl9VSY8dopGpl0qEPzUu9fhUFNgsuUX7I4zVdQ4gZGf8KLKSD7CSo0Qw
	CfEDWCrZGJ0zn5DPNjx3JCcawuAohLWhzBL261zwh+5hNuwk1oeJQggatYFYULBhURYR7sUWx5G
	W6MRqkYPqaS3il6DHCfu44gRApZMOSPnYD8Nd/f7v+Fo9y0ohP0=
X-Received: by 2002:a05:6102:955:b0:7c3:2b19:6266 with SMTP id ada2fe7eead31-7ce5cde704cmr628194137.22.1792879474958;
        Sat, 24 Oct 2026 15:04:34 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([2804:7f0:b101:277b:c08d:c9f9:7c08:79c4])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b7069sm3604395241.3.2026.10.24.15.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:04:34 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH net] net: mctp: free reassembly head skb when key_add fails on SOM
Date: Sat, 24 Oct 2026 19:04:28 -0300
Message-ID: <179287946888.17431.11219154409333681184@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

When a start-of-message fragment creates a new reassembly key on the
broadcast/bind path, mctp_frag_queue() stores the skb as
key->reasm_head before the key is made observable with mctp_key_add().

If mctp_key_add() fails (a race with another SOM packet for the same
source/dest/tag, or the receiving socket going away), the error path
only drops the key reference via mctp_key_unref().  The final key
destructor frees the key itself but not key->reasm_head, and since the
key was never added to any list, neither the expiry worker nor socket
teardown can reach it to release the queued fragment.  The skb is
leaked.

Free key->reasm_head on the key_add failure path before releasing the
key.  Other teardown paths (__mctp_key_done_in(), EOM delivery) already
clear reasm_head before the final unref, so this only affects the
failure path.

Fixes: 4a992bbd3650 ("mctp: Implement message fragmentation & reassembly")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Found by code review.  The reassembly/key lifetime was traced in
net/mctp/route.c: mctp_key_unref()'s destructor frees the key but not
key->reasm_head, and only __mctp_key_done_in() and the EOM delivery
path clear reasm_head, neither of which runs on the mctp_key_add()
failure path.  Not yet build- or runtime-tested (build environment
temporarily unavailable); the change is a one-line kfree_skb() on an
error path.

 net/mctp/route.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index e7c95eeac..3d79c2031 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -552,8 +552,16 @@ static int mctp_dst_input(struct mctp_dst *dst, struct sk_buff *skb)
 			 * can do is drop.
 			 */
 			rc = mctp_key_add(key, msk);
-			if (!rc)
+			if (!rc) {
 				trace_mctp_key_acquire(key);
+			} else {
+				/* key_add failed: the key is not observable by
+				 * any cleanup path, so free the fragment we
+				 * just queued on it to avoid leaking the skb.
+				 */
+				kfree_skb(key->reasm_head);
+				key->reasm_head = NULL;
+			}
 
 			/* we don't need to release key->lock on exit, so
 			 * clean up here and suppress the unlock via
