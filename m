Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FEB455194;
	Tue,  6 Oct 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304320; cv=none; b=stQyy6vcWwjpaHAGbqh5mv2ZCLZwDoSD2FcvFY6aiTcfvTwYKD1bXuLUJI+PkuVpCO1DGsroybR1B118gpASRERk52SV967/80ldNbEMyjxNXRok7ETlnx0wEgbMS5Htt5MAd2d68LGSIY0XNVxFoi2iVzrJttzmAj9918NAukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304320; c=relaxed/simple;
	bh=N8q9/f3c0mTcbNDp1IbBY8Dlo4+CnJsx95R3Mu6kD5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO5CXUtLVJUnwOSAq2JPFIDC14U0C49ug68AiHcu1SVFr9QIGQ8CyGbEWhAmfsuDdxRi7k1/5DOJS3Hlx0O572k3NNHMp3wBrcJpztMeUq4hNMGFQUP27jEHJQAh3abJKhMn5g+NYHZUBsys3Iy2oSWHDO6QHzPZRARJHQ1DykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HnJfDcyI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HnJfDcyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E731F0089B;
	Tue,  6 Oct 2026 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791304319;
	bh=GODFXfGbLJie88amhF5JaPRNzvesDOYc0AkH8pBpCnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnJfDcyI1QT9qc7oBsdUTNfG9kVQZjx4ueB7z6ZdjdeyTG623JjMggDgWquhBgfok
	 z+xziduJZ6oKbOyQsUVUByR8OMFNSj0ROP7bmNBxT06OmGUQVvdkaqbd8pR+yryDrV
	 hB3/Am8zPZjRHH7W8LZXMadtC0pdzJ5yY8UCP97Y=
Date: Tue, 6 Oct 2026 18:31:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Desai <contact.pranavdesai@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace uint with unsigned int
Message-ID: <2026100619-putt-splinter-674d@gregkh>
References: <20261006102846.170825-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006102846.170825-1-contact.pranavdesai@gmail.com>

On Tue, Oct 06, 2026 at 03:58:46PM +0530, Pranav Desai wrote:
> The Linux kernel coding style prefers the use of standard
> types like 'unsigned int' instead of the non-standard 'uint'.
> 
> Replace all occurrences of 'uint' with 'unsigned int' throughout
> the rtl8723bs driver to adhere to the coding style.

Shouldn't you pick the "real" variable instead?  Look at what these are
used for and only then if it really should be "unsigned int" can you
replace them, otherwise make it explicit like u8, u16, etc.

thanks,

greg k-h
