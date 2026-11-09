Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202770;
	b=SkoEu9OhyUGzIQYbrGk/9vuXtnDkclvlfb/ujJ+c6m2V9BBLxtF1aH1EVcVLpRUDx4c6
	 K8HuQXDeGmoCNusD+E08uDnN721WdQhhcha+epcS226WpnxtNHs2JZktLK83IMLUE6u9S
	 0FS1d1x0F4VwLdMmFRooDwFW4YcIhuv2mlCYFllAWor4u3sTdn2Pbvk+EA/wrCpbJJgbY
	 xbTQHtKazLf9uMPDDhSNyYNKvVJUp1lCfI31EzYVMa2v1jjnjUbdHCalcXNGUPm6v14U2
	 E8htxN4Di97GbRaGElbqVnzgloW65ZdGKs7KGB3RB34PGynlppLlS6b7AvX4bWJChhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=4uU3D93eNb0dcAsvNYKSr00RkTcidb/i2o2hNB/WLWc=;
	b=MmTKYTJ5DWARTXjfduVwTMl2LylUv7JjCE7G8ritFOHoqxw36Ntyd8AmCGAcsuBKBbnf
	 w746Gb4zt2aCQkKZJU+Y6aVgQZSPDGJvOpaKEBrlKU7BeSAmg8UKfRbcJW4EIKR3xP4HC
	 WlKIWbaQlaWp4gtfmgVUDwUywuqgwddxoRyFsM94DVoc97vMjz+4oAdEjNNs8oXtzFOFz
	 ywf0evMgYVZgjXVW1uEUGSzbNpyF0qAWP6TbrPvQ6EFG5IpPcD/D7/eRZUp2ckGkTJz/i
	 BKSAh57Rv5+tXCjIxqfDgZiTUVG4ofxTfza7aRgA0reKX20P1H5XmcHFgD0KeTQKNJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/c396Cw";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828AF606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828AF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/c396Cw
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4910b863b84so278911f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202769; x=1794807569; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uU3D93eNb0dcAsvNYKSr00RkTcidb/i2o2hNB/WLWc=;
        b=m/c396CwshKMa2EHH+DQktTUWKdT+G4FYhJZRO1ZyIRIhcH4JLYWrzEMYp+ItdlBIA
         TfrpaAz5zE0hxf52AhEiwplZI2VXfKYLCOe+FYHpU03rM56D8UVCIbC4EkcKucUXujME
         UqLm9dyYq2Pd28HnP+Gy67SC8ArUdRCZcomkUowXHVNoiFIICmBTIVdlsiscdGA64vyO
         RBLD8ILK91ZHqy91P5VTxFDBpvH+IqxaQ1CA0lQRBHmprYuUvpkUhVStr1VvYNw7G1dZ
         nYRFBFec5K4S/6FdpKhkVPUYrgzt6s8D/Fsckxa/yVxaOe5ssdJEt9lk6iqQknhDSoKJ
         IOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202769; x=1794807569;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4uU3D93eNb0dcAsvNYKSr00RkTcidb/i2o2hNB/WLWc=;
        b=Pq1rIiFSxHuVXuolf9eYyxc03XOh9+HoG+IKn2I0Tj31pfjPJ5QDsxni8xAhCwuvYv
         eHYCy7N61QpV4wshf9s7BQGlrbLVJOufGPU1T/N567rHudPlk/FUn4HOr4rc8ZBpG+Is
         flc8uqht6InVU0npq8BY4fUgfeBpZ/UsJ5ZpKLh/vYje+KrFxPYtpjE+4aDvOk/kex4X
         phiMlV4cxv4wOMFRrr8xyBTMVR6cMf9J7NgnryRMQ0oHYbpbLQ58e0TJxdCmOpxWvRcu
         EXm4WfdbfvHrAD+nWgz0SrSjQD0upGfZHRb6G9Uu2FocILCAtQCs1T46U+GkXZTphGIs
         kmuQ==
X-Forwarded-Encrypted: i=1; AL+hErFTZ0KCpgrDH6V4kElXDjbT+xgXMYDU3nE/H0P1CSgyPz3ps1Muy5e9NQyo2cyd+F+rc7OjEWHRCcBL7qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m8YR0Mvq5L60Azcg9AZTXoGZJW9LL6KyqIWeXwIjdZ4ArAcMb
	sNo0/fGdaMa3csBXQwykuPpEmWZIRTOlxBiLqbfZf6pPgPHPgdinqxk+
X-Gm-Gg: AYBFou2b3+gWJsgXsNIxALbt7hiNGf6bM/Zf7940qmFoldGSPBv8jQjrZNGza/eiE1j
	U1BidsFSEcpB/2Paqa0Q9EHPMtLXPWxcVBeGkLCEZqMqa5nwShW0iKRceACOEXeM4ewz7SLu/OS
	70tFzWA2XLPjF89rE16stWi96hUptfexW3NYg1yppNw0Ln9fqJnI386ldw7ZZoAdSBTfX83prap
	gFKWZ5zHNeeJ4vl7qgujneIRoYE4kvW6nM1G13Cfib1OvTy+YLN0OZq4tXYaax9rGGUwBj8OPbq
	rXRRuDWujdyqn9NnMHuTu4VIy5Jn7N1rAS0DmW1Wmeyjs04TH6E6s4rL9kNpL0fcRq6OIWqmoc/
	/gISkshRZSup8aCa6+fjnQUzkvan1AnSOj0j2LoyOjfqOndTpbPcKXcN7p3KwrSdUqIhw6qzheB
	+BjadxyP/xP0Y4boEY/RbrLJ0+CtIAFuUwpBwUuPqGmK/b6ceMmo7xJqtquVuQghy9RSbQ502N0
	CXy/y0jrz922qC8ajFZKyj91fbmoUrHG5qjgvX69AqQMXruuSj/uLXn75GjZRwbrpVKs4b8dfWA
	a3a/VCeBcimdFTir0i/O8If0NyEgc2w8edP754wALnbX4Rfm0t59WnIN64wFS9SOKHL/Fzmk1PF
	yX2lgJXw/kxBkpMmnEf+M/igRxNsezuOiiFysKqDxao9UmSrJyTzOuL5+59Q7sMR8bw==
X-Received: by 2002:a05:6000:250a:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-49423997d63mr12864728f8f.16.1794202768807;
        Sun, 08 Nov 2026 21:39:28 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967a70a35dsm4750189f8f.9.2026.11.08.21.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:39:27 -0800 (PST)
Date: Mon, 9 Nov 2026 08:39:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] keys/trusted/tpm2: rename "bool" to "boolean"
Message-ID: <avFcjHwnh9mrOEnz@stanley.mountain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In C23, "bool" is a keyword so rename this array from bool[] to boolean[]
to avoid a conflict.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 security/keys/trusted-keys/trusted_tpm2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index 30188a0ec676..2d6cc53539c8 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -59,13 +59,13 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
 			       asn1_oid_len(tpm2key_oid));
 
 	if (private->blobauth_len == 0) {
-		unsigned char bool[3], *w = bool;
+		unsigned char boolean[3], *w = boolean;
 		/* tag 0 is emptyAuth */
-		w = asn1_encode_boolean(w, w + sizeof(bool), true);
+		w = asn1_encode_boolean(w, w + sizeof(boolean), true);
 		if (WARN(IS_ERR(w), "BUG: Boolean failed to encode"))
 			return PTR_ERR(w);
 
-		work = asn1_encode_tag(work, end_work, 0, bool, w - bool);
+		work = asn1_encode_tag(work, end_work, 0, boolean, w - boolean);
 	}
 
 	/*
-- 
2.53.0

