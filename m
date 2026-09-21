Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4949486E4C;
	Mon, 21 Sep 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997567; cv=none; b=jlc1g1M4978ek+BiCZyeB2jb9khQRKSgtm/DknD3UAThm5tb2aTlu4M7gUzJRXHBiJu/I6ycCyggDnzm5iWdu65DIMXx8kHIl7oKfNGyHSO2F4f7GK0L/OmiOTI0yLWQmHWpV18mDc5cGlclx1MprkW6WdCLboKCgKNnvOqOVrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997567; c=relaxed/simple;
	bh=/JlwHsnz9qBWezNIZd35ZdD7VBL43SxECRUxqfHXKYs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GLRZJFDQwbshudvh+wJj69t91CwmZL3hGikqbeouxacwRTHBOysSiBBrxfOhqnmChmfMt3k/KYLFXyTeyoz/fE35kBu89u+cIUNm+f4epWbSF4knIkRg9k71zb/wLS5dzPZ3kTFoZ2sWMh38J091puFuC/OsilH0RpLPrekFi8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=XiOV0L+u; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="XiOV0L+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1789997552; x=1790256752;
	bh=rqfzXhIHgWL1ysTH5+xFLxUMZV2vHhaYy5Z33AQ80QY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XiOV0L+uG0kgaYngu1BqlyrzP84s3VhV2qQmEj+sXDcJILd8ZztEUYJZVGwFx3wXw
	 RfS5v0XxyQSsEgXgJ0cHyXD+KKFdGaJNWIk+uAiijSqcNsg4unm5H+DYFWMsCO313C
	 9gME/sY396pbzmo0l1a8LDXS/O+IOpY8Bws30Tv0/Vkc2+Cjpz3VmOe9kmi3Us6T2c
	 P+JBvHYxOvgqPWg002vMiFJi3J2vRNupQOMml1efXgPcAbJIGmc1DKc47yqS6oGuQM
	 qDJ/Kg6I9CvQC+zT/uysy0bQd5LZyqBMX2AqLPBGa2H0MIxFbD+rC0ssYVHpJ0GH96
	 ThGCZhmzqU4qg==
Date: Mon, 21 Sep 2026 13:32:27 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: OptoCloud <git@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, Avadhut Naik <avadhut.naik@amd.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] x86/mce: Reset stale per-bank state between bank scans
Message-ID: <g0x3OhSrEu9B2QPUUvyd5APM00mZ3wahJzeMthu0lcy8o_1R55nx_1kNgUgQ11cABCTZE6w9qJVKXItSyD0gxnC0oZ8wq-wIplFvR3V2rwQ=@optocloud.no>
Feedback-ID: 192797849:user:proton
X-Pm-Message-ID: c4877b5cb0f056577176d5338e23cf2c9d725ddd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is v3 of the MCA per-bank state resets, squashed into two patches
instead of three.

v1 and v2 accidentally went out with "OptoCloud" as the display name,
which is my online alias.

Yazen asked for the ->kflags reset to go in the helper, and for v2's
3/3 to be merged with 2/3. Both done, so __mc_scan_banks() now clears
m->kflags too, which it did not in v2.

Dropped Cc: stable in both patches per Yazen's review. Patch 1 is
unchanged code-wise and carries his Reviewed-by.

Eirik B=C3=B8e (2):
  x86/mce: Reset MCA_SYND between bank scans
  x86/mce: Reset MCA_SYND1/2 and kflags between bank scans

 arch/x86/kernel/cpu/mce/core.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
--=20
2.55.0

Cheers,
Eirik B=C3=B8e
