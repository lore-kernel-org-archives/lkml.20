Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DF4E06E1;
	Tue, 22 Sep 2026 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075495; cv=none; b=q0KuyFjUEEMVXQJD3VJqJ/L9fZQxx4ega0s0LIt5b+Hd1Z8m1Mkq2pRK2BYN6r2C/TSDI7W4J7uD88QjEuK0XVmYwOHtO0SaBAGqI+lCdE0tmpF8JyNo/SAG7dLyHeQXI6Ge1DcssVQReJUx3LDJApz5linzP8byk2cUDoiirt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075495; c=relaxed/simple;
	bh=ltkpGZNZ+w9ahxzRyfJCjUXFWxOs5rvFIO0qvCzrsSc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CLtBMOC5pLkgsd39sl+TNKXPU0nSYhLNfv9gGWQkv0WURjBL9XYjBApeI19uWxiVJqLLhFDQq1/FD1Zf2UcpTkuXDyJADJiQDCXA0jRwBuU6458GdRX4gWpH5c7vdmuq3U3VUUG1amEpiyKxpvvtNtdduRi4CdUnB3W3uz6VO2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ZRyFMd6A; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ZRyFMd6A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=hlcz+9iunZjlloBhWee2/o4b61W6beR1z9/6YCLqlK4=; b=ZRyFMd6AuDSa06wmZ6f8XRpZ3D
	6w0h/NiPB3+cgQCzMW0pq4I9FPEljL1i+uhRPKhrozOq5kjg16BCqxSZf6q+gkffkGai01i0O1tgo
	4wwompMd0QR7kengI1NjGgozyTLcW/O1Yxgb8kZKGxFUUXXhfCIPlstR6B2RERf4W59SUtB38+OMt
	mFyAa07b8FTjSBGhE+qp0sV4ApcMXdqBF7L4MSSCvNkFbz1Qs7ch+lPq4tPEDFzSnwkZVfyjZpolE
	DRydJpwfDdotCYhpjiNOXOQ/nFEf++6u6zsSBNUO0tGQeSbFX0rNLhZxDiZ0xecFvQYXOm/Y4WHq8
	2mxrepCw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8yPH-002wIm-0t;
	Tue, 22 Sep 2026 11:11:27 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] x86/mce: Stop losing MCE record fields to pr_cont()
Date: Tue, 22 Sep 2026 04:11:07 -0700
Message-Id: <20260922-b4-mce-print-v1-0-500205689e54@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEtismoC/x3MSwqAMAwFwKuEtzZgi/jpVcRFrVGzsEorIoh3F
 5wDzIMsSSXD0YMkl2bdIxyZghBWHxdhneAItrR12VnDY8VbED6SxpNr07TedmOYWkFBOJLMev9
 dP7zvB8c1Wi5eAAAA
X-Change-ID: 20260921-b4-mce-print-6178a29bcd8e
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=876; i=leitao@debian.org;
 h=from:subject:message-id; bh=ltkpGZNZ+w9ahxzRyfJCjUXFWxOs5rvFIO0qvCzrsSc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqsmJbk9cqcvHUtges32QpDsvBjHvzT9TofBSAs
 HbaxhCw8zGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarJiWwAKCRA1o5Of/Hh3
 bccRD/9QLuquETyBHFdow4vzBAOXSd8nXULbGVocZqjJaZQ57DULU69FkKg1ZytwHC6A2JoEMVf
 slQ7ySavnAxAp4Ra6gh543mhxS8ux03lMhYxis/PpC/PUgMF4Y5CUV+NUmcnsf3JEq07A6/1emk
 D7xqC2PWVwWlNWxCAJu2GI3SvnG3i1A7dr6yBHSg7XL7OhLIRj/VLD3jlh5PrZaMPUknJkzqyjX
 0SHf5XbFpwXtA8fiAvmQ3yCcC6smoXZ5I8PBMDTKendEYXmEdtgPNa5H5EFW1Oyb4ieY9zQlXzf
 KUxuFqU26rTrpHSM354u/2cpWUo1a9zuttEi7gKjfbbUK+ZaeeoQQYbSRmSwBjLa3Kpi5BKCoHx
 VE43Uv6uaVgHC9gCMFTUyZvOH2rzLOrgUiEu6YOKKKRRJ0o0pRWp6xLuaFC0tt9U6kWPpQBFZu6
 Eh97vg7UakWAcF+g7SiyEAAGmbSh3LiTOsE5vSD4SrZU4xvfr6nS/CyKN64RR9nj/WevgyvFJM6
 tPqUPJXcUcMn2lUr4dTQfQdOQ1tlzg7Py62DjPXGWrg71RfAdzf3LayacXZYd0h1ugyGZsKtx2Y
 vWtVCNJmo2QyEQ9EvoP5V2dekozgI9oROMp8xcFubODU6AQjgenlJ7WdJ6mn83s02udWt1donPu
 +VclexoHh/xuh6g==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

__print_mce() builds two of its four lines from pr_cont(). A printk from
another CPU breaks the line, and the orphaned tail loses the
"mce: [Hardware Error]: " prefix, requiring effort to parse things
clearly.  Fatal machine checks are exactly when that happens.

Patch 1 is a no-op %llx cleanup to make checkpatch happy. Patch 2 makes
each line one record.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      x86/mce: Spell the long long conversions in __print_mce() as %llx
      x86/mce: Print each MCE record line in a single printk()

 arch/x86/kernel/cpu/mce/core.c | 46 ++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 15 deletions(-)
---
base-commit: b0fa123835c147e77b9a967de76dc899062bd405
change-id: 20260921-b4-mce-print-6178a29bcd8e

Best regards,
--  
Breno Leitao <leitao@debian.org>

