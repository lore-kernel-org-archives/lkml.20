Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962204;
	b=1OF5CgOCurNoIe1bv51FqJf84pQb6NPPzfu4/PfB9jD6o5y8W7uNxujf5GtUvVy3o7rT
	 Wq7+AtL+xxR8d27XZcbxtu8tyBIcPno//DcyLLYcoA+MWCz2geZdkAmrYi7hO1h09NyFk
	 gcNazVbzH02N53R1Z2QO54aWXdnChV3xXXSd9WLt/2M68GjBfaL5BAN4pLEsUe3swJkK1
	 Blh2vJ3lKncAkZkngERslzgAziZIGdg06Mk4ZBIMUnUxPynwprPU630Hb7UgvCfELP9Sr
	 NK3VNViZ9FxJ/hLBo02jXn3GllKA9ackiWpfdrNhEXz5DIMbZ3ULK4Nm4A7AgrV0jMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QahgxAOniDGOjtfpZ1n4Ry8HYxG8g0wBOjcAHvQSKfo=;
	b=Uei28XtogVXBZpjBcMvRI5XpMV55mNLHCQMqiVm7Q3yG3k9661s2PaiEv+kV3rTPjux3
	 1Wk/Epz+WpIL8L8Pn/IRpK9gTC3tzb+rMPMi55QpoNNRIxZZ94SyPgIPR8KCgdyJmMhsS
	 2wS4P/ue5KVSukGngp6Gt07k36PjUANsohfhqt2onFf5FcZINMbFaXYCulzPmu596AsWI
	 zqdRXNQOLrZLhgAxLQ5HoE5JV4dVqgaHl1fldYDFr9hn0da8fGO2xzB21YNSYGyvI0ENz
	 zOda/X5SXtTu9ikH3y7Yahnbkw3O/KB35TneYmP4UP3ma1su/eTCjxOtOihY+LQERow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LFlV/hVZ";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8540C606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8540C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LFlV/hVZ
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso220650a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962204; x=1794567004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QahgxAOniDGOjtfpZ1n4Ry8HYxG8g0wBOjcAHvQSKfo=;
        b=LFlV/hVZYEZRbLURykHsMu5EENfHzqIIeLZj6/7bnWet38E327WCVVzH8NkrNU4E4J
         QtkEmEehrOE34q1jTu9gLw4kz/ZZ5I2O61J2taEQZ+0QjBfGoeu229EjAj3DSoqfbjkL
         +id15aPMbiPzuQEgZCHIJalOV1rBs4QV0V7oJ0yia0vXHbfjrGXe1CKtVhIk56kM2wl4
         ZOXDpvUOW+J1RoCHtrdx7tB2p0kDNKrzgyxE+zkbkbhFHGWiKzMVS4CgNQEygRhe/mnm
         O94uGlLjgWT2t9OXpxTyDFEkuZW1MnVGw66ounIbkcZqNCJtqglMY0g2hnaBr2xv5yXD
         Frpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962204; x=1794567004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QahgxAOniDGOjtfpZ1n4Ry8HYxG8g0wBOjcAHvQSKfo=;
        b=nhv51xXVeOFvXjZf8olCaDpQHm/saCMt6TuSrzU2k8cTjKiGhVaz5Q+6qOY4Bif/OO
         7xyDlPjdggfTk/6XboVceRU9lFJjzGshlv0lS7Yt+U4gaPtA/sKQ7ozA8FGmscBpkSS+
         ur52prqe/t8GOLdi5BhQkBMli3y+7nQWdLrVYyZ8A2Qr9m+BqUplDMgumFjIoO/A4K3k
         31WehT6pKF+YsEB7Lb0N7xfglEXbRtbstHfULbEYm8hfThXVQsAPRVEsyK3ZSVGaTxdP
         pDIf8Zp7UHL56kKKEY7geC0IrkkeSc2mowi88GMtAJSbgJjaY+qcnyCphQ8D5HJo9qbg
         Wqww==
X-Forwarded-Encrypted: i=1; AL+hErEbIMvxU2SmglaNR9q3qYLYZ8QMhHmx1pcnJZ358FprfqAfpu1rzYfG9FvB1AlikUd2E2uQd2VsExBxeCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z90So2z2bWimkjN/++eF92ldTVaOEvPb+krQQtqzj8HXq4XKu/b
	IYSm0X7TGw73wvH8i0VR2gbvAriiic2+rmDfEwRjTzdvGoggenSMrGg8
X-Gm-Gg: AYBFou2OT35N8FpVSpCTKpi7lTRNpAsLuBWns7Vyqx9wbd+HwUCZVWKdR7i1GZv/iMS
	aLYkIdtsEAN033l1Uti43VeqEOAEJz46qa9a4eIG2tyD5Fvx2ifLBgTIt2bDMLCWhkF2iertufX
	sHb1qGYEO/jKPrqF3mdKPWLG/bJV62sN3P2lESr0OKP3elhGpteNVgoVEv6NE4MZo2Xf6c+3Enf
	CufVau8NloFjiZGEPdLTvqOKhzCPcwK3PaAE3lo6KSYNIp4AgRQ4EVj7YyAsQaoKgCVl8hcFxye
	j7H5xYrZ+/40Z39Q5XCGPM2ETgOvHtfulYY1xO7l8VAYHVy3JVXv1NNclsCwkHmjgcauhgsIlmK
	vS1kd9Vjd+LD7YMHGiaeGfDJCv/zW4fdLxEHwHYaIw7s/9w+Q7ndUMZeom3bmR0HGYXPttUS/d2
	WZgnzjFUmLrebCCrLSG3L7Zt8MFUYji8GgAKD+tYWnpvWpKP3HSjQne9KrvHQ98s2J7KJ0oJ1yq
	IXZNAtJf7RFpl10sSBVWDlZVR6O6JZqUJQVfgYx/yzM2mRexfA//mOPigCb87l8wH4RrKnzTyfA
	RuiKB5vW5H19iR+h+utsOvOVCpMK0drHeksKIwwIqQ==
X-Received: by 2002:a17:90b:2786:b0:3b0:9e2f:cfc7 with SMTP id 98e67ed59e1d1-3b0db6febbbmr1956273a91.44.1793962203947;
        Fri, 06 Nov 2026 02:50:03 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8a3d9sm3747364a91.10.2026.11.06.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:50:03 -0800 (PST)
From: liuyong <pkfxxxing@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH 2/2] smb: client: compare owner and group SIDs using their encoded lengths
Date: Fri,  6 Nov 2026 18:48:36 +0800
Message-ID: <20261106104842.441067-3-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106104842.441067-1-pkfxxxing@gmail.com>
References: <20261106104842.441067-1-pkfxxxing@gmail.com>
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

populate_new_aces() compares owner and group SIDs over sizeof(struct
smb_sid), including storage for all 15 possible subauthorities. Received
SIDs contain only their encoded subauthorities. The comparison can read
past the security descriptor, as shown by the supplied KASAN report for
a 44-byte descriptor during chmod.

The input SIDs have already been checked by sid_from_sd(). Require equal
subauthority counts, then compare only the fixed SID header and the
encoded subauthorities with memcmp(). The count check ensures that both
validated SIDs contain the number of bytes being compared.

These issues were discovered and fixed by Qihoo 360's Tulongfeng
multi-agent system.

Fixes: 0f22053e811c ("cifs: Fix unix perm bits to cifsacl conversion for "other" bits.")
Cc: stable@vger.kernel.org
Signed-off-by: liuyong <pkfxxxing@gmail.com>
---
 fs/smb/client/cifsacl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/cifsacl.c b/fs/smb/client/cifsacl.c
index f9f61c758..e420943bd 100644
--- a/fs/smb/client/cifsacl.c
+++ b/fs/smb/client/cifsacl.c
@@ -1134,7 +1134,10 @@ static void populate_new_aces(char *nacl_base,
 	 * updated in the inode.
 	 */
 
-	if (!memcmp(pownersid, pgrpsid, sizeof(struct smb_sid))) {
+	if (pownersid->num_subauth == pgrpsid->num_subauth &&
+	    !memcmp(pownersid, pgrpsid,
+		    CIFS_SID_BASE_SIZE +
+		    pownersid->num_subauth * sizeof(__le32))) {
 		/*
 		 * Case when owner and group SIDs are the same.
 		 * Set the more restrictive of the two modes.
