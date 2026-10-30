Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334153;
	b=LJ7F53as1uZ1gcTx5MRU8OjR6OWuJOimI9FsodfkDtriAZxfac4TBCPfSib23nkT6adz
	 U2VF4kVJB/NPtCZtm20LPPePE71KPyqEpk+UjutQyjgNxXIqIRRW8MBYdhnGZuPNF2Qp3
	 UH/I+XdjUR/ke1ZOqpAQReY+u9N/v9ld6SdNkLWM9IWVU7T37V8YXqymyYPm4B0NA0qLB
	 o061aewS7YNn4JgS5RpNiKAbQLDsdEZfvMwAUWA3ulyos/gX5vOYYFOF3GT5Se9LLlyYl
	 MuPgneR7a6Bmdits18SbA8KKIy9lyFy4IE3q1LNgHI4r+jBfJj5pq2iEX0A0HQ6SX9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UIEkXZc77VKDSaNSSEztds7G46tOfShqTeBK0tv5jNo=;
	b=JQC9wJd4dc9NxAGsRQqEGAfWjs5z9uQrxaH0jxWlnsG4mPbrSQwc0bOTTIsl4SZGYNXf
	 Oy9lMfe+tuPf3e/G9K5fKIjEGR5wBIOw151TZwwkyqMF4A80W6mYB7SUJkqsqrzr5W+Zg
	 BaXoRPUmmP9SEatH4HNRHGe1d4CUMJl5MDaroIv9YhdNH6TTR/RyMgYx5KQIhSJydVKxC
	 CD0c/IXbJJx/NUxhvs5kt91mFPDkKQdI+y71CWxkaZDMXJZz3WWB8g36MsSBibq7kzTWz
	 mqllBEuEGcth3ZAE3zwxSNHrKPlKU7ep2h5SRDmL7CiavouAOA2NcOOw/RDPgQlk8KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Eg1lDcJl;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BBC606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BBC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Eg1lDcJl
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-845788309b4so206150a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334151; x=1793938951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UIEkXZc77VKDSaNSSEztds7G46tOfShqTeBK0tv5jNo=;
        b=Eg1lDcJlw04NV3IH/2Tl3IMynXUL1pmXUgDAtba7icKcUjOSnAsniK+cEQpWm6iZrw
         C0WcQkcKN2RGuCvTXhgNDciVIKg52lM0bDGRwZtuBXRgujm0MfRilzW71qln5am6AnGd
         JtPjIG8I0imy4vxFGyBMFoIKd4mRvK6wExzy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334151; x=1793938951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIEkXZc77VKDSaNSSEztds7G46tOfShqTeBK0tv5jNo=;
        b=ESrPe0gJLq1aMUdhGdLfTKWEmhMavoDgvu6iRXvY4ku++1CrVU+TF+ArXtzN9U2PH1
         VBiB9FXafD27QSovJ0PagkxgOY7zNNBwE+zvE8FIxw0mfFKFW3NZTKgWWLRYlMeGCnF/
         YWRwD+1uOIQ7m1niIkVH6TK5nfTelEcdy2pvS3P0nR6tMisn0Karcl785ykLY1anTu7T
         35exWMKp2uikbCTXO8hYsF9883jlYCSlYxMGgqdp94MyacaamfTWSB0IjfSugyBlEckp
         yeHilYZkiNYN66SBvFrJea1g9Xa1sz56Og6ByB9JtdVGx9zxx3SJDbja5VLcS6jjfm/N
         F/iA==
X-Forwarded-Encrypted: i=1; AKwUvBwmDy5zmG/8tW8QgL2YpFGikszsihuqIeTzX6XbaAtAV9pDdUtXIeFDllfwsZEPYvuiEygsgPR6l0OL+HM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5ZoubSAcqvaIoxulk+oYOAQQ5JQq1TupSKgD47wo4tX7UGL3+
	XGPNTBlFks/+0XY1h8izYEB1rhM6Ik0dn9TYuDoTo8MR3ihSt9L7H626O7eWqrERzJ8=
X-Gm-Gg: AYBFou1ZNWxfQSafCrPoHwyOYM48K1vckXC5E5dRQXNn96t4vW8i9yyAEtPoyyIPhZ7
	f/1+eGpXuRT4pqZuGQ08Oq174LeluOkWtJoDEjyt3qMptpWTFNhkTfZtKwBX/RcjyHxn23gXJvN
	4RoLmGpd7dcLBJcgze0TGeEwX27/f2e31yjY4tedCKVjtNTW6joOWMxDehxkezmEawzL/D0DVao
	FeLAyphhT1vVBn01t3L7fOgTHHf4jb5LBXnXVnktr7bwCNCW2oLUwY4w7wvt+Du3r9NDdMG1ge+
	5Ddjxa3p6CW3hGXAkQ2YG3PkZG8E7GGdm5m7whz99G6szKOPr6dfvJe4kJX6QP2SUP2ffmCO7eU
	Hq+GrdYcShzeGe2IojfOztUEbYvZwOw1yRsLnKk+h4sPm6S4majC4MASYTsD5unsPEiRpQtAesQ
	NWeFrasF45z0FXYuQg32b8s9SRLCKk0GhKfAv5Rficj4kjuk2kLCAZja+fKP69BEOm11cTsz03U
	o8BTpykbMg/HXW91hZh/NG0LooiOj1BbehulNuyN/lPDkVOgLechEUzmqj6bF71yk2TGFaxL0Y1
	aP5Smv1oslYRLnKdO5vrlGvB992cVkx5FBra9nFxsxSSFyzCNstoY6IZTIJsVoHQvA/T9MmTbPN
	xvVgEKtWugkVCwrKZUtPrcYPifEPFiQ==
X-Received: by 2002:a05:6830:2e10:b0:822:978:f7bd with SMTP id 46e09a7af769-85d36639c20mr971906a34.28.1793334151292;
        Thu, 29 Oct 2026 21:22:31 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d351e77c8sm1160788a34.2.2026.10.29.21.22.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:22:31 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] ipv4: keep XFRM headers out of corked skb lengths
Date: Thu, 29 Oct 2026 21:22:29 -0700
Message-ID: <20261030042229.74068-1-kylebot@openai.com>
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

__ip_append_data() allocates space for dst.header_len in the first skb,
but includes that space in skb->len until __ip_make_skb() pulls it.
Fragment accounting uses an MTU that already excludes the XFRM headers.
As a result, the next skb can have a fraggap larger than its capped
datalen, and skb_copy_and_csum_bits() can overwrite its shared info.

For example, five AH tunnel states can reserve 500 bytes while leaving
an effective MTU of 348. With 40 bytes of IPv4 options, the second skb
has room for 288 bytes of fragment data but receives a 500-byte gap
copy. The overwritten shared info is subsequently consumed by the skb
release paths.

Reserve the XFRM headers together with the link-layer headroom instead.
This keeps skb->len, the gap-copy offsets and the trim lengths relative
to the IPv4 packet throughout corking. The network and transport header
addresses and the headroom available to XFRM at output are unchanged.
Both paged and linear allocations, including subsequent corked appends,
use the corrected accounting.

Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/ipv4/ip_output.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 3396f177a18d..d42d776af273 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -1150,16 +1150,16 @@ static int __ip_append_data(struct sock *sk,
 			 */
 			skb->ip_summed = csummode;
 			skb->csum = 0;
-			skb_reserve(skb, hh_len);
+			skb_reserve(skb, hh_len + exthdrlen);
 
 			/*
 			 *	Find where to start putting bytes.
 			 */
-			data = skb_put(skb, fraglen + exthdrlen - pagedlen);
-			skb_set_network_header(skb, exthdrlen);
+			data = skb_put(skb, fraglen - pagedlen);
+			skb_reset_network_header(skb);
 			skb->transport_header = (skb->network_header +
 						 fragheaderlen);
-			data += fragheaderlen + exthdrlen;
+			data += fragheaderlen;
 
 			if (fraggap) {
 				skb->csum = skb_copy_and_csum_bits(

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
