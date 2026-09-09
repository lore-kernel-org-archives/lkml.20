Received: from mail-qv2-f9.google.com (mail-qv2-f9.google.com [74.125.230.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7C654529B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967421; cv=pass; b=YAU/eldFg2o48XlO2SOF2xLvGZA2PsTrKYFvIkXvJP9mzdpQX7cX7vvhUqSYMRbkzbvgYnT4uKIOrubjEdtFgxYg9mw/cKOho0WAy9a6JqERZ2WSE8l1hV0DbRGk8A56wcqSK9X27KtVXgNAP8YV8q+6i6u+22omQ09DlTuIoHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967421; c=relaxed/simple;
	bh=SA7Td8hb85CBy8oraWrnruNca4awi7kqVSAb++Vl8NQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bj0YJH3bi1r7XKFMEbf+LeYzwGCY5IgK7F+QWeGB07XdRWS6LN69axvjtS0PPtX6lABnz5u+RximzfiipUM8vwras/Lkx8Tx6WG9goNjv/VsTXY28mmlG0DY/4+SR063BVjxpPkQC/mU9GqTNVlZxA0TMJZuSWTw/XXrh8/B34c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjmMQURa; arc=pass smtp.client-ip=74.125.230.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjmMQURa"
Received: by mail-qv2-f9.google.com with SMTP id 6a1803df08f44-91069003fafso1353026d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967419; cv=none;
        d=google.com; s=arc-20260327;
        b=EEaMjtq9LKmau6d5l9KXYYFn4rwvIQqE8wZUUUHDV519WYnFaP37HhACByGUNL9g5/
         XP5eP2YhxwwMmCb/tadb+m/fSKx4woj1kil0F5j0IO6oZZpXkM5fcu+3cQyQiVwAx3rF
         651vSLCnZI84ERQOc6OoN+iFwmRs9GBCqNSvinTKHzjX95Jl93N+6i96UUh/AmBfe18F
         IfQBtqLiX6jUckNLAm7ctdn6X+z63DnFnOU6XGqIl6HBbvre2s20+ZbW4Vy9veIu3Rfs
         QexgJ3iIiwDs5yS7aJuATwvFny/s0PufceF2Xa4yo6YeQAEctI6jOMmANIIfxeNcc+XZ
         JujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=a49SZDeZdDlL0wb0CKipnoebXvB1XQTCDMiFWh6kHAw=;
        fh=Z86jGU2Jb2MsCFv0zf8MRS2sYeQmvIPgHXNZE4Azlek=;
        b=ixsM0UsDXmHbJpTf411zEJpGDaG9AGr6EU0bPNBPHG96KEzZ+LH5Zh3FNkQnKp9FkT
         0qQ1XG9f2LKNoFtvDlbAySn9OEZ+Xx3hmuAZRpU2jVpYh2mtwipZG2OZPwmH6XY4JY3T
         7GsOL9mXTo5f/ILJMUVqh/w+pDRRhp8dcvC7CLYu08uM25L6KKuJTt2f5mOgZVyxNuWf
         YaNQOWrSKlAT0wkDiwYmsSYMY6PbitcgBZH6UkQtUXzuoqSx9TaRGG64RT/l1TlhuGGI
         F01rwwz9KJ5hCRAbvBlvl8UZF9VuZMRTA3vznVSPxzaSSHIsNWqmk3GjeoDKuhTQXYIp
         SM1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967419; x=1789572219; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a49SZDeZdDlL0wb0CKipnoebXvB1XQTCDMiFWh6kHAw=;
        b=KjmMQURaBLdIXkU6eMbqlqE6ZhoI092ewwf0QRO9UNzaGu9NIqO0edyXm+s8exGNZ1
         I3Z3HNhondVcGQSYhz1ifBSsNus+dOi8T7u24tKp+MBWzDRTnsUZWL1eJh39ZSgWjBph
         o3lEZyZu2PzikwWd36U1t1iiBS4RB3vWPKJFFqbkWdtVrdEhCfWfSW5hV7YJgaj6Rat0
         z94B6DIo1d9Dwb9c4P55mjOuQN3zyKiXilyuJO6awkqRpqCwobkh8XMz35qQsX0/6FqV
         xTSUulUvajXrzqOpXnz/jW50i5DEMozkgZbW4THA9tRd1DcAOhkPhSaTH2XkNwKeNBr2
         JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967419; x=1789572219;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a49SZDeZdDlL0wb0CKipnoebXvB1XQTCDMiFWh6kHAw=;
        b=pelrKEmbfBw9XlmR9D7QIi9COwOnnkCzh6zTuEk0pVZ1X6b4sZzBoGbpW7iLnakCz8
         12T0dhYIPbcQ7w0Q3r6SfAiw7ukomc79FIlZl/QyE1yrgaic2W3+fcaqCgY80Oya8DJh
         2ope8O7UhWz8Y7RSLKvxa3gBiAW7EV0tvLj+ab2TzsISCz+UkjCW+uRVsM9771BCO5bj
         /UschFCKeiqlGlqP4Zb27OPuKVCMxkUbMvOQeuC7gfmMx0arACyo4Kpc1k4GiTAYvcIQ
         fDd/ngI8AT1YE8rleG9beCT8GRLD/pAX/dwGYD7st/TocSujOKbSLxXUpJr9upBw4nje
         m7NQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4faifTTsboQul+AiBnMAJrQanC1VJtiC4dQOSYljgUI/pDrP60MdCQhQRLnVWTvPPEAMctO9l/gZn+Y4=@vger.kernel.org
X-Gm-Message-State: AFuF++mWmLqBiRRPj38yzcRfz+D9voSNESGdGfMT3g25ha4pSXjlvVeY
	iP6FpHAATXM/ZAuB52EcEbb32jRwpKLy7rmNw9RwleyqGocalV/bQJH+V2opPyXcxw7OHR/e4mT
	XIGDQshVCUJfJeUGQkMiDYSPzB8Ajq48=
X-Gm-Gg: AYBFou0j2liQhoanwqULydp5Gn3kt4pRg0zOOhPx8LY1arxfm3ARLYsvQjAzZ/68o9G
	vtvwC22kJ2QyElIIgmNYFyt4WXCMMLv3zm2Lz5Kp4JEry0gqwFe8hR3pr4ceu0/mB885KA8r56v
	wMzoaaZ+Cz8Kert0cFCFf/AuDtD3gmzidoyZa27mIedhTNcpGd3pF1YhG7rQ9T/0pDT1Wknba3/
	bi7hiCr168P7HvwR6fchvshruDxCiiYwprDWTSRDSc8FltUrcFu9dCkrxGF3r8FmvImdPZH7DRV
	t9Vogfp+r/OA/OOiWna3tzbNFgPQ5PehOXdRC0qWSmxtna60+s49Qg==
X-Received: by 2002:a05:6214:8099:b0:911:2a7e:abbb with SMTP id
 6a1803df08f44-9112a7eabedmr11006266d6.14.1788967418682; Wed, 09 Sep 2026
 08:23:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:37 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
Date: Wed, 9 Sep 2026 08:23:37 -0700
X-Gm-Features: AcwNN1VV4AKxkj7aCdqQGI55bwKoeCFok0WoknLMsCk-ys-8GZWamlq1JVGaXEo
Message-ID: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
Subject: [PATCH RESEND v3 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

run_vmtests.sh can reach test setup after invalid options or category
selections. Its memfd_secret preparation can also change ptrace_scope
when that category was not selected.

Patch 1 rejects invalid selections before setup. Patch 2 gates
memfd_secret preparation on category selection and executable presence.

This replaces my earlier Gmail resend, whose outbound delivery wrapped
long lines and damaged patch whitespace. Thanks to David for reporting it.
The patches are unchanged and are attached as text/plain to preserve
their contents. I switched to Gmail because my previous address had
delivery problems.

Both patches remain based on mm-unstable b02c77c78ff7. The parser checks
and focused VM selection tests reported in the previous posting passed;
there are no code changes in this resend.

Changes in v3:
- Initialize VM_SELFTEST_ITEMS to "default" before getopts, as David
  suggested. Only -t changes the selection.
- Use Assisted-by: LLM in both patches.
- Carry David's Acked-by on patch 2, unchanged from v2.

Tianyi Chen (2):
  selftests/mm: Reject invalid test selections before running tests
  selftests/mm: Only prepare ptrace_scope when memfd_secret is selected
