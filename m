Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AC849B208
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516562; cv=none; b=l7GAaSc15TYGa6E2l6c4znCX945Q0ewYahU8vg7xhgKiTKZM4Kpi76OYy6jJhQevorKyakqviXZCtfkp+I0L8pLuH5Z8yyFHQ8Rv1cAoaLFE+SY8WVmVOhq2NO8c9jSgQyJghQbIG3joYoGyBsi9QmIRZ6tRVlRXZT+uN4DbGcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516562; c=relaxed/simple;
	bh=ivf0HWWrnF13dQ8TYRU8Mxx7L5yThSRGnDstERpAK+M=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZMHIlN+okiwD7S4njOjghXp8KYyF5mnaxS5rSQCk/Q0XSHdfmYXU/gRHBPm/4G7wtCKC+2iIGEvIf/1CTySWnOpCI5droyrRq3ec2MdyJaewXELcRA4wQKbWmkJTnqHw9wQI0ejNB+/h88iWEwe0DhGmmOKbV9M5Ut6XhP/eHLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=FYTeW+Js; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="FYTeW+Js"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=KcruWwdX0V35F0OFmxXzRLw0Nkd32o9ayTCXiOg/3lc=; b=FYTeW+Jse40BtVnGitDFqVV/fa
	oZNgbPIaWm2VLM7aof8GkquqiOdh+416aGGYzTWdgN7qlYyPdsGzR2/YZOVHZI4ICCGuDixvaU4Nm
	RnbXya4BrDsCDFRnChHv8nWFooZe8qxElaYBYLr9hK1eHu43YfCMV0hQZhO3tDaZuYd99/W3j0XRE
	jkWFBVq8G3gqKDXw4ScVxAhHKQVPRA4nl/Q8+LEz7B0CeujEWyVR9wRPMc1+UCm4G0tJNXbElw02z
	hjgOkRqBE063kOy7EejC80UWwyKCKI47LMCzuYnQjTu3D17U1FcvlbLwhntLa0tmZKOvx59zLl/Qe
	iUFxAqLg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6d02-002gs2-4j; Wed, 16 Sep 2026 01:55:41 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x6d01-0085PP-5B; Wed, 16 Sep 2026 01:55:41 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x6d01-000000029jK-0qGh;
	Wed, 16 Sep 2026 01:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 20:55:40 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 5/5] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
In-Reply-To: <20260915052646.GIaqjXFkXBkWfvt3tP@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
 <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
 <bdd7ad774e121d5621ad64f9c7147e45@igalia.com>
 <20260915052646.GIaqjXFkXBkWfvt3tP@fat_crate.local>
Message-ID: <78399f2346182d7de96343c9ede3da6c@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-15 02:26, Borislav Petkov wrote:
> On Mon, Sep 14, 2026 at 08:40:38AM -0300, Mauricio Faria de Oliveira wrote:
>> Due to scope and review purposes (4/5 is more generic, 5/5 is specific
>> to PVH). If there's a strong preference to combine these, please just
>> let me know.
> 
> But they sound like they're fixing the same thing:
> 
> "vmlinux no longer boots with CONFIG_PVH if CONFIG_KASAN_GENERIC is set."
> 
> and this one's commit message:
> 
> "This particular one (still) generated the inline implementation as expected
> (at least in these compiler versions)"
> 
> sounds like it is referring to the previous patch. Or I don't know what you
> mean with "these compiler versions"?
> 
> Bottom line: if someone needs to apply both to fix unbootable PVH VMs due to
> mis-inlining of the compiler, then someone can simply apply one and be done
> with it.
> 
> Thx.

Sure, I'll combine these.

Thanks,

-- 
Mauricio
