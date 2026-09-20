Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3504B3DDB1C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899051; cv=none; b=Cj11ddk9FbjFKAYYneZPxdlNu6brJKmvyp4amf/dW2T2qMQ1mpjFyT3lY2/VMtysamWznkj5W7aTVmlpJFB5eDQDlVwl9zoJTApfmCBcnGSsEAJiACG2kbxO4TIT5W5Tt3gFXkTDy0GyhTGRIdFtTJsSslZFv50Dcqhm13qudgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899051; c=relaxed/simple;
	bh=Fzvn3AGTo0bt13XhtEnlxFPPMZHPNKVNMIUPXGsik9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kY1qAO0b5aW+tKej8TqYdl8bkgWj5YQsrX2kpaqMoEW2Z1VIrOuwWj3PPZVP0bZPwY18HpMmkznRai7aCw0AHBNQpjzeiX7Z2K8hn+i0OOfxqq5UxXC2q7ey8rszMiX+9kZv00f1+9bOO98aToCOU/r8jAm+DZV+LD0769rMQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aikto2hf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aikto2hf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E951F000FF;
	Sun, 20 Sep 2026 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789899049;
	bh=Fzvn3AGTo0bt13XhtEnlxFPPMZHPNKVNMIUPXGsik9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aikto2hfH1waAMlQOxzkT9/KPy5C9HF1S5b8srkkvdMnZ76kUGogjE/1J7IHkoRXw
	 OD88eDCWJXDtzgSMcAltTPRK7shQyM5WQ1MGXs0AmgX5e/x1r0j/s0KmEImzctqNvB
	 3JbSwnljTVI+bPuz5bwNeZcRtaVrR8cY/w9AeqqOED5Y7lOsiMhJfo3iuisvAgK19s
	 0FJQlPgSP3U0oT1ISXlDfiwmyIfOLtlSdpgQxpFpHJiqfqsGmDi78ggeBLZe8Zcnn3
	 91ETWMYyycO3n1LhUV3wQbMUy9df3o3TfgDjrB0LpubkAmeVqXSwBXSJyySA+YJDZ6
	 kavsyn765LxSQ==
Date: Sun, 20 Sep 2026 11:10:45 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Hui Peng <benquike@gmail.com>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] seccomp: restore knotif->state when
 SECCOMP_ADDFD_FLAG_SEND is interrupted
Message-ID: <aq-w4L8KNnLNFYNZ@gremlin>
References: <20260919203514.2580997-1-benquike@gmail.com>
 <202609192050.D1E0CD96@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609192050.D1E0CD96@keescook>

On Sat, Sep 19, 2026 at 08:50:57PM -0700, Kees Cook wrote:
> On Sat, Sep 19, 2026 at 08:35:14PM +0000, Hui Peng wrote:
> > In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set,
> > knotif->state is transitioned from SECCOMP_NOTIFY_SENT to
> > SECCOMP_NOTIFY_REPLIED before dropping filter->notify_lock and waiting
> > in wait_for_completion_interruptible(&kaddfd.completion).
> >
> > If wait_for_completion_interruptible() is interrupted by a signal before
> > the target task processes the kaddfd entry, seccomp_notify_addfd()
> > removes kaddfd.list from knotif->addfd via list_del(&kaddfd.list), but
> > leaves knotif->state set to SECCOMP_NOTIFY_REPLIED.
>
> Are you able to construct a regression test for this so we can catch
> this race if it ever gets exposed again?

I'd disregard this guy and treat this as, at best, an AI-generated bug report.

He sent 115 patches across 40 subsystems in 2 hours.

https://lore.kernel.org/all/?q=f%3Ahui+peng

Unfortunately I feel we are only at the beginning of this kind of thing :(

>
> --
> Kees Cook
>

--
Cheers, Lorenzo
