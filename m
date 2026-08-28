Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAD63C2782
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894942; cv=pass; b=J16l4kOu+Jdd8GYEtwb0J9qXWt9DeGl3XvnQZ74pxtlE/fX689klelnZi0UkUYXZl25qpYPZoJTuFOVxrT3ma4mSVrqeI36bNSKN/CpBIh5t2fmAuQa8TI1gRURbeOa3hMLu7teOOoMI3KnYNUyyoJNcrxO4J/14j9vcd7nBmbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894942; c=relaxed/simple;
	bh=LRm7TUFzAteKTAYdlVpNqQ8w/29QsDN1CRtyvuAjdxI=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=M74Hm3t/NqPaaaIfIFUc+Jm/HOdHhIKcUNUzatWgtu078bTA6nfBhIpdbcVjm053pCMYMgi6M89LXkErPVlPq5WcXHDQ49GE03y/HsxDCwhap7Jnnug2EU7iUwiQSV5kg0hi1KTWJI8sWPmCLeuiC3YNExSiX+SmpdInPG/ZQdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=MxTcO3bf; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="MxTcO3bf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d049069377so7350085ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894940; cv=none;
        d=google.com; s=arc-20260327;
        b=VxHTqA4a1CB08piVrR4jzQDztFoYarzjrL7pmgtGZcVy0TWIKX1AClQqyIBIaS+ST2
         wf/tGzTJADrzKnGWs13Zx/ZYkTM3BL9yROwHLy/fBWDJ+zuHneQjzhtFMA/be1IUDrcI
         PT/UUbucC1CQ2FpDyf9odUambkijaAQJvPW2oOim+V2OWca+XyeOLStaOOB1khagGjjB
         LzJDyDT7zoOjIQWgOovSzcvv+/60baIbnw1y4RWQdKhRf8kMOh2+pD8YdThVr6cACEYI
         +m0rGRbGlmIfTMaTr3jljGIRCr1b/TvQurgBKMYoU4w5QPgugKxHYMOIrP+6g6a2AHbk
         XD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=323/e/RaqA8mIXEHSxzv2u3juG8I1v9sZLdgI4Di9tk=;
        fh=d6e5jD4raoOT2VZxREEP6mFm0pQlziOWWrMj+UM4k+M=;
        b=NA3y4VvH6daaGpWIWwaAYwAbu7a3fyF0fhAEi4/cjZxrCZFqD0ZAAHI/FD8n+CpQi6
         3ZjAwvLjO91Tc+NAT2SReIpaRI8r8iPIK46fbYPS70pWC0kKKUS7s4PvhTfKITlsYhKz
         mhgHhLgTlBLAElGBFcnQDzp+9QQiLEyj6Hx+uDciYYtn/Z8m9ql1D3/wcF+GzJ2NHudm
         v8COdzkNIwKm+2srwaFaUqut93uMQ7BNKtGU95paZI1FuVclBEjDNgOuNfNxtaWBDIpy
         Ar352TQ4DzPXsKy7oQSVgDSKhNF4NmWy4bPOGgB2Rq1A9QpNZ/nTaSzyBPhDSwnOS5BB
         LO9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894940; x=1788499740; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=323/e/RaqA8mIXEHSxzv2u3juG8I1v9sZLdgI4Di9tk=;
        b=MxTcO3bf3r4Yq3Tk5c8RkNp50QBpvHAFfSbw6V/dEZDaRtQcOGBLaU1q94cBhSdX9e
         XJZtYnYY+73akDgQ8+TTUCr8rY5wPZRjXWFADZ8q8OxM2Z2OJtI1vgGHmg+dbhfRn+Pf
         NnJsMkG0KNB2QQsLHC40FyQBLxNq3rnI/O6FD666BmUluz7Bdz3bQnCYAp4/JHuSrV81
         wtQc2pMtPj77Dygm/FDlPaAdXBPXNtYrKkUem4+PY5I056+0Cf3fYXhyPJZC44lLtsET
         6nbbTz2xJQfgzpyfVrZ2weRu0PNDDhbNb4yUCRFix9sEghxrdtVVC18YGxK+5IYKB6kO
         vyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894940; x=1788499740;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=323/e/RaqA8mIXEHSxzv2u3juG8I1v9sZLdgI4Di9tk=;
        b=lnik2uux1STLgcN5MH2GnKIz0/Fbo+BAG4SMrusNIn8ixSM8hgablI8FZaxaDZ7X6R
         j/aPy06p/lgO/8LMz15xaLDetWsxUf5x6l1JgNIajotd754Sa6G02kxuaP+iJ/7AkrHs
         rbbPKKnU6vaowzNdxKg5j3ycP2OUkum+JwTX2pC9AiRFVwfNF751j5Aqv8HAv5CETrJq
         jbeAO3l6K1cnqcZ2WnY2IK6IegIyRPqW3U+Fmc3VyIamtNkKIK31BnETpKBIC/xLH7Yf
         puo1RZr/XuRIhSneRPbaulC3u129fkDCKg2yfd4zdYUYrTearAB/r2k0thKgOxnV9Mva
         nrVg==
X-Forwarded-Encrypted: i=1; AHgh+Rph5Fniq8mSabN9JiqKtMQpYOXwy4X8zVD7lfll4moLH8QHBdEjYA0DrgOQ18KN+MmSJd8Rcn1sdn+eY5U=@vger.kernel.org
X-Gm-Message-State: AFuF++lfZPP+BttlB1RWliahYQQ5qmZaUM53mRX9ntBXPTCgcQLVGYRF
	x9w0Wknqd4KD/mOYVi6OO4tJX8CIWQvx7ECqxaQFpEp7zrWiloDnG1UgyHk+8CvicwzYRqxd8/5
	Wd1eU3ieEuBxFlANxP82AsBDJsA4zIo4EY8tTFTDZ
X-Gm-Gg: AR+sD10Dh12uWhq+N716Kn01fzTcRpeKrNRU3U/stSnPhX6ut2HcGwnUWFOuV095Rwu
	c3qoeF7powizhnQtBBIWbDX5o3uExrR+plciziJY1Xe8ehreID2J/D3dA/Dt6ESrh5/9mKHsjO+
	wbXROVomCaenW9bxh58D9IKWVyEswS857xN5pNB1YmaIoTap4cRvhAtKlKTtFG7M1d3RHXluEtg
	1NPAHLIbq9tI4hLcwNfrNl0aHSLMc+8DU0R6HOtmy2RGhSAT688dtpW4LOVZzdNWUyJpsObqvvU
	jOgpII1vi4gp88P0ShhbyAzEDam+KjX9ClF4vm14//c/yS6aRws2U7DEfa0rctejZpy1i12Vg18
	QjFzPxgTh5bTKXcvXUjf0cz/W9hQ5BsNcDIsAu0MhKuY=
X-Received: by 2002:a17:903:324c:b0:2c2:62ee:5a0d with SMTP id
 d9443c01a7336-2d74df1c634mr88380135ad.14.1787894939423; Thu, 27 Aug 2026
 22:28:59 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:28:57 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:28:57 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:28:57 -0700
X-Gm-Features: AcwNN1UlzyJTQI4xLeKZfZmMD9WMPAJkGc0arO9zP77WjK-dTinfNX0jJqWgP4Q
Message-ID: <CA+0ovCgWzUMK+nNbbtH7eV65Ca=fDN4Ozu7iASgryjvv8Tk8zQ@mail.gmail.com>
Subject: [BUG] refill_stock -- VM_WARN_ON_ONCE(mem_cgroup_is_root()) from a
 write to the cgroup-v2 root's memory.reclaim
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: falemi@asu.edu, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/145-memcg-vm_warn-refill_stock-root-cgroup/

  mem_cgroup_is_root(memcg)
  WARNING: mm/memcontrol.c:2198 at refill_stock+0x644/0x940, CPU#1: repro/9490
  Call Trace:
   refill_stock+0x644/0x940
   try_charge_memcg+0x12d6/0x1570
   __obj_cgroup_charge+0x35/0xf0
   obj_cgroup_charge+0x1de/0x210
   obj_cgroup_charge_zswap+0x83/0x270
   zswap_store+0x1620/0x2000
   swap_writeout+0x94c/0x14c0
   shrink_folio_list+0x3388/0x52b0
   evict_folios+0x374d/0x48c0
   try_to_shrink_lruvec+0xe72/0x1350
   shrink_node+0x3320/0x3b90
   do_try_to_free_pages+0x6a2/0x1990
   try_to_free_mem_cgroup_pages+0x30d/0x830
   user_proactive_reclaim+0x504/0x840
   memory_reclaim+0x1f/0x30
   cgroup_file_write+0x331/0x8f0
   kernfs_fop_write_iter+0x3af/0x540

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
