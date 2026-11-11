Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379478;
	b=aGgeROR/kg8HIFb2G58Uo9ruOzW8mBhxRwUW8EOY/CQp3VrDi8JxpX/jf6Gq5I1olq3r
	 iT76+5Lk2JiODbnI7j+HNJXBtFV4C+b/MNgrMTAdDkB00heMGV1v9e/M0HlSN5MnECYmO
	 ow7PSy8nqEfsFNJvJyZ1d0lB9cwCtGm6lyOceLAOsi3dnC2o6X3xhBPoB0W4Klg/WycBR
	 CV4NVDjSq+7tMkV755lHLJ7IXcDkDqHugWjINF+aIvalAKnpUKvmB1/m0x5kqaoYit8ND
	 ksjluQwT2uqcYCHIsOxvUYDNzw9VR7uf+VLEmtVYOQ6jsGVk2+cMe5H2l/xNk3Z2rTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zbz8v729/ehKnALp9fFMbSuAgX1DQTsUrRLHLCcKqTM=;
	b=vc7EF0nhoW+eM0SVin4YVFVeGyEtCBcvD8QTs3OtyN209I4DNpmnJaIpr5mX0cNc1YGW
	 M5tNUqNyalAKK43JI0nxpkM6Y/xptymSuNkeu2uxFNPhN3P4ZTT65tlTnvtBtceYK/wXS
	 jSTtqBWgMzsUMA5eUfAXUI9/d0+/Olq2m0StE4z3f5eUmH9VotLC7py6R74uRNIgOb6Zf
	 qd3LX5CXo4HRac4RBSDEEZ7uxgqTnQF7tR2VkAmJt8GKnq2+tf7ZuKrfq/ZkmBsrEv/HK
	 RTDPK557MhnKk8ZbhuC57al4/obcT9LJrVF8xLY/yFOfe3aQcD/fYIFpYCJYeltFlXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eC+S7B6c;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC95B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC95B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eC+S7B6c
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so738113c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794379477; x=1794984277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zbz8v729/ehKnALp9fFMbSuAgX1DQTsUrRLHLCcKqTM=;
        b=eC+S7B6cbqVbU60GWawrGHzooUCvxhlnp2yIxpJb42cM31he3S+6z4V7oSHYzicuM3
         SLJoODT8s8lH6OcN33+pakpiY2nmCJABcU0pSB9V6k2nNYa7FQrxi6TXTY3XhhVg17rO
         DOTY6ZIhfbuwJ3NbWONti1jtBa6UI+gYRZT6rd/M0HqYz1jactkWQjgSShFl7awr+eod
         bgI/WfgGUAv7LdOQP35+6oe1ABCr0lAD+5yJ6FuHIFdTihNH0lkfCrbNnR17e0unqH/e
         bRTGwJFTr5pfS70oVlgSBxpjoThYrohMU1XMBbgCLtAt/aqT9VDLLH1pSNeHI/v4z+pH
         Y7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379477; x=1794984277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zbz8v729/ehKnALp9fFMbSuAgX1DQTsUrRLHLCcKqTM=;
        b=wU9tfKIOn+BK8KKOfuqkO8lR59MZFNvpAn+fPwvqdBD5NZPX2XXHtbGqxBQXxHQeCE
         S/3dS6B0EMij93M54CtjpnPS4bkKN/rmua8S1Te70zGcJ5Sft1N7mvIxHyuA/mTgHyYL
         2QF9UnXhAK1HV6dhhUihSLXyyc8vyj+iAnRT0mSTWHpSBD1/GKOG5R5YAOYv9SGB7RgT
         PR8lfrj9MPeVIH571DBX69xKu7yPtl8TvJjrs2lc2x7AKeqPmWqRZMWUq1UtYiP+UxL1
         H1vM9moS6VRn0cSeRvsA562eTOTK0ZNAc5XRcJFrmkt11sZ+w9EORatvCd1ciDt7x1X4
         0DVA==
X-Forwarded-Encrypted: i=1; AL+hErH1XDaT9vnx9bnIJyHWgLHyy84i5bZdRzCZaHbL/kJMDnGH2PtDkIGiBnv9nsoYfyiO0BzvLJMLSFsMGqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YbcS65pZrtlgXQb7chDoH1BSylLiSft1Azcl0NoNYtucL+H4H
	HXfBmdhFVnKPj1jYsa5Siol9IcUsbqbbgVP1+Vco2dmKNLvPm+Q3eZke
X-Gm-Gg: AYBFou0oWcXwzN1Lq6nAo7HsMsC5GjMmUAKzICS2ait674gyEVXOzDD7psWj52uQYjl
	ydbz6yLmKAu3vYdR8OzWRvpiH6KA5AuW4pmrRBu4n+u8ouLrjQUzJZIE14+10jZzccMtfcptzZS
	LrsCgM3i9C+cEx86W/3u/AElX64MwjYAs+rAkqk/DrFR/EabAmKCHJHRKz/PVF2R+oeThw45U4Y
	dCr3hdRAbMNtQ1PTplx3/MW4rQgS7qEXXJ1ST1+igLCogMtjmwI4swgWTv1ox1c0pKmHBJkf8hL
	jyIAqz05FVl4fe6EuZE/+haJCXRsk2LJIOO8Wi4cHHVa+paCq3Gm3Tm6Tb3WF0Q/5KBB8dD8aJY
	qn811Kmo1KYNVnEbUITjQD3fCroYYMuEFpBAnDyhEv7Pa47jJArpDR6xCgLvy/unBnpb7LgRWsl
	JL0kC0Tjm0UGmMUG1jImPWAAHsmfLyOM3oY4+H9k4oJQt6OOAxEvikNSwIdNy5myqFxmA8U7g/K
	eO5L/XExajySN2yskNhJ0uYh1iNgKzsBRw6Obttu9pEeOQtgrcxCJ//wexNadgtsO8vBRhHk7Yg
	/lRccbo0zNjfZlu6/prfJrtrPepzJzjYh9vuIxl/WYY50dACxQBS
X-Received: by 2002:a05:693c:42c2:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-37686174912mr2157258eec.21.1794379476693;
        Tue, 10 Nov 2026 22:44:36 -0800 (PST)
Received: from DESKTOP-31QBR7C ([103.120.166.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm14333994eec.17.2026.11.10.22.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:44:36 -0800 (PST)
From: Rahad Bhuiya <rahadbhuiya2021@gmail.com>
To: bpf@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	linux-kernel@vger.kernel.org,
	Rahad Bhuiya <rahadbhuiya2021@gmail.com>
Subject: [PATCH bpf] libbpf: Fix incorrect module BTF fd index in warning
Date: Wed, 11 Nov 2026 12:44:27 +0600
Message-ID: <20261111064428.1902-1-rahadbhuiya2021@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the number of used module BTF slots in fd_array reaches INT16_MAX,
resolving an extern func ksym fails with -E2BIG. However, the warning
message logs mod_btf->fd_array_idx, which is guaranteed to be 0 at this
point because it has not yet been assigned from obj->fd_array_used.

Use obj->fd_array_used with the %zu format specifier instead so that the
actual overflowing index is logged.

Fixes: 9dbe6015636c ("libbpf: Support kernel module function calls")
Signed-off-by: Rahad Bhuiya <rahadbhuiya2021@gmail.com>
---
 tools/lib/bpf/libbpf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 0e2a93a42908..d71e8ca199bc 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9553,8 +9553,8 @@ static int bpf_object__resolve_ksym_func_btf_id(struct bpf_object *obj,
 	if (mod_btf && !mod_btf->fd_array_idx) {
 		/* insn->off is s16 */
 		if (obj->fd_array_used == INT16_MAX) {
-			pr_warn("extern (func ksym) '%s': module BTF fd index %d too big to fit in bpf_insn offset\n",
-				ext->name, mod_btf->fd_array_idx);
+			pr_warn("extern (func ksym) '%s': module BTF fd index %zu too big to fit in bpf_insn offset\n",
+				ext->name, obj->fd_array_used);
 			return -E2BIG;
 		}
 		/* Cannot use index 0 for module BTF fd */
-- 
2.55.0.windows.3

