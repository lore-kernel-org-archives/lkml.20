Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1415B3630B2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580850; cv=none; b=UbZlEkOHzSL9GX9LatNv1pytXSNTPoNIhePBcsr7+cQxvCRIQrHncwb0SaaJFGeZJBJHD7yxy8s2kbe49dMJt//3lazmv7MaeOoslpQO/+DUzCd+dyQSI3pTajbwksPZa0qW6dNIwm2uCvDASPCgBkhz0I2ndIVphj8CnK1M4Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580850; c=relaxed/simple;
	bh=G/PY36hb3mMFej1b0Th4YsjbgNjq9OtQrJFaa5sQyUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJkvGwIux21EiAEyoVpVYDZ/e9rYxm3TmPyeEnY0ozhpKImQAl6h+BMdoceb19e8sHUFYoLZW6cFH83lOKewvjQPyhTdww1ju23qfL2lnXlnd58UlxPd6hMWejQY4sCVR06rWZKQDKkqNhawpuUH8/M6NvO53i3WM4Rup4Ejlgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLQ2TffJ; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLQ2TffJ"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso1049240a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580833; x=1790185633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fRuhsyZpo67PM/nz3BCI8bcnib/ogSlc/1jN1DlRcc=;
        b=XLQ2TffJXbd9KSLRh9hSZVNATFTKaadjzW0fmN51Abn0RMUn7f1TwJV12WAqnj/Mq5
         5LPvt1YfLNeZt0hzJo9jfyg/UyGMKO4noCXSkKzupgfV/VLdhzr/A3EXGR0SrDpXWHyg
         bmhwLSfsXd92cT2gaOLonP1Z+61XwCcfxcjhOkbesF4ocaQoWIGIiRgBhW9NoSCudjTD
         WidUfChyT4TQTa8LJYFK69SoNuo/CM94bAjMO9C+gvCNfbKrfoWyLeV/dvFH7YZHjOJz
         8ArR1VRxxpO8LDzZzUVshVwuq8fq/9BVtHSK5pf/eOaAoKONnj+0fS1TMEPGwrnHOa/X
         Sl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580833; x=1790185633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fRuhsyZpo67PM/nz3BCI8bcnib/ogSlc/1jN1DlRcc=;
        b=Lgo7+wIocQkmVnGd0JDi8AbE+FQ/LHZrI4xoCvFhGl08Fp6oe3L1nKqEKJwBiso5sx
         dyeSTsU1ZyCZeaVVufHASdjStwGdWmplBj5oLJ5DBx/GkMseo58EQnc4lBzuDLTIIreS
         X2zpgDApuptbyMf8fJdxwJip8TBkA6oc5xI2hkg3tBSFc0I78E622DbAhV5atAuc+lbx
         RhGMj2ifsTzQKFpktp5inRNEFyiOEZB0F4JE6q/FqtrjxoGvVgxy9NWMJQPEaKxTqblR
         fcbHBrp/2/wa51o1yMrMJavHQw9DRNWYLjlNuN3yPa3dl8ZMEtRnRVv4EYV0zK5xE1fv
         QVBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYz9bM6QxpurNreDQs/26TRwyExxR4y6d49kHIi+sh6aZUnavRIoWZ9DHv6iycBjSzLjB2nj9aIks27D4=@vger.kernel.org
X-Gm-Message-State: AFuF++ms85J+xuc/9LhfqR4dKhyCsWnTL3gDClb+x3mPYJaKrzWdUpPn
	R1sefmhhQKj6Ep8GGq7AIzAcHaxy37ALjLXJ4pDyHXo+tS8gm/PkcRJdR0DITQ==
X-Gm-Gg: AYBFou201JBZHhIkN40InVMAjznrkcGPOEheiGf3JqbEFH2vPsdcyHRLMk4VguZnNEU
	9x+AdEZSYsG0Oq5tGyofbjcBy3HSaFvZ8MQbUfJfljflAPMtyNx+CyjPmhUb9zSD6g9A/91S1cf
	e6Gu1F/kFt984Yj6wz1KpRnxgVTcgT/lnYRio1w/bkoP6MxsaqyXuI5s6Zaa3TrIikZxg4WU5Qs
	ElsfMy9d9kesbtQUwY+FnG8lsgECPPk08FZXJSZGoP/T/O4yf0+YMSrfNNpX8ShVUxPjWFervSF
	w+T3QONP5qA1hEPG8v8yxOnaEfCGiH9x4JmrN5DEcI5jKYmdCLPIpwrb+oe+QjAzpF+9kR8sjoa
	TPE9YeO7GGunJhyd9kkghQuJNbydsMQssawyjRko9CEDZUKix9k6hW1owG5nWDVADtClDVXV77Z
	vHBw+UtgSWe0LxRFrg12S4HSYg4das+pgbfmh11jBAfMLn7YOtFDebw5DgpxoDRJQu6kuqiB1z8
	VE531wzVVEIoOrVJgMLnkX1sxd9Q8ki43zsOg==
X-Received: by 2002:a17:90b:5624:b0:39e:b7:cbef with SMTP id 98e67ed59e1d1-39e1e5612d3mr10626719a91.25.1789580833109;
        Wed, 16 Sep 2026 10:47:13 -0700 (PDT)
Received: from eggarch ([2409:40c4:18:7581:88e6:16cb:6cd3:1ba1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c7e2200sm1772020a91.4.2026.09.16.10.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:47:12 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:17:05 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <aqrK5PwpJodCmbdM@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
 <apg16LtZ-ru9MIBQ@eggarch>
 <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>
 <apq4FFSD2QKG-jUu@eggarch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apq4FFSD2QKG-jUu@eggarch>

On Fri, Sep 04, 2026 at 06:43:43PM +0530, Lovekesh Solanki wrote:
> On Thu, Sep 03, 2026 at 10:42:48AM +0300, Mathias Nyman wrote:
> > On 9/2/26 21:21, Lovekesh Solanki wrote:
> > > On Wed, Sep 02, 2026 at 03:10:41PM +0300, Mathias Nyman wrote:
> > > > It's possible PCI side or pm core already provides some easy way for xhci driver to check this.
> > > > This specific issue is currently not on my todo list, yet.
> > > Alright, would you like to me to work on this? I could look into
> > > that side and possibly come up with an approach.
> > 
> > Yes, please, that would be great.
> I took a look at the PCI / PM side, and it seems to me there isn't any
> reliable approach for xhci driver to use right now.
> 
> The pci_check_pme_status() both checks and clears the pme status bit 
> and the pci core devours it inside pci_pme_wakeup(), and 
> pm_request_resume is async so xhci's runtime_resume may run much later
> after the bit is already gone. We can't simply export pci_check_pme_status()
> that wouldn't give any useful info.
> 
> One solution I can think of would be adding a pme_wake_detected bitfield
> on pci_dev struct, we set it in pci_pme_wakeup() when PME is confirmed
> and we clear it in pci_pm_runtime_resume() after the driver has
> returned.
> Then, we could directly read via pdev->pme_wake_detected in its own
> resume.
> 
> What are your thoughts on this?

Hey Mathias,

Just wondering if you have looked into the proposal above.
I suggested adding a new field to pci_dev struct for knowing whether a
resume came from PCI PME side.

Would it be better to send it as an RFC too?

Thanks,
Lovekesh
