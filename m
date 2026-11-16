Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824591;
	b=XV1HXJeNOpt5w/Kwz5HPlf+TWlrTQTUt4RlR5QaaYOj4XWSgP4K2ZILiYEEdEdUt2NGC
	 Bb2I+Ky2qtaQEAnfwJ6os103hpXOPCscLdgHdHQK5Ur//hRERMjA0hNC8woB2wZy5ImkL
	 Gy5jJ6DI3HhaBmtt2w/nrVoxr2d2lU0ygui23W7YfOZmBDpV1vgMQYh8m25e/c6rVKrNX
	 7om7OiVI8JcWjtQrZrVXGksfmPj4c99pyp/sdZxTNhXeYPJIuODvY9eGooYl0WkOQFSzi
	 tEJoqy3pI1AB8klNMQOUMk/SZL6QQf3gzI2h4zSnVXMrR9ggNvJ2qcoVE8hLVAoaq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+Z+9Ajv3xyJmoB5H/8jTZN0dMUeUUYatOho4V13GL9o=;
	b=wIqMPmHOgjo9TuZAK92q7aMzSyhRFNAZYk5hah0gqiw7IqTJEJg3jslAo9Vw1OMerHAS
	 0xiqqwrgjFS2gi3cCAg/FOsj7d7u70NdYReESdH94t5EIz7p22kgAl1U2IqVpxNlClAk0
	 OjLKSFxSvlXVIM3SNCzLb87X9GgFYBiaiqQTsldja7WSRh8CB14cV1NoYWWiTk9Zh7wuQ
	 /estMB9R3nskagyhEOZoaO8Qk2mg15tHjXwF/IaCxOoSPbRahB1XTPbp1TE9qXk9TeueR
	 lOB9/IlAvfmh93HAzl88kbmWf6U11XZO6/UG4j69ghiO8JJuCI9m8Sx6iItMruEKdQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ev6u7bg8;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C87606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C87606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ev6u7bg8
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3519669f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824590; x=1795429390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Z+9Ajv3xyJmoB5H/8jTZN0dMUeUUYatOho4V13GL9o=;
        b=Ev6u7bg8Rg6ax0mUmXVgVdgStOD9C02I6qEPYaG4s5jtP3kBSQusRYR8OpFgMtqrJk
         SHmmYBCTGWQEkdqzKDbfOxUQVyRN06eWBZ3f/Q51vxVY3uG8G63Ez1X5Ak1gqv+wavEN
         Ef9Rmo2JStYusMZhkn6y86mEkoDtW2xTpc3qyYnaMCRFFNFa0V3B5AoaHQHR+4mhlT2d
         V0iOsCk10x+roDEejTdSyoyWmUlaXfMITEFfybEp+sd2hMZCyrQBa7arMdYGUkfS/7M3
         A2O8SkGvGrsd+zNB8NVJqrUTumuwU9aVa3sZxX3Fn1VZlWrC8CsgaZ6gCDFR8n4XmNQf
         MOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824590; x=1795429390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Z+9Ajv3xyJmoB5H/8jTZN0dMUeUUYatOho4V13GL9o=;
        b=Msl4KsWx2Ogpi3IRxKDx5z1h4SoBGUKjAj0wW1SJjz13zjPjReCods9bNo5pC6XMns
         S90EqYcK3c3e5Gc+pYYjuRVPEj+loeMd+T04P2OKZoxQz3XGaSH+5oZsiLlY796CkZ/7
         sS1lpljbZKEp5hCpM3LklITxffSh9s84BNLFEz8vZS4k1dYscNhaF3jKHHBMOCaqhbbx
         zc3F8Y3wRAXPRCK4IODcuEjOyrwKNgwSyxeASCzBNPjzRMZd+HwV6RHy1nm/amkMwY4E
         cYJAFE7WsKC1T5RZCATAKiBpQ8Fc3NLEnBQU9/V+W1wb4ZJdpe1lWV+bp+NTXZect6ta
         D1YA==
X-Forwarded-Encrypted: i=1; AL+hErGkG4sPntKrjcZ6Yov7k4yl9+ZP6AXc7VTN8wArLLyjcMcWtAvvn680wXPuFsJ66HDVf0Btgn96eiEA8NU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gufsgOf3Ax8tz8b3Hu0AoflBVuI2DnLoOHAxg2Er6U8kPJ+9I
	diLyx03FMPFpDyXhj2tGVmP2aCepDR/x/LG2+Nf6T+Z6NfeADgpjAt54
X-Gm-Gg: AZFdTZd9ulnQ6ln+UDjadPcxXbGZQ8Q2gMJqnOqbAl9rL84wlkgzQPwfswbNdnle2Vf
	4JQjb+xaEU/5OM/bwxza57XpV1ZBn/0ysld6Jszq/1NvcTYo5KbpbzrqrAyDCSTaNO62lq5JCih
	HImv66idX8g5u8LKW0FvH8rHa3pGUmUHr1cjK4IGtakXSNgW0Oxq8alURRzZ1v7Ne4SB8lCZ7cZ
	nldbOuSctJLFK28HrisKlKlrcgWD8js+mpJkQo+XljQnPOFzlpKuuJO9cnE7QdhWmbVHJ42fzPo
	eaDhEiN8r9X5mETIcUByQ2H0sV/xbmBzYrvOaBQy3aWdMNVp6RZYsr/iYLF8H5bWH8tBhj48YX+
	bb/hZOEb3TH2itWVWuwLqO86ip1+NzJwWEHMDsij9bNBPPVEn/GCC1ovBadMw+/G8qVV0LjSJ/e
	xxYy1co1QD7x0KpdubIE8at5VV1RsWXXMC1xRaIn0D0wxaNmocw0ChyEa2dI4AZT3aSRp0XuASp
	CyKm5KFcpqrUtG1JAbuzIIKIgtbo9skmOc0wcZtJJg0z2wVaF+ZeKQXXgnom9lgWRuG/1YfO+pC
	yiYtY8b9F0uElxgfUd5j9TeXsDE633dNysS6KEuOnM0=
X-Received: by 2002:a05:6000:144d:b0:492:880f:494e with SMTP id ffacd0b85a97d-49c72c9c630mr23730288f8f.40.1794824589695;
        Mon, 16 Nov 2026 02:23:09 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm20788426f8f.42.2026.11.16.02.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:23:09 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Su Hui <suhui@nfschina.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 6.1] fs/stat.c: avoid harmless garbage value problem in vfs_statx()
Date: Mon, 16 Nov 2026 17:22:55 +0700
Message-ID: <20261116102255.80986-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Su Hui <suhui@nfschina.com>

commit 0fac3ed473dd2955053be6671cdd747807f5e488 upstream.

Clang static checker(scan-build) warning:
fs/stat.c:287:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  287 |                 stat->result_mask |= STATX_MNT_ID_UNIQUE;
      |                 ~~~~~~~~~~~~~~~~~ ^
fs/stat.c:290:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  290 |                 stat->result_mask |= STATX_MNT_ID;

When vfs_getattr() failed because of security_inode_getattr(), 'stat' is
uninitialized. In this case, there is a harmless garbage problem in
vfs_statx_path(). It's better to return error directly when
vfs_getattr() failed, avoiding garbage value and more clearly.

Signed-off-by: Su Hui <suhui@nfschina.com>
Link: https://lore.kernel.org/r/20250119025946.1168957-1-suhui@nfschina.com
Signed-off-by: Christian Brauner <brauner@kernel.org>
[ Petr: There is no vfs_statx_path() in this tree. The fix is applied
  directly in vfs_statx() by jumping to path_put() via a new out_path
  label, preserving the reference drop and the ESTALE retry. ]
Fixes: fa2fcf4f1df1 ("statx: add mount ID")
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 fs/stat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/stat.c b/fs/stat.c
index ef50573c72a2..bc2b1f3a3860 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -231,6 +231,8 @@ static int vfs_statx(int dfd, struct filename *filename, int flags,
 		goto out;
 
 	error = vfs_getattr(&path, stat, request_mask, flags);
+	if (error)
+		goto out_path;
 
 	stat->mnt_id = real_mount(path.mnt)->mnt_id;
 	stat->result_mask |= STATX_MNT_ID;
@@ -247,6 +249,7 @@ static int vfs_statx(int dfd, struct filename *filename, int flags,
 			bdev_statx_dioalign(inode, stat);
 	}
 
+out_path:
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
-- 
2.55.0

