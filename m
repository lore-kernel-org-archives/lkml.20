Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF83395AFA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854768; cv=none; b=Fc3N0/5V2K5af+mAylHhZ1eQGlHS5h8fJFPrxaP6wbGnoiXD/mogkf2b0hRGV1A1/ucql+1FwNfN6IpJLfqLUUrYFV/4AH8zQrXrIoRSlEF2EiTxHna4HJQB0CNtjKHqQGlSAY0HizhWyfOjzB5Q7tWtb7PXw2vZ0MpX4FHlZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854768; c=relaxed/simple;
	bh=Xbiwc9bTp1EkEubv1D0ViMYzOvjn+Eu93wu8+NPZq3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=in459W/UfQa3WZqSi33+8umyr33mbbgHv9/jqW6+FkNqLsJ+rYRqa42Ok8rEPFclBxojR2DyhGkTBiUi0q/CkzlOfmRtQcv0cwuvVXJDxbd9I0dOQfAA/rPf8ynA0K/Z3MDWlm4IS2dwOmmBZcDBMNEAwLwimYNM12EvU5oDDqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c84LeiK5; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c84LeiK5"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc52bd91929so1380118a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854761; x=1790459561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2znhlPEKl5shf6DZQhAnyPMd22p0ZtJVE0FQV7SgyoE=;
        b=c84LeiK5KeMz8Nlq7quRXgYSoeZRjIoeoGwJHNzTTOeEM+sGoYGKZKPC9tQBq00N9g
         tWssRvqiVzlTRAES7PzgE8AkmcQ+mpVvkMIbO06MNKQS3ZF93D4TK8tmeY2KA+qTFSL9
         GxpLnTgDSJatWGqVWsnSqerZAQwBm/oCK5k/70qoBRplMhGZjIVftLB9pAagTWeq2iG0
         36o2ahUzCuFX6xfoNBZ5K26cd7/l+C+c1+Hvw9dzKW9OBT7Fglu92hZJ9LYV3Cu1exgO
         zyBt+akCov6HpJ+ppy5zssB8b0KbIiGMoyOqrjibRqM9TNdoS+H3xTNXeIK1qA6qoqMd
         V00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854761; x=1790459561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2znhlPEKl5shf6DZQhAnyPMd22p0ZtJVE0FQV7SgyoE=;
        b=swZeXipmDwWuz6jSzjGIJTiss3ZrZGOWdjvzoQmZgxGu5k2NV9YQIZz4EmLRipoDBt
         9xkqoA3O383Ub/NC1lHp4BOvaQX/+awgsfC4haDInMq/GfLnWlcFO7Kd0Mra8b9EfFUP
         C/bXTZvh4Wz8DTR3WSKB0GPOI1Qf/T9HtNK0hVLDEWXWGc/XF++Be84Gcp3W730Rwwu2
         eVlwE54bELEQYF0jNmzIN6bfpFVGOfkMV0csHRyzlIL+ntVOu6E7l5d4+rkJV0SWRgYT
         ERo+Gqnh1eOaZBtI9ZIftk8zVIUsVqHROQN93KpInbystrPouDrMctKo/TP1TZ2nfI6q
         9dQA==
X-Forwarded-Encrypted: i=1; AKwUvBxfHzOzRlQ2JQKrBhlha6JRlHmjsz7Q/wYKCIftbmRD0EEEZf7fFVBZc8iYdR2skGyAe5C2OcH68U4QVUM=@vger.kernel.org
X-Gm-Message-State: AFuF++lq5gk/W7dNtMWLflK4O+I4jbwcQ7esC8UQkG8WkGwZ807xowqE
	3/ZJi+yUej5SZo6KpmP7NiZHBG/InaJVNooKmnj8WeQu0mBJI6mwbCsF
X-Gm-Gg: AYBFou1+cixxKYcYo8Pwp65N0foVyoI9V+wSJzhkrZY+QFVt+X2IgkD5IVPkGxQRrXf
	RO91NTXcMykuD98SRZXnOwQDKCXHi76qvgjt8v5ru/iK8bx42W2wPF/JGnqkcp6vTcFweAaGo7a
	neQtBTxnWxX8pIBXLQu9xKW/9xxbdCa0zJ6oCH0+f50Bi6Gug9lEF8vdVuTdUjlGtr2/xpZv47o
	jG/ht0XiMMs+ju8oq8wsgr073gOqhfOTzuFbhwOPT41dX7r7AgRhfYQniLa17xHE9H3Z/7uG0fQ
	qgC2Jv704xUZqn8fuj0hIxZZphm3icqtI+Eiicfxn72Oe+LV1n3lKorybKQNhuTALSxROn6wHOF
	N250RIvlofrRe7ZeAZ4VR7mPJuFEUtNdZB100tlJT1nTJ3bZ03+ja2rzoaXbkAjmbTA0C41HwJp
	qxNXM2yGszyErmlt9hXFolIRQhMJPm/WoIX1GVnXMc6M6bDhtvC7YomTU016zzcf53IB7oSryJR
	KJvAMwbgn++Z9UthuVP3w97/KBVd86W8qG9ci7t42aF3PJB0imq/3wimL6u2GDceb1R3SE/8AYm
	vdOmf36w4c0=
X-Received: by 2002:a05:6a21:32a2:b0:3db:4e0a:df51 with SMTP id adf61e73a8af0-3dd8c5297d4mr12663880637.22.1789854760987;
        Sat, 19 Sep 2026 14:52:40 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae8bf29sm1329321a12.12.2026.09.19.14.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:40 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xfrm: validate protocol for XFRM_MODE_ROUTEOPTIMIZATION in verify_newsa_info()
Date: Sat, 19 Sep 2026 21:52:39 +0000
Message-ID: <20260919215239.3471352-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In verify_newsa_info(), XFRM_MODE_ROUTEOPTIMIZATION skips the protocol
switch validation, allowing IPPROTO_ESP, IPPROTO_AH, or IPPROTO_COMP states
to be created with XFRM_MODE_ROUTEOPTIMIZATION even though only
IPPROTO_DSTOPTS and IPPROTO_ROUTING are valid IPv6 route optimization
protocols. Enforce that XFRM_MODE_ROUTEOPTIMIZATION is only used with
AF_INET6 and IPPROTO_DSTOPTS or IPPROTO_ROUTING.

Fixes: 060f02a3bdd4 ("[XFRM] STATE: Introduce care-of address.")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index a2587c7e796b..2be800232847 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -698,7 +705,9 @@ static int attach_auth_trunc(struct xfrm_algo_auth **algpp, u8 *props,
 		NL_SET_ERR_MSG(extack, "Requested AUTH_TRUNC algorithm not found");
 		return -ENOSYS;
 	}
-	if (ualg->alg_trunc_len > algo->uinfo.auth.icv_fullbits) {
+	if (ualg->alg_trunc_len > algo->uinfo.auth.icv_fullbits ||
+	    (ualg->alg_trunc_len & 7) ||
+	    (ualg->alg_trunc_len > 0 && ualg->alg_trunc_len < 32)) {
 		NL_SET_ERR_MSG(extack, "Invalid length requested for truncated ICV");
 		return -EINVAL;
 	}
