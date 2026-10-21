Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575333;
	b=19bqf750fX0XfG6xosrUj8GV0eSxMduzpZSHUy0XElZRtj4jGq0iOqycAtsZKy9C16JT
	 8PhcOcr0rxYMkHkkbgjJ2KCRYaNajxWDfV9F1HrAUHbNIcVdY79eyRKuUFTwvbyDLa18k
	 f046fG4KSxtsmzbWvw3I+fAVugsjfPQnQD1bmZ/GUwM8kmAFQOZCk7RucMcpH2jlz0RPd
	 D2Al35nC3zY8L7V8Eby3xMMhXFZvzSexmgGFAIhVwmZbUca1tBzOTwmGyrIomRiCfBGBv
	 WkFwKgTUI5ID9DTDtfsuN58uybOBuEjtkur3O7ez3KQ/KgxFepEXbArpTFORhlTRMhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qpy79RFwgt3GKedmF9Rhg7N96RjtCmNvGJAIiKOFLUA=;
	b=o/y/JM/rQz0wmlv4UQOHPK1Aa5adDR5OulnbL3PGgBmIoWVCAH+5MlmIFhrgLvk6JjHd
	 UGMQbFQm9hNKMqd1i2aiGtBvk3KnSm061tFv5dt7cBCou2Xn9T5NEntytGdTh9zq4s+Jh
	 Msv7+oXp/dYaBcBgQxg+BJPAYD2K6/28BAo2ZmHv7/KjBvyrvglTyHY+cRUnVZPorAZOy
	 Xu/DMvV74X/HOTCG/W/JfiiegegtBtqAR4hCQCKIylzjBnJdO4UdZepFEyQfSlLjX4RU0
	 zZNNEgU3MN5cWZsY/rN+9QXWnkZade85mGzOR81HTaP1NQ6CN6PyvrlT8NB7/zhd+xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sfomHs9I;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A557C606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A557C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sfomHs9I
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b19e291cc6so403710eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575331; x=1793180131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qpy79RFwgt3GKedmF9Rhg7N96RjtCmNvGJAIiKOFLUA=;
        b=sfomHs9IHpeMX13pWs8/eFvKRI8o3ibEZrUY4T7gJKzxDNYy1AXbaeLheTamgEEd0X
         MMAkDqftcspf0lX0FYP7pd4/nBriColbflOtlB4LCbRLi+h0jMFYDHqLtst1TKdo+DXs
         /Sm96HriYmo4YrmRlaOFEgAyScGIw8+ayrD2WnybPwBuokXSSud+2Sa2edCfrry8VV+O
         wx/tUpjhCW3yCl96d30CSE47ns6J8B/5N5zcfuZyfMsyWrLvscToxvsYuq2xQHm2hSml
         Lj0ecmGmlBbLIGHsvQ6DD+/C5FtoVk47Hmd4ahHe3v/7tEWlhqY5IRxCgJ3G0Z6OOd8Q
         G0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575331; x=1793180131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qpy79RFwgt3GKedmF9Rhg7N96RjtCmNvGJAIiKOFLUA=;
        b=ZU5KejNZ8agieoADRCFZXBpBbQqiLNnipGT5nh/eSQXnzq+SL0+c/Shx0CFZUfxLaK
         UzCxd+nH3eCOEXhHHFhQBaj6c0SPzgKjzpPUZGtDwgRaSz7Zg49BDNN+C78KY8mBBLsk
         fmaAMjyWGFWSd78Zw5Q0QeR1lb0Rlo6FwKOAEwnae6gqZnSeS3x7Dt4/dk2I48uMMq/j
         HB9Lh/r+7TM6nENfxABV8ScxfNZ/FGyiefORB+rfeLr83WIjW9A4ydeXzJnE2seGx/s0
         kbnFrL6nEu1Z+b54LsO19rQbr+pBtEX3PHF1whrzp6cqHq4NaKE3cEIv7DJ2NOT4B0Nj
         uYrg==
X-Gm-Message-State: AFq9FYLCT5GvPzoEh9JTf8MRb13jcW9a8wrpZ+olfbr0Ad25Zp0A5aM/
	QvKooqiy6fsT3pG2PlPcedfM69rOMsX1YkmWkx8Q4/pGQiJz3QnwLCnL
X-Gm-Gg: AYBFou18tth+ZMPGfYw49SoAJmulWK6C7C9aopP8D8NPyg3eQu+1Nm5tnz4S1eKPCVU
	yerjLdMu8ZVdw6OlbEEGptsGL7TGPWDLlwX70XSCtWCADpR5fTW0vdvNQAjCrrQZOGEiEglSZl2
	qpeIkhrSgdKsuTMMFElg3mPuKd92Kz8iOC1oZsaFrzq2eSOK0QF7426CQLJu6rhKdgPYMGbdtZK
	71VgHvtnqnT/QnEZEunP7/rXAc9B9qx2cXUQnnIfVa7LCjKUiX09SLRy+8ynYcwx1YZqRxt8y0i
	Iur5qdW91ugtWkppc2kK2f9Q3Q9+ESbzITSSHASl86L6eCBEeqexXW8dt4iWbOerQhJpDMq2dj/
	6LqQLbVmOJQsrxXpAT9e3G1YlPJOrYw/p79EKmGXGX08WCnlepimy/o9lNx3q938a8non/wzazI
	eFBHUpSc8Nj2yneqjfRjXhYx5gYqaR3AXMWmonFzRty6h8Q8awCpz4+T278tGJOwzVtTrTGxYi/
	73j7Ee6n+YE5PJG1omZlJr4s7d9n/j0RrRe+PnoeRkp/aM1kaQb4A==
X-Received: by 2002:a05:6820:16a4:b0:709:1cc3:ddee with SMTP id 006d021491bc7-7093fcba26dmr691591eaf.30.1792575330925;
        Wed, 21 Oct 2026 02:35:30 -0700 (PDT)
Received: from linux-691t.suse.cz ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbc7d9b0fsm1908308a34.7.2026.10.21.02.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:35:29 -0700 (PDT)
From: Chun-Yi Lee <joeyli.kernel@gmail.com>
X-Google-Original-From: Chun-Yi Lee <jlee@suse.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Chun-Yi Lee <jlee@suse.com>
Subject: [PATCH] Bluetooth: SMP: Fail if the X coordinate of remote and local public keys are identical
Date: Wed, 21 Oct 2026 17:35:22 +0800
Message-ID: <20261021093522.3536051-1-jlee@suse.com>
X-Mailer: git-send-email 2.51.0
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

The 6d19628f539f ("Bluetooth: SMP: Fail if remote and local public keys
are identical") patch be introduced since v5.13. Looks this patch can
handle the CVE-2021-37577 issue. However, it only checks if the full
64-byte public key (X and Y coordinates) is identical, which is
insufficient.

In CVE-2021-37577:
Bluetooth LE and BR/EDR Secure Connections pairing and Secure Simple
Pairing using the Passkey entry protocol in Bluetooth Core
Specifications 2.1 through 5.3 may permit an unauthenticated
man-in-the-middle attacker to identify the Passkey used during pairing
by reflection of a crafted public key with the same X coordinate as the
offered public key and by reflection of the authentication evidence of
the initiating device, potentially permitting this attacker to complete
authenticated pairing with the responding device using the correct
Passkey for the pairing session. This is a related issue to
CVE-2020-26558.

And base on spec, the remote and local public key should not have
the same X coordinate:

Bluetooth Core Specification Version: v5.4
(7.1 PHASE 1: PUBLIC KEY EXCHANGE)
"If the two public keys have the same X coordinate and neither is the
debug key (see [Vol 4] Part E, Section 7.6.4), each device should fail
the pairing process."

Bluetooth Core Specification Version: v6.0
(7.1 Phase 1: Public key exchange)
"If the two public keys have the same X coordinate and neither is the
debug key (see [Vol 4] Part E, Section 7.6.4), each device shall fail
the pairing process."

Update the check in smp_cmd_public_key() to only compare the 32-byte X
coordinate of the public keys, making the validation strictly compliant
with the specification and effectively mitigating CVE-2021-37577.

Fixes: 6d19628f539f ("Bluetooth: SMP: Fail if remote and local public keys are identical")
Link: https://nvd.nist.gov/vuln/detail/cve-2021-37577
Signed-off-by: Chun-Yi Lee <jlee@suse.com>
---
 net/bluetooth/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 2df303f6a38f..80128b31e631 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -2734,7 +2734,7 @@ static int smp_cmd_public_key(struct l2cap_conn *conn, struct sk_buff *skb)
 	 * not in use.
 	 */
 	if (!test_bit(SMP_FLAG_DEBUG_KEY, &smp->flags) &&
-	    !crypto_memneq(key, smp->local_pk, 64)) {
+	    !crypto_memneq(key, smp->local_pk, 32)) {
 		bt_dev_err(hdev, "Remote and local public keys are identical");
 		return SMP_DHKEY_CHECK_FAILED;
 	}
-- 
2.51.0

