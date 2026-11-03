Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676588;
	b=k2zrIdZYQObYa4KbiLgyI/v+23lkiNv5JUJkS04a+ysDKZrNWfDVGgOyDGCHh/UGTtOA
	 V+1yE4C3LL9QwrGteNnTri0yQf3lkg+ENsXGo8qrh8i5z+s6ZIL0oLCVSXTe9tTJypb99
	 a6/OAR//bnJ+cA9lucqyFEDcoejFvBsatANvxULe1aop1MFXulAKPUhp0oIkWu4qih4y+
	 7OFHDk1WnVZcEmUpJYBnfMAUV5ynxHkf7Zkp+hfYz2/gfPPYD7yvAdQvzqWYgHtUgtCWL
	 Q58HPSMpHdw5yIxU4YATEraoMrcRuWTXYJub+nqx9vk67vYUZeMgAQ71CxCW6ctB4rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oxs2B3KfhNYJIVkfqODARwic0zLW8yubsDNepUkaIgI=;
	b=u+62zi9C4m0TyW3j2Ne5oGAU33nra9G0EMOOWywoNl+HxKdexvrF2tGPUd9xiZml7GvT
	 0x16wVfLZFlDIa5XURkJ55IhjBeRM30PuUj5zO/PkoLmtIFTaaRdMbeH7l4Brb3sA72Dk
	 3Mon/lncjN/ab/UA5MWV44pzlK7Bw6CuHcI8FLwY4GgBSU4U0PgapPqpq+r5Ur3FcVZ1P
	 rqz41n7jtb8iKAW8n7IFHqY/iFivrrtop12Oej5q6k8Bax7ZiAZBK1JuzsIAcUjKTfMy0
	 8AQd5ggJ78GBN3HzBMzwK8HSpP7YhWysN8aEYSWrwoHbSMh948YK1KlvUx6DUobDcJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMWhhZqm;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B88606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B88606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMWhhZqm
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso22651385ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793676587; x=1794281387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxs2B3KfhNYJIVkfqODARwic0zLW8yubsDNepUkaIgI=;
        b=AMWhhZqmR9TIixkMWH2d0/BwYbLF9qPxWAXEhyiHO0dl08UPkkEwn0TtRUjxhKaVlk
         MyQmbcDYkioBdJ6E80jsPgMZJN5E8Xl1u4bP6ieiuCXyoQgRoftMj7BrLkQTGb0EU00j
         m62A/BdB/rS2zyz3voYU5ZBko+EjPFc8q4igOgLoS5gnnNSrAnEBajB4Y4u0zRIeShXX
         IbOPx7YD1GF+6QCl7LT7mAS55Dp+ZqvFa/aPxCxjBUi9Jms/ET7Xvozb1hNLXDqUDXFk
         U8zzcNfmayibIlOmv7uafT3IPx4cUp8mhMtQvWsXjH8EPNzCOvVlTjvvobfTKXAVZoab
         edwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676587; x=1794281387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxs2B3KfhNYJIVkfqODARwic0zLW8yubsDNepUkaIgI=;
        b=urnwT9ixM84wmcbj1KGFt/jq3pmmAVRVWflVrWTrI9JK94OrNF37KD6+aZ319jJ9qA
         zTpDrmbugeGg+fpzSXfFFnRnMFgiQoL/xNKrpnjVRR1SuXMvCzBf5JGvON0oh6aLZq9Q
         dsxj6AOu+P4Ve44+aU3N1J7ZFzikFz3G7QsDfxmSsZrLOhy05Ylk4mWlEc2ViULyOg45
         WvLRUKdMzRK8x7ydPMSAVKyV1e8N0VSwklQtkUOXc9nEaD481n+rx4Hd4v80vySVShZS
         KtuU0mIag/HKuKBa4fTLgmB7+PwnJi3Z3Xn2aK5wT9Mi7OkdNvlJfe5j6kcBRpGuiuJl
         uhcg==
X-Forwarded-Encrypted: i=1; AKwUvByKmjNulfXD3YIIYQx9dx4+n9RipIitUsKVqZjOF8VvCS8ZDP4WN6qSlxFNFM1wFZFnulgyNV89bNa8BZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rgjL6Psdx9pW6bOkR0oRyatKqXcNblsT1XKCGC8P3ssqIdK+K
	EvBo4HZydXVQjYsdu6g1CKFC8fm37h/nNBGpAxBr0VBGryhDrSwoq7Zm
X-Gm-Gg: AYBFou1Ie9FggLuH7HAdUOjhK2UGJsnvI4cvKxKn/zZK+yRIGcstx8rHh/3XkLkMvtd
	/5UuPYEtf6Smkvwo7ZYiuGxgGV/xW+aHJtVA8E456f10MOKf6t9qfW55qjZ65tYRf4MJ/7ZgmSH
	u74DfSZx8d5Ezrmd1megwDdN6FU2ayv2odPjittWRK0VDxIyyYMYOW4yVDqvsYQWiUL+EusXGJH
	J+AbrbdIZUO7qpx7qNi+1F8nC8Q7xIrg4XpHVZjt3Cd+Q5LCJbzyySpw7bymzqdNxWtYv1zX5qg
	tYCdoJOYamy3jov0jH4d9IuZAW7W0krPgAj+K++oklgKGRHRAS+m+foanTJsw8jwS/IeK3tyVGW
	FLijXnAYe8pH8CKHuzFyZeMHU2lMKN40QyQn+yw5nDKBV6ABugxCZeJjlF9+aGDF3kcGTdtmZoX
	bprorPY1JzlUZTxv02nkmmlTfZIW8W7MIpYPpAUSxCvuDhwhrfa9xRcwH18h5ogGh1TDE+pzy3m
	d/L8MzkSLrg++NoY/9rzkJU2TY8hBt3cnqZc3Nx0dFBgVJChYzLNZjvYGs7XSx3gJyZ9r5DbfC8
	MNp9CwPxtrNiYATKVu9vACTzYLWc1PrdFutbfA8dmMSUjsps7CKz41Z0TD4EQmv5v1FD
X-Received: by 2002:a17:902:e5d2:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2eb364bcec2mr126948885ad.31.1793676587056;
        Mon, 02 Nov 2026 19:29:47 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928104asm33984555ad.53.2026.11.02.19.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:29:46 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KEYS: Protect pkey method checks against type removal
Date: Tue,  3 Nov 2026 11:29:40 +0800
Message-ID: <20261103032940.51826-1-0xbeac@gmail.com>
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

keyctl_pkey_params_get() looks up the key, and keyctl_pkey_query(),
keyctl_pkey_e_d_s() and keyctl_pkey_verify() then dereference
key->type->asym_* outside key->sem.  A reference keeps the key alive, but
does not pin the module providing its type.

unregister_key_type() calls key_gc_keytype(), which retypes every
remaining key of the type to key_type_dead under key->sem for writing.
The pkey paths read key->type again after their checks, so a concurrent
module unload can turn the checked callback into the NULL key_type_dead
member and call through a NULL function pointer, e.g.:

  KEYCTL_PKEY_SIGN task              Module unload and key GC
  ------------------------           ------------------------
  keyctl_pkey_e_d_s()
    if (!key->type->asym_eds_op)     unregister_key_type()
                                       GC: down_write(&key->sem)
                                       GC: retype to key_type_dead
                                       GC: up_write(&key->sem)
                                     free_module()
    in = memdup_user(...)
    key->type->asym_eds_op(...)      -> NULL call

In-tree, turris-signing-key provides such methods; out-of-tree asymmetric
key types are affected as well.

Hold key->sem for reading from the lookup until the parameter block is
freed, so the type cannot be retired between the method check and the
matching call.

This is the same type-removal problem recently fixed for the read
(925c84e3cc21) and update (aef3a8a4f988) methods.

Fixes: 00d60fd3b932 ("KEYS: Provide keyctls to drive the new key type ops for asymmetric keys [ver #2]")
Cc: stable@vger.kernel.org
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
 security/keys/keyctl_pkey.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
index 15b6bf6..b7e3648 100644
--- a/security/keys/keyctl_pkey.c
+++ b/security/keys/keyctl_pkey.c
@@ -17,7 +17,10 @@
 static void keyctl_pkey_params_free(struct kernel_pkey_params *params)
 {
 	kfree(params->info);
-	key_put(params->key);
+	if (params->key) {
+		up_read(&params->key->sem);
+		key_put(params->key);
+	}
 }
 
 enum {
@@ -100,6 +103,7 @@ static int keyctl_pkey_params_get(key_serial_t id,
 		return PTR_ERR(key_ref);
 	params->key = key_ref_to_ptr(key_ref);
 
+	down_read(&params->key->sem);
 	if (!params->key->type->asym_query)
 		return -EOPNOTSUPP;
 
