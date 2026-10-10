Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C0E485944
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633939; cv=none; b=t4vAIs+A/tOkvM6h6ohI38gVpOQe03fOW0rbt2SHLU6STN38TSB2wpczp5pu/N+o38daw6dFy1EyXijB8iUumfYjaBZmgVBRtsqCpy4ZciBAB71IuRwPtVwRRAKyZYLYNvmeKmagGo4UGdwkd5StD6QfQLW/NZSNPJLNOT8a7jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633939; c=relaxed/simple;
	bh=NhU5jgmcvMXag+1LZIKhrLyXbOwnznMb5BiggGYZrHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=gUDmnQsZeDsEjOoJp0+he8rvfT7VRi49Tm+02kpyiNEHXkhFFtdPYIxI7y0usFBBSPYBHMLSkVC4NlT/H9Q4Gl7E2vAMVAbTfJGNFNtafQh7FsiyyUac4yBxHg+ERisD7hyK1vkKw06VpxRyrcw1kJHy4XkAGrTRX3r1Fa1zXvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnqGdrnD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnqGdrnD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so2016515e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633935; x=1792238735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDEA6vjah9q6WFHrSqFGiZ6d9YIFPeL6k7zSaUFmLVI=;
        b=bnqGdrnD80j71kaEgpZgFe7Yu0mkaTODiSMunlRgRBpEi1DLHw+31lW4kljTej4Fb/
         kV/OWKKuI0uGQbPAHs4+p68Cu6tsjYjDfDvfYuQmsWUJCAOcCbPxJHIMTEHOF9+DtSTe
         twvNr6HgpmoX0Xkncpcdq+bF4WBnu7oS9ROR9g5JlRRMyJj2YkdW9j759HteQm/89nRP
         Dol81SMYdwSqCm6/0s1ghNawibA59iIWDvBD92A8LWmAi4AXphcp/tPV58GJS0zPLM+8
         hS0f9WAS1Nt8pdAz23yznLbxYqI1zABap5xUO+WtpRdZ6JgpuxBZp95BQh3qtwtASf62
         881w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633935; x=1792238735;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iDEA6vjah9q6WFHrSqFGiZ6d9YIFPeL6k7zSaUFmLVI=;
        b=HIsQb++nIsUFarQqyXai34Cabr3BlCfUtWms3V6KqAqM8fwJlVI1czz9s76LK4UbwO
         jTW6ZT0n+uCdGCaQ/MxSYLsMoNnSc5tXSxtnJFIXZzrRG3gkbt4lD+OJA0thOSzdscFw
         ZiKPZaFcLGQVR035JyW6yD9cCS6lRreAqYmOamsfagelqSQgqmiuz/SS1n8z9Jut6VAN
         OmoEQviL+E+L7Ce5jF7W7W2UCtMgHy/l0BjCyUKN9Kp9kvOJggZ1QKOUhbD6msGq6MpK
         IXtuA9g6bjLG133g2jRqMKktUJ6nddVnLPcTeVl11C6JEmkZdVJkZOLXh3mJEfopNErt
         zP/Q==
X-Forwarded-Encrypted: i=1; AKwUvByjzb2/AkF8pS9eb+sC7YAlaN6ij5vZeAAHChDGhBeonogvU+zahX9pjhltNZv79bTwnzA23pZC48HuHHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRjXHJtype64s0lkT1k15RjJnsK/N4tW+XCK9Baxbil3ZkN7bM
	F2ogXeGTkwiusu3rHj3hYriETp6UuFzytnExkRX5rlE0prRHXehJGY/M
X-Gm-Gg: AYBFou0j4M4WhQKooqn9bU0C37D7sSp/Y4srvvjW9uDGUrvbOqRszCzJhQ1v7vpT+vG
	7KWl1MmZuyVVnzSpE8Rlazbg6rfvwfibDsZUfs1shOWvQnsuEYJiEKB5u3SDA5eZsEA1zQPKpgs
	pegizz4K1Rz6Kr84rDR2hR3kxgF7iN4FI3gyCEzRpynKdedmyOCsxFXCVH2ClJNKms9f02by9SS
	cYGtWuzdCLVQ9fV7gyG0aEZKO8F6hzjY8SgIeJ+RuliuCGRYbpa41AFjcxy7f2w6jOkjLrRKBjv
	v9sM3ltvBXhE5mwzeAg8NvYUBWqW4M8X1ShG6+UBn6dDQRdbHD2NJyTffNlR1brRthdHeE5i0KF
	BTt4mXHz//zcUnWscL4nqrk46QTkuT1jo/PuOOBsT/jtjyzLLt4e3JfEAAZzZ95RUF1c5813sJt
	kFOV34HABsS9CeI3frG2Hk0qSkklndlhfZ6ejMHSS36BTqAvVbabkKFAkkh5K+/nlOI618EaoG+
	MrzdBrSmvZIx3mzRAk67Oe774DhM/eczRzMPlaInaxySdVvfObV8yPF2pkdKm2kzvcpv5Eg9Xoo
	459ErvfUT4pJT5zyBjzNSdpjFfWqVL8ZEs4pHNH0FF7fBgfGxHyeCLwkOnwRalGvbEfnECGSSUM
	=
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a18e4f56bcmr93767975e9.33.1791633934396;
        Sat, 10 Oct 2026 05:05:34 -0700 (PDT)
Received: from imx93-evk.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm9457467f8f.9.2026.10.10.05.05.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 05:05:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mukul Sikka <mukul.sikka@broadcom.com>,
	Keerthana K <keerthana.kalyanasundaram@broadcom.com>,
	Stefano Brivio <sbrivio@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	Bin Lan <lanbincn@139.com>,
	XiaoHua Wang <561399680@139.com>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6.y v2] netfilter: nft_set_pipapo: restore cloned mapping table memcg accounting
Date: Sat, 10 Oct 2026 14:05:28 +0200
Message-Id: <20261010120528.4604-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 6.6.y backport of commit 69e687cea79f
("netfilter: nf_tables: missing objects with no memcg accounting")
changed the pipapo_clone() mapping-table allocation to
GFP_KERNEL_ACCOUNT.

The later stable backport of commit 07ace0bbe03b ("netfilter:
nft_set_pipapo: do not rely on ZERO_SIZE_PTR") rewrote this allocation
and changed the flag back to GFP_KERNEL. Upstream applied the
ZERO_SIZE_PTR change before the memcg accounting change and retains
GFP_KERNEL_ACCOUNT after both.

nft_pipapo_deactivate() clones a populated set before looking up an
element to delete. If the element is absent, priv->dirty remains false
and the clone is retained. Its mapping tables therefore remain allocated
without being charged to the requesting memory cgroup.

Restore GFP_KERNEL_ACCOUNT for the cloned mapping table.

Fixes: 32bad10de347 ("netfilter: nft_set_pipapo: do not rely on ZERO_SIZE_PTR")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Split the combined 6.1.y/6.6.y submission into one email per branch.
- Keep only the Fixes tag for this branch.
- Refresh the diff against 6.6.158; the code change is unchanged.
- Add fresh build, runtime and matched A/B results for this branch.

Original submission:
https://lore.kernel.org/r/20260831194905.45045-1-kmehltretter@gmail.com/

Testing on 6.6.158: built a minimal x86_64 kernel with GCC 15.2.0
and booted it in QEMU with CONFIG_MEMCG=y. A 64-element two-field
interval set passed creation, lookup, update, rollback, deletion, flush
and reuse checks.

Matched unpatched and patched boots used the same kernel configuration
and initramfs. During a normal update from a memory cgroup, both cloned
mapping-table allocations (512 bytes each) had accounted=false without
the patch. With the patch, both used GFP_KERNEL_ACCOUNT and had
accounted=true. Both variants passed normal set operations without
kernel warnings.

Earlier A/B testing on 6.1.186 and 6.6.155 measured 524,288 additional
charged bytes for the cloned mapping tables of a 32,768-element two-field
set. An unmodified 6.12.107 control already accounted that allocation.

 net/netfilter/nft_set_pipapo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nft_set_pipapo.c b/net/netfilter/nft_set_pipapo.c
index 7c8d28a031ad..4c3bb5d61a3b 100644
--- a/net/netfilter/nft_set_pipapo.c
+++ b/net/netfilter/nft_set_pipapo.c
@@ -1465,7 +1465,7 @@ static struct nft_pipapo_match *pipapo_clone(struct nft_pipapo_match *old)
 				goto out_mt;
 
 			dst->mt = kvmalloc_array(src->rules, sizeof(*src->mt),
-						 GFP_KERNEL);
+						 GFP_KERNEL_ACCOUNT);
 			if (!dst->mt)
 				goto out_mt;
 
