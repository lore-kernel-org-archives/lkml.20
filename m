Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253626;
	b=tzGvCH9CIhQt+umOw652Ms8Ja11nuuWkY0zo84FdyIUIuJ6J7yp5uleQZYQN6pVxKEMa
	 b0mISd8+oijURfah/W2I9OrHo5Fxbzyab9u/u/QbCG65T7HZUgeySFCzODQ2kJ8XXispO
	 kSaGdFiXx5KNHobafVlrfsKyij6OnnDIK2v+PfrkSV6PB1X80R1AKr+SE3RTIz95IqEm9
	 UiCvKGexbbvHKHjcFVJDvmcYW2MvYLOH2onue6w+md5PRp7NfcSPszwynu8M0PdPyU4W8
	 DVaLktfR57wZVaKtlw9KbIJKxXyNR6yb/tkMKx8N6JM9b9mZhk61YYyv+irvjrLzLuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vOGC1ex5Knc4gUvwls9OSLa63qIjRIYMiD8fFkiWwrE=;
	b=JoHcxVnLnNs+P0r4xoSl+FDTLH/WRTn1VGtQBcqfjcFsQudsq1PbJz2GHSh3AqrgcF0O
	 +IUwIUikrP9W5jQCxEkGmEuD9G+cqL6MNlqGY6SdctShfxDU5F4V5ZfS5BoENToi4Bx4i
	 YEQhDE5+N5IH+iKro7WAW0wL5GuY8s1ts9bN5iWZfM78zhOG//AT7QLz9uESelnt/smAN
	 FSG+nHsLurES7QwMf4URhQjEfcGSZkB4NfezZLqT3+EMFxmCwqq3nnuwylFbBVX57xQYE
	 qs3dxNVykf+n55BsLCrCap8dQEMFItGmMtTwPYhRrKp72h8XJJ0ErgBSerTm75I/yGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=QJmOLFkT;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582B606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E582B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=QJmOLFkT
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 69EED14C2D6;
	Thu, 29 Oct 2026 07:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1793253622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vOGC1ex5Knc4gUvwls9OSLa63qIjRIYMiD8fFkiWwrE=;
	b=QJmOLFkTugrCihej57+Q0f0P+SXn029yLmYWE0Kb7/AJOyQd6ujIpzmsG9B27FMaphwiI3
	Vx1qX/AJjRgo65RrelaK6gtkJEGY98z/o72aEYn0wQZuWVqVR1GWzEZojbjDaQSP1ba9UV
	Rk5WD/KqdrM0MRORpaevjUgcqmqVKgMGNzIbwXttqaHHYuLpoQ7QjmtVPkPcdeIrM35Hqz
	PmFdpbgsTvnjMa/x/GTXtgTygD/HsA0/BSVwaW19RcZvG3uAP6GJPH30M7zGpjyH/8a9t8
	1tGXjvX1/D1QHL+mHEc85Imj/t7ekleGMgBB28hqKQIgyY6skQCHlSXGT85M+A==
Received: from gaia.codewreck.org (localhost.lan [127.0.0.1])
	by gaia.codewreck.org (OpenSMTPD) with ESMTP id 506b6a35;
	Thu, 29 Oct 2026 06:00:18 +0000 (UTC)
From: Dominique Martinet <asmadeus@codewreck.org>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Cc: v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] 9p: optimize p9_fcall struct
Date: Thu, 29 Oct 2026 06:00:12 +0000
Message-ID: <20261029060014.3-1-asmadeus@codewreck.org>
X-Mailer: git-send-email 2.54.0
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

p9_fcall has a 1 byte hole followed by more data and then a single byte
element:

struct p9_fcall {
	u32                        size;                 /*     0     4 */
	u8                         id;                   /*     4     1 */

	/* XXX 1 byte hole, try to pack */

	u16                        tag;                  /*     6     2 */
	size_t                     offset;               /*     8     8 */
	size_t                     capacity;             /*    16     8 */
	struct kmem_cache *        cache;                /*    24     8 */
	u8 *                       sdata;                /*    32     8 */
	bool                       zc;                   /*    40     1 */

	/* size: 48, cachelines: 1, members: 8 */
	/* sum members: 40, holes: 1, sum holes: 1 */
	/* padding: 7 */
	/* last cacheline: 48 bytes */
};

move `zc` up to optimize it:

struct p9_fcall {
	u32                        size;                 /*     0     4 */
	u8                         id;                   /*     4     1 */
	bool                       zc;                   /*     5     1 */
	u16                        tag;                  /*     6     2 */
	size_t                     offset;               /*     8     8 */
	size_t                     capacity;             /*    16     8 */
	struct kmem_cache *        cache;                /*    24     8 */
	u8 *                       sdata;                /*    32     8 */

	/* size: 40, cachelines: 1, members: 8 */
	/* last cacheline: 40 bytes */
};

This in turn also makes p9_req_t 16 bytes smaller (152 -> 136) as it
contains two of these.

Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
---
 include/net/9p/9p.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/9p/9p.h b/include/net/9p/9p.h
index 22ab7486795d..067e8a3b38d0 100644
--- a/include/net/9p/9p.h
+++ b/include/net/9p/9p.h
@@ -581,6 +581,7 @@ struct p9_rstatfs {
 struct p9_fcall {
 	u32 size;
 	u8 id;
+	bool zc;
 	u16 tag;
 
 	size_t offset;
@@ -588,7 +589,6 @@ struct p9_fcall {
 
 	struct kmem_cache *cache;
 	u8 *sdata;
-	bool zc;
 };
 
 int p9_errstr2errno(char *errstr, int len);
-- 
2.56.0

