Received: from outbound.pv.icloud.com (pv-2001j-snip4-1.eps.apple.com [57.103.64.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306833E348
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915629; cv=none; b=os2qyPVVNMvPWGRXhrSO2Pv7oKQc3z7abF3tTsQUX/hCmF9FohuK1g3xj5DzRnM8YJEXlwXWj+D1Fuv1eTRdzeTgPEcxnYwOMzMRuNIYy+hSxEgqVZArQ2nyleOKROumbT2L7rIYiS6AbBV5ITjgjxmdiuMPGn6hIydattOVxM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915629; c=relaxed/simple;
	bh=9QI8/6eDLyBcGPBNmX7kguyI2uiQ4PHzLcxMB/ujd4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZtQeuJcwyb4yM0Ke9HbPZiEoGD7mZt7lpRfpvTNhDAEkeQYl1qlGfluGEK29aSSyp8zXRLpvD8tbCd2I1Hn4mJDeMaEjIQoYXO30qvSs6FHydpOcQv571wFP5XfCacBZllTsFWuVUqh75l9pgmGGf+CGnovzzL9wisFAYWWOJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=B9Z8hwmp; arc=none smtp.client-ip=57.103.64.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="B9Z8hwmp"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-20-percent-0 (Postfix) with ESMTPS id 7C5BA18001B6;
	Sun, 20 Sep 2026 14:47:02 +0000 (UTC)
X-ICL-RepId: 01a0bf48-ec0a-7a7f-a463-1916823a79c0
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhKB0MGWQReCEsEQwFbEhVdRUkERxtXAlQXXQZSEnIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXwZLWhVVFw4CQh9QH0wWV0NHHRwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoCURxWDVdDVARfUFQRV1ALWQJCD0gKXwdaBkQPTARDA1gBQwpVAkBNAkIAXApeAlkAVwl5EVABWB5WXloXXlMXH0sAXEVaDlsERxQ=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789915625; x=1792507625; bh=09jiLbzpb1veArtuXhL84Hxo7NJy/m+yRETm/PTbJXM=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=B9Z8hwmp9+SQ7EaHjGu4O3EE4TOO56BGpkmOlXmH8xPLmgxy9uPR2l3S4tbtpkkzle5PetrDmfi1gcFLkcvKx3xTfHXbj9E7GWe6EgbONyuGb/QOKw4N/i8pfNM2GzNui+qEET3o1jAR9ppf+jRVdHs5Cxun+RwFCBFZrG62ZJx2m6EtmcoTG5iEC1vbs3I2lpVAMn1lBJ31V04GdCWjj+7bC7mhcc0s//rLPb7K3joWZjsjkKzI4m1vtaN6PfiPBNAUZC6V3BZUVpL/5rW7AETjcGJs5LUJ5xafiGz2INhwvq6rXDcFH9V5G5+U3P39/5XD9qXAjE1IkpbC6bBwpA==
Received: from BRUZZHANG-MC1.tencent.com (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-20-percent-0 (Postfix) with ESMTPSA id 695811800207;
	Sun, 20 Sep 2026 14:46:56 +0000 (UTC)
From: Zhang Peng <zippermonkey@icloud.com>
To: Barry Song <baohua@kernel.org>
Cc: Zhang Peng <zippermonkey@icloud.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Kairui Song <kasong@tencent.com>,
	Zhang Peng <bruzzhang@tencent.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] mm/vmscan: extract pageout_one() from shrink_folio_list()
Date: Sun, 20 Sep 2026 22:46:46 +0800
Message-ID: <20260920144647.43333-1-zippermonkey@icloud.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To:  <CAGsJ_4zOfR3Rn5tk_RcOWUDmREO1JyRwXA15Vr3aeUs=+ybMMA@mail.gmail.com>
References: <20260720-batch-tlb-flush-v5-0-db943a0d0d6b@icloud.com> <20260720-batch-tlb-flush-v5-3-db943a0d0d6b@icloud.com> <CAGsJ_4zOfR3Rn5tk_RcOWUDmREO1JyRwXA15Vr3aeUs=+ybMMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fy9rEMDQMrPKHRWHN-6yUqk-6O7WW-7b
X-Proofpoint-ORIG-GUID: fy9rEMDQMrPKHRWHN-6yUqk-6O7WW-7b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxNSBTYWx0ZWRfX8gI4cbZRMWuI
 KcCjj6CThf8vLJmvMDeWXV/ybMzoNi96Ux+hL+qNHgUTCKLL1tuYe/jr55yOHUqBYAzGeV1YlAi
 VW316FN6iHrDMhFSuO44EyXS90cSq1Ck+RWOkaRLL5BCTDHAx0gs1EQsPhXzg0ZhekbUUsv0nEa
 UWdT592jHkFC2V9nosNzFLaeHPxqTFd7zRg4KtWmPUDjol+ICw9Oc3tbJc/Z8oH36STkA9fCycP
 3pPD1xR3vZ5CvdhwSlmHwdCiG3dKc38li0j/hfWjgWfm2kpHQD1ALeV2Eap3LnibDpE/rNqP+T2
 toJ/6S26n2AyFXK0Mq0UShDf0CFZNPWr2sMPr184Vsrvo3Gbfmn3yy/6elfkM0=
X-Authority-Info-Out: v=2.4 cv=RrvI7SmK c=1 sm=1 tr=0 ts=6aaff1e8
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=v3ZZPjhaAAAA:8 a=_kJJyzcaNiJmjTfxGhgA:9 a=QEXdDO2ut3YA:10
 a=J82S1U87d15UFHHUFZS8:22 a=kKg27zqgtulLWh45kPDF:22
X-JNJ: AAAAAAAB1nRey5oJZ5F0KLj/9N0cLRbSJoEF39yyVxr75/6La6rO40JosQD394aQDfSDJ3l3H/mMOBI3LcEcOFejkhBB4zmEoHX7h34F5la8K45IEG6slCWkklQn3s2PDsYCWIW7poavcSrlgLg3Qgo56AL7xmyCV1dmh9W4ELAPgNpG7pvKQ3FaZeSvPiyMEaZ39D+9lKRLhbpBgqKvHV0+15SOFVS5Te+QOxHuOwhGiLbUtcsLpIJL8UB+J61U/k1EN+54kIAvmZ+wS0RxAChmpYxRrSphfkYlStZg1vfCvAbyycRP7P0R0UYoe2acnhn66iQprqMOmDoSM4pmW0N4yXWq6pwUbsW9OJf2qcvxVqgpooWj8+5Sjrx/mD0HNbW345EFkeek72TzVBAk9w3WWXrHMq5H4ApY6BghjdJOpJ813aRo9o6gDKMNJ8Qpw4DP6KjmodQuLCoN7SnFbdJLXSbdjl2ldeKjJd+8rdkJMrYYxM4hnXRYlSbco3GqfTIxGy4LCfY3DPo3XEPpnHfNzpq8QQCUfq7sEfJPPZtWjVMfbEEC/DHmGGR+iwTc9zt44ht9IXIYo1RCtrX0WoRTXxdLjWz8cn/uuBix4HL1BMjtoxPjGTs3HwCA9kwj5K4hzym5rtmf27RE0QsyNDvAXNVMcZ69BPoyhHQeCYw+A5qTWzgaxePZa5ZSLyhaCLdPBadPGt6HqHO8R2DzRLyjN4a49VoAyAwQZxbifELRt5Rrk00hkM6yy8ob6JMHlcYKOP3C/RBdOdSXqysvRjDB7mBY97CFhJglm3Sinr+qdh2SUxsEGaH+XYQP++u9jDHCZ5JPw/Y1vdKgAuphOqxjEhR96Y9LAAfsGUjobBGUDuEt7q/qI0rTf9F6utbk9Xu0uSyFdxuEAX9ZdULfT9NU9MryhF1JrFR2zGR8AgX1NJ3DXagRrgs/XVrVxItF+TcIuqPALFX7sKxov3IkLkZB6bta+vN
 gmf0hbLDOrb+dcB6NJVQESsPHmhSSvERtls2lwTlqzkJLMy1by4aoxi2RASv4uXNLZ8RrI/BlnMaW8O0bonKhc9UiF+cnez6pPR13TORw+CqIBr6hM62/ig3KzjPLDYkri1KIaUy3jTwC7fp2WpwNdINj2RH69ZBSqQNlMlqKA4RE1KsXjiP/B+DZBkFeeg2EsunPMoW5hFUtjP6u1BcNExnwGHTXmO7B43UXBfH4lfa/zB5dOPZ4P4zq3wPFCPJENg2nPedFQh6IWz0BQqM5uOw5JJdfo7y8dmPFPsEwdbGo17ih/5z25s6hBpX4HxP0yp86S65SG9FwzK4HlY2TsLUZr/dM6Q+KhO3mmTFTIb0iR/MDpuiSPD15qWw9XKbFsxgxFFikXHBEQRkGKC+fp0CoXNjl5PkuhuTuNfWXu7qrL9x1k+1OyJ1Zw7hSgbpHGpbCKMKtC5uRr4Tdd6tCCu4i24GoOypYNci3E/eylVjTAHKsrGpq1BNLkbxqalwwwAJ3ERs/RFukvNgiZlRpjIM=

[Resending this one on its own - my first attempt accidentally sent
all four replies concatenated into a single mail, see
https://lore.kernel.org/all/20260920143816.39827-1-zippermonkey@icloud.com/
Sorry for the noise.]

On Fri, Aug 14, 2026 at 5:49 AM Barry Song <baohua@kernel.org> wrote:
>
> Also, this patch looks basically good, just like the previous one.
> Could we also avoid hiding the activation semantics in the inner
> function? It would be clearer to make the activation semantics
> explicit at the outer level, so readers don't have to dig into a
> deep internal function to realize that a folio may take the
> activation path.
>
> In LRU, we have two distinct possibilities: activate a folio or just
> keep it. This is an important semantic distinction in the LRU logic.
> Hiding the activation decision so deep in an inner function makes
> that semantic much less obvious.

Done, same treatment as 2/5 - the helper reports the decision and the
caller acts on it:

	enum folio_pageout_result {
		FOLIO_PAGEOUT_KEEP_LOCKED,
		FOLIO_PAGEOUT_KEEP_UNLOCKED,
		FOLIO_PAGEOUT_ACTIVATE,
		FOLIO_PAGEOUT_FREE,	/* folio is locked, hand it to
					   folio_try_reclaim_free() */
	};

	switch (folio_try_pageout(folio, sc, &ctx, folio_list)) {
	case FOLIO_PAGEOUT_ACTIVATE:
		goto activate_locked;
	case FOLIO_PAGEOUT_KEEP_LOCKED:
		goto keep_locked;
	case FOLIO_PAGEOUT_KEEP_UNLOCKED:
		goto keep;
	case FOLIO_PAGEOUT_FREE:
		break;	/* folio is locked; try to free it below */
	}

Two things beyond what you asked for, both because pageout() has more
outcomes than the freeing path does:

 - "keep" is split into KEEP_LOCKED and KEEP_UNLOCKED. pageout() can
   return with the folio either still locked or already unlocked, and
   previously the caller had to know which internal branch it came
   from to pick between the keep_locked and keep labels. Now the
   result says so.

 - FOLIO_PAGEOUT_FREE keeps the "and now try to free it" step at the
   outer level too, instead of chaining into folio_try_reclaim_free()
   from inside folio_try_pageout().

This patch is in the cleanup-only series, see my reply on 5/5.

Thanks
Zhang Peng
