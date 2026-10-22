Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683597;
	b=TIYyeCWn8vdej+qbcC1RXbuP29qfyHCVXKX0an7cF1K+/ESsDYSwsiqgug3Clu0iuPvV
	 C/zqg/UUZDCK/ZuBbCuApFAyNKD5DMhjYZdHMlH2A7OS6Q+7bxAOYtyIGpwE38OCHNmyX
	 t4G54Og0EC5ET/hLEdg8LhPHKhyAlReEF8Mkl7c/Q7EM28I3kiS/DpsqRrcpCl2y7ipyd
	 Lh32UpIS4drYvokGYophQRi+sMQ9BoVcmWrtu7Pdw1dax2luRbGXL6igMuNY4VFvngtgS
	 eDDuAQPqK6UKVUPRpU3fPbyYW6feod+vABi1SYCRmWVW03hAGl49EE1x2Hm9ytBDnLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9PRBt6CU99Tgp/PmrNNizxfLM+x8gsCayxEXcNPrw6c=;
	b=BO3LMZEv8+myBNF8jov5ggeui3d+hD0Gqh722N7uUk4IlJkP4LmGczf2xPvBULWVLtw6
	 Wi/+yHnQcwqBR1PFssJRHeVdT1C5Tma8a8aySoJNn6N9UC6XwddzCjd5VQLGVT9wfPbJ5
	 GrCORzD7WpiO/sU/9eyghh7qEefDwVRQ8Eh5M3AMlLbDlTb74bJ1P+Em9czXf44LGpZUg
	 tDDIpOvxb7e8D2XVAu7Baleq03c6vtuBrParRP/RKgRmFHQHfqd5FkYK2WR+kWEYm3oL6
	 wDdTs3R5yOFkLKUeaANJ05zSq/0kWl09dw0rbRWN2y8hRNqGdDzeszulDERyx4XgD5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gwNC7e+7;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF02606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF02606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gwNC7e+7
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9178aabd30dso90736d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683596; x=1793288396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PRBt6CU99Tgp/PmrNNizxfLM+x8gsCayxEXcNPrw6c=;
        b=gwNC7e+7NzQRg4fHDHwXLCiShQBYZmOKhlIS7e0HLIepHhNxJdOA4thrdVz6MrzsJb
         ubP0mnqUVpjbxahUPKbPu5mWivtODl82Os3sJhxS5TdQJzUExA4JD1LjR0c9R9TcQjNA
         ZY0FiG9yx55iuQMIQgkGgwj06/FvXMeAoycMe8+Sq+sZePzu2EAxuo9IsgtfHd903hvf
         i9r1GOyrmtOTHIi32tUHbCKUjUk5xWwdEfSovVvx5RpokY7W/CBTpC3vK/InhpI44+Ov
         9pSC2g3pbZGGyz4147yvSEdzHc9LyL4r7p4oJZ7wPMreHRlLrp8jLL82oneJYMKIjDUD
         aKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683596; x=1793288396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PRBt6CU99Tgp/PmrNNizxfLM+x8gsCayxEXcNPrw6c=;
        b=legpb41j2h/GeUGCI/DjTia1Aocra+Ck0biIKHrlupEIavlfwLZT/QOppnbcQxRdcB
         9tzK19dlXUNRmnMvZ+/54UuZoLpljNMo6QW8opQx4DmFMCuSP8NPlB/guiE7cazVk5uU
         wHj8CKWr07v5u40F1Ss+L+S+9hebXG/nbbtR1vvyNYIxUxxTj2gZxciMOmD8tt0X/k7s
         9hIgcQA4YY/bEV898AYxctr9iRi0Sl8hV2GQQDsOol0UbUAvT+eRSIhURxJ+NU+CKvIb
         VoEjQgVydNslPSpkXz6Ll+249HYMrVtDnurVzYFzaDTHlt5JLaZn9aCXYv97DVYioJ7+
         c/eg==
X-Forwarded-Encrypted: i=1; AKwUvBwDkIKBTYNZkf4+WXB3m2uRhnzubiCLf3bPUTxR+n/JJOIE1D/1hhrBlEZ5t1G/2ubY2AFk+YHcUmLCFA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbgDf0DpXh3/R6N1QxbNoDouTFGvQTS+b4zYaJVS6p+5G+O/Gl
	r9uS5CI1L3DHRQXVKQtFaGWPGNLsFQzyLU+n70uukDZ2TcZXWQdrTfuhqosffAyv
X-Gm-Gg: AYBFou11KhGArsFp2gfdAz4bL5duHfyjoUqOAthLdlqID0gm/+h+Ys5Ur1MWINu5BnG
	ESz6TqQiQaPG3agcT+CJYwCOabkdc8hpLdjAWpgGIHD+kR9wJGNE3STnEZtVFmJU8+XAM1I8n9E
	YDn7Bk8W3wa5tm9ejfLFkzn4+HZsGrU9C5G29rAr4WLiz8Hxlk9G0ePBHROysJjpwO5AsZjoqtO
	H1Qc3E38X+TlDR8BWzULdxUZNFO9a/+JCO5LhjJTnEz+b/gxb7bg2h5XbXcubbsRX3FlijSt30Z
	Geh9mqX2mHsXXa+C/rftmBEuvRg88xRHitMsv6ayR17+39aacJxq2DhT2uaaiFEC2GBAbRn1qY+
	5CdAvFVs476S+cWP3t7unB57UZ7wiieyZsEp8yVngPegx9rYdwX8/nC7Wi9mQfDVXT2W3kChtCk
	7jpq/O8+RHRFKi1166rB90dW9zvIKf1DgWut90X2GgEPTdrYdsR322x7W+EopQTysdQ10k1GRTG
	eeQpy5qysrdC+9djaX0M3VRj3cx5tUPzNat2SqrXPFtDZx7D87o80rh6iOsqgYHHEj+0mXgxEfq
	syWsQmPFrg3YPUJh8xzq8CPM/aMJnCkgOBfnh7pXb41Q1KlzOyxPNkRdLKk=
X-Received: by 2002:a05:620a:170e:b0:93e:a8c5:132f with SMTP id af79cd13be357-93f57f70346mr956171785a.29.1792683596172;
        Thu, 22 Oct 2026 08:39:56 -0700 (PDT)
Received: from CW-KDG4DXVLYF-L.hsd1.mi.comcast.net ([2601:400:8100:2e40:55f:d026:b9b8:679d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6f15asm538665685a.6.2026.10.22.08.39.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 08:39:55 -0700 (PDT)
From: Jaehee Park <jaehee3park@gmail.com>
To: ardb@kernel.org
Cc: sebastien@wenske.fr,
	ilias.apalodimas@linaro.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/efi: Drop stale INITRD table entry on kexec boot
Date: Thu, 22 Oct 2026 11:39:54 -0400
Message-ID: <20261022153954.51577-1-jaehee3park@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012133712.618913-1-sebastien@wenske.fr>
References: <20261012133712.618913-1-sebastien@wenske.fr>
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

From: Jaehee Park <jpark@coreweave.com>

The EFI stub allocates the INITRD configuration table in EFI_LOADER_DATA
memory. That memory can be reused after boot, but the configuration table
entry pointing to it survives kexec.

When a kexec'd kernel consumes the stale entry, efi_config_parse_tables()
clears the base and size fields at the old table address. If the new
initramfs occupies that memory, this overwrites 16 bytes of compressed
data and prevents the capture kernel from unpacking its initramfs.

Invalidate the INITRD entry when reusing the EFI configuration tables on
x86. Kexec supplies the new initrd through boot_params, so the capture
kernel does not need the old table.

Fixes: 6e62d1c6f2c7 ("efi: Wipe INITRD config table from memory after consumption")
Cc: stable@vger.kernel.org
Signed-off-by: Jaehee Park <jpark@coreweave.com>
---
Hi Ard, Sebastien,

I independently diagnosed and locally fixed this issue on October 6
while debugging kdump on an x86_64 L40S system. I was preparing to submit
my fix after internal review and found your October 12 proposal.

In my case, the stale INITRD table address overlapped the capture
initramfs. The capture kernel reported:

  Initramfs unpacking failed: ZSTD-compressed data is corrupt
  Failed to execute /init (error -2)
  Kernel panic - not syncing: No working init found.

My local fix invalidates the inherited INITRD entry in efi_reuse_config()
instead of changing the stub allocation. With that fix, the capture
initramfs checksum remained unchanged through successful unpacking and
kdump saved a crash dump.

The tested version also removed the data->smbios early return. I have
left that change out of this submission to keep the initial patch small.
This reduced version has not been boot-tested separately. It retains
the existing SMBIOS guard, so it does not cover SMBIOS3-only systems.
Would you prefer handling that guard as part of this fix?

Would invalidating the inherited entry also be useful when kexec boots
from a kernel whose stub allocated the table in EFI_LOADER_DATA? The
allocation change appears to address the lifetime at its source, while
this change prevents the incoming x86 kernel from consuming a stale
entry created by an older kernel.

I have not tested the ACPI reclaim patch, so I am not offering a
Tested-by for that patch.

Thanks,
Jaehee

 arch/x86/platform/efi/quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.c
--- a/arch/x86/platform/efi/quirks.c
+++ b/arch/x86/platform/efi/quirks.c
@@ -615,6 +615,13 @@
 		if (!efi_guidcmp(guid, EFI_MEMORY_ATTRIBUTES_TABLE_GUID))
 			((efi_config_table_64_t *)p)->table = EFI_INVALID_TABLE_ADDR;
 
+		/*
+		 * The EFI stub allocated this table in loader data, which may
+		 * have been reused. Kexec passes its initrd in boot_params.
+		 */
+		if (!efi_guidcmp(guid, LINUX_EFI_INITRD_MEDIA_GUID))
+			((efi_config_table_64_t *)p)->table = EFI_INVALID_TABLE_ADDR;
+
 		p += sz;
 	}
 	early_memunmap(tablep, nr_tables * sz);

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.54.0
