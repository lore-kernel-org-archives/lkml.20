Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720200;
	b=ZIjj0ACkLz2PUn6ueDuItYn59DQJVsYXX4WW6ww7Eeb8a3g1gjgfpEEPPLtanvGJ+8y2
	 zzYHdsMA1svyKTMPUPlbUvDtgRlgLXLzX7QTT7m/XhmhulC503Arbm5XlEZSQLvrnl5iv
	 gjUXmXNKqb2Ja9NrHgcTjabl9/qjDfnrXcTl0XdHnGGJvPKPQLQ6HIsqhlKD5CJkKTrrh
	 mRaCGAaX5fOvQaw1O88lnA1e7x1afUiybwxEovYx4gYerPR8vrrZDD34RcXWSxarU1GmS
	 VoICxUcjjEAwahDY6wZe7z2cHMdzCz7PqUSSaWp7287U6ufHEqxzL75eFvrH+ysW5oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=+p8cIpnt0YjLXT/3n6WuKQxFq68+6JJEn3PVDsIrB3s=;
	b=w8AZOYgN5f+sgYP6uHO/auRTISzjx5O91pnmLm2OIOvWX/zWUw9s9MoZsGbHwyT11R43
	 CsgjLofqpVUIbx3gMEatoY31ah/94vwxotlZI/B06tjHskbY2vDv6MM/Q6DwD4TiV6sVZ
	 c8xNi5FfCJsYjAdVnoUxNRObqNGaY6xK93vulG+a5dsT1Lkm2dmap6HSJiX3aChmQPP4s
	 6bqSCJAv8WwyYneEnp7ab8Omu5EtvoXH+WmtGgRWAW6xzq7yOgrzJQfKKVTlXQbvdoznh
	 Byunl09l6k86fyzp2u0tCtvTABhF5bsic/1oAHwyn2k8paSqOuhW5EHA5neEk/NBdJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PHs0evTi;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C956606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C956606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PHs0evTi
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-354ba08cfd1so725994eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720198; x=1793324998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+p8cIpnt0YjLXT/3n6WuKQxFq68+6JJEn3PVDsIrB3s=;
        b=PHs0evTiNgq7bTCxWxmObhVX3ilYIc4d8fs7f6MAKtrZpjcCuj6KvG4PaaNKaCq5OP
         vd0bn33Vmr/5vjZ/OgMwLA7+m/y+AGHg46jurwktN5DTEhdbX3DBjeLk8QkRfaS6Aao/
         SbxIQWUMZ+xqre+Z3Nwo7JAlI8CQdOX9RJEafX7unWxlJsUhZF2Re1wNvzkWBo3YVvyC
         Sm2ZJFfP7nSxLE6xo0DC+Zv9m19JmbCRS5JuHSkwa2zpHDknf5RDPlTYWVx4aNCFPsZk
         93M5iuKr/eLBeRBe01Va3QWhV75VKJ3DHKUbvSiL1d+g0P04+8WVrTfCeFmzkCI3PQUc
         kYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720198; x=1793324998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+p8cIpnt0YjLXT/3n6WuKQxFq68+6JJEn3PVDsIrB3s=;
        b=Zspcav0/Lsdjmdr7FMz6YfuoElW3riZilWH9pIDQ02GYCVXQ0465gxyQnlRRqCf0IW
         haHbRMGgeZjXYd2wfvo8quPaheGNCS0wLWHZ1duPS3LhbJ/rolv5qq0UHc+ihDqEYtwf
         PZdy78YiqTGesvhQXccJdoDEsk3F1gj9zNR2V+n7+I0n5qIiBAV/IxbjWKfhxDS22+Mg
         h1UMhE/chtNATEmp7igW0Oai1w1vqkzPcvQINmhukFyA1hmSwEcwypt9dB/9RyzXF6xJ
         /UgvVQCcqGAAc7d8Z/iabinkWUezlPrdNOt6mxCGhtj6WhwvwwmhRX6KCDaJyAIpNwUq
         y8zg==
X-Forwarded-Encrypted: i=1; AKwUvBzht+El9SshznSRAtptY/8aJj1GWblB3pUiBVsP8j4J9I5j6EV+TWZTQgks1Bh1hruZYdTN/6dbks+MFzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBSU38c/zLi2PSsKPNOIC8rljEV1P7N/gy3mBi21wdCQ+DcUOo
	cgK8FsdeIdZ4AsDgxhqlNURlxuNe9/yL3kbIDQykT/kJyV+EDVMFQBY0
X-Gm-Gg: AYBFou3pk7gObUsCaVN9XLLKLL9c1JS8S/lvVTyPjumZwGQsNazc6SbiyvBiyTyoX5r
	gZczJeIabEOLEwW8R9YE/Hrgi8bdeLhXfCt8bjDIjcwjtdrastfpkecLURKxcOGH0nTUfRYMvXk
	UhlFX3ynNekn1/pfR9ntsP2ZACRyY1UoZVE+E1zXwwlfbIjka8E3pwSoCXJBXMDTj4nhvF/8gQD
	RZ1MmFQnkjr2BC220Z4pfZ5/Nm03KdB3vnYkB6MYfl9/Eq91kaTRZA0NGyt0lGYv5A4whulZAVd
	hCd9a9Nl2dyDWvuG5SuP1gwpbI+Z2Y6LNSQdovMGNGLQYBlBb0etEtswiN7hFFEgqCMtf78Blg8
	k0Jm/QnrvkQdwoxZx0PytC9nG+YQ2aR5Lzg3KWrFaurP98lIY2Zw4oI2qCWp7MWjavAX1OFGedA
	0NCMdgp7oJx9K4JUSDD192AC9Dd2VLm0X33ytb80lKb6qRtY8w/Ic6BHphtNwYdAW2b8T06oeRL
	/NgON6u99hz9UVi42GHXn1FT/RcUXKea+EDtZV3IqVesONEqUc=
X-Received: by 2002:a05:7300:c00d:10b0:35f:4780:518e with SMTP id 5a478bee46e88-369d97155f0mr1233857eec.16.1792720198309;
        Thu, 22 Oct 2026 18:49:58 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm1971091eec.2.2026.10.22.18.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:49:57 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] word-at-a-time: let KASAN see
 load_unaligned_zeropad()
Date: Fri, 23 Oct 2026 09:49:47 +0800
Message-Id: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADu92moC/5WNSw6CMBBAr0Jm7Zi2khJdeQ/DYqQDTBRK2oofw
 t2t3MDle4v3FogchCOcigUCzxLFjxnMroCmp7FjFJcZjDJWK33E66PDpw8OKSFhkoHxw8FP5PB
 GkUak1pRWldYyW8iZKXArr21xqTP3EpMP7+0465/9Iz5rVNgaTQd2lsqqOncDyX3f+AHqdV2/W
 tfq3NAAAAA=
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0

load_unaligned_zeropad() is inline assembly, so KASAN and KCSAN never
see the word loads that sized_strscpy(), the dcache name compare, path
name hashing and x86 csum_partial() do through it. While reviewing a
strscpy() KASAN fix, Peter Collingbourne suggested checking the first
byte inside load_unaligned_zeropad() itself, as read_word_at_a_time()
does [1].

Patch 1 adds that check on the six architectures that implement
load_unaligned_zeropad(). Patch 2 adds a KASAN KUnit case for it.

[1] https://lore.kernel.org/r/CAPQLkRhXZwozmfhNd_PEx1ihwdH1_5qthP6PANYJ_m-v9vfQTw@mail.gmail.com

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Call instrument_read() instead of open-coding it (Andrey Ryabinin)
- Keep Marco Elver's Reviewed-by, as the check itself is unchanged
- Rebase onto 7be4bc52fd9e, which drops the big-endian branch of the
  arm64 header and rewrites the s390 load_unaligned_zeropad()

v1: https://lore.kernel.org/r/20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com

---
Qiliang Yuan (2):
      word-at-a-time: check the first byte in load_unaligned_zeropad()
      kasan/test: cover load_unaligned_zeropad()

 arch/arm/include/asm/word-at-a-time.h              |  5 +++++
 arch/arm64/include/asm/word-at-a-time.h            |  4 ++++
 arch/powerpc/include/asm/word-at-a-time.h          |  4 ++++
 arch/riscv/include/asm/word-at-a-time.h            |  4 ++++
 arch/s390/include/asm/word-at-a-time.h             |  4 ++++
 arch/x86/include/asm/word-at-a-time.h              |  4 ++++
 mm/kasan/kasan_test_c.c                            | 24 ++++++++++++++++++++++
 .../powerpc/primitives/linux/instrumented.h        |  3 +++
 8 files changed, 52 insertions(+)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20261019-bug-word-at-a-time-zeropad-kasan-af2460466ee6

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

