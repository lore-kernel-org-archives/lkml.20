Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433152;
	b=MovomhlEfCW8tpJ040fPBZLuOlCdwKazg8eKMLBUaB0bZVDIrBxB/zWpfVy9gvDazTCj
	 rFCgEgczKC9XsWHs/xsCOgWfzPqzS7gJmV9eGNxTDN2Ds3IFgEHCuW0kOFvXfu2kPcb8F
	 3bYYQ1kUJEOgV6izKgV4ZPEXQD8u8m6SdJZ8JdKNUq0VMcK0ayMe29SFSDb3BKShUfqiZ
	 SRVRRD0nagYKLTZmekwJcWH3hHDgZEQRc6fL7dQr9T3E+qT4f1avnOcNQ9NFTxvxSbkLq
	 bldbvOvZj/WvFjOWTNGMo+NkO2jeHmy6xDDrgOGtd+PbLl01mpOYKxok1RwMgJJF36A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433152;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wF8cBfLv4u/gZN9n5zVEi4UN2ZycxBhED8nkeUPM2N4=;
	b=VbknzI3Q1iOGUuuA18pqm41KzTolmUpECkOce1Bx3raat98SK7VRu9hHd1MOL1kFCJ9a
	 zMCA5IdA/vimWRYfK1nrSqPCN1EcGzoCZpKtHNrXEet492p1r3MqgZ13y+fy1qn2yE7iK
	 NjhEd2N8EkuhDoA2GXQfOK1Tu3tNo81JjQ4oh8yuFhaCyBoAHhrbfbpfp68mYKz82QW2T
	 X+SWt+yk9gJnk1rX1AMSuCVZp/D9MGznPoE0hVnXHv6Mv4cYDiWEBCfQgBIVO1x9E++cu
	 dTmvWaUKRT6ef1ipik8B0tH0Puu99fdGf7+wESz9bF+yBYgiBD1zRZlUEa5iYAJh6tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OVQ3FPgc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5F9606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OVQ3FPgc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CA41F000C1;
	Sat, 31 Oct 2026 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433151;
	bh=wF8cBfLv4u/gZN9n5zVEi4UN2ZycxBhED8nkeUPM2N4=;
	h=From:Subject:Date:To:Cc;
	b=OVQ3FPgcIAVNixleVtqdfoFQfLXOIP8avWlK3YkNUDew2KnzliatCHrK//H+Z9Lk6
	 0pfdM7YjLjz1tYjPB3MNauhPmrBc3T/vmIPUSPKgTWvCifIqc8bphSxCpgV/mpwo9L
	 v14RcJurF2BJyG7KWtOsPsjQiEc2ZX4On5+i6h2RQDwq+7OThbtXUwKZzFUBBxjL19
	 faAmYo5G+i+vOSRuShxcayQr9sLxtsNk5LHdUyz8F1DOsThtGVRhXqkKPuCYHZU5rj
	 M80Gr+csE7zz7sDkkHDF1bEO4lz5I9WVc26aN46VOf3KKEmimS41M/lyqE8DpbRGjR
	 l9238d7u0CCug==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH 0/3] x86: Make processor vendor selection available without
 EXPERT
Date: Sat, 31 Oct 2026 08:51:48 +0100
Message-Id: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OUQ6CMBAFr0L220Zo1USuYkhTyoJrpMXdYkgId
 7eKn5NM3rwVBJlQoC5WYHyTUAwZqkMB/u7CgIq6zKBLfalKU6qJo0eRyFbwiT5ZEhtisi5YXCb
 kZHt0aWZUp97oa2fOGr2BvDcx9rT8WrdmZ5nbR974Bv4G42vOJ9KuQesElY/jSKkuItNA4Tg6S
 cjQbNsHOVsq6r4AAAA=
X-Change-ID: 20261030-processor_select_is_not_an_expert_feature-4f329d352ec3
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=hJdF+ifA8Wjkpeme51cB077KY7rxNx/H4H9mwFdXxno=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFlP51m9f724XbbxYUQmd5lOoNgHp04FhUd9vjaC39XOX
 zS+/+x7x0QWBjEuBksxRZZl5ZzcCh2F3mGH/lrCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 QIaOEQMXpwBMdXYEw//ovWvu3QqRnOiha7PvcM6VLL3FpbMMRHz2/Qie/OfPwh9ujAx7na663BV
 86Kyb7CCfzGJwbjb7F7k3z+yeFiRPkis5lM8LAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

Restricting a kernel build to a known CPU vendor currently requires
enabling EXPERT.

Make PROCESSOR_SELECT available without EXPERT. It remains disabled by
default, preserving support for all applicable CPU vendors in existing
configurations.

This allows someone to deselect the irrelevant CPU vendors when building
a kernel for a specific machine without having to navigate in the EXPERT
menu option. Doing that reduces the questions asked when doing a

  make oldconfig

during a kernel update.

This also simplifies kernel trimming when building for a given
machine. In comparison to an x86_64 defconfig, the final vmlinux.o
image size decreases by 0.35% for an Intel-only configuration and by
8.88% for an AMD-only one.

In addition to the above, several CPU-specific options lack proper
dependencies and remain available when support for their processor
vendor has been disabled.

The first two patches fix the missing CPU_SUP_* dependencies by
properly gating features that would otherwise be useless without that
specific CPU vendor support, namely:

  - Intel and Zhaoxin machine-check extensions
  - legacy AMD NUMA detection

The third and final patch is the main change and removes the EXPERT
dependency from PROCESSOR_SELECT.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Vincent Mailhol (3):
      x86/mce: Add CPU_SUP_* dependencies for Intel/Zhaoxin MCE features
      x86/numa: Add CPU_SUP_AMD dependency for legacy AMD NUMA
      x86/cpu: don't gate PROCESSOR_SELECT with EXPERT

 arch/x86/Kconfig     |  4 ++--
 arch/x86/Kconfig.cpu | 22 +++++-----------------
 2 files changed, 7 insertions(+), 19 deletions(-)
---
base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
change-id: 20261030-processor_select_is_not_an_expert_feature-4f329d352ec3

Best regards,
--  
Vincent Mailhol <mailhol@kernel.org>

