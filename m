Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227810;
	b=vgFku/m7gdrs6XDv7L1UR67FsIEM/nOfJLh+HGBKbIwbSIEoXv+jrHpHVLSkbBeyEbec
	 aTvHbG58OyMzDca4S2iNsAg0mcsb1EKSO3XN8LlHfbAhAm5F9lReKtwTuPb+fCLwKC6mR
	 5WmUtaqnMgDj5Pgb2Bz7lfF4pJjPD58tuQvYkpYrjmbNZw7oqdP1UI+d5ELR+oIsViC2a
	 1jtJ9TR6ZeqUjPnou+hggN+pbJo8CfLIhuYgLdVJ69Qbg6R6SvqEg0VFp9yMacsrOQGLX
	 OTaS7NK0VqS+2ixGzhzKPlGu6T5ZW5Ab+M44BTF63HgD89lL5cPY/y4T5MLbhO8xbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227810;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=7ehu9uwlN6f/BG1RO8PBmrITOSCd6PjFswkCZHpoDnw=;
	b=bkDzmKH6dAcTSpLZ2egbR2MwO6AFGMsN46zz7v3A6gHVUF8f3bo7xGEcXbnFtgHHDiws
	 1dfm48loSj/6ufthLLyN9ndysISVFXT9tqUIvlqQnILDIWdVldd0MkRgrLrrzcjO55gtL
	 0whffWJoxOAfzawR+9cYHgmEM9IXTKn240rFPl+B48u9NT7xJT1Qz1rDHRtUw7W1xtxp9
	 mQwETpmDiH3EqfLWAWY9ra97fm9d0JOE11aVTqNttXwbmar5SXzuw6mCh0VEzYCo+3gP+
	 n2o8m5JM6VLE4uTWLUeu1ve3uk50ucrh/51HuVryShUw/4RAyJj3/VbA+iLbT7QJZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uFt9q5Em;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3155606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3155606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uFt9q5Em
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 217B11476;
	Mon,  9 Nov 2026 04:36:46 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E073D3F632;
	Mon,  9 Nov 2026 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794227809; bh=UBP2ZQMotIV6KdGg51IlwlZyPK5SoCkTkNpFStNN7gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uFt9q5EmP8uuPALMSgfayO0dNqoORyBCQdhiZe3CK0taECNUwQhxIWqLhzLTBPWgM
	 3jgBDN+oV0RLIwow4mH1pcauwWkxyN9pTumuGwFJQrHNgzFw2E3SNVtPux6ES3mZob
	 02X8lK7uRyzbzi2r9wT5O5j+O+467vIwcDH+vhds=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 0/3] Optimize S2 hugepage splitting, introduce skip-level flags
Date: Mon,  9 Nov 2026 12:36:41 +0000
Message-ID: <avG-WdfUaCalKdZU@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <86y0b528zu.wl-maz@kernel.org>
References: <20261106161240.1345126-1-leo.bras@arm.com> <86y0b528zu.wl-maz@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 04:57:25PM +0000, Marc Zyngier wrote:
> On Fri, 06 Nov 2026 16:12:35 +0000,
> Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > 
> > While playing with dirty-bit tracking, I decided to take a look on how page
> > splitting works. Found out all entries are walked, even though we don't need
> > to walk the level-3 entries, as they don't need to be split. 
> 
> What's the point of this "RESEND"? Anything different from what you
> sent on Sept 30th? Since it is still numbered v4, I assume nothing has
> changed...
> 

Hi Marc, 

That's correct, nothing changed since the previous version.
Since it got no feedback since Sept 30th, I decided to resend it in order 
to maybe get some further reviewing.

Thanks!
Leo

