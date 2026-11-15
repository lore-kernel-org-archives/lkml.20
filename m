Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777697;
	b=uhovNU8Cs/YqMeFe6BTNWNEMCPNvJ5jNh83JWPmNXwArgen916GzZeXKgULQLBwtU1/G
	 RG1gMcgE8NVl2rOvJRIpkRyjdOAZBjenuOn/mZ4xJR1qZSmWPmg1ehos1KHD6KZBBo7L1
	 WM5c6Mi6C+pUJGON0J7e0sXKTknH5LAScmXtigNoMeaB3mBahPYMjti+g+7yXx+9Psco1
	 1A99sgIvKhd/gPCT8jwe9Nx5YpC+cFf3Rr5luV5T3uVFJMvHkHmxPlGBBxcxvGcOLEzgm
	 /OrpmFSQqt9n/xojbXYspPaM7sXXa2SrCVue0qpzOaDS3FO6aWpFMn/znK6dDc9+iQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
	b=SpeNMfpWitAD0gb2rKSLYOwFfswQSjWA3vchWvf5vE8CEZaS62/4llr39JewQWiuvrGA
	 z3U7Z5+JOFryeGqnLrgWOHAtdOiU0iePnR5bL76GfmiInhB6cfNxOr4t6chuQlGHfBeHs
	 kQtB4uYYouLFbvg+jDkrEE/NjD4py6LP3VnZbyjju69DYO37bHX08cd3DDD01NN8XNMUz
	 Xo4JaVML1//4Dx9hBYg5Q+94K7chW2oUlUfVlrGLpOLNqv0zf7SxEF9sw6qB6dRt4IAxK
	 hoRKnOBAX0jffX28LKiODqK8UMtut3s+GwUwUpWyRaByoqDyJEQupsT3ACmbYdx5hrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agEhoXKQ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30391606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30391606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agEhoXKQ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4af52002471so4203715e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777695; x=1795382495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
        b=agEhoXKQZko8bWKNlYxvZnSuZxTEFOAB6dprNXg3wBYx1g+Ln8WIwf64vbZs/XcPON
         0/QhMLpasTuzhFHeo2IeqL71xMbjbhWyUYmFw7eXnGCKieUdV3jr3VwLzkL89cSULzMB
         xAvKL6ck0ocm9TP4QAEy8ka5xvnobcyDJ/jRdS/TLdB/oLEFdQ+iiGgSOOmZepsfkYgO
         DVh8+4lCkqX8Vopm2PCo+FoTW7JhKM5cHIbSPA5fWhJAK02mwBR6AomTb/JGDc8S+xo6
         A4wlSMc3Qxz18C/gZ6OW3d3yJHpIFgPY9uvsP2VlxtWYVPLc9BnPdg6CEmcmdGzqNWv0
         uCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777695; x=1795382495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
        b=yS5pMJcfeW1s3AVAy3G2dJRF4CZFBThc6m6TVOJ/xxK1S7FUaGq43HmYm8sUnhtxNc
         zJoBDsGeIt/5xwSACRFbw7nHrhOW5Euux2xkv/34Nm9fkj7dZMbn5DC6FBlLBTrkLgdc
         Jl79bBrD1FBFy5V5KQTQgKieKbvQP4zz+B9h1yYXHZfhVhg4bobyQACvHkjK/eLoXcG+
         ePS+kYfatyvfnGBXNafTNSeydCBJvEnNEnDL7jxV1+/eLCeFD6RSqLziJJqoI0b2uWkQ
         YZ7RCvg0/lFhr/wm0/Rrf8TqrwWWdsHlBX1z8tNydBp1VJjOxrToj/LFYJqaJEcZnVu8
         H5Qw==
X-Forwarded-Encrypted: i=1; AL+hErH9gioo1LyOrXk+l+Drw43SqLKOPl/a82BCB5zuKrzKB+NYC9Om3xNvvNoFZvKA8ELxVZhGG7fIq03pMBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IvwVwKjJwIk/A/AsGySaNkUBdr8ych7S+k1x5Nk1A6cXvKw0n
	5oAwqYRXQcbH+EqH2+ltoFXsDYeOoTnE3ymBrkXYIzXBS0Vp/x15wUlD
X-Gm-Gg: AYBFou1fh+hf5rGhZ8UEdZiMug6+h58cq5MCT10AVYnnMBMp+WJCzL8jQ+hlYVZffgc
	nZtUQgMvNUDprMMi/u09n42Ne2ovI9+3c4T1jFtcufROxZLIwdSQmRNmgp3+Z8LaFQkmENWiSh/
	Nd3lVWHmcDlOYfAwGX6GKMHVBMadixpyLfOCJdtoO/yQZsWGfwqFwwpdstHBXeVu+jl2nA0sxKv
	Y/fdc1t7RW5MtoQx6OTL7hA6iJY+Pyz4Gl8lOZ2r5htW04Zqr299RzYzN1jp0HMocl+MNcdS0Hi
	TkSnNuwsNtHi/wfmqQ+gRNFhenbuvlayuptTsvQm+7CWxF81c5rZQ7QdQBJt9AN8haFrmau7ZFl
	v5bAdp/xuToRCGkVutLeVVUzz6LrqGNenULL9NT6lJ5lkvHfRDmn86nk3zH36DI/F6JYmVVo6GI
	YtyTDSVMY7Pvy+ubxgHKGkZWm5WJbzbfQQ+pabo+F05ApiB7fAf1be/ljo7ZV/EthGoG1VjJKST
	R7gPL1PYPwAklWje0VrTsEbAftOjb0cWVWBHXChXvPj8p6Y3Kfz99PBKQPcA8swuytRBK7smf6U
	V7SzTpumiwMkJnjLKHQWgknEsVRauJbIVjuK7y+INBvEsvno8Jl8/BomuZJIeOfBzA8AF3gR
X-Received: by 2002:a05:600d:644d:20b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4bb55a3f05cmr146093485e9.2.1794777695431;
        Sun, 15 Nov 2026 13:21:35 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a0ffcdsm217726975e9.0.2026.11.15.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:21:34 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: kuba@kernel.org,
	tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 22:21:16 +0100
Message-ID: <20261115212117.48496-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Fixes: c017800af5c71 ("selftests: net: veth: test peer ndo-xmit after GRO toggle while down")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..5c1dbe1516bb4 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

