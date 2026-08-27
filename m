Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029837E5DA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787795605; cv=none; b=APvsVhxJN6YreMwAcyzZ3qUFA4+/59n16ZIiCsVv2qnu3f+2mJYMbKT5iAI9MH9AgDW+LeNH+4OYGNiQTFGPTKWyBq8tB0dR/C830F7zJdkXqWGcGvAqAeN7GaNenzrfQy5vmnsPLwm8GrqQYmyg4vVLAaYag7MGlvqa0lhU/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787795605; c=relaxed/simple;
	bh=zGFbXO9+QXC16MOBpJ2H28g4HOaNc5ULMC7cLI8AD5o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KuH3S69+t7d1V3LzMJmttt8xC+6Cz0M+DmcqKOgxzXLpsg33m4EEFLJ9sfvwn8CoCTBUZcc8jQ8gp/7Ed2x/jdbN205fYbSU3xyUyOzCwvYm+96jYtFLuRpX11QlmVMgyde8n8MfNEFAzdU1qM39ArTFt3eaczWLBVJrBn8hw9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b26d8d2498so2940892b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787795600; x=1788400400;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4CBNSg3UKfhu6eAd7jY4Z4Vzp/uyVvl1nWV/QL7p+QU=;
        b=n1FIxJDPH/IZskLB8ZAov6Ngxic7RJDbgVeZQRDzHVsjc8k783xLvRu0/cVh3nBFPo
         EYUIctsfnqzHyAmURtljyZhJuiBFxSMo+dhK6b9s2E3kCrF1cSU/lpRhZ2Y92b4ZHPi3
         cSGm/6Kdryf4xZiE6wKNj/wbOK877xPK6vQHd8iB40ltJMztHV3406gsUyhKkdpDz7mS
         iNvd0rA9Mf4VLCuSbhw8dHRfwGH37O8XWG/5iwkXj+eqhdelpVTBcRaWYFPPIUHtsulO
         caCw4YoFRklghr4Utu8nfyOYE829IO5LgTx4wgkIHt6bnXRz67eOpZqZ6XZbIZd8y0ZK
         re/g==
X-Gm-Message-State: AFuF++nOtgrOTq7oGSUc+QwmA+0PzHgLNuItE+oH2rKqtgDrWDpL35xe
	teScjXbg9JkQRKG6W3b6F1VHTBv8CBnmVAGDnc9yckGyo9PdeWkTPToiG+7xnsOSYq05zpmw/f/
	AyTRHJ/P0aGVSCdHIv2qa890sBV+a7+ocxf3XTdYDMiZ6wQMLxOOigk/Qbqs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5184:b0:4aa:cad:cb4c with SMTP id
 5614622812f47-4b366908457mr13225277b6e.1.1787795599807; Wed, 26 Aug 2026
 18:53:19 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:53:19 -0700
In-Reply-To: <6a8f4e88.27659fcc.2ceef7.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f988f.50659fcc.60cd.000c.GAE@google.com>
Subject: Forwarded: [PATCH] bpf: reject VAR/DATASEC as a map's BTF value type
From: syzbot <syzbot+37b56485bbbf90ad8489@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] bpf: reject VAR/DATASEC as a map's BTF value type
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


btf_type_id_size() resolves through BTF_KIND_VAR to the size of the
type it wraps, and BTF_KIND_DATASEC carries its own explicit size
field. This lets map_check_btf()'s size check pass for a
btf_value_type_id that points at a VAR or DATASEC, even though neither
describes the memory layout of a single map value - a VAR is a named
instance of a type (only meaningful inside a DATASEC), and a DATASEC
is a whole ELF section of such instances.

The unresolved VAR/DATASEC id is what gets stored as
map->btf_value_type_id and later handed to
htab_map_seq_show_elem() -> btf_type_seq_show_flags() ->
btf_type_show(), which calls btf_type_ops(t)->show() on it directly.
Reject both kinds explicitly in map_check_btf() instead, right after
the existing size check, so malformed BTF is rejected at
BPF_MAP_CREATE time with -EINVAL.

Reported-by: syzbot+37b56485bbbf90ad8489@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=37b56485bbbf90ad8489
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 kernel/bpf/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 6874ba1424af..15c4fba80cec 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -1274,6 +1274,10 @@ static int map_check_btf(struct bpf_map *map, struct bpf_token *token,
 	if (!value_type || value_size != map->value_size)
 		return -EINVAL;
 
+	if (btf_type_is_var(value_type) ||
+            BTF_INFO_KIND(value_type->info) == BTF_KIND_DATASEC )
+		return -EINVAL;
+
 	map->record = btf_parse_fields(btf, value_type,
 				       BPF_SPIN_LOCK | BPF_RES_SPIN_LOCK | BPF_TIMER | BPF_KPTR | BPF_LIST_HEAD |
 				       BPF_RB_ROOT | BPF_REFCOUNT | BPF_WORKQUEUE | BPF_UPTR |
-- 
2.43.0

