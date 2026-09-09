Received: from mail-qv2-f7.google.com (mail-qv2-f7.google.com [74.125.230.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA07457268D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965660; cv=pass; b=Ss/+gwobHk2crofa8WG+5lj0v7BDwJW/KRkspKBRP9EHZu9YCNmYnzgTMz5vjiQYaM5V5xFUOuZAg6qpsGampG78VakfikBph/u/X0V7DCl6ccoK0j+P40T0Dl/U/eArsZxOdMhxN7bbDZHdgVgrAV78tqmzcZJh4VVgkDcbT7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965660; c=relaxed/simple;
	bh=iL9jj2A0VAi5aGgSoWgSKBQWgH2gjLGt27huhWDb/Vg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RH/VRTXxygLyxjAbFniZWs7mqz9Z4NkWUFoQuvOAvjbN/FUmt8KQvhoBTXWsxd+wyeDhiPCk0R1nhECzMAlNCLbqC8SZ0EEK7iaIptLKS8xbvJidW+DXeaeio0dthnafTIAga9YZimaUYriwk0ELufFFmQpmL6jQOfKzmU5soRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPMgOLxs; arc=pass smtp.client-ip=74.125.230.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPMgOLxs"
Received: by mail-qv2-f7.google.com with SMTP id 6a1803df08f44-90ccffc2654so35745686d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965657; cv=none;
        d=google.com; s=arc-20260327;
        b=l9B44hkUa5Q323jVIemacYcwCszNj+YlMIGGJ0Tt0IIUBwvle9zVTBmoMJkATenlLv
         HEOQoP4RwAsfxP3MYhjdAacr2MWzOh9OnRNnoth59HdyS5jUcDyhPmjGp3xSrmpSod9b
         iQ7JsR7VSVbbwTYRSbexNNMSPi6AVNMIjmmoohKaarMTL8+Bqx6RH5fScox1fD4ouEH/
         yyC4tv1JnkzkU5iQaBWlq+8qfWnUFPaZsyQgwvPirOakd8GX1iZXBIuh6EyqGkPrrC79
         H55Qnn3cYMG636aQ6EY9V/tHBKcRyJXWmBwnzZg1cQNzW9lFeG7AiS3QY2oFfwSsQbhM
         pDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GywF7kZkjmE+6xLyiW8/vaQsBEHTERgtyMuo556AVsc=;
        fh=msjJjtrioobr+mZryzKY48AFea9DiqcfmoqG7BcaEAo=;
        b=rKUUVCs26DE3cjTUESEa4PW2uvfTLyxCywOy+AL08FIm9KacOfDsKxs44fdjOd247D
         q7oFcWHugCVztZ3k3f3vFLZcRaN0VOWh8+xkCuVIpp534PIUvW7ZXXdORIGTmA248i7Z
         NuafOYRITwQqd8K9B7T7uynXiLZhv3gtZh2HCigPOiIGRb2pgXRX5VnBOlundgscdjbT
         V01AMgNyV4jNQ6qHKDvmrtBOPkApE9YdnoKUg8HTbwduCvh8qbgXsRWkGsROqKNJQHlv
         rZ/n6vnz+Vok3te06bzeQOQyyhqUBYncFMgNB2lfrIfowlhJom8qh41UrwOZFspEZDTW
         DIIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965657; x=1789570457; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GywF7kZkjmE+6xLyiW8/vaQsBEHTERgtyMuo556AVsc=;
        b=WPMgOLxsTxcBaB5YdlhDsYo9S49tdQAbHSd4VZLSOnqwEPO2r9jVdv+gOObNZsKN5e
         PMYkPDbsUcNnwcT5JAW74j+Cle2XSbO7wY9f3Qze0z8BImBrVw46hPQJ3haiyFqxkhWE
         zOGaw/Hzp/WZ+jKU1b6iUzybh+RzVvL8wMSlbR63P6XFXG9aQeGHw6BnQm/wEsobP9gD
         uazmqLbqWdE8e9ue0rd4RxPGTmBC/oA0Lb9iQTQJctfkgXdmwh2/sSF74pBhkDJIxbab
         eDYZ9l7NKOEekWkvDEpYb/D3BjGBqG9hjd4niY+AQhKKvxxYy4wsCWf31gZCb3WVMJde
         Xq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965657; x=1789570457;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GywF7kZkjmE+6xLyiW8/vaQsBEHTERgtyMuo556AVsc=;
        b=PmYcVpi+mFwg7GllUz9UJM3ZUUuCxJT3c3sypII57N9qPguNlEgPOlu7unLflI6GHt
         K8egzoUjtJvraCfbmEGwwXFDJ5YmjgkBQe486sm84XRmslvQyZMKMOE8929zTlF880vI
         br6P8lpOHicDO6D3ehvXj+YwiMjk8ALCGZLUoolQpEIqjaWpYoc3e47dwvyh05AHMlcQ
         QmrANzYtZMRmSCiaH3RXjdpuOHrVRJQfO4zvHw/dGBNh8q787LB2v/Twf92sktQZbc/B
         +IJCrS9FRdBqShZlDIqZ77V5663m0NaKUMpHl/fhM6psBmv0wUdP+GEOC8XP2CidImGY
         RfEg==
X-Forwarded-Encrypted: i=1; AKwUvBx8ar1N8w88mq7sjmon45XRimyG2c5Rh8JVE/0TnlKTqbvglz0d1D2p/YDiEL1RyxTu2OE2JQHkWdXfRiI=@vger.kernel.org
X-Gm-Message-State: AFuF++mLhKRrtUfiVnTa8gxdsC4LF/pMp2hhfc08jTTHhcmZcJqFAfYn
	zqf5KVYVXgkHXJqA/5kVrHGghDi37mrt2tSUaLA78toS4bN/VPtfG0F55lMQqC7kMcCfXkbtQoh
	jRHXMhhz9Iah5JIATKXVbDlMEdaEziF4=
X-Gm-Gg: AYBFou0rV8r4qGlSZluYc8O0wN1lJ+y+xc1x99SIZcjvqiLMUxgXF/hEOsvIHq17t2L
	A6dPDcJCtGHBmTHSPqFYLUbOgE7yjze7zRkCDMZZ1kTLoHP1D9xSjNNzIIxGwpR9j6nbmNe5z9u
	OrZRKqt2DNkybUZ5PAw26DAtvHc6DGOkxsDAVij4KjVywjLgvhH4cZ6VQSyWVW/oY/mdnbx33qJ
	NvXfTJcCtAtZedxlvqVvks4ox2aCGWJ6+meeMCNXZchXB9OZLM86v36KqQ4hfVnPP8QvbWStW93
	ypQo7T2xM+QnbmhmBy47VHaMAbiETonyQp1aD99ocdVZfPrc7BaRaw==
X-Received: by 2002:a05:6214:d89:b0:910:4b85:a298 with SMTP id
 6a1803df08f44-9104b85a587mr317423766d6.26.1788965657409; Wed, 09 Sep 2026
 07:54:17 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:16 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
Date: Wed, 9 Sep 2026 07:54:16 -0700
X-Gm-Features: AcwNN1Vce22cCGvMoF0rVdpvGrE34HTDoYBSso_WyrA4nxslSygww_YsIT4lk9k
Message-ID: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
Subject: [PATCH v3 RESEND 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

run_vmtests.sh can reach test setup after invalid options or category
selections. Its memfd_secret preparation can also change ptrace_scope
when that category was not selected.

Patch 1 rejects invalid selections before setup, using the category list
in usage(). Patch 2 gates memfd_secret preparation on category selection
and executable presence.

I am resending from my Gmail address after delivery problems with my
previous address. I could not confirm delivery of the earlier v3 posting.
This series is rebased onto current mm-unstable; both patches are unchanged
from v3 according to range-diff. Neither fix is present in current
mm-unstable, mm-stable or mainline.

Changes in v3:
- Initialize VM_SELFTEST_ITEMS to "default" before getopts, as David
  suggested. Only -t changes the selection.
- Use Assisted-by: LLM in both patches.
- Add David's Acked-by to patch 2, whose code is unchanged from v2.

Validation after rebasing:
- Bash syntax, whitespace and checkpatch checks passed.
- Ten invalid option/category invocations and help passed before setup.
- Rebuilt the four focused test binaries and ran the rebased script in an
  x86-64 KVM guest. mmap, memfd_secret, combined selections, tab/newline
  separators and repeated -t with the final selection taking effect all
  passed.
- The guest lacks Yama. The ptrace_scope write condition was checked with
  a disposable file at the expected path, not Yama policy enforcement.

This is focused validation, not a run of the complete MM selftest suite.

v2: https://lore.kernel.org/r/178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc

Tianyi Chen (2):
  selftests/mm: Reject invalid test selections before running tests
  selftests/mm: Only prepare ptrace_scope when memfd_secret is selected
