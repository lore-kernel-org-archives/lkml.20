Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0D233943
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481591; cv=none; b=ieddIdpIPYvD6TaeSdJRchxTju5eW3F4oj2UMfUxGdK0m56s7sDsHWmq6dt2xn9esv1wDfpUuDHlAL34mqNRFMKo8YROsS1Kb4NmUeiVlXIS12LbSk6YQ4KqEkaUJT0pI+DilnKCEmSc1zwdCqnwrPOae6Jzt/r5v6BOc679uao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481591; c=relaxed/simple;
	bh=zolwdMtE8Ng8tgWYMardfbiAnm5uS5Ep16ndVXyc30E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krU6D+AWAY/dliUIVzxqr5FC8VNgp8jHp10efDXE97f1tikVS8PeeHLj1o4cl8wMOvN4B56l9vdZX6MLkX8iTrIepic+5fzzBBaItQoVQjS6bTOMterEF8maW76Rh38hPrdT1n/ZqDfWrc0RLR/cOgjGtaqIR43F+ix7wfluejg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=Eiz30UvA; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="Eiz30UvA"
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id DABD880687;
	Fri,  4 Sep 2026 00:26:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id C40FF35;
	Fri,  4 Sep 2026 00:26:25 +0000 (UTC)
Date: Thu, 3 Sep 2026 20:26:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>, David Laight
 <david.laight.linux@gmail.com>, linux-kernel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260903202624.3a74cf5a@robin>
In-Reply-To: <a6220041-7b92-4156-a095-b4a36eae2025@kernel.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
	<20260901092043.7feaf5d7@pumpkin>
	<dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
	<20260901222909.05d6239f@pumpkin>
	<1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
	<CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
	<20260901192523.0e989b10@robin>
	<a6220041-7b92-4156-a095-b4a36eae2025@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ax3qoe6jkic7g7qbjiqumr5kg6uy6euz
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: C40FF35
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18eqLYoUgdCKgL46nSMfo7a/5TEJcJzfFo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=zolwdMtE8Ng8tgWYMardfbiAnm5uS5Ep16ndVXyc30E=; b=Eiz30UvAU8BLWs8wtVQYXn7gf+oAQo5z2t7Fv94bW0cMKXE5MdlgpTo+GTgrHm2LSKsq+LPMbEKwBMNUVQ2zc0eASBG33MDKWGl+wJl1Xe3F3QQ0ceQsUTV/kNeZ/o9RNUcHbddkSLyNlSCHLbazcCNNVKPOQMXNYqavKZdVoyQ=
X-HE-Tag: 1788481585-825639
X-HE-Meta: U2FsdGVkX18JnqV3HQOppEuowmYk99ngTo06I04vDMYtBeaT5NoG16B0u2RUDxEiH4KCe+IgnsFrvBt34PyLWAR3w/E5Vz2jehkmgMqmu8MVvpqve2sECywRCDfyWdQ0TO8a7wmy0crZUx1wKMAd6Ui09doXJHlsHPSLHEQFZS891QIV/ClqpBulG/rY+aRAh/ACQ9nSIbF1Tm8J/AILU8fMCyl0qJAvfnqvwBm06YhNB1vwkq36DkrYTzfVMbwBcjrj6/e9HLTZx2vTQm8d5K3xU9QlRmGnpYnnGsoTI8R2tYghn1FNfbSx0+vNbuzjSrJywerS9mmlyctuclBOu2hMNTLLa4xe

On Thu, 3 Sep 2026 23:50:19 +0200
Vincent Mailhol <mailhol@kernel.org> wrote:

> I removed gcc's -Wtype-limits in commit 660e899103e2 ("kbuild: remove
> gcc's -Wtype-limits"). d2802d0739dcc can probably be reverted.

Commit d2802d0739dcc is 13 years old. I think we can keep it as is. I
hate to revert it and then something else complains about it (clang?),
and we have to add it back again.

-- Steve
