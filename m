Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255083;
	b=n15x1xTLUlILj+BMeZaZHCozhovL+MGMR71bVTgjvvNNdOVSPW3Vore/nbi7Rf0VR2RK
	 7lHKP8zNocscI4B/XqwwDriJG6bMdp/QEB9GPJ65OKm8qVNkLU+klgjKQ0t3xbD2htJ9s
	 MZHf1QtWn3tKuKyYXZzL06etUpQCa4pvQUalqKwJFCl8osTgIy7vg2pDaKrjV3bd5tc/g
	 gDWOS77NGO22TciYO+NibDIGZW6Xz4MgoiuD2TPoClADbqf0kt+XkeVPtue/xiUiA0Te1
	 jkQfEWQYHb7VJix+pG5/qr+Us81PSx3PsCVfM0KwbpU0hkR2HRlO0W/Mnh/Duck7e7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=3bbEEd0YswyM9gjR9hkxZR+uYtqrPZWlSsQUrKIRuMc=;
	b=0SmmxkubderLYfEGmIIj1tfmB1HgCsSxQtG3G09A4j6iTHbCr4SaUXdasyNslZjj5Tcy
	 aVGD2DS6KPfm1NvJ/fiKsfrZ0liNkcVBvg0z8F/64b6wVXGwUEf6mChiF9sdkCGxD/8XA
	 GdP3jLyXcCjNHx28lF3GP7G+CX6eY260aOKXU/LAeBCY+zj4I+xviRfW5KkFj3yx/1S5u
	 7f9TEHtPz18qcENZBksPMfGB7buo+kISnPu34+g2jLaQ6CNKb1B29SCJiLmda9NOWVwYs
	 HzOg7DfTmctn08eo7Wql16WWpyx7l7U70Gi9GMAi7w06JdpUsR/8cVBzATT9SGFtp8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gu0BWhT2;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EDA606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gu0BWhT2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso3328252eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793255082; x=1793859882; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3bbEEd0YswyM9gjR9hkxZR+uYtqrPZWlSsQUrKIRuMc=;
        b=gu0BWhT2qDZdxQOZMvdBUbACbsY+Lom94YHjJWzAbU1Zvzm2eGC4qYA4viRyB1Eyuu
         7ibtAHkLAFLMTWCSf8xgbCLPxc1xjp4DfJSWbzoZudaQdmd8qZ3EJoCmeElSUKl2fFGQ
         v+S2rAfDgtvoqFOSyCXt7rA4aF4fKpr896fns5RDccbh368Ik44S6h867znX7oefJq9F
         xiJhkzZMQD5wWdL5G1lKPd6q7LxgW0ENocomlSsV89QyZ+X8p83aRE/+DEiwxtXyhPKX
         SjJSZs/5zL7hHOvf1zkNjuxFYkZVrkcqPHwrWzqBb1oTg1HJok+JwyiWa60EeLsh/Gkc
         DzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793255082; x=1793859882;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3bbEEd0YswyM9gjR9hkxZR+uYtqrPZWlSsQUrKIRuMc=;
        b=AYHSnqreUEsheGhDYhHvEzLsi1SDTKN48l5cq8F1Cw54la5txdenLegiWMRH76s7yb
         Vsxi3DFmJB1fTnjg0drL7AUu5LcOVY1afXrWJ0TE6Hh7x8UszKmeLbJqoyejzcVh1VUr
         OBJAaQtDYJe34Muh0FIrfMlftY5J5bJztdy2PI+wgjyQj93ji72YdLmi+bvIy8OZb8US
         HdoGloRzrYAcBQroET2IZt69w971GbHCBTqNTUGTObqgX0CkBX8XP5s2RJANj9QERByx
         TgpP19FDzcuuRNY6gBYaeR5TwS7LqRuh4ZLebWZo+yLmAf0eiytcCAMV3EZPQI6rMZ6f
         EFow==
X-Forwarded-Encrypted: i=1; AKwUvByJyTtOxmhjoc8hwhEmq/JRzcT4NyYxzF3GiBE12ZoDaB2xljmM9Gn4NhyBhQbvnlogLxpqfaibON64noM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM9dzPUk+NuTeU+e+rslubc0a1TB7F7penYDg1FGdPjQ9prrpU
	t3RIJOhky91xXYGcwti2wWZKZUEZZyge005idMPxAaRUj88EaYQG0QON
X-Gm-Gg: AYBFou1W1BsMuLBDvL/fSPVuNFFPjKIDWc783eXyGBuASF17XdnmHKdmJ6iM6W2yMdD
	QJLYnDa8nX5AO0gFsrimV8dvAbtEJ7yUKp4UBzlp33w93n4drVCnOMkrRVDPT7o+PmG2Y235Os8
	UZd7lM8kfYXS1MqJ408aHw/XMeOqKoOFRThmaU8aSC/NCfGCMFO+sCwtbDKQenajZpKut3GPrbL
	Qd0w9nG4gjJ+L+93Qz3Ii7gl+aEu4uZD8Dz8kFUNm4nD7mnHF+gUA3GrSZcbT85Zc9yJ+KrDSA+
	l46esgaz6+q0VwP+QExGitmiU0+hU4DH1yuD7TExrtDF3OnOpevJ7nolktCoCH7WBbkHnz+bg+l
	MLtoDamPcmIwHnZvojeaD8l8pj6kS7mcR/vgJjgpkO8t4U7uYy/UsxRworlCyVWhyJ/oC22iCjA
	GIRT1GNXMSZ56mj4EmSCrCvtSqxmNoglG7ns/anUi0zKtxEK3rte1JDbM+EXXbQbcV7QGMwZkyL
	e1Rj6tbZf8FOpI5UUyyLKpbqadV4SvPSW8ZnsGJeocIklCklQiKgTh2MfF44RWn/yTGOSF/YC11
	BgQ6DRe9H3KKWGu9kS0IItfj
X-Received: by 2002:a05:7022:ed0a:b0:144:eb46:be0 with SMTP id a92af1059eb24-1a6ced912f1mr6332516c88.13.1793255082423;
        Wed, 28 Oct 2026 23:24:42 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aa2f100684sm2152004c88.3.2026.10.28.23.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:24:42 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v3 0/2] selftests/mm: run the XFS-backed THP tests when xfs
 is a module
Date: Thu, 29 Oct 2026 02:24:34 -0400
Message-Id: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAKLm4moC/52NsQ6DIBQAf8Uw9zWABmKn/kfTQeCpJCINKLEx/
 nvRLq7teDfcrSRisBjJrVhJwGSj9WOG8lIQ3Tdjh2BNZsIpF4wyAWruIOLQThinCM5BmEdI7ot
 Lm5U3r+AVgkEqamkqXWFNcu8VsLXL8Xo8M/c2Tj68j3Viu/3nkhgwUPnTalljLZt75xo7XLV3Z
 L8kfi7LX8ocKGilSqEoq0rOz+Vt2z6plHFZPAEAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: b4 0.13.0

run_vmtests.sh only creates the XFS that "khugepaged all:file" and the
pagecache folio split cases of split_huge_page_test need when xfs is
already registered, so with xfs built as a module and not loaded yet
those tests are all skipped.

Patch 1 adds load_module(), which records the modules the script loads
and unloads them again before it exits, and moves hwpoison_inject over
to it. Patch 2 loads xfs through it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V2 -> V3:
- Match xfs as a whole word so that selinuxfs and vxfs do not count
  (Jose A. Perez de Azpillaga)
- Rebase onto 6593a15af108 ("selftests/mm: skip khugepaged file tests
  if mkfs.xfs is unavailable")

V1 -> V2:
- Add load_module() and unload what the script loaded on exit (Zi Yan)
- Unload xfs again after the run (Zi Yan)
- Rebase onto mainline

v2: https://lore.kernel.org/r/20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com
v1: https://lore.kernel.org/r/20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-v1-1-b97dfc79e97a@gmail.com

---
Qiliang Yuan (2):
      selftests/mm: track the modules run_vmtests.sh loads
      selftests/mm: load xfs before checking for it in run_vmtests.sh

 tools/testing/selftests/mm/run_vmtests.sh | 33 ++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-de0697d4c4e9

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

