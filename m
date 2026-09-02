Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FE46AA75;
	Wed,  2 Sep 2026 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345775; cv=none; b=mtxxJdqcvCI+/iCcT25HA4jlI4SjuR9LnUtDBPLfSA+4r+89/iJ8TvhzSzbAiwbeZ9MQLT/zMI3K/wC/0C05D/EqJOGq1yfnajqFwORUvUEQraeVbU+qCUzronqtgtRdfrWMGd60f7eA3oq7+E4draN41fYuXEh3ZGr4XQ1ZWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345775; c=relaxed/simple;
	bh=ODx7kAsJzRUdLKu8KmNInmoKPQDGTCMd7D153RYjRSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eo+SnoZCfYH81kcjrupkVLSvY2rMemgGDFONroyZDQLX2l9rYbMgR8nXrlihPmFs+xxaLKWsJlxpntf/0VSU1E+BG4/CwY19D5DQqQfDyfqsuhlB3FadlLuII1fq8D5JR/1NGHI5QcQmotg4fxKpFfXnLrsi94W2+hNlbIksnsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wzlJKZBQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pY4IvwNu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wzlJKZBQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pY4IvwNu"
Date: Wed, 2 Sep 2026 12:42:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788345770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2L8x7l/q3Rby/AvAjFGBCAJ8xQN41X27Hn7vMBz/IRI=;
	b=wzlJKZBQ9mn5Ry1JqB9xS0Lbhh3NHTlg4KiObOKxNyDQTjIM+roJE9YCnGki2ViPnsX7Zk
	1ZWbepp7WkdE2xNOrqVko54F78aUWSjvbJFuz8+TaB//DwOiI3/7LIH5vOwplNIevnRhnM
	t6h7lCpGSYR+ZJ6uBrDMVDOQkElVrZlSLhmb1iigzr58upNgPMkUvDCORuTkX8KENotBTy
	wNeBe5u/SaRogFuc9HN46AtM+l8UGkjo5yGmCl9oCOdVcqPs12leMhZtiQ9EksubXWw/Bv
	oAqjwHuyznA8u9FUudyfIa0MzInfcnboXuykDT2UPYZUpxXLiwWTBWU+290IvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788345770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2L8x7l/q3Rby/AvAjFGBCAJ8xQN41X27Hn7vMBz/IRI=;
	b=pY4IvwNuJ0YPX5noLkpsUFf6D+9vHCA7NtqWDGbrA2QCEjyfwyQDJvYkpubYLuLXHAkKuN
	EBY1KminFfvGDpAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v3 1/2] doc: Change dynticks-testing repository name
Message-ID: <20260902104248.RIsRSnCL@linutronix.de>
References: <20260902092434.85096-1-marco.crivellari@suse.com>
 <20260902092434.85096-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902092434.85096-2-marco.crivellari@suse.com>

On 2026-09-02 11:24:24 [+0200], Marco Crivellari wrote:
> Currently the documentation still mention dynticks-testing.
> 
> Recently the repository name and the tool have been renamed
> to cpunoise (see Link tag below), so fix the occurrence and
> the URL.
> 
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Link: https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
