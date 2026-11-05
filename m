Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913134;
	b=YX6ylFDWYqj3ROZ1YNa4iKuHkZ+nopMCj1dwqlqjWQM+f1rLgXC8Kt9sQyN33Hi+NHQW
	 g0K+GAU2yNYJkpt/V6I4DfU3HIK9a9yXQFWSboezjHtdl7VvYTAsf7SHzxu7sYeSQ+vZT
	 QVk1HJ9lz++XfFJ3L7kKwBaBk4vP2BV4WP/YmP24liWNYIoU1CYu1w1G96Zjogg2sreUj
	 sLL7WM7vSvJt1AWZsvICs45ySksqLBMvpTgCQNpij8DDLUZQxhhH/M8xiuZRtyV74pd5R
	 rEoYcn3iW3CC5M2Jpnk16VLC8S7olrOehMk3cEdRUdZHk4+gS/xfRP+jq0HlnC7a3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=el8UefO7rpr/wOf0GvsC+VQdx4hFeG+XXR6vxfOLdeE=;
	b=t4ny23vECWbLJDIxTylXmW61100wFE1sd8XgLkEH9bo2967cthr1n+SrvUh491twK1tj
	 kxtUJ82VLznT3PGNucr/jTzSNO7J0rmK/+ojzK/UUZg0PgXumYM3EGWikbyKMs3h4TZNN
	 7vCltVaxhq7+/ibAB+RvdCLGb/wOifBEUf5oMn/u1RY4Tei9QntUjgsecohq1VRLJleC3
	 LfdBGsIJ8VUT3HCgOCAECOZH0Ha9YNnf6IhkUcqi+o/xIPd/kkE4L+fA7rBDzHOuNZ46+
	 OKZo91RhJOaeI/9qIz7D8cpO5AxznAslaPEv6vumIyCODu35cb8oPP8l2GPHa1M+Mvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4JDxf5L;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BE2606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BE2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4JDxf5L
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4919a880834so13080f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913132; x=1794517932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=el8UefO7rpr/wOf0GvsC+VQdx4hFeG+XXR6vxfOLdeE=;
        b=q4JDxf5L2LWswqnHpLm48eiDUPJNMr/N0W/sKzOggrPXzmqsWZuyGk8M4vXlBZiTG+
         folBIb6R9Cd+pczRgv8NWmer+NbzJqFXAZJ/5C0u4dyU9LLeosGLfHsPqjfY6eOCL3fz
         0pbCqzD/8dZa1P4mmZtCtasFx4i9XKNDC0c0N+BBgrwm4ePD3fqlNPF8zmUZhVVYzpiy
         KODGnoEjdHyVZYhBV4SDSpTXI5X0oZjTEQ6bIb4IcsxdupDGOOBWVNg2Aa6uMtXuPtZN
         WdETnZx/QKZeMrDJix+h9WWpweOMPRgVKJAedT4D1dGJoRjPwI/9drf3gwwXH8x8qKZp
         ROzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913132; x=1794517932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el8UefO7rpr/wOf0GvsC+VQdx4hFeG+XXR6vxfOLdeE=;
        b=xr+IgcgJLo8EHFKQe15D3aKJCdexEKgddsp14qB1UzhwPv4y+xBJvyqj3f3U8ixfpg
         u9w6lQH1BObe+yzFkHALxBx0iKG01dBalt1ZMqxYwMoq2/tlPdxN67gDfTK2bcg9w6A+
         8pYJ20h+Tk6kvkl4pv+CDUianscUQCKKFbQMcFkeHrv7QQ9/vk8+9jFLf6Y9He2AK7O8
         jxi6lQ0y6TVcQmoXdM0InrKReuG0/2r6GHfqajw4kwBIpgP/NDxF1eED2KZQsbJQcMfV
         fpni3DprZ7ytsqg7E7vXiYND/AE+Bob2r9zCzjc4Oc6Ksl6m7TEAA5ia8dy5WLQQBAdb
         yJ4w==
X-Forwarded-Encrypted: i=1; AKwUvBzv/x3JDVnLXCsZ/OjY05Y+21+uBLF5glAIjWxZ4lJpmNqwNJaH8vxNZcwCgo3673ECC5R9VciVrFqUrbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P60QAIWRJBqWeU329YDZw2kr+ZE58oVnqsZdhgxtARCI8hbcj
	5uW1HHqmu2whHzwhqF8n2pC9Estc8Kv3se4lrkUHXVx82/fe4i12ftBH
X-Gm-Gg: AYBFou0Cta4TOWZO70rAjVXPjDLf7QSnkC4gICfycBxSTN4t4Fyy+bF1tKo9rtAXODQ
	sA/+tggxtJ+lwvek9BHCyTP57uZl3HlR2pq9pr3isisUzGDxCTrHzd5N0qYpHdb0rM8V1dvRDKw
	SD0aou1nYtaN3v3RhdkNs05eZtUp6Lb+U+J+Y5Xr2pRXd4pVS6s0mcdfMc1fOjJTicX9lHkkx3h
	re/qQ0Oe18PmD6BI/xche3mnuH6N7/VIok8xgCbsbw65lJGaVBi5LgaZa5sEJJrzkytvLvMOPlT
	1s5C0rnldg05F4yKXNLtpmMjyxMH0qgGtDLmkQGKap3mq3OdqSo+zf/dgC9oBSbLp1YZVJTzVA8
	SuN4F0t7wjUvqTyfFJ8SjldEXJajS3OBysn4h5Mj4P4B97bkQKOHJpsF9tV6e0laeiOAlWYtAdH
	KUeFqXpM1Ulk4SXx0EXEHdMzYXhxYG5CF8FdgNWsEqouayphLTqXk96nZjtfG3ZtjG7ZPEIBeC7
	+4YwSp7Wy4P802iFdM9KLl2J2MN+H0qQYNCXb+y53yuVxobOVook/4vg09/OwMx5l8MSK63KyW+
	bRCzfcs8rpUmfEtZHQSqTQYr4qS4tdAS0rF7ZVo=
X-Received: by 2002:a05:6000:184e:b0:490:5327:7670 with SMTP id ffacd0b85a97d-49274bc834bmr1865777f8f.10.1793913131990;
        Thu, 05 Nov 2026 13:12:11 -0800 (PST)
Received: from fedora ([109.76.85.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm12408979f8f.40.2026.11.05.13.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:12:11 -0800 (PST)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: kees@kernel.org,
	shuah@kernel.org
Cc: x86@kernel.org,
	eyal.birger@gmail.com,
	jolsa@kernel.org,
	mhiramat@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Dolan <paul.dolan.dev@gmail.com>
Subject: [PATCH] selftests: reject malformed uprobe sysfs values
Date: Thu,  5 Nov 2026 21:11:50 +0000
Message-ID: <20261105211150.9964-1-paul.dolan.dev@gmail.com>
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
Content-Transfer-Encoding: 8bit

The uprobe helpers in the seccomp and x86 selftests parse integer values
from sysfs with fscanf(). A matching failure returns zero and does not
necessarily set errno, so malformed input can be returned as a valid
zero value.

Both callers treat non-negative values as successful parses, allowing
the failure to propagate as valid uprobe configuration.

Return -EINVAL for matching failures while preserving the existing
handling for successful parses and EOF.

Fixes: c2debdb8544f ("selftests/seccomp: validate uretprobe syscall passes through seccomp")
Fixes: 29edd8b003db ("selftests/x86: Add return uprobe shadow stack test")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c   | 3 +++
 tools/testing/selftests/x86/test_shadow_stack.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 66bb53bad93b..5671890f0b13 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -5752,6 +5752,9 @@ static int parse_uint_from_file(const char *file, const char *fmt)
 	if (f) {
 		err = fscanf(f, fmt, &ret);
 		fclose(f);
+
+		if (!err)
+			err = -EINVAL;
 	}
 	return err == 1 ? ret : err;
 }
diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba4..ab1232fbe523 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -748,7 +748,7 @@ static int parse_uint_from_file(const char *file, const char *fmt)
 	}
 	err = fscanf(f, fmt, &ret);
 	if (err != 1) {
-		err = err == EOF ? -EIO : -errno;
+		err = err == EOF ? -EIO : -EINVAL;
 		printf("failed to parse '%s': %d\n", file, err);
 		fclose(f);
 		return err;
-- 
2.56.0

