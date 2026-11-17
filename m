Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875832;
	b=NBBJ6DWl0pqurduJ8pfWOeSz5aRMNh2287UChIJ+aM6aTlndWrkqXv/btlswmkrMuS+8
	 D7TWaBAaKebvJyK4uPPnaANo5zAp4tKLxuzx+1sscsrYeJCKOmYmw8Pp45gM0rBlXCaIi
	 z1vHGym3faMZv7mKFSJF6d0Rzv8mYOBoYLOM2MXhWt6WZew5YFwH8G8FIjT88EEPnTiVe
	 L3Bh09vS9Gy8uW2XU5PxmDY9Nh8JoVAgJq0qTy+mcQQGnE0sOyRrUWAP/3lSywijG6xeu
	 MUEfaPy4Q9Z+HofIW8qZGx+YVtfJdoO8vznFcG/YN8WDSqcM4fwbO+FZ097Dx56GzUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BvA8A5YtY5vJyCFzt8yEZytKRl69fmGmQbkWHGd1V/0=;
	b=CVXN6r7s2UJmfxGCdmabhJiKVcS5i4lx6wfOI2otPonPaTpXyszh6Q5pygkFza9PdE1a
	 UpTJxL4j5MtFDTf6CvBlaPBJ0GP5FOvyLeQKrJdhwjqmk6UrZjnnCX4dAE6fJki0UBQLF
	 Bz9rXwOKnbpKaAYY7ZUve3EQw7M9D0schm4r56qII6zMFlzHy4PhN1k7lZhK7BcI6DmsJ
	 OLKO+P81LQphBCg923L/4GGwcHajK5TLMGog8gjD7jbQEia+50SmMJIr0/Lo+HQa7pzJi
	 BmQsJD0R0fHVotQskqS3SfclYiXKJMotMfTonfFy3Ga8BL8NUGLTmgspd5/D0bJ99MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fY9kdE6q;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3EC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fY9kdE6q
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4340846f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794875830; x=1795480630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvA8A5YtY5vJyCFzt8yEZytKRl69fmGmQbkWHGd1V/0=;
        b=fY9kdE6qFdlgspkO6DbKLiT6D/oNllBCGkM/Sjf5aX+Gd+rTsKXcM4FV8dDlwVs4GE
         qaGZO2MOe18oD1QAcvBJuHpbLKMoh1VgtD3fcSAetaz0KnlI3B5CL4pfiKg1FJYKmgjw
         gdAVfCZ/iqeS463Eru8+jvmOVoBgqTy/+k6jkChpeELzBjylkq7XvO/oO3oFHg3WV2J4
         BOjUOFarq6IV+gfbfbwsmCdH0C9SNmDmUCP6j2cQ1cyKw3SJD5FlAXmfayMMJimNWLfV
         zbS3OAbvHKbiTETVQThNWYDzx4Z22bHZccXrCQdpc3MJA2M70lbVWHcuDVOQnL5jgjOP
         HT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875830; x=1795480630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvA8A5YtY5vJyCFzt8yEZytKRl69fmGmQbkWHGd1V/0=;
        b=i2C3X9lwUweKZEKQ3SJyQLvLhOHUJ/10K4f/WjV4reFdQxM8XnAgYj+EuuCohJ/8du
         cgiiPwNNQlcUPTQXSaBoZGYRbLBfn+pvgzRNConX8qvVZ0vts59ZrNxc01JHXnvFSz1L
         i/SBV8PQf3YBvBLrhABmCbAF0i4MXS1HxLU8GmkUeIvWnmXD4nrO6spbFlr3isRBro26
         fueE2soWpjxOAj/H+0Q9D/onmPuAsCXKyeADtrCOabbMDAWJr7R95Tr7MJQodu9qbNTa
         5Y+qneHR9+ntR9tpWquZVuhBzFr68CuOx2bgZGUmPihY/aHNTm1L6yCYJMOIZR+gvAJ1
         kQpg==
X-Forwarded-Encrypted: i=1; AL+hErHLTY/a1Tuc14pHaEJkf27EI0/c1STghtSQvF3/+5UTJ0DXLqcf5F8Lj5FRqU861F5lz0ZaiEolN+9U0As=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M3LHMgJpB3MyflHRjUeMUTTOpc1scNWqWMYV03eTPvgspgEDD
	qzmAYA8IGSgnYekxZJ/SlfxUugfSFnqXO8w+wCwCtEEt5xuCkk14n08OiGU2em+8
X-Gm-Gg: AZFdTZepVNcMc4Hx6gdwyUZMNbl6vQ6jfKi00pUV2VV/4VSoq3Jo7go7PvO8ymWIbFV
	4jekchDKtr9uFPWt6+23cJz6JHsOavPfYEKYV4sBU7DL5BBTu0rYvF0J/9kY0/JP6e8u+ojc1fL
	u05zQjX3FQkKQxiFW6AEN/T2Sqi0nOocf2Fx6FVRED6M+Q6ONqFF9GXkaiYABHzRpjPhQcpAgbW
	0D/pN6WV1RsuVQ75H3CtdfP4bjCP0vq9JUxzZIUwMIOXzd2xuvlhnfIJhAO8MTGTAbJ9G+9McO+
	fN0KDE7I/GNkp0SDVkKn6Acl+QMm0Fx+HIhzQsQb+7eu8MVpKFA8nCky0eoLKpCK6aIEiRddYRO
	Mc5NMRzAHTtv42t4Q1VYCuGjjm7y/1UL+TxEnedtpIoOHvrZKVhWh/pZePdOXgp2ihKz0ELoxEL
	bTzffcEFFBoW/3cQl0y2D7z8ECp572nhGC+gxhLDxYAlMLElRpM66yr/r4AKE6APl3fR6VVIA1n
	nsNr/zC/+faJd/GIUCASdrBVmhn6cNlQRhVOZfpHTA5EZq0lUzQ8ppH+4igNe5pXHP7+6/J42wP
	Xji/k1DSA7/AQDm004mxMI/GV5LvhmL87bG8Cg+l6bbL1DfpwnqETAePp2hGMjBF/ndCTtytVJg
	23XWX9w==
X-Received: by 2002:a05:6000:2006:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-49c70b051bbmr27957716f8f.13.1794875829680;
        Mon, 16 Nov 2026 16:37:09 -0800 (PST)
Received: from gandalf.magpie-herring.ts.net ([87.74.56.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c651esm25475233f8f.47.2026.11.16.16.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:37:09 -0800 (PST)
From: Zak Brighton Knight <zakbrightonknight@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Zak Brighton Knight <zakbrightonknight@gmail.com>
Subject: [PATCH v2] x86/mce/amd: Don't poll unpopulated SMCA banks
Date: Tue, 17 Nov 2026 00:37:00 +0000
Message-ID: <20261117003700.4155635-1-zakbrightonknight@gmail.com>
X-Mailer: git-send-email 2.56.0
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

By default, the MCE init code will attempt to set MCi_CTL for all MCA
banks on a CPU. This includes unused MCA banks which are read-as-zero
(RAZ) and writes-ignored (WI). The init code will check for this by
reading back the MCi_CTL register. If no bits are set, then the bank is
marked as "not initialized".

However, "not initialized" only affects the MCE sysfs interface and
later writes to MCi_CTL. The bank's "ctl" value is still set, and this
is checked in the MCE polling functions.

Normally this is benign, since an unused bank would return '0' for
MCi_STATUS. But in some cases, the MCi_STATUS register will have a value
with the "Valid" bit set. And this results in logging bogus errors.
They're determined to be bogus based on the combination of status bits
set. Also, they are logged from MCA banks that have an MCA_IPID value of
'0', i.e. reserved/unused.

Clear a bank's "ctl" value during SMCA init for unused banks. This will
save an unnecessary MSR read during normal operation, and it will avoid
logging bogus error values that may be present on some systems.

Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: stable@vger.kernel.org
---
v2:
- Changed commit message based on feedback
- Shorten the code comment to Yazen's wording.
- Move the background and the test results below the cut.
- Add Yazen's Reviewed-by.
- Rebase on today's tip master. The code itself is the same as in v1.

v1: https://lore.kernel.org/all/20261107111211.578991-1-zakbrightonknight@gmail.com/

Thanks to Yazen for the review and the new commit message.

The background from v1. On a Ryzen 9 5900X (family 19h model 21h) the
kernel logs a bogus "System Fatal error" every week or two. It always
comes from CPU 1 and from a bank that CPU doesn't have.

  mce: [Hardware Error]: Machine check events logged
  [Hardware Error]: System Fatal error.
  [Hardware Error]: CPU:1 (19:21:2) MC14_STATUS[Over|UE|MiscV|AddrV|PCC|SyndV|UECC|Deferred|Poison|Scrub]: 0xffffffff8b416928
  [Hardware Error]: Error Addr: 0x0000000000000000
  [Hardware Error]: IPID: 0x0000000000000000, Syndrome: 0x0000000000000000
  [Hardware Error]: Bank 14 is reserved.
  [Hardware Error]: cache level: RESV, tx: GEN

Only CPU 0 has the shared banks like L3, UMC and PSP. On the other CPUs
banks 4 and 7-27 are unused. On CPU 1 their MCA_STATUS and MCA_DESTAT
now and then return a non-zero value. The values look like memory
contents rather than error status. They include page table entries,
instruction bytes and kernel pointers. If bit 63 happens to be set the
value gets logged. This machine logged 39 of them between July 2025 and
October 2026. Owners of other Zen3 desktop parts (5800X, 5800X3D and
5950X) report the same thing, also always from CPU 1. Commit
0422b07bc4c2 ("x86/mce/amd: Filter bogus hardware errors on Zen3
clients") filters a related signature but only on Cezanne A0.

The junk can reach more than the log. On 24 Oct 2025 one of these
records came out as a deferred error with AddrV set. The kernel then
tried to take page 0 out of use.

  Memory failure: 0x0: unhandlable page.
  Memory failure: 0x0: recovery action for get hwpoison page: Ignored
  [Hardware Error]: Deferred error, no action required.
  [Hardware Error]: CPU:1 (19:21:2) MC9_STATUS[-|-|-|AddrV|-|-|UECC|Deferred|Poison|-]: 0x84453c75c085c589
  [Hardware Error]: Error Addr: 0x0000000000000000
  [Hardware Error]: IPID: 0x0000000000000000
  [Hardware Error]: Bank 9 is reserved.

It did no harm only because the address read as zero.

The testing is the same as for v1 because the code hasn't changed. With
check_interval set to 1 second, stock 7.2.11 logged 34 bogus records in
22 hours. The same change on 7.2.13 logged none in 8 hours 10 minutes,
where about 12.5 were expected. Reading the unused banks directly
through /dev/cpu/*/msr shows that CPU 1 still returns junk under the
patch. So the clean run is down to the patch. Updating the BIOS to 1.D3
doesn't fix it. The full test notes and links to the other reports are
in v1. This version builds without warnings with W=1 on tip master.

There is no Fixes: tag. Every bank up to MCG_CAP[Count] has been
polled since long before SMCA. The v1 notes list the two closest
commits.

mce_no_way_out() reads every bank whatever its ctl. So junk there
during a real #MC on CPU 1 could turn it into a panic. CPU 1 here still
returns junk from these banks about once every few million reads. I can
test a change there if that helps.

Claude Code (Anthropic) did the log analysis and wrote the code change,
the v1 changelog and the test scripts. I ran the test kernels and the
probe on this machine.

 arch/x86/kernel/cpu/mce/amd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 1cc20b855b7e..9e6fe5798181 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -345,6 +345,10 @@ static void smca_configure(unsigned int bank, unsigned int cpu)
 	hwid_mcatype = HWID_MCATYPE(val.h & MCI_IPID_HWID,
 				    (val.h & MCI_IPID_MCATYPE) >> 16);
 
+	/* Skip init for unused banks */
+	if (!hwid_mcatype)
+		this_cpu_ptr(mce_banks_array)[bank].ctl = 0;
+
 	for (i = 0; i < ARRAY_SIZE(smca_hwid_mcatypes); i++) {
 		s_hwid = &smca_hwid_mcatypes[i];
 

base-commit: be3c65835ade4d487ccbeb08c827662db09ee7e2
-- 
2.56.0

