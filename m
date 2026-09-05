Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFA2E7165
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568416; cv=none; b=tB7pz7eThCcpTavcZgUZEvTkfG7Idm2SfDQFbSxEK3XGkabdhakCPkhOtsyTjcspEiBXZDn0s64H2LBTlAStwlB3H8THWJCWbmCp9YhAh1eWpdY0jPL/mkZuYdNTbjNGhWYOe/KO/Wjt9/RZoaXO6PB6oYudHUkP3c9NRDxFNTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568416; c=relaxed/simple;
	bh=aY8EkClj5dKqGebwOc13go6zNk2CrWvWJ+ByCNaMPZQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NfOaVMRZb8cjQCZ7fk5tmLqieuRPW/zGLq5D++qHXhhE/zcIkl1rJ6xpeG+zwfjZQlF9AC0slVY47GqLZa2RhxgS4RAXx0CpsWj2CY0YUPXu705s3j2fvQqmqcP/xCVZkYvTSAu2g8CkvklpF37Ef8M/FWOMNMjlzTLBnGJIIMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a17dafd042so2001583eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788568414; x=1789173214;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s/whN+tjfJnliicCQTQV3r6IPBrLRblnkzA8UXD/qMs=;
        b=Y2UaiIi0+m3WDu8UIvKEF+kJp2UrKUQO7OQB5hE/Uo1mSGSoONik4xcfr9dUdRBSV0
         PjRUp78iPAV6AlieBcPq9grNLAsXMFxuxOnFPg8WGFxofKHs8riIzV8pL5BljPMPkN8Y
         4UN9yrUHAkLFedJDHTwUDuHkA4hd6OubBLnz9e8opqASOieZlqA1rwCOZul9r8HwnAJj
         XvoNjeWgsoKwh/piUprp/UO71dXXD2+rHK6qUUPJ05bd0H+zyP8iUOkmSLuy/j72NdBR
         DbMEXQRIWxEihw4uXEd/JOqq/PQFX3BctzrHLvBOYHs8FX5/i3upj4svWFf/2qLlAP+1
         5I8Q==
X-Gm-Message-State: AFuF++lsHF+772/hgOQxcJ+mX9g3LzVWJFZAkxIm8JJgcLYowE5h7enO
	gRBkJMB72ePouziZvHkYL+OmHFYk2tZx2hlmHa/Hs1dQOob2QWj184YDDNmlBctOoKxIIPbvrdr
	LPDBM3o40Qe5r7Pow1y4PmL72OutFzabIkmw+6tAAzZ5mJG/dLfBquoRcok4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2019:b0:6b1:7251:41d5 with SMTP id
 006d021491bc7-6b6fabe1b66mr9713895eaf.3.1788568414152; Fri, 04 Sep 2026
 17:33:34 -0700 (PDT)
Date: Fri, 04 Sep 2026 17:33:34 -0700
In-Reply-To: <6a9ad24c.b5d4176b.238c3e.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9b635e.c31bd8f4.21fd18.0003.GAE@google.com>
Subject: Forwarded: [PATCH] bpf: reject non-scalar R1 for bpf_loop() helper
From: syzbot <syzbot+7b47f87674e9a1569110@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] bpf: reject non-scalar R1 for bpf_loop() helper
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master

syzbot reported a verifier backtracking warning ("backtracking misuse")
in bpf_mark_chain_precision() triggered by a crafted program that calls
bpf_loop() with a non-scalar value in R1 (nr_loops).

bpf_loop()'s prototype declares arg1_type as ARG_ANYTHING, which accepts
any initialized register, including pointers. However, check_helper_call()
unconditionally calls mark_chain_precision() on R1, because the verifier
relies on the nr_loops value to reason about loop termination. Precision
tracking is only valid for SCALAR_VALUE registers, so passing a pointer in
R1 reaches the SCALAR_VALUE assertion in the backtracking code and trips
the warning instead of failing verification cleanly.

Reject the program with a proper error when R1 is not a scalar, before
calling mark_chain_precision().

Reported-by: syzbot+7b47f87674e9a1569110@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7b47f87674e9a1569110
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 kernel/bpf/verifier.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index e421ea2b80c3..d8df29ac7dac 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -10886,6 +10886,10 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 		break;
 	case BPF_FUNC_loop:
 		update_loop_inline_state(env, meta.subprogno);
+		if (cur_regs(env)[BPF_REG_1].type != SCALAR_VALUE) {
+			verbose(env, "R1 must be a scalar for bpf_loop\n");
+			return -EINVAL;
+		}
 		/* Verifier relies on R1 value to determine if bpf_loop() iteration
 		 * is finished, thus mark it precise.
 		 */
-- 
2.34.1

