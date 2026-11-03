Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698501;
	b=qwhCHzkSM1FyxjOjq9dueYUkoY2uIDmXVuA3dKKEm1REttkAUPVgPNzGOUOB2PYZw/zP
	 LCtsk0pRrXMz+uREsb4PvR4Ma+XtPA3BNJmCDlu/FzDi/PZD6y6HCI7zpEcKJkdEF5BNc
	 m/apNlX2qQZaOELMJk4jvHEspA3opOcb+Laa62pe4uUxNuCD/ydvA69r21VCIR8C7WhhB
	 33bOUc1icsm4RDjJ52IKNSLZMLjp6YnHxxe7+d39mk18vi39Ul/E9ogcmI+RN0q3+w7Zs
	 cwQqZoIuUZgCxDDrg9ZZdZlxRX7bVRWJPndguh6nlo2geEyVGNHCTewzIirxZOfTDwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698501;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=duchPy3gA7qrB3uLfSZGqw9HsG8qAFPps9294n5glZI=;
	b=v6iOrGLgyRkguk5KbY+G2Zfr4ewSUwKp9hXSDod8OYsqO0sWbCxhNQvwDcRvD5/VDnDS
	 bukQFyowGnDYQ96xIE0SrNXZdndJaf0ow8lS+Oj4fszQveYdrcjMikpJLOleY7cQtlc6N
	 QLrDJ3t7F9gZ6t9sPcvaHpYYwWMUGbF3klud7oxPc2l95stu66yLyFqf7SqEatAhqQSrk
	 5sQ782SU1HM5Uv8QgZ1VipAQlQbbX9kdx6hnutxrNbOVftAA7B09nC6xed45y3JAdtUaw
	 qi2WieUzg3Fj1isyYez+8xBr8VEh8FJzH/pmmLqeTpAQaiGQqVoMCUG7+ua08qIGSOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=dKvnBZaL;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59872606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59872606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=dKvnBZaL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=duchPy3gA7qrB3uLfSZGqw9HsG8qAFPps9294n5glZI=; b=dKvnBZaLPaI/I/A5GwmkqIKC+d
	Y4JksYIStSOUkxIv5bKdzRJtpTD+iFZYz5OnpSEnuebf3/F8PxIMQxVyNY95Z8eq9DN2y2NUkDjI8
	OdFGtSmT2EPTvjbvh36L+ZS5vNmQ+b1WMznPIkhvcLIeFbQ98Y/fIzkaztzlNN3fSzBD3G27LBm5+
	zhEX/T66At8Hg+Z2EZPaU35BPD7w951BqYcOZPd3C81MzG3YYflDNX4sfM2X0eUDU3qvnyyXVtnNT
	NkDI5y7oxsgpZ5h8zLUQ2HXCCu/YE2+izlXqmNGmQN72HVz4lX64TdZZyz/dGZusBRrxftXAII4CE
	1K8Wb6Bg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOAug-006pz5-1E;
	Tue, 03 Nov 2026 09:34:42 +0000
Date: Tue, 3 Nov 2026 01:34:36 -0800
From: Breno Leitao <leitao@debian.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, kernel-team@meta.com
Subject: Re: [PATCH] x86/sev: Fix kmemleak false positive for the RMP segment
 descriptors
Message-ID: <aumqYDB-9R4njxEj@gmail.com>
References: <20261102-sev-rmp-kmemleak-v1-1-e6fb2eb96e79@debian.org>
 <036145d8-46b2-4389-afd7-26c897d09ce7@intel.com>
 <aukO-_uELcL15JnH@gmail.com>
 <b004e572-8d52-447a-b5b2-10bed36896b2@intel.com>
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
In-Reply-To: <b004e572-8d52-447a-b5b2-10bed36896b2@intel.com>
X-Debian-User: leitao

On Mon, Nov 02, 2026 at 02:54:06PM -0800, Dave Hansen wrote:
> >> Why don't we just kmalloc() the thing?
> >
> > That would do the work as well, if this is an option.
> 
> I don't see a reason it needs to be allocated directly by the page
> allocator. My friendly LLM agrees with me. kmalloc(PAGE_SIZE) aligns to
> page boundaries and has for years.
> 
> BTW, there's almost no reason to use the page allocator directly these days.

Ack. Let me respin and use kmalloc, and use kmalloc(), simplifying the
fix.

Thanks for the review and suggestion,
--breno
