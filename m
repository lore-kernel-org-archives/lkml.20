Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B094F93DC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868294; cv=none; b=C9VNplAydce6pzg6NafbXQFgrsKCYu9fpNwqtbsEI1yOiHLGibQGC6ZMgD7FCBWY6E8FX+/lrihz4e03EpkdQaV1fmDhUDqjZRoIk9xanCbgmwBjeisDp/pWnvgw00dUnUxlABIRWyHjTQ13tf31XN8M0cKeqrJRGT6cXIqI1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868294; c=relaxed/simple;
	bh=UOCqyg2Tz0WdYHcm1LPgV3NFbk5rl424488FngyLFo4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=ET+b8x30LS6ijcGN5/GnaUkpq1u1aLv5ySRi2qfsPmRDdzubgqilgScj6l8fCkYG72rSE2+0J0YfSPwxYTjZJ5RsnF3wEp7ek9x+ge70ncwHT0Kq0mbflxEarsMpsFxOBu3upeEh2QDokDbJFnKtpMehtTh3t6cE8+0mElxQkK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AO1DcxQK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AO1DcxQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790868293; x=1822404293;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=UOCqyg2Tz0WdYHcm1LPgV3NFbk5rl424488FngyLFo4=;
  b=AO1DcxQKRzx+ZBxXxtuUIKvL1Y2evrVkObg9p1O+VplDYWznFmw4KYdn
   bsNe/1PBG4oZvlR+befeTw8zpbptQPshNbw099vGLJtBLzoFurFfsVPN6
   KmhCdcC+GUxSNGWhaV28IpMVuFx7xO1pszO/lqk1wFBiLEywWtCO/I+Hi
   9srA8e74TxHo1rBB5JQ2hKYLd1vndZ2AeaMAfG0ToHZYVyhQyx+ZWDQhv
   R6bojYgBmWerdgW8+VpDm6LlVlVmGPU3ayKhSi/2uWUEZWYs868NLaAdc
   5vUSzqLL8KFvlGsaoM65o9w3BKuaOmqNXmgqZKS+8vLVOIM5x6Rer+sKy
   Q==;
X-CSE-ConnectionGUID: /13pjWzPQ3yBqBb/0Rg8xA==
X-CSE-MsgGUID: te7YBz4TS8KOwi8JRfoHNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="117159320"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="117159320"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 08:24:52 -0700
X-CSE-ConnectionGUID: okwaHFjWRzOmUl/ymn6L1w==
X-CSE-MsgGUID: QsizSKmIRD2aMvN71ctODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="305514626"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.111.237]) ([10.125.111.237])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 08:24:51 -0700
Content-Type: multipart/mixed; boundary="------------9McwORqVWFuzMVH3NTrsxBTi"
Message-ID: <93716ff0-e693-4056-b6e7-9d221a3c58ac@intel.com>
Date: Thu, 1 Oct 2026 08:24:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/its: Make ITS thunk pages read-only without the ROX
 execmem cache
To: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_MARIE-JOSEPH?=
 <fredericmariejoseph@gmail.com>, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
References: <CAHD2OOfP=h=qS6nP4dtn7RTQqMEqOvXD+iURXJ7Rgc5KFjgi5A@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <CAHD2OOfP=h=qS6nP4dtn7RTQqMEqOvXD+iURXJ7Rgc5KFjgi5A@mail.gmail.com>

This is a multi-part message in MIME format.
--------------9McwORqVWFuzMVH3NTrsxBTi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/1/26 06:22, Frédéric MARIE-JOSEPH wrote:
> That's my first post so I hope I do things right. I found what seems to
> me like a bug, and worked with Claude to find a patch. Hope it will be
> usefull.

Your mailer is sending out HTML, but there was a plain-text version too,
so the message at least made it to the archives. Using git-send-email is
the most foolproof way to send these things, fwiw.

> With CONFIG_MODULES=n there is no STRICT_MODULE_RWX, so x86 does not
> select ARCH_HAS_EXECMEM_ROX and execmem_restore_rox() is the stub that
> returns 0.

Ugh. The origin of this seems to be:

         select ARCH_HAS_EXECMEM_ROX             if X86_64 &&
STRICT_MODULE_RWX
from:

> commit 47410d839fcda6890cb82828f874f97710982f24
> Author: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Date:   Tue Jun 3 14:14:42 2025 +0300
> 
>     x86/Kconfig: only enable ROX cache in execmem when STRICT_MODULE_RWX is set

That commit is trying to change execmem internal details via an
arch-specific Kconfig tweak. It's also logically a bit silly that what
an arch supports:

	ARCH_HAS_EXECMEM_ROX

depends on a module-specific option:

	STRICT_MODULE_RWX

If execmem is being too aggressive on for modules on !STRICT_MODULE_RWX
configs, shouldn't the fix be in execmem *module* code?

Maybe something along the line of the lightly-tested attached patch? I
see the "11 W+X pages found" message without it, and the message goes
away when it is applied.
--------------9McwORqVWFuzMVH3NTrsxBTi
Content-Type: text/x-patch; charset=UTF-8; name="x86-STRICT_MODULE_RWX.patch"
Content-Disposition: attachment; filename="x86-STRICT_MODULE_RWX.patch"
Content-Transfer-Encoding: base64

CgotLS0KCiBiL2FyY2gveDg2L0tjb25maWcgICAgIHwgICAgMiArLQogYi9rZXJuZWwvbW9k
dWxlL21haW4uYyB8ICAgIDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLXB1TiBhcmNoL3g4Ni9LY29uZmlnfng4Ni1TVFJJ
Q1RfTU9EVUxFX1JXWCBhcmNoL3g4Ni9LY29uZmlnCi0tLSBhL2FyY2gveDg2L0tjb25maWd+
eDg2LVNUUklDVF9NT0RVTEVfUldYCTIwMjYtMTAtMDEgMDY6MzE6MTQuMzc5NTc3MTI0IC0w
NzAwCisrKyBiL2FyY2gveDg2L0tjb25maWcJMjAyNi0xMC0wMSAwNjozMTozOS43Nzc0MzYw
OTAgLTA3MDAKQEAgLTg1LDcgKzg1LDcgQEAgY29uZmlnIFg4NgogCXNlbGVjdCBBUkNIX0hB
U19ETUFfT1BTCQkJaWYgR0FSVF9JT01NVSB8fCBYRU4KIAlzZWxlY3QgQVJDSF9IQVNfRUFS
TFlfREVCVUcJCWlmIEtHREIKIAlzZWxlY3QgQVJDSF9IQVNfRUxGX1JBTkRPTUlaRQotCXNl
bGVjdCBBUkNIX0hBU19FWEVDTUVNX1JPWAkJaWYgWDg2XzY0ICYmIFNUUklDVF9NT0RVTEVf
UldYCisJc2VsZWN0IEFSQ0hfSEFTX0VYRUNNRU1fUk9YCQlpZiBYODZfNjQKIAlzZWxlY3Qg
QVJDSF9IQVNfRkFTVF9NVUxUSVBMSUVSCiAJc2VsZWN0IEFSQ0hfSEFTX0ZPUlRJRllfU09V
UkNFCiAJc2VsZWN0IEFSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEwKZGlmZiAtcHVOIGtlcm5l
bC9tb2R1bGUvbWFpbi5jfng4Ni1TVFJJQ1RfTU9EVUxFX1JXWCBrZXJuZWwvbW9kdWxlL21h
aW4uYwotLS0gYS9rZXJuZWwvbW9kdWxlL21haW4uY354ODYtU1RSSUNUX01PRFVMRV9SV1gJ
MjAyNi0xMC0wMSAwNjo0NDo0Mi40MTc3OTU3ODggLTA3MDAKKysrIGIva2VybmVsL21vZHVs
ZS9tYWluLmMJMjAyNi0xMC0wMSAwNjo1MToyOC4wNDg3MjI5NzYgLTA3MDAKQEAgLTEzNTUs
NyArMTM1NSw4IEBAIHN0YXRpYyBpbnQgbW9kdWxlX21lbW9yeV9hbGxvYyhzdHJ1Y3QgbW8K
IAlpZiAoIXB0cikKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQltb2QtPm1lbVt0eXBlXS5pc19y
b3ggPSBleGVjbWVtX2lzX3JveChleGVjbWVtX3R5cGUpOworCWlmIChJU19FTkFCTEVEKFNU
UklDVF9NT0RVTEVfUldYKSkKKwkJbW9kLT5tZW1bdHlwZV0uaXNfcm94ID0gZXhlY21lbV9p
c19yb3goZXhlY21lbV90eXBlKTsKIAogCS8qCiAJICogVGhlIHBvaW50ZXIgdG8gdGhlc2Ug
YmxvY2tzIG9mIG1lbW9yeSBhcmUgc3RvcmVkIG9uIHRoZSBtb2R1bGUKXwo=

--------------9McwORqVWFuzMVH3NTrsxBTi--
