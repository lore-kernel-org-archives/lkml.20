Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901849;
	b=M/Q9K+kdE7HqsMJid1L9MZSpBQnE7M9OiBDurhyPuMr7NNlxyyhVxzi8WXyisyti3n+k
	 FW4zTIK9SVIcDPkMabg7LGYFbcc8E3LH9gnwGbcJcIo1w+R+B/7aJ7/eJobWGntHZgifl
	 QgPiTg9Yfq4vgFpU6I0t7RiiWVFWl8foq0JIlRSN93icYtfJkB0hmEjnVJi9j1mhUseI6
	 HeNcDSFC2GS6AkOH55hPswLxHS2+fN5fPAd3giVuiOAXnQ8b0ymee6WjjTv5JiduvPNB3
	 Lqp7ZlQR38Xq3E9Ji8/sp4oQ9na8N/lKK5vCpqkY5dwNvj9CXvisX9rkcUofVta1C0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnmxEFlwrYLXPYbiM4rRFqk5iRr+FlXWIqL+SZFi5xA=;
	b=Hrs01JpHayfIlqq/31xqZeVQSr2z2iZwIjGY+taH8XSx+GgSMblZncbeqq93Y2qQmDCr
	 Ort/tbFNGqNpWTMVhyViQ/GP/GJZOtSJGRg/htdTi0/QFcqvkq7XIfTM73JNaGnXP3I0+
	 d04bRFnAcCxn4Wh8gd6g+E1uvTjgvN8mVww93Kjl/d19ZVuFhlh4lNorRm18Hx6NWSfAY
	 ZKDco9e+AL1chfXqAVYBxv2QVd8YD4jSyv2HADx52K6FmYY97cXTxSfiSSn/YJxb6BVMq
	 5co1gl26qvTZ8SQ/mcXtagE+0ubYHML+0XQqLbNiS1InEKpzHWewpttIg2qhxKCZCig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yLgPglEV;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81B4606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yLgPglEV
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1900670a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901848; x=1794506648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnmxEFlwrYLXPYbiM4rRFqk5iRr+FlXWIqL+SZFi5xA=;
        b=yLgPglEV7GIVD4E6i5KZiOI0zcHNXpKf7e278ayvsmQ+qjQ56E1zqMuh/choBfY4ld
         XRD2plRdXUfNrEVuTNrobS7Psfu3kXVCz8LfQ3ulWq/ZOT97B2qO2Kn5Q2cab4zV3GTI
         cGXxIinwB3b+zb7dOHnzw1BFttOEI14pRogyuDb2S5B3qJTHmS45wn8aINQrFt1gIiPp
         iGb/qo2jTitloBoFZdqILA6VKwrYSIcjjPhqDGJuaTTsUkME/OCt2o4BdHyhST0n73Tz
         c3MGTgAjCsRnnverO385lQL4+O+3VnrwhA83QTh2yHLOng4y/VFyRlvuIduNKFMFfwEv
         zYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901848; x=1794506648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XnmxEFlwrYLXPYbiM4rRFqk5iRr+FlXWIqL+SZFi5xA=;
        b=VP575EuJ/59q5pR0xY1+uxLT5dfLMahG8G4cTFJB/4Nn1sb+Wuv1TLgM/PdSnQ1P02
         3iY7//Tra1R1FtIKBJGSSmOtvm3RIQvfjz8Y1YxlIaausGthx4PP+SpLIVRe5JzWg/yE
         /3Y4nJb4ydo3S9+vphObHM5KmXlz1LXvhlWPGkkwFhj8H9qIEeywVRw102UVa3YFchTS
         PzQ0i1NSfaVEqlTUkWTHdqnPICxaf0P/Dvc2PrWx4mMWTnoDTxuPrwophFlfSmJmC7tD
         ABTO7fjZEVSiU07IWdgsn9CZOvAKcFRCv4Pdlr3aATLO3NfiZO1xLlfuTtufGRgsUDg8
         gkYg==
X-Forwarded-Encrypted: i=1; AKwUvByO1F52ajO7Pbe0z4UQuo4hfaG8qvY0GDQibA1I3jRVCw7x9IdJi4+3mZKcCBsU1nBoN9f8jAjg3tMxUJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8Z26kW2SPvGvmgasVWpHMiAvB4+a5CNZxOfBOw9HgKaynAh8f
	B8v5hRhsqr45eTfd60+Ct0oN3rcDQt9zIYUzwDtP4Hf9t1rCyP9rcvL5
X-Gm-Gg: AYBFou0dXGIji2fq9FbmicWUHaZ9MnhoQXaA6gFHH6zoP4xWx20blhvh0zXy1OxMQTT
	3ivUUbRLJDTzQ+W+A08VOH3l9sOZFu3nBJZK9DkOIXSdF73rWERbqRGZ0yXLAi5a9EEKpK56p26
	U0qtmkOJ+g1RqMOCo87kM+NuTyMiErP9IYDd9BYROpbyI9b9oi30pxqj4RJMnwFHd0pBm6nW7z3
	ZEkmsqpHoyFVlEgQ3Hn/EcvtDfp4ptpnxPYlU0dgVsVW8aP20UUT7JbW+ZyTbarpuOREJCSKlSI
	d+Uz3KEmACLZIFNrrO/f0r+mKdxHRZacaraEv9d6OVrws6k9Z84+YrHVXDSv7by1bmZ1bNyVwcJ
	uX0rUVx7w2L/39sevdBRMtBBrn65mPZP5iJlG0W9Xyl/rD/PLYjipYyYM6IlgWslEJWN+Gf4RsM
	PQjBJGHQLlCOFq+vGzCJ5Tstc42Y6lh9uE52w8kDAoos2VEZpgF/pkURYA+QWCqsoA7QG0CY6QR
	RGQv0ySItX44urzQHdXmHpzL0dZL+i8E8T3X3q5Xv+gwBex7SQJCxcNLvxeuq7NUB16Tg2Nkhes
	yrnWPOy2s/Jl0Zj9zKEAqueiYcVbkdvpRzb6R0+4de9RmjytcAnM
X-Received: by 2002:a17:90b:4d09:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b0cc6f11cbmr1403236a91.67.1793901848105;
        Thu, 05 Nov 2026 10:04:08 -0800 (PST)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094d70a60sm4855031a91.1.2026.11.05.10.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:04:07 -0800 (PST)
From: Qing Zhang <diasyzhangqing@gmail.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2e8c4ecc07730b29ae27@syzkaller.appspotmail.com,
	Roberto Sassu <roberto.sassu@polito.it>,
	diasyzhang@tencent.com
Subject: [PATCH] ecryptfs: validate auth token payload length before use
Date: Fri,  6 Nov 2026 02:04:02 +0800
Message-ID: <20261105180403.675338-1-diasyzhangqing@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <6aec66fb.059f5055.2712e4.0000.GAE@google.com>
References: <6aec66fb.059f5055.2712e4.0000.GAE@google.com>
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

From: Qing Zhang <diasyzhang@tencent.com>

eCryptfs treats user and encrypted key payloads as struct
ecryptfs_auth_tok without checking their length. Short payloads with
valid version and token type fields can pass verification and cause
out-of-bounds reads during file or filename encryption.

Reject undersized payloads in both payload accessors with -EINVAL
before any authentication token fields are accessed.

Fixes: 237fead61998 ("[PATCH] ecryptfs: fs/Makefile and fs/Kconfig")
Fixes: 1252cc3b232e ("eCryptfs: added support for the encrypted key type")
Reported-by: syzbot+2e8c4ecc07730b29ae27@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=2e8c4ecc07730b29ae27
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
 fs/ecryptfs/ecryptfs_kernel.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..4315c18ba1cd 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -88,6 +88,9 @@ ecryptfs_get_encrypted_key_payload_data(struct key *key)
 	if (!payload)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (payload->payload_datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)payload->payload_data;
 }
 
@@ -124,6 +127,9 @@ ecryptfs_get_key_payload_data(struct key *key)
 	if (!ukp)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)ukp->data;
 }
 
-- 
2.43.7

