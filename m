Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309818;
	b=ReBnqg5hejGccxt1kqMs9yO5suh9m//ZvCySvQ0wfLlET6JynBcRaTPRnlXrfXcPaUmi
	 7PverUQ6eJ3YbyyRPr2HO/oxxqE4yu/XzI8aGLxSn9moP3wOGfJjS/xpYK6+B9NV/JV3p
	 0ATWUHSoBQNI7Ay3n/WhjfEwBW9eM/gKWN9jIXY6X05xPkeasis9l6Ch5rdFUmJsFO2ei
	 jTfMuGvcqmPm05dmBCXoT+CIScCQqgYqrO0dK0qm2CWW8ABttvsVRB1T9nfMcleE/8Sq4
	 JZ2XEvtAi1a1efKi3W2aVsB6v2b46AiWn4LBHt6kctFuY3zjiofDwv7CmyH8is6uvWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309818;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4VJcYhCNPCtRBv/DHhtqAYLeQVZj55bW9jLRi4lVOq4=;
	b=eFFFcrFbrVbDbEHqcseFrKOsRKFkw3nt1mfa45HyBQBT8nXjXzt9W+yaqGaZk2hLR5ev
	 H1E1eC2TeY3k/gjRe2OHnkuiFLCgN0OkSMePPeuMJW9FGM/glBZcb3tnOXLl+km5tU58g
	 F+5SACeqxz7PmM6VIqIM72H09U3dgnB+FujL4uMYHvwTvNCSf/1/+HYDY7Q1joRawcUqe
	 wDrzqnMqyoWtPopKMZ9tPwXha81/YZixIPJf9A91/r1YD4LZn6y6h6l+VRxKAnmVU48vO
	 rbiPvxhSjUBLUs3ILmZaz11CVyIkCq3Jsw3HNUk1MmjHqe94LqXOCoSkTFaKUtdFXqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fVi4BJmf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YsPaqJPb;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD62560A263D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD62560A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fVi4BJmf;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YsPaqJPb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794309816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VJcYhCNPCtRBv/DHhtqAYLeQVZj55bW9jLRi4lVOq4=;
	b=fVi4BJmfUeWdGCT7Bnziou8YOPD1JF8oG8BSONW9QUDjbN1T5LcOt84W2snOPsrB/Ph+wP
	8sVDGCBZNrtNNFscUr+wopR6qr85AqRPSG5TWopPGIyXeDsc6ox0RQrb2yKIwC/i1R5hgX
	9Pb4Bd7hNyx85JG7hqLEVpQwP7tjQEA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-o9Yz5trpNMOXU_ARTi46cA-1; Tue, 10 Nov 2026 06:23:35 -0500
X-MC-Unique: o9Yz5trpNMOXU_ARTi46cA-1
X-Mimecast-MFC-AGG-ID: o9Yz5trpNMOXU_ARTi46cA_1794309815
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ebc622dc8so51158476d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794309815; x=1794914615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VJcYhCNPCtRBv/DHhtqAYLeQVZj55bW9jLRi4lVOq4=;
        b=YsPaqJPbk/QkqWDJUlEOrPcCCsHHhqYKpPagE+xTr7ZKYIrkxW876B6heyX6cO/Yai
         KgrycaPJX0xuvtjC/Fab4727dBaG98/1s/BAgzBm3fcl/Q9CWX2HKPw5JNvFrXi3JrGg
         6ADH9hTaCbI1Lv+v90d4cqpw8a+iQRTIY9HBE+c1Tpisf32UIFEUjIEs4IC/j80pzVsg
         98Im11lCYzggHWTiwqsLE9+hTEGuakRM/U/wEoPKTJ+qcpdb04/Cxx9uiTL6nw+rrwj3
         v5UNtno2UHifsjrf/7cIUConAV7cmsVY6x/75RZIxjmgm+8DtenEJ5ArpuqO7d55PRGF
         Su7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309815; x=1794914615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VJcYhCNPCtRBv/DHhtqAYLeQVZj55bW9jLRi4lVOq4=;
        b=00KNiHCdetSELSs8pQh3oh/VHl2U9rafGOZhnUTFJqDZ+I4Tsz32+y7fEE9CglAyi4
         YZ/qz3KvRpnVzJlRmVD94Nv9VK8UXVEapm4WjvtGd8+xTTNTKlKfxZJJ516REuc4GRoJ
         luU76xTEAMZEIy4ACkItmXRY768pSI3ubz8UYaxd/3tFdVsJdKzdyF+/U200Tb5cL0N2
         +lPrg/I8ljtBSnqp1VJCHBJGhU5sX7qZ3fTn6BYdqpIMxx/wCn/v4Eg3Elc8zmWSG60f
         yhUFmVxO6qh/s5GksCoGr3Hcxpxoy7dRpSkHENzcdXmNawrNiyB+ugejfdnhtmy/rbtU
         amGg==
X-Forwarded-Encrypted: i=1; AL+hErFhaiHTpLZBoMZlVffx3E1ZxIcpxoR4cnOKCK6fcMLxbfXJchm1V+pOOqlUOqUngBPRz7FUQFoUmnyH8nM=@vger.kernel.org
X-Gm-Message-State: APuU4Z89x5RikrGyKg+DMQulH8/Scc/e8+R9pngu9hldem06j7D+6i/f
	4WfiR0rWQVx2vtYiNcQ2MvguoKtbGQESRNWixmsUdFJ4XtxV9SuTfJKrbxH5rmvM3c6+eYiwkG+
	gCjlNfNXeCE1QxtBsf95t62EskReylxfj8a8JZcGki4fyWgb1OHnqtMCNasSkKd9soQ==
X-Gm-Gg: AYBFou3HpecTBeVATClYHLqnUfB4CKuYBK1wbKYMOWEL75jDJDvPSoL6zYySeR9XNp5
	sNIzNtebbHms93Bo2G37q46GT8n7LkP2T1kxPlG+6d398/4jix4DD1rKZJiIFSg3jXf6PDXMsfa
	GbmIVhsfQdTVoVITUFYOz9wPC5TTw9IzigjNfdTgcBMuviSq+22YfPWx0lAbsYUW6PUG7RP3zQx
	3g7Al5vhZhQ0ya6x9uv571JnHuKxk69G2t6U0juh6prZQXwSonBV4uwtpvygRXyon7LziswSdI5
	0acDLOmUUCDWeMlYbu70kRAGQJHnAGT8P20Lhvu0H+hdHCz7EE1u20NGLMCprqZ+CFSHvfuXIMv
	L/gMlG/1NZJGJ3sGU0WfonH3dod67XVoQ7aO2jJU+Tgkk44LJgq/hTfkUsnYhj75BpwE4ZmmrJg
	lId9qwZzTNpMtbIS90iDrmWzoegE0/LEJsEBj53dFM/fea6HLhf1g3FBqkLf7BddWMzLk0Mrx6N
	1DFRkAVc2dwPF2qvIbW6p53yo2lYyCGecXNqIKucH8T4SrLQJB+
X-Received: by 2002:a05:6214:62d0:10b0:91e:f174:bc36 with SMTP id 6a1803df08f44-91ef174c14amr19800066d6.26.1794309814730;
        Tue, 10 Nov 2026 03:23:34 -0800 (PST)
X-Received: by 2002:a05:6214:62d0:10b0:91e:f174:bc36 with SMTP id 6a1803df08f44-91ef174c14amr19799816d6.26.1794309814015;
        Tue, 10 Nov 2026 03:23:34 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04e7315sm18569186d6.22.2026.11.10.03.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:23:33 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 4/4] net: add basic splice KUnit tests
Date: Tue, 10 Nov 2026 11:23:25 +0000
Message-Id: <20261110112325.3263078-5-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110112325.3263078-1-amarkuze@redhat.com>
References: <20261110112325.3263078-1-amarkuze@redhat.com>
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

Add small KUnit checks for the generic extraction and direct BVEC paths.
Exercise a multi-page folio over short appends and resumption, checking
payload, checksum, fragment count and ordinary references through release.

Check zero-length requests and rejected-page rollback with and without an
accepted prefix, comparing iterator position as well as remaining length.
Use separate valid and rejected segments, without a mapping fixture.
These are basic helper regressions, not an exhaustive ownership,
arithmetic-boundary or device test suite.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 net/core/net_test.c | 170 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 2b5080c22663..c295560afbd4 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1721,7 +1721,177 @@ static void netmem_ref_test_tcp_devmem_recv(struct kunit *test)
 #endif
 #endif
 
+/* skb_splice_from_iter() */
+
+#include <linux/bvec.h>
+#include <net/checksum.h>
+#include <net/hotdata.h>
+
+struct splice_basic {
+	struct sk_buff *skb;
+	struct folio *folio;
+};
+
+static void splice_basic_free_skb(struct splice_basic *c)
+{
+	int refs, nr;
+
+	if (!c->skb)
+		return;
+	nr = skb_shinfo(c->skb)->nr_frags;
+	refs = folio_ref_count(c->folio);
+	/* Keep the owner alive during cleanup of a missing-reference failure. */
+	if (refs <= nr)
+		folio_ref_add(c->folio, nr + 1 - refs);
+	kfree_skb(c->skb);
+	c->skb = NULL;
+}
+
+static void splice_basic_release(void *data)
+{
+	struct splice_basic *c = data;
+
+	splice_basic_free_skb(c);
+	if (c->folio)
+		folio_put(c->folio);
+}
+
+static struct splice_basic *splice_basic_new(struct kunit *test)
+{
+	struct splice_basic *c = kunit_kzalloc(test, sizeof(*c), GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test, splice_basic_release, c), 0);
+	c->folio = folio_alloc(GFP_KERNEL | __GFP_ZERO, 1);
+	KUNIT_ASSERT_NOT_NULL(test, c->folio);
+	c->skb = alloc_skb(64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, c->skb);
+	return c;
+}
+
+static void splice_basic_iter(struct iov_iter *iter, struct bio_vec *bv,
+			      struct kvec *kv, unsigned int nr, bool bvec)
+{
+	size_t len = 0;
+	unsigned int i;
+
+	for (i = 0; i < nr; i++) {
+		kv[i].iov_base = page_address(bv[i].bv_page) + bv[i].bv_offset;
+		kv[i].iov_len = bv[i].bv_len;
+		len += bv[i].bv_len;
+	}
+	if (bvec)
+		iov_iter_bvec(iter, ITER_SOURCE, bv, nr, len);
+	else
+		iov_iter_kvec(iter, ITER_SOURCE, kv, nr, len);
+}
+
+static void splice_basic_expect_iter(struct kunit *test, struct iov_iter *iter,
+				     const struct iov_iter *want)
+{
+	KUNIT_EXPECT_EQ(test, iov_iter_count(iter), iov_iter_count(want));
+	KUNIT_EXPECT_EQ(test, iter->iov_offset, want->iov_offset);
+	KUNIT_EXPECT_EQ(test, iter->nr_segs, want->nr_segs);
+	KUNIT_EXPECT_PTR_EQ(test,
+			    iov_iter_is_bvec(iter) ? (const void *)iter->bvec : iter->kvec,
+			    iov_iter_is_bvec(want) ? (const void *)want->bvec : want->kvec);
+}
+
+static void skb_splice_basic_append(struct kunit *test)
+{
+	unsigned int bvec;
+
+	if (IS_ENABLED(CONFIG_HIGHMEM) &&
+	    READ_ONCE(net_hotdata.sysctl_max_skb_frags) < 2)
+		kunit_skip(test, "two page-bounded fragments need two slots");
+	for (bvec = 0; bvec < 2; bvec++) {
+		struct splice_basic *c = splice_basic_new(test);
+		size_t len = PAGE_SIZE + 64, first = PAGE_SIZE - 27;
+		unsigned int nr = IS_ENABLED(CONFIG_HIGHMEM) ? 2 : 1;
+		u8 *data = folio_address(c->folio) + 17;
+		u8 *copy = kunit_kmalloc(test, len, GFP_KERNEL);
+		struct bio_vec bv[2];
+		struct iov_iter iter;
+		struct kvec kv[2];
+		size_t i;
+
+		KUNIT_ASSERT_NOT_NULL(test, copy);
+		for (i = 0; i < len; i++)
+			data[i] = (u8)(i * 13 + 7);
+		bvec_set_page(&bv[0], &c->folio->page, PAGE_SIZE - 17, 17);
+		bvec_set_page(&bv[1], folio_page(c->folio, 1), 81, 0);
+		splice_basic_iter(&iter, bv, kv, 2, bvec);
+		KUNIT_ASSERT_EQ(test, skb_splice_from_iter(c->skb, &iter, first),
+				(ssize_t)first);
+		KUNIT_EXPECT_EQ(test, iov_iter_count(&iter), len - first);
+		KUNIT_ASSERT_EQ(test, skb_splice_from_iter(c->skb, &iter, len),
+				(ssize_t)(len - first));
+		KUNIT_EXPECT_EQ(test, iov_iter_count(&iter), 0UL);
+		KUNIT_EXPECT_EQ(test, c->skb->len, (unsigned int)len);
+		KUNIT_EXPECT_EQ(test, skb_shinfo(c->skb)->nr_frags, nr);
+		KUNIT_EXPECT_EQ(test, folio_ref_count(c->folio), (int)nr + 1);
+		KUNIT_ASSERT_EQ(test, skb_copy_bits(c->skb, 0, copy, len), 0);
+		KUNIT_EXPECT_MEMEQ(test, copy, data, len);
+		KUNIT_EXPECT_EQ(test, (__force u16)csum_fold(c->skb->csum),
+				(__force u16)csum_fold(csum_partial(data, len, 0)));
+		splice_basic_free_skb(c);
+		KUNIT_EXPECT_EQ(test, folio_ref_count(c->folio), 1);
+	}
+}
+
+static void skb_splice_basic_progress(struct kunit *test)
+{
+	unsigned int bvec;
+
+	for (bvec = 0; bvec < 2; bvec++) {
+		struct splice_basic *c = splice_basic_new(test);
+		void *bad = kunit_kmalloc(test, 16, GFP_KERNEL);
+		struct bio_vec bv[2];
+		struct iov_iter iter, expected;
+		struct kvec kv[2];
+		ssize_t ret = 0;
+
+		KUNIT_ASSERT_NOT_NULL(test, bad);
+		KUNIT_ASSERT_TRUE(test, PageSlab(virt_to_page(bad)));
+		bvec_set_page(&bv[0], &c->folio->page, PAGE_SIZE, 0);
+		splice_basic_iter(&iter, bv, kv, 1, bvec);
+		expected = iter;
+		KUNIT_EXPECT_EQ(test, skb_splice_from_iter(c->skb, &iter, 0), 0);
+		splice_basic_expect_iter(test, &iter, &expected);
+		KUNIT_EXPECT_EQ(test, c->skb->len, 0U);
+		KUNIT_EXPECT_EQ(test, folio_ref_count(c->folio), 1);
+
+		bvec_set_page(&bv[0], virt_to_page(bad), 16, offset_in_page(bad));
+		splice_basic_iter(&iter, bv, kv, 1, bvec);
+		expected = iter;
+		kunit_warning_suppress(test) {
+			ret = skb_splice_from_iter(c->skb, &iter, 16);
+		}
+		KUNIT_EXPECT_EQ(test, ret, (ssize_t)-EIO);
+		splice_basic_expect_iter(test, &iter, &expected);
+		KUNIT_ASSERT_EQ(test, skb_shinfo(c->skb)->nr_frags, 0);
+
+		bvec_set_page(&bv[0], &c->folio->page, PAGE_SIZE, 0);
+		bvec_set_page(&bv[1], virt_to_page(bad), 16, offset_in_page(bad));
+		splice_basic_iter(&iter, bv, kv, 2, bvec);
+		expected = iter;
+		iov_iter_advance(&expected, PAGE_SIZE);
+		kunit_warning_suppress(test) {
+			ret = skb_splice_from_iter(c->skb, &iter, PAGE_SIZE + 16);
+		}
+		KUNIT_EXPECT_EQ(test, ret, (ssize_t)PAGE_SIZE);
+		splice_basic_expect_iter(test, &iter, &expected);
+		KUNIT_EXPECT_EQ(test, c->skb->len, (unsigned int)PAGE_SIZE);
+		KUNIT_EXPECT_EQ(test, folio_ref_count(c->folio), 2);
+		splice_basic_free_skb(c);
+		KUNIT_EXPECT_EQ(test, folio_ref_count(c->folio), 1);
+	}
+}
+
 static struct kunit_case net_test_cases[] = {
+	KUNIT_CASE(skb_splice_basic_append),
+	KUNIT_CASE(skb_splice_basic_progress),
 	KUNIT_CASE_PARAM(gso_test_func, gso_test_gen_params),
 	KUNIT_CASE_PARAM(ip_tunnel_flags_test_run,
 			 ip_tunnel_flags_test_gen_params),
-- 
2.34.1

