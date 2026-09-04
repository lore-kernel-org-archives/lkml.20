Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC947CA9A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520158; cv=none; b=X/uf6CZgBvK2Jcq63XHDZzbb4zLmntfvDqUHC5QfcfyfgGrnUj03HbJrDT5dDs+9Dy4jSl9HbfEWqrQhLylQ5os/ep7LrRMPrrbqoSXzEyxpmyJHfdiVCivg0ptFtVkDXOR1Z8ufMx5zVEMzulndimjLUQip/nH2l1kxMIY11FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520158; c=relaxed/simple;
	bh=YaGljnvWoQzIcgOagfuWcy7uipn7G4q/7MezpQpALh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WM2xJVff3IgOTDz4zgqn2Z45XXcmYts7+6mA92gVSIQhk8k2H4/c5fiinItJnaA4bfi5UegF5TK0t/3Nyf6H+EIUBDz1RQLfBbmhnIwglCs8DQYGNHMo4AaVizEH97KEDMfC300QpqTll5srb/2/IlynG+4eTA6DLe7zm16PtiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POOlGLEw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POOlGLEw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441fa5c37so561494f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520155; x=1789124955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7gzrdcRbZFNkipzgWidgs+ChixBs5c4oi8w4Ru76NQ=;
        b=POOlGLEw5/TlTi/m4d3oDz8mu72SeToq+mfZF86XIlWInvOJ4Q9Gwp0fysLk1WbRWy
         185n00vt18yGCHuKi4WyIx6Y8CgWS7dh/BmoE5gHjOobZDXvHs4gGO1nMHEdrd0rSWku
         LYGuVhYxR75Uqp/HEeb21edSWNegqQDCF0A3pnW8y/IwgFRbAojbouG5h5fS9xpQBcoT
         n2SqlTgV6cH8LzyuQv/38oTxbQMRPnl6uEF4oMVsHZ2df8alrgtm7qF/IXCB5WaSnU7d
         lCpChA/7ZUbeXhZQVuMWW1K9btwBhWDxzDy4Lzx3UnrTldh7qFO3BvqfeBMUw3KtxTuO
         BUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520155; x=1789124955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7gzrdcRbZFNkipzgWidgs+ChixBs5c4oi8w4Ru76NQ=;
        b=scKVo9DspHgqjuyut08sxyc8O9AVKdBX7+tMpqwlB/mkFQTnzdAlRk5J2rDjkBCxcp
         tYJeg6a3y1QxLYZa94XICKVae8O4pd4bTmTI0y2zqzIF+rZJR2jPweYxXsiL5zG7mh5l
         2b2UPwhgNLyO9JJSKEXxUkdTsAn15dOWWMpYTf/f/PCT2NFGawshH/yTUhiaj17HmePX
         2y/wH3wjOvHJ1KKf9wKfZO2/YLkTk4xXTpcf0QnIZXz2F4+hF5j2u6HKWJovvSt88tTB
         Rs1746/GhI4kocOSqBNBp96bozS5XJdr7asdG/dd6XXMJVVRHVvOjpTWlup35BQimvrL
         gGCA==
X-Forwarded-Encrypted: i=1; AKwUvBw+oRbylFg+B6l3hbODIKGt9udaZ0BsJ1GEhOK8sU20YD/kjVVhWLbSbCg5D+CL2folZhuziN8VsNeSFJg=@vger.kernel.org
X-Gm-Message-State: AFuF++kTWy554Mjo2b/k9spab05butDH/CWfwZJRvoMW13zlcoCKB2hO
	mNJ7zbZW9uakLWePNk+ncqQ8FV7ICMfaYbCD2xMocxYIM3aL92lboVzJ
X-Gm-Gg: AYBFou3e7GMnc9QtVB6BkgbJy7NPyO11gfkNPXCuLNiwlmzpDbNwHHm7OPqkBZgINjR
	RAy7QvpZAOYVjvuCZA2cgXn9rAuJjTZ0pilShTDG455/IJMffbrElQ4qPII5HXjnXQXPz6WsApL
	kgzycqGztBnfimI39aRp5zRxFwqQ87D3kLAQr/qd4CxXwBARay9bhMLiOUcXO0XTAxjrJpHDZAg
	NySFljkDf7ldXxJXP90aQBY+nNVGHsXeTDNsxJVwumDPnB1zYD9B/zaAqebhUhe4EBQlHib6V3o
	PIeHswejvfKuXQu5VS1KDJ6ahdNyAhv/c+dmloWgKMKKqXUfNKDCpSCPshYX/Q7Lvt/s36zrTg4
	qZvl4FXCd29+auHpS3CTqKsvs23mdMBMUIdX1j681I/AjEsnw6VtpgZu8O4MYZXopxv0XHYfgQe
	PSIcnVGqj8hLeGpVF4iVtGoLu1E0ln/keJlOzhxWxk8Dt5ADpFie7CgL0Dx5EH+7vafn92q6P2I
	qJGCVnE+VG1AGBit8zkTn8UPhTxK1i0iBqGPpzMJzK5rT1p9nX7
X-Received: by 2002:a5d:5c82:0:b0:485:8a46:b3b5 with SMTP id ffacd0b85a97d-4858a46b479mr3503706f8f.29.1788520154340;
        Fri, 04 Sep 2026 04:09:14 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm5426934f8f.21.2026.09.04.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:09:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: eric.snowberg@oracle.com,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] ima: allow users to specify the pcr index with IMA_MEASURE_PCR_IDX
Date: Fri,  4 Sep 2026 12:09:11 +0100
Message-ID: <20260904110911.4087260-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMA_MEASURE_PCR_IDX option is currently not visible in the kconfig
frontend, so it always uses its default, 10. This means that the
'range 8 14' is dead code, and users are unable to specify the pcr index
value.

In a previous discussion, Mimi explained that users should be able to use
this config option to specify the pcr index. [1]

Let's add a prompt for users to specify the pcr index, when EXPERT is
enabled.

This dead range was found by kconfirm, a static analysis tool for Kconfig.

Link: https://lore.kernel.org/all/1feff118-4afa-4b9c-86f1-271a7a88208f@gmail.com/T/#mc4efa2491b4937eb7c9e532c29ffba516a70e662 [1]
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- updated help text to recommend using the default of 10

v1:
https://lore.kernel.org/all/20260824162215.1572367-1-julianbraha@gmail.com/
---
 security/integrity/ima/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index b3a9f86809b0..72654cf797cd 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -46,12 +46,16 @@ config IMA_KEXEC
 
 config IMA_MEASURE_PCR_IDX
 	int
+	prompt "PCR Index for Aggregate" if EXPERT
 	range 8 14
 	default 10
 	help
 	  IMA_MEASURE_PCR_IDX determines the TPM PCR register index
 	  that IMA uses to maintain the integrity aggregate of the
-	  measurement list.  If unsure, use the default 10.
+	  measurement list. Most attestation tooling expects PCR 10.
+
+	  The default is almost always what you want. Only change this
+	  if you know what you are doing.
 
 config IMA_LSM_RULES
 	bool
-- 
2.55.0

