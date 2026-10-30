Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358025;
	b=Dw9Mx7IiZuxoAm3/Gstk19OCLO2jWp1milmmqH8ty/K29p6evERYeZ1V+yhT4GZa33PX
	 pfdgawdz0YyBAmqJuacboI1mSAn0TM8nd+KywXD4WE5hn2Jt8QR35uJabFcKeBbhWOwkg
	 8xBDcopw3D6aZLODn0dAxlsmpNGxdrUFnICH+gwJkgu9klR8jaP4Oeo/BjCEz4smkNXqe
	 gCQNmN0Jnz5tNfP52mPXe6dyX/Gl1QWF2deTEMpeoFhNwSzPxHcLQvIOLm9q1bpYRQIzJ
	 vDVJ0d4sgqQcn8uJ3b6iHbpgGsVb12KDI44br7If0GQ67/OlFSExiprej6roSLENAqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358025;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=g266MaSMKR9h8FPQQg32Wj4FERhwRV6REtqYsfN4808=;
	b=103Q4697YaMLchLaY7NftRRqPIFlr5q3GZLAP6+YKun5Dls/Sp/OIjRMvcNGtnfEwqxA
	 pF5yLHuQjKsrj5x7O9DpuxSSWrf7Mp0ML7gTN8QpL/nDQ2MxOqU/y+xpJrKT0kcqVS7kz
	 TEKSjsRP3jrJbixYSHWefJ2NVm+k9HNRD2HMDAvdy6uGMgewCEP9KV9IxYz/Z+Jvse3Ck
	 c8q0UQfb2AZucTTzP+L7Tx5VdL/9YXGd/sImNSsAYbq/Dmi12biOHqWCpujG7nl0grS7L
	 FrGEJ4HCFjigGhkvhIa3RWVUhcgcg0cq5edvs214RD69Rx23J/4AT7/DOaBXHd2vwkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=G3KgmfF7;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED14606B960
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED14606B960
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=G3KgmfF7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g266MaSMKR9h8FPQQg32Wj4FERhwRV6REtqYsfN4808=; b=G3KgmfF78AMe3urI9FHhpN0eWi
	Z9r1dV7byhio3mq23LGFDk0Sdk4/X+0bwNfhUo+VU9LLCt2gL4zpC5YmSpqFrxN3ISLV8l/OUdJTc
	vUIT+mHPkbPasZjA1nSY4CRLdvbtDLueTKV46ojc39AM120hP0sEG+PgGIJpiQ2civ+pzor1ynQxn
	T5lf+o1AEFClyPlMaceDTyJhkOMcSV/aJjk59E58mMscijgFxbzhudJaSQfmtSMxAfZlYPdQRmmK0
	7WHWdf4o5azy3NzoLxTtOqco+wb10NVhL9f/bQjPM/DkysNCgw3MDw+YOmUV9EtKlr354t0zV83fI
	35CurgWw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMkKu-003lsQ-0s;
	Fri, 30 Oct 2026 10:59:52 +0000
Date: Fri, 30 Oct 2026 03:59:47 -0700
From: Breno Leitao <leitao@debian.org>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Alexander Graf <graf@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 00/56] Dynamic mitigations
Message-ID: <auR3vX2W-eHZaPYn@gmail.com>
References: <20251013143444.3999-1-david.kaplan@amd.com>
 <bjgjmijirueqwwmuen5dr6v7yqdcivk6kwa6gbukn3rodfcwko@fb5yxyqycena>
 <LV3PR12MB9265D0A464C2F597219A7B1294EBA@LV3PR12MB9265.namprd12.prod.outlook.com>
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
In-Reply-To: <LV3PR12MB9265D0A464C2F597219A7B1294EBA@LV3PR12MB9265.namprd12.prod.outlook.com>
X-Debian-User: leitao

On Tue, Oct 14, 2025 at 06:06:48PM +0000, Kaplan, David wrote:
> The cloud guys on this thread may be able to offer some additional color here since I believe that's where you're most likely to have this situation.

Here is my view on what happens on the Meta fleet.

Each workload selects a set of attack vectors and decides on its own
security threat model.

To meet the security requirements of that workload, the machine needs to
be rebooted, so a workload switch usually means a reboot or kexec, which
is not ideal.

This solution would remove that extra kexec on a workload switch.

--breno
