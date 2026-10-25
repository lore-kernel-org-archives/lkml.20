Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896090;
	b=NTNP9HpusIwpVbWRkR74RuHKx6y1VB6roNIajrU/vtGI41aM6B0Bx1EO0xDQFXYk+I7J
	 5seGpYi9NX6As9jCyjtbL26T2MHCWyL/Rx1k67H9LkPEAO5X8ptP63xvxIhMqzPNh6n8P
	 lPuNUNWUecRJ/gIQN7WyMNi0mzljlrV7lO3BoY2Lzql8QcCW6dy0syHTXlextLztn3maw
	 rgUVT+Fi2UfA8oJpSZ400/CgByJBfHs3F88A9er3KysR3/3OQiOVxRLPHrTNN2jqe8bRN
	 S99hEJwxEyUVjXE14ryXQ0owUstsE/UA4nRQuZhFTG77KqM9OBiy90sc2diqQKwSxSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wtl6lbTH0Q+TZCmlk3+PvHR0Fpha4owEPE/GZNCfL4Q=;
	b=gd3X0ovnwMB9I9xlfxg86l7a7nK2a6Zlp+RzdaOw13Lwc3tTNfje1XxGyyesnNF9EZV+
	 I4yah9DKtbHupK482FtPf50JiXSdA1E5Lo9VtbzVYLarxbN4k5ljWxu4gZna+DIux+nsE
	 ifrfyT+DKdTUEEqN++yN2vXq6zrFD7FnTf7t5DCqVRMRstaKOg7ioAQSXXcmdUdIw5Ob/
	 4VY7mLADLtJquuWgy8HDKpzwkBziHDYFBKhOeHHYEjAXtQtyn3qIzjyQdJD1Y/KcXSaPe
	 kUog26/xxpvvxDb1c2i402wpUgPDjQvk5n9zr/FWW4nF7jSeI5uMsYchq+1uvONWO+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gktkBJJw;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09347606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09347606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gktkBJJw
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea0efd636dso15332795ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896089; x=1793500889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wtl6lbTH0Q+TZCmlk3+PvHR0Fpha4owEPE/GZNCfL4Q=;
        b=gktkBJJwrpqITZajFEOqQv9b9gNtarwyG5rFvBTBypZ2QT89cNLlqtejdGSrEv7nVw
         RE74hcBozgIC3ctrvR40LOlz7Z4T6QqdgU6d6ENXBF7KOaIkA3dfcWxar4AuxUsWsXQm
         4vwY3eFbc0q8iocoK7IAzQpWmV2qBqW2iHy4KHNaHqQl8oZdQpvFqSUQ4a2zV84SU0V4
         +RTMlZo9sFFwfyhPoGMkwNsNC6Fn+1gM4BeaQ0RPO5GCGDbeQOLP1z9pHGAeBYlVmmsQ
         cN6kKjnGbPIhTVTtLAU3LHy3YxnBuAFA8In4rOstQNQvp9x7n3uR5ab+G4ieo9O1fGHa
         yjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896089; x=1793500889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wtl6lbTH0Q+TZCmlk3+PvHR0Fpha4owEPE/GZNCfL4Q=;
        b=XMUo3Dekn1d/xM+9bAopg67ggz1UV104BhXj2SOctqcu1HajCisIDWN1mdG+4lq5ET
         xt/Q6yj30HJSdngH4+X1RR6lGDHisNygPZ26J9YBStV3RjAUfYoisJX1SLPy6fmXpY34
         uVf2NU20xtiFsG4n3s6cHrWr/UZ4Pc/zvEWjXqWkGpaLX2k/kTcyE8Y609xX1nNwlHCf
         qrYFxmCNJaaDdoI0BjkFR/8lJvtpWqetIHq9Oqp+OUicyBa4NovbIrwi/QxQXQNMOZ63
         It9N2l0WRONeph167aIcsK1RqAMzOt9S+Eq3tcPhBxC4SqcAEBsA0HO07I2SayczUOKN
         MDXA==
X-Forwarded-Encrypted: i=1; AKwUvBzT08Y8h9P27GreIUDipvKDPZKncfdARbH1dGn+qX5EN1QUTGzAOVRNQ+27fdzli2fCPJFNbQfCG2yaNfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaGG6uh+itMH8yG/NBkYn6r75ehwlwVO8xbmijlhob1AxjvmD0
	k+TQQbs/D1Jn11FWqadLFhaJHS0mcf4H2GwNo8G+jCqHb7YT4+yhG6Da
X-Gm-Gg: AYBFou3jfXTOc9X8wMoi3REfhamcPayWlq+wnHcGDYRk3zc3KuYrTPwd/isskbdQ6Jn
	90KzyDxEzXDuVsHcJRp9eBt6dXuXacxYs1m9YnzE9D+rBRjMSVOy+b/mH40lMEMSY/BBX0MPG8U
	uSZVC7xmwQVNz/BtERc5KFbpE45smZ0gVwkkvD6Jjt14Syl5hFCrqADRH0BbxbjzFts6aI+fp1u
	oGnn1Uzcnfb7wxt7cOGAX/fBFm6XjSBnVSF0MlvW+3yD5Q7cnMg05FyAEAnmhdIyPwPAT6rJs/w
	3mSZhkuxG1jfcsdtiJQaqihNBJvBUnZ839YxFlolofF9Dj70kcsICKoDuVEjYduT9SxRHKpKVcS
	/dqcSls9ISwV98dLZRglMGSEr/V/uGYYUtjDSnOf9gx63YQQGLLW56vyKGT5sJCNcsO94p1Tn0P
	OR1Gbq3NltXWGcXKpkWU8pzTUg46Cwv+vFO0/Im2g3bOYKGhdj7hNGeDLtwBTzZ91glClFx003x
	tIwWUWYoKy+HJd4KlYQKjEPXQ4SjlSVa4fmt0H6U+eWcl0aw2RhNY6OrSAUh522VY0m8SgwaQpU
	OuBxwtKq7KJ9Bj36JmrW3VPIActr
X-Received: by 2002:a17:902:ecc2:b0:2e9:9f14:c40 with SMTP id d9443c01a7336-2ea9c130a8emr28640505ad.6.1792896089289;
        Sat, 24 Oct 2026 19:41:29 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6216:1250::1d3:c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a35c4sm7653995ad.49.2026.10.24.19.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:41:28 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: dsa: motorcomm: Report error when FDB fails to add
Date: Sun, 25 Oct 2026 10:41:11 +0800
Message-ID: <20261025024114.1955782-1-mmyangfl@gmail.com>
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

fdb_add() ignored any errors returned by the hardware (for example,
table is full). Return error for that case.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d4fc20c52a58..422b45085e7b 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -725,7 +725,13 @@ yt921x_fdb_add(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 	if (res)
 		return res;
 
-	return yt921x_fdb_wait(priv, &val);
+	res = yt921x_fdb_wait(priv, &val);
+	if (res)
+		return res;
+	if (val & YT921X_FDB_RESULT_NOTFOUND)
+		return -ENOSPC;
+
+	return 0;
 }
 
 static int
-- 
2.53.0

