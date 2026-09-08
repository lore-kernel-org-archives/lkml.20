Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3025B087
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846563; cv=none; b=PcSqSvgnAAH9f0QyWxQBe/dvMaWpxNppbZYLfhCpMFS/UKOcQG3273fg7sxaRQqwU7NT9dEfECx4EzKIrIsgwkj1VkMnvrOgQbf/g3mRNcgkrpfUgSp0fSe/BHO9Yhz0KIFSIYOBA+X4qT4+ByW+tc0soTznY+3nZtjUxT7eFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846563; c=relaxed/simple;
	bh=2mvaxqGopCRhkYAdDaBFx3PErCGUyuXy5ePpn4QaSbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3R2oZE+B7SPkSZlSBL3RgGpUQUOvPVw+OwATJnSEp+9UYoVjcPAYn9rhHNkSM7A5T50Cw9HgwgRFn8eMd5xGqJMY6VQbV1FCeXG74p9oM1B/O73nB8RnwFK8jHTemXhJXDD6HKWXRmj/D2anQPpFeA7U6SHTQxCMdIZHIWoL9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQPplZog; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQPplZog"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so4389871a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846562; x=1789451362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC1WWh/xuFVa+YUjJaTnVEkwteG3jK4MlszJkiclU94=;
        b=bQPplZogJaNm8UQYmqF/MtB5XSlev9/jaDUxPqmDSrwMDSV4orETekXkJQlyWCDTdk
         tAl7PRNN3VYdlnd8IkCCAeN2gnaqJ5VLKnRhtTXLPJSxIdCxkRo398a8J/ny+vrSRRJk
         xclYDB00pAjZIJ8PC2qb1iku0uNJc8KoF/ZM3jfrImmVdVBPclrhuEh8hW+xCrPH7f0I
         Cs9tvsuLNyhfizCipunMgaKe1t8Fed1wBsg73kjRYHHeJU54LcC883I1lAbsIpjdwCOR
         jnj7P1BgdSDTgP5YX9vIRtcNW31C8WPEo3nx2pGKPhLf2iqUCKwsV8hPLDdtCeWjsLWK
         T+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846562; x=1789451362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC1WWh/xuFVa+YUjJaTnVEkwteG3jK4MlszJkiclU94=;
        b=pr5sONO1SOkXfNCMkoT0obV2d/+XpwT07Ro7sHtTJdnwVtE4Jtud6YLKgMR6Zz5s5A
         SDqzjIDhSb52LVPg2mSYeOlK+HhXj7MjsWee2q2wdO/oPmdC9Aswq6K7iSeJqlpc2f9D
         ZylDilYzMtFdbGTmDSFTfoU7lxvY/PmEmXgBB0bEe5g92q4ln6beoCw3pe/Rzse6oI9s
         0jOg/HnYq5xZumOAG7Ng6JCXOz6gLpWYAVMm5rqeo/HNVuySgR4jrQ7LgHBnDb7im0j2
         d5lEsgEhruik61QqhVxL4hCttl80dsNBdvElD2A8A0HdwTpuH/IXATL5clOqqUpmEVGp
         ID5A==
X-Forwarded-Encrypted: i=1; AKwUvBz8lwrGpqzTZiRipnD0SifxO2k87b5h6chpBDj6yDYT94mNlDLfZEK4tb+UXAlBrAMihrujL87RXelRxs8=@vger.kernel.org
X-Gm-Message-State: AFuF++nlHC1llntd75Hi6XrkPE0HNgF1qxblU5DwSmXXocRfEd+bWbHP
	dILW/L1TzVwN0Six0GJt6PUU9W7xZ7PRZIGGVy3VVz58hzlAQk/79cYj
X-Gm-Gg: AYBFou1TVNBzHy6QgFEdxxhSlCyS8Id7hnPljceko216rVzxDK2ZZ865XCQMISUa2Mm
	d3IdP/38o0FexkD50aA00vAveFpFyeJQQTRHqdpvEoog3Db6ecCIConA8utr+R5Bc7MecVxfV9S
	HIBAZDOx6+L4Lr86g8KD4sR1DdNkjXhIELTWGXRQ1ifs9cTBYH7/2eDO9tNWJz6PI4v7SYQgiXV
	lmXcy0SKIJZurdjy+ewXhWud7S6vWbM6Cf4rIXQlcrduT+Mw+uHgGeRdLaPfXQ6VdH9AsziFxeO
	juVmX3/W5BDA3ZIxirUwrP3PBR11B5Il192dnP2Zyk0sKG7byuvKZKSmVjsY0ydjJCiQfJqGraN
	FsEPbIxyLB3bMFHPOhDikJl6yoZ87CSAQ9KSkE8a3pafGNwIcgnpeUU3hVzmvzZKI3l8WSBIYoM
	iBbelEznUPOzc30opcsdHcjICbsFCe3MVgMJgv8Ws/s5cOhb6XV113WgkDbSAFi/rR2C3NVuzIb
	M6gvoxgCLvKdzUAD1qwyZie
X-Received: by 2002:a05:6a20:4393:b0:3d3:af66:9f61 with SMTP id adf61e73a8af0-3da3a16b389mr43628321637.27.1788846561929;
        Mon, 07 Sep 2026 22:49:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v4 2/7] bpf: fix typos in comments
Date: Tue,  8 Sep 2026 11:18:48 +0530
Message-ID: <20260908054853.13820-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/filter.h       | 4 ++--
 kernel/bpf/reuseport_array.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index 00ad8b63aa47..4eff6e601b05 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -147,7 +147,7 @@ struct ctl_table_header;
 #define BPF_ALU32_IMM(OP, DST, IMM)				\
 	BPF_ALU32_IMM_OFF(OP, DST, IMM, 0)
 
-/* Endianess conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
+/* Endianness conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
 
 #define BPF_ENDIAN(TYPE, DST, LEN)				\
 	((struct bpf_insn) {					\
@@ -1029,7 +1029,7 @@ static inline u8 *bpf_skb_cb(const struct sk_buff *skb)
 	 *
 	 * In some socket filter cases, the cb unfortunately needs to be
 	 * saved/restored so that protocol specific skb->cb[] data won't
-	 * be lost. In any case, due to unpriviledged eBPF programs
+	 * be lost. In any case, due to unprivileged eBPF programs
 	 * attached to sockets, we need to clear the bpf_skb_cb() area
 	 * to not leak previous contents to user space.
 	 */
diff --git a/kernel/bpf/reuseport_array.c b/kernel/bpf/reuseport_array.c
index 49b8e5a0c6b4..4de08abfd94e 100644
--- a/kernel/bpf/reuseport_array.c
+++ b/kernel/bpf/reuseport_array.c
@@ -207,7 +207,7 @@ reuseport_array_update_check(const struct reuseport_array *array,
 		return -ENOTSUPP;
 
 	/*
-	 * sk must be hashed (i.e. listening in the TCP case or binded
+	 * sk must be hashed (i.e. listening in the TCP case or bound
 	 * in the UDP case) and
 	 * it must also be a SO_REUSEPORT sk (i.e. reuse cannot be NULL).
 	 *
-- 
2.48.1

