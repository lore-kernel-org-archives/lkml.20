Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368230;
	b=QPVxrbAAFLCfg3mL5NaHA59qjlZZtcuo0wL5LuFG1ep8v2RwxBX1eG7lDd1QBZJ3sO84
	 YgIdesSnz2IkdvQ/qDGQ3MN+GF7su78ja39fOBLMmC1dkyMXrJeiiKYcJVY+5XpCIfcTn
	 IekP3ewSL2UiSktuXkZJ+wWuHgc6ZoiVDAyMadF1Z+dmQE14ayYzLU37BhWoEE1CHtOsd
	 MbJTPZrGwSRIg9+0ZnLTVorCeFaxZL5kguIoZvLb7TKQCnryFFxvteYFv9tzcTP9410zp
	 8Sbot45yFvStKkFJm04ubM47Ac3az1mc//OAFFm5dgrSyF+Z6zk48WgFIJju1AVs/6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368230;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=FqNjo0H98iaz293JQvNNA0q47umX4/lWICDQIiNkFTI=;
	b=Q4tRwfGXzCQFiLfHWMKE2t0VvGJgcKuMhjt/PoLLCkg2tSYvVUpvgbnixt6/K8NGThlG
	 KQv76cF42aZ4zamYwRrYA4Es/KbGhIbvTL24m9yaopEn13YEEjzlDOrO0pGWRBqWlnagO
	 d8zfqWis5zkMPoa+4UfaHZPnRSDMlGnGs/qTmejtRxyiyoreMM6SonbcKi1VoRAGh4uNl
	 /Qwbdr+9plojsRmjuMBW8TNACK9WoWd28IDUpfo4aDWTp8IyY/Wf0WfVE/C38rsVwx4Wi
	 QGpgZ/ktdTJEzNrE7oYND3hngjcwx/wsM+8uj//jWJIogckfqcfkxEuc08zoU16ORMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=t6kROqxW;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC466606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC466606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=t6kROqxW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FqNjo0H98iaz293JQvNNA0q47umX4/lWICDQIiNkFTI=; b=t6kROqxWTQc9PKB1x51sXY1F3z
	cXBVsuDuKSOdnf+5pHiLYzTvc0SQmfQO25k/2UcArvJrjxSYDk+AkLb5R4ajJTO4IwGuxe2BlLgJz
	vr325AVrKqG91ZmfcNYDrkLa6O3Pu9uAyILZpTCYWmdV+HIQmT+Z3m4PEIZVL3VSe4pnDQMeZ9tqP
	ktA0PHcqJem+2uPTzhX1ofkzVkUKJWB2RH0gWPc6/mUZm6CUB9YVe/CTKaxvOahzeXQBQyZsdEZIT
	F4G3kG70ZznA3V+aMAzaHShb3wcZbu9hIszsEjLnxKnQcpczwzQFz3/9F34zJvxcFHXo1kQdo1BZ4
	BWNAffwg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMmzu-003rZs-2K;
	Fri, 30 Oct 2026 13:50:22 +0000
Date: Fri, 30 Oct 2026 06:50:18 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auSem6kzc2d52n-H@gmail.com>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
 <auRxNDAe_tv-mCvk@willie-the-truck>
 <auR0kSCYyo31Inxf@gmail.com>
 <auSFVKVuGryqTgjG@willie-the-truck>
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
In-Reply-To: <auSFVKVuGryqTgjG@willie-the-truck>
X-Debian-User: leitao

On Fri, Oct 30, 2026 at 11:53:56AM +0000, Will Deacon wrote:
> Because you might have thousands of CPUs?

I checked that case. I built defconfig with 64K pages and NR_CPUS=4096,
with and without this patch, and compared clang's -fstack-usage output.

With the patch, 62 functions grow by 512 bytes or more. The worst are in
cpuset: update_prstate(), cpuset_write_resmask() and
cpuset_handle_hotplug() grow by ~1.5K, to 1648 bytes. Nothing crosses
FRAME_WARN, and the largest frame in the build goes from 1312 to 1648
bytes, out of a 64K stack.

I believe this higher frame usage is still way better than the kmalloc
at function invocation (the reason for this patch), but honestly I don't
have real numbers, and I am happy to take them, if it is worth.

> Because copying these things by value could be expensive?

Hmm, I _think_ having the cpumask on the stack or not doesn't change how
it is passed. cpumask_var_t is either a pointer or a one-element array,
which decays to a pointer, so callees get a struct cpumask * in both
cases.

Which copies do you have in mind?

Thanks,
--breno

--
PS: I am not pushing on this patch at all, I am just trying to
understand the reasoning and learn.
