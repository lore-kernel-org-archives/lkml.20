Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753617;
	b=4LXmPOHK4UW4BWjHSct96kE7CKYmZqc9lxNgNFql8q0qTQDiDPWcvRD9Qm5sWnfTMB4B
	 deP2cQg4nJ+UW2AgVgWYnT/jrrCfK/unwhan1XP8raspanDWm9mGcxg/yPjnWMOqbCUHT
	 dMwdnI4lkLbMTpRxCdA1AsKgGI7uHfWIKCruVdcxnSJ91/ud881iUEci1X+Vw5tMCDUA9
	 KbDkCTaD7WeoZ+pX3Ze/6Sh7DGnFSDoW4smCeVoo3rFWCSfNoz2/6xghMA7peWenGD3gw
	 OvjhbHZ22ynMcs96GQrSysZTbRR1HU3IGPGm+g9MqWOhsoGwwBuMSMpQ4DG8yARnndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UZsXZ02nbL2hg22ERdNFzFlplemnVF9z+ZbjZ8pAabY=;
	b=LWZWy9mFC4NFKFvmlPOuWifqZUF37vtRhYuVOq/vp6PFuuyvORaJRrWqsMaThWBmSdgO
	 FZiziAh3d17ANv/ZjLpoU1I5iqFyBg95VAOekSUglQ/CC+r0d+g+BZmI2t2X8GLRpXIhm
	 u4FuKztJeA+Q8xVpuau07KxZhp13S83USNn8xACBNWp1meuvJztE9KZs94xMck0osgG42
	 iTL5VDdsza5YD1vn54LktjNTLulbhSeKtPh7YDqWoTl3v2Qtlt2dIV6AdMWLrHFbEB3IR
	 9qyUQe1IYu5pV8d7Tbeh1Z8Kry70YE6nUSlOnzL2yI62Hb/ZO7zgVwhenpf7Pbcux4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjcOfRTY;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271C606D824
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E271C606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjcOfRTY
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so1093535e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753615; x=1794358415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZsXZ02nbL2hg22ERdNFzFlplemnVF9z+ZbjZ8pAabY=;
        b=TjcOfRTYOnaF+fOvHhHOGPjpsJdmuosoa2/QZ1zCe1qZlPGuUGnXeIRnPMpcbIphfY
         ymW6e/Uh77Si8NPNFZXMdyguMNluO5K2eb9odmZrG/ELTvfloIscxI58JAohA6+i07Fu
         trbTj3c1wQDLPg8cPU+WBNOIoLfSAtCBmlQwEQ1sKBu6lafcmxO+R8Hz7+YTmt/r5Tqs
         slmyDiN/gwg8Q4bsfIZhCzKQ/D5vSJNghPa8keSe64dFYmtITRs8dKKfRGwtJlBoZHQa
         a6mF2cmserdmD7MU2tpknr6m0WdQImD0F2XtACoqf9JXSTAtZfl42CbCh5zOyLo9fUVV
         99gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753615; x=1794358415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZsXZ02nbL2hg22ERdNFzFlplemnVF9z+ZbjZ8pAabY=;
        b=CBmsiqg3MvZSTsHy6kIPc6Oh1PgwXEdIa6wUEir/PWNqUdJEPRte5L0ku7R5662qEs
         qcTqQgNKyXAoI4js67odIgXncvxonsiOWZlSuScFwGudnFAhug+s4/p0zF6BuMt2tcHQ
         Q/3PtsvgP8MjgjtgNRRMPDuHi8ddgCeO5m6PA8vqpcjWiEVn7GRXb5rA5zW9p2ZpS+95
         58GuxjXVBRQUdF75reLtE2D95tNUa9zU2VWftMgtuiyhsHeRG9aocY86z2HEVjZ9a/xM
         u14hOsPVxya/7B6uJGsZn17Q3uWJ4zXsgLTthSUjdI5IorpqvN0LXIR01ndekD4MiK5H
         XPfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnHYsvuHGKSrQjHXQDrebspNaKt39p2e+xjcpihxjlXaYBJcDAkpmGbDeBvPjv6jwhFQpo8Pn2XaTcPx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S/1BfUG2UjLKLc81pd+sV6l03XXvMrcgzhlONINoBOsnTReXF
	oi8GCcHLH7ur6vDAEpjCIg13wtKvbAMyjGxwCcPTDlXqdenn2kZoZjIU
X-Gm-Gg: AYBFou1df8SIjUnjf9bPf8dha9oZA2+gWltpnv37mHSayyyOvcbTn4EJxXl0BLzYOy/
	rLabZEdctthqxmtdEgBMGiTvS2haY4Gqkj9dY3q7Q/7wk/EvuRy3CoIxVXfDHUWfFdd8nXN/dRd
	NlOBtr91k0uNTLp3WSzlBKatEtaMzKofMmGjghKnMK0Vkf+N7htWwt8rhHb85vp+UxX26dnpl2a
	znVsmBNx9822zro//yrb/VW7zu0GtqNlDQgua4wZLi2WP19lugCjKkyoMDWL4EekgRowrznJi9G
	YMydTY8pkmSnmHwhKDNeS7p2DGyDLL3IlvDlBI7MAKiM2PNDJfY2PSpNMqKAdheY/9FVwcV0LU3
	D9LuwS0oBG412U9pprsTFEuJ6BOFlh8KHICe6a1uBdiQvv71plh0KSly/LzBRB1nL6R3bNZ1DMJ
	Fx9hGdGgkccRzdp+4SZLv/+gHRRmudNXoGFUyNOJaq6xVMyVhOs3ltrkaTGfc6vuzbwvxGJHMLs
	Yan1f9nE7qwQGttQQgI1q5uOHAmh/hyz+qWMbbqcdYQcbM2+3yWEdPSFQKrpuheBGT1ZbnrsDlx
	OsienzCOY98CNog/AeulPlxel6znXr/QVHNB03H9y81pRDGADtQKo8OVdji9k0dDOzsbyS1eN4e
	NNuD14kxROC2SFoWmUY63o1rbqsUiGb2vx2VZx9y7YLP7rstNthcTYlzJq+qahjtYjw==
X-Received: by 2002:a05:600c:3f0a:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4b3c3545341mr36673425e9.20.1793753615281;
        Tue, 03 Nov 2026 16:53:35 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ed95sm11899275e9.4.2026.11.03.16.53.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:53:34 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Mushahid Hussain <hmushi@amazon.co.uk>,
	James Houghton <jthoughton@google.com>,
	nh-open-source@amazon.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/5] KVM: selftests: Declare __tdp_map() in the x86 processor header
Date: Wed,  4 Nov 2026 00:53:30 +0000
Message-ID: <20261104005331.50600-5-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104005331.50600-1-griffoul@gmail.com>
References: <20261104005331.50600-1-griffoul@gmail.com>
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

Tests can only map L2 memory with 4 KiB or 1 GiB pages in the TDP page
tables L1 uses for L2, because only tdp_map() and tdp_identity_map_1g()
are declared. Declare __tdp_map(), which takes the page size, so that
tests can also use 2 MiB pages.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 tools/testing/selftests/kvm/include/x86/processor.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 5898a277a2e0..66293e448ab2 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1613,6 +1613,7 @@ void virt_map_level(struct kvm_vm *vm, gva_t gva, gpa_t gpa,
 
 void vm_enable_tdp(struct kvm_vm *vm);
 bool kvm_cpu_has_tdp(void);
+void __tdp_map(struct kvm_vm *vm, gpa_t l2_gpa, gpa_t gpa, u64 size, int level);
 void tdp_map(struct kvm_vm *vm, gpa_t l2_gpa, gpa_t gpa, u64 size);
 void tdp_identity_map_default_memslots(struct kvm_vm *vm);
 void tdp_identity_map_1g(struct kvm_vm *vm,  u64 addr, u64 size);
-- 
2.47.3

