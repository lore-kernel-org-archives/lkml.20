Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501090;
	b=XLzGtgGf613PWIkhEanYfirDhdYgHm7FIT7TVI8KzyIsBkW4nLqzLX0+ESq3PE/B+Pdf
	 Ewn1Do+MsNxKHQ68i8sdidWtn2gl/bPchJlB6RnjktQ8FfsQ1suTCg2knyyFn4VK+hymk
	 R2Tcp2ebBs5KNUA0KfLMgWFGaXWgour7kNgkLDuTLLKiu0zW4Suz0AyEG7RhKiIqX0Fb/
	 RRexb4iDWeZYo2b/2Z5D1rBkvG0uypMLI5FLnvmgwzSix+Nycm8RIthK1fdqykEkAJhLf
	 tYWsr05Wnup3JUqevAHdFGU+R26fkEFSRdDd4OwSBh9q/1sxbyQ+6ZhabetL23/XHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501090;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=N+5/e7wKS+w4rQGtxPh5BDwGwy7/rxTNAhdttx5efNk=;
	b=n3YYXxY3CpDKkgEka7fBEMZ3jEXNA2aE1NwnI5vqBX1Ib/m154iyFp+nLu5tF/JYA7+S
	 mlZPAWsI7Fx7dAGKFWQTyOWqzu61J3+lm9sThB0JS5lYCkEFvfGHOO8reevk0HoZ2rO74
	 V/cp26dqws4RrNt2pFdbNnS3Gz8CXpImzA1T13apwDQRnReamIJS3PxdGm0iFnNJA9eDo
	 0F5MjHhdPNr07sxTb2qGaqEXBbCegkRANuhjB108RkQpFIW7YzPG5twlktbw12151W26f
	 OwP8gK7GGeMj56vBDaOoZTCCrGeYWYjhG6oGjfpgCNfmJn8+m1AgMRi5GQMjabpNUjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLVqzH2d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C36606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLVqzH2d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0F41F000C4;
	Thu, 12 Nov 2026 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501090;
	bh=N+5/e7wKS+w4rQGtxPh5BDwGwy7/rxTNAhdttx5efNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VLVqzH2d4HUxLyrxvIELxzVyZJ2Ox12/Aar7P7zNM8qgYIEqCRv6+y2I2SsLyhtOQ
	 zU6wymrYcA6GPYIHDq5S3nf+RDCP6w568XV0LELp55OWFROUfqjRAwjrQZUGtGmI3k
	 69F2dU0ZLYIsFiN5pCe0FAgCnWQVd1Vo9pDVGfF6WNSwrATcc2qz1KrZqnEyTWR9M7
	 jIZz1UDtJZNZfeB0H8rSv4OPY+JkG8+0Pg3xV2CevhY3kzl+rKjr1My6Ci5YTTlwxj
	 leme4YKsX5wdpMJmhtAOUBi1Mv4X8tqxb8F66qg+8FlR+GdCzJ10rhMot0ixmN+ouq
	 YvtxdRBKeR3yg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:09 +0200
Subject: [PATCH 4/9] x86/mm/pat: don't BUG() on inconsistent page count
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
Message-Id: <20261112-fixes-x86-v1-4-791adb8d6670@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

If a step of __change_page_attr_set_clr() covers more pages than remain
in the range, or no pages at all, that's a bug in CPA, but it does not
justify crashing the kernel.

Warn and fail the request instead.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index aa7052d247e60..a1bea16a3c3bb 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2101,7 +2101,10 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary)
 		 * CPA operation. Either a large page has been
 		 * preserved or a single page update happened.
 		 */
-		BUG_ON(cpa->numpages > rempages || !cpa->numpages);
+		if (WARN_ON_ONCE(cpa->numpages > rempages || !cpa->numpages)) {
+			ret = -EINVAL;
+			goto out;
+		}
 		rempages -= cpa->numpages;
 		cpa->curpage += cpa->numpages;
 	}

-- 
2.53.0

