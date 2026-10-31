Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793454914;
	b=ARxk7xIgBLpFjed1i9hk1EXWXe5jjVi/ZiDIlazngF8o9U1QnbYq55CTajaFy/gXrwUN
	 fKwUvJqw/cCiNLMI90T2IzQ6M9LgWP9aUH/QlJmWHOFzvJmpUnCUqEvlBMYZamW5emSfB
	 W5TdCTniKTEduxvLGRtZb4cpkV7zVyn5S+IgEHNwKH4NE/JQ7MpfJEfX8SYPnTdDhvcw9
	 MHS+nGskJcyCjK4PD+CNZBK/zKE5JadBcWtQD86prQDQw/jzKrb5icEJTAC7EONXIvUNX
	 mTphGTtjy8kZW987Zf7dzf/lzZruKEOPhhUGXo+x8hT8COQCiw/76V9IVVX5zwFFBBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I5rTYNBg93GkPQ/X9Ob6AKqCVrWqJmhPtELY2wGwpi4=;
	b=CHZhM9KOZyCz0UVARRQJZ4b6tUxcImU2BZWChdh0+TkpWw5kGfYtTK3NqsqEP0uU+zUH
	 keNAeC9NId9WPtgnKfPfl60SEbc3v1cbMkBw9jIp02YewFh36N9OS8hUtT25Y6maHCG5K
	 pl1vyVeB7SAcmtAKN1MW0QQnoyu+Viir7noESJOEefg9tzYVz9yW/Tv3jOFplxnksW9ti
	 PBlvjtcc26G+ijCOhMrC2hek7ZG3GW1iqkOva+HQXws4JD67mSeqhrvtBiQOI+hQgiz/b
	 H0Nphkx1Ka4z+xtcXorLNBXXgumxAh0BL2m4Z7pTCCRadk490rGD3WlBcXExEzfpujA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f23wbY4k;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BA5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BA5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f23wbY4k
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so14118855e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454912; x=1794059712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5rTYNBg93GkPQ/X9Ob6AKqCVrWqJmhPtELY2wGwpi4=;
        b=f23wbY4keoCO9zYlfq3ODDxwGb3Hk56Gk8HgCOL85UBleWSX19SXotJ7naulbjN9i4
         UZoPttZ4QaxMzdhiQCBadU4Nff2TlnMxs0Sp/4J7BsM8kjpkVvv0rKNVO0pQ6JMO+3EV
         V4/tCriCORcwPmT1UOENDOKDWrGjcmI4eDh9RUVl7L2awK/S0Bz2kbMQSzW6Fj7+P/LV
         GtsLePbyCaR0McSEijrkr5RurWtXZi7HWws4H+w8DoqH5ZhLoK6Pf42Ij3PgLXVy/kzI
         0RKGWdr3/ibnCikozIaiXFjGgf0wJ7abn3uToUHuZOOfsrR5SXsl5S8xFz9XS0YV/pYI
         0K5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454912; x=1794059712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5rTYNBg93GkPQ/X9Ob6AKqCVrWqJmhPtELY2wGwpi4=;
        b=h3gyegI1BF2LQC87AlvyHBlkmrQ2/ITOgswZbLvW9slvzN5yt0CqTPbjkcMU6G0vuM
         9KPbtbsNLE/K6iqGbirg3BYJs6gj5UGOtKjb4uOpl1OAoaHzuFHf+y7DwQGylwRW631s
         RDO/UNKfZHWWIvPg+v/bUMQq14n28eyU+AiwnBGkeGgRDtgD6TqFJxHzPDg0ZA419lum
         3kg0janyyBLDgphzbcRchNfezVMIA59ZPoDZ4e61pq2m+uSa22ySTO2B814zlG+KU2Mv
         SJTZDxwimqiZryoO2Do/1q1UueZ9ptFcLoIEQvXluOAxJJR1wR0k3QkzDIr+lOMDM8Ex
         vMLA==
X-Forwarded-Encrypted: i=1; AKwUvBxEnWSvvVFSAJOP2Wmnwq1OvegogKevAg1Lt1HSIn9acOhNp3gB2ON1NGML1idRYznVOEXFBZFC+x/KcM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSZEmMS6zLnB4F0q5EO6G9K+7EEVt7IAaC83U16BAv5FZQr0CP
	SQmk3FVuGv0RPJQNBDx1HgjdlWzJCHQ4lWcTJK/ksEOJ/73DNHBtGLBm
X-Gm-Gg: AYBFou3Ipi9qE38uQ1VivL7qRtQR+If8LzKr948HVb4E6gdHugF/1HHH9ZWINe/c2MJ
	C9CdKU1kGkxtnoN87S91zeeqJZ/CFnFN/HjP0vSFQ7k9WLOjQLWBHlg0bCN4iEm5QF/YEgaNCIK
	+026fnLEqDIEg2li8in8l8xRYHQ0PmSNVTRzo/qnAvoHNkpQnUqYLm62ZwFh/2Ilq92EsImpFER
	s2fvPSbodK4E1aoI+55K41t93JkxEa8YtT9vnZMO997jBp9iGK2uXKTZmYv/93gh9DzHx/H/njA
	6VjGdM0jBy1+CkvOkZfvagUPQSZHABX+HaDZ/+szcSqZngoBYbPGOIbX0zhwX6bfD15wqV8F8Do
	S31azfC8yPc3jIxYN5JiDMfXnnP36OFgGVtdjXjD6sm0YtZ3qbKgNtZyKWBHW52P2QSxHW0eCXB
	XMOF0k9NoWe98NRAMY1uQaTBLbJNs6pqd3vU5gAguoxtq+0D+bdC7cb0BaGenz2o+SAq4tkHK0+
	kWFtiwrVQBywHjzRkQRIXL6IJrFeZqoyPtNqwPpeLd0zQtIoHtT20CUziR7g1KjfKeU2CbLAMhK
	Xu5CptVoM2lDOFzjYrRr1pRl+E0GZYVXhNEqOp9x3gT/
X-Received: by 2002:a05:600c:4687:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4ac16fa4dadmr119482965e9.7.1793454911802;
        Sat, 31 Oct 2026 06:55:11 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm226304455e9.13.2026.10.31.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:55:11 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	kerneljasonxing@gmail.com,
	almasrymina@google.com,
	josef@toxicpanda.com,
	jiayuan.chen@linux.dev,
	toke@toke.dk,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH net] net: parse the eighth nested VLAN tag
Date: Sat, 31 Oct 2026 15:55:08 +0200
Message-ID: <20261031135507.3970551-2-thnkslprpt@gmail.com>
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

__vlan_get_protocol_offset() starts with VLAN_MAX_DEPTH (8) but
pre-decrements parse_depth before checking it. This rejects the eighth
VLAN header and returns protocol 0 instead of the encapsulated EtherType.

Check the counter before decrementing it, allowing eight nested tags
while continuing to reject a ninth. A compiled source-extracted test of
the helper and its public inline wrapper reproduces the incorrect result
for eight tags and verifies the corrected result. Seven-tag, nine-tag,
and truncated-header controls are unchanged.

Fixes: 469aceddfa3e ("vlan: consolidate VLAN parsing code and limit max parsing depth")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 net/core/skbuff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f676411724..b10ce1d46674 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7703,7 +7703,7 @@ struct vlan_type_depth __vlan_get_protocol_offset(const struct sk_buff *skb,
 
 		vh = skb_header_pointer(skb, mac_offset + vlan_depth,
 					sizeof(vhdr), &vhdr);
-		if (unlikely(!vh || !--parse_depth))
+		if (unlikely(!vh || !parse_depth--))
 			return (struct vlan_type_depth) { 0 };
 
 		type = vh->h_vlan_encapsulated_proto;

base-commit: cb284914e749388eef402938bdb3115fe1f6d337
-- 
2.43.0

