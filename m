Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF937A846
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846703; cv=none; b=aV9XEvDevwz6oB1GHWRqKbAUZlIIqmuTvdl76eyjYSdsPNr9/S/y5xh2qD71RNuLPpkqL4waLb1p5WiRATogyoZd9QiarXbV0cTJQ4H6PKvYaFjI2clgaajsA+fc3jbKY5O6HRjwlJnpl9fYgj3zVYNJYYtQqelcJ3Q45clcW7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846703; c=relaxed/simple;
	bh=TWQCqQZ3uXI5BozZg6a+SHVZQfLS/RM7NyQOd1gRU5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n87qe3rtHdt8L6k6n6UqqoUqVr/IWUV37BGhKq7iXiF1f3g4zP3bjJKIh0TI4qyBwebK7lUQlKEPtjVgZp5wXsDnVbPFka4BnRt+3xatB/7UDZnhLIpLRSfTzmAz9jNBC9NETuZYUUZqu3e3aBFzXDf9KoDA373weoXIlc7yVzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjeU/FSy; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjeU/FSy"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so2734977a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846701; x=1789451501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4gh5k6ECBQWHxt1QP4VjfRnV+K82E4kkpVh09p6XGw=;
        b=gjeU/FSyigNeyI3Uc5O2M0cM6iu/Hl/vZ5SgAgmoCIzldbYl6joLTyYP9ad3PxKCnn
         u00QRdXmJNMaENqlVTy67PjeRvZ4PhvNu7nlLxADtnreb8e1+PFmT8KdLFRVK4mHgJjT
         7BjJCyLxb9kYcvjBJ3Iv5obsUSENu3hZUh8PNrlkYNONb0kmxOnWi9itBB3ee7EiYPN4
         KvzpkwufAMowuIf6e4IyRe/6OmkVR3/VTKtYP0+L9CwcGqHgQ8VgV9S78fSgl++bpsJy
         NEvo+75MxlMT3XGB6/ohqZ2y6mixWnAGpaaqJqVRE/GFJFZ19rikzD0rNhUhx/bZji7q
         u+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846701; x=1789451501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4gh5k6ECBQWHxt1QP4VjfRnV+K82E4kkpVh09p6XGw=;
        b=TnInap1Fdlg9Ozjg9rQay8ZyLRANlEIJzdaPXD9dR61v6wvb1n7zULMGi5448nzPvS
         Zwr+r3nzO8q1grdPe93jLV9RFBGMbKB5fsCHlQuj6Oe1SJlzDfQohqcyV6Nmw0mvBdQi
         La+aReWayJXTmTErkxGmbvVnW4c09vapvKCd1PEihFm23c21gw7WaD1dDfRgtCJ8Z3Ub
         FqGtZnpkLk5xPbdspCr2ob7yF+bZVicijz/0KZIU+/cYJfdBQ51EWJRXm3djSROddWPu
         kNN8QIfei4nl67gzRxPfJPNNtghWYrZSH8/UtLO7RCJmWTavtAOrn0wxgf23Uz43TZS7
         wmYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb78KzRyP19l9q0WHkXal13Ph0wT4HoZ/Fipj3bEOq10IPfdn+2cvt9/iAepp7726NHynJrD5ipfYTwh8=@vger.kernel.org
X-Gm-Message-State: AFuF++l21rGMBcTOZdrfR7tkyV6/2TSERlpZKgnFa7vODd2YT9FMDpl3
	nUnfTmY/vdz+W2F4PbtGdQLg7hSIAyWSheHhgZvFRFDgQncLA4G/UVwo
X-Gm-Gg: AYBFou0ZObh2JXuu8jFe3Lhzw4HEU49t3UkkEMv+xl57Mg+2N2kVJgQtbQFYEk030Z9
	rlno03u8OONXsnctHnnZWV4ggr3FZN432qX70LAoNd+p3TuvISSHlldX13txbxPXYVlT1InbwCl
	XG+9oPeKDRh4E293cJ6k1kHsbSMVn+pts4igm5X0IqnXi13wwEBZEZKRUkasqRXK1WxszD3VUEJ
	2nT82ofhPgDM2R0UjLFcvnpqosnYwr8l8gWarijzAgxlYjO1xAIOtqr0eYJSIvVp8U1YS9arqbp
	IK2gO4dpxUbRL7PmGuTL5QkiPzqhHfnpyhtAZY8/9iKZdhxe5r3WtonamdBUl0aUJkVlXbFVIek
	WV/+EOpR1IqtX9yTRqupQ9tBV7QNkkuf3nBnRviuNgTTLSmt3vykLk4f0kFFUZFfVpJD3YAeNhz
	IygutOorV+IvOqhtAq21+werXgys0g5FPpVEt5VT8f7t7w+7w5jFSgZ51EIOhJgr3LlzfyVTfmK
	gNRMX3ap5OE5MFuhzKfQ94M
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id adf61e73a8af0-3da3a066ef5mr43666492637.19.1788846701101;
        Mon, 07 Sep 2026 22:51:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm37719041eec.7.2026.09.07.22.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:51:40 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Geoff Levand <geoff@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] powerpc: fix typos and repeated words in comments
Date: Tue,  8 Sep 2026 11:21:31 +0530
Message-ID: <20260908055133.16469-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings and repeated words in comments, found with
scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
Comments only, no code changes.

Changes since v1:
 - dropped the drivers/net/ethernet/ibm/ibmvnic.h hunk.  Andrew Lunn
   asked for the networking change to go to netdev rather than through
   the powerpc tree, so it will be sent there separately.

Hemanth Selam (2):
  powerpc: fix typos in comments
  powerpc: fix repeated words in comments

 arch/powerpc/include/asm/book3s/64/mmu-hash.h          |  8 ++++----
 arch/powerpc/include/asm/book3s/64/radix.h             |  2 +-
 arch/powerpc/include/asm/fsl_hcalls.h                  |  2 +-
 arch/powerpc/include/asm/io.h                          |  2 +-
 arch/powerpc/include/asm/machdep.h                     |  2 +-
 arch/powerpc/include/asm/nohash/32/pte-8xx.h           |  2 +-
 arch/powerpc/include/asm/pmac_feature.h                |  2 +-
 arch/powerpc/include/asm/prom.h                        |  2 +-
 arch/powerpc/include/asm/sfp-machine.h                 |  2 +-
 arch/powerpc/include/asm/smu.h                         | 10 +++++-----
 arch/powerpc/include/asm/task_size_64.h                |  2 +-
 arch/powerpc/include/asm/uaccess.h                     |  2 +-
 arch/powerpc/include/uapi/asm/bootx.h                  |  2 +-
 arch/powerpc/kernel/eeh.c                              |  4 ++--
 arch/powerpc/kernel/eeh_event.c                        |  2 +-
 arch/powerpc/kernel/exceptions-64e.S                   |  2 +-
 arch/powerpc/kernel/exceptions-64s.S                   |  4 ++--
 arch/powerpc/kernel/fadump.c                           |  2 +-
 arch/powerpc/kernel/irq_64.c                           |  2 +-
 arch/powerpc/kernel/paca.c                             |  4 ++--
 arch/powerpc/kernel/pci_dn.c                           |  2 +-
 arch/powerpc/kernel/prom.c                             |  4 ++--
 arch/powerpc/kernel/setup_64.c                         |  2 +-
 arch/powerpc/kernel/signal_64.c                        |  2 +-
 arch/powerpc/kernel/smp.c                              |  2 +-
 arch/powerpc/kernel/switch.S                           |  2 +-
 arch/powerpc/kexec/core_64.c                           |  2 +-
 arch/powerpc/kvm/book3s_pr.c                           |  2 +-
 arch/powerpc/kvm/book3s_xive.c                         |  8 ++++----
 arch/powerpc/kvm/bookehv_interrupts.S                  |  2 +-
 arch/powerpc/lib/copyuser_power7.S                     |  4 ++--
 arch/powerpc/lib/memcpy_power7.S                       |  4 ++--
 arch/powerpc/lib/rheap.c                               |  2 +-
 arch/powerpc/mm/book3s64/hash_native.c                 |  6 +++---
 arch/powerpc/mm/book3s64/hugetlbpage.c                 |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                   |  4 ++--
 arch/powerpc/mm/book3s64/slb.c                         |  4 ++--
 arch/powerpc/mm/nohash/tlb.c                           |  2 +-
 arch/powerpc/perf/imc-pmu.c                            |  2 +-
 arch/powerpc/platforms/powermac/low_i2c.c              |  2 +-
 arch/powerpc/platforms/powermac/pci.c                  |  2 +-
 arch/powerpc/platforms/powermac/sleep.S                |  2 +-
 arch/powerpc/platforms/powernv/opal-memory-errors.c    |  2 +-
 arch/powerpc/platforms/powernv/opal.c                  |  2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c              |  2 +-
 arch/powerpc/platforms/powernv/vas.h                   |  2 +-
 arch/powerpc/platforms/ps3/platform.h                  |  4 ++--
 arch/powerpc/platforms/pseries/firmware.c              |  4 ++--
 arch/powerpc/platforms/pseries/papr_scm.c              |  4 ++--
 arch/powerpc/sysdev/xics/xics-common.c                 |  2 +-
 arch/powerpc/xmon/ppc-opc.c                            |  4 ++--
 arch/powerpc/xmon/ppc.h                                |  2 +-
 drivers/tty/hvc/hvc_opal.c                             |  2 +-
 .../testing/selftests/powerpc/tm/tm-signal-msr-resv.c  |  2 +-
 tools/testing/selftests/powerpc/tm/tm-tar.c            |  2 +-
 55 files changed, 79 insertions(+), 79 deletions(-)

-- 
2.48.1

