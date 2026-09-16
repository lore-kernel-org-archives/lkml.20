Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2689E43F0A6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593857; cv=none; b=dooY1LBDXhGFJE2JpiR42obvo0LQYLrBYYKy/2MGtGUEfY7TWgnkwytkWQ2qL+s0FfFLUabPlnkFCi4v9AhNLw+e7v1z95NcFT+0C9C4FwScdQqEer9e2VmIAJ01DKGhvotf/+97pAt9LUGy+TuMNPI0Rjg1omMg0ZPwI6ZHrRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593857; c=relaxed/simple;
	bh=PYT4ZbnNOltTAH830UgE8QUvoV9QQVI65GzA4VvF004=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z7zDG4l+x5adBTKDP2A/yge/zExSZNnXLyOE/p2oRuJKkcIEZgvteycDsgmWfi6TqHcAJNsyTifjJOTs1QfNUlmAXPgAMPzHq7k5IejtU8fNDlc3dTfFR5o/Qe7SqOVS39sTY79l8LHFkLUZhS2/TcY4yLF1Av6n0CxFW3hj+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKoD1kWT; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKoD1kWT"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee9so52389e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789593831; x=1790198631; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1u8Ca5fgKUmWBjGqjd9hE6KBvU5POGnuxsvv6rx3S+8=;
        b=QKoD1kWTL1JGo5TqsgM9wqf/NC2azWunMfh2ke4nKAvPgxlB2y9nEO+nyCx6Lp+1iq
         CM2dIiufiTHezMLx9l8weV/rQLQGHXoKUnaVLNUEF3LrXK8nnAz6M8wg+wBSi36vk//V
         3ZcSb9nFk9qND4ANucjlOjp/weqhEzPMOp0E6z+qe5NNdkB2oUOALvgaJKS+SCku+qQy
         WAAOOR0MAvnMHhMTAp2rwGa6J0h2EqRiwOa79yUriVtLdbIACvxLFI06t/5TO45A5IXD
         o6OgcXTExV3LaxcB+psCEDWE+c2p16PfgN0luhuPyPxSXqgXu5Qg4UCSSbytec21RbPz
         jPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593831; x=1790198631;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1u8Ca5fgKUmWBjGqjd9hE6KBvU5POGnuxsvv6rx3S+8=;
        b=K/FOo0RLZanjXU7mOuB8smKTY04/7qfHxvQTO1Bh41ge4WVJDgyUl8CEraae/7hWQ8
         llhy4s1GScb7egaqfUeavJCj2qYtI3zzkeWt2v3lBMy/bHnrYKuw89/ih7eeEx+WEySL
         3GqN1sckYKjrjacV2pZs0zOTdGe/S9Y9wYORrOIVwAyQ/0wGkP4mq4Ir50pYy23Vk04z
         SdjbNSrVLo9C5KkPFD1rgeY8+Vvzr/9HcIR7kkuaZ0UA0frdnRUeK3yCE2vIfQpX4DlE
         19vbZfTN3+q8CDHxUpsDk0TkI+fes3iCk605XbzpFfCl3VYbeiOybSSNsBL7itPW6R7c
         1E/w==
X-Forwarded-Encrypted: i=1; AKwUvBx8kQwmfIw/7XyqaMNBHZUWkW46HS5+gwbYeFOkXSYkrBMlvrOwhnqStjnqdp+j/oWvlc6Vw+hLaW4uVbo=@vger.kernel.org
X-Gm-Message-State: AFuF++nIm5vnjqcuyDS3CDKdK/dcobQ8AvaWpTWYR7XNLwCbrUV4fMh5
	V5C+alZ0Nh8eCo7n+c4oT//qvPQuFm321B8qYmafemVRLxIUN9tEO3vRI4AwbZ5lVFA=
X-Gm-Gg: AYBFou0bjJ16vErMYL/Y3LmEMjTXk+0RZDRal5Tj1IXwIowZHgWWC9OLD0KItm+U1i6
	l5xoWMFrfeDusj8LOADntd6mMe4KIqIG+E4wFw6lk+qxNd5QSYfGg8CfRxTvzwrJgAK+Xfx/1cJ
	MwTy6nDksY0AFJIoAyfzT/2xdG2sgvLxePlkUynhhK/t1fHW9UWlPiORyOlKSuvFQ54RjhIPUWb
	hex/OkltMtvV1vMm7B3fLoLLolJRsFLk2TjcZOWCLIsbbW7gnnEvdFyNDecGOY3gTimK3Ohetyq
	v8+2SpjdlebeoBpFNsbCDgHiojnCnF6UpCEjdEa10mjdZMeMY1FAISZS3GvCka50/BluNDCfd4r
	z7h41uBNIbtIupbzSF1Hj4BKkifkyg27uBrUj7qNJLDNTyBRHTzkbu0bribgFrn6CmU4yhfE3Me
	e9XCv71ZfzJbufnkK8YryhGttjTy2kVRCd5aa2gDmDUeP/8w8IgcjHGqMXrnpW2Pg4y6ebdHrky
	yohxpm+
X-Received: by 2002:a05:6122:1d9e:b0:5ab:26f:49e3 with SMTP id 71dfb90a1353d-5c99abee033mr6427627e0c.3.1789593831650;
        Wed, 16 Sep 2026 14:23:51 -0700 (PDT)
Received: from [127.0.1.1] ([2804:187c:8477:2200:a81d:7882:284c:4fe6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a51a05afsm1034934e0c.1.2026.09.16.14.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:23:51 -0700 (PDT)
From: Luis Vieira <luisflavieira@gmail.com>
Date: Wed, 16 Sep 2026 18:23:35 -0300
Subject: [PATCH bpf-next] libbpf: Validate ELF symbol table entry size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-libbpf-elf-entsize-fix-v1-1-cf181da33eab@gmail.com>
X-B4-Tracking: v=1; b=H4sIANYIq2oC/yWMwQqDMBBEf0X23IUooqS/Unow6aTdIqlkY5GK/
 96ohzm8Gd6spEgCpWu1UsJXVD6xQH2pyL+G+ATLozA1pumMrTsexbkpMMaSmFV+4CALDybYtjX
 ore+pyFNCqY/jG+1CxJLpfi46uzd83n9p2/6Z/29rhAAAAA==
X-Change-ID: 20260916-libbpf-elf-entsize-fix-a0f9440e79c7
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luis Vieira <luisflavieira@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789593826; l=1101;
 i=luisflavieira@gmail.com; s=20260913; h=from:subject:message-id;
 bh=PYT4ZbnNOltTAH830UgE8QUvoV9QQVI65GzA4VvF004=;
 b=HCjD7qj/QfC2EQY4bMSCMJivgeTsusrUpRqbF10U9spVIYYPoYOF9IJeKtX+NcKGZyi3kTXnc
 okomQzXOmMwAtgkHlk+cM8ApvO8RYhNO55SRCk4x7wczLNd3re7rBEV
X-Developer-Key: i=luisflavieira@gmail.com; a=ed25519;
 pk=98MeC/NdrC6ah7zYpPnkWiQIoyj62iUP/rNuV3esCW4=

elf_sym_iter_new() calculates the number of symbols by dividing the
symbol table data size by sh_entsize. A malformed ELF file with a zero
sh_entsize causes a division by zero.

Reject symbol table sections with a zero entry size before calculating
the number of symbols.

Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
---
 tools/lib/bpf/elf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/lib/bpf/elf.c b/tools/lib/bpf/elf.c
index fe136d025967..ba0b3df37a59 100644
--- a/tools/lib/bpf/elf.c
+++ b/tools/lib/bpf/elf.c
@@ -118,6 +118,11 @@ static int elf_sym_iter_new(struct elf_sym_iter *iter,
 	if (!gelf_getshdr(scn, &sh))
 		return -EINVAL;
 
+	if (!sh.sh_entsize) {
+		pr_warn("elf: symbol table section has zero entry size in '%s'\n", binary_path);
+		return -EINVAL;
+	}
+
 	iter->strtabidx = sh.sh_link;
 	iter->syms = elf_getdata(scn, 0);
 	if (!iter->syms) {

---
base-commit: 10c4f610b215bf961235141161992f010cf7e451
change-id: 20260916-libbpf-elf-entsize-fix-a0f9440e79c7

Best regards,
--  
Luis Vieira <luisflavieira@gmail.com>

