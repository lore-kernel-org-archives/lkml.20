Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269022;
	b=m1EKq8M9Bf0OvR12dMb2qz+s7TMjmJzACKL5ygiMcpd/I+1RnXbenqaVjgZtDYZt1uha
	 zsi3IZXamGOk621fxOKkdUThuxN/JBMuaD6QohmtSn7MALk8UZsCyNYncKMwFCddu/x/F
	 28rX/YzaeEAL3ESDGlExcJHn55Htr02abD6O/lvav2o71xHfKoyqvI0FC1sukiAzA/hcs
	 R9oRC9i/R7d0y/jIhxjbbdwVTatbDUaavrlHXXI5cndiyYMy702tPb+U3RRI1LRForfsK
	 ESdmqIwsmKrAQxFuWuCGmXgJm/YDmoYZB7h1j+WTsYw8bo6GeyUB8sWF1GuLjwiiZBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A1ekNc0B2q5hqHVaqyrrPmobu/u9RVnhuIQihIy7wRk=;
	b=SWha+iB6V08crQzmpBOh/3y7FiIHM60X4jHzVNfBfRuhE1ITlVQtCFltpEUvbsXZsMmo
	 lgZgXa4rQQ7kPwBnvenY510eyeHCr+Rd25WtxIYbybxU/3awBPvB+qLF8H5mVUlshOcWO
	 ILAaUVxFu+/y4F+74nscAIG2JX5XrDRh6DN27FOkkWxfOp0MJCrzFmQMWog0W4xS9Xk4X
	 eyGcygYoinOsJXG6eWCOaJgAIIjLjoAHxCc+tyNrttI7tbqVc+GRTzVByBi3yVjb8hOkf
	 RMiVhaorB+xA5WsUHrHMLbsgWPD29+W7xtYCwH7ODcenA46+zmoz4KZuTrfv7PjYBJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBAhUf2y;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32018606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32018606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBAhUf2y
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6f8a519e215so1201785eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269020; x=1794873820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1ekNc0B2q5hqHVaqyrrPmobu/u9RVnhuIQihIy7wRk=;
        b=CBAhUf2yn6WZIgPwxB7XEigl0wX0r9hxr59yeWTDVVxOzRp6j/qlJ6iS77GCPYvMq4
         dlhTzAu+VUm2rZwKeqD3GOh2PNpBn8DRaA41kGLROs58U2OQgMBRGYx6q99QSJ7jrs0B
         0lo1Jfk0J2jjJ9sstyPXByjWwWam2RD+FCLWi4TzINp0b/rqfny6dWOPlb8bdKPNtcdx
         BssVG6UXxnHpuk/i/7Ma8nwUX4X17/TG662XmvEfffyWvpzRIbpc57KV4VZQh/qjlIhc
         SsId39xPCupfmo1GiHebZtXKoGmUubsdXiu/fo9IFh6Kuca7cl18GzQN/fxTeAK0qYu3
         tdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269020; x=1794873820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1ekNc0B2q5hqHVaqyrrPmobu/u9RVnhuIQihIy7wRk=;
        b=rmj6VR6sc7TrDN1u2WriuZpUdCrAsWHXCDh2Ff9nhhCB8NpHqkJqjfyStixaPSBxAq
         JYOfXH+HkRLGSYUhN3h8u/FjdxP9zSDny6YOG6KT1E5d7X6cCYbTbKUx4tc7gyTaW7/N
         XDOAL7cCnX8nAhf8Q3p9jgElBIemfKIynDTC4cGuC+SffEMbrBE33ocQnX51wOrYLll3
         Uhr2cOSSO9DOSmsxF0SC0f2feH4Jt4QETtlYikSFIQ09hCTVWaGOOK5GzbasI8VKz1ew
         5+JlipmvSxJXREkbIaJzp8DVpZmOxM8jyMJuMQpK0jRdCXn5N0YbOfeyBSBcX4+be4Z/
         avKw==
X-Forwarded-Encrypted: i=1; AL+hErHzXelPBnGAXcd5/7EIHCzvwI/lj/ONAGM2ScRVLiVrXn7Np7gq+wgKBggU3MLPbTCNpRST8VeoQnq+za8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DdzjJpVhKrZToSDBJbBwqKG/dyLiZ/wm58xhHDVyxcu1W3rD+
	mR8Flxl+Ae2jqgNTpJM4E9afTcQgtut7NMCJMcj/8/AmUzRA/BdJmdAO
X-Gm-Gg: AYBFou2BaAh52au1XtWJwku4MSsZMHaCK1PfgNjjALYDMg/315fOvnmPQbEFusHQZa/
	QFkc1Ujgdb6+qAqEJ1w9GfCrwUYf7KR7VRXgOA2tBGH4A99Kts9gxnHBGTmD+zaIqlSJEPOkqod
	LSf0UesJclRR0Y35Gl9ma0d4Xj7BpeuRBjxmv/ghiVL6aV74WokUnCkVaj8den2aS3E/r2OzRas
	MPZm96Lpu1e2N0a0ZpX1Xw5dyzyNVmTjDvkSOhSuiUteHjDUJsrcDzwk+f7ek7bD7NwqURBiIPF
	+AiE4fVZfan0v7SPYuaPa9WXNyYGksKttJq2LVHyP8xmCn8aBXRidbPPkCD13sGzuE1X9BvMfq1
	sgvb50Ee55/K/0eYDEsmShxLTkSLh4rFiT0QBxIcKy5zbn+1KM/ysdfavj6JpUWjtULuyoE5FPI
	ar6MtQhG2ku+8WrUVmUsidD6to546FSN6WnNKWLAgjw8KbGnGQLZ/uSWxOKO+ZdG+QgqXl4a5SX
	VsSKWBUwFrmJM4EXl2hbRU3tWCMIvTu/wRgdLJzcdvtyYezCEFkYAJSiRTcB4cqmQNPFejvAxIH
	BQk/ZsX1RSH21HKkCprWqDNr61Idp8qi1psiTKUztBg8BYY6gzT2FIpQsCyFxQne
X-Received: by 2002:a05:6820:a711:20b0:716:e9e0:542e with SMTP id 006d021491bc7-718a528656cmr220220eaf.12.1794269020089;
        Mon, 09 Nov 2026 16:03:40 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa03dbeasm513036eaf.12.2026.11.09.16.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:03:38 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: yangtiezhu@loongson.cn,
	chenhuacai@kernel.org,
	alexandre.chartre@oracle.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 0/3] objtool: Fix undefined behaviour reported by UBSan on a defconfig build
Date: Mon,  9 Nov 2026 18:02:52 -0600
Message-Id: <20261110000255.1720945-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
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

An x86_64 defconfig build of v7.4-rc2 with objtool built with
-fsanitize=address,undefined (GCC 12) gives two UBSan reports from
objtool, both on the normal vmlinux.o pass, no unusual input involved:

  arch/x86/orc.c:11:18: runtime error: member access within null pointer of type 'struct cfi_state'
  special.c:84:18: runtime error: load of misaligned address ... for type 'unsigned int', which requires 4 byte alignment

1/3 fixes the first one: init_orc_entry() takes &cfi->regs[CFI_BP]
before its own "if (!cfi)" check.  2/3 is the same pattern in the
LoongArch copy of the function; I compile-tested objtool for LoongArch
but have no LoongArch object to run it on.  3/3 fixes the second one:
the feature word of a 14-byte packed struct alt_instr is read through
an 'unsigned int *', so every odd-numbered entry is misaligned.

Testing: I relinked vmlinux.o without objtool and ran the old and the
new objtool binary on two copies of it, with the arguments Kbuild uses.
The old one prints both reports, the new one prints none, and the two
resulting vmlinux.o files are byte-identical.  A full rebuild with the
patched objtool is also clean for objtool.

None of this is a security issue: objtool only processes objects from
the build itself.

The two reports were found with UBSan, and the analysis and fixes were
prepared with the help of an AI coding assistant; I reviewed and tested
the result.

Leizhen Zhang (3):
  objtool/x86: Move the cfi->regs access after the NULL check
  objtool/LoongArch: Move the cfi->regs access after the NULL check
  objtool: Fix misaligned load of the alternative feature word

 tools/objtool/arch/loongarch/orc.c | 6 ++++--
 tools/objtool/arch/x86/orc.c       | 4 +++-
 tools/objtool/special.c            | 4 ++--
 3 files changed, 9 insertions(+), 5 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.34.1

