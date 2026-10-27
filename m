Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119029;
	b=FXwS/8sDA6OX9g6xJXc/HTvAI/1kIyn0zIeHPM8epFUsoQkOjYOqqsc1bVZKhSOy6ZW+
	 OGn9GDnLz2aV0QsRHkSPTJpc/xPBeDi7HlkVmW1tprDyn1GcQxF7iv8yEki45t6lWnEXE
	 N3iGgdOf7waIsfjejfMpOvkWu4zWaid0Z5XAagn+PMSzXt30UNkz4ql8g14UUBUuTtpBa
	 af8m/Fu54WkoKmA1h77mSUoSQKtr/3Yoxg1AByte890HqgphSuVVKTIch/wQJHfcxnSP+
	 LVYp552knJ33iEmyLdfnNYggn9vkXsBjmZwS5u+X7WOYbLdvjVcM3VCyeFX7NjuWYpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6W47LdRVzDR/azT+us/9EkPK5g/BEdP8gTOrXRV0SRo=;
	b=kLad0k+c3pWh4sD+m44ipL+PUGmzFTG8ZMzxnYK0TQq6nkzQxSdNhpwEcl9JMu3nCN3A
	 noTbLIQEydgr+MuXvXhvY6MQzRFqKO4Gc9aPZgh48nz5GFNaDdhh1prwPcziPtjQ8pDYo
	 OAHlg8nJJrPGCWfobIjLz+Dm6ftp8NOkaKPNxMtK87RUqlc7VVczqtaO3rlTMMm0/u8jn
	 zIHYPqKJgzQJYfmlBLI2PyJ8IAbzmZIG+CJGeY4swyb+8yPT0tmF8Sa/2DZ0zJH4mb/SJ
	 4DFqn/kFJXgEKvXFV+ksjUev4/FW1xvzMf2k7q66FKGwMG/c09ksIvOuIkNugRy060w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Usdl8fWZ;
	arc=none smtp.remote-ip=74.125.229.132
Received: from mail-dl2-f4.google.com (mail-dl2-f4.google.com [74.125.229.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E533C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Usdl8fWZ
Received: by mail-dl2-f4.google.com with SMTP id a92af1059eb24-1922a6f0d23so1520262c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119028; x=1793723828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6W47LdRVzDR/azT+us/9EkPK5g/BEdP8gTOrXRV0SRo=;
        b=Usdl8fWZX1ufLOwVeRY+urzWgwgfnY1HHWVN5OS1O1pHpWWBw+I0gp/aKmStdOc+h8
         V8WULRTmr9Cvf7GSsNf0K2LVUPuh4APRrxOE7c2CyBS3bZ7ZAHwxAYFjFEZvA1YztSkJ
         VUKk3cdBFNqyjmS5gyrKqcvhof/qOVhc2v1/72ckZrpqqQaX/jL8T0a5RfnFzAtHGZ+K
         z5lrCNYRwC+hU/cNANyg5/pRVfr46FtY1MPhJvwUVeXTaS8mCro+ud7PmrlJ1s+hgWaZ
         g7tsyjSWEXqhzg2z+nWbZDjMYr//W3CVryOmUGcNDAx0haWjgzaBrk1GYPv8rdehY9W5
         dHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119028; x=1793723828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6W47LdRVzDR/azT+us/9EkPK5g/BEdP8gTOrXRV0SRo=;
        b=0P3rfu4xfjT26tvkxKJwk62oer9ZXwqSo91LX1Vpx1vEeBMtia2L8GT7vFupvxWfzo
         rWLlfc9SxVznWF1qzfEPi4aHvrTawIH0hafFMt604X4TdnFS4tWXMhvQ7yt4ma9wEw2e
         an6wA4UP02J7/wdVhY3rFAQAZj1SE+CwlCfVTEjhGrNsPtbIQOTIGe2TfsPDjEM5EoVz
         9aMHkjGE1FZ55kU/Lat44yr9qCq5JcR3JYv08ZDUs+AphdIVnH2u3L80NSIJJdUORiI4
         L+WILq3iWe7G5IAuWCqWSJXZbde903xUZK9mgtaqY/mr+jJjihX7JbQlIKfIH6Suf5xB
         8E3g==
X-Forwarded-Encrypted: i=1; AKwUvBxuuGeiIIHiIapdclKmsotJR/+++DIarMXGBguIuB+m6veniVKFLJibpuv+ePArsgB6ghx3DIDNhNQZxGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJffk1XdezqDtZ5DHXzvWoaf/NGnZbP/u2gVp2raB28/YlEq/nN
	b9G/qH+TrDutFjOviw9nsE276dNHwCo4diu4t34+wg1Vbi7+W5uS/wmqdO8j0wvG
X-Gm-Gg: AYBFou2nDp9J1YEki2AET2TqBCnxk0Wcqv4zWk0ISSypnL2y7jSsHwB7pqNyMUtM8Js
	OR+Gg/S34BcKpEqlgEexapdWJWt//iw9vXEmyyfRK3TRa2ezrniEoGITWDPWm/adLKsjYdcDMfB
	RvV0ogpR0WlevA8O4uD5Bx+ZOpvcgqrRwv8P/ULUSThCo0QdkkgdGyZPG6kA6osIxPTvlL3qlUp
	/5kZzACNp6mqoB8l5qCFKOeaSrHsTUNsOD4AFVcnewmkWCuUeng/NmUINcf/9RxSYeVG8kC6sKM
	WSL2gdC5nIjnCKASrfU52NSLMrn5rh/MBKmbqBnLIVGuh+b9856tudtZGXf5k+igRoQbVM10pa8
	J+PfFus8NqxPxB/AWxoiwATt3lIMpQeUdynA4+Z1NJ2cqLt+0I+LN3ilVVnKTJipPQR3lMr87PT
	TTpy0d+UkKe+Uzs8weJe73SMVoaqDN8kaoQ2aWzLIwmbfeXbfmbfZvE3LkM+iu3BQs7nbk4pIbw
	7m1XGx9LvIWNlKeO25it61BsElXcvYy/+7x5wPLZlVxISYFFlDDkCqjZFSfWhrULKMQiv7/s1se
	1EY3Uj6ecrsd8zI6Q0S62p72VB08U/AQ2XEfUEfnNh77YZpDwAvsSFJ4
X-Received: by 2002:a05:701a:ca07:b0:14f:5cd:f286 with SMTP id a92af1059eb24-199373095e3mr16662744c88.34.1793119027895;
        Tue, 27 Oct 2026 09:37:07 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm33902579c88.16.2026.10.27.09.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:37:06 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hughd@google.com
Cc: baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	tim.c.chen@linux.intel.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] shmem: clamp negative used-block samples in statfs
Date: Tue, 27 Oct 2026 16:36:53 +0000
Message-ID: <20261027163653.82661-1-dennylin0707@gmail.com>
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

percpu_counter_sum() holds the counter lock while scanning the per-CPU
values, but local updates can still proceed. Concurrent allocation and
freeing on different CPUs can therefore produce a negative sample even
though the number of used tmpfs blocks cannot be negative.

shmem_statfs() subtracts this sample from max_blocks, reporting more free
blocks than the filesystem's total. With a one-page file being written
and truncated on separate CPUs, GNU df reports negative used space, for
example 67108864 total bytes, -28672 used and 67137536 available.

Use percpu_counter_sum_positive() to clamp a negative sample to zero.
This retains the approximate accounting and does not change allocation
or limit enforcement.

Fixes: 7e496299d4d2 ("tmpfs: make tmpfs scalable with percpu_counter for used blocks")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index d97fc32e7c94..092bb45a076c 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4005,7 +4005,7 @@ static int shmem_statfs(struct dentry *dentry, struct kstatfs *buf)
 		buf->f_blocks = sbinfo->max_blocks;
 		buf->f_bavail =
 		buf->f_bfree  = sbinfo->max_blocks -
-				percpu_counter_sum(&sbinfo->used_blocks);
+				percpu_counter_sum_positive(&sbinfo->used_blocks);
 	}
 	if (sbinfo->max_inodes) {
 		buf->f_files = sbinfo->max_inodes;
-- 
2.43.0

