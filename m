Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747497;
	b=Ui+96GtURGtdlWTpi4RLP99i1JDFRtkvOZ3pVmddp8ODpKlQTpp1GjWXcTfBDXSgxlK1
	 RAOCLyy/tfcqFMUOeSJJZRzOw/Jb3OKiZmo7/cs4vYKXKjI1LNOpvhkDwkHmpps9TC1Uq
	 +cfqQBroCvoqV9WuBh9w3COWAJNNj5cNR5FTdefnA8dvr27eoY1VR1RqG7Vaj1kk0afA5
	 XoRhIKR2907tePqlK4IdBDs07QbtUmB43JuzUVVz/hG9WNRDf+4Uw7gypygHCriF81AA7
	 bf2gRGW9wFQm1RJpV7gaXyY6NswAZqcW1uvTV6I5sJ8IR+6Z+M2pt3D6XoLKxTHan6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747497;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3f6imDR2vRKyLye/bDJFbSuE21+KoRdI2+Zivaf+5T0=;
	b=avv2FwnvqnFJ6g6Hi8y4X5rzCBz2x7fv4DgR5laxLWrRJgTdaqPMxszXEvkEB0DY1QUU
	 oiMMrPWbfvBKCHDRpeix/jbDu+GC5hI3xG8lbIoF55fyCnjSI4NO94PTEmWLSXLjbvdII
	 BhlO0sQYHXwS0pK/oXtPiRzSDhbbXbq+Zn6hhAR8mjIlbgFHtxCf5VJgRvgqiL7WTupx9
	 x6jjGm05NBjR7caiutXWgy1cYHGbuAFdJUeUAay5y6gKRopbAPFR+nnncbrbMPaZ5lSLB
	 dHIBsB9xOp5DJfL9EFjxMYYmkbX6ms7Zv4wqnAlhc/fBdy8cReKa4108UgbZ53KwRxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="Fj6L85/D";
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A4E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Fj6L85/D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792747486; bh=3f6imDR2vRKyLye/bDJFbSuE21+KoRdI2+Zivaf+5T0=;
	h=From:To:Cc:Subject:Date;
	b=Fj6L85/DqB0c2HilkcQviv6/uYkj3wdCPBdCnGOfCYFe6yz+rrfiLZH93kAQCNAv+
	 p/valHBxku08aeDpm/nFE38dCk3V4BxBUvE6hERm5kyBTKUzq9P7gvcmy9sKu4hcBL
	 qb9xEV2LhMct+t83w7wFmmOnMYS2bWtIi/ZOzXCE=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 62C976F9; Fri, 23 Oct 2026 17:24:44 +0800
X-QQ-mid: xmsmtpt1792747484tqz3no2eq
Message-ID: <tencent_760494FBADB4184B967C5A93312EB198F506@qq.com>
X-QQ-XMAILINFO: MMq8nqC7jH0Be+Q4kCeE5YewTFo/Q+KySvYfoDEq585+InnVtKGJg+wBVHPKH8
	 VWgoEQ6I23ziCP+yiU8PpYY5p/xjX+n/1JNQ3mUbarjU+6ZHHDFnsD9VlChiL9axH4QkvBSyLskc
	 tOQ0CF+OcYwDI3/s5mqMFC7urtMMz9BAJZmrZ61hWdB8d6J4FPZEaMmPU8RFIHOQ3badhaijj/R/
	 xdBivTPjkW+D115wc9lDnPh9RM7c0qkKzxvjjXS5XaU85rqE9MemdAl1/jm0MesVqEoqLnQ2/Rrt
	 lfpoQp8JDR9++AuqSGqSlNJ0UnB9ngCkPr55EMbSu/eIihrsTx3xZt+mgJkKqmRA/ureRxQpCtgb
	 6fM2leAZLhdJwSd/4Y/QTLv1gAPyoTIz1vrmRp0HL2lsAccmszyOhEv/tB2Tj6P7ohPjLbe0UmcS
	 S8dal4BLcTXkWVoThFxRHaJJraAlOhet0JxmXX87XEMlt1CYM+csOPh3LauWWHm6tLNRPl3I7GVu
	 xyFmNIYwt1RQL4ymhEAwQoJJbkQx1jpGGzRg4lKhva9DIWPPnn7Xgc09gP2kiggS/AoZKDdnr/id
	 w8045s//BPkW0IXYH8b0HWKNFzGLQlyVelqN+m4fFQnLHuwQFJFf9WdRvFmclpR/ioK49MKSTpkA
	 6iaMAZX6fbjqGMHFy1CQhPAk+hzqH7yDkq2u/ue1HgtsXsIS/oln7AFqX3KMeGG0Sz1yjJWUIub9
	 L32rbyxABfVKKCJaP8OcunbF8H7M9U39Y73JV6YncUvzfqlFg0JLmbQqgTdsRCrC/tl8YH+X4GX3
	 WJJ9z0sBo+K8h4ToyoxmoykFyGQCwfDvEfgp8Z4Zn1TMq0OxyFzOckeui3uJHAOIK/YnOkcwMcD8
	 Yr/QBytkonztbFTD+agJ5KEER3RD+e3uRyuJ2mCHVBlB1RwPn2B7ebfiBMEgYtD51naT5fPrxhdT
	 aqlwYakYpz7p8Km9F3UirbMPa4doiXLXlZazpe8y0EhCdWwQKD9NNjvv1eMEotIRAm28chWhtWfg
	 cUqp4b3B/vb8UzcaaKYlOgBNfSk3QX+PwnvSjpck6BUQFEBwDK
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	takahiro.kuwano@infineon.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: fix missing space after comma in legacy flash names
Date: Fri, 23 Oct 2026 17:24:44 +0800
X-OQ-MSGID: <20261023092444.3969022-1-847807867@qq.com>
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

Add the missing space between string literals in the legacy
flash_info entries. Cosmetic only, no functional change; silences
checkpatch ERRORs on these lines.

Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46..31cba60bd 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3898,11 +3898,11 @@ static const struct spi_device_id spi_nor_dev_ids[] = {
 	 */
 	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
 	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
-	{"mx25l25635e"},{"mx66l51235l"},
+	{"mx25l25635e"}, {"mx66l51235l"},
 	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
 	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
 	{"s25fl064k"},
-	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
+	{"sst25vf040b"}, {"sst25vf016b"}, {"sst25vf032b"}, {"sst25wf040"},
 	{"m25p40"},	{"m25p80"},	{"m25p16"},	{"m25p32"},
 	{"m25p64"},	{"m25p128"},
 	{"w25x80"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
-- 
2.43.0

