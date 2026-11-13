Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560487;
	b=BYq9iCPTtxeQhOMeTaXc2uPS75M5QrBoJoaMkUL3CCJluGeQEZM4cX6jr6NpTjwrxrBF
	 RjhOELIW7wwSKhR2Mz0ih6k9WRFVrfnVGRxyecslMEQ6TlirB6uNZMniXDnaCd3OFhCTR
	 lSdi9ixnmpHZMir5vq+8yrGZPu3ctWWgRRSFoMo3sqtAt1DUk6unBOa7L2NAcr5gUwipY
	 kinBTvB4aNEqF6XOnLok88WuGvPV1kuIIEfTPZhgbB2bKUqI3WMe2makSwuRFX/vXYXjR
	 C4bK7sQ3uM6xzPA3dOzlhuzHgtoSwSyCm1SXf796g8f9FBegHADh1bUtJK4QidfRitQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=E3a97Mkr7cqGGxSA1yo/Xc4eASuJjZXRMaeChH71cvE=;
	b=KthxpjuGu6sloBbXjbiZ7tx6yPTNP7DtFj1m+b3AWTfhba+7HbIetBjl2JJOm5HSAkjF
	 uA5PCc1Vl1HS1mVFBImnnRYWgr5MDO8hflBLAXCjRv4UbukdX/9RQGZNuWdeg//ERyi1y
	 5Ok02eY02QCvCdv+5jgfVZtIeeq5DhtAduv2my2iwiZ+qM6LQhjLSq0Z+D11Nv0c6TdE4
	 GnkWGdwPk3foqQWzRT6JHxkOJBR+HUruMWmCOxRGaIERWs16KT47kMGdQW+xZNt0h9Axi
	 RdmEeHcUz4Qetm7ugaDE25p2p7ETZ/4gzig5KvsRPsS9x2pbv8alPVyAYJ+JPTvaAGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNZuCq0z;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90E6606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90E6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNZuCq0z
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso4272215ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560486; x=1795165286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3a97Mkr7cqGGxSA1yo/Xc4eASuJjZXRMaeChH71cvE=;
        b=kNZuCq0zNrhjHBoGvHgoqEvu7LGBEuwEdjNIy7eUNd67NKJ2NyxrR+BbOokPwv/wpn
         I01FTR0qFkGM36MV+f0cjh/1T1j0L8APHuN8zQ3iBJjNcZ3wRKz7nFsQD4pMJszQrTQh
         PzMWGbQo3Qn6IHI4Dn9a/8QDg8uz1olXxO2UsF6/PWBrppuqR/GDKd77tcUz4xLXx3iQ
         pUJH3+a2cpB2hbFyVGcwhlqcUutKMwX01H2R9uAsWW2lkcGZhHEsFEnJLkCbEG/FXkId
         KE3dTzzb7rUkp/iCDRK3v4cj6d2FTsKZSc5FvVAkgcblXMCwcsXjYkKeeB94b9oaHaON
         aqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560486; x=1795165286;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3a97Mkr7cqGGxSA1yo/Xc4eASuJjZXRMaeChH71cvE=;
        b=BIUPKfXCHQL3lgJuLeWTVthuaGWw3GCOK1vpQThdFBWnQVJp8vdF/E11aqcWpJBnT6
         4L4RHukBU1srBaaoKh7c5Rt7tB49UxEjEaqpGAOJ0/GrqwCLtntIKHRbio5398H22f2M
         eKoWenPjyHPczF8kXnqveh+jYEmPGQffQt6UUCUMdhYsn+tMu8ZpaeEOtOoTmfJ8/A8S
         w95iOf4mFt/s8osKtyA4nVIjYVgnmBEPyfhml/qsvYY0tdL9qqbvn3muvDrX9B+3eoDq
         3heiQ78VW2g34ykNX53RNo9Ao2+G/NzEEqbzfoBFrvFjH5sGF3l8AZJvPmpyfeaA0uN2
         AkYg==
X-Forwarded-Encrypted: i=1; AL+hErEMW2pIjn0CEQ37zbojYf+n9EJQBi8/5d4tHnDZyx9g/2mKajZvbpvCMJMKUxWohL7G5uk+NSx4uOE3hQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Eqx8g6URiIvolUwrogCs36MQyebS1bUkvtjAKf4WhP8sKs5SK
	imFYOP7I1V2/YTIemx8VM5DSJJAysJ8hxZ+sIvwbe8ZKmv+ID53XEAuY
X-Gm-Gg: AYBFou1qKAG857T+QY/CcER5ujfrLmvwjgEDIVde+mBQkwV5yvUWW7BHe73J+Be5uEq
	Wagw8SSnr9kF4liiSlhb+f53m6K/s6RTFXrA5aKtz0YRlVkeOmVo0Ibkxf/Wm+jQ3ayMcyeWxV5
	Cikw9KPIU3ggyXAzNvnvWt3FssNf7vPF3dF6QVyNavvmNZR0+dc/XbK0sAU4pfy0eOUYl8KUyr2
	10VjocGCuK/P5WI0GC9N4BBOn743wFNPlMoyklI2MxbA34oHtLO3GPFeLJjebda759nyW0CHp17
	XrP8v+YR4Yr2FdeVX1XZJO6zPDVuYHMKrVZa8YbUqWbl/0OCKnX6qsadiZ+2Ht4d8pjUCnCsMlO
	7xJKAWQCLTW3aVdOFzEUneLFkGs/v4JFjqIxBo3cUlq38GVmCYsIsMWY3EM8+vKs61PKYV5Hhib
	i1dxJsb4b4uzMJQ+4gy6HZCx4J4buG6oyqO169fbapTEZJ9i33crs4mLVYXmKZSzR0vIjEmoZND
	Swp7UoNdcMjV8PnXRJEUuiYvhyFl1i9V5PxmosXfsjardtHL7y0yVXFfzayyohNLMx5NBlwau1P
	vBp6udlSQRG31qf4mu4OW0ta9SZ4MNtkOLeNsHAbAfFb
X-Received: by 2002:a17:903:3887:b0:2e9:528c:ba02 with SMTP id d9443c01a7336-2ee0dcca259mr16655485ad.60.1794560485927;
        Fri, 13 Nov 2026 01:01:25 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d708fsm6770405ad.58.2026.11.13.01.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:01:25 -0800 (PST)
From: Vernon Yang <vernon2gm@gmail.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org
Cc: akpm@linux-foundation.org,
	shuah@kernel.org,
	liwang@redhat.com,
	jackmanb@google.com,
	linux-kernel@vger.kernel.org,
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: [PATCH 6.6.y] selftests/mm: include kselftest.h in vm_util.h
Date: Fri, 13 Nov 2026 17:00:59 +0800
Message-ID: <20261113090059.380783-1-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vernon Yang <yanglincheng@kylinos.cn>

commit d8a866c766ebe34b4371d42f4a3edca200f5e645 upstream.

The 6.6.y backport of commit fdc3bc349794 ("ksm_tests: skip hugepage
test when Transparent Hugepages are disabled"), added a KSFT_SKIP return
to khugepaged.c, but the prerequisite include from upstream commit
d8a866c766eb ("selftests/mm: add commentary about 9pfs bugs") was not
backported.

As a result, the selftests/mm build fails:

  khugepaged.c:1195:24: error: ‘KSFT_SKIP’ undeclared (first use in this function)

Add the missing include, only the vm_util.h hunk of commit d8a866c766eb
("selftests/mm: add commentary about 9pfs bugs") is needed here.

The remaining hunks depend on commit 32b42970e861 ("selftests/mm: skip
gup_longterm tests on weird filesystems") and commit 571a4b62ed63
("selftests/mm: skip map_populate on weird filesystems"), which are not
present in this tree, so we don't need to backport the remaining hunks.

Fixes: 6b117e23481d ("ksm_tests: skip hugepage test when Transparent Hugepages are disabled")
Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 tools/testing/selftests/mm/vm_util.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 9816d6e9bce6..f14ebc809585 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -5,6 +5,7 @@
 #include <err.h>
 #include <strings.h> /* ffsl() */
 #include <unistd.h> /* _SC_PAGESIZE */
+#include "../kselftest.h"
 
 #define BIT_ULL(nr)                   (1ULL << (nr))
 #define PM_SOFT_DIRTY                 BIT_ULL(55)

base-commit: 5139929c698c273e07cb0635732f6a918a7b8e78
-- 
2.56.0

