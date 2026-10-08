Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01213145A1F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468216; cv=none; b=V2PX9LKBTzYwD/YncmoQCYUqMYfo0xwRsX93UROY0OIsRUHCB61IN+I+/a464mMX+0re95xgkPJOg2JUGR6Yk15RCufwO71VTWfehsSj4h4AqJFamUzg2mMFv562XeP4FihcLb/sg+euAPb2XNJRON6ZGxsiXq6ylX7H2aWJEU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468216; c=relaxed/simple;
	bh=4HgljSOYxaStgEoNrbUTUOjtp8QGrt8NI8bCteDsYag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aqORssHVCkOgtbMW1ARE2t/UnPkAa2QRg39oT4OJaerWEv6Hb8cpzklfzyOPPncKAa7x3+XtnmuiKlB4f4iDKq2u8XhFTjngFTkbbHXPCrcLhq2ukp0ICg9MkXqSkm7a8asGWi4Qa7fuXcHIO5aRrB5TarFK69YtpQKUcHy2OHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv2Rbr4y; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv2Rbr4y"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35115b52125so3991537eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468213; x=1792073013; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jtAYB2sgYdS1KrwaZ2LoE0JcHQRSvNhoVr7+8DfDo58=;
        b=lv2Rbr4yop5F4ENaDS5Jj8DbITHOg9AluE6qAsNQMWCMglrSEE3u4wUsYybphZCKEK
         Bl64LgQWXYCw84MHJPvbrQxUhl1WmWtGhqWbAefoxfEx3N78hI/kYnBdE+jxF7vdSc7U
         kvFx7GL/WwLAd4+/23Y3fMMt6wQdqWwqD+qME0qFY/uGA77s4KOtjbfu+FnMmkGlom6r
         T823YtpKbQdJ/z/jzMXmMcxJY1fS/aedJq67bOX1clQrtYFiA3rTp5HF4o6YPjmVxKvx
         vuhHNmGJ2X05axR06PQPPnCeA+eFNAFR0c+gMRGll017EhxQVTJTS7cCnwLRY94kD66x
         Pxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468213; x=1792073013;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jtAYB2sgYdS1KrwaZ2LoE0JcHQRSvNhoVr7+8DfDo58=;
        b=hQe/jRGfQlYt0HVYLlKdQXWwvXY5LF6WRCH/G7lUqONZQQNIcOXHQ7mswYaSYHHrWD
         GRj47eh2FlGw7viHpzgjsjP2y/ZeQ73Vrh2AVmcHwrHPWa0h5g5NreipIGolLF31I6Er
         avBPqNG0gwj3ryu0XkCqMRj1s7QONtJniPXJs901S0eYJgZEzrgAyYbO1FoZe2yF8MgP
         inUEf/X0Gw9TAFdlhS3CKCGcKNi2MTbCaOx5lojxQjrajJwNK0Xupmv3BhzlWXvv7hCn
         zJHvyzKIdp7RfyL3OsDt6iqmrtm82yOqd7ljt6phm+Av/aFHdMilw9ETbKQCXjYQDzms
         PxNA==
X-Forwarded-Encrypted: i=1; AKwUvBzpzELOaWNHSmG8/8U2ITNd4zGu+G9FGIwVFytEkZkCqbfawIue/QsLfEC65Srw/gzDLu8hyJ+bt92KPbg=@vger.kernel.org
X-Gm-Message-State: AFuF++mag0KPTd3NGLCkL0xfU2x+eZdf4GN9Ja9ABQ5dUn8TtegI7CE7
	wN5mXb4Ob6M7HWyDLuqhBGk1e0L3trVVo99l96FeRcwSuWRIHZ0NpehH
X-Gm-Gg: AYBFou0Nr+zFEuIh2uLUYO7+TixrsA77r2xm2iIo3ezfA8zm1SAnOlLum/Zb4pIeY0X
	wKsRpLnj1WR/og1MTJPKMn7BxivL2W7B1HXEAJpt89+yZBhk3vdrCIy7587EblT/6gcEGol9q9L
	mfXmhBPG85F4+BidSJcSnEGN5ZkwZmGhwbF57jdanqXp9YprErj7g8tDaVloL6i0Jl94YXDijvK
	26hA/A9ynLCHTHz1HMXXRVjsgHavHG5M+l+p+WEaZBcjwf5E2YA0i/XeZdAf2efXXzqFtawcueV
	CHLTc7tssIrmIPHgydqQNusc+5l8CZFIoA+VqAIyJW0qGDz4CMpSq3R9iO/SBmaTSg2DJRxAIUy
	9R1LbkRRW5yvbpJ4lvklXHbmqo5E6A/qGMdq4Rlt1PXfhzF8M8in1YPe03c3H49PyOXYjLqyY0B
	KBULsee+/ITvgdYEih0aIilAfDhGWWYhkC/gR5fF49GfolYU7cUyNnz5u51WyX9iLTQQ==
X-Received: by 2002:a05:693c:4150:20b0:328:3cce:4b3b with SMTP id 5a478bee46e88-3515dc5450bmr7188586eec.4.1791468212696;
        Thu, 08 Oct 2026 07:03:32 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afa61e8sm18772280eec.22.2026.10.08.07.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:03:32 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:03:25 +0800
Subject: [PATCH bpf-next] selftests/bpf: Report a failure to register the
 session key in test_progs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-selftests-bpf-test-progs-session-key-v1-1-ec48e793639b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKyix2oC/x2NwQrCMBBEf6Xs2YVNoVr8FfFQ46QuShqyoVRK/
 93E2zyGN7OTISuMrt1OGauaLrGCO3XkX1OcwfqsTL30ZycysuETCqwYP1LgljjlZbZaWJP5jS8
 7L9M4XMTL4KhOpYyg2//mRs2L2Ardj+MHgzx2FIAAAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 KP Singh <kpsingh@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

test_progs adds the key that verifies signed programs to the session
keyring before it runs any test, and exits when that fails.

It exits with 255 without printing anything. pam_keyinit revokes the
session keyring on logout, so a test_progs started in the background
from an ssh session that has been closed since leaves nothing but an
empty log behind, with no hint of what went wrong.

Print the error before exiting.

Fixes: b720903e2b14 ("selftests/bpf: Enable signature verification for some lskel tests")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/test_progs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 46eb201b96a38..168d84cf4eb76 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -2065,8 +2065,11 @@ int main(int argc, char **argv)
 	libbpf_set_print(libbpf_print_fn);
 	err = register_session_key((const char *)test_progs_verification_cert,
 				   test_progs_verification_cert_len);
-	if (err < 0)
+	if (err < 0) {
+		fprintf(stderr, "Failed to add libbpf_session_key to the session keyring: %s\n",
+			strerror(errno));
 		return err;
+	}
 
 	traffic_monitor_set_print(traffic_monitor_print_fn);
 

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261008-selftests-bpf-test-progs-session-key-1c0a8570c051

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

