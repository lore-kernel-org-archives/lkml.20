Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EADB18DF80
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084983; cv=none; b=qN3bOnEUwi+Ug635sVOFfIfPDvwi0xaD4IcfTf21g7JDQWTn0GIE8Ermf9z20bQtFobWlLEiA7EiqDTPcFfPVC9qkOHCbWU6bzf7RkWgDYf44u/UyIVCYSHwEHnFAe8hfXB9I7R9tA6pAMSMQFk/lSHff3K5DF2NdN/0VEXgBds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084983; c=relaxed/simple;
	bh=SWAGL7lM8I24FtiqpXQXmiG8vUnV2tw4e5EO6UChlqA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NSuuC88YClLdo/WusU82pk9GMhxRM/uzH0RLaWwtZZhT5btEp+iZtoJaB3ql4Vfg8cO70NEYEFYtaiV3pKm279hfcpih04N1ujuwr3AMmKYT72rlkMTAbiPKl462NMV9Eor2a6Rw2gr53lhSP9dCd66u1GFs36Z6hupS+Ksp0R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nES0LDUd; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nES0LDUd"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so485667a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789084981; x=1789689781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EITLWeZ7GjuPVw5EYfwz4r2cJ4cxz73RuGSjmckRlVk=;
        b=nES0LDUdcjqqewHLuVvR/5DicRrroMticiEpnCENave4JVO/Z7YJtdLAaWk1WN/tsD
         8KKlJ8esfRQaLwTtFu8L4/5CA4FgZVPgByzXMB2HXCfO6w1RlatySVBXJ5ghGvEK3Gpc
         aPJj4emg5bsUrSLae/16VzRhYmMYwBEULnVWaKHsXYyT3I9CTWQS0jeqmBYBNjLB4J/P
         ocCBKhjO5r4nLno4AOq1+VvQsiYK3I1AQSjxZo0PRPHC/eNDedu0lrlJK3DboxEVrZ99
         Pw+B55jszRKhReGNy7CcjenPKGlii7reEvcjau8gaK97IEC5715DM63Z09uSn/x2va4a
         iXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084981; x=1789689781;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EITLWeZ7GjuPVw5EYfwz4r2cJ4cxz73RuGSjmckRlVk=;
        b=X3dOsibPa9+JK8cCBbLu76XHyfQoomIFRbCROw6OHW/fY1ShWMqeHmeDnAeiSdAERi
         /bsd5fDKtjnQJ6B8IbISwivZqVhg3EOAem+2nlxOgb6IOLXFsJ3SuFOsWpPPDXAlHYEb
         C8ZVB1xRsrtsVCyDlM6XvSekYVk5Me1Pk+w/UH31o0cNcCbBD4yZgAnTV+nCsXlQ1RzI
         r5v995EBc0YijzWPC4HQUasDjjWY+1ON1Tygoh92X0Gi3meHgzKYfg1Yo5DeFj1ItMwZ
         0DMYPxv5ybnKBOdZreLcMggcphj3eSYEsaymYdCanrXlWr8kcrsoItgwWoNvMKktERbT
         a6ew==
X-Forwarded-Encrypted: i=1; AKwUvByJl6OjJUJWDFkaZW1nWO/m5Z15gWiWjO2WqzICmzZHBNANtfvFU3hHnP2WDly2cJ1CbhnbjogsBZYHKQw=@vger.kernel.org
X-Gm-Message-State: AFuF++lz8c+Hg85zoIBelQsb6tp7NmGommYFsvcUTtQcbhOaYpknTltZ
	Wv1rOjZ0f4l0JJVZMTFp/D5RL+XPiZxHstnBVV1yUusCNMo0Dx5PHLTlFhqpENabBnzDQgtygh7
	jgyLqR3xNcSulHQh3p7x8rQ==
X-Received: from pjot10.prod.google.com ([2002:a17:90a:950a:b0:39d:9b47:4551])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:ec8c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39d9bf0af3fmr2298476a91.11.1789084981361;
 Thu, 10 Sep 2026 17:03:01 -0700 (PDT)
Date: Fri, 11 Sep 2026 00:02:58 +0000
In-Reply-To: <20260910162411.d3bd211927c10e049c6652b8@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910162411.d3bd211927c10e049c6652b8@linux-foundation.org>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911000300.1052582-1-jthoughton@google.com>
Subject: Re: [PATCH v3 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
From: James Houghton <jthoughton@google.com>
To: akpm@linux-foundation.org
Cc: baohua@kernel.org, baolin.wang@linux.alibaba.com, david@kernel.org, 
	dev.jain@arm.com, hughd@google.com, jthoughton@google.com, kas@kernel.org, 
	lance.yang@linux.dev, liam@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, shy828301@gmail.com, usama.arif@linux.dev, 
	ziy@nvidia.com, zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 4:24=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
> Sashiko had a stupid niggle about the selftest change and made quite
> disturbing claims about the existing try_collapse_pte_mapped_thp() code:
>
>         https://sashiko.dev/#/patchset/20260910023411.514987-1-jthoughton=
@google.com

Thanks, it looks like the note it wrote about the selftest is genuine; it i=
s
okay for MADV_COLLAPSE to fail. So I shouldn't have changed uffd_test_skip(=
) to
uffd_test_fail().

Andrew, if you can, please add this diff as part of the patch to queue. (It=
's
a partial revert.) Or I could send the a new version of the patch as a repl=
y
to patch #2 email. Or a whole v4, whatever's easiest.

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/s=
elftests/mm/uffd-unit-tests.c
index 6f2360f9b75d..d8e40b770d88 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -639,7 +639,8 @@ static void uffd_minor_test_common(uffd_global_test_opt=
s_t *gopts, bool test_col
 		/* MADV_COLLAPSE should succeed with userfaultfd unregistered. */
 		if (madvise(gopts->area_dst_alias, gopts->nr_pages * gopts->page_size,
 			    MADV_COLLAPSE)) {
-			uffd_test_fail("MADV_COLLAPSE failed");
+			/* It's fine to fail for this one... */
+			uffd_test_skip("MADV_COLLAPSE failed");
 			return;
 		}
=20

With respect to the note about try_collapse_pte_mapped_thp() breaking POSIX
SIGBUS semantics, it definitely seems plausible. I'll look into it.

> I'll queue the series for test-n-review.

Thanks!
