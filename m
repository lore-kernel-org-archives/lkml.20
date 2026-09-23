Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0984451AFC4;
	Wed, 23 Sep 2026 18:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187605; cv=none; b=dVfnKTgyXm5W0Chi/J9g7RleHZjHGlOehH0m2SrxhKYVrWHvokkEABHhDHDjbprxJbr1eaqMUIJxxhc/TA5WBtcWNCTaBB3IvlSVkfnDrD5nwCAmN/EjFlObSj+c95F9ADyA22mDcBnpb9uwwcA7PVB0H3Gvd6bqXp8poo3kBds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187605; c=relaxed/simple;
	bh=+CJ3rnd+ozisq2bD7zavGONTL1s18Cwzs4rt2Xsh2Go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rmQMUpa/d4e2oGPGGOOC7AFd1C5SiTL58qYlQ1FrZDFDGLkyrvpwQuNjW6GVB0KAu8ymO+unKdodqyIR/iyNJnqmlzJGyDGfUhpGljXvNd8O1XSfR/av1bYdGm3Zb+EAH+GMxZQn4PbghEdi6Z5SXlFt5495emOrey7Lm9hjvU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=czUO/j06; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="czUO/j06"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF6A41476;
	Wed, 23 Sep 2026 11:19:59 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7935D3F632;
	Wed, 23 Sep 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790187603; bh=+CJ3rnd+ozisq2bD7zavGONTL1s18Cwzs4rt2Xsh2Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czUO/j06gKeQfiLK7TrjKvNbJtzps1SYpwtBNOO5VDaiw4nQV/pvLBHmUYdW9CZxj
	 m03ppF/XTB57iBR2dUgsw7DxxPlvHn4ofRxGQbRoRcxIqLgh6qQk2Ygwb08fpXruwG
	 KWFNQdJhHlkgoponWjdw9d5dwMZ2FVa7OzabNWhU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Weijie Yuan <wy@wyuan.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: arm64: Fix typo "initalised" in booting.rst
Date: Wed, 23 Sep 2026 19:19:54 +0100
Message-ID: <179018757672.2942904.12998748244558241449.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907114146.39715-1-hemanth.selam@gmail.com>
References: <20260907114146.39715-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 07 Sep 2026 17:11:46 +0530, Hemanth Selam wrote:
> Add the missing "i" to "initalised" in the description of the
> spin-table cpu-release-addr property.
> 
> The British spelling is deliberate.  doc-guide/contributing.rst asks
> that both American and British spellings be left alone, so only the typo
> is corrected, not the dialect.  checkpatch.pl suggests "initialized"
> here because scripts/spelling.txt maps this entry to the American form;
> that is addressed separately.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] docs: arm64: Fix typo "initalised" in booting.rst
      https://git.kernel.org/arm64/c/8c37fb7f67ce
