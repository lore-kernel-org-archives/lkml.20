Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD382DEA89
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033821; cv=none; b=lR7EJY2HREaZENKS8cu6Jw1EX5xOnM0jcD5p0B1m9XyeWi8nzrzrJT1CFE4EvlEZ8WaQmC+tr8wMXbHvUOX85JMTRwwyJIQ5f6z/9MALltQw+LOnxFfdnw9/QYbjeP61HsfyriEXgNElKGV1bfVNKqSWU0IINCfEaVXfz2U8PVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033821; c=relaxed/simple;
	bh=yXsq0PNXfp7JzmBK2Z4yBoN+WbUEt1xj32hXbELF9wc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DF6FzWJmbSNsZYDHOIIxvupYhL1lS9ZRukmIyfc4M6I+GllG1l5uV/JP9QyezfWEssdpXufiE0aRywwxubIFp/i5wffXBwCPDcrhpQ2+hOs/YKtKD8BBUhT3ndTmzM0H+Rmnd1obm0h+e8MkoAHrQkGCGzAQE651KZmqq3FGUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXU/ICQx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXU/ICQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C871F0089A;
	Thu, 10 Sep 2026 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033819;
	bh=+muI1Y++JAFHBJSAeF9UgkoNUlxYs81VMFK72BiNI8Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iXU/ICQxczIvc0UXPeHKVCCyAbyrOUnU28ptUDZtcUkKUshVpMQecMXSxoJfLo2y8
	 tLHwnte/wRhOF3BSyZe4lOs9Va5P1R95418z+3EO3bsGo0h8ovmkIrijsO1HYcOr98
	 Z+yp4LVKWS8UiOn8DM6OoE4YVEHGLmZWeRxTH5kTF6x0hBV8zZxGllJekHEdzEoBIv
	 kbbt+84OtF64aQPTikgs4DN7nFHRTAnIcxs7AYRZVwSuzCk7W1swrWwIPIouZgA3X9
	 Mh8vHTdS4hY3j/QroBuuqMR/JP3hgbnEPIlvnraDWpTclm8ozqf263IuJqeqOkYYp6
	 TRgx0mM8LsjyQ==
From: Mike Rapoport <rppt@kernel.org>
To: Alexander Graf <graf@amazon.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Kamalesh Babulal <kamalesh.babulal@oracle.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
 linux-mm@kvack.org
In-Reply-To: <20260909103001.2423403-1-kamalesh.babulal@oracle.com>
References: <20260909103001.2423403-1-kamalesh.babulal@oracle.com>
Subject: Re: [PATCH] kho: docs: fix scratch_phys debugfs cross-reference
Message-Id: <178903381353.3691424.1681861521367117461.b4-ty@b4>
Date: Thu, 10 Sep 2026 12:50:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Wed, 09 Sep 2026 16:00:01 +0530, Kamalesh Babulal wrote:
> kho: docs: fix scratch_phys debugfs cross-reference

Applied to liveupdate-7.4 branch of liveupdate/linux.git tree, thanks!

[1/1] kho: docs: fix scratch_phys debugfs cross-reference
      commit: dc645f2db7539352404525dd1b80236520fb39eb

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: liveupdate-7.4

--
Sincerely yours,
Mike.


