Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C0D49BD8A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306659; cv=none; b=NO+y2x/zgkch76xNPi0p/RPbXVfLjC81r8l5NfNl7BwbA8kFXKbFEGjDiZwsXujr9VioOtRuLshKCyXnPZMI+SOKr0dylHAUhbUgjTLsJxZrEI4vykHLgHLIT6wbwCY+8bqCrs7gQIFPMvQzEz/RQnS5c8Yqr2MrrR/ZMVPq5bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306659; c=relaxed/simple;
	bh=YQ50butHh0in7r+TRzz+4pIBFjn39KwhiYH1RxMiXWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNdbR3EemrD+NEMqe9TVcPnNBUEQN2dyETBeT2yYVVumXU+4xQ8T+GrDXTZh2V5pSKkJKmumgraibFwwbrNflSdLnLNW+jh0ZGzsxM/vXix4fYjZeKP9tYsTBoBeH6IaHHUy3UVcOCPgzxCTWIbBGxJUHyoB3Us/xckG8QS6MmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=EkKyVHWL; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="EkKyVHWL"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917866225aaso12728926d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306656; x=1791911456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjIQJmVhnnc4JEVUqtlMdFZejCmrpUXoYlA59SZs6m0=;
        b=EkKyVHWL2g7+jWt5yB+WapFq+pVizIJfCcqI1I6D+b8NKTMViKhThslE9Ea9OqiLDN
         9GSA7VffHWCAd5em6k3LvTFE0d8Arz/UvrEKaBAUik67n/sldipe9LNof/0MDut+H1vc
         Q2KslbKDlvQLwSAYlf+cpab6uwIfBsXG4g73rYjfDa3eNr/fEAqUew3rxvalrTpiQQf/
         p9MZyz2mPmn7LSGeniFy+AliJ3mF0S3DVn/JwGiBCr2PLzpbd/oaGZ8SQKIQYmYjaFYy
         V8ItYAvp6ZTldAywFwAgq0aTtN6D29O7XmM+Dg3QbdTBIByUS6cBH9YIH/3ix4A27fvj
         2G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306656; x=1791911456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjIQJmVhnnc4JEVUqtlMdFZejCmrpUXoYlA59SZs6m0=;
        b=OuZX7SikEi3AeCe413+MnYKyxNUkI6L4Xtihdhuowaz5smOFENA+18/0qteP9daOOC
         EVIHFAcb+cVy0poiYMWQMCT8HoO5hMToSaOfP7dosHXIk+zdaVIlroeshvXAUdc0WGcr
         vOpFHFDMhfwGZ1rc560jfMk0c+JV9/2sfA64NErC3T10QG5/w1HxAZmUk9lHx8fSukjQ
         jrQSo77rLzYLn35WYoroVEpdQm5md7Yx/UWXfGyEOoGQw1ybr8BDGVels/moRY45iz0m
         5LZSVRpEjGjJjiPtwkeqtrUmZ5qBPF3VkT0eYxaSaB4Gqc6k0fh5fwxYq4escX1ie6bJ
         rKbg==
X-Forwarded-Encrypted: i=1; AKwUvByi/EZwVjD0LqtCsVRiLsP8l+TND6J2eOaHYwuUC03ktnxr5TRD52PFDeAR/05sPU4YsTwwotDeXX4dr4w=@vger.kernel.org
X-Gm-Message-State: AFuF++ltJPNB3C08rNlfGRpmVVMjGjaQ5x7q/o+laphm0pvUk4c2xU2b
	j+XqiKrgZP3ZyYN9+ZTvPkfapHwrAf/8hs1fEIhVUBtLTapdJi3PD3m0O5wDCIxVJMw=
X-Gm-Gg: AYBFou1VTsO2LhiTmmDCnYq7qyw1NjzUqhhaGDAQ7FeFZCBY0O28xrFb2i35U+ny0ag
	1FuWWwl82qYFL5putk/jItZfNTQWOxYvuH4MYT/W7+t8WMfB0Nm46lmeOdCHEHcZR1XHk1fXvOf
	lHcpfn4nC68yjDyBDeu4E6v0HBc+qC2f91C/yzDTR+AoyacAw0u8pyHz0iFQfTMjSQDTSXxn0YJ
	VRlkDXf3Ky1KiKv6vw+Zbh8kgLO28CNC5merHuyNlT5d6MK5zAUWP5rFk3OCxQKfWN1MTT/bNij
	7GKd7G+F9AjFBVZ9HONlKZEQ5K7hA7MU+UeWxAAauhmAOAS+Wr2HtIYOjxdaTJeoFAz1fuXDajT
	9P6r3G0u2rHaZ4Uu/kzEMW9dwS3bStwrR/1aI7b7pKD9ro4zP4Fh4jXWYdmyBBnXd53Gb37Sr7W
	jsFkcVKnKRCkgQ0W0gTtJIYPZYMKsC7BCRQAngVVX98kL7rlA/lLmPnE+4SxPdyEnziQ13n24Wi
	JA1rtLnFx1DRT4=
X-Received: by 2002:a05:620a:2947:b0:93b:d7a0:d9e3 with SMTP id af79cd13be357-93e8f53852cmr405007885a.61.1791306651621;
        Tue, 06 Oct 2026 10:10:51 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b690f3sm117037806d6.24.2026.10.06.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:10:50 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 06 Oct 2026 17:10:22 +0000
Subject: [PATCH net-next 7/9] net: skbuff: don't BUG() on leftover length
 in skb_copy_and_csum_bits()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-skbuff-bug-on-v1-7-1b4434c5357c@toxicpanda.com>
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, Mina Almasry <almasrymina@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791306633; l=1558;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=YQ50butHh0in7r+TRzz+4pIBFjn39KwhiYH1RxMiXWY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ9gfSvJiWs9uWxS8HbhLveAUX65vUd2iG8R0qZJ2bMPItlfPjuGBWyF44xyBKoelu4XtnTNXUJ
 VzXnDkBVCygs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

skb_copy_and_csum_bits() has the same check as skb_checksum(): it BUG()s
if it runs out of skb before it runs out of @len.  This one gets hit:
commit 7d63b6712538 ("icmp: guard against too small mtu") and commit
f99cd56230f5 ("net: Remove acked SYN flag from packet in the transmit
queue correctly") each fixed a crash here from icmp_glue_bits().

It can't just return, though.  Its callers copy into a buffer that is
about to go out on the wire, an ICMP error quoting the offending packet
for example, so bailing out early would send whatever was left in the
rest of that buffer.

Warn once, zero the part of the buffer we didn't fill and return 0.  As
with skb_checksum(), the checksum is wrong and the packet gets dropped
by whoever receives it.  @len is an int, so only zero when it is
positive; a negative @len from a broken caller must not turn into a
huge memset().

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index c8c2c0319b87..e29eda2eaf3f 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3709,7 +3709,12 @@ __wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 		}
 		start = end;
 	}
-	BUG_ON(len);
+	if (WARN_ON_ONCE(len)) {
+		/* Don't hand the caller a buffer with stale bytes in it. */
+		if (len > 0)
+			memset(to, 0, len);
+		return 0;
+	}
 	return csum;
 }
 EXPORT_SYMBOL(skb_copy_and_csum_bits);

-- 
2.55.0

