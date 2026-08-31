Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812D02F9D98;
	Mon, 31 Aug 2026 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181326; cv=none; b=D4+xTfAOzGTaxmcRgfJfut/cdXg6jU6Q2J8d+16MY8oTixgCLqYRFvXF6kmcKX+Kza0NIcZqkIFmTqIyS+1OI7wWv/2hJ1brD9dxfZr2AUf/UrbuXL2uwMnXqjyvXSu5X/T6/qJPiXin3JE75x3HExXNM2A/dgOtiGOQRL9ZgF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181326; c=relaxed/simple;
	bh=oyPcS09y2VRy2att5zN8ZgksAJ2ceHqffSGYYyUukbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFmWyeLJRd2lAgy2vVQ6GmwAyJ8YkTmuEKfaCdJBgI+cL9H1kn8HVgEN59cFt/5gwqpKqeP3XSCL5p9v6jPJ76rcSI73tGxfVVsDBGMoGrPyDbpmHHJRlfYuOtA9lonU7EjSY0hEQ2bD0Ov35k4agfl5w7qTPo9mhO2Esyv+UeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6LuR5oi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6LuR5oi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69FE1F00A3D;
	Mon, 31 Aug 2026 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788181325;
	bh=3dnPizRRvsAQfZPqAFMwtgRgAwpSS6Otb/qYtZvqXYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e6LuR5oihFjNcM5KEn1U5aEy0BsuDjJhg0mXI/+rRQ/SD50/JgMB+Kpzwuy9NtJh1
	 Fapive5LcnOzBfSgCGtb+ugmn7dDdsclDXiVuRug+ZnL7pGNWKog1k0t6ep8gJdiuE
	 o1+S7rI2+4J9YFRv+TpJhCremB4j2RTUKixVEEdVRGN2hcVEZFseZqzYM8q+jGqHW6
	 ezDn4Vyfm5gzjUknmsXehD0p39H0yU8mDSqLKdOu6qxY83jG1OAopiVxsXyLVjfjdC
	 Viyb7pacT4SVh7z1vezg+1rQnGUwLpe6GqZxENt/HUULvnbPB4M+xhb46ezNJ9n3Jh
	 fuKnOG5iAAytw==
Date: Mon, 31 Aug 2026 15:02:02 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 0/2] doc: Rename dynticks-testing to cpunoise
Message-ID: <apV7SvlfxxNpLJaG@localhost.localdomain>
References: <20260831092118.124576-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831092118.124576-1-marco.crivellari@suse.com>

Le Mon, Aug 31, 2026 at 11:21:11AM +0200, Marco Crivellari a écrit :
> Hi,
> 
> Currently the documentation still mention dynticks-testing.
> 
> Recently the repository name and the tool have been renamed to cpunoise,
> both the patches reflect this change.
> 
> The tool announcement can be found at:
> 
>   https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
> 
> Thanks,
> 
> ---
> Changes in v2:
> - Link to the tool Announcement added in both the patches and cover letter
> 
> - Corrected another occurrence reported by Sebastian
> 
> Link to v1: https://lore.kernel.org/all/20260831081823.67972-1-marco.crivellari@suse.com/
> 
> Marco Crivellari (2):
>   doc: Change dynticks-testing repository name
>   Documentation/no_hz: Change dynticks-testing repository name
> 
>  Documentation/admin-guide/cpu-isolation.rst | 4 ++--
>  Documentation/timers/no_hz.rst              | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
