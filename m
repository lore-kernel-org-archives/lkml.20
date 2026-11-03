Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705844;
	b=m4DvDB8S1RF9pMoMFS9AvxDpbtaq3V5Z4uc4PTyhh6vjuwxansTPQ9WWxU25O14DrPG9
	 fsN6aTsFrAP9/ekhsmkaSmjKIqzRXAN7I1VCqBj39omBOqQxScL+a6eWCK0uHeucfx2j8
	 /AAgHMiWFVeHs+/O3o0x9IAJu91BsA313ba3NTrWU56LwUlvx8k0hxpKh1cinLP/nErys
	 VzkiOdZ1lIsGRrB1ky8LInQFCmkl1MslfRwwVPrCwthaYG+LZoJaiFGEuOaUZfKhmYORe
	 edbaLf2rAnbIPX/S4i6fHpi9eR4KPJ3Ml6CnEvtxOSw7xShPmsimADr+MtuW3wahlOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0bwrQXRz1nV2S/H83UR+VWVa5zJUqJhABatAjcFjujw=;
	b=VInqrkm991C9S5VocB1n3zFrxDRkRLUGMyRnTgu0scxRsaWzAWgSBGdLYLWHbnKjONhB
	 /yifWCtjA3C9PKj5T5/UY1PKYSu//OBKYla8aPAwQuF1PbCIBK8pLiOqZk10eYfL+lIj/
	 6MLPGcvInRAwt1Rd23ZXa3/NUVZo7ADiRrRld8/jcOhlhI1aVgXWpexsJnh//A9lYC357
	 TlX/xtFl8f4AVfiKKcggfwvM8jQrXN7LYH5uXbqi7hhks2+g8WQfsf1xT+pMPu2h09KiI
	 Jj3XdOBbhrQiIokF42arjaTwiMWKsaPTGRIwaQ57INEob2vYFPsS5gA79YGRBIlqr2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Op1fG3nb;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0F6082BC0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB0F6082BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Op1fG3nb
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso45470935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793705842; x=1794310642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bwrQXRz1nV2S/H83UR+VWVa5zJUqJhABatAjcFjujw=;
        b=Op1fG3nbG/RdYrz9q5mhMvv1lShzStkFtX9ySl30ncpCUWzvrwAc2vodSKoukMeDX0
         rBH0VPll5+OIEbLOkYAupsayDFJ0cNZRURefAPC3UdkqVsY4RaUqRhnfbz6S8WhyKqeO
         Q+YQM4SONCXqQruwrARZ094Dot/WVIe4bxgzFJI2OmRJSDbRg34N+512RnMYiwELgjpj
         Ki/t1yy0CSlMnHvF3mSXImL3SYXzxOLq4V76yG52EtEy15tHfGu6AUJIe84jB4NUQlgm
         8f6iTzSHXAhLzW7Z2F1sugQe2UJIfY/SX7bqqp/SLk6NSpuhWXiw0+Gln5IS++mWv0Uz
         ZPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705842; x=1794310642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0bwrQXRz1nV2S/H83UR+VWVa5zJUqJhABatAjcFjujw=;
        b=G+ue/c33B3lR09LeFA1g4XFk+xdnWOUQ/hePk6F8LEovTQ30l69BPZF8EoyXvKC1t8
         oldHqeF4cBcwxtHl+X71pXl1o3AAnipf3yJu9v1rGdICe5SW7YsxxnNGB/YVS49rR6SS
         vih+D5ACW1V8TVhywNTDLcn9EwYtuSTMWg9qcMjZx25oJnAiuruXKtbW8lUlHQlVF/ba
         6VHUTXGW82El4JLcGX33Xr2FV+YXHwT/Svr+2GFIS2RZVazSYfdlvT+De1nRl9ptg3lu
         8FgrIhQ9XF1H/yYmYaSXzxagLye9UotNyAsW9n2u5yczd+Uuqa4c83U57b11suEalXAa
         pjjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjjuqU8I28xndX6WXuthFVmimVEpaJHqZT5wVVYd4MQrBU0+9o/KSCTXpDvWpyAwWJ5icBWlw31KWNvHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1P8HXT5WWdygDFr+8ZUH5EtULGFeytyizporzffvLmqkm+Nza
	a18Z5Qu7KmPRLQ2HGRsyDf5bevIHlVH0x6D7Mq7y7f+ac4nNwyjK683ESlvKbbS/Kn//cn1t7N1
	Ngoc0M3I=
X-Gm-Gg: AYBFou1d6fJSbQQG9bOOlpRNPevbk+Pqa7tHYkGA3rC1iplbwZO7esDWWygNuk95j/P
	uNZZN16QGYPickXc5jxBQzVWrFtdt2BwrT/HDKIr2RY70FPlX4sUzw361y69ohA5OVzZwjNQPLM
	HFbv/UnhI6AcAftq5HWlovuYNkLq49BFZtZg6IdIi+hjymUsIh7lkYRR3ghJbl3zDPJgNgNgtUF
	vlVcfF8vQHASiAUU6OB/gGuqwTDrf88ZWCROFSRp06xji+b3kbwPlIUYWV97iu2MwKkvP3k2JUh
	1cgpe+X/okkUZxkY/LNIHBJ0iq0nXpD/5UVltFEnsIPXIbwP0xQlibpm3sDdiq3CKLC7qWYwo9H
	Olohp7ur/K67xTELroPtBQ7Dj+O2bgdklX/yjn8DWCllOo0BoKWOsc8zCICLlaMruyqIYd/da1/
	hP4LNLKz44posxYaIojP3XQz9vVuCBFQG2xh8mTF0wWZcjEEc1cn9u2ETBdJ+WxBqvi/7PMcf4e
	AotW4BllznSbKAGWUd1R31/tYGeaam7zPkiXlvTrhwrJw/v2L5MEoM9R+uc7L+eKxbjXiyJo7XS
	x1PkuZSRXI6EOpgRsI+Q0KuR+91cPc6gtCxlz7Mii4rkJBzEh2igsOl9HesIPR6WkRcQhmRkerE
	jxxTKFRCS+g8P6b4MsMRojQIsEcZ9QA==
X-Received: by 2002:a05:600c:a00d:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4ac185bc336mr278107635e9.18.1793705842252;
        Tue, 03 Nov 2026 03:37:22 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm23000997f8f.28.2026.11.03.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:37:21 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 1/5] include/linux/rculist_nulls: add hlist_nulls_add_behind_rcu()
Date: Tue,  3 Nov 2026 12:37:06 +0100
Message-ID: <20261103113711.1832834-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103113711.1832834-1-max.kellermann@ionos.com>
References: <20261103113711.1832834-1-max.kellermann@ionos.com>
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

Move some code from hlist_nulls_add_tail_rcu() to the new function
hlist_nulls_add_behind_rcu() for callers that already know the last
node of an `hlist_nulls` list, to allow constant-time appends.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/rculist_nulls.h | 36 +++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
index a97c3bcb1656..054e477dd093 100644
--- a/include/linux/rculist_nulls.h
+++ b/include/linux/rculist_nulls.h
@@ -115,6 +115,33 @@ static inline void hlist_nulls_add_head_rcu(struct hlist_nulls_node *n,
 		WRITE_ONCE(first->pprev, &n->next);
 }
 
+/**
+ * hlist_nulls_add_behind_rcu - append after the last list entry
+ * @n: the new element to add to the hash list.
+ * @last: the last element in the list.
+ *
+ * Adds the specified element after @last while permitting racing RCU
+ * traversals.  @last must be the last list entry, with its next
+ * pointer holding the terminating nulls marker.
+ *
+ * The caller must take whatever precautions are necessary
+ * (such as holding appropriate locks) to avoid racing
+ * with another list-mutation primitive, such as hlist_nulls_add_head_rcu()
+ * or hlist_nulls_del_rcu(), running on this same list.
+ * However, it is perfectly legal to run concurrently with
+ * the _rcu list-traversal primitives, such as
+ * hlist_nulls_for_each_entry_rcu(), used to prevent memory-consistency
+ * problems on Alpha CPUs.  Regardless of the type of CPU, the
+ * list-traversal primitive must be guarded by rcu_read_lock().
+ */
+static inline void hlist_nulls_add_behind_rcu(struct hlist_nulls_node *n,
+					      struct hlist_nulls_node *last)
+{
+	WRITE_ONCE(n->next, last->next);
+	WRITE_ONCE(n->pprev, &last->next);
+	rcu_assign_pointer(hlist_nulls_next_rcu(last), n);
+}
+
 /**
  * hlist_nulls_add_tail_rcu
  * @n: the element to add to the hash list.
@@ -143,13 +170,10 @@ static inline void hlist_nulls_add_tail_rcu(struct hlist_nulls_node *n,
 	for (i = h->first; !is_a_nulls(i); i = i->next)
 		last = i;
 
-	if (last) {
-		WRITE_ONCE(n->next, last->next);
-		WRITE_ONCE(n->pprev, &last->next);
-		rcu_assign_pointer(hlist_nulls_next_rcu(last), n);
-	} else {
+	if (last)
+		hlist_nulls_add_behind_rcu(n, last);
+	else
 		hlist_nulls_add_head_rcu(n, h);
-	}
 }
 
 /* after that hlist_nulls_del will work */
-- 
2.53.0

