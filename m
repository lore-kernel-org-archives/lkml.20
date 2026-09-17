Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458583D6CD4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633038; cv=none; b=Hj9nWhJYXfRVOpQ6GkqUMuExQphlT7voXkKm7n92eDQxalCZ1nOMJDzTPuvcErcTdTgpCygpW5cXNMUch39pkQhTErZp3/jEAtfQw2x9iKi2IixjUZvHsPi0PlMY1toukymIE4kYOHE0yc8Jb2uWW0G+fkWGCxsnP9J+KuLzjVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633038; c=relaxed/simple;
	bh=gVFCRUQfxV+UTHjCponJNYwSOhUoSdyF88OvAAFe450=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bn8cNWwivOdwmjikUAyJnbsWWYlBpIwXl+LETuVDhN34kVK24yjCeLeYCOVV0TZazcuG67LIiT9vbqfj4UBMNBFEfkZ07ajG6Syx6zTOaJVLslejA0dfv+LFNcAjFJIsbVNKQPqDAuttMA+uh+ud7gpXkJd1GrlMCQlTeV1OlUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O7mPaOBB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+K82aFtK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O7mPaOBB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+K82aFtK"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789633021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVFCRUQfxV+UTHjCponJNYwSOhUoSdyF88OvAAFe450=;
	b=O7mPaOBBAj+8mFQKI6MNFGDhGPT0/nhkc/U9AFIJop07ivsCDh9F5JuXjNIBtRGEUzXtTU
	phMsmr5Dz7ttCOMjHVSr47zu8AnazMEeVjSznEpcoAGS4NNFssgLa0w/4uiJWhniS//Sys
	+HBECAoWo9iPXFI8ttJuuWrDKuZysdtX1tYEr7bcggo5GbQQuStOiBLzMc++Z8DkMp62/f
	ryMhnfv94mQ9vUDRc49ElrOSVdkkmOx1Yb/4id8GnO8uoq7Aq1H598FUfgwgWADNFqZoBs
	5pzzB1e5VY99EPoyAfx2qp+QSeSVBrMlzZfikqhmZxXdHWtKHMH6BOLbHf+GYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789633021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVFCRUQfxV+UTHjCponJNYwSOhUoSdyF88OvAAFe450=;
	b=+K82aFtKPifAO4AZFdLjS49qfUVggZAxcyE79dq98JCHeQ57u7zTrTKKwpYNnFDSMGnCup
	ivTNz21QfyozUQBQ==
To: Omer PALA <palaomer100@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
In-Reply-To: <20260917071931.8063-1-palaomer100@gmail.com>
References: <20260917071931.8063-1-palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 10:17:00 +0200
Message-ID: <87mrtgthqb.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Omer PALA <palaomer100@gmail.com> writes:
> Replace msleep(1) with usleep_range(1000, 1500) because msleep with small
> values (<20ms) can sleep for up to 20ms due to timer tick resolution.
> Using usleep_range provides a more precise and consistent delay for
> hardware power control operations.

Why is precise delay important for power control?

Precise delay comes with a cost, so we don't do that unless necessary.

Nam
