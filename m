Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3265495AF7;
	Wed, 16 Sep 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582998; cv=none; b=T3O7lfHBoam7NChBAzxkNSfJu7pUq0KS67KCeYmQIom4JCtdQgao+nU+RPSUy7QKGnMRwy6HU6bXD4oyc2LqqyFOYdz65+22Ulp8EX4EYV/Z4pCURztHR+FxZdn9hZYXTgM/UBC1E4w9/+gPgoHAxdC2OrEI1u3ovKKGhbcmnxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582998; c=relaxed/simple;
	bh=FNkpM+IFqm45tPTfGmv+VjGiIBgqYVT6HLpgqOFu8C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ngh0iEi/TbFMMQO3UqxoZqPjxPJbl4qtN9WdtDMMCxsMoRh0zgEvYJi9qIh+NtkBu4YOk9ih6SxE/7xJy38T2yJOI4urq4ynoH5hZlhWRd4sn9hOp9oboUkYMbptjDAvVExxnXP77kHXfAQhcs4Q1zaqOLde1pS7vLhUd0EKflM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X8Aqj2XG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X8Aqj2XG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F095D1F000FF;
	Wed, 16 Sep 2026 18:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789582979;
	bh=cAVTLdxBrt63WiDKr6DkBTHhV9Ux9SnIWWaujboOtuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8Aqj2XGywI0E/pmZUz2fmOzGNGSHBSaV11af+VX2iZ0tqx11lGE1YN4SBVUOyjfV
	 cqv03kZZ8WHbVMy8loH/oC3kgPtK6aznxeG3bISS3Y9xXzcVHWSfi0M/ctpQSqM6Rh
	 T9zte9m1i9vTW3N0xcXYoR1v7+1oqbeeWfdBuNr4=
Date: Wed, 16 Sep 2026 19:21:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, bleung@chromium.org,
	akuchynski@chromium.org
Subject: Re: [PATCH] usb: typec: ucsi: displayport: Current CAM OOB index
 fixup
Message-ID: <2026091633-sinless-freezing-0184@gregkh>
References: <20260911193208.410015-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911193208.410015-1-jthies@google.com>

On Fri, Sep 11, 2026 at 07:32:08PM +0000, Jameson Thies wrote:
> Update ucsi_displayport_enter() to return invalid error when the PPM
> reports an current alternate mode greater than or equal to
> UCSI_MAX_ALTMODES. While here, remove 0xff current cam assignment on
> failed GET_CURRENT_CAM response.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Original patch didn't incorporate reviewer feedback. This is a fixup
> to be amended to:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=04cec690b1fd9d1c4c314b91a10d8c68a3acfe18

This needs a "Fixes:" tag and cc: stable, right?

Please resend a new version with that, and collect the reviews so far.

thanks,

greg k-h
