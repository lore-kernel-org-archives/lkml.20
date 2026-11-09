Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187390;
	b=Z3fNk9EJ9noW3pyr8t99yBASaPpBp1/pXBp6px8hJ1W744dN5iYMd9MJWBlngX82a3ZS
	 6pNaZ4NmKmULBzxxLSxjvLcs4soqq0Tx7/X0Tr9BfqxDIn/2F4BsqXMKXWYLqrNQzEqrd
	 m98nRxN0cJBQT74susuxJaLgmLrJnN99NJE1+/cVz3GQ0bocYuYPbedHwBeqJM4W+Kgs2
	 wm0CZNNfsVcZw5lxvK9KDViswYLAvKdCn1/hkNTAU2dhXX9WhabH5uVkbaC35Va4XqF9W
	 7L2ArOh8xaV9+V8E+E+GhMet3Ag/Y0ZQ98HVpHsi1yWfK05ToW8iJVPsQZqYVJWB9AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
	b=yp3nweygwmU3stMydaOGuB/AAuNk+mxzWf624Gf4ZPJXTflTOycSQo+cFwb/Ixd9JKpU
	 GpNBkYq92scoAjU+3Jq8lcjCQQDLEV74ExdW9sP/FDbzVNYO4KCBLNlXMLghmQ2vBwYgu
	 sRdtxtIyNEZC3njnqnyoV7IIZOeWIS9hBSEqjDI2TKGq9BoX2G/nlceTvgTVY+jn6rAJ7
	 wLt81DSf3tE8ykjyTQ/49jD2a1+D4dBLyehF2YVcfi6KHJQIaXwnkaJML/ROlOByFM2+Y
	 P5F3x4uZxMxpQJCg45/vH24+giwcdd7Zzu2GegwfA7n1e7qetLUd/vRBu6JHDP2plgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8YvaNYB;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD55606CCFC
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD55606CCFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8YvaNYB
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so837997eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187389; x=1794792189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
        b=y8YvaNYB3OxVaJ9hMq/KOa6Yw5s0K1WQp1FrX4v8U+wWxjTtHHKf6FfFW4IpimQbOQ
         gleXCx5Wgw188412YGJOc8KDRIOEFz2f4sYuhHpkypqD7KNaB+VaJ4aeBXfuaaasfx4E
         c3kwZ6wiu9o6K7KFb/B53Hae0+1vjxJoxviR82Eh4F7osMDv0M44eKvSO3Y9WgOjUbf7
         xn0viNKqIf0j4aWDXYWGUEi0hDRBZ+dEd1KR6Z8yc8HeMChsNXYwuuV6Q1YvxJLEdTnV
         2LnMPwB3sUowjvHqsCuqEpCVLMTlx2rBYnNu6opuH/FVY9IqcxKsPOgcA04rlhZ1nRaP
         GtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187389; x=1794792189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
        b=ckNDjk20G1Z+SGdeV040Bv4a0EFl3f0oNdze0csw84aZhJJfpj4tsGfGKGhDr9BUDS
         gwpsfCam+N2Qpz500kYZmbiDGgt64tJWYgE4mNUAAOYCdJIUO8V8QMBvec38a3ctbitV
         1GtiymvrMvk7jU+T1D3hIGxkWwYBezdfoNLBx2eS/zVpgkF9e5rULlS3IVosXV6qgw2g
         JcFqErgS785N891cu8DLcBNe+abAhOVD6M3SXj6IkEezAS+yNDq5UfaCvcugCwS9WBbc
         MXB3MNoPE2ELxRTYZB1DfVQKe4ILkVqKTWbDX4r2W4yRNVmdVFiffUl52UB2kh4OHOXP
         rSjg==
X-Forwarded-Encrypted: i=1; AL+hErHUj8cyKcXFjTFTynCOHUFu132AjlqNDamRnuEQx0AFf8Wk1mwPkljW32/LycYnUHZypn7OwbXQyyO6wHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bWw1yA4i6ycsU/LAeV0nz/fW/D8XeUfMRn7wlBBHJIEbbX+dX
	uHl1mJs+XMxDWRke1z9XlgzI/cd2RQLNMb8O/3EK0DWKUhHSclua4hNH
X-Gm-Gg: AYBFou3HC+cmvovjYyg9P68W54nGEPTHlEXnKVQrb37YJkmxlGC7wshjQEZPjBB2NLl
	yOgy3YALI4cvbjdBPuHmsy+JjZDgjGWNgqdZI583SIXshgnWYLPRYPeALdWTswt/4fVGgEedJoN
	k5noiEGvqqXyocfTJykJ0DEVmGAnY8+fuzIcGQwiRj/+6f9AGLpogdyUAEQRZ1KuVBNXZBaKb6T
	TuRHfHaL0bB4q2XI1FMB81+oX8B752RfM5kTntL5JTu6zgeZJXSvlE2fT2S8yKKuHea7kEHcvI1
	EsDPBvQeOqfjlppr0pK/eorXQJlQGzd2gYA2Xg/S7O+SVsh09PIMiCEelXM7tdB0TGqf/0kHlNy
	NeJYhQYKBSIHq219aLQ+bf+gaCWATBy0rY5qgmaZWcIOi6f6HVVKjAoAHqWCrqVAQlOohvHDR43
	0LiijkW0eP3nYCH8lv666PECTpcudY1ZVozGg58+3P7KMX2YaUkSFeMfb5RPONNaULU0LEyVfJw
	AendwpHtn7k1hBm3bYRwu6v1Mz2Pafd6E3VUkI9L27VPNIAuuFcjeH7BQSY9xuEOxnRfbAxqhJf
	mk2m75rZDqbILDsQ+NRPuUqa
X-Received: by 2002:a05:7022:2209:b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b39ff060a8mr6502765c88.40.1794187389081;
        Sun, 08 Nov 2026 17:23:09 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:08 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:51 -0500
Subject: [PATCH v4 2/5] docs/mm: ksm: describe how smart scan picks the
 scans to skip
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-2-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Documentation/mm/ksm.rst covers the stable tree and its reverse mapping,
and Documentation/admin-guide/mm/ksm.rst only says that smart scan skips
pages KSM has failed to merge before.

Neither says how often an unmerged page is looked at, or that the scans
are picked by the global scan number so that identical pages of
different ages still meet in some scan, which merging through the
unstable tree depends on.

Add a section on smart scan that describes both.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/mm/ksm.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
index 5a80573162def..f954d221e8017 100644
--- a/Documentation/mm/ksm.rst
+++ b/Documentation/mm/ksm.rst
@@ -75,6 +75,22 @@ The whole list of stable_node "dups" linked in the stable_node
 The frequency of such scans is defined by
 ``stable_node_chains_prune_millisecs`` sysfs tunable.
 
+Smart scan
+----------
+With ``smart_scan`` enabled, ksmd skips pages that it has already tried
+to merge without success. The ``age`` of a page's ksm_rmap_item counts
+the scans that went by while the page stayed unmerged. A page younger
+than three scans is looked at on every scan; after that it is looked at
+every second scan up to an age of five, every fourth scan up to an age
+of eight, and every eighth scan from then on.
+
+The scans that look at a page are picked by the global scan number
+``ksm_scan.seqnr``, not counted per page. The unstable tree is rebuilt
+on every scan, so two identical pages can only be merged in a scan that
+looks at both. As the periods are powers of two, every page is looked
+at on each scan whose number is a multiple of eight, so two identical
+pages meet at least every eighth scan whatever their ages.
+
 Reference
 ---------
 .. kernel-doc:: mm/ksm.c

-- 
2.43.0

