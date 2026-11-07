Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794060108;
	b=ThnoIuq8ADKp0BYttKJbp7UG9zc3SU2NKf/0tRGmNmUWO5PuYwQFYpM9y2/vRmgrSbyG
	 27pqZ7CPeecwEgjn60SvIgpK7Qox0uEY17ncZN+K/0oZToSfC+c7M1jNTM1FLkScJ4O1p
	 kHKebPpgGpP8bzoFW4I3ZshJJ47KIuQBgXzMwXWiSIJ3hxb/VNU99dJw60e26GGjfZsbr
	 Pt7rWNWsdEW+Z7aIn9Cse0Xq0/53cJ4DK1MzjYsn6oqWnzSis+25qfCj5YjFKTEpy7qUa
	 6JZgw3qg6pK2Qg6v3ChIWAKR5CYtHm0DLqnZRMcAdc5r/LTUDejoiS1orE4V6aC/qOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060108;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EiN0dCtFHNRqLePhITbvvtoVm344G+ZlLoUzYjxtZTg=;
	b=l1yRewUNgxmMz/WqXW35/ad25bUhelddEhrIbXTg5PjRt5C29T9vp6l5ZxuM8fxE3Wx+
	 qlykikTvQzPeqBoGxJbkBNYUu/tUlRgx2bRo9zRCTwqZ/1g5JQJutaSloCiHGV6ze9y4T
	 jD/6KjQIpJhKctaGnyCRW3emjhsEvulebwEmmrTBOiz5KHBrezgX4DAPDJ35MamqtUv6D
	 dVVwBJ5gC+i4zTlwzwk5U9KIbaMLcj2ChqxKO7T82ZBt38kOwCnkQciIoZQ10nusxyp9f
	 R1SnsR86swFH5FYeG35SQ27vCyxSpb5UW1msTh1MHzprHe0bDU1SOHD/hfJ+CbcZUQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=durY1a4w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF71E606A32D;
	Sat,  7 Nov 2026 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=durY1a4w
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794060107;
	b=QtvThwue1SN+jFPjd7M0ZF8dOq8oOjH4ry5O9S/E47KutJlK9GUYx2Q4r+c2p49BcLKF
	 T1a9vMzYHcdpapPUe3K2JnPend6QnoNiD6jcbosXRNdk/ojb1cSZTBF7bz2iLJIb0SJHK
	 r1dOKjQ9RmTo/e4Ys+UOuxcrAsEzWOVqw2RfeVUKR/3gnv1WQHpOSxsAkDpVXb+P8R5eD
	 wS/v0Ym+hiJLk+VkMxSZjK88npJTUbDLrWXg1jr3SU5Iphzo06hS0dxr5uLr9iSxCedqe
	 w1dJ1LHcptFbCE2gUABS17yPbj77cNrHkpKS8oThSV5hEL+ZevhzqZ44rJcBuGV4Xtw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794060107;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EiN0dCtFHNRqLePhITbvvtoVm344G+ZlLoUzYjxtZTg=;
	b=Wq4M3BPmQYyjPbTG1TjoZ4ijv5dtlNj8r9l4miRY3SZ21zzVzsFuzznQQ9hqOLjLeBIH
	 u8Hfs+sr9bGPomuHv2MIEaq3ba/Q2ohpswXBdOJK1CZsxJ6vBCYjffz3IRJU7BRO3pVcq
	 8Ot2Qrqua6g5oUC6f/Wu/yEoq3eQPohHkBUYRwHcHey/dePuXcTMrm/s1RALADyrqPsY1
	 fQasI+XSmDH+lIOxnDrcaMh0GT2M4WeNHYfIm/B13+p2umV/kiaQ6DL/d6Y0IHqVaevMT
	 WARsfXE2287SwdXqyTBAqV0OL9k/QLhsGkVocELJTbOdUyMQJlXIfWPDBr2jj5vRR4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F0571F0089F;
	Sat,  7 Nov 2026 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060107;
	bh=EiN0dCtFHNRqLePhITbvvtoVm344G+ZlLoUzYjxtZTg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=durY1a4wJT//UsJrD8ArW7psxQrq3ro8n9qhkvACJxFxeifNXJc//Cva4cdZLjlxl
	 O15oON4yiST562luN6iufTkz+k5AME2T9oOVtcyAlQFGo6KfCS9Zhz5Oh3hXSGsCRN
	 qp0iNfJQufHvx97SsS7EreilWLhVKSzqhAkqdKjVt4jsPUuR+Rbx2Bgv6QB1JTd3a/
	 dGQmgazzFPojmu8sFU7i+KL5DX/EBkWprfqrPCLICb72v5c1QciQwv5gYDtug5JN1m
	 droRw2FtFPF+OVgxROuafxPQnn/QzHrKutqkfhBwy3IygGopbMniJdgCJU0m7DnaPr
	 +A5v/IMt51J5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 92FBB47C23;
	Sat,  7 Nov 2026 14:01:46 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 08:01:46 -0600
Subject: [PATCH] staging: octeon: fix kernel-doc comment style in
 ethernet-mem.c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-octeon-mem-doc-fix-v1-1-4d962b83a3d6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX23ILaQ+pXooPYVntQQyOC6N9bO
 s7AzAOFMlOBsXog08WFUxTQdQV+d3Ej5EUYjDK91spi8ieliIECLsnjyje2rvGd6ZUeyIKERyb
 R/3Sa3/cDY3XgKGQAAAA=
X-Change-ID: 20261107-octeon-mem-doc-fix-4a3c526019e7
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794060106; l=1191;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=+9rVYI6biHPDGY8NGsdQc54rP2z64h+4I/8Uh5neCIY=;
 b=GVo42hx1tShon+12HPtDazHwAFfkis25aWmt5zQY6AF8ZqViXkJkxHXwJmR5/wLtLiUpIYT4E
 ilQJYmpwqu0ALJhEJcQnX60489I3IyHTe+ThHLWQH5FrPFC+/gncNgF
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Fix a style mismatch in the kernel-doc documentation block for
cvm_oct_free_hw_skbuff() by adding a missing space before the
descriptive dash. This allows the documentation toolchain scripts to
correctly parse the function identifier.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 68c3ef984e56..7bcd11245d06 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -40,7 +40,7 @@ static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
 }
 
 /**
- * cvm_oct_free_hw_skbuff- free hardware pool skbuffs
+ * cvm_oct_free_hw_skbuff - free hardware pool skbuffs
  * @pdev:     Platform device for logging
  * @pool:     Pool to allocate an skbuff for
  * @size:     Size of the buffer needed for the pool

---
base-commit: cd894bbfd059e76e71ffc9b92f8a09d4d6012e9f
change-id: 20261107-octeon-mem-doc-fix-4a3c526019e7

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


