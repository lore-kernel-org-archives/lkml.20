Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269029;
	b=RWyOtyqWlID891azSkQ2C+S6OIfrFsBmZyUukk/3oviTj5xXmnxsz5mzjbvSqxpnFeYt
	 YBMAP2oRtj5Nn8K6JPeMK2AQTtDDiHW8/vfeJF0RIorVDjHsqJ9jU/BcWzfligbR37gol
	 GfXR/rfZ2fiyV4dRn7wuF/iH+ghKw9ua/hz0ygxDX+QSghT1I4jJ8qe2+j2EJ6eLZdPJZ
	 x0x39PAMrq9t/gyT1rUj5jEtAD+8cn9QTlaLvxCVoFYwCZo5j7LJMAlCGlot0AqCCfI9N
	 rYRZw1l+gPizmwrfZezcbmAG1wo5g0Tnh0LSSUI8dJiSfikevNQaCDGBIhqyZShzMUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0PXwHeGALupf0331RmW1wRjuSer7MEVZbJRazHgd5E8=;
	b=aRnsj8rMX/VLemwbd4p6mGimEMXztzbRPb52DbqVgPaWxVxhqcOMhl9neDAaFY+b1mJu
	 5fl9x3Xm+mnpxER61rZjtsVROA/5SaEi3vZJNs0qQ800kBi7IGZqjq7g1q7DiABBJKilf
	 I9YfBvZGPNYfjiX2h3luuBIgHwnyFYZxbwn7G6yi2iZVqTk1WibIA4ZtHyaCObTXugz1p
	 gO1pgRZcqvM7W3v1HJwjO+SbFdH0qc5UZU3p+2hTj5HJTVBFpaabb4Ap24YC/IzctS3Rm
	 tcHivJEUOe3RdOIMsjkhDsMaTYIqfu7QmG+v1cGHdg1PSkNoeitxtJMJjsHsZ4QpXkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9HowOFE;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA7F60A2615
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA7F60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9HowOFE
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dd7070699eso858432eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269028; x=1794873828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PXwHeGALupf0331RmW1wRjuSer7MEVZbJRazHgd5E8=;
        b=R9HowOFEjTG8TGdzq3+2tEcRgrLzVCbjTymZUYGZ4QLvSUTDMIcXRG+BV1A/1+Gj05
         1NtNe35sCjjUUQL+HM+1pUELkk39asEBJn0cbt0EbMGOXi5TCSc9xgjYyGcRRdaZKjdM
         B+MznVKFtY/MtDmrhtRh0deMPuZgKMzMGsYBGuVwXPcOB5Ckhle7ocwtYipCo4a1q93B
         XRucLhPkDmEO3xYKPrHjTX+oRch/plQamSHjyJTQIgQg3I+DtPDQ+lPSfigPr/BsGb51
         e6xwCdDUSJX5T7YqU1CC0ZzBPQ0r7YJY6bOH3NbHePf9hvnlzkdVUPuAzejgEIzPiCI+
         MMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269028; x=1794873828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PXwHeGALupf0331RmW1wRjuSer7MEVZbJRazHgd5E8=;
        b=qB9FZWEXzUT1qAoZT8wDsf+gqTBwWZgJujEuhbaMQ76y5LnAV+uhovazJppd/WZyWy
         UzGbMzzqWuH2BpM8fO3QxVBP1X71R1De1BcEBtcQjOosfWZPz3LQstf8fLWi8IWp+qUw
         2lnZgxKtkVW0z6oCKKaE64TRemqb7AbceKMjSOpX2tgCapxRdOjJJ54O/10y0S3SOO88
         H6kz71cRaaVdmtM/GNBgPFEgXw5q+ghY2A7Mgj/XkAKEAtuRNqNrcKgcLwCHAof9j+xR
         rviSnbZDxdc093mY3hS2l5VmyheuWQM8vo/hlKfEk7PiOGqRAgg/yhOp2DDiLcISw1+B
         xtvQ==
X-Forwarded-Encrypted: i=1; AL+hErHZ1oI5Usee2XaDOzBZXQAgLvwEMhhnqjmAZM4KaJSke2xn3yWU623/YT4glKfYSoksdKjSdlHy7485MmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QpuwzSp0Z7uIqxH+p9+Nen2p6iTnMp29EgRNS6z15F5oxXezv
	jpoUqH0YPswnTUxgRYqYnqqCio8eS04kjwrpE7DdPVKRn1ocDDcoVkoc
X-Gm-Gg: AYBFou1ObYURZSq+pqVGIRpiyTs9VeXyHnOhL/qTKG5mCMkBquirgLc/Ml1rRmPCF8a
	GigndCjXSsTZYUC6slZTq9Z1HJzucio1Okd97MFNM1rruOyCl/PcAwzSe82TBZOV4slOI6mDwXZ
	lKzAc7sM/Jxi7q09N74x5/eKZTzYVUNTYRwoxi/rf8mEuDOWAu3HVOJJMDvh3x0Qiio3jJUSJ2p
	qnSw5QlgDh4BIl3KJJ74NpTHuo/imotm2KfB5az0zxOHjpxhZNQdOtAVuGCdYOr1YbSh0pgdBDf
	F8wGtD7nbdhbFsOzSbwUOeS/jPr2LxjZCEjrlJexcEKm5HjtjK2VUZvmPzQpsQkg/sP8vpU6Brk
	LlwSOtY4AvpQ/ng2xbBtCsx/AgtSUcMGfpGw/8UMHn5xTBTiz+DQr+jlrJ+f9MQ7bwuYrKkr4Ce
	ydcD70mafNtcEJEflRek1vy1qNdZmpGO2002fBWrnBnecLJSOUz8UNoHwSYqeStld/Uco7XEf44
	+7OTe5Ha4me1RUIpIMH0R+I2qbcpri5/lTOt8vEYsyLNFL2IpFfvnmxy8igj/ez8o7SViVBW+mM
	oE1h2nXSz2BKQHUd3j9EWFJq/bEClvZ/y3yK7wNmj5c=
X-Received: by 2002:a05:6820:338a:20b0:702:f7c2:1937 with SMTP id 006d021491bc7-718a7adc206mr309940eaf.83.1794269028466;
        Mon, 09 Nov 2026 16:03:48 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa03dbeasm513036eaf.12.2026.11.09.16.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:03:47 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: yangtiezhu@loongson.cn,
	chenhuacai@kernel.org,
	alexandre.chartre@oracle.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 3/3] objtool: Fix misaligned load of the alternative feature word
Date: Mon,  9 Nov 2026 18:02:55 -0600
Message-Id: <20261110000255.1720945-4-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000255.1720945-1-lzsx618@gmail.com>
References: <20261110000255.1720945-1-lzsx618@gmail.com>
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

get_alt_entry() reads the feature word of a group alternative through
an 'unsigned int *' at offset + entry->feature.  On x86 struct alt_instr
is packed and 14 bytes long (ALT_ENTRY_SIZE) with the feature word at
offset 8, so for every odd-numbered .altinstructions entry the load is
only 2-byte aligned.  That is undefined behaviour in C, and UBSan
reports it on an x86_64 defconfig build of v7.4-rc2:

  special.c:84:18: runtime error: load of misaligned address 0x52e000018416 for type 'unsigned int', which requires 4 byte alignment

x86 hosts tolerate the access, but objtool may run on hosts that do
not, and the compiler is allowed to assume the alignment.  Copy the
value out with memcpy() instead.  Running objtool with and without
this patch on the same defconfig vmlinux.o gives byte-identical output.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: be5ee60ac554 ("objtool: Provide access to feature and flags of group alternatives")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 tools/objtool/special.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index 2a533afbc69a..5df169d0e45d 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -81,8 +81,8 @@ static int get_alt_entry(struct elf *elf, const struct special_entry *entry,
 						   entry->orig_len);
 		alt->new_len = *(unsigned char *)(sec->data->d_buf + offset +
 						  entry->new_len);
-		alt->feature = *(unsigned int *)(sec->data->d_buf + offset +
-						 entry->feature);
+		memcpy(&alt->feature, sec->data->d_buf + offset + entry->feature,
+		       sizeof(alt->feature));
 	}
 
 	orig_reloc = find_reloc_by_dest(elf, sec, offset + entry->orig);
-- 
2.34.1

