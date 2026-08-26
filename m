Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742E13BE638
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787503; cv=none; b=bRneIAww3YkF7tRB3ZyzY+R/L08ffwhmocsXsqoNGd3BBN7txuduup4keogTnneEaRRD7+k1MvHk88vlU7oYS4eD6LGzAbtAP66O/8pGgglybBuMUCZlsEORJBnOc7wEajWO5RI3dgskn0KLwWdIt7qY/5vcpdfziXNP96tdVsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787503; c=relaxed/simple;
	bh=zGFbXO9+QXC16MOBpJ2H28g4HOaNc5ULMC7cLI8AD5o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=m07P7S1JR1t1USlOtHRjIP4yuFnHOvXCu5C3RrpMVPxvGDnYO32oKUbedbk+FDliHIRbJiswBglWKj6P2EX6ubo1v1AvnmUwLVQnDwAMbR+sD8kVIdJB1p99ub1Yycr7LxLA1KW1GtGlJwlWtJJgWKt/kAfPPM9Tjt/hUExNNTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7eb64224fd2so138154a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787501; x=1788392301;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4CBNSg3UKfhu6eAd7jY4Z4Vzp/uyVvl1nWV/QL7p+QU=;
        b=HuKI5+g5WrFwJD3+vYD1kaYlTKfPJ1NJhMiHsI8alKu6Uxc+nXzIqFQhv/RLwc4b3J
         MHBA/stpl2JhbdDWWDpO+SavEAl6KNlwzhM0G4Pfm4GQAFSuD5nOp5xEqx2s6/Wk7Emb
         WX7Gxdmz+ynWGo5VwXcQLIPd6c9CYX/FS2v+W4Fl8tbAAPxaK5GTSRHtRyPoJQw6IdWA
         b1WYjQkBMSP9YzYuG48MrP3bPhbqsPwMm9c3hu/y8RbS4F8HMoy0corhivm0CCcNobtv
         rXONYNmDOpJ76V2tsv4yd47KUH4oQf3VolKMT0ukszRS4AOLNaZUcdRMCClPhOaLKBNt
         8DBQ==
X-Gm-Message-State: AFuF++lL/cr7UwW3GoBo9nFWBF60+vcznUsxOSsX2AL8Y97XTrGOw3Ta
	t9H26Sq3RDLduaY1cJ2RDwRsT03bxseGbJ4wOdncN2MujTQF8Q7P9mR5eePTIs/K8hkZ7k4QLDp
	runprDl2psJP/+PvyVipayyAbFwyIChyAaSVMJOz+0CP5BOTLzZlyK/ZdKZQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e849:0:b0:6aa:f0fd:3f0a with SMTP id
 006d021491bc7-6b1a0502655mr10377429eaf.30.1787787501413; Wed, 26 Aug 2026
 16:38:21 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:38:21 -0700
In-Reply-To: <6a8f4e88.27659fcc.2ceef7.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f78ed.50659fcc.60cd.000a.GAE@google.com>
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

