Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9934C9DE3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062531; cv=none; b=XuI55kWAteGvpim7muCmY9y/2JBXTnJfoMdlkrFqb50BnyyjSjrJVOJbIGuvoIY/ja6lHscs2nUYH0vkrA+Eu+FkGNQZsMrcmfdOh7p4+BZHP3X7Fl7CK2wWz88VVx9mTbEuUG3GcypDaTeBawrakW9ssOCV+EkNZt4Gcu7AZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062531; c=relaxed/simple;
	bh=XJoINwSigmUSFf2dqnHMxDsKhNmQqPxs6uqpqIC4U0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lONEwj5c5sDhpMkRMqwK5eNvjkk9VCzOOhfXHsGPmAP/JHOTdpCsQZlQWw0bPLBsNx5Lj2AOg1II0SannsMyqbwXPDsWm9uT7p7bNiybTqn+8uSFuek4tQq109aiBoZs51mBmAAFBFbhMuq90WIdQcjiUhv4lEMdzhuBZKOxFWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqLN95jQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqLN95jQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ff680331aso21478555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062528; x=1792667328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3JPj12lyap6keUb37p7J+0g+WrRr2s4sx+gWyL/wnu4=;
        b=AqLN95jQ2XnT1cnMrhbgB31/aOeLpWWnkN5wz47YsEHwiCSjtYuLHth/cOHOFn4QeX
         lapuJImuXnrm5GPGgHBq4FM6+yEszMmAgl9ugJb0pO21FnnwTcsp2CsnJOy92KGPUQFl
         WZxBjn6BiGVztt+RZBn/9YxHvABezUB4VcOkoKDVxzqIDonaEzJ170n1xsu84xftiO/r
         KcReyDQDnhFcHiHd3SvUcjluF3MaTW4jHYiNOc0PKvstzBAlquj0JVJXO8Dv6tZWp1PJ
         JIXOFVF0ZBv13SCRl7sDeUQSk/Hua/QyZgO8R7Urangz0ngDx0E1cnMUK4lr5myQkUHx
         W8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062528; x=1792667328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JPj12lyap6keUb37p7J+0g+WrRr2s4sx+gWyL/wnu4=;
        b=zmu+JLUIc4pGYMsWqtUk5cNxyoaNJcQOpO8Afv8K52Cdbp0ZuxLpWh39wUI6ZPV+u1
         ekI1M4ueeGQPuho6hwPE6oLeNvgw2OAkPDQ5xTJ8OVuPWvJwFalJWfQc5plN5Wwm8TkX
         3Mc6EQXvcRfuPWLlsuLlU4gshjeXcvrjqXeizfkTOlXdpFIWKmtWlGtoyKwXpn+aU7CL
         q7LzCCfHjYcC/NGNI6EsUA+mdmwr2XuNWbnjqaYq/m9mO/egmEFRtrWYxLMATLcwMRS4
         vfBBiJ8wLPjNuyCUqIBlGEbFSoyDAaq9LG96JvAX26SdZNRUz50I7g+jsk7Rx9aWlN4K
         W4Kg==
X-Forwarded-Encrypted: i=1; AKwUvByuhxnNEyxT517dhmQFlsIdxnc79rTWSIOaSxmwuyawcDyCcF5ytV1iukE1JAPejMJI2s+gjnJ+vDstNSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkwMmX2q0Rcttdn+zxGYTFW1VKv9/awBZihPEuovSUi7ZAv1fz
	Ii13WwPtQOQVaeG/umSd4X4bgBnTWhQReh3SDtO7UiYcpEjr5sB/d5sC
X-Gm-Gg: AYBFou1d2iRmTgcmisKKq29APz6DmIjRr6AGGsl6g0BME1YC0o+CThOu8oMDG8rt0Ju
	ouDAKGwtVlzH83VsLQ8WUmSjEf+mV3Ng4BiiQKx/IWgBNj65LeaisRjxUEbzwCA4q18a7sbx7LJ
	2+oWeG5826OL/Fl+jGVV05GEd3f5HipibhvYGkovfexohgQoynrRQ89HbObizEg/xURzZB6/4wG
	g08SPIJoDLPBoBfbgqqazLRxfgDlSta3/IsBFumqbNq5gCiFdlyl11ol9CUZuzoZLFGz1/+6uCE
	kQd8nns3OAT/RPd7Duiwee7PWzcHXINSgHkQ9tp2xVU1aQ27JlCN4g30NlGIWSI1qvSEds66+yt
	3YiMVKDeAkOOXKAKx3yHIzcvk/lcnUbOzGLnuW/JxmWkLIA72CKuD5UlNLDT04NeCZrphbSsGpn
	mGuVd4fsg4kv0hCR70MW5aK8QglQ2FeCKvoZfQukQNMgj5R2YPNOYvVhTv1zAOm0A1WMvTC/WM
X-Received: by 2002:a05:600c:699b:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a18e4af334mr397244145e9.33.1792062528000;
        Thu, 15 Oct 2026 04:08:48 -0700 (PDT)
Received: from fedora ([2a02:4540:a7:16c0:b518:4b00:679:375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd99e87csm62639105e9.13.2026.10.15.04.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:08:47 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@linux.win>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] crypto: pkcs7: Return no-digest for data-taking algorithms
Date: Thu, 15 Oct 2026 14:38:26 +0330
Message-ID: <20261015110826.126621-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pkcs7_get_digest() is documented to return a digest for IMA to use
when verifying a modsig.  For signature algorithms where the public
key algorithm consumes the raw data rather than a precomputed hash
(algo_takes_data, currently ML-DSA), pkcs7_digest() does not produce
an intermediate digest.

When such a signature has no authenticated attributes, sig->m points
at the raw data and m_free is false, so the existing check rejects it.
But when the signature does have authenticated attributes, sig->m is
an allocated buffer containing a modified copy of the AuthAttrs and
m_free is true.  The existing check therefore returns that buffer to
the caller as if it were a digest.

Test for algo_takes_data directly and report that no digest is
available, before attempting to call pkcs7_digest().  This covers
both ML-DSA cases consistently and removes the now-dead m_free check.

The only in-tree caller, ima_collect_modsig(), does not check the
return value of pkcs7_get_digest(); for a data-taking algorithm it
will now leave the digest fields unset and fall through with no
digest, which is the correct outcome for an algorithm that does not
produce an intermediate digest.  Callers that do care can detect the
new -EOPNOTSUPP return.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 crypto/asymmetric_keys/pkcs7_verify.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index 474e2c1ae21..7939b08b603 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -147,14 +147,15 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
 	if (sinfo == NULL || sinfo->next != NULL)
 		return -EBADMSG;
 
+	if (sinfo->sig->algo_takes_data) {
+		pr_notice_once("%s: No digest for data-taking algorithm\n",
+			       __func__);
+		return -EOPNOTSUPP;
+	}
+
 	ret = pkcs7_digest(pkcs7, sinfo);
 	if (ret)
 		return ret;
-	if (!sinfo->sig->m_free) {
-		pr_notice_once("%s: No digest available\n", __func__);
-		return -EINVAL; /* TODO: MLDSA doesn't necessarily calculate an
-				 * intermediate digest. */
-	}
 
 	*buf = sinfo->sig->m;
 	*len = sinfo->sig->m_size;
-- 
2.55.0

